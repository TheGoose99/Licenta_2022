<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use DateTime;

class StockController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $stocks = DB::select('SELECT * FROM stocks');

        return response()->json($stocks);
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
            'name' => 'required|string',
            'symbol' => 'required|string',
            'image' => 'required|string',
            'for' => 'required|numeric',
            'amount' => 'required|numeric',
        ]);

        if(!$request->date) {
            $date = new DateTime();
        } else {
            $date = $request->date;
        }

        if(DB::table('stocks')->where('name', $request->name)) {

            $data = array();
            $data['bought_price'] = $request->for;
            $data['volume'] = $request->amount;
            $data['created_at'] = $date;

            DB::table('stocks')->where('name', $request->name)->update([
                'bought_price' => $data['bought_price'],
                'volume' => DB::raw('volume +' .$data['volume']),
                'created_at' => $data['created_at'],
            ]);

        } else {
            DB::insert('INSERT INTO stocks (name, symbol, image, bought_price, volume, created_at) VALUES (?, ?, ?, ?, ?, ?)', [$request->name, $request->crypto, $request->image, $request->for, $request->amount, $date]);
        }

        return response('Bought successfully');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $stock = DB::table('stocks')->where('id', $id)->first();

        return response()->json($stock);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
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

}
