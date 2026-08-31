Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA533AE706
	for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 21:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788213123; cv=none; b=bRuord7eb5cCXsletN/90auM9FkR0/V+7t36T8x9Kam+THEFEbU9KHfw+DAd3erYAroijxmC7DHwhAiWKHPu47XKw25CMBS/VL8zp8VJ07rtLpHct5p0Yn04n/Jn19g/zaV/5sSNF1L4+GQiq3x6GXE43pJJiLtEbiVZy8KBnQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788213123; c=relaxed/simple;
	bh=SxxpWGf9pRNuCBPbGr/fyUHi9zr4zYOgFQXFR7nQNrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tZow4lOwV0rsjADHPvBu+xWEzuVFSCN55rC0D2diQz9/PmhKRx95JvJhXaoQ/JLs2TmwxzeIK01EFSX4zkueivGhBhCasqJdX5OVB1n0YbCHNC01FY2s4J+z7agNKwb2U5jtrSLxwc7mk3hQSqGKyNZSDiiMKleQw6WgEP45hiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZW45Oax; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZW45Oax"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b4ab40d839so3924934e87.3
        for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 14:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788213116; x=1788817916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bbE76zffGm5eOpH0C3tIgIhboyJHtbbJ0ikPzbJ0EIk=;
        b=IZW45OaxEUxvHoKjcnsr9wChlNf8GXlnum6sxfkVRdDf8pmah2CponSQ60gNfVpXs3
         TOK6YmeHpH/wuBE8xiMEzt3bzKdojm57xsv3MRGN85/099fEitxaVTS/rqMTKlxmA0iE
         AG/ZWI68c0ubbuAS3HAKqXDMnascOhlV3BNCqvdH5WIUrlVHcYmyl7ktQWEjfRglTFmk
         yt1D1VGou6FqiyonG7kBtqS+lsk6yGC0Hjk0V2f+pFn1sTpUbWF3ub1r8mJK/83KyXZH
         WhLNMXoZcnZK9AyoH0LUTrlYzOxqc1AICrw+3wd0OQ7BBWr43KEC/WqNqRJv65fvzl7P
         qdMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788213116; x=1788817916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bbE76zffGm5eOpH0C3tIgIhboyJHtbbJ0ikPzbJ0EIk=;
        b=oXnmGvpl0ZyfRCy9VWr6dv1Frs9lGvCSRqNwAnjmCdsfTeqavgxVfudpVzy4GyJCCm
         0CMqoxny5MA3DA1XPXzGILpnOBRZiA5TpvyLt1giaIr/Uhsbh3yZI2bgUYN65S7ZySX1
         aJAJE5WTbUJRpzlkt5b75mHxGjQpmez1GRvCy4k4QBODS+8KPKrhEN8tijeOmm5YfWnl
         NY/n13wFckIAxONdbwhSWB7yeUrsVXa0OBxavOdlkZV5YTv9fOloYjmUyWwvRvMf5jmw
         7uJKOeZwNnsPYoHr7p8iAv++WLnoiVA7xv7kpq171wMRfnTQUjTNWbgnGIH7ov6UHpoG
         32fg==
X-Forwarded-Encrypted: i=1; AKwUvBzVehKEr2KDY1jsu7awa0Qkh3M5xbpuSYP3C1CPRcG3hM225AA6ThUqAKeUXpRAgGJJdnkKgUnT9GTwIHUjqI4=@vger.kernel.org
X-Gm-Message-State: AFuF++kmUHyc2qbTjP5cOQmtcB00Lq9bIVGJ8nYCqiileS7zbWrIbH77
	ORxB5oAwrIpqv/JWHVDLnupGU0b7KJ84+hECD5UifQA+iVm5Zc1G+U5e
