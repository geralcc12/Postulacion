import express from 'express';
import {localesRouter} from './routes/locales.js';
import  {productosRouter} from './routes/productos.js';


const app = express();


app.use(express.json());



app.get('/',(req,res) =>{
    res.send(`<H1>Hola mundo</H1>`);
});

app.use('/locales',localesRouter);

app.use('/productos', productosRouter);

const PORT = process.env.PORT || 3000;


app.listen(PORT,() =>{
    console.log(`Escuchando el puerto http://localhost:${PORT}`);
});
