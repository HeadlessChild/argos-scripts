# BTC => USD

# API Variables
PRICE=$(curl -s https://api.coinmarketcap.com/v1/ticker/bitcoin/?convert=USD | jq -r '.[0].price_usd')
CHANGE_1H=$(curl -s https://api.coinmarketcap.com/v1/ticker/bitcoin/?convert=USD | jq -r '.[0].percent_change_1h')
CHANGE_24H=$(curl -s https://api.coinmarketcap.com/v1/ticker/bitcoin/?convert=USD | jq -r '.[0].percent_change_24h')
CHANGE_7D=$(curl -s https://api.coinmarketcap.com/v1/ticker/bitcoin/?convert=USD | jq -r '.[0].percent_change_7d')

# Main Title
if [ $(echo $CHANGE_1H'>='0 | bc -l) -eq 1 ]; then
	echo "BTC: <span color='#01941B'><tt>+${CHANGE_1H}%</tt></span>"
else
	echo "BTC: <span color='#FD0101'><tt>${CHANGE_1H}</tt></span>"
fi

# Sub titles
echo "---"
echo "Price in USD"
echo "<span color='#9A2EFE'><tt>${PRICE}</tt></span>"
echo "---"
echo "Change 24h"
if [ $(echo $CHANGE_24H'>='0 | bc -l) -eq 1 ]; then
	echo "<span color='#01941B'><tt>+${CHANGE_24H}%</tt></span>"
else
	echo "<span color='#FD0101'><tt>${CHANGE_24H}</tt></span>"
fi
echo "---"
echo "Change 7 days"
if [ $(echo $CHANGE_7D'>='0 | bc -l) -eq 1 ]; then
	echo "<span color='#01941B'><tt>+${CHANGE_7D}%</tt></span>"
else
	echo "<span color='#FD0101'><tt>${CHANGE_7D}</tt></span>"
fi
