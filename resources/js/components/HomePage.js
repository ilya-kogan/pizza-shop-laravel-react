import React from 'react';
import { Container, Grid, Snackbar } from '@material-ui/core';
import Alert from '@material-ui/lab/Alert';
import HomeProductItem from './HomeProductItem';

class HomePage extends React.Component {
  constructor() {
    super();

    this.state = {
      products: []
    }
  }

  componentDidMount() {
    fetch('/api/products')
      .then(response => {     
        return response.json();
      })
      .then(products => {
        this.setState({ products });
      });   
  }

  render() {
    const productItem = this.state.products.map((product) => {
      return (
        <HomeProductItem
          key={product.id}
          data={product}
          addToCart={this.props.addToCart}
          currency={this.props.currency}
        />
      );
    });

    return(
      <>
        <Container style={{ marginTop: 30 }}>
          <Grid container spacing={5}>
            { productItem }
          </Grid>

          <Snackbar
            open={this.props.showAlertStatus}
            autoHideDuration={3000}
            onClose={() => this.props.showAlert(false)}
          >
            <Alert severity="success" onClose={() => this.props.showAlert(false)}>
              Product added to cart!
            </Alert>
          </Snackbar>
        </Container>
      </>
    );
  }
}

export default HomePage;