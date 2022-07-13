<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Role;
use DB;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        $users = User::all();

        return response()->json($users);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create() {
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
            'username' => 'required|string|max:255|unique:users',
            'name' => 'nullable|string|max:255',
            'password' => 'required|string|min:8|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'phone' => 'nullable|numeric|digits_between:5,15',
            'address' => 'nullable|string|max:255',
            'postal_code' => 'nullable|numeric|digits_between:3,200',
            'country_id' => 'nullable|string|max:255',
            'wallet' => 'nullable',
        ]);

        $countryId = null;

        if($request->country_id) {
            $countryName = DB::table('countries')->where('country_name', $request->country_id)->first();
            $countryId = $countryName->id;
        }

        $user = User::create([
            'username' => $request->username,
            'name' => $request->name,
            'password' => $request->password,
            'email' => $request->email,
            'phone' => $request->phone,
            'address' => $request->address,
            'postal_code' => $request->postal_code,
            'country_id' => $countryId,
            'wallet' => $request->wallet,
        ]);

        $user->save();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function show($id) {
        $user = DB::table('users')->where('id', $id)->first();

        return response()->json($user);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id) {

        $validatedData = $request->validate([
            'username' => 'required|string|max:255|unique:users,username,'.$id,
            'name' => 'nullable|string|max:255',
            'email' => 'required|string|email|max:255|unique:users,email,'.$id,
            'phone' => 'nullable|numeric|digits_between:5,15',
            'address' => 'nullable|string|max:255',
            'postal_code' => 'nullable|numeric|digits_between:3,200',
            'country_id' => 'nullable|string|max:255',
            'wallet' => 'nullable',
        ]);

        $data = array();
        $data['username'] = $request->username;
        $data['name'] = $request->name;
        $data['email'] = $request->email;
        $data['phone'] = $request->phone;
        $data['address'] = $request->address;
        $data['postal_code'] = $request->postal_code;
        $data['wallet'] = $request->wallet;

        if($request->country_id) {
            $countryName = DB::table('countries')->where('country_name', $request->country_id)->first();
            $data['country_id'] = $countryName->id;
        }

        User::where('id', $id)->update($data);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {
        $user = User::find($id);

        $user->delete();
    }

    public function changeWallet (Request $request, $id) {

        $validatedData = $request->validate([
            'wallet' => 'required',
        ]);

        $user = User::find($id);

        $user->update(['wallet' => $request->wallet]);

        $user->save();
    }

    public function loadWallet ($id) {
        $user = User::findOrFail($id);

        if($user->wallet) {
            return response()->json($user->wallet);
        } else {
            return response()->json('');
        }
    }

    public function loadUsername ($id) {

        $user = User::findOrFail($id);

        if($user->username) {
            return response()->json($user->username);
        } else {
            return response()->json('');
        }
    }

    public function changeUsername (Request $request, $id) {

        $validatedData = $request->validate([
            'username' => 'required|unique:users|alpha_dash',
        ]);

        $user = User::find($id);
        $user->username = $request->username;
        $user->save();
    }

    public function changePassword (Request $request, $id) {

        $validatedData = $request->validate([
            'old_password' => 'required',
            'password' => 'required|string|min:8|max:25|confirmed',
            'password_confirmation' => 'required|string|min:8|max:255',
        ]);

        $user = User::find($id)->first();
        $old_password = $user->password;

        if (Hash::check($request->old_password, $old_password)) {
            $user->password = bcrypt($request->password);
            $user->save();

            // User::where('id', $id)->update(['password' => Hash::make($validatedData['password'])]);

        } else {
            return response()->json(['message' => 'Incorrect password!'], 401);
        }

    }

    public function forgotPassword (Request $request) {

        $validateData = $request->validate([
            'email' => 'required|string|email|max:255',
            'username' => 'required|string|max:255',
            'password' => 'required|string|min:8|max:255|confirmed',
            'password_confirmation' => 'required|string|min:8|max:255',
        ]);

        $user = User::where('email', $request->email)->firstOrFail();

        if($request->email == $user->email && $request->username == $user->username && $request->password == $request->password_confirmation) {
            $user->password = bcrypt($request->password);
            $user->save();
        } else {
            return response()->json(['message' => 'Incorrect email or username'], 401);
        }
    }

    public function getRole($id) {
        $user = User::find($id)->roles;

        return response()->json($user);
    }

    public function attach(User $user, $role) {
        $attached_role = Role::where('name', $role)->first();
        $user->roles()->attach($attached_role);
    }

    public function detach(User $user, $role) {
        $detach_role = Role::where('name', $role)->first();
        $user->roles()->detach($detach_role);
    }

    public function usersList(User $users) {
        $users = User::orderBy('id', 'desc')->paginate(10);

        foreach($users as $user) {
            $roles = User::find($user->id)->roles;

            if($roles->isNotEmpty()) {
                $user->role = $roles[0]->name;
            } else {
                $user->role = "User";
            }

            if($user->country_id) {
                $country_name = DB::table('countries')->where('id', $user->country_id)->first();
                $user->country_id = $country_name->country_name;
            } else {
                $user->country_id = "Empty field";
            }

            if(!$user->name) {
                $user->name = "Empty field";
            }

            if(!$user->phone) {
                $user->phone = "Empty field";
            }

            if(!$user->wallet) {
                $user->wallet = "Empty field";
            }

            if(!$user->address) {
                $user->address = "Empty field";
            }

        }
        return response()->json($users);
    }

}
