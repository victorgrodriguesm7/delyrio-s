const express = require('express');
const funcionario = require('./controller/FuncionarioController');
const user = require('./controller/UserController');
const cardapio = require('./controller/CardapioController');
const pedido = require('./controller/PedidoController');

const routes = express.Router();

routes.get('/funcionario', funcionario.index);
routes.post('/funcionario', funcionario.create);
routes.get('/users', user.index);
routes.post('/users', user.create);
routes.get('/cardapio', cardapio.index);
routes.post('/cardapio', cardapio.create);
routes.get('/pedido', pedido.index);
routes.post('/pedido', pedido.create);

module.exports = routes;