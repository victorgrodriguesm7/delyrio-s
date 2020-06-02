import React, { useState , useEffect} from 'react';
import { Link, useHistory } from 'react-router-dom';
import { FiPower, FiTrash2 } from 'react-icons/fi';
import swal from 'sweetalert';
import api from '../../services/api';
import logoImg from '../../assets/logo.svg';
import './style.css';

export default function Profile(){

    const [pedidos, setPedidos] = useState([]);
    const [cardapio, setCardapio] = useState([]);
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
            });
        api.get('cardapio')
            .then(
                response => {
                    setCardapio(response.data)
                }
            );
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
            swal("Erro ao deletar Pedido", "error")
        }
    }

    async function handleDeleteCardapio(cardapioID){
        try {
            await api.delete("cardapio",
                {
                    data : {
                        "uid" : cardapioID,
                        "funcUid": uid
                    },
                    headers : {
                        Authorization : token
                    }
                }
            );
            setCardapio(cardapio.filter(item => cardapio.uid !== cardapioID));
        } catch (err) {
            swal("Erro ao deletar Cardápio", "error")
        }
    }
    function handleLogout(){
        localStorage.clear()
        history.push('/');
    }
    
    setTimeout(() => setRefresh(!refresh), 200)
    return (
        <div className="profile-container">
            <header>
                <img src={logoImg} width={30} height={30} className="logo" alt="Delyrio's"/>

                <span>Bem vindo, {name}</span>

                <Link className="button" to="/profile/produto">
                    Cadastar novo Cardápio
                </Link>

                <button onClick={handleLogout} type="button">
                    <FiPower size={18} style={{color: "#E02041"}}/>
                </button>
            </header>

        <h1>Pedidos</h1>

        <ul>
            {pedidos.map(pedido => 
                <li className="pedido">
                    <strong>Pedido {pedido.uid}</strong>
                        {pedido.items.map((item, index) => 
                            <p>{item} x{JSON.parse(pedido.amount)[index]}</p>
                        )}
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
            {cardapio.map(item =>
                <li className="cardapio">
                    <img src={`${process.env.REACT_APP_API_URL}/images/${item.uid}.png`} className="cardapio-img" alt="Delyrio's"/>
                    <strong>Item {item.uid}</strong>
                    <strong>Nome</strong>
                    <p>{item.name}</p>
                    <strong>Descrição</strong>
                    <p>{item.description}</p>
                    <strong>Preço</strong>
                    <p>{Intl.NumberFormat('pt-br', { style: 'currency', currency: "BRL"}).format(item.price)}</p>
                    <button onClick={() => handleDeleteCardapio(item.uid)} type="button"> 
                        <FiTrash2 size={20} color="#a8a8b3"/>
                    </button>
                </li>
            )}
        </ul>
    </div> 
    );
}