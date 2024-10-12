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

        $pegawai = PegawaiModel::inRandomOrder()->get();
  
        if (is_null($pegawai)) {
            return $this->sendError('pegawai list not found.');
        }
    
        return $this->sendResponse(new PegawaiResource($pegawai), 'pegawai retrieved successfully.');
        // $dokter = DokterModel::leftJoin('poli', 'poli.id_poli', 'dokter.id_poli')
        //     ->leftJoin('jadwaldokter', 'jadwaldokter.iddokter', 'dokter.iddokter')
        //     ->select('dokter.*', 'nama_poli', 'hari', 'mulai', 'akhir')
        //     ->where('dokter.slug', $slug)
        //     ->first();

        
  
        // if (is_null($dokter)) { 
        //     return $this->sendError('dokter not found.');
        // } 
   
        // return $this->sendResponse(new DokterResource($dokter), 'dokter retrieved successfully.');
    }

    public function store(Request $request): JsonResponse
    {
        // $validator = Validator::make($request->all(), [
        //     'jeniscutiku' => 'required',
        // ]);
   
        // if($validator->fails()){
        //     return $this->sendError('Validation Error.', $validator->errors());       
        // }

        date_default_timezone_set('Asia/Jakarta');

        $tanggal = date("Y-m-d");

        // $validator = Validator::make($request->all(), [
        //     'lampiran' => 'required|mimes:png,jpg,jpeg|max:2048',
        // ]);

        // if($validator->fails()){
        //     return $this->sendError('Validation Error.', $validator->errors());       
        // }

        // $file = $request->file('lampiran');
        // $filename = uniqid().'_'.$file->getClientOriginalName();
        // $location = 'lampiranizin';
        // $file->move($location,$filename);   
        
                $input = new PegawaiModel;
                // $input->IDPEGAWAI = $request->IDPEGAWAI;
                $input->NAMA = $request->NAMA;
                $input->ALAMAT = $request->ALAMAT;
                $input->JENISKELAMIN = $request->JENISKELAMIN;
                $input->TGLLAHIR = $request->TGLLAHIR;
                $input->NOTELPON = $request->NOTELPON;
                $input->FOTO = $request->FOTO;
                $input->save();
   
        // $input = $request->all();
        // $input['lampiran'] = $filename;
        // $input['status'] = 'menunggu';
        
        // $user = PengajuanIzinModel::create($input);
        $success['lampiran'] =  $input;
   
        return $this->sendResponse($success, 'Tambah Data Pegawai Berhasil.');
    }

    public function destroy($id) {
        $pegawai = PegawaiModel::findOrFail($id);
        $pegawai->delete();

        return $this->sendResponse($pegawai, 'Hapus Data Berhasil.');
    }
}
