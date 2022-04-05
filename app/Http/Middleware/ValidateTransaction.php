<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ValidateTransaction
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        $user = Auth::user();

        if((!is_null($user->name) || !is_null($user->phone) || !is_null($user->address) || !is_null($user->postal_code) || !is_null($user->country_id)) && !is_null($user->wallet)) {
            return $next($request);
        } else {
            return response()->json(['message' => 'Credentials incomplete! Cannot proceed with the transactions.'], 401);
        }
    }
}
