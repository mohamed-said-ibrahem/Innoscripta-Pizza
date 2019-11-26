<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OrderDetails_model extends Model
{
    protected $table='order_details';
    protected $primaryKey='id';
    protected $fillable=['user_id','order_id','user_name','user_email','item_id','item_name','item_code','item_size','item_price','item_quantity'];
}
