const connection = require('../database/connection');
const crypto = require('crypto');

module.exports = {
    async index(request, response){
        pedidos = await connection('pedido').select("*");
        return response.json(pedidos);
    },
    async create(request,response){
        var {items, price} = request.body;
        user_id = request.headers.authorization;
        items = JSON.stringify(items);
        const uid = crypto.randomBytes(4).toString('HEX');

        await connection('pedido').insert({
            uid,
            user_id,
            items,
            price
        })

        return response.json({ uid });
    }
}