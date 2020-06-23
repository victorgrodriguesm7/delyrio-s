const connection = require('../database/connection');
const crypto = require('crypto');
const bcrypt = require('bcrypt');

module.exports = {
    async FuncionarioLogin(request, response){
        const { name, password } = request.body
        try {
            const {uid, ...cryptPass} = await connection.from("funcionario")
                .where({
                    "name": name
                }).select([ "uid", "password"])
                .first();
            bcrypt.compare(password, cryptPass["password"], async function(error, result){
                if (result){
                    token = crypto.randomBytes(8).toString('HEX');
                    
                    await connection.from('funcionario').where({
                        uid,
                    }).update({
                        token
                    });    
                    return response.json({
                        token,
                        uid
                    });
            
                }else{
                    return response.status(404).json({ error: "Incorrect Password" })
                }
            });
        }catch(err){
            return response.status(404).json({error: "User not found"});
        }
    },
    async UserLogin(request,response){
        const {email, password} = request.body
        
        try{
            const {uid, ...cryptPass} = await connection.from("user")
                .where({
                    "email": email
                }).select(["uid", "password"])
                .first();
                bcrypt.compare(password, cryptPass["password"], async function(error, result){
                    if (result){
                        const token = crypto.randomBytes(8).toString('HEX')
                        await connection('user').where({
                            uid,
                        }).update({
                            token
                        });
        
                        return response.status(200).json({
                            token,
                            uid
                        });
                    }else{
                        return response.status(404).json({ error: "Incorrect Password" })
                    }
                });
        }catch(err){
            return response.status(404).json({error: "User not found"});
        } 
    }
}
