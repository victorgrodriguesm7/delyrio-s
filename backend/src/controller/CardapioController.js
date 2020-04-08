const connection = require('../database/connection');
const crypto = require('crypto');

module.exports = {
    async index(request, response){
        cardapios = await connection('cardapio').select("*");
        return response.json(cardapios);
    },
    async create(request,response){
        var {name, description, price} = request.body;
        const uid = crypto.randomBytes(4).toString('HEX');

        await connection('cardapio').insert({
            uid,
            name,
            description,
            price
        })

        return response.json({ uid });
    }
}