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

loop do
  ticker = Poloniex.ticker
  usdt_btc = JSON.parse(ticker)[check_currency_pair]['last']

  jpy_btc = usdt_btc.to_f * usd_jpy

  puts Time.now.to_s + "\t" + jpy_btc.to_s

  if jpy_btc > 38_000
    contents = jpy_btc
    title = 'Rate alert'
    system('osascript -e \'display notification "%s" with title "%s" \'' % %w[contents title])

    # execute order
    sleep 60
    rate = JSON.parse(ticker)['BTC_ETH']['lowestAsk'].to_f * 1.01
    Poloniex.sell(sell_currency_pair, rate, sell_amount)

    contents = rate
    title = 'Placed and selling order'
    system('osascript -e \'display notification "%s" with title "%s" \'' % %w[contents title])

    break
  end

  sleep 60
end
