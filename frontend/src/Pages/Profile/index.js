import React from 'react';
import { Link } from 'react-router-dom';
import { FiPower } from 'react-icons/fi';
import './style.css';

export default function Profile(){

    const token = localStorage.getItem('token');
    const uid = localStorage.getItem('uid');
    const name = localStorage.getItem('name');
    
    return (
        <div className="profile-container">
            <header>
                <span>Bem vindo, {name}</span>

                <Link className="button" to="/profile">
                    Cadastar novo Cardápio
                </Link>

                <button type="button">
                    <FiPower size={18} style={{color: "#E02041"}}/>
                </button>
            </header>

        <h1>Pedidos</h1>

        <ul>
            <li>
                <strong>Pedido</strong>
                <p>Arroz  x2</p>
                <p>Feijão x1</p>
                <p>Frango x1</p>
                <p>batata x1</p>
                <strong>Endereço</strong>
                <p>Rua Radialista Coelho Alves - 635</p>
                <strong>Valor</strong>
                <p>R$ 50 reais</p>
            </li>
            <li>
                <strong>Pedido</strong>
                <p>Arroz  x2</p>
                <p>Feijão x1</p>
                <p>Frango x1</p>
                <p>batata x1</p>
                <strong>Endereço</strong>
                <p>Rua Radialista Coelho Alves - 635</p>
                <strong>Valor</strong>
                <p>R$ 50 reais</p>
            </li>
            <li>
                <strong>Pedido</strong>
                <p>Arroz  x2</p>
                <p>Feijão x1</p>
                <p>Frango x1</p>
                <p>batata x1</p>
                <strong>Endereço</strong>
                <p>Rua Radialista Coelho Alves - 635</p>
                <strong>Valor</strong>
                <p>R$ 50 reais</p>
            </li>
        </ul>

        <h1>Cardapio</h1>

        <ul>
            <li>
                <strong>Nome</strong>
                <p>Frango</p>
                <strong>Descrição</strong>
                <p>Frango Comum</p>
                <strong>Preço</strong>
                <p>R$ 5 reais</p>
            </li>
        </ul>
    </div> 
    );
}