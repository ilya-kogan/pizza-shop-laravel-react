<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Order;
use Auth;

class OrdersController extends Controller
{
    public function index()
    {
        return Order::all();
    }

    public function show(Order $order)
    {
        return $order;
    }

    public function show_by_user_id()
    {
        try {
            if (Auth::check()) {
                $userId = Auth::id();
                $orders = Order::where('user_id', $userId)->get();

                return response()->json($orders, 201); 
            }
        } catch(\Exceprion $exception) {
            return response([
                'message' => $exception->getMessage()
            ], 400);
        }
    }
 
    public function store(Request $request)
    {
        $validated = $request->validate([
            'cartItems' => 'required',
            'firstName' => 'required',
            'lastName' => 'required',
            'email' => 'required|email',
            'phone' => 'required',
            'address' => 'required',
            'currency' => 'required',
            'totalPrice' => 'required'
        ]);

        $order_data = [
            'user_id' => $request->input('userID') ? $request->input('userID') : 0,
            'products' => $request->input('cartItems'),
            'user_data' => $request->input('firstName') . ' ' . $request->input('lastName'),
            'email' => $request->input('email'),
            'phone' => $request->input('phone'),
            'address' => $request->input('address'),
            'order_comments' => $request->input('orderComments') ? $request->input('orderComments') : '',
            'currency' =>  $request->input('currency'),
            'price' =>  $request->input('totalPrice')
        ];

        $order = Order::create($order_data);
 
        return response([
            'formSend' => 'success',
            'order' => $order
        ]);
    }
 
    public function update(Request $request, Order $order)
    {
        $order->update($request->all());
 
        return response()->json($order, 200);
    }
 
    public function delete(Order $order)
    {
        $order->delete();
 
        return response()->json(null, 204);
    }
}
