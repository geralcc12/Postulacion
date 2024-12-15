import { ProductoModel } from "../models/producto.js";


export class ProductoController {

    static async create(req,res){
        const {producto_id,
               nom_produc,
               marca,
               precio_unitario,
               comercializador,
               id_categoria
              } = req.body;

        try {
            
            const producto = await ProductoModel.createProduct({
                producto_id,
                nom_produc,
                marca,
                precio_unitario,
                comercializador,
                id_categoria})
                
                if(producto.error){
                    return res.status(400).json({error: producto.error})
                }
            res.status(201).json(producto)
        } catch (error) {
            res.status(500).json({error: error.message})
        }
    }

    static async delete(req, res){
        const {id} = req.params;

        const result = await ProductoModel.deleteProduct({id});
        if(result===false){
            return res.status(404).json({message: "Producto no encontrado"})
        }
        return res.json({message: "Producto eliminado"})
    }


    static async update(req,res){
        const {id} = req.params;
        const {nom_produc, marca, precio_unitario, comercializador, id_categoria} = req.body;

       const result = await ProductoModel.updateProduct({nom_produc, marca, precio_unitario, comercializador, id_categoria,id });

        if(result === false){
           return res.status(400).json({messssage: "producto no encontrado"});
        }
        res.json({message: "Producto actualizado"})

    }

}