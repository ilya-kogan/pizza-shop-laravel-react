<img src="https://pizza-shop-laravel-react.herokuapp.com/img/logo.png" width="128" height="128">
<h1>Pizza Shop</h1>

## About Project
The project is developed using Laravel and ReactJS.
This is a small online pizza shop.

## Features
- Login and Registration options
- Listory of orders for logged users
- Form validations
- Сurrency switch

## Laravel PHP API
| Command | Description |
| --- | --- |
| `GET` `/api/products` | List of all products |
| `GET` `/api/user` | Get current user data |
| `GET` `/api/orders` | List of all current user orders |
| `POST` `/api/login` | Login (`email`, `password`) |
| `POST` `/api/register` | Register (`First Name`, `Last Name`, `Email`, `Password`) |
| `POST` `/api/orders` | Create a new Order (`User Id`, `First Name`, `Last Name`, `Email`, `Address`, `Phone`, `cartItems`) |

## License
Open-source software licensed under the [MIT license](https://opensource.org/licenses/MIT).
