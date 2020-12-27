import React from 'react';

class OrderPrice extends React.Component {
  constructor() {
    super();
  }

  render() {
    return(
      <>
        <hr/><hr/>
        <div style={{ fontSize: "1rem" }}>
          <strong>Subtotal: </strong>{ this.props.curr_symbol }{ this.props.totalPrice } ({ this.props.totalAmount }pc.)<br/>
          <strong>Delivery: </strong>{ this.props.curr_symbol }5<br/>
          <hr/>
          <strong>Total: </strong>{ this.props.curr_symbol }{ this.props.totalPrice + 5 }
        </div>
      </>
    );
  }
}

export default OrderPrice;