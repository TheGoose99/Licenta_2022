<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Purchase;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use DB;
use DateTime;

class PurchaseController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        $purchases = Purchase::paginate(10);

        return response()->json($purchases);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request) {
        $validatedData = $request->validate([
            'userId' => 'required|numeric',
            'crypto' => 'required|string',
            'amount' => 'required|numeric',
            'cost' => 'required|numeric',
            'wallet' => 'required|numeric'
        ]);

        if(DB::table('stocks')->where('symbol', $request->crypto)->exists()) {

            $stock = DB::table('stocks')->where('symbol', $request->crypto)->first();

            if($stock->volume >= $request->amount) {
                $data = array();
                $data['user_id'] = $request->userId;
                $data['crypto_symbol'] = $request->crypto;
                $data['bought_for'] = $request->cost;
                $data['bought_amount'] = $request->amount;
                $data['used_wallet'] = $request->wallet;

                DB::table('stocks')->where('symbol', $request->crypto)->update([
                    'volume' => DB::raw('volume -' .$data['bought_amount']),
                ]);

                Purchase::create($data);

            } else {
                return response()->json([
                    'message' => 'Insufficient stocks.'
                ], 404);
            }

        } else {
            return response()->json([
                'message' => 'Cryptocurrency not found.'
            ], 404);
        }

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Purchase  $purchase
     * @return \Illuminate\Http\Response
     */
    public function show(Purchase $purchase)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Purchase  $purchase
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Purchase $purchase)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Purchase  $purchase
     * @return \Illuminate\Http\Response
     */
    public function destroy(Purchase $purchase) {

    }

    public function UserPurchase ($id) {

        $purchases = Purchase::where('user_id', $id)->get();

        return response()->json($purchases);
    }

    public function searchFilters(Request $request) {

        $from = $request->input('dateA');
        $to = $request->input('dateB');

        $rangeA = $request->input('boughtA');
        $rangeB = $request->input('boughtB');

        if((!empty($from) && !empty($to)) && (empty($rangeA) && empty($rangeB))) {
            $purchases = Purchase::whereBetween('created_at', array($from, $to))->orderBy('created_at', 'ASC')->paginate(10);
        } else if((!empty($rangeA) && !empty($rangeB)) && (empty($from) && empty($to))) {
            $purchases = Purchase::whereBetween('bought_amount', array($rangeA, $rangeB))->orderBy('bought_amount', 'ASC')->paginate(10);
        } else if(!empty($from) && !empty($to) && !empty($rangeA) && !empty($rangeB)) {
            $purchases = Purchase::whereBetween('bought_amount', array($rangeA, $rangeB))->whereBetween('created_at', array($from, $to))->orderBy('id')->paginate(10);
        }

        return response()->json($purchases);

    }
}
