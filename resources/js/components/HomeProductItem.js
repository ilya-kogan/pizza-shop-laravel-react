import React from 'react';
import Grid from '@material-ui/core/Grid';
import Card from '@material-ui/core/Card';
import CardActionArea from '@material-ui/core/CardActionArea';
import CardActions from '@material-ui/core/CardActions';
import CardContent from '@material-ui/core/CardContent';
import CardMedia from '@material-ui/core/CardMedia';
import Button from '@material-ui/core/Button';
import Typography from '@material-ui/core/Typography';
import AddShoppingCartIcon from '@material-ui/icons/AddShoppingCart';

class HomeProductItem extends React.Component {
  constructor() {
    super();
  }

  render() {
    const { id, title, description, price, price_eur } = this.props.data;
    const { curr_name, curr_symbol } = this.props.currency;

    return(
      <Grid item xs={12} sm={3}>
        <Card>
          <CardActionArea>
            <CardMedia
              component="img"
              alt={title}
              height="140"
              image={ 'img/' + id + '.png' }
              title={title}
              style={{objectFit: 'contain'}}
            />
            <CardContent>
              <Typography gutterBottom variant="h5" component="h2">
                { title }
              </Typography>

              <Typography variant="body2" color="textSecondary" component="p">
                { description }
              </Typography>
            </CardContent>
          </CardActionArea>

          <CardActions>
              <Grid
                container
                direction="row"
                justify="space-between"
                alignItems="center"
                style={{ padding: 8 }}
              >
              <Typography
                style={{ fontSize: 16, fontWeight: 'bold' }}
              >
                { curr_symbol }{ curr_name == 'usd' ? price : price_eur }
              </Typography>

              <Button
                size="small"
                color="primary"
                style={{ minWidth: 'auto' }}
                onClick={() => this.props.addToCart({ id: id, info: this.props.data, amount: 1 })}
              >
                <AddShoppingCartIcon fontSize="small" style={{ color: '#000' }} />
              </Button>
            </Grid>
          </CardActions>
        </Card>
      </Grid>
    );
  }
}

export default HomeProductItem;