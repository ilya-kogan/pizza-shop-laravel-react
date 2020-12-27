<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Order;
use Auth;
use App\User;
use Illuminate\Support\Facades\Hash;

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
        $user = [];
        $validated_array = [
            'cartItems' => 'required',
            'firstName' => 'required',
            'lastName' => 'required',
            'email' => 'required|email',
            'phone' => 'required',
            'address' => 'required',
            'currency' => 'required',
            'totalPrice' => 'required'
        ];

        if ($request->createAccount) {
            $validated_array['email'] = 'required|email|unique:users';
            $validated_array['password'] = 'required';
            $validated_array['password_confirm'] = 'required|same:password';
        }
        $validated = $request->validate($validated_array);

        if ($request->createAccount) {
            $user = User::create([
                'first_name' => $request->input('firstName'),
                'last_name' => $request->input('lastName'),
                'email' => $request->input('email'),
                'password' => Hash::make($request->input('password'))
            ]);            
        }

        if (isset($user->id) && !empty($user->id)) {
            $userID = $user->id;
        } elseif($request->input('userID')) {
            $userID = $request->input('userID');
        }

        $order_data = [
            'user_id' => $userID ? $userID : 0,
            'products' => $request->input('cartItems'),
            'user_data' => $request->input('firstName') . ' ' . $request->input('lastName'),
            'email' => $request->input('email'),
            'phone' => $request->input('phone'),
            'address' => $request->input('address'),
            'order_comments' => $request->input('orderComments') ? $request->input('orderComments') : '',
            'currency' =>  $request->input('currency'),
            'price' =>  $request->input('totalPrice') + 5
        ];
        $order = Order::create($order_data);
 
        return response([
            'formSend' => 'success',
            'order' => $order,
            'user' => $user
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
