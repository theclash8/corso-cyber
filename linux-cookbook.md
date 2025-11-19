# Linux Cookbook

```
ls = list
mkdir = create directory
cp = copy files
mv = move/rename
rm = remove
rmdir = remove directory
cat = print file content
echo = print to output
> = output redirection
>> = output redirect (append)


scp = secure copy
ssh = secure shell

whereis = mostra il path di un binario

ifconfig = set network interface
route = set routing table

env = print os env
history = list last commands

free = print ram usage
file = print file type

cat access.log | awk {'print $1'} | sort -n | uniq -c | sort -n

TOTAL=$(free -m | grep "Mem" | awk {'print $2'})
FREE=$(free -m | grep "Mem" | awk {'print $7'})
limite=$(( $TOTAL*80/100 ))
if [ "$FREE" -gt "$limite" ]; then
	echo "RAM OK - $FREE mbyte liberi"; else
	echo "RAM KO - $FREE mbyte liberi"; 
fi
```
