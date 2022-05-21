<?php

namespace App\Http\Controllers;

use App\Models\Sell;
use Illuminate\Http\Request;
use DB;
use DateTime;

class SellController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        $sold = Sell::paginate(10);

        return response()->json($sold);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'userId' => 'required|numeric',
            'crypto' => 'required|string',
            'amount' => 'required|numeric',
            'cost' => 'required|numeric',
            'wallet' => 'required|numeric'
        ]);

        if(DB::table('stocks')->where('symbol', $request->crypto)->exists()) {

            $data = array();
            $data['user_id'] = $request->userId;
            $data['crypto_symbol'] = $request->crypto;
            $data['sold_for'] = $request->amount;
            $data['sold_amount'] = $request->cost;
            $data['used_wallet'] = $request->wallet;
            $data['sell_code'] = rand(1000, 9999);

            DB::table('stocks')->where('symbol', $request->crypto)->update([
                'volume' => DB::raw('volume +' .$data['sold_amount']),
            ]);

            Sell::create($data);

        } else {
            $date = new DateTime();

            DB::insert('INSERT INTO stocks (name, symbol, image, bought_price, volume, created_at) VALUES (?, ?, ?, ?, ?, ?)', [$request->cryptoName, $request->crypto, $request->image, $request->cost, $request->amount, $date]);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Sell  $sell
     * @return \Illuminate\Http\Response
     */
    public function show(Sell $sell)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Sell  $sell
     * @return \Illuminate\Http\Response
     */
    public function edit(Sell $sell)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Sell  $sell
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Sell $sell)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Sell  $sell
     * @return \Illuminate\Http\Response
     */
    public function destroy(Sell $sell)
    {
        //
    }

    public function UserPurchase ($id) {

        $sells = Sell::where('user_id', $id)->get();

        return response()->json($sells);
    }

    public function searchFilters(Request $request) {

        $from = $request->input('dateA');
        $to = $request->input('dateB');

        $rangeA = $request->input('soldA');
        $rangeB = $request->input('soldB');

        if((!empty($from) && !empty($to)) && (empty($rangeA) && empty($rangeB))) {
            $sells = Sell::whereBetween('created_at', array($from, $to))->orderBy('created_at', 'ASC')->paginate(10);
        } else if((!empty($rangeA) && !empty($rangeB)) && (empty($from) && empty($to))) {
            $sells = Sell::whereBetween('sold_amount', array($rangeA, $rangeB))->orderBy('sold_amount', 'ASC')->paginate(10);
        } else if(!empty($from) && !empty($to) && !empty($rangeA) && !empty($rangeB)) {
            $sells = Sell::whereBetween('sold_amount', array($rangeA, $rangeB))->whereBetween('created_at', array($from, $to))->orderBy('id')->paginate(10);
        }

        return response()->json($sells);
    }
}
