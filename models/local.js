import client from './postgresql/db.js';

export class LocalModel {
    static async getLocalbyId({id}){
      try {
        const query = 'SELECT * FROM Locales WHERE local_id = $1'
        const res = await client.query(query,[id]);
        console.log(res.rows)
        return res.rows;
        
      } catch (error) {
        console.log(error.message);
      }
      
    }

    static async createLocales({local_id,nombre_local,territorio_id,cliente_id}){
      
      try {
        const query = 'Insert into Locales (local_id,nombre_local, territorio_id, cliente_id) VALUES ($1, $2, $3, $4) RETURNING *';

        const res = await client.query(query, [local_id,nombre_local,territorio_id,cliente_id]);

        return res.rows[0];

      } catch (error) {
        
        return {error: error.message};
      }
        
    }

    static async actualizarLocal({id,nombre_local,territorio_id,cliente_id}) {

      const verificarID = await LocalModel.getLocalbyId({id});
      
      if (verificarID.length===0 )
        {
          return false;
        }

      try {
          const query = `
          UPDATE Locales 
          SET nombre_local = $1, territorio_id = $2, cliente_id = $3 
          WHERE local_id = $4 RETURNING *`;
          const res = await client.query(query, [nombre_local, territorio_id, cliente_id, id]);
        console.log(res.rows[0])
        return res.rows[0]; 

      } catch (error) {
        console.log(error.message);
      }
      
      }

      static async deleteLocal({id}){

        try {
          const query = `DELETE FROM Locales WHERE local_id = $1`;
          const res = await client.query(query, [id]);
          console.log(res.rowCount)
          if (res.rowCount===0){
            console.log("Local no encontrado");
            return false;
          }
            
          console.log("Local eliminado correctamente");
          return true;

        } catch (error) {
          console.log(error.message);
        }
      }

}