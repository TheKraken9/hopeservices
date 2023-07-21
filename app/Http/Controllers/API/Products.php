<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Models\Product;

class Products extends Controller
{
    public function index()
    {
        return response()->json([
            'status' => 'success',
            'message' => 'Products retrieved successfully',
            'data' => Product::all()
        ]);
    }

    public function store(Request $request)
    {
        $product = new Product([
            'name' => $request->name,
            'price' => $request->price
        ]);
        $product->save();

        return response()->json([
            'status' => 'success',
            'message' => 'Product created successfully',
            'data' => $product
        ]);
    }

    public function show($id)
    {
        $product = Product::find($id);

        if (is_null($product)) {
            return response()->json([
                'status' => 'error',
                'message' => 'Product not found',
                'data' => null
            ]);
        }

        return response()->json([
            'status' => 'success',
            'message' => 'Product retrieved successfully',
            'data' => $product
        ]);
    }

    public function update(Request $request, $id)
    {
        $product = Product::find($id);

        if (is_null($product)) {
            return response()->json([
                'status' => 'error',
                'message' => 'Product not found',
                'data' => null
            ]);
        }

        $product->update($request->all());

        return response()->json([
            'status' => 'success',
            'message' => 'Product updated successfully',
            'data' => $product
        ]);
    }

    public function destroy($id)
    {
        $product = Product::find($id);

        if (is_null($product)) {
            return response()->json([
                'status' => 'error',
                'message' => 'Product not found',
                'data' => null
            ]);
        }

        $product->delete();

        return response()->json([
            'status' => 'success',
            'message' => 'Product deleted successfully',
            'data' => null
        ]);
    }
}
