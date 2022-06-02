<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::enableForeignKeyConstraints();
        Schema::create("products", function (Blueprint $table) {
            $table->id();
            $table->string("name");
            $table->decimal("price", 10);
            $table->timestamps();
            $table->foreignId("category_id")->constrained();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table("products", function (Blueprint $table) {
            $table->dropForeign("products_category_id_foreign");
            $table->drop();
        });
        Schema::drop("products");
    }
}
