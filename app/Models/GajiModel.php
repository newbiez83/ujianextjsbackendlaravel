<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GajiModel extends Model
{
    use HasFactory;

    protected $table = 'GAJI';
    protected $primaryKey = 'IDGAJI';
    protected $fillable = [
        'IDGAJI', 
        'IDPEGAWAI', 
        'GAJINYA', 
    ];

    public function pegawai(){
        return $this->hasMany(PegawaiModel::class, 'IDGAJI', 'IDGAJI');
    }
}