From: dsahern@gmail.com (David Ahern)
Date: Wed, 17 Jan 2018 16:15:04 -0800
Subject: [Linux-kselftest-mirror] [RFC PATCH net-next 02/12] selftests:
 forwarding: Add a test for FDB learning
In-Reply-To: <20180117233124.GA26967@nanopsycho>
References: <20180115191853.26129-1-idosch@mellanox.com>
 <20180115191853.26129-3-idosch@mellanox.com>
 <33d3f4a4-8b92-60da-3e1f-327effb7eda0@gmail.com>
 <20180117210137.GJ2114@nanopsycho>
 <CAJieiUh_jgxof2J3vqeyXUbQpNtha+1qtfo2Y9JTq3rz0+XXuw@mail.gmail.com>
 <CAJieiUiB14Js0hTk7E_4+AmyAZbjHTCE_MWpU-=7FbMsjvHB2w@mail.gmail.com>
 <20180117233124.GA26967@nanopsycho>
Message-ID: <9e1bfed9-34a3-5810-230e-0bef75a43fb9@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180118001504.K4n-pvbUTTVeRoGn2zDpc6Q0QkuhBeJGbXtAmeL7dAk@z>

On 1/17/18 3:31 PM, Jiri Pirko wrote:
> Wed, Jan 17, 2018@11:59:10PM CET, roopa@cumulusnetworks.com wrote:
>> On Wed, Jan 17, 2018@2:46 PM, Roopa Prabhu <roopa@cumulusnetworks.com> wrote:
>>> On Wed, Jan 17, 2018@1:01 PM, Jiri Pirko <jiri@resnulli.us> wrote:
>>>> Wed, Jan 17, 2018@09:48:54PM CET, dsahern@gmail.com wrote:
>>>>> On 1/15/18 11:18 AM, Ido Schimmel wrote:
>>>>>> diff --git a/tools/testing/selftests/forwarding/lib.sh b/tools/testing/selftests/forwarding/lib.sh
>>>>>> index bb423371f4de..264bf0af4c4d 100644
>>>>>> --- a/tools/testing/selftests/forwarding/lib.sh
>>>>>> +++ b/tools/testing/selftests/forwarding/lib.sh
>>>>>> @@ -22,6 +22,11 @@ if [[ ! -x "$(command -v jq)" ]]; then
>>>>>>      exit 0
>>>>>>  fi
>>>>>>
>>>>>> +if [[ ! -x "$(command -v mausezahn)" ]]; then
>>>>>> +    echo "SKIP: mausezahn not installed"
>>>>>> +    exit 0
>>>>>> +fi
>>>>>> +
>>>>>
>>>>> The checks are good, but hitting a collision with this one:
>>>>> $   ./router.sh
>>>>> SKIP: mausezahn not installed
>>>>>
>>>>> For debian, it is mz not mausezahn.
>>>>
>>>> That is weird. If you look at the sources, the binary name is
>>>> "mausezahn". Looks like debian is doing some renaming :/
>>>>
>>>
>>> I have seen/used both versions. Debian packages from some old upstream
>>> source which calls it mz.
>>> https://packages.debian.org/sid/main/mz
>>>
>>> I have used latest mz (with ipv6 support etc) from netsniff-ng which
>>> builds it as mausezahn.
>>
>>
>> actually Debian also builds
>> https://packages.debian.org/sid/netsniff-ng and installs 'mausezahn'
>>
>> so you might have to check and use which exists... (mausezahn overriding mz).
> 
> I believe we can stick with mausezahn, since it is apparently
> available on Debian too.
> 

How about the attached - make ping, ping6 and mz variables? Default to
ping and mausezahn but let users update that name if necessary. Comments
in the sample config to the effect need to be added to help users.
-------------- next part --------------
diff --git a/tools/testing/selftests/forwarding/bridge.sh b/tools/testing/selftests/forwarding/bridge.sh
index 7ae4f1639c45..6a34489184ea 100755
--- a/tools/testing/selftests/forwarding/bridge.sh
+++ b/tools/testing/selftests/forwarding/bridge.sh
@@ -101,13 +101,13 @@ trap cleanup EXIT
 setup_prepare
 setup_wait
 
