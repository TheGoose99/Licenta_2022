<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use App\Models\User;
use DB;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function show($id) {
        $user = DB::table('users')->where('id',$id)->first();

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
            'name' => 'nullable|string|max:255',
            'email' => 'required|string|email|max:255|unique:users,email,'.$id,
            'phone' => 'nullable|numeric|digits_between:5,15',
            'address' => 'nullable|string|max:255',
            'postal_code' => 'nullable|numeric|digits_between:3,200',
            'country_id' => 'nullable|string|max:255',
            'image' => 'nullable',
            'newimage' => 'nullable',
        ]);

        $data = array();
        $data['name'] = $request->name;
        $data['email'] = $request->email;
        $data['phone'] = $request->phone;
        $data['address'] = $request->address;
        $data['postal_code'] = $request->postal_code;

        if($request->country_id) {
            $countryName = DB::table('countries')->where('country_name', $request->country_id)->first();
            $data['country_id'] = $countryName->id;
        }

        // $destination_path = 'public/images';
        // $image = $request->file('newimage');
        // $imagename = $image->getClientOriginalName();
        // $path = $request->file('newimage')->storeAs($destination_path, $imagename);

        // $data['image'] = $filename;

        User::where('id', $id)->update($data);

        // if($change_pic) {
        //     $data['image'] = $image;
        //     $img = User::where('id', $id)->first();
        //     $image_path = $img->avatar;
        //     $done = unlink($image_path);
        //     $user = User::where('id', $id)->update($data);
        // } else {
        //     $oldphoto = $request->image;
        //     $data['image'] = $oldphoto;
        // }
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

        $user = User::find($id)->first();

        $user->wallet = $request->wallet;
        $user->save();
    }

    public function loadWallet (Request $request, $id) {
        $user = User::find($id)->first();

        if($user->wallet) {
            return response()->json($user->wallet);
        } else {
            return response()->json('');
        }
    }

    public function loadUsername (Request $request, $id) {

        $user = User::find($id)->first();

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

        $user = User::find($id)->first();
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
}
