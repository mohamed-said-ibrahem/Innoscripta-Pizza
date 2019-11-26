<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCartTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if(!Schema::hasTable('cart')){
        Schema::create('cart', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('products_id');
            $table->string('product_name');
            $table->string('product_code');
            $table->string('size');
            $table->float('price');
            $table->integer('quantity');
            $table->string('session_id');
            $table->timestamps();
        });
        // Schema::table('cart', function($table) {
        //     $table->foreign('products_id')->references('id')->on('products')->onDelete('cascade');
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
        Schema::dropIfExists('cart');
    }
}
