<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CustomAuthController;
use App\Http\Controllers\ProductController;
use App\Models\Category;
use App\Models\Product;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get("/", function () {
    // $key;
    $categories = Category::all();
    // dd($categories);
    $products = Product::all()->take(3);
    $tarikProduk = Product::all();
    // $pot = product::all()->take(3)->where('name', 'Pot');
    // $pupuk = product::all()->take(3)->where('name', 'Pupuk');
    // $other= product::all()->take(3)->where('name', 'Other');
    $page = "home";
    return view("pages.index", compact("categories", "products", "page","tarikProduk"));
})->name("/");

Route::get("/about", function () {
    return view("pages.about", ["page" => "about"]);
})->name("about");

Route::get("dashboard", [CustomAuthController::class, "dashboard"]);

Route::get("login", [CustomAuthController::class, "index"])->name("login");
Route::post("custom-login", [CustomAuthController::class, "customLogin"])->name(
    "login.custom"
);
Route::get("register", [CustomAuthController::class, "register"])->name(
    "register"
);
Route::post("custom-registration", [
    CustomAuthController::class,
    "customRegistration",
])->name("register.custom");
Route::get("signout", [CustomAuthController::class, "signOut"])->name(
    "signout"
);

Route::get("products_category/{category}", [
    ProductController::class,
    "getProductByCategory",
])->name("products_category");

Route::get("products_sort/{sortBy}", [
    ProductController::class,
    "getProductSortBy",
])->name("products_sort");

Route::get("products_search", [
    ProductController::class,
    "getProductSearch",
])->name("products_search");

Route::resource("products", ProductController::class);
