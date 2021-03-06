import React from 'react';
import { BrowserRouter, Route, Switch, Redirect } from 'react-router-dom';
import Logon from './Pages/Logon';
import Profile from './Pages/Profile';
import Cardapio from './Pages/Cardapio';

const PrivateRoute = ({ component: Component, ...rest }) => (
    <Route
      {...rest}
      render={props =>
        (localStorage.getItem('token') !== null) ? (
          <Component {...props} />
        ) : (
          <Redirect to={{ pathname: "/", state: { from: props.location } }} />
        )
      }
   />
);

export default function Routes(){
    return (
        <BrowserRouter>
            <Switch>
                <Route path='/' exact component={Logon}/>
                <PrivateRoute path="/profile" exact component={Profile}/>
                <PrivateRoute path="/profile/produto" component={Cardapio} />
                <Route path="*" component={() => <h1>Page not found</h1>} />
            </Switch>
        </BrowserRouter>
    );
}