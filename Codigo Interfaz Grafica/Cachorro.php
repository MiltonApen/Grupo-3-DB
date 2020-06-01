<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Cachorro extends Model
{

        /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'cachorro';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id_cachorro';

    /**
     * Indicates if the model should be timestamped.
     *
     * @var bool
     */
    public $timestamps = false;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'no_microchip', 'no_tatuaje', 'nombre', 'fecha_nacimiento', 'raza','sexo'
    ];

    /**
     * roles
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function cursos()
    {
        return $this->hasMany(CachorroVenta::class, 'id_cachorro');
    }
}
