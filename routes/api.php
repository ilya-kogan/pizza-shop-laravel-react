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

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

/**
** Routes for a RESTful service:
**
** Route::get($uri, $callback);
** Route::post($uri, $callback);
** Route::put($uri, $callback);
** Route::delete($uri, $callback);
**
**/

// Products
Route::get('products', 'ProductsController@index');
Route::get('products/{product}', 'ProductsController@show');
Route::post('products', 'ProductsController@store');
Route::put('products/{product}', 'ProductsController@update');
Route::delete('products/{product}', 'ProductsController@delete');

// Orders
Route::get('orders', 'OrdersController@show_by_user_id')->middleware('auth:api');
Route::post('orders', 'OrdersController@store');

// Auth
Route::post('login', 'AuthController@login');
Route::post('register', 'AuthController@register');

Route::get('user', 'AuthController@user')->middleware('auth:api');