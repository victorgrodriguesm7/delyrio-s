const connection = require('../database/connection');
const crypto = require('crypto');

module.exports = {
    async index(request,response){
        pedidos = await connection('pedido').select("*");
        formatedpedidos = [];
        
        for (pedido of pedidos){
            items_uid = JSON.parse(pedido.items);
            items_name = [];
            for (item of items_uid){
                item_name = await connection('cardapio')
                    .where("uid", item)
                    .select('name').first()
                items_name.push(
                    item_name.name
                );
            }
            formatedpedidos.push({
                "uid": pedido.uid,
                "items": items_name,
                "amount" : pedido.amount,
                "address" : pedido.address,
                "price": pedido.price
            });
        }

        return response.json(formatedpedidos);
    },
    async create(request,response){
        const {items, amount, address} = request.body;
        user_id = request.headers.authorization;
        var [price, index] = [0, 0]

        for (item of items){

            item_price = await connection('cardapio')
                .where({
                    "uid" : item
                }).select('price').first();
            
            item_amount = amount[index];
            price += item_price.price * item_amount;
            index++;
        }
        
        const uid = crypto.randomBytes(4).toString('HEX');

        await connection('pedido').insert({
            uid,
            user_id,
            "items" : JSON.stringify(items),
            "amount" : JSON.stringify(amount),
            address,
            price
        })

        return response.json({ uid });
    },
    async delete(request, response){
        const { uid, user_id } = request.body;
        const token = request.headers.authorization;

        const funcionario = connection.from("funcionario")
            .where({
                uid,
                token
            }).first()

        if (!funcionario){
            return response.json({error: "Funcionario ID or Token Invalid"})
        }

        const pedido = await connection('pedido')
                            .where("uid", user_id)
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