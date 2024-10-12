<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Api\BaseController as BaseController;
use App\Models\PegawaiModel;
use App\Http\Resources\PegawaiResource;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;

class PegawaiController extends BaseController
{
    public function index(): JsonResponse
    {        

        $pegawai = PegawaiModel::leftJoin('DEPARTEMEN', 'PEGAWAI.IDPEGAWAI', 'DEPARTEMEN.IDPEGAWAI')
            ->leftJoin('POSISI', 'POSISI.IDPEGAWAI', 'PEGAWAI.IDPEGAWAI')
            ->leftJoin('GAJI', 'GAJI.IDPEGAWAI', 'PEGAWAI.IDPEGAWAI')
            ->select('PEGAWAI.*', 'NAMA', 'ALAMAT', 'NAMADEPARTEMEN', 'NAMAPOSISI', 'GAJINYA')
            ->get();        
  
        if (is_null($pegawai)) { 
            return $this->sendError('pegawai not found.');
        } 
   
        return $this->sendResponse(new PegawaiResource($pegawai), 'pegawai retrieved successfully.');
    }

    public function show($slug): JsonResponse
    {
        
    }

    public function store(Request $request): JsonResponse
    {

        date_default_timezone_set('Asia/Jakarta');

        $tanggal = date("Y-m-d"); 
        
                $input = new PegawaiModel;
                $input->NAMA = $request->NAMA;
                $input->ALAMAT = $request->ALAMAT;
                $input->JENISKELAMIN = $request->JENISKELAMIN;
                $input->TGLLAHIR = $request->TGLLAHIR;
                $input->NOTELPON = $request->NOTELPON;
                $input->FOTO = $request->FOTO;
                $input->save();
   
        $success['lampiran'] =  $input;
   
        return $this->sendResponse($success, 'Tambah Data Pegawai Berhasil.');
    }

    public function update(Request $request, string $id): JsonResponse
    {          
            
            $pegawai = PegawaiModel::find($id);
            $pegawai->NAMA = $request->NAMA;
            $pegawai->ALAMAT = $request->ALAMAT;
            $pegawai->JENISKELAMIN = $request->JENISKELAMIN;
            $pegawai->TGLLAHIR = $request->TGLLAHIR;
            $pegawai->NOTELPON = $request->NOTELPON;
            $pegawai->FOTO = $request->FOTO;
            $pegawai->update();

   
            return $this->sendResponse(new PegawaiResource($pegawai), ' Pegawai Berhasil Diubah.');      
        
    }

    public function destroy($id) {
        $pegawai = PegawaiModel::findOrFail($id);
        $pegawai->delete();

        return $this->sendResponse($pegawai, 'Hapus Data Berhasil.');
    }
}
