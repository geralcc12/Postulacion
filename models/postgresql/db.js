import pkg from 'pg';
const  {Client} = pkg

const client = new Client({
    user:'postgres',
    host:'localhost',
    database:'ACME',
    password:'12345',
    port:5432,
});

client.connect();

export default client;