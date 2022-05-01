<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use DateTime;
use Carbon\Carbon;

class StockController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        $stocks = DB::select('SELECT * FROM stocks');

        return response()->json($stocks);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request) {
        $validatedData = $request->validate([
            'name' => 'required|string',
            'symbol' => 'required|string',
            'image' => 'required|string',
            'cost' => 'required|numeric',
            'amount' => 'required|numeric',
        ]);

        if(!$request->date) {
            $date = new DateTime();
        } else {
            $date = $request->date;
        }

        if(DB::table('stocks')->where('name', $request->name)->exists()) {

            $data = array();
            $data['bought_price'] = $request->cost;
            $data['volume'] = $request->amount;
            $data['created_at'] = $date;

            DB::table('stocks')->where('name', $request->name)->update([
                'bought_price' => $data['bought_price'],
                'volume' => DB::raw('volume +' .$data['volume']),
                'created_at' => $data['created_at'],
            ]);

        } else {
            DB::insert('INSERT INTO stocks (name, symbol, image, bought_price, volume, created_at) VALUES (?, ?, ?, ?, ?, ?)', [$request->name, $request->symbol, $request->image, $request->cost, $request->amount, $date]);
        }

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id) {
        $stock = DB::table('stocks')->where('id', $id)->first();

        return response()->json($stock);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id) {
        $validatedData = $request->validate([
            'name' => 'required|string',
            'symbol' => 'required|string',
            'image' => 'required|string',
            'for' => 'required|numeric',
            'amount' => 'required|numeric',
            'date' => 'nullable|string',
        ]);

        if(!$request->date) {
            $date = new DateTime();
        } else {
            $date = $request->date;
        }

        $data = array();
        $data['name'] = $request->name;
        $data['symbol'] = $request->symbol;
        $data['image'] = $request->image;
        $data['bought_price'] = $request->for;
        $data['volume'] = $request->amount;
        $data['created_at'] = $request->date;

        DB::table('stocks')->where('id', $id)->update($data);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {
        $stock = DB::table('stocks')->where('id', $id)->delete();
    }

    public function stockout() {
        $stock = DB::table('stocks')->where('volume', '<', '1')->get();

        return response()->json($stock);
    }

    public function todaySells() {
        $today['sells'] = DB::table('purchases')->whereDate('created_at', Carbon::today())->sum('bought_amount');
        $today['income'] = DB::table('purchases')->whereDate('created_at', Carbon::today())->sum('bought_for');
        $today['expenses'] = DB::table('sells')->whereDate('created_at', Carbon::today())->sum('sold_for');
        $today['due'] = $today['income'] - $today['expenses'];

        $today['sells_yesterday'] = DB::table('purchases')->whereDate('created_at', Carbon::yesterday())->sum('bought_amount');
        $today['income_yesterday'] = DB::table('purchases')->whereDate('created_at', Carbon::yesterday())->sum('bought_for');
        $today['expenses_yesterday'] = DB::table('sells')->whereDate('created_at', Carbon::yesterday())->sum('sold_for');
        $today['due_yesterday'] = $today['income_yesterday'] - $today['expenses_yesterday'];

        if($today['income_yesterday']) {
            $today['income_yesterday'] = $today['income'] / ($today['income_yesterday']) * 100;
        }

        if($today['sells_yesterday']) {
            $today['sells_yesterday'] = $today['sells'] / ($today['sells_yesterday']) * 100;
        }

        if($today['expenses_yesterday']) {
            $today['expenses_yesterday'] = $today['expenses'] / ($today['expenses_yesterday']) * 100;
        }

        return response()->json($today);
    }

}
