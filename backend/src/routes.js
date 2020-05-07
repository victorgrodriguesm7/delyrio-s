
const express = require('express');
const multer = require('multer');
const storage = require('./storage');
const upload =  multer({ storage });

const funcionario = require('./controller/FuncionarioController');
const user = require('./controller/UserController');
const cardapio = require('./controller/CardapioController');
const pedido = require('./controller/PedidoController');
const reserva = require('./controller/ReservaController');
const session = require('./controller/SessionController');
const profile = require('./controller/ProfileController');

const routes = express.Router();

routes.get('/funcionario', funcionario.index);
routes.post('/funcionario', funcionario.create);

routes.get('/users', user.index);
routes.post('/users', user.create);

routes.get('/cardapio', cardapio.index);
routes.post('/cardapio', upload.single('image'), cardapio.create);
routes.delete('/cardapio', cardapio.delete);
routes.options('/cardapio', function(req, res, next) {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Methods', 'GET, PUT, POST, DELETE, OPTIONS');
    res.header('Access-Control-Allow-Headers', 'Content-Type, Authorization, Content-Length, X-Requested-With');
    res.send(200);
})
routes.get('/pedido', pedido.index);
routes.post('/pedido', pedido.create);
routes.delete('/pedido', pedido.delete);

routes.get('/reserva', reserva.index);
routes.post('/reserva', reserva.create);
routes.delete('/reserva', reserva.delete);

routes.post('/session', session.UserLogin);
routes.post('/sessionF', session.FuncionarioLogin);

routes.post('/profileF', profile.funcionario);

module.exports = routes;
