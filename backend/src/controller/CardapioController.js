const connection = require('../database/connection');
const crypto = require('crypto');

module.exports = {
    async index(request, response){
        cardapios = await connection('cardapio').select("*");
        return response.json(cardapios);
    },
    async create(request,response){
        const {name, description, price} = request.body;
        const uid = crypto.randomBytes(4).toString('HEX');

        await connection('cardapio').insert({
            uid,
            name,
            description,
            price
        })

        return response.json({ uid });
    },
    async delete(request, response){
        const { uid, FuncUid} = request.body;
        const token = request.headers.authorization;
        
        const funcionario = connection.from("funcionario")
            .where({
                uid,
                token
            }).first()

        if (!funcionario){
            return response.json({error: "Funcionario ID or Token Invalid"})
        }

        const cardapio = connection.from('cardapio')
            .where("uid", uid)
            .select("*");
        
        if (!cardapio){
            return response.status(404).json({error: "Cardapio not found"});
        }

        cardapio.delete();

        return response.status(200).send();
    }
}