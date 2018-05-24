cat seq.txt
echo "--------"
sort seq.txt
echo "---------"
sort seq.txt > result
echo "---------"
sort -u seq.txt
echo "--------"
sort -r seq.txt
echo "--------"
sort seq.txt -o seq.txt


echo "~~~~~~~~~~"
sort number.txt
echo "~~~~~~~~~~~~~"
sort -n number.txt

echo "~~~~~~~~~~~~"
cat fruit.txt
echo "~~~~~~~~~~~~"
sort -n -k 2 -t ':' fruit.txt
