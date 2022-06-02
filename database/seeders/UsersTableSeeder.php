<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;

class UsersTableSeeder extends Seeder
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

        DB::table("users")->truncate();
        User::factory()
            ->count(50)
            ->create();

        Schema::enableForeignKeyConstraints();
        Model::reguard();
    }
}
