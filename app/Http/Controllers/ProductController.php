<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\Category;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $page = "product";
        $products = Product::all();
        // dd($products);
        return view("pages.products.index", compact("products", "page"));
    }

    public function getProductByCategory($id)
    {
        $page = "product";
        $products = Product::where("category_id", $id)->get();
        return view("pages.products.index", compact("products", "page"));
    }

    public function getProductSortBy($sortBy)
    {
        $page = "product";
        $products = Product::orderBy($sortBy, "desc")->get();
        return view("pages.products.index", compact("products", "page"));
    }

    public function getProductSearch(Request $request)
    {
        $search = $request->search;
        $page = "product";
        $products = Product::where("name", "LIKE", "%" . $search . "%")->get();
        return view("pages.products.index", compact("products", "page"));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view("pages.products.create");
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            "name" => "required",
            "detail" => "required",
        ]);

        Product::create($request->all());

        return redirect()
            ->route("products.index")
            ->with("success", "Product created successfully.");
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $page = "product";
        $products = Product::findOrFail($id);
        return view("pages.products.show", compact("products", "page"));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function edit(Product $product)
    {
        return view("pages.products.edit", compact("product"));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Product $product)
    {
        $request->validate([
            "name" => "required",
            "detail" => "required",
        ]);

        $product->update($request->all());

        return redirect()
            ->route("products.index")
            ->with("success", "Product updated successfully");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function destroy(Product $product)
    {
        $product->delete();
        return redirect()
            ->route("products.index")
            ->with("success", "Product deleted successfully");
    }
}
