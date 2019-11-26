<?php

namespace App\Http\Controllers;

use App\Cart_model;
use App\Orders_model;
use App\Users;
use App\OrderDetails_model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class OrdersController extends Controller
{

    /**
     * Display All Orders.
     *
     * @Author Mohamed Said.
     * 
     * @return \Illuminate\Http\Response
     */
    public function indexApi()
    {
        $orders = Orders_model::with('users')->latest()->get();
        return response()->json($orders);
    }

    public function index(){
        $session_id=Session::get('session_id');
        $cart_datas=Cart_model::where('session_id',$session_id)->get();
        $total_price=0;
        foreach ($cart_datas as $cart_data){
            $total_price+=$cart_data->price*$cart_data->quantity;
        }
        $shipping_address=DB::table('delivery_address')->where('users_id',Auth::id())->first();
        return view('checkout.review_order',compact('shipping_address','cart_datas','total_price'));
    }
    public function order(Request $request){
        $input_data=$request->all();
        $payment_method=$input_data['payment_method'];
        Orders_model::create($input_data);
        $session_id=Session::get('session_id');
        $cart_datas=Cart_model::where('session_id',$session_id)->get();
        $user_order=Orders_model::where('users_id',Auth::id())->first();
        $user_order_id=Orders_model::where('users_id',Auth::id())->latest()->first();

        foreach ($cart_datas as $cart_data){
            // $inputToCart=$request->all();
            $order_id = $user_order_id->id;
            $user_name = $user_order->name;
            $user_email = $user_order->users_email;
            $item_id=$cart_data->products_id;
            $item_name=$cart_data->product_name;
            $item_code=$cart_data->product_code;
            $item_size=$cart_data->size;
            $item_price=$cart_data->price;
            $item_quantity=$cart_data->quantity;
            $inputToCart['user_id']=Auth::id();
            $inputToCart['order_id']=$order_id;
            $inputToCart['user_name']=$user_name;
            $inputToCart['user_email']=$user_email;
            $inputToCart['item_id']=$item_id;
            $inputToCart['item_name']=$item_name;
            $inputToCart['item_code']=$item_code;
            $inputToCart['item_size']=$item_size;
            $inputToCart['item_price']=$item_price;
            $inputToCart['item_quantity']=$item_quantity;
            OrderDetails_model::create($inputToCart);

        }
        if($payment_method=="COD"){
            return redirect('/cod');
        }else{
            return redirect('/paypal');
        }
    }
    public function cod(){
        $user_order=Orders_model::where('users_id',Auth::id())->first();
        return view('payment.cod',compact('user_order'));
    }
    public function paypal(Request $request){
        $who_buying=Orders_model::where('users_id',Auth::id())->first();
        return view('payment.paypal',compact('who_buying'));
    }
}
