<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PosisiModel extends Model
{
    use HasFactory;

    protected $table = 'POSISI';
    protected $primaryKey = 'IDPOSISI';
    protected $fillable = [
        'IDPOSISI', 
        'IDPEGAWAI', 
        'NAMAPOSISI', 
    ];

    public function pegawai(){
        return $this->hasMany(PegawaiModel::class, 'IDPOSISI', 'IDPOSISI');
    }
}