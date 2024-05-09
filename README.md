# API WRAPPER

An sample application that consumes the [rawg api](https://api.rawg.io/docs/) and makes all of the endpoints (free-tier) available. The application itself showcases an application of the `games` endpoints, it's different filters and suffixes.

## Application Usage
1. Install dependencies
```
bundle install && yarn install
```

3. Set the environment variables:
```
RAWG_BASE_URL: https://api.rawg.io/api
RAWG_API_KEY: <create a developer account at [rawg]([url](https://rawg.io/))> 
```
4. Run the application
`bin/rails s`

## Api Usage

1. Initiate the rawg api client
```
@client ||= Rawg::Api::V2::Client.new
```

#### Get a list of games
```
@client.games
@client.games(metacritic: '80,100') # gets a list of games with a metacritic score between 80 to 100
```

#### Get details of the game 
```
@client.games(1)
```

#### Get a list of game trailers
```
@client.games(1, 'movies')
```

#### Get a list of DLC's for the game, GOTY and other editions, companion apps, etc.
```
@client.games(1, 'additions')
```

#### Get a lit of individual creators that were part of the development team
```
@client.games(1, 'development-team')
```

#### Get a list of parent games for DLC's and editions
```
@client.games(1, 'parent-games')
```

#### Get screenshots for the game
```
@client.games(1, 'screenshots')
```

#### Get links to the stores that sell the game
```
@client.games(1, 'stores')
```

#### Get a list of game achievements
```
@client.games(1, 'achivements')
```

#### Get a list of game trailers
```
@client.games(1, 'trailers')
```

#### Get a list of most recent posts from the game's subreddit
```
@client.games(1, 'reddit')
```

### Other available endpoints:
1. Creator roles
2. Developers
3. Publishers
4. Platforms
5. Creators
6. Genres
7. Stores
8. Tags

