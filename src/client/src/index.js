import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import registerServiceWorker from './registerServiceWorker';
import ScrollToTop from './components/ScrollToTop';

import { BrowserRouter } from 'react-router-dom';
import { Provider } from 'react-redux';
import { createStore } from 'redux'; 

const initialState =
{  
    count: 0
};

function reducer(state=initialState, action)
{
    switch(action.type)
    {  
        case 'INCREMENT':
        return {
            count: state.count + 1
        };

        case 'DECREMENT':
        return {
            count: state.count - 1
        };
        default:  
        return state;
    }
}

const store = createStore(reducer);

ReactDOM.render(
<Provider store={store}>
    <BrowserRouter>
        <ScrollToTop>
            <App />
        </ScrollToTop>
    </BrowserRouter>
</Provider>,
document.getElementById('root'));
registerServiceWorker();