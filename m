From: idosch at idosch.org (Ido Schimmel)
Date: Thu, 1 Mar 2018 21:49:28 +0200
Subject: [PATCH net-next 4/5] selftests: forwarding: Use PING6 instead of
 ping for ipv6 multipath test
In-Reply-To: <f19c8295-74c0-8632-2ee2-cb90f71ea94d@gmail.com>
References: <20180301190947.7299-1-dsahern@gmail.com>
 <20180301190947.7299-5-dsahern@gmail.com>
 <20180301193938.GD4839@splinter>
 <f19c8295-74c0-8632-2ee2-cb90f71ea94d@gmail.com>
Message-ID: <20180301194928.GA7501@splinter>

On Thu, Mar 01, 2018 at 12:43:42PM -0700, David Ahern wrote:
> On 3/1/18 12:39 PM, Ido Schimmel wrote:
> > On Thu, Mar 01, 2018 at 11:09:46AM -0800, David Ahern wrote:
> >> On Debian jessie ping can not handle IPv6 addresses so the command
> >> fails. Use PING6 which is set to ping6.
> >>
> >> Signed-off-by: David Ahern <dsahern at gmail.com>
> > 
> > Yep, I forgot to replace that one.
> > 
> > Reviewed-by: Ido Schimmel <idosch at mellanox.com>
> > 
> > BTW, I have a patch to convert the IPv6 multipath test to use mz. I'm
> > waiting for your L4 hash patches to be accepted :)
> > 
> 
> Can you forward it? That is what is driving this series.

Feel free to submit with your patches (sorry about the spaces!):

diff --git a/tools/testing/selftests/net/forwarding/router_multipath.sh b/tools/testing/selftests/net/forwarding/router_multipath.sh
index d31888e3133e..3ebd9cca06d0 100755
--- a/tools/testing/selftests/net/forwarding/router_multipath.sh
+++ b/tools/testing/selftests/net/forwarding/router_multipath.sh
@@ -232,7 +232,10 @@ multipath6_test()
        local weight_rp13=$2
        local t0_rp12 t0_rp13 t1_rp12 t1_rp13
        local packets_rp12 packets_rp13
+       local hash_policy
 
+       hash_policy=$(sysctl -n net.ipv6.fib_multipath_hash_policy)
+       sysctl -q -w net.ipv6.fib_multipath_hash_policy=1
        ip route replace 2001:db8:2::/64 vrf vrf-r1 \
 	       nexthop via fe80:2::22 dev $rp12 weight $weight_rp12 \
 	       nexthop via fe80:3::23 dev $rp13 weight $weight_rp13
@@ -240,10 +243,8 @@ multipath6_test()
        t0_rp12=$(link_stats_tx_packets_get $rp12)
        t0_rp13=$(link_stats_tx_packets_get $rp13)
 
-       # Generate 16384 echo requests, each with a random flow label.
-       for _ in $(seq 1 16384); do
-	       ip vrf exec vrf-h1 ping 2001:db8:2::2 -F 0 -c 1 -q &> /dev/null
-       done
+       $MZ $h1 -6 -q -p 64 -A 2001:db8:1::2 -B 2001:db8:2::2 -d 1msec \
+	       -t udp "sp=1024,dp=0-32768"
 
        t1_rp12=$(link_stats_tx_packets_get $rp12)
        t1_rp13=$(link_stats_tx_packets_get $rp13)
@@ -255,6 +256,7 @@ multipath6_test()
        ip route replace 2001:db8:2::/64 vrf vrf-r1 \
 	       nexthop via fe80:2::22 dev $rp12 \
 	       nexthop via fe80:3::23 dev $rp13
+       sysctl -q -w net.ipv6.fib_multipath_hash_policy=$hash_policy
 }
 
 multipath_test()

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
