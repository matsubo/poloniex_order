require 'rubygems'
require 'bundler/setup'

Bundler.require(:default)
Dotenv.load

Poloniex.setup do |config|
  config.key = ENV['POLONIEX_KEY']
  config.secret = ENV['POLONIEX_SECRET']
end

check_currency_pair = 'USDT_BTC'
sell_currency_pair = 'ETH_BTC'

usd_jpy = 109.532


ticker = Poloniex.ticker
usdt_btc = JSON.parse(ticker)[check_currency_pair]['last']



sum_usd = 0
JSON.parse(Poloniex.complete_balances).each do |key, value|
  # puts key + ' ' + value.to_s
  next if value['btcValue'].to_f == 0.0

  puts key.colorize(color: :yellow, background: :blue)

  usd = value['btcValue'].to_f * usdt_btc.to_f

  puts '  ' + ((usd * usd_jpy).to_s + ' JPY').colorize(:green)
  puts '  ' + ((value['btcValue']).to_s + ' BTC').colorize(:green)

  sum_usd += usd

  puts ""

end



puts ('Sum').to_s.colorize(color: :green, background: :blue)
puts '  ' + ((sum_usd * usd_jpy).round.to_s + ' JPY').colorize(:green)
puts '  ' + (sum_usd.round(2).to_s + ' USD').colorize(:green)



