<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Api\PegawaiController;



/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Route::post('/login', [AuthController::class, 'login']);


// Route::resource('listpegawai', PegawaiController::class);

Route::get('/listpegawai', [PegawaiController::class, 'index']);
Route::post('/tambahdatapegawai', [PegawaiController::class, 'store']);
Route::delete('/hapuspegawai/{id}', [PegawaiController::class, 'destroy']);
