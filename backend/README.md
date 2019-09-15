# BYOMUG server

## Heroku git location:

https://git.heroku.com/byomug.git

## Heroku deploy location:

https://byomug.herokuapp.com/

## API:

- POST: `https://byomug.herokuapp.com/users/register`
  - `new_user <JSON>`

Function allows to register new user. Data is providd via `new_user` JSON:

1. Regular user:

```
{
	"name": "dimko",
	"password": "123321"
}
```

2. Host user:

```
{
	"username": "Caffe Nero 1",
	"name": "Caffe Nero",
	"password": "123321",
	"location": { "coordinates": [52.157802, 21.032832] },
	"isHost": true
}
```

After successful registration returns info about newly created user as JSON:

```
{
    "location": {
        "coordinates": [
            52.157802,
            21.032832
        ]
    },
    "isHost": true,
    "_id": "5d7db2ba3fe83300175bdf34",
    "username": "Caffe Nero 1",
    "name": "Caffe Nero",
    "referals": [],
    "__v": 0
}
```

- POST: `https://byomug.herokuapp.com/users/authenticate`
  - `user_info <JSON>`

Function authenticates requested user (info provided in `user_info` JSON):

```
{
	"name": "dimko",
	"password": "123321"
}
```

After successful authentification returns info about requested user as JSON:

```
{
    "location": {
        "coordinates": []
    },
    "isHost": false,
    "_id": "5d7db13591d1bbe6d9b9a3d6",
    "username": "akostenich@pochta.com",
    "name": "Anton",
    "referals": [],
    "__v": 0,
    "id": "5d7db13591d1bbe6d9b9a3d6"
}
```

- GET: `https://byomug.herokuapp.com/users/<user_id>`

Returns full info about requested user as JSON:

```
{
    "location": {
        "coordinates": []
    },
    "isHost": false,
    "_id": "5d7db13591d1bbe6d9b9a3d6",
    "username": "akostenich@pochta.com",
    "name": "Anton",
    "referals": [],
    "__v": 0,
    "id": "5d7db13591d1bbe6d9b9a3d6"
}
```

- GET: `https://byomug.herokuapp.com/users/hosts`

Returns all host users as JSON:

```
[
    {
        "location": {
            "coordinates": [
                52.235547,
                20.957479
            ]
        },
        "isHost": true,
        "_id": "5d7dad7f777dd1e60646fa30",
        "username": "Costa Coffee 1",
        "name": "Costa Coffee",
        "referals": [],
        "__v": 0,
        "id": "5d7dad7f777dd1e60646fa30"
    }
]
```

- GET: `https://byomug.herokuapp.com/users/<user_id>/summary`

Returns current summary stats for requested user as JSON:

```
{
    "cups": 10,
    "weight": 180
}
```

- POST: `https://byomug.herokuapp.com/users/scan`
  - `scan_info <JSON>`

Allows host user to "scan" regular user's QR code, i.e. give it some score. `scan_info`
allows to make correlation between host user and regular user and is represented as JSON:

```
{
	"hostId": "5d7dad7f777dd1e60646fa30",
	"userId": "5d7db12e91d1bbe6d9b9a3d5"
}
```

Returns JSON as result:

```
{
    "name": "Anton",
    "score": 2
}
```
