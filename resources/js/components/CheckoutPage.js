import React from 'react';
import { Container, Grid, TextField, Button, Paper, ButtonGroup, FormControlLabel, Checkbox } from '@material-ui/core';
import { Dialog, DialogTitle, DialogContent, DialogContentText, DialogActions } from '@material-ui/core';
import Alert from '@material-ui/lab/Alert';
import NavigateBeforeIcon from '@material-ui/icons/NavigateBefore';
import NavigateNextIcon from '@material-ui/icons/NavigateNext';
import { Link, Redirect } from 'react-router-dom';

class CheckoutPage extends React.Component {

  constructor() {
    super();

    this.state = {
      cartEmpty: true,
      cartItems: [],
      totalPrice: 0,
      userID: 0,
      firstName: '',
      lastName: '',
      email: '',
      phone: '',
      address: '',
      floor: '',
      orderComments: '',
      errors: [],
      createAccount: false,
      showDialog: false,
      currency: {}
    }
  }

  static getDerivedStateFromProps(nextProps, prevState) {
    let newProps = ({});

    if ((nextProps.cartData !== prevState.cartData) && (nextProps.cartData.cartItems.length > 0)) {
      newProps = ({
        cartEmpty: false,
        cartItems: JSON.stringify(nextProps.cartData.cartItems),
        totalPrice: nextProps.cartData.totalPrice
      })
    }

    if ((nextProps.user !== prevState.user) && (nextProps.user !== null)) {
      newProps = Object.assign({
        userID: nextProps.user.id,
        firstName: nextProps.user.first_name,
        lastName: nextProps.user.last_name,
        email: nextProps.user.email,
      }, newProps);
    }

    if ((nextProps.currency !== prevState.currency) && (nextProps.currency !== null)) {
      newProps = Object.assign({
        currency: nextProps.currency.curr_name
      }, newProps);
    }

    if (newProps) {
      return newProps;
    }

    return null;
  }

  handleChange(e) {
    const target = e.target;
    const value = target.value;
    const name = target.name;

    this.setState({
      [name]: value
    });
  }

  handleSubmit(e) {
    e.preventDefault();

    fetch('/api/orders', {
      method: 'POST',
      body: JSON.stringify(this.state),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
    }).then(
      (response) => (response.json())
        ).then((response) => {
          if (response.hasOwnProperty('formSend')) {
            this.setState({
              firstName: '',
              lastName: '',
              email: '',
              phone: '',
              address: '',
              floor: '',
              orderComments: '',
              errors: [],
              responseStatus: ''
            });

            this.setState({ 
              responseStatus: response.formSend,
              showDialog: true
            });
            this.props.clearCart();
          } else if(response.hasOwnProperty('errors')) {
            this.setState({ 
              errors: response.errors,
              responseStatus: response.message
            });            
          }
        });
  }

