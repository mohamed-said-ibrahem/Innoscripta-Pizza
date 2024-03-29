<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if(!Schema::hasTable('products')){
        Schema::create('products', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('categories_id');
            $table->string('name');
            $table->string('code');
            $table->text('description');
            $table->float('price');
            $table->string('image');
            $table->timestamps();
        });
        Schema::table('products', function($table) {
            $table->foreign('categories_id')->references('id')->on('categories');
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
        Schema::dropIfExists('products');
    }
}