-ping_test "vrf-h1" 192.0.2.2
-ping_test "vrf-h1" 2001:db8:1::2
+ping_test ${PING} "vrf-h1" 192.0.2.2
+ping_test ${PING6} "vrf-h1" 2001:db8:1::2
 
 old_mtu=$(mtu_get $h1)
 mtu_change 9000 "${netifs_arr[@]}"
-ping_test "vrf-h1" 192.0.2.2
-ping_test "vrf-h1" 2001:db8:1::2
+ping_test ${PING} "vrf-h1" 192.0.2.2
+ping_test ${PING6} "vrf-h1" 2001:db8:1::2
 mtu_change $old_mtu "${netifs_arr[@]}"
 
 learning_test "br0" $swp1 1 $h1
diff --git a/tools/testing/selftests/forwarding/forwarding.config.sample b/tools/testing/selftests/forwarding/forwarding.config.sample
index f2b14814e4ba..78262e3b7523 100644
--- a/tools/testing/selftests/forwarding/forwarding.config.sample
+++ b/tools/testing/selftests/forwarding/forwarding.config.sample
@@ -17,3 +17,7 @@ declare -A OPTIONS
 
 # Time to wait after interfaces participating in the test are all UP.
 OPTIONS[wait_time]=5
+
+#PING=ping
+#PING6=ping
+#MZ=mausezahn
diff --git a/tools/testing/selftests/forwarding/lib.sh b/tools/testing/selftests/forwarding/lib.sh
index b9b049af93cb..774f5c68ad0b 100644
--- a/tools/testing/selftests/forwarding/lib.sh
+++ b/tools/testing/selftests/forwarding/lib.sh
@@ -22,8 +22,8 @@ if [[ ! -x "$(command -v jq)" ]]; then
 	exit 0
 fi
 
-if [[ ! -x "$(command -v mausezahn)" ]]; then
-	echo "SKIP: mausezahn not installed"
+if [[ ! -x "$(command -v ${MZ})" ]]; then
+	echo "SKIP: ${MZ} not installed"
 	exit 0
 fi
 
@@ -242,12 +242,13 @@ tc_offload_check()
 
 ping_test()
 {
-	local vrf_name=$1
-	local dip=$2
+	local ping=$1
+	local vrf_name=$2
+	local dip=$3
 
 	RET=0
 
-	ip vrf exec $vrf_name ping $dip -c 10 -i 0.1 -w 2 &> /dev/null
+	ip vrf exec $vrf_name $ping $dip -c 10 -i 0.1 -w 2 &> /dev/null
 	check_err $?
 	print_result "ping"
 }
@@ -266,7 +267,7 @@ learning_test()
 		| jq -e '.[] | select(.mac == "de:ad:be:ef:13:37")' &> /dev/null
 	check_fail $? "found FDB record when should not"
 
-	mausezahn $host_if -c 1 -p 64 -a de:ad:be:ef:13:37 -t ip -q
+	${MZ} $host_if -c 1 -p 64 -a de:ad:be:ef:13:37 -t ip -q
 
 	bridge -j fdb show br $bridge brport $br_port vlan $vid \
 		| jq -e '.[] | select(.mac == "de:ad:be:ef:13:37")' &> /dev/null
@@ -283,7 +284,7 @@ learning_test()
 
 	bridge link set dev $br_port learning off
 
-	mausezahn $host_if -c 1 -p 64 -a de:ad:be:ef:13:37 -t ip -q
+	${MZ} $host_if -c 1 -p 64 -a de:ad:be:ef:13:37 -t ip -q
 
 	bridge -j fdb show br $bridge brport $br_port vlan $vid \
 		| jq -e '.[] | select(.mac == "de:ad:be:ef:13:37")' &> /dev/null
