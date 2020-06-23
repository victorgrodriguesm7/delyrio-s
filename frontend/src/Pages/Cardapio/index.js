import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import { FiArrowLeft } from 'react-icons/fi';
import swal from 'sweetalert';

import logoImg from '../../assets/logo.svg'
import api from '../../services/api';
import './style.css'


export default function Cardapio(){
    const [product, setProduct] = useState("");
    const [description, setDescripiton] = useState("");
    const [price, setPrice] = useState("");
    const [imagename, setImageName] = useState("");
    const [image, setImage] = useState([]);

    const uid = localStorage.getItem("uid");
    const token = localStorage.getItem("token");
    function formatImageName(imagename){
        var lastslash = imagename.lastIndexOf("\\") + 1;
        setImageName(imagename.slice(lastslash, imagename.length));
    }

    function handleClearFields(e){
        e.preventDefault();
        setProduct("");
        setDescripiton("");
        setPrice("");
        setImageName("");
        setImage([]);
    }
    async function handlenNewProduto(e){
        e.preventDefault();
        const bodyFormData = new FormData();
        const extension = imagename.substr(imagename.length - 4, imagename.length)
        if (extension != ".png"){
            swal("A imagem do produto precisar ser PNG", "", "error");
            return;
        }
        bodyFormData.set("uid", uid);
        bodyFormData.append("name", product);
        bodyFormData.append("description", description);
        bodyFormData.append("price", parseFloat(price));
        bodyFormData.append("image", image[0]);
        bodyFormData.append("imagename", imagename);
        
        try{
            await api.post('/cardapio', 
                bodyFormData,
                { headers: {
                    Authorization: token
                }}
            );
            handleClearFields(e);
            swal("Produto cadastrado com sucesso")
        }catch(e){
            swal("Erro ao Criar Produto, tente novamente", "", "error")
        }
    }
    return (
        <div className="cardapio-container">
            <div className="content">
                <section>
                <img src={logoImg} width={30} height={30} className="logo" alt="Delyrio's"/>
                <h1>Cadastrar novo Produto</h1>
                    
                    <Link className="back-link" to="/profile">
                        <FiArrowLeft size={16} color="#e02041"/>
                        Voltar para home
                    </Link>
                </section>

                <form onSubmit={handlenNewProduto}>

                    <input
                        placeholder="Nome do produto"
                        value={product}
                        onChange={(e) => setProduct(e.target.value)}
                    />
                    <textarea 
                        placeholder="Descrição"
                        value={description}
                        onChange={e => setDescripiton(e.target.value)}
                    />
                    <input 
                        placeholder="Valor em reais"
                        value={price}
                        onChange={e => setPrice(e.target.value)}
                    />
                    <label>Escolha o arquivo do novo produto</label>
                    

                    <div className="button-group">
                        <input 
                            type="file"
                            onChange={e => {
                                formatImageName(e.target.value); 
                                setImage([e.target.files[0]]);
                            }}
                        />
                        <button className="button" onClick={e => handleClearFields(e)}>Cancelar</button>
                        <button className="button" type="submit">Cadastrar</button>
                    </div>
                </form>
            </div>
        </div>
    );
}