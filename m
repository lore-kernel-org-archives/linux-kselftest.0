Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556E72E2DFB
	for <linux-kselftest@vger.kernel.org>; Sat, 18 Apr 2026 19:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776542341; cv=none; b=ZPb8cli3Tytfa1tWQTogq+2KcI0IoUp3Pq1KpTO+e808OKZ9wz6sWdi9Sk2mR/HvMoaENWsaDqCoD+kJ1YSup+tZPDZ/logWlAI/qosWbgwoD8wtQJIr7JzJg1qBEzSnnd4IKEV4ignxnOBLxmkcYx35xDDoFSr/TPtk2qxh/0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776542341; c=relaxed/simple;
	bh=g+jbqedVJeXVkDa41E9XlF9r/7lQOFTqNLPXjDQEnlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qbyYwEfU1V+VYWd8htx2b8on/p1XNzwUWIB5pOKl8dv7RHAOy29Lu5M/07b/xBmu13mDRSILaS4d94KIe5PmoNkbjqWkcZHqxXIINjyiu7xuM3uo7v6YAw33w92Kk3PPfSsivEtcmbPTgZxwtHypvHSN4GDWnJLRnphlq9hvKNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Snvl1j2j; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Snvl1j2j"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso13078265e9.0
        for <linux-kselftest@vger.kernel.org>; Sat, 18 Apr 2026 12:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776542338; x=1777147138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tm2PCGa1F10nJuRUcP6mAyFe2uLBjcoG5dv2Op3y66U=;
        b=Snvl1j2jPaRYyS/BArRe630VPb4NfR7OSMs9o2Lf/4Ir7Woa8sYFSdSU4/AbOqJZn2
         rjDCY2xWDxTTn5b/kgk2VfTWR0Q8sq9+VaBxNOGuaBDYxv2+Mwbu8RTwbDLcMtOOuzbg
         plG2kntcEsywSVXyqfWE6Y/QYhLFzGH9mt+SMDkttE/NAD1tGL9Jpw74Q3ls7gNNzmIq
         UVYe+109de7YeZkRayHeh+HElHFq2DGy98BuC6cNJJw9GBKDVDCyZ8SoSOUxymY5N75Y
         pBRWSFkiqY4CwK8kPEKKjHfQucVVfF6HJ3QRa4gkPlv/3dIoOlSuBNmyNFbCFWRUQGBI
         VKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776542338; x=1777147138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tm2PCGa1F10nJuRUcP6mAyFe2uLBjcoG5dv2Op3y66U=;
        b=blTteQHTZ/6z8IoqD2wW1BZkS1GIUkr9HttmlDLORREfdY5jJqMHPOCyI28pr8cDA4
         ARrxmi4OQ89wG5thnQO+JDXXWKeClLvKCXgeHVJjjOy8QLIDO63pMsXyzmdYyRWUFtCn
         FtB8Rmhv3gCGtxkJ7y0Vg0puMHBTbpgdeHjQvNy4lEpR9pJtjoUQwgCcjhjjQGKgybCP
         FM1unXUjqnvlx8oHr7dENDSdh88f2Do4TVEIMD+IcOnIyQCsuiqVwUPzfxj0o2HVQkTB
         BjiwHXSHEDTbXeaYgfqfjvOyvXd8c4UuDUvDJ5vz5247DwgcDIVxJSIZMr8GBI0muZjc
         CNHA==
X-Forwarded-Encrypted: i=1; AFNElJ/KiMa1r/V6x4WzcvfZY6036/3VBLg2AvPryke8tw3Z+kzse/2KB0ZmZ28z2kxqidmJOTGsvjWZFUj2sDcbTVU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtWnlpnpZF0H854HItk4tcmlJ9PSixTQbsAkxCvzXHMpuARANW
	ihNTpd+yyHfRYG0GkmokiAYpYWHUknoRzbrRQW9xWK+W1z+qtOOC3AAp
X-Gm-Gg: AeBDievNypbj7I3AmfK/PSeyn/YmFEDY9R/t+65vkPYZB1etXfU/gzElPpxwGu19W2q
	//7LsZgR8tCM89nMIZwycnSsdvifuktm4lN2Yj7mFJtLd0ILq1OQfi7+Atgw11gxmqJ1q6mlEyO
	zDeHA4Ygp39loWVjqm8/CaekEnXTZRji2ZgTlwGi5USdyEri3GUU/O71Rv4XRSXfB+uKbeBg5ZM
	zy6FMSjqaTGQXWT2OQDGXX9DGkaYRJlCvCi8MQCVPJ1sQV1vw9IZcNdHtzUCJQu+TEPZox07DKr
	rDmzM5uys8ve1NcFjpp4s3kaOf7uZv1dqcbzptC5GdEaTntNGAoYpl+VrUjnhMGRlG9qkN4puKG
	gfINvg20BXwfgBmYqIsi9lusA0D9NrZhnc+U+HftPwXL4hGJ4puxwQXMdf+q5LaMCrlk4t9Mx/q
	IA52d65l7bp1Y=
