import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import reportWebVitals from './reportWebVitals';

import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';

// import './index.scss'

import Home from './pages/Home'
import Redirect from './pages/Redirect'

// ReactDOM.render(
//   <React.StrictMode>
//     <App />
//   </React.StrictMode>,
//   document.getElementById('root')
// );


ReactDOM.render(
  <React.StrictMode>
  <Router>
      <Routes>
        <Route path='/'  element= {<Home />}  />
        <Route path='/:url' element= {<Redirect />}  />
      </Routes>
    </Router>
    </React.StrictMode>,
  document.getElementById('root')
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();