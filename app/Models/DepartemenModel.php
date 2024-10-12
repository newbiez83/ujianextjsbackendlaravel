<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DepartemenModel extends Model
{
    use HasFactory;

    protected $table = 'DEPARTEMEN';
    protected $primaryKey = 'IDDEPARTEMEN';
    protected $fillable = [
        'IDDEPARTEMEN', 
        'IDPEGAWAI', 
        'NAMADEPARTEMEN', 
    ];

    public function pegawai(){
        return $this->hasMany(PegawaiModel::class, 'IDDEPARTEMEN', 'IDDEPARTEMEN');
    }
}