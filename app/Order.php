<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    /* Add the fillable property into the Orders Model */
    protected $fillable = ['user_id', 'products', 'user_data', 'email', 'phone', 'address', 'order_comments', 'currency', 'price'];
}
