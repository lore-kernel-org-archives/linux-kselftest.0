Received: from mail-qv1-f73.google.com (mail-qv1-f73.google.com [209.85.219.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B7A38AC96
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 20:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777579804; cv=none; b=McIp7hb+xKyuY3o1/Nuk0a3CTypBKqgr29cJCa8PKwdKSHIcz1ZSAP+/Vg4uHr6DAXD8Nyii6G/G/Q04VP2QMDEa6AALiBx2y8iPFucmGykefjx65FwYpmaxwi/f6U8gO+SiJul2hbjDYrm/wb+/AfrG9hLv84A5pn2g5gE/uBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777579804; c=relaxed/simple;
	bh=25uK8l6zeHyNQEvdYXtFvnvOLgVvwguj9Xp1gd9LSF8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=S9OVjesT50un6LI/hvWPxPy0GK69s4a6WWnbSJj1IK/DO1XriCsP5wylzyYvwpejA2DoLTU9rFY1HzSK5HRxshN2m2KvAfHjHvpwENWnTDoUqdjFWWRanJp7m+1+OP2AGMjXKrsNwSmzUdMnuKWiOE8y1vwzofA/S3ZU5g6WAkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sharmasagarika.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WcRmo7jU; arc=none smtp.client-ip=209.85.219.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sharmasagarika.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WcRmo7jU"
Received: by mail-qv1-f73.google.com with SMTP id 6a1803df08f44-8acb26fbbb2so22060586d6.2
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 13:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777579801; x=1778184601; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VITGrWKqa7uuy6OpvcFGCq4ihxeDvtVatwX3FxDEXv0=;
        b=WcRmo7jUPuVw7yrKSVKa+J9d+7WWMX2AQJIkrlXQCwNvITtTOzJXj16YOtRnVtpCXY
         QMFOAWDgic4lYbeoN3ydBM0ovG5BH5YcaPzW1Ug5c+nBj2hqO1jYhS6qodmgDCclZPf4
         EcLv3PYcsIcRhOcESEJcmwsfXLGCJGZg6JjSuRfb48Hd1SDy23X/JxSg6IczGWkQhliN
         2IJ4rZLV5DQs4V4T4IW3+8Iozu1husK03JPeTOG7fdZEQF206KbBsY8TqNa9qd2EH+JQ
         wvPh216Hx99yF6+H3H5VS+5GflydDNLc75gP1w9vnKLRH8uTG4oG6cunrT8PINtcJw7l
         /oaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777579801; x=1778184601;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VITGrWKqa7uuy6OpvcFGCq4ihxeDvtVatwX3FxDEXv0=;
        b=sZotf8KzPDaGWWjJ/JvAVYTdksde99LuBah+arMrZgvAPxmDmoBT1TAJcGr4reongD
         aGabVFmY495ApGQVpdNI1BrbUuzj8tiDzxamT/oL4wvHbyhoLVyxZeFIPDCyQKy3RzYY
         4k10qgD7GR+a4YZJo3j6gP83JY9ZsNJoDtuV6w1I9RUImp91Jzyn6fQKl8h3G4D56nTA
         JgU4L4zfvHtD73QEI7uzV0bCK+67tfq2aqZ1lEtsSc354wrkoWiBWF/Fq2Jn6vlQUnjK
         0AFpnngzbHA2U/Ptfj5aQHydX55F8OL8BCxP0ydnAjwlky8GFJfZufCri98xNMWh9XQ5
         SEBw==
X-Forwarded-Encrypted: i=1; AFNElJ+09zxPvcTIBB5odS1FMj3M0hi1twnlmpJSngtPnM5qbIhhlitsdDfc10lLuT/TGinwsh0O2D1Wn7yXZGs3kd4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ0/ytWWQRch7QRcSj+GscWKuFIr9pczWZqSqy40xgJONyUg1M
	9aMmaFZAU3+yAnTdyMGi/pidsQ0cLf7F0JRcW7Xkm+CCBXnPw5H6qY2jafY+eJXSJamerCkWTXp
	qWNx+jpsZ8Yl7NRf2IuIaPHjQYn+4saLC4wlrNw==
X-Received: from qvbmf3.prod.google.com ([2002:a05:6214:5d83:b0:89c:8686:b1a9])
 (user=sharmasagarika job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6214:6103:b0:8a0:6d76:325a with SMTP id 6a1803df08f44-8b3fe73808dmr60695186d6.20.1777579800785;
 Thu, 30 Apr 2026 13:10:00 -0700 (PDT)
Date: Thu, 30 Apr 2026 20:09:01 +0000
In-Reply-To: <20260430200909.527827-1-sharmasagarika@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260430200909.527827-1-sharmasagarika@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260430200909.527827-3-sharmasagarika@google.com>
Subject: [PATCH net v2 2/2] selftest: net: Add test for TCP flow failover with
 ECMP routes.
From: Sagarika Sharma <sharmasagarika@google.com>
To: "David S . Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Sagarika Sharma <sharmasagarika@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Kuniyuki Iwashima <kuniyu@google.com>

Without the previous commit, TCP failed to switch to alternative
IPv6 routes immediately upon carrier loss.

It would persist with the dead route until reaching the threshold
net.ipv4.tcp_retries1, leading to unnecessary delays in failover.

Let's add a selftest for this scenario to ensure TCP fails over
immediately upon a carrier loss event.

Before:
  TEST: TCP IPv4 failover                                             [ OK ]
  TEST: TCP IPv6 failover                                             [FAIL]

After:
  TEST: TCP IPv4 failover                                             [ OK ]
  TEST: TCP IPv6 failover                                             [ OK ]

Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
Signed-off-by: Sagarika Sharma <sharmasagarika@google.com>
---
v2: Add require_command, fix exit code and shellcheck warnings
    except for SC2154 (netns allocation confuses shellcheck),
    lower threshold of packets captured for success.
---
 tools/testing/selftests/net/Makefile          |   1 +
 .../selftests/net/tcp_ecmp_failover.sh        | 216 ++++++++++++++++++
 2 files changed, 217 insertions(+)
 create mode 100755 tools/testing/selftests/net/tcp_ecmp_failover.sh

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index a275ed584026..f3da38c54d27 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -96,6 +96,7 @@ TEST_PROGS := \
 	srv6_hl2encap_red_l2vpn_test.sh \
 	srv6_iptunnel_cache.sh \
 	stress_reuseport_listen.sh \
+	tcp_ecmp_failover.sh \
 	tcp_fastopen_backup_key.sh \
 	test_bpf.sh \
 	test_bridge_backup_port.sh \
diff --git a/tools/testing/selftests/net/tcp_ecmp_failover.sh b/tools/testing/selftests/net/tcp_ecmp_failover.sh
new file mode 100755
index 000000000000..5768aa8bff6a
--- /dev/null
+++ b/tools/testing/selftests/net/tcp_ecmp_failover.sh
@@ -0,0 +1,216 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright 2026 Google LLC.
+#
+# This test verifies TCP flow failover between ECMP routes
+# upon carrier loss on the active device.
+#
+#   socat  ----------------------------->  socat
+#                        |
+#           .-- veth-c1 -|- veth-s1 --.
+#   dummy0 -|            |            |-- dummy0
+#           '-- veth-c2 -|- veth-s2 --'
+#                        |
+#
+
+REQUIRE_JQ=no
+REQUIRE_MZ=no
+NUM_NETIFS=0
+
+source forwarding/lib.sh
+
+CLIENT_IP="10.0.59.1"
+SERVER_IP="10.0.92.1"
+CLIENT_IP6="2001:db8:5a9a::1"
+SERVER_IP6="2001:db8:9292::1"
+
+setup_server()
+{
+	IP="ip -n $server"
+	NS_EXEC="ip netns exec $server"
+
+	$IP link add dummy0 type dummy
+	$IP link set dummy0 up
+
+	$IP -4 addr add $SERVER_IP/32 dev dummy0
+	$IP -6 addr add $SERVER_IP6/128 dev dummy0 nodad
+
+	$IP link set veth-s1 up
+	$IP link set veth-s2 up
+
+	$IP -4 addr add 192.168.1.2/24 dev veth-s1
+	$IP -4 addr add 192.168.2.2/24 dev veth-s2
+
+	$IP -4 route add $CLIENT_IP/32 \
+		nexthop via 192.168.1.1 dev veth-s1 weight 1 \
+		nexthop via 192.168.2.1 dev veth-s2 weight 1
+
+	$IP -6 addr add 2001:db8:1::2/64 dev veth-s1 nodad
+	$IP -6 addr add 2001:db8:2::2/64 dev veth-s2 nodad
+
+	$IP -6 route add $CLIENT_IP6/128 \
+		nexthop via 2001:db8:1::1 dev veth-s1 weight 1 \
+		nexthop via 2001:db8:2::1 dev veth-s2 weight 1
+}
+
+setup_client()
+{
+	IP="ip -n $client"
+	NS_EXEC="ip netns exec $client"
+
+	$IP link add dummy0 type dummy
+	$IP link set dummy0 up
+
+	$IP -4 addr add $CLIENT_IP/32 dev dummy0
+	$IP -6 addr add $CLIENT_IP6/128 dev dummy0 nodad
+
+	$IP link set veth-c1 up
+	$IP link set veth-c2 up
+
+	$IP -4 addr add 192.168.1.1/24 dev veth-c1
+	$IP -4 addr add 192.168.2.1/24 dev veth-c2
+
+	$IP -4 route add $SERVER_IP/32 \
+		nexthop via 192.168.1.2 dev veth-c1 weight 1 \
+		nexthop via 192.168.2.2 dev veth-c2 weight 1
+
+	$IP -6 addr add 2001:db8:1::1/64 dev veth-c1 nodad
+	$IP -6 addr add 2001:db8:2::1/64 dev veth-c2 nodad
+
+	$IP -6 route add $SERVER_IP6/128 \
+		nexthop via 2001:db8:1::2 dev veth-c1 weight 1 \
+		nexthop via 2001:db8:2::2 dev veth-c2 weight 1
+
+	# By default, tcp_retries1=3 triggers a route refresh
+	# after 3 retransmits (~5s).  Ensure this never occurs
+	# for test stability.
+	$NS_EXEC sysctl -qw net.ipv4.tcp_retries1=100
+
+	# When NETDEV_CHANGE is issued for a dev tied to an ECMP
+	# route, RTNH_F_LINKDOWN is flagged and the sernum is
+	# bumped to invalidate the route via sk_dst_check().
+	#
+	# Without ignore_routes_with_linkdown=1, subsequent
+	# lookups may still select the same RTNH_F_LINKDOWN route.
+	$NS_EXEC sysctl -qw net.ipv4.conf.veth-c1.ignore_routes_with_linkdown=1
+	$NS_EXEC sysctl -qw net.ipv4.conf.veth-c2.ignore_routes_with_linkdown=1
+
+	$NS_EXEC sysctl -qw net.ipv6.conf.veth-c1.ignore_routes_with_linkdown=1
+	$NS_EXEC sysctl -qw net.ipv6.conf.veth-c2.ignore_routes_with_linkdown=1
+}
+
+setup()
+{
+	setup_ns client server
+
+	ip -n "$client" link add veth-c1 type veth peer veth-s1 netns "$server"
+	ip -n "$client" link add veth-c2 type veth peer veth-s2 netns "$server"
+
+	setup_server
+	setup_client
+}
+
+cleanup()
+{
+	cleanup_all_ns > /dev/null 2>&1
+}
+
+tcp_ecmp_failover()
+{
+	local pf=$1; shift
+	local server_ip=$1; shift
+	local client_ip=$1; shift
+
+	RET=0
+
+	tcpdump_start veth-s1 "$server"
+	tcpdump_start veth-s2 "$server"
+
+	ip netns exec "$server" \
+		socat -u TCP-LISTEN:8080,pf="$pf",bind="$server_ip",reuseaddr /dev/null &
+	server_pid=$!
+
+	# Wait for server to start listening.
+	# Sometimes client fails without this sleep.
+	sleep 1
+
+	ip netns exec "$client" \
+		socat -u /dev/zero TCP:"$server_ip":8080,pf="$pf",bind="$client_ip" &
+	client_pid=$!
+
+	# To capture enough packets.
+	sleep 3
+
+	tcpdump_stop veth-s1
+	tcpdump_stop veth-s2
+
+	pkts_s1=$(tcpdump_show veth-s1 | wc -l)
+	pkts_s2=$(tcpdump_show veth-s2 | wc -l)
+
+	tcpdump_cleanup veth-s1
+	tcpdump_cleanup veth-s2
+
+	# Detect the device chosen by the client
+	if [ "$pkts_s1" -gt "$pkts_s2" ]; then
+		veth_down=veth-s1
+		veth_up=veth-s2
+	else
+		veth_down=veth-s2
+		veth_up=veth-s1
+	fi
+
+	# Taking down $veth_down causes its peer to lose carrier,
+	# triggering NETDEV_CHANGE.  This flags RTNH_F_LINKDOWN
+	# and bumps the sernum for the route associated with that
+	# peer, invalidating the cached dst in the TCP socket.
+	#
+	# Consequently, sk_dst_check() fails, forcing the subsequent
+	# lookup to select the remaining healthy route via $veth_up.
+	ip -n "$server" link set "$veth_down" down
+
+	tcpdump_start "$veth_up" "$server"
+
+	# To capture enough packets.
+	sleep  3
+
+	tcpdump_stop "$veth_up"
+
+	kill -9 "$client_pid" > /dev/null 2>&1
+	kill -9 "$server_pid" > /dev/null 2>&1
+	wait 2> /dev/null
+
+	pkts=$(tcpdump_show $veth_up | wc -l)
+
+	tcpdump_cleanup "$veth_up"
+
+	if [ "$pkts" -lt 1000 ]; then
+		RET=$ksft_fail
+	fi
+}
+
+test_ipv4()
+{
+	setup
+	tcp_ecmp_failover IPv4 $SERVER_IP $CLIENT_IP
+	log_test "TCP IPv4 failover"
+	cleanup
+}
+
+test_ipv6()
+{
+	setup
+	tcp_ecmp_failover IPv6 "[$SERVER_IP6]" "[$CLIENT_IP6]"
+	log_test "TCP IPv6 failover"
+	cleanup
+}
+
+require_command socat
+require_command tcpdump
+
+trap cleanup EXIT
+
+test_ipv4
+test_ipv6
+
+exit "$EXIT_STATUS"
-- 
2.54.0.545.g6539524ca2-goog