X-Gm-Gg: AYBFou2hAnofyoSLGBXpYt7WF1Bc3NvM3dwPVqMhYljCeegEBMarh4QcC/Gw5LIGC38
	Jar0r8VlYuIQIbO4i7qkuIiDOFe1NFDXuu4ImduvKQi/Zbsk7wy5e3Iv0bIgy1xTEXYG/KcbIJN
	pUY5bR7LDyiKpLxkbMB8YbXnsPsc8iZ8uHmjBbKiqmzrcaFMXOIX6I9S14QT1ftyRTYVWP24n3c
	VeD3U3bSeZLKgPniruf/8T6qSctAeI9f0z1ocv9vpOOJCz7dRjUqW1qt5dYmC8S/GazhOUderxG
	qOK3tvVyMKwtmwPdtpKFvg7+NMu73yNIYszptHIdMIClEZ9hWXv5Kh8WhQ7M4jAcpSsIitX6+j/
	/mSA/MWlLdF2XSRtfBrSjBNMqEiOAiwgSTbTANTxwM7tlobweDvmHhXkTG/OFn/hyoGbyRxbv6S
	CZc4kEqPydflHzLpbuXtLUHBj4RCAs3s3Q/7aLniDGQ6cniWfPY/FDmXUQxNgUb3qOKx0A9novz
	n9YJCRgqe0RCeBMyz4T86TCzIlgl6Pj2g==
X-Received: by 2002:a05:6512:224c:b0:5b1:4c6f:92f9 with SMTP id 2adb3069b0e04-5b5fe0ea9f5mr1112459e87.20.1788213115911;
        Mon, 31 Aug 2026 14:51:55 -0700 (PDT)
Received: from dau-home-pc.. ([212.35.184.237])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e8a06a77sm2388782e87.48.2026.08.31.14.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:51:55 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 03/11] selftests: net: add a test for the tunnel RX drop reasons
Date: Tue,  1 Sep 2026 00:51:29 +0300
Message-ID: <20260831215137.549324-4-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260831215137.549324-1-littlesmilingcloud@gmail.com>
References: <20260831215137.549324-1-littlesmilingcloud@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exercise the two drop reasons added to ip_tunnel_rcv() and
__ip6_tnl_rcv() for the cases they were introduced for, on both GRE and
ip6gre:

 - a receiver configured with 'iseq' or 'icsum' facing a sender that
   emits neither reports IP_TUNNEL_CFG_OPTS_MISMATCH,

 - recreating the tunnel device on the sender resets its outgoing
   sequence number the way a peer reboot would, and the receiver then
   reports IP_TUNNEL_OLD_SEQ.

A control case, where both endpoints agree on the options, makes sure
that no tunnel drop reason is reported when the packets are accepted.

The reasons are read from the skb:kfree_skb tracepoint through a
dedicated trace instance, so that the test neither disturbs nor depends
on anything else using the tracing facility.  The test is skipped when
that instance cannot be set up.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 tools/testing/selftests/net/Makefile          |   1 +
 tools/testing/selftests/net/config            |   1 +
 .../selftests/net/tunnel_drop_reasons.sh      | 228 ++++++++++++++++++
 3 files changed, 230 insertions(+)
 create mode 100755 tools/testing/selftests/net/tunnel_drop_reasons.sh

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 0f5c178bc224..9acf364e8919 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -117,6 +117,7 @@ TEST_PROGS := \
 	test_vxlan_vnifiltering.sh \
 	tfo_passive.sh \
 	traceroute.sh \
+	tunnel_drop_reasons.sh \
 	txtimestamp.sh \
 	udpgro.sh \
 	udpgro_bench.sh \
diff --git a/tools/testing/selftests/net/config b/tools/testing/selftests/net/config
index 30d5fcb09a83..281633ff3aa9 100644
--- a/tools/testing/selftests/net/config
+++ b/tools/testing/selftests/net/config
@@ -14,6 +14,7 @@ CONFIG_CRYPTO_SM4_GENERIC=y
 CONFIG_DEBUG_INFO_BTF=y
 CONFIG_DEBUG_INFO_BTF_MODULES=n
 CONFIG_DUMMY=y
+CONFIG_ENABLE_DEFAULT_TRACERS=y
 CONFIG_GENEVE=m
 CONFIG_IFB=y
 CONFIG_INET_DIAG=y
