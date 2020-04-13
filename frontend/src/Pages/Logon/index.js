import React, { useState } from 'react';

import './style.css'

export default function Logon(){
    
    const [name, setName] = useState("");
    const [password, setPassword] = useState("");

    function handleLogin(e){
        e.preventDefault();
        const data = {
            name,
            password
        }
        console.log(data);
    }

    return (
        <div className="logon-container">
            <section>
                <h1>Bem Vindo ao De Lyrio's</h1>

                <form onSubmit={handleLogin}>
                    <h1>Faça seu Logon</h1>
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

                    <button className="button" type="submit">Logar</button>
                </form>
            </section>
        </div>
    );
}