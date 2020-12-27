import React from 'react';
import { Container, TextField, Button, Paper } from '@material-ui/core';
import { Table, TableBody, TableCell, TableContainer, TableHead, TableRow } from '@material-ui/core';

class MyOrdersItem extends React.Component {
  constructor() {
    super();
  }

  render() {
    const { data } = this.props;
    const products = JSON.parse(data.products);
    let currencySymbol = '$';    
    if (data.currency == 'eur') {
      currencySymbol = '€';
    }

    return(
      <>
        <TableContainer component={Paper} style={{ marginBottom: 30 }}>
          <Table aria-label="simple table">
            <TableHead>
              <TableRow>
                <TableCell>Order #{data.id}</TableCell>
                <TableCell align="right">Date</TableCell>
                <TableCell align="right">Address</TableCell>
                <TableCell align="right">Phone</TableCell>
                <TableCell align="right">Order Comments</TableCell>
                <TableCell align="right">Total Price, {currencySymbol}</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              <TableRow key={data.id}>
                <TableCell component="th" scope="row"></TableCell>
                <TableCell align="right">{data.created_at}</TableCell>
                <TableCell align="right">{data.address}</TableCell>
                <TableCell align="right">{data.phone}</TableCell>
                <TableCell align="right">{data.order_comments}</TableCell>
                <TableCell align="right"><b style={{ fontSize: 15 }}>{currencySymbol}{data.price}</b></TableCell>
              </TableRow>

              <TableRow>
                <TableCell component="th" scope="row"></TableCell>
                <TableCell align="right"></TableCell>
                <TableCell align="right"></TableCell>
                <TableCell align="right"></TableCell>
                <TableCell align="right"></TableCell>
                <TableCell align="right"></TableCell>
              </TableRow>

              <TableRow style={{ borderTop: '2px solid #000' }}>
                <TableCell component="th" scope="row"><b>Order Items:</b></TableCell>
                <TableCell align="right"></TableCell>
                <TableCell align="right"></TableCell>
                <TableCell align="right"><b>Amount</b></TableCell>
                <TableCell align="right"><b>Price, {currencySymbol}</b></TableCell>
                <TableCell align="right"><b>Total, {currencySymbol}</b></TableCell>
              </TableRow>

              {products.map((product) => (
                <TableRow key={product.id}>
                  <TableCell component="th" scope="row">
                    <img style={{ width: 50, marginRight: 10 }} src={ 'img/' + product.id + '.png' } alt={ product.info.title } />
                    {product.info.title}
                  </TableCell>
                  <TableCell align="right"></TableCell>
                  <TableCell align="right"></TableCell>
                  <TableCell align="right">{product.amount}</TableCell>
                  <TableCell align="right">{data.currency == 'usd' ? product.info.price : product.info.price_eur}</TableCell>
                  <TableCell align="right">{data.currency == 'usd' ? product.amount*product.info.price : product.amount*product.info.price_eur}</TableCell>
                </TableRow>
              ))}              

              <TableRow style={{ borderTop: '2px solid #000' }}>
                <TableCell component="th" scope="row">
                  <b>Delivery</b>
                </TableCell>
                <TableCell align="right"></TableCell>
                <TableCell align="right"></TableCell>
                <TableCell align="right">1</TableCell>
                <TableCell align="right">5</TableCell>
                <TableCell align="right">5</TableCell>
              </TableRow>
            </TableBody>
          </Table>
        </TableContainer>

        <hr style={{ marginBottom: 30 }} />
      </>
    );
  }
}

export default MyOrdersItem;