diff --git a/tools/testing/selftests/net/tunnel_drop_reasons.sh b/tools/testing/selftests/net/tunnel_drop_reasons.sh
new file mode 100755
index 000000000000..eb19967ae7dd
--- /dev/null
+++ b/tools/testing/selftests/net/tunnel_drop_reasons.sh
@@ -0,0 +1,228 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Test the drop reasons reported by the generic tunnel RX path,
+# ip_tunnel_rcv() and __ip6_tnl_rcv().
+#
+# Two situations are checked, for both GRE and ip6gre:
+#
+#  - the options carried by the packet do not match the tunnel
+#    configuration, which is reported as IP_TUNNEL_CFG_OPTS_MISMATCH.
+#    It is triggered here by configuring the receiver with 'iseq' or
+#    'icsum' while the sender emits neither.
+#
+#  - the sequence number of the packet is older than the one expected by
+#    the tunnel, which is reported as IP_TUNNEL_OLD_SEQ.  It is
+#    triggered here by recreating the tunnel device on the sender, which
+#    resets its outgoing sequence number the same way a peer reboot
+#    would.
+#
+# A control case, where both endpoints agree on the options, makes sure
+# that no tunnel drop reason is reported when packets are accepted.
+#
+# Drop reasons are read from the skb:kfree_skb tracepoint.  A dedicated
+# trace instance is used so that the test does not disturb, and is not
+# disturbed by, anything else using the tracing facility.
+
+source lib.sh
+
+NS_SND=""
+NS_RCV=""
+TRACE_DIR=""
+TR=""
+
+SND_V4=10.0.0.1
+RCV_V4=10.0.0.2
+SND_V6=2001:db8::1
+RCV_V6=2001:db8::2
+TUN_SND=192.168.1.1
+TUN_RCV=192.168.1.2
+
+cleanup()
+{
+	if [ -n "$TR" ]; then
+		echo 0 > "$TR/events/skb/kfree_skb/enable" 2>/dev/null
+		rmdir "$TR" 2>/dev/null
+	fi
+	cleanup_all_ns
+}
+
+trap cleanup EXIT
+
+setup_tracing()
+{
+	local dir
+
+	for dir in /sys/kernel/tracing /sys/kernel/debug/tracing; do
+		if [ -f "$dir/trace" ]; then
+			TRACE_DIR="$dir"
+			break
+		fi
+	done
+	[ -n "$TRACE_DIR" ] || return 1
+	[ -d "$TRACE_DIR/instances" ] || return 1
+	[ -e "$TRACE_DIR/events/skb/kfree_skb" ] || return 1
+
+	TR="$TRACE_DIR/instances/tunnel_drop_reasons"
+	mkdir "$TR" 2>/dev/null || return 1
+	echo 1 > "$TR/events/skb/kfree_skb/enable" || return 1
+}
+
+setup_ns_pair()
+{
+	cleanup_all_ns
+	setup_ns NS_SND NS_RCV
+
+	ip link add veth_s netns "$NS_SND" type veth \
+		peer name veth_r netns "$NS_RCV"
+	ip -n "$NS_SND" link set veth_s up
+	ip -n "$NS_RCV" link set veth_r up
+
+	ip -n "$NS_SND" addr add "$SND_V4/24" dev veth_s
+	ip -n "$NS_RCV" addr add "$RCV_V4/24" dev veth_r
+	ip -n "$NS_SND" addr add "$SND_V6/64" dev veth_s nodad
+	ip -n "$NS_RCV" addr add "$RCV_V6/64" dev veth_r nodad
+}
+
+# $1: namespace, $2: local, $3: remote, $4...: tunnel options
+add_gre()
+{
+	local ns=$1 loc=$2 rem=$3
+
+	shift 3
+	ip -n "$ns" link add gre_test type gre local "$loc" remote "$rem" "$@"
+	ip -n "$ns" link set gre_test up
+}
+
+# $1: namespace, $2: local, $3: remote, $4...: tunnel options
+add_ip6gre()
+{
+	local ns=$1 loc=$2 rem=$3
+
+	shift 3
+	ip -n "$ns" link add gre_test type ip6gre local "$loc" remote "$rem" \
+		"$@"
+	ip -n "$ns" link set gre_test up
+}
+
+addr_tunnels()
+{
+	ip -n "$NS_SND" addr add "$TUN_SND/24" dev gre_test
+	ip -n "$NS_RCV" addr add "$TUN_RCV/24" dev gre_test
+}
+
+send_traffic()
+{
+	ip netns exec "$NS_SND" ping -c 2 -W 1 "$TUN_RCV" >/dev/null 2>&1
+	# Let the tracepoint records reach the trace buffer.
+	sleep 1
+}
+
+# $1: test name, $2: expected reason, empty if none is expected
+check_reason()
+{
+	local name=$1 want=$2 count
+
+	echo > "$TR/trace"
+	send_traffic
+
+	if [ -n "$want" ]; then
+		count=$(grep -c "reason: $want" "$TR/trace")
+		if [ "$count" -gt 0 ]; then
+			RET=$ksft_pass
+		else
+			RET=$ksft_fail
+		fi
+		log_test "$name" "$count dropped"
+	else
+		count=$(grep -c "reason: IP_TUNNEL_" "$TR/trace")
+		if [ "$count" -eq 0 ]; then
+			RET=$ksft_pass
+		else
+			RET=$ksft_fail
+		fi
+		log_test "$name" "$count dropped"
+	fi
+}
+
+test_opts_mismatch()
+{
+	local proto=$1 opt=$2
+	local add=add_gre loc=$SND_V4 rem=$RCV_V4
+
+	if [ "$proto" = "ip6gre" ]; then
+		add=add_ip6gre
+		loc=$SND_V6
+		rem=$RCV_V6
+	fi
+
+	setup_ns_pair
+	# The sender emits no option, the receiver expects one.
+	$add "$NS_SND" "$loc" "$rem"
+	$add "$NS_RCV" "$rem" "$loc" "$opt"
+	addr_tunnels
+
+	check_reason "$proto: $opt option mismatch" \
+		IP_TUNNEL_CFG_OPTS_MISMATCH
+}
+
+test_old_seq()
+{
+	local proto=$1
+	local add=add_gre loc=$SND_V4 rem=$RCV_V4
+
+	if [ "$proto" = "ip6gre" ]; then
+		add=add_ip6gre
+		loc=$SND_V6
+		rem=$RCV_V6
+	fi
+
+	setup_ns_pair
+	$add "$NS_SND" "$loc" "$rem" oseq
+	$add "$NS_RCV" "$rem" "$loc" iseq
+	addr_tunnels
+
+	# Raise the sequence number expected by the receiver, then reset the
+	# one used by the sender, as a peer reboot would do.
+	send_traffic
+	ip -n "$NS_SND" link del gre_test
+	$add "$NS_SND" "$loc" "$rem" oseq
+	ip -n "$NS_SND" addr add "$TUN_SND/24" dev gre_test
+
+	check_reason "$proto: old sequence number" IP_TUNNEL_OLD_SEQ
+}
+
+test_control()
+{
+	setup_ns_pair
+	add_gre "$NS_SND" "$SND_V4" "$RCV_V4" oseq ocsum
+	add_gre "$NS_RCV" "$RCV_V4" "$SND_V4" iseq icsum
+	addr_tunnels
+
+	check_reason "gre: matching configuration (control)" ""
+}
+
+if [ "$(id -u)" -ne 0 ]; then
+	echo "SKIP: need root"
+	exit "$ksft_skip"
+fi
+
+if ! setup_tracing; then
+	echo "SKIP: could not set up a trace instance for skb:kfree_skb"
+	exit "$ksft_skip"
+fi
+
+test_opts_mismatch gre iseq
+test_opts_mismatch gre icsum
+test_control
+test_old_seq gre
+
+if [ -e /proc/sys/net/ipv6 ]; then
+	test_opts_mismatch ip6gre iseq
+	test_old_seq ip6gre
+else
+	log_test_skip "ip6gre: iseq option mismatch"
+	log_test_skip "ip6gre: old sequence number"
+fi
+
+exit "$EXIT_STATUS"
-- 
2.47.3

