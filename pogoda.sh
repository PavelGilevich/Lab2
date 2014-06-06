. $PWD/weather.cfg
export LANG="ru_RU.CP1251"
while true
do
curl -s http://www.pogoda.by > minsk
iconv -f cp1251 -t utf8 minsk > newfile
grep -o '<br>Температура воздуха .*°C<br>' newfile > temp
echo "Current weather in Minsk: " $(sed 's/[^\-\+0-9.0-9]//g' temp)
rm -r temp minsk newfile
sleep $sleep_time
done
