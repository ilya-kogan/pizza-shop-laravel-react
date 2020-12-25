import React from 'react';
import Container from '@material-ui/core/Container';
import Grid from '@material-ui/core/Grid';
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
        </Container>
      </>
    );
  }
}

export default HomePage;