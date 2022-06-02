<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Product;

class ProductsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Model::unguard();
        Schema::disableForeignKeyConstraints();

        DB::table("products")->truncate();
        Product::factory()
            ->count(50)
            ->create();

        Schema::enableForeignKeyConstraints();
        Model::reguard();
    }
}