@@ -309,7 +310,7 @@ flood_test_do()
 	tc filter add dev $host2_if ingress protocol ip pref 1 handle 101 \
 		flower dst_mac $mac action drop
 
-	mausezahn $host1_if -c 1 -p 64 -b $mac -B $ip -t ip -q
+	${MZ} $host1_if -c 1 -p 64 -b $mac -B $ip -t ip -q
 
 	tc -j -s filter show dev $host2_if ingress \
 		| jq -e ".[] | select(.options.keys.dst_mac == \"$mac\") \
diff --git a/tools/testing/selftests/forwarding/router.sh b/tools/testing/selftests/forwarding/router.sh
index 79ad6cba9118..f660788e4167 100755
--- a/tools/testing/selftests/forwarding/router.sh
+++ b/tools/testing/selftests/forwarding/router.sh
@@ -119,13 +119,13 @@ trap cleanup EXIT
 setup_prepare
 setup_wait
 
-ping_test "vrf-h1" 198.51.100.2
-ping_test "vrf-h1" 2001:db8:2::2
+ping_test ${PING} "vrf-h1" 198.51.100.2
+ping_test ${PING6} "vrf-h1" 2001:db8:2::2
 
 old_mtu=$(mtu_get $h1)
 mtu_change 9000 "${netifs_arr[@]}"
-ping_test "vrf-h1" 198.51.100.2
-ping_test "vrf-h1" 2001:db8:2::2
+ping_test ${PING} "vrf-h1" 198.51.100.2
+ping_test ${PING6} "vrf-h1" 2001:db8:2::2
 mtu_change $old_mtu "${netifs_arr[@]}"
 
 exit $EXIT_STATUS
diff --git a/tools/testing/selftests/forwarding/router_multipath.sh b/tools/testing/selftests/forwarding/router_multipath.sh
index 58f6e75c627e..bea261d66b52 100755
--- a/tools/testing/selftests/forwarding/router_multipath.sh
+++ b/tools/testing/selftests/forwarding/router_multipath.sh
@@ -202,7 +202,7 @@ multipath4_test()
        t0_rp12=$(link_stats_tx_packets_get $rp12)
        t0_rp13=$(link_stats_tx_packets_get $rp13)
 
-       ip vrf exec vrf-h1 mausezahn -q -p 64 -A 192.0.2.2 -B 198.51.100.2 \
+       ip vrf exec vrf-h1 ${MZ} -q -p 64 -A 192.0.2.2 -B 198.51.100.2 \
 	       -d 1msec -t udp "sp=1024,dp=0-32768"
 
        t1_rp12=$(link_stats_tx_packets_get $rp12)
@@ -234,7 +234,7 @@ multipath6_test()
 
        # Generate 16384 echo requests, each with a random flow label.
        for _ in $(seq 1 16384); do
-	       ip vrf exec vrf-h1 ping 2001:db8:2::2 -F 0 -c 1 -q &> /dev/null
+	       ip vrf exec vrf-h1 ${PING6} 2001:db8:2::2 -F 0 -c 1 -q &> /dev/null
        done
 
        t1_rp12=$(link_stats_tx_packets_get $rp12)
@@ -307,13 +307,13 @@ trap cleanup EXIT
 setup_prepare
 setup_wait
 
-ping_test "vrf-h1" 198.51.100.2
-ping_test "vrf-h1" 2001:db8:2::2
+ping_test ${PING} "vrf-h1" 198.51.100.2
+ping_test ${PING6} "vrf-h1" 2001:db8:2::2
 
 old_mtu=$(mtu_get $h1)
 mtu_change 9000 "${netifs_arr[@]}"
-ping_test "vrf-h1" 198.51.100.2
-ping_test "vrf-h1" 2001:db8:2::2
+ping_test ${PING} "vrf-h1" 198.51.100.2
+ping_test ${PING6} "vrf-h1" 2001:db8:2::2
 mtu_change $old_mtu "${netifs_arr[@]}"
 
 multipath_test