  render() {
    return(
      <Container style={{ marginTop: 30 }}>
        <h1>Checkout</h1>

        { !this.state.cartEmpty &&
          <>
            <form method="POST" onSubmit={(e) => this.handleSubmit(e)}>
              <Paper elevation={3} style={{ marginBottom: 15, padding: 40 }}>          
                <Grid container spacing={3} justify="space-between" alignItems="center" style={{ marginBottom: 20 }}>
                  <Grid item xs>
                    <TextField
                      error={this.state.errors.firstName ? true : false}
                      label="First Name"
                      name="firstName"
                      style={{ margin: 15 }}
                      placeholder="First Name"
                      value={this.state.firstName}
                      helperText={this.state.errors.firstName ? this.state.errors.firstName : ' '}
                      variant="outlined"
                      style={{ width: '100%' }}
                      onChange={(e) => this.handleChange(e)}
                    />
                  </Grid>

                  <Grid item xs>
                    <TextField
                      error={this.state.errors.lastName ? true : false}
                      label="Last Name"
                      name="lastName"
                      style={{ margin: 15 }}
                      placeholder="Last Name"
                      value={this.state.lastName}
                      helperText={this.state.errors.lastName ? this.state.errors.lastName : ' '}
                      variant="outlined"
                      style={{ width: '100%' }}
                      onChange={(e) => this.handleChange(e)}
                    />
                  </Grid>

                  <Grid item xs>
                    <TextField
                      error={this.state.errors.email ? true : false}
                      label="Email"
                      name="email"
                      style={{ margin: 15 }}
                      placeholder="Email"
                      value={this.state.email}
                      helperText={this.state.errors.email ? this.state.errors.email : ' '}
                      variant="outlined"
                      style={{ width: '100%' }}
                      onChange={(e) => this.handleChange(e)}
                    />
                  </Grid>
                </Grid>

                <Grid container spacing={3} justify="space-between" alignItems="center" style={{ marginBottom: 20 }}>
                  <Grid item xs>
                    <TextField
                      error={this.state.errors.phone ? true : false}
                      label="Phone"
                      name="phone"
                      style={{ margin: 15 }}
                      placeholder="Phone"
                      value={this.state.phone}
                      helperText={this.state.errors.phone ? this.state.errors.phone : ' '}
                      variant="outlined"
                      style={{ width: '100%' }}
                      onChange={(e) => this.handleChange(e)}
                    />
                  </Grid>

                  <Grid item xs>
                    <TextField
                      error={this.state.errors.address ? true : false}
                      label="Address"
                      name="address"
                      style={{ margin: 15 }}
                      placeholder="Address"
                      value={this.state.address}
                      helperText={this.state.errors.address ? this.state.errors.address : ' '}
                      variant="outlined"
                      style={{ width: '100%' }}
                      onChange={(e) => this.handleChange(e)}
                    />
                  </Grid>

                  <Grid item xs>
                    <TextField
                      error={this.state.errors.floor ? true : false}
                      label="Floor"
                      name="floor"
                      style={{ margin: 15 }}
                      placeholder="Floor"
                      value={this.state.floor}
                      helperText={this.state.errors.floor ? this.state.errors.floor : ' '}
                      variant="outlined"
                      style={{ width: '100%' }}
                      onChange={(e) => this.handleChange(e)}
                    />
                  </Grid>
                </Grid>

                <Grid container justify="space-between" alignItems="center">
                  <Grid item xs={12}>
                    <TextField
                      id="standard-full-width"
                      label="Order Comments"
                      name="orderComments"
                      multiline
                      rows={5}
                      placeholder="Order Comments"
                      value={this.state.orderComments}
                      variant="outlined"
                      style={{ width: '100%' }}
                      onChange={(e) => this.handleChange(e)}
                    />
                  </Grid>
                </Grid>

                {/* { this.state.userID === 0 &&
                  <FormControlLabel
                    control={<Checkbox checked={this.state.createAccount} onChange={(e) => this.handleChange(e)} name="createAccount" />}
                    label="Create an account"
                  />
                } */}

                { this.state.responseStatus &&
                  <Alert severity={ this.state.responseStatus == 'success' ? 'success' : 'error' } style={{ marginTop: 20 }}>
                    { this.state.responseStatus == 'success' ? 'Thank you! Your order is accepted!' : this.state.responseStatus }
                  </Alert>
                }
              </Paper>

              <ButtonGroup variant="contained" color="secondary">
                <Button>
                  <Link to="/cart" style={{ color: '#fff' }}>
                    <NavigateBeforeIcon fontSize="small" />
                    Cart
                  </Link>
                </Button>
                <Button type="submit">            
                  Make an order
                  <NavigateNextIcon fontSize="small" />
                </Button>
              </ButtonGroup>
            </form>
          </>
        }

        { this.state.cartEmpty &&
          <strong>Your cart is currently empty :(</strong>
        }

        <Dialog
          open={this.state.showDialog}
          aria-labelledby="alert-dialog-title"
          aria-describedby="alert-dialog-description"
        >
          <DialogTitle id="alert-dialog-title">{"Thank you!"}</DialogTitle>
          <DialogContent>
            <DialogContentText id="alert-dialog-description">
              Your order is accepted!
              We have already started to cook.
              The manager will contact you.
              Have a good day!
            </DialogContentText>
          </DialogContent>
          <DialogActions>
            <Link to="/">
              <Button color="primary" autoFocus>
                Go Home
              </Button>
            </Link>
          </DialogActions>
        </Dialog>
      </Container>
    );
  }
}

export default CheckoutPage;