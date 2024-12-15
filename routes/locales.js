import {Router} from 'express';
import { LocalController } from '../controllers/locales.js';

export const localesRouter = Router()


localesRouter.post('/',LocalController.create)
localesRouter.delete('/:id',LocalController.delete)
localesRouter.patch('/:id',LocalController.update)