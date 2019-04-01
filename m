From: jeffrin at rajagiritech.edu.in (Jeffrin Thalakkottoor)
Date: Tue, 2 Apr 2019 01:03:42 +0530
Subject: about selftests/netfilter test related issue
Message-ID: <CAG=yYw=VMJ5vK9aXcZ7AgC7f_dx+5ebKgwz68mV3=m6pOA_syA@mail.gmail.com>

hello
i think the script nft_nat.sh  is assuming devices eth0 and eth1
which may not be the case always. my suggestion is why not give the needed
network devices as arguments to the script. iam showing related
command line sessions below and error related file is attached.
---------------------------x-------------x----------------------------
$ip link
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN
mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: eth0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast
state DOWN mode DEFAULT group default qlen 1000
    link/ether 70:5a:0f:b9:d8:5c brd ff:ff:ff:ff:ff:ff
3: wlp2s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state
UP mode DORMANT group default qlen 1000
    link/ether 68:14:01:07:36:1f brd ff:ff:ff:ff:ff:ff
$
------------------------x-----------x---------------------------------------
$sudo ./nft_nat.sh 2> error-related.txt
ERROR: ping failed
SKIP: Could not add add ip6 dnat hook
ERROR: canot ping ns1 from ns2
ERROR: cannot ping ns1 from ns2 with active ip masquerading
ERROR: cannot ping ns1 from ns2 via ipv6
ERROR: cannot ping ns1 from ns2
ERROR: cannot ping ns1 from ns2 with active ip redirect
ERROR: cannnot ping ns1 from ns2 via ipv6
ERROR: cannot ping ns1 from ns2 with active ip6 redirect
-------------------------x---------------------------x------------------------------------

a file is attached which shows the contents of error-related.txt

/Jeffrin
-- 
software engineer
rajagiri school of engineering and technology
-------------- next part --------------
Error: Unknown device type.
Error: Unknown device type.
Cannot find device "veth0"
Cannot find device "veth0"
Cannot find device "veth0"
Cannot find device "veth1"
Cannot find device "veth1"
Cannot find device "veth1"
Cannot find device "eth0"
Cannot find device "eth0"
Error: Nexthop has invalid gateway.
Cannot find device "eth0"
RTNETLINK answers: No route to host
Cannot find device "eth0"
Cannot find device "eth0"
Error: Nexthop has invalid gateway.
Cannot find device "eth0"
RTNETLINK answers: No route to host
connect: Network is unreachable
ERROR: Could not reach other namespace(s)
connect: Network is unreachable
ERROR: Could not reach other namespace(s) via ipv6
ERROR: ns0in counter in ns1 has unexpected value (expected packets 1 bytes 84)
table inet filter {
	counter ns0in {
		packets 0 bytes 0
	}
}
ERROR: ns0out counter in ns1 has unexpected value (expected packets 1 bytes 84)
table inet filter {
	counter ns0out {
		packets 0 bytes 0
	}
}
ERROR: ns0in6 counter in ns1 has unexpected value (expected packets 1 bytes 104)
table inet filter {
	counter ns0in6 {
		packets 0 bytes 0
	}
}
ERROR: ns0out6 counter in ns1 has unexpected value (expected packets 1 bytes 104)
table inet filter {
	counter ns0out6 {
		packets 0 bytes 0
	}
}
ERROR: ns1in counter in ns0 has unexpected value (expected packets 1 bytes 84)
table inet filter {
	counter ns1in {
		packets 0 bytes 0
	}
}
ERROR: ns1 counter in ns0 has unexpected value (expected packets 1 bytes 104)
Error: Could not process rule: No such file or directory
list counter inet filter ns1
                         ^^^
ERROR: ns1out counter in ns0 has unexpected value (expected packets 1 bytes 84)
table inet filter {
	counter ns1out {
		packets 0 bytes 0
	}
}
ERROR: ns1 counter in ns0 has unexpected value (expected packets 1 bytes 104)
Error: Could not process rule: No such file or directory
list counter inet filter ns1
                         ^^^
connect: Network is unreachable
ERROR: Could not reach other namespace(s)
connect: Network is unreachable
ERROR: Could not reach other namespace(s) via ipv6
ERROR: ns0in counter in ns2 has unexpected value (expected packets 1 bytes 84)
table inet filter {
	counter ns0in {
		packets 0 bytes 0
	}
}
ERROR: ns0out counter in ns2 has unexpected value (expected packets 1 bytes 84)
table inet filter {
	counter ns0out {
		packets 0 bytes 0
	}
}
ERROR: ns0in6 counter in ns2 has unexpected value (expected packets 1 bytes 104)
table inet filter {
	counter ns0in6 {
		packets 0 bytes 0
	}
}
ERROR: ns0out6 counter in ns2 has unexpected value (expected packets 1 bytes 104)
table inet filter {
	counter ns0out6 {
		packets 0 bytes 0
	}
}
ERROR: ns2in counter in ns0 has unexpected value (expected packets 1 bytes 84)
table inet filter {
	counter ns2in {
		packets 0 bytes 0
	}
}
ERROR: ns2 counter in ns0 has unexpected value (expected packets 1 bytes 104)
Error: Could not process rule: No such file or directory
list counter inet filter ns2
                         ^^^
ERROR: ns2out counter in ns0 has unexpected value (expected packets 1 bytes 84)
table inet filter {
	counter ns2out {
		packets 0 bytes 0
	}
}
ERROR: ns2 counter in ns0 has unexpected value (expected packets 1 bytes 104)
Error: Could not process rule: No such file or directory
list counter inet filter ns2
                         ^^^
