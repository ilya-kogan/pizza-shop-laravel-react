import React from 'react';
import Header from './Header';
import HomePage from './HomePage';
import LoginPage from './LoginPage';
import RegistrationPage from './RegistrationPage';
import MyOrdersPage from './MyOrdersPage';
import CartPage from './CartPage';
import CheckoutPage from './CheckoutPage';
import { Route, Switch, Link } from 'react-router-dom';

class App extends React.Component {
  constructor() {
    super();

    this.state = {
      cartItems: [],
      totalAmount: 0,
      totalPrice: 0,
      currency: {
        curr_name: 'usd',
        curr_symbol: '$'
      }
    }
  }

  componentDidMount() {
    fetch('/api/user', {
      method: 'GET',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + localStorage.getItem('token'),
      },
    })
    .then(response => response.json())
    .then(
      result => {
        if (result.hasOwnProperty('id')) {
          this.setUser(result);
        }
      }
    )

    const cartItems = JSON.parse(localStorage.getItem('cartItems'));
    if (cartItems) {
      this.setState({
        cartItems
      }, () => this.cartUpdate());
    }

    if (localStorage.getItem('currency') == null) {
      const currency = {
        curr_name: 'usd',
        curr_symbol: '$'
      }
      localStorage.setItem('currency', JSON.stringify(currency));
    } else {
      const currency = JSON.parse(localStorage.getItem('currency'));

      this.setState({
        currency
      }, () => this.cartUpdate());
    }
  }

  setUser = user => {
    this.setState({
      user: user
    });
  }

  addToCart = currentProductData => {
    let cartItemsString = localStorage.getItem('cartItems');
    let cartItems = [];

    if (cartItemsString) {
      cartItems = JSON.parse(cartItemsString);
    }

    let existingItemIndex = cartItems.findIndex(item => item.id === currentProductData.id);
    if ( existingItemIndex === -1 ) {
      cartItems.push(currentProductData);
    } else {
      cartItems[existingItemIndex].amount++;
    }
    
    localStorage.setItem('cartItems', JSON.stringify(cartItems));
    this.setState({
      cartItems
    }, () => this.cartUpdate());
  }

  cartUpdate() {
    if ( this.state.cartItems && this.state.cartItems.length > 0 ) {
      let totalAmount = 0;
      let totalPrice = 0;

      this.state.cartItems.forEach( (item) => {
        let price = item.info.price;
        if (this.state.currency.curr_name == 'eur') {
          price = item.info.price_eur;
        }

        totalAmount += item.amount;
        totalPrice += item.amount * price;
      });

      return this.setState({
        totalAmount,
        totalPrice
      });
    }
  }

  removeCartItem = productId => {
    let cartItemsString = localStorage.getItem('cartItems');
    let cartItems = [];

    if (cartItemsString) {
      cartItems = JSON.parse(cartItemsString);
    }

    let existingItemIndex = cartItems.findIndex(item => item.id === productId);
    if (existingItemIndex !== -1) {
      cartItems.splice(existingItemIndex, 1);
    }
    
    localStorage.setItem('cartItems', JSON.stringify(cartItems));
    this.setState({
      cartItems
    }, () => this.cartUpdate());
  }

  clearCart = () => {
    localStorage.removeItem('cartItems');
    this.setState({
      cartItems: []
    }, () => this.cartUpdate());
  }

  setCurrency = (e) => {
    let currencySymbol = '$';    
    if (e.target.value == 'eur') {
      currencySymbol = '€';
    }

    const currency = {
      curr_name: e.target.value,
      curr_symbol: currencySymbol
    }

    localStorage.setItem('currency', JSON.stringify(currency));
    this.setState({ 
      currency
    }, () => this.cartUpdate());
  }

  render() {
    return(
      <>
        <Header
          user={this.state.user}
          setUser={this.setUser}
          cartData={this.state}
          currency={this.state.currency}
          setCurrency={this.setCurrency}
          removeCartItem={this.removeCartItem}
        />

        <Switch>
          <Route path="/login">
            <LoginPage setUser={this.setUser} />
          </Route>
          <Route path="/registration">
            <RegistrationPage />
          </Route>
          <Route path="/my-orders">
            <MyOrdersPage />
          </Route>
          <Route path="/checkout">
            <CheckoutPage cartData={this.state} clearCart={this.clearCart} user={this.state.user} currency={this.state.currency} />
          </Route>
          <Route path="/cart">
            <CartPage cartData={this.state} removeCartItem={this.removeCartItem} currency={this.state.currency} />
          </Route>
          <Route path="/">
            <HomePage addToCart={this.addToCart} currency={this.state.currency} />
          </Route>          
        </Switch>
      </>
    );
  }
}

export default App;