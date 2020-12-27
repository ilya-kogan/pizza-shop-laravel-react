import React from 'react';
import { Grid, Typography, Button } from '@material-ui/core';
import AddCircleOutlineIcon from '@material-ui/icons/AddCircleOutline';
import RemoveCircleOutlineIcon from '@material-ui/icons/RemoveCircleOutline';
import HighlightOffIcon from '@material-ui/icons/HighlightOff';

class CartItem extends React.Component {
  constructor() {
    super();
  }

  render() {
    const { id, amount, info } = this.props.data;
    const { curr_name, curr_symbol } = this.props.currency;

    return(
      <Grid
        container
        direction="row"
        justify="space-between"
        alignItems="center"
        spacing={2}
      >
        <Grid item xs={3}>
          <img style={{ width: '100%' }} src={ 'img/' + id + '.png' } alt={ info.title } />
        </Grid>

        <Grid item xs={9}>
          <Grid item xs={12} container justify="space-between">
            <strong style={{ maxWidth: '90%', whiteSpace: 'break-spaces' }}>{ info.title }</strong>
            <HighlightOffIcon fontSize="small" onClick={() => this.props.removeCartItem(id)} />
          </Grid>

          <Grid item xs={12}>
            <RemoveCircleOutlineIcon fontSize="small" onClick={() => this.props.addToCart({ id: id, info: info, amount: -1 })} />
            <span style={{ padding: '0 7px', fontSize: 13 }}>{ amount }</span>
            <AddCircleOutlineIcon fontSize="small" onClick={() => this.props.addToCart({ id: id, info: info, amount: 1 })} />

            <strong style={{ float: 'right' }}>
              {curr_symbol}{ (curr_name == 'usd' ? info.price : info.price_eur) * amount }
            </strong>
          </Grid>
        </Grid>
      </Grid>
    );
  }
}

export default CartItem;