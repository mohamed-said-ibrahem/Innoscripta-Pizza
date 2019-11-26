<?php

namespace App\Http\Controllers;

use App\Cart_model;
use App\ProductAtrr_model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class CartController extends Controller
{

    /**
     * .
     * 
     * @Author Mohamed Said.
     * 
     * @return \Illuminate\Http\Response
     */
    public function indexApi()
    {
        $cart = Cart_model::all();
        if($cart->isEmpty()){
            return response()->json("Not Found", 404); 
        }
        return response()->json(['cart' => $cart], 200); 
    }

    public function deleteItemApi($id){
        $delete_item=Cart_model::findOrFail($id);
        if($delete_item->delete())
                return response()->json("Success!", 200); 
        return response()->json("Error!!", 500);
    }

    public function index(){
        $session_id=Session::get('session_id');
        $cart_datas=Cart_model::where('session_id',$session_id)->get();
        $total_price=0;
        foreach ($cart_datas as $cart_data){
            $total_price+=$cart_data->price*$cart_data->quantity;
        }
        return view('frontEnd.cart',compact('cart_datas','total_price'));
    }

    public function addToCart(Request $request){
        $inputToCart=$request->all();
        if($inputToCart['size']==""){
            return back()->with('message','Please select Size');
        }else{
            $stockAvailable=DB::table('product_att')->select('stock','code')->where(['products_id'=>$inputToCart['products_id'],
                'price'=>$inputToCart['price']])->first();

            if($stockAvailable->stock>=$inputToCart['quantity']){
                $session_id=Session::get('session_id');
                if(empty($session_id)){
                    $session_id=str_random(40);
                    Session::put('session_id',$session_id);
                }
                $inputToCart['session_id']=$session_id;
                $sizeAtrr=explode("-",$inputToCart['size']);
                $inputToCart['size']=$sizeAtrr[1];
                $inputToCart['product_code']=$stockAvailable->code;
                $count_duplicateItems=Cart_model::where(['products_id'=>$inputToCart['products_id'],
                    'session_id'=>$session_id,
                    'size'=>$inputToCart['size']])->count();
                if($count_duplicateItems>0){
                    return back()->with('message','This Item Added already');
                }else{
                    Cart_model::create($inputToCart);
                    return back()->with('message','Add To Cart Already');
                }
            }else{
                return back()->with('message','Stock is not Available!');
            }
        }
    }
    public function deleteItem($id=null){
        $delete_item=Cart_model::findOrFail($id);
        $delete_item->delete();
        return back()->with('message','Deleted Success!');
    }
    public function updateQuantity($id,$quantity){
        $code_size=DB::table('cart')->select('product_code','size','quantity')->where('id',$id)->first();
        $stockAvailable=DB::table('product_att')->select('stock')->where(['code'=>$code_size->product_code,
            'size'=>$code_size->size])->first();
        $updated_quantity=$code_size->quantity+$quantity;
        if($stockAvailable->stock>=$updated_quantity){
            DB::table('cart')->where('id',$id)->increment('quantity',$quantity);
            return back()->with('message','Update Quantity already');
        }else{
            return back()->with('message','Stock is not Available!');
        }


    }
}