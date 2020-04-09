const connection = require('../database/connection');
const crypto = require('crypto');

module.exports = {
    async index(request, response){
        reservas = await connection('reserva').select("*");

        return response.json(reservas);
    },
    async create(request, response){
        const { numeroMesa, hora } = request.body;
        const user_id = request.headers.authorization;
        const uid = crypto.randomBytes(4).toString('HEX');

        const reservas = await connection('reserva')
            .where({
                "numeroMesa" : numeroMesa,
                "hora" : hora
            })
            .select('uid')
            .first();
        if (reservas){
            return response.status(406)
                .json({error : "Reserva já existente"});
        }

        await connection('reserva').insert({
            uid,
            user_id,
            numeroMesa,
            hora
        });

        return response.status(200).json({ uid });
    }
}