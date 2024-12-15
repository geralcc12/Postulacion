import { LocalModel } from '../models/local.js'


export class LocalController{
    static async create (req,res){
        const {local_id,nombre_local,territorio_id,cliente_id} = req.body;
        try {
            const nuevoLocal = await LocalModel.createLocales({local_id,nombre_local,territorio_id,cliente_id })
            if(nuevoLocal.error){
                return res.status(404).json(nuevoLocal)
            }
            res.status(201).json(nuevoLocal)
        } catch (error) {
            res.status(500).json({error: error.message})
        }
    }

    static async update(req,res){
        const {id} = req.params
        const {nombre_local,territorio_id,cliente_id} = req.body;
        try {

            const updateLocal = await LocalModel.actualizarLocal({id,nombre_local,territorio_id,cliente_id})

            if(!updateLocal){
                return res.status(404).json({error: "Local no encontrado"})
            }
            res.status(200).json(updateLocal)
        } catch (error) {
            res.status(500).json({error: error.message})
        }
    }

    static async delete(req,res){
        const {id} = req.params;
        try {
            const deleteLocal = await LocalModel.deleteLocal({id})

            if (deleteLocal===false){
                return res.status(404).json({message: "Local no encontrado"})
            }

            return res.json({message: "Local eliminado"})
            
        } catch (error) {
            res.status(500).json({error: error.message})
        }
    }

}