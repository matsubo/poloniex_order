require 'rubygems'
require 'bundler/setup'

Bundler.require(:default)
Dotenv.load

Poloniex.setup do |config|
  config.key = ENV['POLONIEX_KEY']
  config.secret = ENV['POLONIEX_SECRET']
end

check_currency_pair = 'USDT_ETH'
sell_currency_pair = 'ETH_BTC'

usd_jpy = 110.24

sell_amount = 0.1

last_jpy_btc = nil

loop do
  ticker = Poloniex.ticker
  usdt_btc = JSON.parse(ticker)[check_currency_pair]['last']

  jpy_btc = usdt_btc.to_f * usd_jpy

  color = if last_jpy_btc == nil || jpy_btc == last_jpy_btc
    :light_cyan
    elsif jpy_btc < last_jpy_btc
    :red
  else
    :green
  end

  percentile = (((jpy_btc / last_jpy_btc)  - 1) * 100) rescue 0

  puts Time.now.to_s + "\t" + (jpy_btc.round(5).to_s + "\t" + percentile.round(3).to_s + '%').colorize(color)

  if jpy_btc > 38_000
    contents = jpy_btc
    title = 'Rate alert'
    system('osascript -e \'display notification "%s" with title "%s" \'' % [contents, title])
 
    # execute order
    sleep 60
    rate = JSON.parse(ticker)['BTC_ETH']['lowestAsk'].to_f * 1.01
    Poloniex.sell(sell_currency_pair, rate, sell_amount)

    contents = rate
    title = 'Placed and selling order'
    system('osascript -e \'display notification "%s" with title "%s" \'' % [contents, title])

    break
  end

  last_jpy_btc = jpy_btc

  sleep 60
end
