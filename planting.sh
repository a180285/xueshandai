liping=$(($RANDOM % 3 + 1))

result=`curl -s "https://m.xueshandai.com/lottery/tree-planting-lottery?liping=$liping"`

echo $result | awk -F '"' '{
  key_name = $10;
  key = $12;
  hdtype = $18;
  price = $6
  if (key_name == "key") {
    print "----------------------------------------"
    print "price =", price;
    printf("https://m.xueshandai.com/login/auth?redirect=/lottery/tree-planting-day&hdtype=%s&key=%s\n",
      hdtype, key);
  }
}'

