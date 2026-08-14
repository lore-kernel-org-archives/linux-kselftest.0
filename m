Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEE639150E;
	Fri, 14 Aug 2026 19:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786736554; cv=none; b=i21+weW4Gi7jG/MXIE6GiDmZFRPBYrET7N7646GtD9j1qSHV5YscoColh6PWSbrGG/XkzkWuzh/+LIXrhr/WeTP8evFcPqLtnE3t5wf6LWFCtzq2lmeR2OL18GdW6td4rW0PErehJPNTmAX8QQ3Ht4y8kVcGxTPZAWfKv5/sAF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786736554; c=relaxed/simple;
	bh=cpvi0plwfu0ow9unueNDvtIgav+YmHKrmxm2KcOAloc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jFV2Mlw6tpKvz5xyqL3M+YTsytnl8OSzaSM07NcNhsqE8U0iczlQZCa5z46ckFUgGV6B9qD4mQikgIe25Ir4uESWK806+UqMeVQKz3H1Wg0w84NbVho1B9sxW54+frIgOAcT3hP/5LQDL+erg0sdMYHoMDJmEa2Knl+aI7s0ejo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im; spf=pass smtp.mailfrom=fastmail.im; dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b=Nj/XKHhc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ijA8dpBg; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.im
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b="Nj/XKHhc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ijA8dpBg"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 658F11D00091;
	Fri, 14 Aug 2026 15:42:32 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 14 Aug 2026 15:42:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.im; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1786736552; x=
	1786822952; bh=37bNzbgp9GM9RBXKW2gwf8uolBWavM+c+PoVfSDfi+E=; b=N
	j/XKHhcjXqIhx7z2USjsYV9+EaJfRDKctXH2u6XZNy3+jR8JNdBhYQpAh1lYY+pR
	XcyaNamF5WtdPisIspaPS5hj/QGFKSyjVmiy8WARoBMPxZQTfr47Vn3mw6RMJ6RK
	LqhnPDzbLRX6hYUTX1sTDiwzafh+BRJEY/RQL9EGazSLKN7F0DtR77rZgDoLQn0E
	tM7Ylct5SD90OsgSkA8WdL3ygOIdPJ7q8zFZvyZjBfddpuIs27SqmH2h/ZHhhcZi
	mxWwkSAn0P/EPmCi9QBR1s+lWit9zwTFCGpQKLDKjcqaOOAxvxdO0Qtha+8sz0/A
	zPu3t33V2hs0bJKidCK3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786736552; x=1786822952; bh=3
	7bNzbgp9GM9RBXKW2gwf8uolBWavM+c+PoVfSDfi+E=; b=ijA8dpBgDzcJ9UqMZ
	nMxMHz2isy4kZDqevuz+icABD3O/LeYmg4NxXjdMT4Qu8zOvIqtYhjzVE0kzqrPS
	oFwkSIJ6C5VTMbAmj3Nb/uK1mhTbcSSF55mvxrBxZ9XwT5/jHojhOWxEfwaPGTf7
	9x0T7Qf3ykiQ5f+YlGfk0YC7eXnnxOmD7DeuvRfXqJ2m64WlPT4vn20TP35WW5YY
	ILmfMMPJbAdu88D2EzYZEaH1hgrWGzmhKXvGQ2gJ0BkmYAbxACo3NaElvwLIFQzC
	H58+QlAWbeaGlEX5hPR6LcJ0GsWt/mFn34KuHOPLPp1+myPYufne7m0JnDbs4BSO
	/fY1A==
X-ME-Sender: <xms:qG9_au5HC-dXhYu4M4sa_PSvmXf5JWtdePK6GDTw7k-G4MNsfqkRoA>
    <xme:qG9_aq91SmbViF2RDQXWujpS7HGi3M8GDdRJc1nZpPbFKXpbGePidH2L_HYThQ3TC
    wwneDZdkI9eMkIhNMeLnarRElIfTBnvI7beZQYJGDC5r3AXBvmpm4s>
X-ME-Received: <xmr:qG9_aoEt4Q5ciU2nNsJ_uz50ED2kaWZlFBCK8sC8PbfdmcdOsF9m3MlfxPVdKoGc1iJa4WC3k_aRCcuLr6oVuma-IQ>
X-ME-Proxy-Cause: dmFkZTF5RcHVIOFJBS4QMFSy2DmxeH9magFI+UxI8S7HhKrs9u31RwDCMVbeK2o4gOn5en
    XLjwt96IhDBCQj6fyNcZjMIk+6+xfew9M6WLIDl6vcvMj8u/FvuFP+2s0XmcCmkdCX7DjZ
    /F8DsXzTyP1dOHQsQDIf9wk9Iee+HKlYuOo0RJOG+Y9hqZuFJtHMYcAbf6B3pCZC/bBN6A
    nOWeygqW2ORnFkc8X6eqEg/Ho+gaz8cuCMgO8/KP2u9b/6z8PggpFbXbInsgdtxnAK1/j4
    3ckuw94J9Y7UYRLLhLMq5idSVidfl3zyEFrHu4CdwsykSbDzaspufv+EpWdJXeu+n6/Vbm
    +P2cdeocmDGzUv9ROl6GGGLdE60d9t4f+h+1bnPsCKGojEBbE15hLKa3+rOJzuFMncRBbv
    JIAspBrlk9oiCWCe0QjSdKRxA12a2Za45r/CZB5qlN9XLMOJu1U2i4/yeptW0/fVnexo+O
    LVKpTh0DTrwNSJNnDE2WKwJIKAYU4D7Mt6ybDUpn6OSbj1SCIYUhxvCD+OuJLh0a0dz1Da
    n+oEWa6XEwbaMLGkBqGS+GaQaxhnGnY/4laMrV1g0co3EdV2dTAvaXkknrFwAThdySyGKi
    KryNZgNuCMpElcRoE5wYs5S8oFzETCbB0VnW6obIYZkzuLTQVrNzk9LWjoKw
