import React from 'react';
import CartItem from './CartItem';
import { Typography, Button, Menu, MenuItem, Badge, IconButton } from '@material-ui/core';
import { withStyles } from '@material-ui/core/styles';
import ShoppingCartIcon from '@material-ui/icons/ShoppingCart';
import { Link } from 'react-router-dom';

class CartNav extends React.Component {
  constructor() {
    super();

    this.state = {
      anchorEl: null
    }
  }

  handleOpenCart = (e) => {
    this.setState({
      anchorEl: e.currentTarget
    });
  };

  handleCloseCart = () => {
    this.setState({
      anchorEl: null
    });
  };

  render() {
    const { cartItems, totalAmount, totalPrice } = this.props.cartData;
    const { curr_name, curr_symbol } = this.props.currency;

    const StyledBadge = withStyles((theme) => ({
      badge: {
        right: 0,
        top: 2,
        border: `2px solid ${theme.palette.background.paper}`,
        padding: '0 4px',
      },
    }))(Badge);

    let cartItem;
    if ( cartItems && cartItems.length > 0 ) {
      cartItem = cartItems.map( (item) => {
        return (
          <MenuItem key={item.id} style={{ borderBottom: '1px dotted #908e8e' }}>
            <CartItem
              data={item}
              removeCartItem={this.props.removeCartItem}
              currency={this.props.currency}
            />
          </MenuItem>
        );
      });
    }
    
    return(
      <>
        <IconButton
          aria-label="cart"
          style={{ color: '#fff' }}
          aria-controls="cart-menu"
          aria-haspopup="true"
          onClick={this.handleOpenCart}
        >
          <StyledBadge badgeContent={ cartItems.length > 0 ? totalAmount : 0 } color="secondary">
            <ShoppingCartIcon />
          </StyledBadge>
        </IconButton>
        
        { cartItems.length > 0 &&
          <Menu
            id="cart-menu"
            anchorEl={this.state.anchorEl}
            keepMounted
            open={Boolean(this.state.anchorEl)}
            onClose={this.handleCloseCart}
            getContentAnchorEl={null}
            anchorOrigin={{
              vertical: 'bottom',
              horizontal: 'right',
            }}
            transformOrigin={{
              vertical: 'top',
              horizontal: 'right',
            }}
          >
            { cartItem }

            <MenuItem style={{ marginTop: 15 }}>
              <Typography noWrap style={{ fontSize: 16, fontWeight: 'bold' }}>
                Subtotal: { curr_symbol }{ totalPrice } ({ totalAmount }pc.)
              </Typography>
            </MenuItem>

            <hr />
            <MenuItem onClick={this.handleCloseCart}>
              <Typography noWrap style={{ fontSize: 16, fontWeight: 'bold' }}>
                <Link to="/cart">Make an order</Link>
              </Typography>
            </MenuItem>
          </Menu>
        }


        { cartItems.length == 0 &&
          <Menu
            id="cart-menu"
            anchorEl={this.state.anchorEl}
            keepMounted
            open={Boolean(this.state.anchorEl)}
            onClose={this.handleCloseCart}
            getContentAnchorEl={null}
            anchorOrigin={{
              vertical: 'bottom',
              horizontal: 'right',
            }}
            transformOrigin={{
              vertical: 'top',
              horizontal: 'right',
            }}
          >
            <MenuItem>
              Your cart is currently empty :(
            </MenuItem>
          </Menu>
        }
        
      </>
    );
  }
}

export default CartNav;