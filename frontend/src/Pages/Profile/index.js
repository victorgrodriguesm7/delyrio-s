import React, { useState, useEffec, useEffect} from 'react';
import { Link, useHistory } from 'react-router-dom';
import { FiPower, FiTrash2 } from 'react-icons/fi';
import swal from 'sweetalert';
import api from '../../services/api';
import './style.css';

export default function Profile(){

    const [pedidos, setPedidos] = useState([]);
    const [refresh, setRefresh] = useState(true);
    const history = useHistory();
    const token = localStorage.getItem('token');
    const uid = localStorage.getItem('uid');
    const name = localStorage.getItem('name');

    useEffect(() => {
        api.get('pedido')
        .then(
            response => {
                setPedidos(response.data)
            })
    }, [refresh]);

    async function handleDeletePedido(pedidoid){
        try{
            await api.delete('pedido',
                { 
                    data : {
                        uid,
                        pedidoid
                    },
                    headers: {
                        Authorization : token
                    }
                }
            );
            setPedidos(pedidos.filter(pedido => pedido.uid !== pedidoid));
        }catch(err){
            swal("Erro ao deletar pedido", "error")
        }
    }

    function handleLogout(){
        localStorage.clear()
        history.push('/');
    }
    
    setTimeout(() => setRefresh(!refresh), 150)
    return (
        <div className="profile-container">
            <header>
                <span>Bem vindo, {name}</span>

                <Link className="button" to="/profile">
                    Cadastar novo Cardápio
                </Link>

                <button onClick={handleLogout} type="button">
                    <FiPower size={18} style={{color: "#E02041"}}/>
                </button>
            </header>

        <h1>Pedidos</h1>

        <ul>
            {pedidos.map(pedido => 
                <li>
                    <strong>Pedido {pedido.uid}</strong>
                        
                    <strong>Endereço</strong>
                        <p>{pedido.address}</p>
                    <strong>Valor</strong>
                        <p>{Intl.NumberFormat('pt-br', { style: 'currency', currency: "BRL"}).format(pedido.price)}</p>
                    <button onClick={() => handleDeletePedido(pedido.uid)} type="button">
                        <FiTrash2 size={20} color="#a8a8b3"/>
                    </button>
                </li>
            )}
            
        </ul>

        <h1>Cardapio</h1>

        <ul>
            <li>
                <strong>Nome</strong>
                <p>Arroz</p>
                <strong>Descrição</strong>
                <p>Arroz Comum</p>
                <strong>Preço</strong>
                <p>R$ 10 reais</p>
                <img src="http://localhost:3333/images/144ec0df.png"/>
            </li>
        </ul>
    </div> 
    );
}