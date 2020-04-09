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
    },
    async delete(request, response){
        const { uid } = request.body;

        const pedido = await connection('pedido')
                            .where("uid", uid)
                            .select("user_id").first();
                            
        if (!pedido){
            return response.status(404).json({error: "Pedido not found"});
        }

        await connection('pedido')
        .where('uid', uid)
        .delete();

        return response.status(204).send();
    }
}