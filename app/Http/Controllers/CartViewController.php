<?php

namespace App\Http\Controllers;

use App\Cart_model;
use App\ProductAtrr_model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class CartViewController extends Controller
{
    public function index(){
        $menu_active=3;
        $i=0;
        $cart = Cart_model::all();
        return view('backEnd.cart.index',compact('menu_active','cart','i'));
    }

}