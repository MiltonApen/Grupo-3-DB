@extends('layouts.app')
@section('content')

<div class="container">
    <div>
        <h1>{{ $cachorro->nombre }}&nbsp;&nbsp;</h1>
        <a href="{{ route('cachorro.index') }}" style="font-style: 10px!important;">Regresar</a>
    </div>
    <div class="card">
        <div class="card-body">
            <h5 class="card-title">
                Asignar Venta
            </h5>

            <form action="{{ route('cachorro.venta-store', ['id' => $cachorro->id_cachorro]) }}" method="POST">
                @csrf
                @method('POST')
                <div class="form-row mt-2">
                    <div class="col">
                        <label for="nombre">Tipo Pago</label>
                        <input type="text" id="tipo_pago" name="tipo_pago" class="form-control" placeholder="Tipo Pago" value="{{ old('tipo_pago') }}" required>
                    </div>
                    <div class="col">
                        <label for="nombre">Precio Vendido</label>
                        <input type="numeric" id="precio_vendido" name="precio_vendido" class="form-control" placeholder="precio_vendido" value="{{ old('precio_vendido') }}" required>
                    </div>
                <div class="col">
                    <div class="clearfix">&nbsp;</div>

                <button class="btn btn-success mt-4">Vender</button>
            </form>

        </div>
    </div>
</div>
@endsection
