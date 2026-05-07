Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E64544E053
	for <linux-kselftest@vger.kernel.org>; Thu,  7 May 2026 17:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778174016; cv=none; b=EP6tGPlrCjHEIlrRKpeLS5qw12VqfVFnjh+QkbISzOMkkUy7hYBvjDsdsXi/+RgBIrW+rkzFBVk/9m8AMoBikcsnudMktAE58NvxlD9mTq7wdfJMLEoghdg9Grm2WFqKCkwej4yBEs1ELVj3BvQspNJmScmDDAuJYUIBH3aU3fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778174016; c=relaxed/simple;
	bh=gtAt8/tV47r6iqHMdP49vpfBQ0eE7U7z0m5BzdREwpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iHlkUNHsFF9AWdTVoLIHeWytHNlAC7Yt0KmSJencGpymv+Ap2gHe4sMEwkepA1/Rpda64DOgDwYCXKN+nE5ic3Xky7hmBvtd/tq7s7wnQqdpvqOq2OZI3dLSLw+dg7atTVQp2+KBeYlj4zPTfocmTBgEgGi3Amb022AGnqOgHoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=qmCLDNTa; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="qmCLDNTa"
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647H4RXs3475801
	for <linux-kselftest@vger.kernel.org>; Thu, 7 May 2026 10:13:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=s2048-2025-q2; bh=GYJ7e52
	w7bJCH/HiKyi1APKnPSIvhxLSkN12pd94xXU=; b=qmCLDNTakqAH+jRq/QfKuhD
	skPlvixwx/Da0LmSOmOackHCgkf/1bydbAvcohSBQ4mYUMgTkZkWhHKC7g+gzL+7
	gYzvqZKBCSaiLzM2tM5dwhcZTFVwzIPOvw7HnsjyS1Uyna+8+DhZT50O9QWHq0h3
	1HqWoZsyeZuZmCf+meze65eK8Wqj0DKanzA4BEcceIEGmrTKvgGSrENFQR8yeGa1
	D/XX/I+nvmYnig2emlJjlNhdvOw50JXT5ytd8C+Jp43B4j4BqoUqN5WKKcRYQbcQ
	yiySLUY7rMX2vpYyO4+obs7/YKpetc+dSKtPdGPLcNEqCVZzJwyHAX3EUX6rUMw=
	=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4dwf0dsg53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 07 May 2026 10:13:27 -0700 (PDT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-464bbea2120so1357876b6e.3
        for <linux-kselftest@vger.kernel.org>; Thu, 07 May 2026 10:13:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778174006; x=1778778806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GYJ7e52w7bJCH/HiKyi1APKnPSIvhxLSkN12pd94xXU=;
        b=XhYrIPdA3qkjvMr/sCxv4PvDX3rTjPTewVvYlq+qCgWHKQmWASFOLRy+xgXD0tx+JU
         vpAb0x54ZfC/1BIP8DUlP1tZ7mvORobJ2HvISrfyoep1usqgvU3tdergROcvnUE2U4OD
         5UaQ/dyM2RpkbUVk9BwrVuWhk9Y1Q6/PhZlMK52OLF+8wWHnK2sbTfXIj9g1lsVSxrfz
         n6PgQzdDMJyNEd82CmhGukDeeG9u29E6jlWIiMBBj9fb2/SwCP9gX+bXXC+U/tpewF09
         laQjFusk7UC6EZH/IUcEfNxrBU44ygcpDv/P2y5Timp4aw36OnL8ftrNv0hU5Gam8UlW
         +KWw==
X-Forwarded-Encrypted: i=1; AFNElJ8zbBEtf1HIdjYzoUMOadxJo919AcEC6Bl6W3Lmjb19rvSqh0wCblQi8koAqgPurrkakUav5bM49g2PI58nRUk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpi44Ko273QsdvKF3Enm6D+HgVxUu1JQ9vEA28b7G48b9srj3t
	r9GUEIjxoUQMz5asNYddsUxpqltJexYabVgqfVoMYVSAvIoW2+9HVU5aqu1O4qrZpkps3ZRlQ7W
	OSdw/OwhA05R/j+cO4urBH20Zwrmj27Sl2XbSjJ+kHaI7RofQqgSRvRlZhD/NzuTBdTU=
X-Gm-Gg: AeBDieuy6+Xmi+WAP6EZkcOKvla4x7h7j/oSOorvw5Vd7OGS1Hi05/HWlidDtjgqgx/
	OstOEOz+YdkbzOLAcQXtMcRngYr+vxkg/ObSdefvJVoIRin+zpfuV1MeXxMkYO/WtTHipUdnAXC
	l3CUSZtbVp8bGF8Q4sMYH0Ic4Z8LR6i15VxcDb2SnpihAmr5wZH3wy99vgZKgCE/Bc6rIc2Wbwr
	2FRn8UUDdwP7CCh9BFfPmQuUMcbCciv9Qe1qtxJmvS7EIUw+XsE7Jd/VTFcq8hUerm1aaqdvqma
	1daoCMOuRQWKl0X7EEGbZERilpI4hK5YimD8ujeYWPf/0HQWBJmq04b1vCTtI8G+pU0l21QfOPj
	fsmZWJZ6SSg==
X-Received: by 2002:a05:6808:301e:b0:466:f60b:19d5 with SMTP id 5614622812f47-480420bc1d6mr5048365b6e.8.1778174005781;
        Thu, 07 May 2026 10:13:25 -0700 (PDT)
X-Received: by 2002:a05:6808:301e:b0:466:f60b:19d5 with SMTP id 5614622812f47-480420bc1d6mr5048335b6e.8.1778174005100;
        Thu, 07 May 2026 10:13:25 -0700 (PDT)
Received: from localhost ([2a03:2880:12ff:5::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-47c763b32dbsm13066035b6e.3.2026.05.07.10.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 10:13:23 -0700 (PDT)
From: Neil Spring <ntspring@meta.com>
To: netdev@vger.kernel.org
Cc: edumazet@google.com, ncardwell@google.com, kuniyu@google.com,
        davem@davemloft.net, kuba@kernel.org, dsahern@kernel.org,
        pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
        linux-kselftest@vger.kernel.org, ntspring@meta.com
Subject: [PATCH net-next v4 2/2] selftests: net: add local ECMP rehash test
Date: Thu,  7 May 2026 10:13:19 -0700
Message-ID: <20260507171319.1259115-3-ntspring@meta.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260507171319.1259115-1-ntspring@meta.com>
References: <20260507171319.1259115-1-ntspring@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Y7LIdBeN c=1 sm=1 tr=0 ts=69fcc837 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=f7IdgyKtn90A:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=xtH7KyWI9dI7BmFOsl-x:22 a=VabnemYjAAAA:8 a=ju2GGTlv_dIoMgbF4_QA:9
 a=pF_qn-MSjDawc0seGVz6:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE3MyBTYWx0ZWRfX68CN3jIvypbO
 ZnSFepikji3W4pqJz4DwNsio+12Amc0Q+xKrhZZ2dMGDOgUBBgYTmAqfuSHrfPxR4bfjq6gmnAE
 PSno9YXRyaFmA/XpL4BOuekU55cfxp5D9Nj8+lf0Ec4w0dKPIQV0CtSH9ztlTFaEgsjQ21vNr6l
 aK034Q4w3tvXGo05YO2ctSSmoXzeRqIbG9VSPKxAq8HO49ILBc+esiYgd89EUEshKRkVwX0oeG8
 6KuC+GMuLCDdgFUcIvWoD06EyVO8XxWU722apAeTSQHXezeHXlHOOkKHU12ilTkq6oOfansnCZB
 z/vMPBr5Oq6fw8pHq9odMx0s1E6/yQonkomVtgdj9EZN7s5EQ5B7zIUxWVv0Lmp+S8xg9gL49Pb
 ne9EsQsChb5fKo8dcCAYU1UbQZsnru2kqdNCbT8zPuaXeeW0KWqq6UON1ZShINtinAQTNBmgAYE
 2ROWZ1I/Zgp5TQSFoCw==
X-Proofpoint-ORIG-GUID: bwWHDaVbI6z4sQCZVvLFUWmbZc-4RVhR
X-Proofpoint-GUID: bwWHDaVbI6z4sQCZVvLFUWmbZc-4RVhR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01

Add ecmp_rehash.sh with five scenarios verifying that TCP rehash
selects a different local ECMP path for IPv6:

  - SYN retransmission (forward path blocked during setup)
  - SYN/ACK retransmission (reverse path blocked during setup)
  - Midstream RTO (forward path blocked on established connection)
  - Midstream ACK rehash (reverse path blocked on established connection)
  - PLB rehash (ECN-driven congestion on established connection)

Signed-off-by: Neil Spring <ntspring@meta.com>
---
 tools/testing/selftests/net/Makefile       |   1 +
 tools/testing/selftests/net/config         |   1 +
 tools/testing/selftests/net/ecmp_rehash.sh | 582 +++++++++++++++++++++
 3 files changed, 584 insertions(+)
 create mode 100755 tools/testing/selftests/net/ecmp_rehash.sh

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index baa30287cf22..6ec1b24218ad 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -26,6 +26,7 @@ TEST_PROGS := \
 	cmsg_time.sh \
 	double_udp_encap.sh \
 	drop_monitor_tests.sh \
+	ecmp_rehash.sh \
 	fcnal-ipv4.sh \
 	fcnal-ipv6.sh \
 	fcnal-other.sh \
diff --git a/tools/testing/selftests/net/config b/tools/testing/selftests/net/config
index 94d722770420..20fce6e4500b 100644
--- a/tools/testing/selftests/net/config
+++ b/tools/testing/selftests/net/config
@@ -122,6 +122,7 @@ CONFIG_PSAMPLE=m
 CONFIG_RPS=y
 CONFIG_SYSFS=y
 CONFIG_TAP=m
+CONFIG_TCP_CONG_DCTCP=m
 CONFIG_TCP_MD5SIG=y
 CONFIG_TEST_BLACKHOLE_DEV=m
 CONFIG_TEST_BPF=m
diff --git a/tools/testing/selftests/net/ecmp_rehash.sh b/tools/testing/selftests/net/ecmp_rehash.sh
new file mode 100755
index 000000000000..c0603f50abf2
--- /dev/null
+++ b/tools/testing/selftests/net/ecmp_rehash.sh
@@ -0,0 +1,582 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Test local ECMP path re-selection on TCP retransmission timeout and PLB.
+#
+# Two namespaces connected by two parallel veth pairs with a 2-way ECMP
+# route.  When a TCP path is blocked (via tc drop) or congested (via
+# netem ECN marking), the kernel rehashes the connection via
+# sk_rethink_txhash() + sk_dst_reset(), causing the next route lookup
+# to select the other ECMP path.
+#
+# Each rehash re-rolls sk_txhash randomly, giving a 1/2 chance of
+# selecting the alternate path per attempt.  With tcp_syn_retries=25
+# and tcp_syn_linear_timeouts=25 there are 26 attempts, so the
+# probability of never switching is ~(1/2)^25 ~ 3e-8.
+
+source lib.sh
+
+SUBNETS=(a b)
+PORT=9900
+
+ALL_TESTS="
+	test_ecmp_syn_rehash
+	test_ecmp_synack_rehash
+	test_ecmp_midstream_rehash
+	test_ecmp_midstream_ack_rehash
+	test_ecmp_plb_rehash
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
+		awk '/Sent .* pkt/ {
+			for (i=1; i<=NF; i++)
+				if ($i == "pkt") { print $(i-1); exit }
+		}'
+}
+
+# Read a TcpExt counter from /proc/net/netstat in a namespace.
+# Returns 0 if the counter is not found.
+get_netstat_counter()
+{
+	local ns=$1; shift
+	local field=$1; shift
+	local val
+
+	# shellcheck disable=SC2016
+	val=$(ip netns exec "$ns" awk -v key="$field" '
+		/^TcpExt:/ {
+			if (!h) { split($0, n); h=1 }
+			else {
+				split($0, v)
+				for (i in n)
+					if (n[i] == key) print v[i]
+			}
+		}
+	' /proc/net/netstat)
+	echo "${val:-0}"
+}
+
+# Apply netem ECN marking: CE-mark all ECT packets instead of dropping them.
+mark_ecn()
+{
+	local ns=$1; shift
+	local dev=$1; shift
+
+	ip netns exec "$ns" tc qdisc add dev "$dev" root netem loss 100% ecn
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
+# Return success when a device's TX counter exceeds a baseline value.
+dev_tx_packets_above()
+{
+	local ns=$1; shift
+	local dev=$1; shift
+	local baseline=$1; shift
+
+	local cur
+	cur=$(link_tx_packets_get "$ns" "$dev")
+	[ "$cur" -gt "$baseline" ]
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
+link_tx_packets_total()
+{
+	local ns=$1; shift
+
+	echo $(( $(link_tx_packets_get "$ns" veth0a) +
+		 $(link_tx_packets_get "$ns" veth1a) ))
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
+	# to exercise both ECMP paths.
+	if ! ip netns exec "$NS1" sysctl -qw \
+	     net.ipv4.tcp_syn_linear_timeouts=25; then
+		echo "SKIP: tcp_syn_linear_timeouts not supported"
+		exit "$ksft_skip"
+	fi
+	ip netns exec "$NS1" sysctl -qw net.ipv4.tcp_syn_retries=25
+
+	# Keep the server's request socket alive during the blocking
+	# period so SYN/ACK retransmits continue.
+	ip netns exec "$NS2" sysctl -qw net.ipv4.tcp_synack_retries=25
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
+		return "$ksft_skip"
+	fi
+}
+
+# Block ALL paths, start a connection, wait until SYNs have been dropped
+# on both interfaces (proving rehash steered the SYN to a new path), then
+# unblock so the connection completes.
+test_ecmp_syn_rehash()
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
+	wait_local_port_listen "$NS2" "$PORT" tcp
+
+	local rehash_before
+	rehash_before=$(get_netstat_counter "$NS1" TcpTimeoutRehash)
+
+	# Start the connection in the background; it will retry SYNs at
+	# 1-second intervals until an unblocked path is found.
+	# Use -u (unidirectional) to only receive from the server;
+	# sending data back would risk SIGPIPE if the server's EXEC
+	# child has already exited.
+	local tmpfile
+	tmpfile=$(mktemp)
+	defer rm -f "$tmpfile"
+
+	ip netns exec "$NS1" socat -u \
+		"TCP6:[fd00:ff::2]:$PORT,bind=[fd00:ff::1],connect-timeout=60" \
+		STDOUT >"$tmpfile" 2>&1 &
+	local client_pid=$!
+	defer kill_process "$client_pid"
+
+	# Wait until both paths have seen at least one dropped SYN.
+	# This proves sk_rethink_txhash() rehashed the connection from
+	# one ECMP path to the other.
+	slowwait 30 both_devs_attempted "$NS1" veth0a veth1a
+	check_err $? "SYNs did not appear on both paths (rehash not working)"
+	if [ "$RET" -ne 0 ]; then
+		log_test "Local ECMP SYN rehash: establish with blocked paths"
+		return
+	fi
+
+	# Unblock both paths and let the next SYN retransmit succeed.
+	unblock_tcp "$NS1" veth0a
+	unblock_tcp "$NS1" veth1a
+
+	local rc=0
+	wait "$client_pid" || rc=$?
+
+	local result
+	result=$(cat "$tmpfile" 2>/dev/null)
+
+	if [[ "$result" != *"ESTABLISH_OK"* ]]; then
+		check_err 1 "connection failed after unblocking (rc=$rc): $result"
+	fi
+
+	local rehash_after
+	rehash_after=$(get_netstat_counter "$NS1" TcpTimeoutRehash)
+	if [ "$rehash_after" -le "$rehash_before" ]; then
+		check_err 1 "TcpTimeoutRehash counter did not increment"
+	fi
+
+	log_test "Local ECMP SYN rehash: establish with blocked paths"
+}
+
+# Block the server's return paths so SYN/ACKs are dropped.  The client
+# retransmits SYNs at 1-second intervals; each duplicate SYN arriving at
+# the server triggers tcp_rtx_synack() which re-rolls txhash, so the
+# retransmitted SYN/ACK selects a different ECMP return path.
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
+	wait_local_port_listen "$NS2" "$port" tcp
+
+	# Start the connection; SYNs reach the server (client egress is
+	# open) but SYN/ACKs are dropped on the server's return path.
+	local tmpfile
+	tmpfile=$(mktemp)
+	defer rm -f "$tmpfile"
+
+	ip netns exec "$NS1" socat -u \
+		"TCP6:[fd00:ff::2]:$port,bind=[fd00:ff::1],connect-timeout=60" \
+		STDOUT >"$tmpfile" 2>&1 &
+	local client_pid=$!
+	defer kill_process "$client_pid"
+
+	# Wait until both server-side interfaces have dropped at least
+	# one SYN/ACK, proving the server rehashed its return path.
+	slowwait 30 both_devs_attempted "$NS2" veth0b veth1b
+	check_err $? "SYN/ACKs did not appear on both return paths"
+	if [ "$RET" -ne 0 ]; then
+		log_test "Local ECMP SYN/ACK rehash: blocked return path"
+		return
+	fi
+
+	# Unblock and let the connection complete.
+	unblock_tcp "$NS2" veth0b
+	unblock_tcp "$NS2" veth1b
+
+	local rc=0
+	wait "$client_pid" || rc=$?
+
+	local result
+	result=$(cat "$tmpfile" 2>/dev/null)
+
+	if [[ "$result" != *"SYNACK_OK"* ]]; then
+		check_err 1 "connection failed after unblocking (rc=$rc): $result"
+	fi
+
+	log_test "Local ECMP SYN/ACK rehash: blocked return path"
+}
+
+# Establish a data transfer with both paths open, then block the
+# active path.  Verify that data appears on the previously inactive
+# path (proving RTO triggered a rehash) and that TcpTimeoutRehash
+# incremented.
+test_ecmp_midstream_rehash()
+{
+	RET=0
+	local port=$((PORT + 1))
+
+	ip netns exec "$NS2" socat -u \
+		"TCP6-LISTEN:$port,bind=[fd00:ff::2],reuseaddr" - >/dev/null &
+	defer kill_process $!
+
+	wait_local_port_listen "$NS2" "$port" tcp
+
+	local base_tx0 base_tx1
+	base_tx0=$(link_tx_packets_get "$NS1" veth0a)
+	base_tx1=$(link_tx_packets_get "$NS1" veth1a)
+
+	# Continuous data source; timeout caps overall test duration and
+	# must exceed the slowwait below so data keeps flowing.
+	ip netns exec "$NS1" timeout 90 socat -u \
+		OPEN:/dev/zero \
+		"TCP6:[fd00:ff::2]:$port,bind=[fd00:ff::1]" &>/dev/null &
+	local client_pid=$!
+	defer kill_process "$client_pid"
+
+	# Wait for enough packets to identify the active path.
+	busywait "$BUSYWAIT_TIMEOUT" until_counter_is \
+			">= $((base_tx0 + base_tx1 + 10))" \
+		link_tx_packets_total "$NS1" > /dev/null
+	check_err $? "no TX activity detected"
+	if [ "$RET" -ne 0 ]; then
+		log_test "Local ECMP midstream rehash: block active path"
+		return
+	fi
+
+	# Find the active path and block it.
+	local current_tx0 current_tx1 active_idx inactive_idx
+	current_tx0=$(link_tx_packets_get "$NS1" veth0a)
+	current_tx1=$(link_tx_packets_get "$NS1" veth1a)
+	if [ $((current_tx0 - base_tx0)) -ge $((current_tx1 - base_tx1)) ]; then
+		active_idx=0; inactive_idx=1
+	else
+		active_idx=1; inactive_idx=0
+	fi
+	local inactive_before
+	inactive_before=$(link_tx_packets_get "$NS1" "veth${inactive_idx}a")
+
+	local rehash_before
+	rehash_before=$(get_netstat_counter "$NS1" TcpTimeoutRehash)
+	# Suppress the existing __dst_negative_advice() in
+	# tcp_write_timeout() so that the patch's sk_dst_reset()
+	# is the only dst-invalidation mechanism on the RTO path.
+	ip netns exec "$NS1" sysctl -qw net.ipv4.tcp_retries1=255
+	defer ip netns exec "$NS1" sysctl -qw net.ipv4.tcp_retries1=3
+
+	block_tcp "$NS1" "veth${active_idx}a"
+	defer unblock_tcp "$NS1" "veth${active_idx}a"
+
+	# Wait for meaningful data on the previously inactive path,
+	# proving RTO triggered a rehash and data actually moved.
+	# Require 100 packets beyond baseline to rule out stray
+	# control packets (ND, etc.).  Allow 60s for multiple RTO
+	# cycles with exponential backoff.
+	slowwait 60 dev_tx_packets_above \
+		"$NS1" "veth${inactive_idx}a" "$((inactive_before + 100))"
+	check_err $? "data did not appear on alternate path after blocking"
+
+	local rehash_after
+	rehash_after=$(get_netstat_counter "$NS1" TcpTimeoutRehash)
+	if [ "$rehash_after" -le "$rehash_before" ]; then
+		check_err 1 "TcpTimeoutRehash counter did not increment"
+	fi
+
+	log_test "Local ECMP midstream rehash: block active path"
+}
+
+# Block the receiver's (NS2) ACK return paths while data flows from
+# NS1 to NS2.  The sender (NS1) times out and retransmits with a new
+# flowlabel; the receiver detects the changed flowlabel via
+# tcp_rcv_spurious_retrans() and rehashes its own txhash so that its
+# ACKs try a different ECMP return path.
+test_ecmp_midstream_ack_rehash()
+{
+	RET=0
+	local port=$((PORT + 3))
+
+	ip netns exec "$NS2" socat -u \
+		"TCP6-LISTEN:$port,bind=[fd00:ff::2],reuseaddr" - >/dev/null &
+	defer kill_process $!
+
+	wait_local_port_listen "$NS2" "$port" tcp
+
+	local base_tx0 base_tx1
+	base_tx0=$(link_tx_packets_get "$NS1" veth0a)
+	base_tx1=$(link_tx_packets_get "$NS1" veth1a)
+
+	# Continuous data source from NS1 to NS2.
+	ip netns exec "$NS1" timeout 120 socat -u \
+		OPEN:/dev/zero \
+		"TCP6:[fd00:ff::2]:$port,bind=[fd00:ff::1]" &>/dev/null &
+	defer kill_process $!
+
+	# Wait for data to start flowing.
+	busywait "$BUSYWAIT_TIMEOUT" until_counter_is \
+			">= $((base_tx0 + base_tx1 + 10))" \
+		link_tx_packets_total "$NS1" > /dev/null
+	check_err $? "no TX activity detected"
+	if [ "$RET" -ne 0 ]; then
+		log_test "Local ECMP midstream ACK rehash: blocked return path"
+		return
+	fi
+
+	local rehash_before
+	rehash_before=$(get_netstat_counter "$NS2" TcpDuplicateDataRehash)
+
+	# Block both return paths from NS2 so ACKs are dropped.
+	# Data from NS1 still arrives (tc filter is on egress).
+	block_tcp "$NS2" veth0b
+	defer unblock_tcp "$NS2" veth0b
+	block_tcp "$NS2" veth1b
+	defer unblock_tcp "$NS2" veth1b
+
+	# NS1 will RTO (no ACKs), retransmit with new flowlabel.
+	# NS2 detects the flowlabel change via tcp_rcv_spurious_retrans(),
+	# rehashes, and NS2's ACKs try a different ECMP return path.
+	# Wait until both NS2 interfaces have dropped at least one ACK.
+	slowwait 60 both_devs_attempted "$NS2" veth0b veth1b
+	check_err $? "ACKs did not appear on both return paths"
+
+	local rehash_after
+	rehash_after=$(get_netstat_counter "$NS2" TcpDuplicateDataRehash)
+	if [ "$rehash_after" -le "$rehash_before" ]; then
+		check_err 1 "TcpDuplicateDataRehash counter did not increment"
+	fi
+
+	log_test "Local ECMP midstream ACK rehash: blocked return path"
+}
+
+# Establish a DCTCP data transfer with PLB enabled, then ECN-mark both
+# paths.  Sustained CE marking triggers PLB to call sk_rethink_txhash()
+# + sk_dst_reset(), bouncing the connection between ECMP paths.  Verify
+# data appears on both paths and that TCPPLBRehash incremented.
+test_ecmp_plb_rehash()
+{
+	RET=0
+	local port=$((PORT + 4))
+
+	# DCTCP is a restricted congestion control algorithm.  Setting it
+	# as the default in the init namespace makes it globally
+	# non-restricted (TCP_CONG_NON_RESTRICTED), allowing child
+	# namespaces to use it.
+	local saved_cc
+	saved_cc=$(sysctl -n net.ipv4.tcp_congestion_control)
+	modprobe tcp_dctcp 2>/dev/null
+	if ! sysctl -qw net.ipv4.tcp_congestion_control=dctcp; then
+		log_test_skip "Local ECMP PLB rehash: DCTCP not available"
+		return "$ksft_skip"
+	fi
+	defer sysctl -qw net.ipv4.tcp_congestion_control="$saved_cc"
+
+	# Enable ECN and DCTCP with PLB on the sender.
+	ip netns exec "$NS1" sysctl -qw net.ipv4.tcp_ecn=1
+	ip netns exec "$NS1" sysctl -qw net.ipv4.tcp_congestion_control=dctcp
+	ip netns exec "$NS1" sysctl -qw net.ipv4.tcp_plb_enabled=1
+	ip netns exec "$NS1" sysctl -qw net.ipv4.tcp_plb_rehash_rounds=3
+	ip netns exec "$NS1" sysctl -qw net.ipv4.tcp_plb_cong_thresh=1
+	ip netns exec "$NS1" sysctl -qw net.ipv4.tcp_plb_suspend_rto_sec=0
+	defer ip netns exec "$NS1" sysctl -qw net.ipv4.tcp_ecn=0
+	defer ip netns exec "$NS1" sysctl -qw net.ipv4.tcp_congestion_control=cubic
+	defer ip netns exec "$NS1" sysctl -qw net.ipv4.tcp_plb_enabled=0
+
+	# DCTCP sets ECT on the SYN; the receiver must also use DCTCP
+	# so that tcp_ca_needs_ecn(listen_sk) accepts the ECN
+	# negotiation.
+	ip netns exec "$NS2" sysctl -qw net.ipv4.tcp_ecn=1
+	ip netns exec "$NS2" sysctl -qw net.ipv4.tcp_congestion_control=dctcp
+	defer ip netns exec "$NS2" sysctl -qw net.ipv4.tcp_ecn=0
+	defer ip netns exec "$NS2" sysctl -qw net.ipv4.tcp_congestion_control=cubic
+
+	ip netns exec "$NS2" socat -u \
+		"TCP6-LISTEN:$port,bind=[fd00:ff::2],reuseaddr" - >/dev/null &
+	defer kill_process $!
+
+	wait_local_port_listen "$NS2" "$port" tcp
+
+	local base_tx0 base_tx1
+	base_tx0=$(link_tx_packets_get "$NS1" veth0a)
+	base_tx1=$(link_tx_packets_get "$NS1" veth1a)
+
+	ip netns exec "$NS1" timeout 90 socat -u \
+		OPEN:/dev/zero \
+		"TCP6:[fd00:ff::2]:$port,bind=[fd00:ff::1]" &>/dev/null &
+	local client_pid=$!
+	defer kill_process "$client_pid"
+
+	# Wait for data to start flowing before applying ECN marking.
+	busywait "$BUSYWAIT_TIMEOUT" until_counter_is \
+			">= $((base_tx0 + base_tx1 + 10))" \
+		link_tx_packets_total "$NS1" > /dev/null
+	check_err $? "no TX activity detected"
+	if [ "$RET" -ne 0 ]; then
+		log_test "Local ECMP PLB rehash: ECN-marked path"
+		return
+	fi
+
+	# Snapshot TX counters and rehash stats before ECN marking.
+	local pre_ecn_tx0 pre_ecn_tx1
+	pre_ecn_tx0=$(link_tx_packets_get "$NS1" veth0a)
+	pre_ecn_tx1=$(link_tx_packets_get "$NS1" veth1a)
+
+	local plb_before rto_before
+	plb_before=$(get_netstat_counter "$NS1" TCPPLBRehash)
+	rto_before=$(get_netstat_counter "$NS1" TcpTimeoutRehash)
+
+	# CE-mark all data on both paths.  PLB detects sustained
+	# congestion and rehashes, bouncing traffic between paths.
+	mark_ecn "$NS1" veth0a
+	defer unblock_tcp "$NS1" veth0a	# removes the marking rule
+	mark_ecn "$NS1" veth1a
+	defer unblock_tcp "$NS1" veth1a	# removes the marking rule
+
+	# Wait for meaningful data on both paths, proving PLB rehashed
+	# the connection and traffic actually moved.  Require at least
+	# 100 packets beyond the baseline to rule out stray control
+	# packets (ND, etc.) satisfying the check.
+	slowwait 60 dev_tx_packets_above \
+		"$NS1" veth0a "$((pre_ecn_tx0 + 100))"
+	check_err $? "no data on veth0a after ECN marking"
+
+	slowwait 60 dev_tx_packets_above \
+		"$NS1" veth1a "$((pre_ecn_tx1 + 100))"
+	check_err $? "no data on veth1a after ECN marking"
+
+	local plb_after rto_after
+	plb_after=$(get_netstat_counter "$NS1" TCPPLBRehash)
+	rto_after=$(get_netstat_counter "$NS1" TcpTimeoutRehash)
+	if [ "$plb_after" -le "$plb_before" ]; then
+		check_err 1 "TCPPLBRehash counter did not increment"
+	fi
+	if [ "$rto_after" -gt "$rto_before" ]; then
+		check_err 1 "TcpTimeoutRehash incremented; rehash was RTO-driven, not PLB"
+	fi
+
+	log_test "Local ECMP PLB rehash: ECN-marked path"
+}
+
+require_command socat
+
+trap cleanup_all_ns EXIT
+setup || exit $?
+tests_run
+exit "$EXIT_STATUS"
-- 
2.53.0-Meta

