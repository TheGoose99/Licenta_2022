<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;

class CountriesController extends Controller
{
    public function index() {
        $countries = DB::select('SELECT * FROM countries');

        return response()->json($countries);
    }

    public function searchCountry($id)
    {
        $countryName = DB::table('countries')->where('id', $id)->first();

        return response()->json($countryName->name);
    }

}
