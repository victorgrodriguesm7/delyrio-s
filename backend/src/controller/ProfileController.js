const connection = require('../database/connection');

module.exports = {
    async funcionario(request,response){
        const { uid } = request.body;

        const name = connection.from('funcionario')
            .where(uid).select('name');

        return response.status(200).json({name});
    }
}