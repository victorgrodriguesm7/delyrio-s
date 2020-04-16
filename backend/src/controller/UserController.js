const connection = require('../database/connection');
const crypto = require('crypto');
const bcrypt = require('bcrypt');
const saltrounds = 10;

module.exports = {
    async index(request, response){
        users = await connection('user').select("*");
        return response.json(users);
    },
    async create(request,response){
        var {name, password, phonenumber, email} = request.body
        const uid = crypto.randomBytes(4).toString('HEX');
        const token = crypto.randomBytes(8).toString('HEX');
        const users = await connection('user')
            .where({
                "phonenumber" : phonenumber,
            })
            .select('uid')
            .first();
        
        if (users){
            return response.status(406).json({error : "Usuário já existe"});
        }

        bcrypt.hash(password, saltrounds, async function(error, password){
            await connection('user').insert({
                uid,
                name,
                password,
                phonenumber,
                email,
                token
            })
        });

        return response.json({ uid });
    }
}