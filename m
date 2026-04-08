Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06EC26ED33
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Apr 2026 00:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.145.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775608091; cv=none; b=fn4V6+BUYbTXzDScvPl4VgRzdCx6NwP5JSvQLPzHE8+TXWIKL7LABvLvEulAH8WYtg+pn9T9L7o7HyJPFQ96E4wgvP57tWBRxWHTuc2iMCS8rINkaE8YqTofWQp7kZ9mVuAaNgUtjd90U9XlFkQ1JVY/PZ+mHJGRZlH3aJrjbIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775608091; c=relaxed/simple;
	bh=Y70+fPsuc0UXd7zQ73x+NbwsVlNtd1MDZBIR5Q+5cS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xgs8T9z2MqV/hARfcq9O5TGnHVmjyGD+8QC13LOjaBI65RNiJeDHyd8h3obGAHB4lS6sgB4sU489QqEa3g/4kpEY7Lo7PiELEaEU/SEaqRjFazGrrNuxCvrvof/nkcDk4Q7z9TN10ymtkoeEbRTLukyIqwTuK/QaIVFzgJ333PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=iUoJnp4T; arc=none smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="iUoJnp4T"
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637HaCXI1756296
	for <linux-kselftest@vger.kernel.org>; Tue, 7 Apr 2026 17:28:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=fa9qlq+VljzY1OgVmkybZA6qJbFhBRrcw9iTNaPDNjo=; b=iUoJnp4Tf6iz
	Z/fI0bqIMi1kw2/W0vbghyDTu6rz45CnSnl1DtQcJYttlsWHlZXLr2THDAgTawNp
	B6mfQSqb3W8I23+YNXRQLy1H06HzYN+EyhR55s+6tNfHdjAoIEDkgdicBidhqbGP
	Dwiz3DkmxvYTQwENLnlIcJekMWU+7zQBRLuAqoVHkRUOEb7DQP+zXz1y547ntY6A
	xCywIPYpJGVx5gNkod8AhCm/1KaNa7ArgiHx0nb8xeJlBBv0ADzDKzTxO3lkJj9m
	PGhvXBJE2WEEs/YukGBhA8w6vqbtrZDWG7KU70rrRjPoMJdMswDp5QZ7f2kOLd7I
	hEtriHzKIQ==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4dcmskqx6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 17:28:09 -0700 (PDT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7d7dfe2d094so6351324a34.3
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 17:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775608088; x=1776212888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fa9qlq+VljzY1OgVmkybZA6qJbFhBRrcw9iTNaPDNjo=;
        b=J1x176KGBe1EzOJPW886/p4YVZTqty27UetjD+P1haVDkn9gs3lwt3N+1uTz/cWkRP
         55t/zvW0tLqy3wdvBvnmM7QtsGv8t3+bkqab/PDosUcb6L/JyAacnQTBuZDV5/Gi9+qk
         aup5E62KxGmUoBCreUFU9v8ivNQHzOmq5qB00js1C+CX8pvaVE1UEtp6Iug5cQinyqww
         Ks5sX1EF01Lk5oGyD1mYRnQPgLo+8rFmdgeFbBQjQS7FNja3Fa9S9lSPt0ASrt6KHtZZ
         CdnpKE+Mg/4YSErrpnoNB530k7msmJCg4iT+VZJjBjqjJyyXwg3omeYdeFmF/dBd/BgG
         cMGA==
X-Forwarded-Encrypted: i=1; AJvYcCXdgBSn1ULoUqTYAjFU3nLVjibZUQXt62xoqNEMnu6NXpHqVa/w+yKJpSdiZ/n5cuo34LxmKJ4KMpSHhWud2EY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGC9KeLryYPshnJyxa29ADIASpCX9X5h6nj0u8nQ/ql8EFGUTq
	b+TkDmSW21h+tvuUuhl/Z5v5Bxjdp9u/dkN+bicqOZu+t4G3get+YmxvzRc6IIiM4Rn74frEm+P
	wt7hVsdM6efvcR1Up678X5KaGF994m7/+OVADfU7ZR+7OI1kKjZxcmlMn02W1Zafk7UR+rScmpe
	A=
X-Gm-Gg: AeBDiesWfZa1fetUCckT+fdwOlqSqaGGQpgOZu2XIP9V98vybF4tCcrhxHLizXLy1cY
	ahE7rGf3hqKteepTZunp2EU0+WIWFY/VARxirvT88kbfmnJ8yF4FANF7dIJFgmjjXYL9NgQkW+2
	l7MPwGn7mW6XT6fJ79XYK8d3lMmK2Bdtv02VQH/urWg6ZhMDmGAvAinRvkbtotk2poRV2PtjPDc
	kBRq3w9+pVadh5WU+CA3fdRDF3+MyFNL1TzrewB1qx10Ncfd39/4ZXtNfXKVAQ4wzMSeYtzL/vA
	jHP989baDxw+IEnQ5eo7UZEZUyc1S4eyVakXZTM4wINz0g5smBTkmir3JF7cJwW6TI+f/IfS1ZA
	RItsA/c0MSw==
X-Received: by 2002:a05:6820:a0c:b0:67f:c06c:a5e6 with SMTP id 006d021491bc7-68220b4a654mr9686221eaf.37.1775608087176;
        Tue, 07 Apr 2026 17:28:07 -0700 (PDT)
X-Received: by 2002:a05:6820:a0c:b0:67f:c06c:a5e6 with SMTP id 006d021491bc7-68220b4a654mr9686201eaf.37.1775608086588;
        Tue, 07 Apr 2026 17:28:06 -0700 (PDT)
Received: from localhost ([2a03:2880:12ff:9::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-422eaed88dfsm15780770fac.3.2026.04.07.17.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 17:28:05 -0700 (PDT)
From: Neil Spring <ntspring@meta.com>
To: netdev@vger.kernel.org
Cc: edumazet@google.com, ncardwell@google.com, kuniyu@google.com,
        davem@davemloft.net, dsahern@kernel.org, kuba@kernel.org,
        pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
        linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 2/2] selftests: net: add ECMP rehash test
Date: Tue,  7 Apr 2026 17:28:02 -0700
Message-ID: <20260408002802.2448424-3-ntspring@meta.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260408002802.2448424-1-ntspring@meta.com>
References: <20260408002802.2448424-1-ntspring@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pK8rjngradsCVHhDo1maGwExT2o5JBTR
X-Proofpoint-ORIG-GUID: pK8rjngradsCVHhDo1maGwExT2o5JBTR
X-Authority-Analysis: v=2.4 cv=Y//IdBeN c=1 sm=1 tr=0 ts=69d5a119 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=f7IdgyKtn90A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7x6HtfJdh03M6CCDgxCd:22 a=PAz_-FQ8hEVmOPYdF0yf:22 a=VabnemYjAAAA:8
 a=_tJXsZ62ISBIMLIKAhQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDAwMiBTYWx0ZWRfX/iGkuw7lvCja
 r74ZfZ6fBl9pA5r7LoOM+ccIrbjFLU0pGfp1jLPH+fc4bcaLESBGIpYBpYUaNWXepx1Pq6Geppk
 XpOMR6IhP00IDu/LdAQ46xqX4iuw88OZGzKoES+bcxWl06cbg0faGachLGpbL+LwRgYvb4o//qv
 0iAmITpYl06IlGqhYmUlaeZXkiy1sJLvf1Drejq5oPvOunMlaGs1kQ+O//uWOMySjA0wCfxMp7N
 mCmgqM+VXeL6tW6Tv7MXiiTwfblc7L5Q44I8JSdaoiIXeeukePUOCnb9SP4u9Gjdo8x/0CSwDtu
 Ec1PY+AJPLxibhlNB+B+cDTAKaipeB7mAgVja9nMjAyQUZdS56nuLkKYjkR3iCLRP/eknaN6B1J
 Ab3Y0SPyWJJtS2Eqvg/XmZbl+FqqyF+TXoMG7rzjwNQXeRy/MDycWXuvCIWz1Oa39eQDIx1gEZq
 mF+Jrd6k4ZXGdEfPZzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_05,2026-04-07_05,2025-10-01_01

Add ecmp_rehash.sh to exercise TCP ECMP path re-selection on
retransmission timeout.  Three tests cover client SYN rehash, server
SYN/ACK rehash, and midstream RTO rehash of an established connection
over a two-path ECMP topology with one leg blocked by tc.

The SYN test retries 26 times, so has a false negative probability
of ~(1/2)^25 ≈ 3e-8.

Signed-off-by: Neil Spring <ntspring@meta.com>
---
 tools/testing/selftests/net/Makefile       |   1 +
 tools/testing/selftests/net/ecmp_rehash.sh | 354 +++++++++++++++++++++
 2 files changed, 355 insertions(+)
 create mode 100755 tools/testing/selftests/net/ecmp_rehash.sh

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 6bced3ed798b..acc61a51d7e2 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -25,6 +25,7 @@ TEST_PROGS := \
 	cmsg_time.sh \
 	double_udp_encap.sh \
 	drop_monitor_tests.sh \
+	ecmp_rehash.sh \
 	fcnal-ipv4.sh \
 	fcnal-ipv6.sh \
 	fcnal-other.sh \
diff --git a/tools/testing/selftests/net/ecmp_rehash.sh b/tools/testing/selftests/net/ecmp_rehash.sh
new file mode 100755
index 000000000000..a062c0b51fd6
--- /dev/null
+++ b/tools/testing/selftests/net/ecmp_rehash.sh
@@ -0,0 +1,354 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Test ECMP path re-selection on TCP retransmission timeout.
+#
+# Two namespaces connected by two parallel veth pairs with a 2-way ECMP
+# route.  When a TCP path is blocked (via tc drop), RTO triggers
+# sk_rethink_txhash() + sk_dst_reset(), causing the next route lookup
+# to select the other ECMP path.
+#
+# False negative: ~(1/2)^25 ≈ 3e-8.  With tcp_syn_retries=6 (~127 s
+# timeout) and tcp_syn_linear_timeouts=20 there are roughly 26
+# independent rehash attempts, each choosing one of 2 paths uniformly.
+
+source lib.sh
+
+SUBNETS=(a b)
+PORT=9900
+
+ALL_TESTS="
+	test_ecmp_rto_rehash
+	test_ecmp_synack_rehash
+	test_ecmp_midstream_rehash
+"
+
+link_tx_packets_get()
+{
+	local ns=$1; shift
+	local dev=$1; shift
+
+	ip netns exec "$ns" cat "/sys/class/net/$dev/statistics/tx_packets"
+}
+
+# Return the number of packets matched by the tc filter action on a device.
+# When tc drops packets via "action drop", the device's tx_packets is not
+# incremented (packet never reaches veth_xmit), but the tc action maintains
+# its own counter.
+tc_filter_pkt_count()
+{
+	local ns=$1; shift
+	local dev=$1; shift
+
+	ip netns exec "$ns" tc -s filter show dev "$dev" parent 1: 2>/dev/null |
+		awk '/Sent .* pkt/ { for (i=1;i<=NF;i++) if ($i=="pkt") { print $(i-1); exit } }'
+}
+
+# Read TcpTimeoutRehash counter from /proc/net/netstat in a namespace.
+# This counter increments in tcp_write_timeout() on every RTO that triggers
+# sk_rethink_txhash().
+get_timeout_rehash_count()
+{
+	local ns=$1; shift
+
+	ip netns exec "$ns" awk '
+		/^TcpExt:/ {
+			if (!h) { split($0, n); h=1 }
+			else {
+				split($0, v)
+				for (i in n)
+					if (n[i] == "TcpTimeoutRehash") print v[i]
+			}
+		}
+	' /proc/net/netstat
+}
+
+# Block TCP (IPv6 next-header = 6) egress, allowing ICMPv6 through.
+block_tcp()
+{
+	local ns=$1; shift
+	local dev=$1; shift
+
+	ip netns exec "$ns" tc qdisc add dev "$dev" root handle 1: prio
+	ip netns exec "$ns" tc filter add dev "$dev" parent 1: \
+		protocol ipv6 prio 1 u32 match u8 0x06 0xff at 6 action drop
+}
+
+unblock_tcp()
+{
+	local ns=$1; shift
+	local dev=$1; shift
+
+	ip netns exec "$ns" tc qdisc del dev "$dev" root 2>/dev/null
+}
+
+# Return success when both devices have dropped at least one TCP packet.
+both_devs_attempted()
+{
+	local ns=$1; shift
+	local dev0=$1; shift
+	local dev1=$1; shift
+
+	local c0 c1
+	c0=$(tc_filter_pkt_count "$ns" "$dev0")
+	c1=$(tc_filter_pkt_count "$ns" "$dev1")
+	[ "${c0:-0}" -ge 1 ] && [ "${c1:-0}" -ge 1 ]
+}
+
+setup()
+{
+	setup_ns NS1 NS2
+
+	local ns
+	for ns in "$NS1" "$NS2"; do
+		ip netns exec "$ns" sysctl -qw net.ipv6.conf.all.accept_dad=0
+		ip netns exec "$ns" sysctl -qw net.ipv6.conf.default.accept_dad=0
+		ip netns exec "$ns" sysctl -qw net.ipv6.conf.all.forwarding=1
+		ip netns exec "$ns" sysctl -qw net.core.txrehash=1
+	done
+
+	local i sub
+	for i in 0 1; do
+		sub=${SUBNETS[$i]}
+		ip link add "veth${i}a" type veth peer name "veth${i}b"
+		ip link set "veth${i}a" netns "$NS1"
+		ip link set "veth${i}b" netns "$NS2"
+		ip -n "$NS1" addr add "fd00:${sub}::1/64" dev "veth${i}a"
+		ip -n "$NS2" addr add "fd00:${sub}::2/64" dev "veth${i}b"
+		ip -n "$NS1" link set "veth${i}a" up
+		ip -n "$NS2" link set "veth${i}b" up
+	done
+
+	ip -n "$NS1" addr add fd00:ff::1/128 dev lo
+	ip -n "$NS2" addr add fd00:ff::2/128 dev lo
+
+	# Allow many SYN retries at 1-second intervals (linear, no
+	# exponential backoff) so the rehash test has enough attempts
+	# to exercise both ECMP paths deterministically.
+	ip netns exec "$NS1" sysctl -qw net.ipv4.tcp_syn_retries=6
+	ip netns exec "$NS1" sysctl -qw net.ipv4.tcp_syn_linear_timeouts=20
+
+	ip -n "$NS1" -6 route add fd00:ff::2/128 \
+		nexthop via fd00:a::2 dev veth0a \
+		nexthop via fd00:b::2 dev veth1a
+
+	ip -n "$NS2" -6 route add fd00:ff::1/128 \
+		nexthop via fd00:a::1 dev veth0b \
+		nexthop via fd00:b::1 dev veth1b
+
+	for i in 0 1; do
+		sub=${SUBNETS[$i]}
+		ip netns exec "$NS1" \
+			ping -6 -c1 -W5 "fd00:${sub}::2" &>/dev/null
+		ip netns exec "$NS2" \
+			ping -6 -c1 -W5 "fd00:${sub}::1" &>/dev/null
+	done
+
+	if ! ip netns exec "$NS1" ping -6 -c1 -W5 fd00:ff::2 &>/dev/null; then
+		echo "Basic connectivity check failed"
+		return $ksft_skip
+	fi
+}
+
+# Block ALL paths, start a connection, wait until SYNs have been dropped
+# on both interfaces (proving rehash steered the SYN to a new path), then
+# unblock so the connection completes.
+test_ecmp_rto_rehash()
+{
+	RET=0
+
+	block_tcp "$NS1" veth0a
+	defer unblock_tcp "$NS1" veth0a
+	block_tcp "$NS1" veth1a
+	defer unblock_tcp "$NS1" veth1a
+
+	ip netns exec "$NS2" socat \
+		"TCP6-LISTEN:$PORT,bind=[fd00:ff::2],reuseaddr,fork" \
+		EXEC:"echo ESTABLISH_OK" &
+	defer kill_process $!
+
+	wait_local_port_listen "$NS2" $PORT tcp
+
+	local rehash_before
+	rehash_before=$(get_timeout_rehash_count "$NS1")
+
+	# Start the connection in the background; it will retry SYNs at
+	# 1-second intervals until an unblocked path is found.
+	ip netns exec "$NS1" bash -c \
+		"echo test | socat - \
+		'TCP6:[fd00:ff::2]:$PORT,bind=[fd00:ff::1],connect-timeout=60'" \
+		>"/tmp/ecmp_rto_$$" 2>&1 &
+	local client_pid=$!
+	defer kill_process $client_pid
+
+	# Wait until both paths have seen at least one dropped SYN.
+	# This proves sk_rethink_txhash() rehashed the connection from
+	# one ECMP path to the other.
+	slowwait 30 both_devs_attempted "$NS1" veth0a veth1a
+	check_err $? "SYNs did not appear on both paths (rehash not working)"
+	if [ $RET -ne 0 ]; then
+		log_test "ECMP RTO rehash: establish with blocked paths"
+		return
+	fi
+
+	# Unblock both paths and let the next SYN retransmit succeed.
+	unblock_tcp "$NS1" veth0a
+	unblock_tcp "$NS1" veth1a
+
+	local rc=0
+	wait $client_pid || rc=$?
+
+	local result
+	result=$(cat "/tmp/ecmp_rto_$$" 2>/dev/null)
+	rm -f "/tmp/ecmp_rto_$$"
+
+	if [ $rc -ne 0 ] || [[ "$result" != *"ESTABLISH_OK"* ]]; then
+		check_err 1 "connection failed after unblocking: $result"
+	fi
+
+	local rehash_after
+	rehash_after=$(get_timeout_rehash_count "$NS1")
+	if [ "$rehash_after" -le "$rehash_before" ]; then
+		check_err 1 "TcpTimeoutRehash counter did not increment"
+	fi
+
+	log_test "ECMP RTO rehash: establish with blocked paths"
+}
+
+# Block the server's return paths so SYN/ACKs are dropped.  The client
+# retransmits SYNs at 1-second intervals; each duplicate SYN arriving at
+# the server updates ir_iif to match the new arrival interface, so the
+# retransmitted SYN/ACK routes back via the interface the SYN arrived on.
+test_ecmp_synack_rehash()
+{
+	RET=0
+	local port=$((PORT + 2))
+
+	block_tcp "$NS2" veth0b
+	defer unblock_tcp "$NS2" veth0b
+	block_tcp "$NS2" veth1b
+	defer unblock_tcp "$NS2" veth1b
+
+	ip netns exec "$NS2" socat \
+		"TCP6-LISTEN:$port,bind=[fd00:ff::2],reuseaddr,fork" \
+		EXEC:"echo SYNACK_OK" &
+	defer kill_process $!
+
+	wait_local_port_listen "$NS2" $port tcp
+
+	# Start the connection; SYNs reach the server (client egress is
+	# open) but SYN/ACKs are dropped on the server's return path.
+	ip netns exec "$NS1" bash -c \
+		"echo test | socat - \
+		'TCP6:[fd00:ff::2]:$port,bind=[fd00:ff::1],connect-timeout=60'" \
+		>"/tmp/ecmp_synack_$$" 2>&1 &
+	local client_pid=$!
+	defer kill_process $client_pid
+
+	# Wait until both server-side interfaces have dropped at least
+	# one SYN/ACK, proving the server rehashed its return path.
+	slowwait 30 both_devs_attempted "$NS2" veth0b veth1b
+	check_err $? "SYN/ACKs did not appear on both return paths"
+	if [ $RET -ne 0 ]; then
+		log_test "ECMP SYN/ACK rehash: blocked return path"
+		return
+	fi
+
+	# Unblock and let the connection complete.
+	unblock_tcp "$NS2" veth0b
+	unblock_tcp "$NS2" veth1b
+
+	local rc=0
+	wait $client_pid || rc=$?
+
+	local result
+	result=$(cat "/tmp/ecmp_synack_$$" 2>/dev/null)
+	rm -f "/tmp/ecmp_synack_$$"
+
+	if [ $rc -ne 0 ] || [[ "$result" != *"SYNACK_OK"* ]]; then
+		check_err 1 "connection failed after unblocking: $result"
+	fi
+
+	log_test "ECMP SYN/ACK rehash: blocked return path"
+}
+
+# Establish a data transfer with both paths open, then block the
+# active path.  Verify the transfer continues via rehash and that
+# TcpTimeoutRehash incremented.
+test_ecmp_midstream_rehash()
+{
+	RET=0
+	local port=$((PORT + 1))
+
+	ip netns exec "$NS2" socat -u \
+		"TCP6-LISTEN:$port,bind=[fd00:ff::2],reuseaddr" - >/dev/null &
+	defer kill_process $!
+
+	wait_local_port_listen "$NS2" $port tcp
+
+	local base_tx0 base_tx1
+	base_tx0=$(link_tx_packets_get "$NS1" veth0a)
+	base_tx1=$(link_tx_packets_get "$NS1" veth1a)
+
+	ip netns exec "$NS1" bash -c "
+		for i in \$(seq 1 40); do
+			dd if=/dev/zero bs=10k count=1 2>/dev/null
+			sleep 0.25
+		done | timeout 60 socat - 'TCP6:[fd00:ff::2]:$port,bind=[fd00:ff::1]'
+	" &>/dev/null &
+	local client_pid=$!
+	defer kill_process $client_pid
+
+	busywait $BUSYWAIT_TIMEOUT until_counter_is \
+			">= $((base_tx0 + base_tx1 + 20))" \
+		link_tx_packets_total "$NS1"
+	check_err $? "no TX activity detected"
+	if [ $RET -ne 0 ]; then
+		log_test "ECMP midstream rehash: block active path"
+		return
+	fi
+
+	# Find the active path and block it.
+	local cur0 cur1 active_idx
+	cur0=$(link_tx_packets_get "$NS1" veth0a)
+	cur1=$(link_tx_packets_get "$NS1" veth1a)
+	if [ $((cur0 - base_tx0)) -ge $((cur1 - base_tx1)) ]; then
+		active_idx=0
+	else
+		active_idx=1
+	fi
+
+	local rehash_before
+	rehash_before=$(get_timeout_rehash_count "$NS1")
+
+	block_tcp "$NS1" "veth${active_idx}a"
+	defer unblock_tcp "$NS1" "veth${active_idx}a"
+
+	local rc=0
+	wait $client_pid || rc=$?
+
+	check_err $rc "data transfer failed after blocking veth${active_idx}a"
+
+	local rehash_after
+	rehash_after=$(get_timeout_rehash_count "$NS1")
+	if [ "$rehash_after" -le "$rehash_before" ]; then
+		check_err 1 "TcpTimeoutRehash counter did not increment"
+	fi
+
+	log_test "ECMP midstream rehash: block active path"
+}
+
+link_tx_packets_total()
+{
+	local ns=$1; shift
+
+	echo $(( $(link_tx_packets_get "$ns" veth0a) +
+		 $(link_tx_packets_get "$ns" veth1a) ))
+}
+
+require_command socat
+
+trap cleanup_all_ns EXIT
+setup || exit $?
+tests_run
+exit $EXIT_STATUS
-- 
2.52.0

