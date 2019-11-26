<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTblgalleryTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if(!Schema::hasTable('tblgallery')){
        Schema::create('tblgallery', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('products_id');
            $table->string('image');
            $table->timestamps();
        });
        // Schema::table('tblgallery', function($table) {
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
        Schema::dropIfExists('tblgallery');
    }
}
