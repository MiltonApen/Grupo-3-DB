<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Cachorro;
use App\Venta;
use App\CachorroVenta;
use DB;
class CachorroController extends Controller
{
    /**
    * Funcion de inicio, muestra todos los alumnos registrados
    *
    * @return \Illuminate\Http\Response
    */
   public function index()
   {
       $cachorros = Cachorro::paginate(5); // obteniendo todos los datos de alumnos en la base de datos

       return view('cachorro.index', ['cachorros' => $cachorros]);
   }

   /**
     * Funcion que muestra el formulario para crear alunos
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('cachorro.create');


    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validation = $request->validate([
            'microchip' => 'required',
            'tatuaje' => 'required',
            'nacimiento' => 'required|date',
            'raza' => 'required',
            'sexo' => 'required',

        ]);

        $cachorro = new Cachorro();
        DB::beginTransaction();
        try {
            $cachorro->no_microchip = $request->microchip;
            $cachorro->no_tatuaje  = $request->tatuaje;
            $cachorro->nombre   = $request->nombre;
            $cachorro->fecha_nacimiento   = $request->nacimiento;
            $cachorro->raza   = $request->raza;
            $cachorro->sexo   = $request->sexo;

            $cachorro->save();
            DB::commit();
            session()->flash('success', 'Registro almacenado');
        } catch(\Exception $ex) {
            DB::rollback();
            session()->flash('success', 'Error al almacenar');
            return redirect()
                ->route('cachorro.create')
                ->withInput($request->input());
        }

        return redirect()->route('cachorro.create');


    }
    public function addVenta($id)
    {

        $cachorro = Cachorro::find($id);
        //dd('asdas');
        return view('cachorro.venta', [
            'cachorro' => $cachorro,
        ]);
    }

        public function storeVenta(Request $request, $id)
        {
            $CachorroId = $id;
            $tipoPago = $request->input('tipo_pago', 'Fecetivo');
            $precioVenta = $request->input('precio_vendido', 200);

            $venta = new CachorroVenta();
            DB::beginTransaction();
            try {

                $venta->id_cachorro = $CachorroId;
                $venta->tipo_pago = $tipoPago;
                $venta->precio_vendido = $precioVenta;
                $venta->save();


                DB::commit();
                session()->flash('success','Registro almacenado');
            } catch (\Exception $ex) {
                DB::rollBack();
                session()->flash('error', 'Error al almacenar' . $ex->getMessage());
            }

            return redirect()->route('cachorro.venta', ['id' => $id]);
        }

        /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

     /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

}
