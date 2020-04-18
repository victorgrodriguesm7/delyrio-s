import React from 'react';
import { BrowserRouter, Route, Switch, Redirect } from 'react-router-dom';
import Logon from './Pages/Logon';
import Profile from './Pages/Profile';


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
                <PrivateRoute path="/profile" component={Profile}/>
                <Route path="*" component={() => <h1>Page not found</h1>} />
            </Switch>
        </BrowserRouter>
    );
}