X-ME-Proxy: <xmx:qG9_anW9sE5OVsjcxcWv2-HkfNxjX1uKfeoT2pKZc9tegGzVcNyrmg>
    <xmx:qG9_as8xFP2DasbttxBgrMoBYvfOP9zZItj5wNOP2NnsxPcNmdXHTA>
    <xmx:qG9_as4_nxUdgfmx3Adm0q4HFpSoTpAGoDTwtobONABHqw7DfezzTA>
    <xmx:qG9_atkAhEcUZWJEKDZRgKi2mk6zGI9l4tfAEwyATuJqUpScSE0eDQ>
    <xmx:qG9_arD5BU6LSiFGXg0nDX22PorGr64-G5LBDqppdzkr5CfwuQbKwBuv>
Feedback-ID: i559e4809:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Aug 2026 15:42:31 -0400 (EDT)
From: Alice Mikityanska <alice.kernel@fastmail.im>
To: Matthieu Baerts <matttbe@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Alice Mikityanska <alice@isovalent.com>
Subject: [PATCH net-next 4/4] selftests: net: Fix slow configurations in big_tcp_tunnels.sh
Date: Fri, 14 Aug 2026 22:41:24 +0300
Message-ID: <20260814194124.3102581-5-alice.kernel@fastmail.im>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260814194124.3102581-1-alice.kernel@fastmail.im>
References: <20260814194124.3102581-1-alice.kernel@fastmail.im>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alice Mikityanska <alice@isovalent.com>

The combination of checksum offload disabled (that causes software GSO)
and CONFIG_DEBUG_NET=y is inherently slow. Depending on the CPU power
and load, RTT may increase, limiting sk_pacing_rate, so tcp_tso_autosize
caps SKBs at around 40 segments, and zero BIG TCP packets are produced.

Increase sysctl net.ipv4.tcp_min_tso_segs and set a bigger initial value
of CWND in these configurations to force BIG TCP.

Signed-off-by: Alice Mikityanska <alice@isovalent.com>
---
 tools/testing/selftests/net/big_tcp_tunnels.sh | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tools/testing/selftests/net/big_tcp_tunnels.sh b/tools/testing/selftests/net/big_tcp_tunnels.sh
index 1f1c811c563c..222de7c0c294 100755
--- a/tools/testing/selftests/net/big_tcp_tunnels.sh
+++ b/tools/testing/selftests/net/big_tcp_tunnels.sh
@@ -56,6 +56,8 @@ setup() {
 
 	ip netns exec "$SERVER_NS" netserver >/dev/null
 	wait_local_port_listen "$SERVER_NS" 12865 tcp
+
+	DEFAULT_TCP_MIN_TSO_SEGS=$(ip netns exec "$CLIENT_NS" sysctl -n net.ipv4.tcp_min_tso_segs)
 }
 
 setup_tunnel() {
@@ -142,6 +144,21 @@ do_test() {
 		IPTABLES_SACK=ip6tables
 	fi
 
+	if [ "$3" != 'on' ] && is_debug; then
+		echo 'Slow configuration; increasing net.ipv4.tcp_min_tso_segs and initcwnd'
+		ip netns exec "$CLIENT_NS" sysctl -w net.ipv4.tcp_min_tso_segs=52
+		if [ "$2" = 4 ]; then
+			ip -netns "$CLIENT_NS" \
+			    route change 192.168.2.0/24 dev tun0 initcwnd 100
+		else
+			ip -netns "$CLIENT_NS" -6 \
+			    route change 2001:db8::2:0/112 dev tun0 initcwnd 100
+		fi
+	else
+		ip netns exec "$CLIENT_NS" \
+		    sysctl -w net.ipv4.tcp_min_tso_segs="$DEFAULT_TCP_MIN_TSO_SEGS"
+	fi
+
 	ip netns exec "$SERVER_NS" "$IPTABLES" -w -t raw -I PREROUTING -i "${CAPTURE_IFACE}1" -m length ! --length 0:65535 -m comment --comment "bigtcp"
 	ip netns exec "$CLIENT_NS" "$IPTABLES" -w -t raw -I OUTPUT -o "${CAPTURE_IFACE}0" -m length ! --length 0:65535 -m comment --comment "bigtcp"
 	ip netns exec "$SERVER_NS" "$IPTABLES_SACK" -w -t raw -I OUTPUT -o "tun1" -p tcp -m tcp --tcp-flags ACK ACK --tcp-option 5 -m comment --comment "sack"
-- 
2.55.0

