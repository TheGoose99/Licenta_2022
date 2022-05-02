<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// Role
Route::get('/user/getRole/{id}', [App\Http\Controllers\UserController::class, 'getRole']);

// Auth
Route::post('/register', [App\Http\Controllers\AuthController::class, 'register']);
Route::post('/login', [App\Http\Controllers\AuthController::class, 'login']);
Route::post('/user/forgotPassword', [App\Http\Controllers\UserController::class, 'forgotPassword']);
Route::post('/me', [App\Http\Controllers\AuthController::class, 'me'])->middleware('auth:sanctum');

Route::middleware(['auth:sanctum'])->group(function () {

    // User
    Route::put('/user/update/{id}', [App\Http\Controllers\UserController::class, 'update']);
    Route::get('/user/show/{id}', [App\Http\Controllers\UserController::class, 'show']);
    Route::put('/user/changeUsername/{id}', [App\Http\Controllers\UserController::class, 'changeUsername']);
    Route::put('/user/changePassword/{id}', [App\Http\Controllers\UserController::class, 'changePassword']);
    Route::put('/user/changeWallet/{id}', [App\Http\Controllers\UserController::class, 'changeWallet']);
    Route::get('/user/loadWallet/{id}', [App\Http\Controllers\UserController::class, 'loadWallet']);
    Route::get('/user/loadUsername/{id}', [App\Http\Controllers\UserController::class, 'loadUsername']);

    // Purchase
    Route::post('/purchases/store', [App\Http\Controllers\PurchaseController::class, 'store'])->middleware('validate');
    Route::get('/purchases/user/{id}', [App\Http\Controllers\PurchaseController::class, 'UserPurchase']);

    // Sell
    Route::post('/sells/store', [App\Http\Controllers\SellController::class, 'store'])->middleware('validate');
    Route::get('/sells/user/{id}', [App\Http\Controllers\SellController::class, 'UserPurchase']);

    // Countries
    Route::get('/countryName/{id}', [App\Http\Controllers\CountriesController::class, 'searchCountry']);
    Route::get('/countries', [App\Http\Controllers\CountriesController::class, 'index']);

    // Admin
    //->middleware('role:admin');
    Route::group(['prefix' => 'admin', 'middleware' => 'role:admin'], function() {

        Route::resource('/user', App\Http\Controllers\UserController::class);
        Route::resource('/purchases', App\Http\Controllers\PurchaseController::class);
        Route::resource('/sells', App\Http\Controllers\SellController::class);
        Route::resource('/roles', App\Http\Controllers\RoleController::class);

        Route::post('/user/{user}/attach/{role}', [App\Http\Controllers\UserController::class, 'attach']);
        Route::post('/user/{user}/detach/{role}', [App\Http\Controllers\UserController::class, 'detach']);
        Route::get('/usersList', [App\Http\Controllers\UserController::class, 'usersList']);

        // POS
        Route::resource('/stock', App\Http\Controllers\StockController::class);
        Route::get('/stocks/outOfStock', [App\Http\Controllers\StockController::class, 'stockout']);
        Route::get('/stocks/todaySells', [App\Http\Controllers\StockController::class, 'todaySells']);

        Route::post('/purchase/search', [App\Http\Controllers\PurchaseController::class, 'searchFilters']);
        Route::post('/sell/search', [App\Http\Controllers\SellController::class, 'searchFilters']);

    });

});

