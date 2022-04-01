<?php

namespace App\Http\Controllers;

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
        $data = array();
        $data['username'] = $request->username;
        $data['name'] = $request->name;
        $data['email'] = $request->email;
        $data['phone'] = $request->phone;
        $data['address'] = $request->address;
        $data['postal_code'] = $request->postal_code;

        $countryName = DB::table('countries')->where('name', $request->country_id)->first();

        $data['country_id'] = $countryName->id;

        $image = $request->new_avatar;

        $success = '';

        $user = DB::table('users')->where('id', $id)->update($data);

        // if($image) {
        //     $position = strpos($image, ';');
        //     $sub = substr($image, 0, $position);
        //     $ext = explode('/', $sub)[1];

        //     $name = time().".".$ext;
        //     $upload_path = 'backend/users/avatars';
        //     $image_url = $upload_path.$name;
        //     $success = $image->save($image_url);
        // }

        $success = '';
        if($success != '') {
            $data['avatar'] = $image;
            $img = DB::table('users')->where('id', $id)->first();
            $image_path = $img->avatar;
            $done = unlink($image_path);
            $user = DB::table('users')->where('id', $id)->update($data);
        } else {
            $oldphoto = $request->avatar;
            $data['avatar'] = $oldphoto;
            $user = DB::table('users')->where('id', $id)->update($data);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $user = User::find($id);

        $user->delete();
    }

    public function changePassword (Request $request, $id) {

        $validatedData = $request->validate([
            'old_password' => 'required',
            'password' => 'required|string|min:8|max:25',
        ]);

        $user = User::find($id)->first();
        $old_password = $user->password;

        if (Hash::check($request->old_password, $old_password)) {
            $user->password = bcrypt($request->password);
            $user->save();

            // User::where('id', $id)->update(['password' => Hash::make($validatedData['password'])]);

        } else {
            return "Not working";
        }

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
            'username' => 'required|unique:users',
        ]);


        $user = User::find($id)->first();
        $user->username = $request->username;
        $user->save();
    }
}
