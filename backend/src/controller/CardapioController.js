const connection = require('../database/connection');
const crypto = require('crypto');
const fs = require('fs');

module.exports = {
    async index(request, response){
        cardapios = await connection('cardapio').select("*");
        return response.json(cardapios);
    },
    async create(request,response){
        const {name, description, price, imagename} = request.body;
        const extension = imagename.substr(imagename.length - 4, name.length)
        const uid = crypto.randomBytes(4).toString('HEX');
       
        await connection('cardapio').insert({
            uid,
            name,
            description,
            price
        })
        fs.rename(`./src/images/${imagename}`, `./src/images/${uid}${extension}`, function(err) {
            if(err){
                console.log(err);
            }
        });

        return response.json({ uid });
    },
    async delete(request, response){
        const { uid, FuncUid} = request.body;
        const token = request.headers.authorization;
        
        const funcionario = connection.from("funcionario")
            .where({
                "uid": FuncUid,
                token
            })
            .select("*").first()

        if (!funcionario){
            return response.json({error: "Funcionario ID or Token Invalid"})
        }

        const cardapio = connection.from('cardapio')
            .where("uid", uid)
            .select("*");
        
        if (!cardapio){
            return response.status(404).json({error: "Cardapio not found"});
        }

        await connection.from('cardapio')
            .where("uid", uid)
            .first()
            .delete();

        return response.status(200).send();
    }
}