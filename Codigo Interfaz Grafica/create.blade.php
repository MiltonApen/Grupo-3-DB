@extends('layouts.app')
@section('content')
<div class="container">
    <div>
        <h1>Cachorro&nbsp;&nbsp;</h1>
        <a href="{{ route('cachorro.index') }}" style="font-style: 10px!important;">Regresar</a>
    </div>
    <div class="card">
        <div class="card-body">
            <h5 class="card-title">Nuevo registro</h5>
            <div class="col">
                @if ($errors->any())
                    <div class="errors">
                        <p><strong>Por favor corrige los siguientes errores<strong></p>
                        <ul>
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif
            </div>
            <form action="{{ route('cachorro.store') }}" method="POST">
                @csrf
                @method('POST')
                <div class="form-row">
                    <div class="col">
                        <label for="microchip">No. Microchip</label>
                        <input type="number" id="microchip" name="microchip" class="form-control" placeholder="NO. Microchip" value="{{ old('microchip') }}" required>
                    </div>
                    <div class="col">
                        <label for="tatuaje">No. Tatuaje</label>
                        <input type="number" id="tatuaje" name="tatuaje" class="form-control" placeholder="No. Tatuaje" value="{{ old('tatuaje') }}" required>
                    </div>
                    <div class="col">
                        <label for="nombre">Nombre</label>
                        <input type="text" id="nombre" name="nombre" class="form-control" placeholder="Nombre" value="{{ old('nombre') }}" required>
                    </div>
                </div>
                    <div class="form-row mt-2">
                        <div class="col">
                            <label for="nombre">Fecha Nacimiento</label>
                            <input type="date" id="nacimiento" name="nacimiento" class="form-control" placeholder="Nacimiento" value="{{ old('nacimiento') }}" required>
                        </div>
                        <div class="col">
                            <label for="nombre">Raza</label>
                            <input type="text" id="raza" name="raza" class="form-control" placeholder="Raza" value="{{ old('raza') }}" required>
                        </div>
                    <div class="col">
                        <label for="sexo">Sexo</label>
                        <input type="text" id="sexo" name="sexo" class="form-control" placeholder="Ej. Macho" value="{{ old('sexo') }}" required>
                    </div>
                </div>
                    <div class="col">
                        <div class="clearfix">&nbsp;</div>
                        <button class="btn btn-success">Guardar</button>
                    </div>
                </div>
            </form>

        </div>
    </div>
</div>
@endsection