diff --git a/tools/testing/selftests/forwarding/tc_flower.sh b/tools/testing/selftests/forwarding/tc_flower.sh
index de825ff2712c..2e5c1f73a117 100755
--- a/tools/testing/selftests/forwarding/tc_flower.sh
+++ b/tools/testing/selftests/forwarding/tc_flower.sh
@@ -71,7 +71,7 @@ match_dst_mac_test()
 	tc filter add dev $h2 ingress protocol ip pref 2 handle 102 flower \
 		$tcflags dst_mac $h2mac action drop
 
-	mausezahn $h1 -c 1 -p 64 -a $h1mac -b $h2mac -A 192.0.2.1 -B 192.0.2.2 \
+	${MZ} $h1 -c 1 -p 64 -a $h1mac -b $h2mac -A 192.0.2.1 -B 192.0.2.2 \
 		-t ip -q
 
 	tc -j -s filter show dev $h2 ingress \
@@ -101,7 +101,7 @@ match_src_mac_test()
 	tc filter add dev $h2 ingress protocol ip pref 2 handle 102 flower \
 		$tcflags src_mac $h1mac action drop
 
-	mausezahn $h1 -c 1 -p 64 -a $h1mac -b $h2mac -A 192.0.2.1 -B 192.0.2.2 \
+	${MZ} $h1 -c 1 -p 64 -a $h1mac -b $h2mac -A 192.0.2.1 -B 192.0.2.2 \
 		-t ip -q
 
 	tc -j -s filter show dev $h2 ingress \
@@ -131,7 +131,7 @@ match_dst_ip_test()
 	tc filter add dev $h2 ingress protocol ip pref 3 handle 103 flower \
 		$tcflags dst_ip 192.0.2.0/24 action drop
 
-	mausezahn $h1 -c 1 -p 64 -a $h1mac -b $h2mac -A 192.0.2.1 -B 192.0.2.2 \
+	${MZ} $h1 -c 1 -p 64 -a $h1mac -b $h2mac -A 192.0.2.1 -B 192.0.2.2 \
 		-t ip -q
 
 	tc -j -s filter show dev $h2 ingress \
@@ -148,7 +148,7 @@ match_dst_ip_test()
 
 	tc filter del dev $h2 ingress protocol ip pref 2 handle 102 flower
 
-	mausezahn $h1 -c 1 -p 64 -a $h1mac -b $h2mac -A 192.0.2.1 -B 192.0.2.2 \
+	${MZ} $h1 -c 1 -p 64 -a $h1mac -b $h2mac -A 192.0.2.1 -B 192.0.2.2 \
 		-t ip -q
 
 	tc -j -s filter show dev $h2 ingress \
@@ -174,7 +174,7 @@ match_src_ip_test()
 	tc filter add dev $h2 ingress protocol ip pref 3 handle 103 flower \
 		$tcflags src_ip 192.0.2.0/24 action drop
 
-	mausezahn $h1 -c 1 -p 64 -a $h1mac -b $h2mac -A 192.0.2.1 -B 192.0.2.2 \
+	${MZ} $h1 -c 1 -p 64 -a $h1mac -b $h2mac -A 192.0.2.1 -B 192.0.2.2 \
 		-t ip -q
 
 	tc -j -s filter show dev $h2 ingress \
@@ -191,7 +191,7 @@ match_src_ip_test()
 
 	tc filter del dev $h2 ingress protocol ip pref 2 handle 102 flower
 
-	mausezahn $h1 -c 1 -p 64 -a $h1mac -b $h2mac -A 192.0.2.1 -B 192.0.2.2 \
+	${MZ} $h1 -c 1 -p 64 -a $h1mac -b $h2mac -A 192.0.2.1 -B 192.0.2.2 \
 		-t ip -q
 
 	tc -j -s filter show dev $h2 ingress \
