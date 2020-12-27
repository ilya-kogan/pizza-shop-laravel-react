import React from 'react';
import { Grid, Fab, Typography, Button } from '@material-ui/core';
import AddIcon from '@material-ui/icons/Add';
import RemoveIcon from '@material-ui/icons/Remove';

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
        spacing={3}
      >
        <Grid item xs={3}>
          <img style={{ width: 100 }} src={ 'img/' + id + '.png' } alt={ info.title } />
          
          <strong style={{ padding: "0 20px", fontSize: "1rem" }}>{ info.title }</strong>
        </Grid>

        <Grid item xs={3} container justify="center">
          <Fab size="small" color="secondary" aria-label="add">
            <RemoveIcon onClick={() => this.props.addToCart({ id: id, info: info, amount: -1 })}/>
          </Fab>

          <Typography style={{ padding: "0 10px", lineHeight: "40px" }}>
            <b>
              { amount }
            </b>
          </Typography>

          <Fab size="small" color="secondary" aria-label="add">
            <AddIcon onClick={() => this.props.addToCart({ id: id, info: info, amount: 1 })} />
          </Fab>
        </Grid>

        <Grid item xs={3} container justify="center">
          <Typography>
            <b>
              {curr_symbol}{ curr_name == 'usd' ? info.price : info.price_eur } * { amount }pc. = {curr_symbol}{ (curr_name == 'usd' ? info.price : info.price_eur) * amount }
            </b>
          </Typography>
        </Grid>

        <Grid item xs={3} container justify="flex-end">
          <Button variant="contained" color="secondary" onClick={() => this.props.removeCartItem(id)} >
            Remove from cart
          </Button>
        </Grid>
      </Grid>
    );
  }
}

export default CartItem;