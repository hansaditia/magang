<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Category;

class CategoriesTableSeeder extends Seeder
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

        DB::table("categories")->truncate();
        Category::factory()
            ->count(3)
            ->create();

        Schema::enableForeignKeyConstraints();
        Model::reguard();
    }
}
