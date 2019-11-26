<?php

namespace App\Http\Controllers;

use App\Cart_model;
use App\Orders_model;
use App\OrderDetails_model;
use App\Users;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class OrderDetailsController extends Controller
{
    public function index()
    {
        $menu_active=3;
        $i=0;
        $orders = OrderDetails_model::all();
        return view('backEnd.order_details.index',compact('menu_active','orders','i'));
    }
}
