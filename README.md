Poloniex Order
====

- main.rb
  - Stop-Limit-Order script for [Poloniex](https://poloniex.com/)
  - Place and order when the price exceeds the threshold price.
  - notification feature is work on macos.
- balance.rb
  - print total balance in JPY and USD.


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




```
% bundle exec ruby balance.rb
BTC
  1915420.2100013432 JPY
  4.27600000 BTC

ETH
  3314574.693340411 JPY
  7.39948410 BTC

Sum
  5229995 JPY
  47748.56 USD
```



## Requirement

- ruby >=2.3
- bundler



## Install

```
% bundle
```

## Usage

```
% cp .env.default .env
% vi .env
% bundle exec ruby main.rb
```

![image](https://user-images.githubusercontent.com/98103/27017103-d5095862-4f60-11e7-90bd-dbcbae55db43.png)



## Contribution

- Feel free to send pull request.

## Author

[matsubo](https://github.com/matsubo)
