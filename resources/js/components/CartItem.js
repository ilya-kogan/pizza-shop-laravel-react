import React from 'react';
import HighlightOffIcon from '@material-ui/icons/HighlightOff';

class CartItem extends React.Component {
  constructor() {
    super();
  }

  render() {
    const { id, amount, info } = this.props.data;
    const { curr_name, curr_symbol } = this.props.currency;

    let alignDeleteIcon = 'top';
    let cartPageStyles = {};
    if (this.props.cartPage) {
      alignDeleteIcon = 'center';
      cartPageStyles = { width: '100%', display: 'flex', alignItems: 'center', justifyContent: 'flex-start' };
    }

    return(
      <span style={{ width: '100%', display: 'flex', alignItems: alignDeleteIcon, justifyContent: 'space-between' }}>        
        <span style={ cartPageStyles }>
          {this.props.cartPage &&
            <span style={{ padding: '0 20px 0 0' }}><img width="100" height="100" src={ 'img/' + id + '.png' } alt={ info.title } /></span>
          }

          <span style={{ padding: '0 20px 0 0' }}>
            <strong>{ info.title }</strong><br/>
          </span>

          <span>
            ({curr_symbol}{ curr_name == 'usd' ? info.price : info.price_eur } * { amount }pc.) = {curr_symbol}{ (curr_name == 'usd' ? info.price : info.price_eur) * amount }
          </span>
        </span>
        
        <HighlightOffIcon fontSize="small" onClick={() => this.props.removeCartItem(id)} />
      </span>
    );
  }
}

export default CartItem;