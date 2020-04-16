import React, { useState } from 'react';
import {useHistory} from 'react-router-dom';
import swal from 'sweetalert';
import api from '../../services/api';

import './style.css'

export default function Logon(){
    
    const [name, setName] = useState("");
    const [password, setPassword] = useState("");
    const history = useHistory();
    async function handleLogin(e){
        e.preventDefault();
        const data = {
            name,
            password
        };

        try {
            const response = await api.post('sessionF', data);
            localStorage.setItem('uid', response.data.uid);
            localStorage.setItem('token', response.data.token);
            localStorage.setItem('name', name);
            history.push('/profile');
            
        } catch (error) {
            swal('Falha no Login', "" , 'error');
        }
        

    }

    return (
        <div className="logon-container">
            <section>
                <h1>Bem Vindo ao De Lyrio's</h1>

                <form onSubmit={handleLogin}>
                    <h1>Faça seu Login</h1>
                    <input 
                        value={name}
                        onChange={e => setName(e.target.value)}
                        placeholder="Seu Nome"
                    />

                    <input 
                        value={password}
                        onChange={e => setPassword(e.target.value)}
                        type="password" 
                        placeholder="Sua Senha"
                    />

                    <button className="button" type="submit">Login</button>
                </form>
            </section>
        </div>
    );
}