Poloniex Order
====

- Stop-Limit-Order script for [Poloniex](https://poloniex.com/)
- Place and order when the price exceeds the threshold price.
- notification feature is work on macos.

## Demo

```
% bundle exec ruby main.rb
2017-06-12 10:15:54 +0900	37040.6399988976
2017-06-12 10:16:55 +0900	37061.8192184032
2017-06-12 10:17:55 +0900	36930.446301902404
2017-06-12 10:18:56 +0900	37061.8192184032
2017-06-12 10:19:57 +0900	37061.8193088
2017-06-12 10:20:58 +0900	37095.7599988976
2017-06-12 10:21:59 +0900	37061.8192184032
2017-06-12 10:23:00 +0900	37061.8192184032
...
```


## Requirement

- ruby >=2.3

## Usage

```
% cp .env.default .env
% vi .env
% bundle exec ruby main.rb
```

![image](https://user-images.githubusercontent.com/98103/27016403-6dd877dc-4f5a-11e7-9491-382e9101de19.png)


## Install

```
% bundle
```

## Contribution

- Feel free to send pull request.

## Author

[matsubo](https://github.com/matsubo)
