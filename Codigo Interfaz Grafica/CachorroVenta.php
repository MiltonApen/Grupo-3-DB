<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CachorroVenta extends Model
{
      /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'venta';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id_venta';

    /**
     * Indicates if the model should be timestamped.
     *
     * @var bool
     */
    public $timestamps = false;
}
