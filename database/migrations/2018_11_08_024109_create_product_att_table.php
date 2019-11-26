<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductAttTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if(!Schema::hasTable('product_att')){
        Schema::create('product_att', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('products_id');
            $table->string('code');
            $table->string('size');
            $table->float('price');
            $table->integer('stock');
            $table->timestamps();
        });
        // Schema::table('product_att', function($table) {
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
        Schema::dropIfExists('product_att');
    }
}
