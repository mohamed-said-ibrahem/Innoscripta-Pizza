<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDeliveryAddressTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if(!Schema::hasTable('delivery_address')){
        Schema::create('delivery_address', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('users_id');
            $table->string('users_email');
            $table->string('name');
            $table->string('address');
            $table->string('city');
            $table->string('state');
            $table->string('country');
            $table->string('pincode');
            $table->string('mobile');
            $table->timestamps();
        });
        // Schema::table('delivery_address', function($table) {
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
        Schema::dropIfExists('delivery_address');
    }
}