X-Received: by 2002:a05:600c:a404:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-488fb73b2a3mr96678055e9.5.1776542337501;
        Sat, 18 Apr 2026 12:58:57 -0700 (PDT)
Received: from yiche-laptop ([2a09:0:1:2::30c5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb78becdsm72593675e9.5.2026.04.18.12.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 12:58:57 -0700 (PDT)
From: Yi Chen <yiche.cy@gmail.com>
To: Yi Chen <yiche.cy@gmail.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	Long Xin <lucien.xin@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: coreteam@netfilter.org,
	netfilter-devel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net v2] selftests: netfilter: conntrack_sctp_collision.sh: Introduce SCTP INIT collision test
Date: Sun, 19 Apr 2026 03:58:43 +0800
Message-ID: <20260418195843.303946-1-yiche.cy@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing test covered a scenario where a delayed INIT_ACK chunk
updates the vtag in conntrack after the association has already been
established.

A similar issue can occur with a delayed SCTP INIT chunk.

Add a new simultaneous-open test case where the client's INIT is
delayed, allowing conntrack to establish the association based on
the server-initiated handshake.

When the stale INIT arrives later, it may get recorded and cause a
following INIT_ACK from the peer to be accepted instead of dropped.
This INIT_ACK overwrites the vtag in conntrack, causing subsequent
SCTP DATA chunks to be considered as invalid and then dropped by
nft rules matching on ct state invalid.

This test verifies such stale INIT chunks do not cause problems.

Signed-off-by: Yi Chen <yiche.cy@gmail.com>
Acked-by: Xin Long <lucien.xin@gmail.com>
---
v1 -> v2:
- Simplify conf_delay() by passing arguments.
- Avoid calling exit() inside the function.
- Enable nft log by setting net.netfilter.nf_log_all_netns=1.
- Add a description for the "ct invalid drop" rule match.
---
 .../net/netfilter/conntrack_sctp_collision.sh | 85 ++++++++++++++-----
 1 file changed, 63 insertions(+), 22 deletions(-)

diff --git a/tools/testing/selftests/net/netfilter/conntrack_sctp_collision.sh b/tools/testing/selftests/net/netfilter/conntrack_sctp_collision.sh
index d860f7d9744b..31823050391e 100755
--- a/tools/testing/selftests/net/netfilter/conntrack_sctp_collision.sh
+++ b/tools/testing/selftests/net/netfilter/conntrack_sctp_collision.sh
@@ -2,18 +2,32 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Testing For SCTP COLLISION SCENARIO as Below:
-#
+# 1. Stale INIT_ACK capture:
 #   14:35:47.655279 IP CLIENT_IP.PORT > SERVER_IP.PORT: sctp (1) [INIT] [init tag: 2017837359]
 #   14:35:48.353250 IP SERVER_IP.PORT > CLIENT_IP.PORT: sctp (1) [INIT] [init tag: 1187206187]
 #   14:35:48.353275 IP CLIENT_IP.PORT > SERVER_IP.PORT: sctp (1) [INIT ACK] [init tag: 2017837359]
 #   14:35:48.353283 IP SERVER_IP.PORT > CLIENT_IP.PORT: sctp (1) [COOKIE ECHO]
 #   14:35:48.353977 IP CLIENT_IP.PORT > SERVER_IP.PORT: sctp (1) [COOKIE ACK]
 #   14:35:48.855335 IP SERVER_IP.PORT > CLIENT_IP.PORT: sctp (1) [INIT ACK] [init tag: 164579970]
+#   (Delayed)
+#
+# 2. Stale INIT capture:
+#   14:35:48.353250 IP SERVER_IP.PORT > CLIENT_IP.PORT: sctp (1) [INIT] [init tag: 1187206187]
+#   14:35:48.353275 IP CLIENT_IP.PORT > SERVER_IP.PORT: sctp (1) [INIT ACK] [init tag: 2017837359]
+#   14:35:48.353283 IP SERVER_IP.PORT > CLIENT_IP.PORT: sctp (1) [COOKIE ECHO]
+#   14:35:48.353977 IP CLIENT_IP.PORT > SERVER_IP.PORT: sctp (1) [COOKIE ACK]
+#   14:35:47.655279 IP CLIENT_IP.PORT > SERVER_IP.PORT: sctp (1) [INIT] [init tag: 2017837359]
+#   (Delayed)
+#   14:35:48.855335 IP SERVER_IP.PORT > CLIENT_IP.PORT: sctp (1) [INIT ACK] [init tag: 164579970]
 #
 # TOPO: SERVER_NS (link0)<--->(link1) ROUTER_NS (link2)<--->(link3) CLIENT_NS
 
 source lib.sh
 
+checktool "nft --version" "run test without nft"
+checktool "tc -h" "run test without tc"
+checktool "modprobe -q sctp" "load sctp module"
+
 CLIENT_IP="198.51.200.1"
 CLIENT_PORT=1234
 
@@ -24,7 +38,8 @@ CLIENT_GW="198.51.200.2"
 SERVER_GW="198.51.100.2"
 
 # setup the topo
-setup() {
+topo_setup() {
+	# setup_ns cleans up existing net namespaces first.
 	setup_ns CLIENT_NS SERVER_NS ROUTER_NS
 	ip -n "$SERVER_NS" link add link0 type veth peer name link1 netns "$ROUTER_NS"
 	ip -n "$CLIENT_NS" link add link3 type veth peer name link2 netns "$ROUTER_NS"
@@ -38,35 +53,53 @@ setup() {
 	ip -n "$ROUTER_NS" addr add $SERVER_GW/24 dev link1
 	ip -n "$ROUTER_NS" addr add $CLIENT_GW/24 dev link2
 	ip net exec "$ROUTER_NS" sysctl -wq net.ipv4.ip_forward=1
+	sysctl -wq net.netfilter.nf_log_all_netns=1
 
 	ip -n "$CLIENT_NS" link set link3 up
 	ip -n "$CLIENT_NS" addr add $CLIENT_IP/24 dev link3
 	ip -n "$CLIENT_NS" route add $SERVER_IP dev link3 via $CLIENT_GW
+}
 
-	# simulate the delay on OVS upcall by setting up a delay for INIT_ACK with
-	# tc on $SERVER_NS side
-	tc -n "$SERVER_NS" qdisc add dev link0 root handle 1: htb r2q 64
-	tc -n "$SERVER_NS" class add dev link0 parent 1: classid 1:1 htb rate 100mbit
-	tc -n "$SERVER_NS" filter add dev link0 parent 1: protocol ip u32 match ip protocol 132 \
-		0xff match u8 2 0xff at 32 flowid 1:1
-	if ! tc -n "$SERVER_NS" qdisc add dev link0 parent 1:1 handle 10: netem delay 1200ms; then
+conf_delay()
+{
+	# simulate the delay on OVS upcall by setting up a delay for INIT_ACK/INIT with
+	local ns=$1
+	local link=$2
+	local chunk_type=$3
+
+	# use a smaller number for assoc's max_retrans to reproduce the issue
+	ip net exec "$CLIENT_NS" sysctl -wq net.sctp.association_max_retrans=3
+
+	tc -n "$ns" qdisc add dev "$link" root handle 1: htb r2q 64
+	tc -n "$ns" class add dev "$link" parent 1: classid 1:1 htb rate 100mbit
+	tc -n "$ns" filter add dev "$link" parent 1: protocol ip \
+		u32 match ip protocol 132 0xff match u8 "$chunk_type" 0xff at 32 flowid 1:1
+	if ! tc -n "$ns" qdisc add dev "$link" parent 1:1 handle 10: netem delay 1200ms; then
 		echo "SKIP: Cannot add netem qdisc"
-		exit $ksft_skip
+		return $ksft_skip
 	fi
 
 	# simulate the ctstate check on OVS nf_conntrack
-	ip net exec "$ROUTER_NS" iptables -A FORWARD -m state --state INVALID,UNTRACKED -j DROP
-	ip net exec "$ROUTER_NS" iptables -A INPUT -p sctp -j DROP
-
-	# use a smaller number for assoc's max_retrans to reproduce the issue
-	modprobe -q sctp
-	ip net exec "$CLIENT_NS" sysctl -wq net.sctp.association_max_retrans=3
+	ip net exec "$ROUTER_NS" nft -f - <<-EOF
+	table ip t {
+		chain forward {
+			type filter hook forward priority filter; policy accept;
+			meta l4proto icmp counter accept
+			ct state new counter accept
+			ct state established,related counter accept
+			ct state invalid log flags all counter drop comment \
+			"Expect to drop stale INIT/INIT_ACK chunks"
+			counter
+		}
+	}
+	EOF
+	return 0
 }
 
 cleanup() {
-	ip net exec "$CLIENT_NS" pkill sctp_collision >/dev/null 2>&1
-	ip net exec "$SERVER_NS" pkill sctp_collision >/dev/null 2>&1
+	# cleanup_all_ns terminates running processes in the namespaces.
 	cleanup_all_ns
+	sysctl -wq net.netfilter.nf_log_all_netns=0
 }
 
 do_test() {
@@ -81,7 +114,15 @@ do_test() {
 
 # run the test case
 trap cleanup EXIT
-setup && \
-echo "Test for SCTP Collision in nf_conntrack:" && \
-do_test && echo "PASS!"
-exit $?
+
+echo "Test for SCTP INIT_ACK Collision in nf_conntrack:"
+(topo_setup && conf_delay $SERVER_NS link0 2) || exit $?
+if ! do_test; then
+	exit $ksft_fail
+fi
+
+echo "Test for SCTP INIT Collision in nf_conntrack:"
+(topo_setup && conf_delay $CLIENT_NS link3 1) || exit $?
+if ! do_test; then
+	exit $ksft_fail
+fi
-- 
2.53.0

