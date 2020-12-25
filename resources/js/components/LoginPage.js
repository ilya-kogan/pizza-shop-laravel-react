import React from 'react';
import { Container, Grid, TextField, Button, Paper, ButtonGroup } from '@material-ui/core';
import Alert from '@material-ui/lab/Alert';
import { Redirect, Link } from 'react-router-dom';

class LoginPage extends React.Component {
  constructor() {
    super();

    this.state = {
      loggedIn: false,
      email: '',
      password: '',
      errors: [],
      responseMsg: ''
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

    fetch('/api/login', {
      method: 'POST',
      body: JSON.stringify(this.state),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
    }).then(
      (response) => (response.json())
        ).then((response) => {
          console.log(response);

          if (response.errors === false) {
            localStorage.setItem('token', response.token);

            this.setState({
              loggedIn: true,
              register_status: response,
              errors: [],
              responseMsg: ''
            });

            this.props.setUser(response.user);
          } else {
            this.setState({
              errors: response.errors,
              responseMsg: response.message
            });
          }
        });
  }

  render() {
    if (this.state.loggedIn) {
      return <Redirect to={'/'} />;
    }

    return(
      <>
        <Container style={{ marginTop: 30 }}>
          <h1>Login</h1>

          <form method="POST" onSubmit={ (e) => this.handleSubmit(e) }>
            <Paper elevation={3} style={{ marginBottom: 15, padding: '50px 30px 1px' }}>
              <Grid container spacing={3} alignItems="center" style={{ marginBottom: 20 }}>
                <Grid item xs={3}>
                  <TextField
                    error={this.state.errors.email ? true : false}
                    label="Email"
                    name="email"
                    autoComplete="username"
                    style={{ width: '100%' }}
                    placeholder="Email"
                    value={this.state.email}
                    helperText={this.state.errors.email ? this.state.errors.email : ' '}
                    variant="outlined"
                    onChange={(e) => this.handleChange(e)}
                  />
                </Grid>

                <Grid item xs={3}>
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
              </Grid>

              { this.state.responseMsg &&
                <Alert severity='error' style={{ marginTop: 20, marginBottom: 30 }}>
                  { this.state.responseMsg }
                </Alert>
              }
            </Paper>

            <ButtonGroup variant="contained" color="secondary">
              <Button type="submit">
                Login
              </Button>
              <Button>
                <Link to="/registration" style={{ color: '#fff' }}>
                Registration
                </Link>
              </Button>
            </ButtonGroup>
          </form>
        </Container>
      </>
    );
  }
}

export default LoginPage;