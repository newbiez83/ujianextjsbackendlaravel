<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PegawaiModel extends Model
{
    use HasFactory;

    protected $table = 'PEGAWAI';
    protected $primaryKey = 'IDPEGAWAI';
    protected $fillable = [
        'IDPEGAWAI', 
        'NAMA', 
        'ALAMAT',
        'JENISKELAMIN',
        'TGLLAHIR',
        'NOTELPON',
        'FOTO',
    ];


    public function departemen()
    {
        return $this->belongsTo('App\Models\DepartemenModel', 'IDDEPARTEMEN', 'IDDEPARTEMEN');
    }
    public function posisi()
    {
        return $this->belongsTo('App\Models\PosisiModel', 'IDPOSISI', 'IDPOSISI');
    }

    public function gajinya()
    {
        return $this->belongsTo('App\Models\GajiModel', 'IDGAJI', 'IDGAJI');
    }
}