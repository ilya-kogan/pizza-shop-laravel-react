import React from 'react';
import MyOrdersItem from './MyOrdersItem';
import { Container, Paper, TextField, Button } from '@material-ui/core';

class MyOrdersPage extends React.Component {
  constructor() {
    super();

    this.state = {
      orders: ''
    }
  }

  componentDidMount() {
    fetch('/api/orders', {
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
        if (result.length > 0) {
          this.setState({
            orders: result
          });
        }
      }
    )
  }

  render() {   
    let orderItems;
    if ( this.state.orders && this.state.orders.length > 0 ) {
      orderItems = this.state.orders.map( (orderItem) => <MyOrdersItem key={orderItem.id} data={orderItem} /> );
    }

    return(
      <Container style={{ marginTop: 30 }}>
        <h1>My Orders</h1>

        <Paper elevation={3} style={{ marginBottom: 15, padding: 30 }}>
          { (this.props.user && orderItems) &&
            { orderItems }
          }

          { !this.props.user &&
            <>
              Please login to see orders.
            </>
          }

          { (this.props.user && !orderItems) &&
            <>
              Sorry, you don't have any orders yet.
            </>
          }
        </Paper>
      </Container>
    );
  }
}

export default MyOrdersPage;