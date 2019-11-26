<?php

namespace App\Http\Controllers;

use App\Cart_model;
use App\Orders_model;
use App\Users;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class OrdersViewController extends Controller
{
    public function index()
    {
        $menu_active=3;
        $i=0;
        $orders = Orders_model::with('users')->latest()->get();
        return view('backEnd.order.index',compact('menu_active','orders','i'));
    }
}
