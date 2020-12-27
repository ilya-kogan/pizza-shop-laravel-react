import React from 'react';
import CartNav from './CartNav';
import { Link, Redirect } from 'react-router-dom';
import { Container, Typography, Button, Grid, AppBar, FormControl, MenuItem, Select, InputBase } from '@material-ui/core';
import { withStyles } from '@material-ui/core/styles';


class Header extends React.Component {
  constructor() {
    super();

    this.state = {
      redirectToHome: false
    }
  }

  handleLogout = () => {
    localStorage.removeItem('token');
    this.props.setUser(null);
    this.setState({ redirectToHome: true });
  }

  render() {
    const BootstrapInput = withStyles((theme) => ({
      root: {
        'label + &': {
          marginTop: theme.spacing(3),
        },
      },
      input: {
        borderRadius: 4,
        position: 'relative',
        backgroundColor: 'transition',
        color: '#fff',
        border: '1px solid #fff',
        fontSize: 14,
        fontWeight: 500,
        padding: '7px 15px 8px'
      }
    }))(InputBase);

    return(
      <AppBar position="static" style={{ padding: 10, backgroundColor: '#ffb838' }}>
        <Container>
          <Grid container spacing={5} alignItems="center">
            <Grid item xs={6} style={{ paddingBottom: 10 }}>
              <Link to="/" className="logo">
                <img src="img/logo.png" height="80" alt="Pizza Shop" />
                <Typography style={{ fontSize: 16, color: '#fff', fontWeight: 'bold' }} noWrap>Pizza Shop</Typography>
              </Link>
            </Grid>

            <Grid
              item
              xs={6}
              container
              direction="row"
              justify="flex-end"
              alignItems="center"
            >
              {!this.props.user && 
                <>
                  <Link to="/login">
                    <Button
                      variant="outlined"
                      style={{ marginRight: 10, color: '#fff', borderColor: '#fff' }}
                    >
                      Login
                    </Button>
                  </Link>                  
                </>
              }

              {this.props.user &&
                <>
                  <Link to="/my-orders">
                    <Button
                      variant="outlined"
                      style={{ marginRight: 10, color: '#fff', borderColor: '#fff' }}
                    >
                      My Orders
                    </Button>
                  </Link>
                  
                  <Button
                    variant="outlined"
                    style={{ marginRight: 10, color: '#fff', borderColor: '#fff' }}
                    onClick={this.handleLogout}
                  >
                    Logout
                  </Button>
                </>
              }

              <FormControl variant="outlined">
                <Select
                  value={this.props.currency.curr_name}
                  onChange={(e) => this.props.setCurrency(e)}
                  input={<BootstrapInput />}
                >
                  <MenuItem value={'usd'}>USD</MenuItem>
                  <MenuItem value={'eur'}>EUR</MenuItem>
                </Select>
              </FormControl>

              <CartNav
                cartData={this.props.cartData}
                addToCart={this.props.addToCart}
                removeCartItem={this.props.removeCartItem}
                currency={this.props.currency}
              />
            </Grid>
          </Grid>
        </Container>

        { this.state.redirectToHome &&
          <Redirect to="/"/>
        } 
      </AppBar>
    );
  }
}

export default Header;