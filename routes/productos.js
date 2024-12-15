import {Router} from 'express';
import { ProductoController } from '../controllers/productos.js';

export const productosRouter = Router()

productosRouter.post('/',ProductoController.create)

productosRouter.delete('/:id',ProductoController.delete)

productosRouter.patch('/:id',ProductoController.update)
