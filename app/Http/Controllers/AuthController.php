<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use App\User;
use App\Http\Requests\RegisterRequest;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $validated = $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        try {
            if (Auth::attempt($request->only('email', 'password'))) {
                /** @var User $user */
                $user = Auth::user();
                $token = $user->createToken('app')->accessToken;

                return response([
                    'errors' => false,
                    'message' => 'success',
                    'token' => $token,
                    'user' => $user
                ]);
            }
        } catch(\Exceprion $exception) {
            return response([
                'errors' => true,
                'message' => $exception->getMessage()
            ], 400);
        }

        return response([
            'errors' => true,
            'message' => 'Invalid username/password'
        ], 401);
    }

    public function user()
    {
        return Auth::user();
    }

    public function register(RegisterRequest $request)
    {
        try {
            $user = User::create([
                'first_name' => $request->input('first_name'),
                'last_name' => $request->input('last_name'),
                'email' => $request->input('email'),
                'password' => Hash::make($request->input('password'))
            ]);
    
            return $user;
        } catch(\Exceprion $exception) {
            return response([
                'message' => $exception->getMessage()
            ], 400);
        }
    }
}
