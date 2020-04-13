import React from 'react';
import { BrowserRouter, Route, Switch } from 'react-router-dom';

import Logon from './Pages/Logon';
import Profile from './Pages/Profile';

export default function Routes(){
    return (
        <BrowserRouter>
            <Switch>
                <Route path='/' exact component={Logon}/>
                <Route path="/profile" component={Profile}/>
            </Switch>
        </BrowserRouter>
    );
}