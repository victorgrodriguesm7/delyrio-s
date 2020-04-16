const connection = require('../database/connection');
const crypto = require('crypto');
const bcrypt = require('bcrypt');
const saltrounds = 10;

module.exports = {
    async index(request, response){
        funcionarios = await connection('funcionario').select("*");
        return response.json(funcionarios);
    },
    async create(request,response){
        var {name, password} = request.body
        const uid = crypto.randomBytes(4).toString('HEX');
        const token = crypto.randomBytes(8).toString('HEX');
        bcrypt.hash(password, saltrounds, async function(error, password){
            await connection('funcionario').insert({
                uid,
                name,
                password,
                token
            })
        })
        
        return response.json({ uid });
    }
}