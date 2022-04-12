# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    tester.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gneve <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/12 10:02:32 by gneve             #+#    #+#              #
#    Updated: 2022/04/12 10:22:37 by gneve            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

mkdir -p testcase
mkdir -p log
mkdir -p webservoftest
cp package.json webservoftest/
cp webserv.js webservoftest/
TESTNUMBER=$2
TESTNUMB= expr TESTNUMBER
i=0
while True
do 
	head -c 10000000 /dev/random | base64 | head -c 10 >> testcase/encoded"$i".html
	echo $(curl -s -o /dev/null -w '%{content_type}' $1 + "encoded$i.html") >> log/testn"$i".log
	echo $(curl -s -o /dev/null -w "%{time_total}\n" -H "Pragma: no-cache" $1 + "encoded$i.html") >> log/loadtimen"$i".log
	echo $(curl -s  $1 + "encoded$i.html") | wc -c >> log/contentln"$i".log
#	echo $(curl -s -o /dev/null -w '%{content_type}' $site + encoded) >> log/test"$i".log
#	echo $(curl -s -o /dev/null -w '%{time_total}\n' -H "Pragma: no-cache" $site) >> log/loadtime"$i".log
#	echo $(curl -s $site) | wc -c >> log/contentl"$i".log
	((i=i+1))
done
