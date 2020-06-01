@extends('layouts.app')


@section('content')

<div class="container">
    <h1>Cachorro</h1>
    <div class="card">
        <div class="card-body">
            <h5 class="card-title">
                Listado
                <a href="{{ route('cachorro.create') }}" class="btn btn-success float-right">Nuevo</a>
            </h5>
            <table class="table table-striped mt-5">
                <thead class="thead-dark">
                  <tr>
                    <th scope="col">NO. Microchip</th>
                    <th scope="col">No. Tatuaje</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Fecha nacimiento</th>
                    <th scope="col">Raza</th>
                    <th scope="col">Sexo</th>
                    <th scope="col">Acciones</th>
                  </tr>
                </thead>
                <tbody>
                    @foreach ($cachorros as $cachorro)
                        <tr>
                            <td>{{ $cachorro->no_microchip }}</td>
                            <td>{{ $cachorro->no_tatuaje }}</td>
                            <td>{{ $cachorro->nombre }}</td>
                            <td>{{ $cachorro->fecha_nacimiento}}</td>
                            <td>{{ $cachorro->raza }}</td>
                            <td>{{ $cachorro->sexo }}</td>

                            <td>
                                <a href="{{ route('cachorro.venta', ['id' => $cachorro->id_cachorro]) }}" class="btn btn-primary btn-sm">Venta</a>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
            {!! $cachorros->links() !!}
        </div>
    </div>
</div>
@endsection
