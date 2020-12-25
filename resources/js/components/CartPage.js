import React from 'react';
import CartItem from './CartItem';
import { Container, Button, Paper, ButtonGroup } from '@material-ui/core';
import NavigateBeforeIcon from '@material-ui/icons/NavigateBefore';
import NavigateNextIcon from '@material-ui/icons/NavigateNext';
import { Link } from 'react-router-dom';

class CartPage extends React.Component {
  constructor() {
    super();
  }

  render() {
    const { cartItems, totalAmount, totalPrice } = this.props.cartData;
    const { curr_name, curr_symbol } = this.props.currency;

    let cartItem = '';
    if ( cartItems && cartItems.length > 0 ) {
      cartItem = cartItems.map( (item) => {
        return(
          <div key={item.id}>
            <CartItem
              data={item}
              cartPage={true}
              removeCartItem={this.props.removeCartItem}
              currency={this.props.currency}
            />
            <hr/>
          </div>
        );        
      });
    }

    return(
      <Container style={{ marginTop: 30 }}>
        <h1>Cart</h1>

        <Paper elevation={3} style={{ marginBottom: 15, padding: 30 }}>
          { cartItem &&
            <>
              { cartItem }

              <hr/><hr/>

              <div>
                <strong>Subtotal: </strong>{ curr_symbol }{ totalPrice } ({ totalAmount }pc.)<br/>
                <strong>Delivery: </strong>{ curr_symbol }5<br/>
                <hr/>
                <strong>Total: </strong>{ curr_symbol }{ totalPrice + 5 }
              </div>
            </>
          }

          { !cartItem &&
            <strong>Your cart is currently empty :(</strong>
          }                   
        </Paper>

        <ButtonGroup variant="contained" color="secondary">
          <Button>
            <Link to="/" style={{ color: '#fff' }}>
              <NavigateBeforeIcon fontSize="small" />
              Home
            </Link>
          </Button>

          { cartItem &&
            <Button>
              <Link to="/checkout" style={{ color: '#fff' }}>
                Checkout
                <NavigateNextIcon fontSize="small" />
              </Link>
            </Button>
          }
        </ButtonGroup>
      </Container>      
    );
  }

}

export default CartPage;