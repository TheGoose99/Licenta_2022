<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Purchase;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use DB;

class PurchaseController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $purchases = Purchase::all();

        return response()->json($purchases);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
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
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Purchase  $purchase
     * @return \Illuminate\Http\Response
     */
    public function edit(Purchase $purchase)
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
    public function destroy(Purchase $purchase)
    {

    }

    public function UserPurchase ($id) {

        $purchases = Purchase::where('user_id', $id)->get();

        return response()->json($purchases);
    }
}
