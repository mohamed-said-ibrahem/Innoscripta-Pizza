<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Orders_model extends Model
{
    protected $table='orders';
    protected $primaryKey='id';
    protected $fillable=['users_id',
        'users_email','name','address','city','state','pincode','country','mobile','shipping_charges','order_status','payment_method','grand_total'];
        
    public function users()
    {
        return $this->belongsTo(User::class);
    }

}
