<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/orders', "OrdersController@indexApi");
Route::get('/pizzas', "ProductsController@indexApi");
Route::get('/cart', "CartController@indexApi");
Route::get('/users', "UsersController@indexApi");
Route::get('/categories', "CategoryController@indexApi");
Route::get('/cart/delete/{id}', "CartController@deleteItemApi");




