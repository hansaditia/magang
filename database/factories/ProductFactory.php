<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class ProductFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            "name" => $this->faker->name(),
            "category_id" => $this->faker->numberBetween($min = 1, $max = 3),
            "price" => $this->faker->numberBetween($min = 10000, $max = 100000),
        ];
    }
}
