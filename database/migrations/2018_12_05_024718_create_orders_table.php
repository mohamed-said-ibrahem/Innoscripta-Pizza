<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if(!Schema::hasTable('orders')){
        Schema::create('orders', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('users_id');
            $table->string('users_email',100);
            $table->string('name',100);
            $table->string('address');
            $table->string('city',100);
            $table->string('state',100);
            $table->string('pincode',100);
            $table->string('country',100);
            $table->string('mobile',100);
            $table->float('shipping_charges');
            $table->string('order_status',100);
            $table->string('payment_method',100);
            $table->string('grand_total',100);
            $table->timestamps();
        });
        // Schema::table('orders', function($table) {
        //     $table->foreign('users_id')->references('id')->on('users')->onDelete('cascade');
        // });
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('orders');
    }
}