/dev/stdin:2:15-20: Error: Could not process rule: No such file or directory
	chain output {
	             ^^^^^^
/dev/stdin:4:17-52: Error: Could not process rule: No such file or directory
		ip daddr 10.0.1.99 dnat to 10.0.2.99
		              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
connect: Network is unreachable
/dev/stdin:2:15-20: Error: Could not process rule: No such file or directory
	chain output {
	             ^^^^^^
/dev/stdin:4:17-55: Error: Could not process rule: No such file or directory
		ip6 daddr dead:1::99 dnat to dead:2::99
		              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
sysctl: cannot stat /proc/sys/net/ipv4/conf/veth0/forwarding: No such file or directory
sysctl: cannot stat /proc/sys/net/ipv4/conf/veth1/forwarding: No such file or directory
connect: Network is unreachable
ERROR: ns2in counter in ns1 has unexpected value (expected packets 1 bytes 84)
table inet filter {
	counter ns2in {
		packets 0 bytes 0
	}
}
ERROR: ns1in counter in ns2 has unexpected value (expected packets 1 bytes 84)
table inet filter {
	counter ns1in {
		packets 0 bytes 0
	}
}
ERROR: ns2out counter in ns1 has unexpected value (expected packets 1 bytes 84)
table inet filter {
	counter ns2out {
		packets 0 bytes 0
	}
}
ERROR: ns1out counter in ns2 has unexpected value (expected packets 1 bytes 84)
table inet filter {
	counter ns1out {
		packets 0 bytes 0
	}
}
/dev/stdin:4:26-30: Error: Interface does not exist
		meta oif veth0 masquerade
		                       ^^^^^
connect: Network is unreachable
ERROR: ns0in counter in ns1 has unexpected value (expected packets 1 bytes 84)
table inet filter {
	counter ns0in {
		packets 0 bytes 0
	}
}
ERROR: ns1in counter in ns2 has unexpected value (expected packets 1 bytes 84)
table inet filter {
	counter ns1in {
		packets 0 bytes 0
	}
}
ERROR: ns0out counter in ns1 has unexpected value (expected packets 1 bytes 84)
table inet filter {
	counter ns0out {
		packets 0 bytes 0
	}
}
ERROR: ns1out counter in ns2 has unexpected value (expected packets 1 bytes 84)
table inet filter {
	counter ns1out {
		packets 0 bytes 0
	}
}
Error: Could not process rule: No such file or directory
flush chain ip nat postrouting
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
ERROR: Could not flush nat postrouting
connect: Network is unreachable
sysctl: cannot stat /proc/sys/net/ipv4/conf/veth0/forwarding: No such file or directory
sysctl: cannot stat /proc/sys/net/ipv4/conf/veth1/forwarding: No such file or directory
connect: Network is unreachable
ERROR: ns2in counter in ns1 has unexpected value (expected packets 1 bytes 84)
table inet filter {
	counter ns2in {
		packets 0 bytes 0
	}
}
ERROR: ns1in counter in ns2 has unexpected value (expected packets 1 bytes 84)
table inet filter {
	counter ns1in {
		packets 0 bytes 0
	}
}
ERROR: ns2out counter in ns1 has unexpected value (expected packets 1 bytes 84)
table inet filter {
	counter ns2out {
		packets 0 bytes 0
	}
}
ERROR: ns1out counter in ns2 has unexpected value (expected packets 1 bytes 84)
table inet filter {
	counter ns1out {
		packets 0 bytes 0
	}
}
/dev/stdin:4:26-30: Error: Interface does not exist
		meta iif veth1 ip protocol icmp ip saddr 10.0.2.99 ip daddr 10.0.1.99 redirect
		                       ^^^^^
connect: Network is unreachable
ERROR: ns0in counter in ns1 has unexpected value (expected packets 1 bytes 84)
table inet filter {
	counter ns0in {
		packets 0 bytes 0
	}
}
ERROR: ns0out counter in ns1 has unexpected value (expected packets 1 bytes 84)
table inet filter {
	counter ns0out {
		packets 0 bytes 0
	}
}
Error: Could not process rule: No such file or directory
delete table ip nat
^^^^^^^^^^^^^^^^^^^^
ERROR: Could not delete nat table
connect: Network is unreachable
ERROR: ns2in6 counter in ns1 has unexpected value (expected packets 1 bytes 104)
table inet filter {
	counter ns2in6 {
		packets 0 bytes 0
	}
}
ERROR: ns1in6 counter in ns2 has unexpected value (expected packets 1 bytes 104)
table inet filter {
	counter ns1in6 {
		packets 0 bytes 0
	}
}
ERROR: ns2out6 counter in ns1 has unexpected value (expected packets 1 bytes 104)
table inet filter {
	counter ns2out6 {
		packets 0 bytes 0
	}
}
ERROR: ns1out6 counter in ns2 has unexpected value (expected packets 1 bytes 104)
table inet filter {
	counter ns1out6 {
		packets 0 bytes 0
	}
}
/dev/stdin:4:26-30: Error: Interface does not exist
		meta iif veth1 meta l4proto icmpv6 ip6 saddr dead:2::99 ip6 daddr dead:1::99 redirect
		                       ^^^^^
connect: Network is unreachable
ERROR: ns0in6 counter in ns1 has unexpected value (expected packets 1 bytes 104)
table inet filter {
	counter ns0in6 {
		packets 0 bytes 0
	}
}
ERROR: ns0out6 counter in ns1 has unexpected value (expected packets 1 bytes 104)
table inet filter {
	counter ns0out6 {
		packets 0 bytes 0
	}
}
Error: Could not process rule: No such file or directory
delete table ip6 nat
^^^^^^^^^^^^^^^^^^^^^
ERROR: Could not delete ip6 nat table
