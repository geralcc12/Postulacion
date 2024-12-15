import client from './postgresql/db.js';

/*{
    producto_id:
    nom_produc:
    marca:
    precio_unitario:
    comercializador:
    id_categoria:

  } */

export class ProductoModel{

  static async createProduct({producto_id, nom_produc,marca,precio_unitario, comercializador, id_categoria}){
  
    try {
      const query = `
    INSERT INTO Producto (producto_id, nom_produc, marca, precio_unitario, comercializador, categoria_id) 
    VALUES ($1, $2, $3, $4, $5, $6) RETURNING *`;

    const res = await client.query(query,[producto_id, nom_produc, marca, precio_unitario,comercializador,id_categoria]);
    
    return res.rows[0];

    } catch (error) {
      return {error: error.message};
    }

  }

  static async deleteProduct({id}){
    try {
      const query = `DELETE FROM Producto WHERE producto_id =$1`;
      const res = await client.query(query,[id]);
      
      if(res.rowCount === 0){
        return false;
      }
      return true;

    } catch (error) {
     return {error: error.message}
    }
  }

  
static async getProductById({id}){
  try {
    const query = `SELECT * FROM Producto WHERE producto_id = $1`;
    const res = await client.query(query,[id]);
    return res.rows;
}catch (error) {
{error: error.message}  

}
}
  static async  updateProduct ({id,nom_produc,marca,precio_unitario,comercializador,id_categoria}){
    
   
    try {
      const query = `UPDATE Producto SET nom_produc=$1, marca=$2, precio_unitario=$3, comercializador=$4, categoria_id=$5 WHERE producto_id=$6 RETURNING *`;
      const res = await client.query(query,[nom_produc, marca, precio_unitario, comercializador, id_categoria, id]);
      

      if(res.rowCount === 0){
        return false;
      }
      return true;
      
    } catch (error) {
      return {error: error.message};
    }

   }
}