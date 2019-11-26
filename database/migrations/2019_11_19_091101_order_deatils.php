<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class OrderDeatils extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if(!Schema::hasTable('order_details')){
            Schema::create('order_details', function (Blueprint $table) {
                $table->increments('id');
                $table->integer('order_id');
                $table->integer('user_id');
                $table->string('user_name');
                $table->string('user_email');
                $table->integer('item_id');
                $table->string('item_name');
                $table->string('item_code');
                $table->string('item_size');
                $table->float('item_price');
                $table->integer('item_quantity');
                $table->timestamps();
            });
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
