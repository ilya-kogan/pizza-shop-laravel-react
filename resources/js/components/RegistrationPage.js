import React from 'react';
import { Container, Grid, TextField, Button, Paper, ButtonGroup } from '@material-ui/core';
import { Dialog, DialogTitle, DialogContent, DialogContentText, DialogActions } from '@material-ui/core';
import Alert from '@material-ui/lab/Alert';
import NavigateBeforeIcon from '@material-ui/icons/NavigateBefore';
import NavigateNextIcon from '@material-ui/icons/NavigateNext';
import { Link, Redirect } from 'react-router-dom';

class RegistrationPage extends React.Component {
  constructor() {
    super();

    this.state = {
      first_name: '',
      last_name: '',
      email: '',
      password: '',
      password_confirm: '',
      errors: [],
      responseMsg: '',
      showDialog: false
    }
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

    fetch('/api/register', {
      method: 'POST',
      body: JSON.stringify(this.state),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
    }).then(
      (response) => (response.json())
        ).then((response) => {
          if (response.errors) {
            this.setState({
              errors: response.errors
            });
          } else {
            this.setState({
              errors: [],
              showDialog: true
            });
          }

          this.setState({
            responseMsg: response.message
          });
        });
  }

  render() {
    return(
      <>
        <Container style={{ marginTop: 30 }}>
          <h1>Registration</h1>

          <form method="POST" onSubmit={ (e) => this.handleSubmit(e) }>
            <Paper elevation={3} style={{ marginBottom: 15, padding: '50px 30px 1px' }}>
              <Grid container spacing={3} justify="space-between" alignItems="center" style={{ marginBottom: 20 }}>
                <Grid item xs>
                  <TextField
                    error={this.state.errors.first_name ? true : false}
                    label="First Name"
                    name="first_name"
                    style={{ width: '100%' }}
                    placeholder="First Name"
                    value={this.state.first_name}
                    helperText={this.state.errors.first_name ? this.state.errors.first_name : ' '}
                    variant="outlined"
                    onChange={(e) => this.handleChange(e)}
                  />
                </Grid>

                <Grid item xs>
                  <TextField
                    error={this.state.errors.last_name ? true : false}
                    label="Last Name"
                    name="last_name"
                    style={{ width: '100%' }}
                    placeholder="Last Name"
                    value={this.state.last_name}
                    helperText={this.state.errors.last_name ? this.state.errors.last_name : ' '}
                    variant="outlined"
                    onChange={(e) => this.handleChange(e)}
                  />
                </Grid>

                <Grid item xs>
                  <TextField
                    error={this.state.errors.email ? true : false}
                    label="Email"
                    name="email"
                    type="email"
                    autoComplete="email"
                    style={{ width: '100%' }}
                    placeholder="Email"
                    value={this.state.email}
                    helperText={this.state.errors.email ? this.state.errors.email : ' '}
                    variant="outlined"
                    onChange={(e) => this.handleChange(e)}
                  />
                </Grid>
              </Grid>
                
              <Grid container spacing={3} justify="space-between" alignItems="center" style={{ marginBottom: 20 }}>
                <Grid item xs>
                  <TextField
                    error={this.state.errors.password ? true : false}
                    label="Password"
                    name="password"
                    type="password"
                    autoComplete="current-password"
                    style={{ width: '100%' }}
                    placeholder="Passsword"
                    value={this.state.password}
                    helperText={this.state.errors.password ? this.state.errors.password : ' '}
                    variant="outlined"
                    onChange={(e) => this.handleChange(e)}
                  />
                </Grid>

                <Grid item xs>
                  <TextField
                    error={this.state.errors.password_confirm ? true : false}
                    label="Password Confirm"
                    name="password_confirm"
                    type="password"
                    autoComplete="current-password"
                    style={{ width: '100%' }}
                    placeholder="Password Confirm"
                    value={this.state.password_confirm}
                    helperText={this.state.errors.password_confirm ? this.state.errors.password_confirm : ' '}
                    variant="outlined"
                    onChange={(e) => this.handleChange(e)}
                  />
                </Grid>
              </Grid>

              { this.state.responseMsg &&
                <Alert severity='error' style={{ marginTop: 20, marginBottom: 30 }}>
                  { this.state.responseMsg }
                </Alert>
              }
            </Paper>

            <ButtonGroup variant="contained" color="secondary">
              <Button>
                <Link to="/login" style={{ color: '#fff' }}>
                  <NavigateBeforeIcon fontSize="small" />
                  Login
                </Link>
              </Button>
              <Button type="submit">            
                Registration
                <NavigateNextIcon fontSize="small" />
              </Button>
            </ButtonGroup>
          </form>

          <Dialog
            open={this.state.showDialog}
            aria-labelledby="alert-dialog-title"
            aria-describedby="alert-dialog-description"
          >
            <DialogTitle id="alert-dialog-title">{"Successful Registration!"}</DialogTitle>
            <DialogContent>
              <DialogContentText id="alert-dialog-description">
                Congratulations on your successful Registration!
              </DialogContentText>
            </DialogContent>
            <DialogActions>
              <Link to="/login">
                <Button color="primary" autoFocus>
                  Go to Login
                </Button>
              </Link>
            </DialogActions>
          </Dialog>
        </Container>
      </>
    );
  }
}

export default RegistrationPage;