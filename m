Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717429;
	b=XqeK20pSoRvbZ89yIZ+UfqaciPPeBx1wyi0WoFdf+g/Ql1wUm84ZaKZIwOBFqUt0LxqU
	 sBxV9eitRYG/Me9GWBVxTfvlnamGNfN7f1ziPl7LUK22yLBelOZmPbw8qHEPr7yM4bvhV
	 mWr71TFLp4/H1a3EE3dZhKXJWbh1EEgk+N+OQc+X7O/py1d6/AleaUthylR0JL1+0Y9YD
	 XrrnweqEQN09je1wnRgPLFLLwSJmub+RP431Mw0yQZ0sjBZR6Yx2P1Y3DjFrPpx7lGAmJ
	 mpEV1tjw9iLGQumF+Q6FjF7PcrMaKHTbUz/tN8MspGlJINgC5MEVohdTmQDbg7aEW2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=A+aU9SIn2Zhiu/uvRNR7gVgAVOlE/lo6ePmTFuyRaj0=;
	b=VKidgPXe07t9YlLHxC78IF2LU25IAjbDxDR1sH7fYAecZajxPqxnbK6t8UFLeDuTuFpT
	 +KG0C/jFc2zMLvGvf9YLIvaNIr6/R1VN3De846gXsjm80RTqnjsh3sFLykrt7rpOkFGYZ
	 2LCT4cp9QSqBAW/rPqWEzvY/9pySosoiwbfiIVUkOSM5E58hPhoHgWNdP4c5KDaiDpvu3
	 LfP0Rh6RZfFTucGC6O5QsOOJGMPyIgUQuuO3LDNveqA99trkMwaOz3Km2sZPPv2Tq4WRN
	 Sca2mbm3y7yeoa0i000EjSjstXszj+/4mZmC3nxvf4Uy2rdIAkp5CJXxNtsFqd+VkEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fibZm9iY;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE199606A331
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 18:23:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE199606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fibZm9iY
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-38190551625so14079516eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 10:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795717428; x=1796322228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A+aU9SIn2Zhiu/uvRNR7gVgAVOlE/lo6ePmTFuyRaj0=;
        b=fibZm9iYF/eIn7DgmoEyzNXyi1sM0myrQojelTiCIZ0v2qpA57jHvy5kdcSCwqLjIF
         k/Sn1bgxn9Pxf/9H4HwzeCIFhWvTeblR4ushegXzWwBoWQ+M97pxtuy9LmxjmWAuYiAK
         OUKqOu7bTP2maTMSRFToWN6DAIHiF1wvLlJdyE2vFmdhRv7Xie/0N1L6TNoXAZw/DL21
         9tQrSBv8KR+2pxiIdiBEflZNvS6Dkw4RPpxWV5BbrhkrUO/RCfup7NcKJcPskqIM72F7
         HWQCq2foq5fVij0N1+Pmzhuz0typshsuA/XHdBdhrNXmSVj5CdDIN+/QgjOI4xWj21Wz
         PAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795717428; x=1796322228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A+aU9SIn2Zhiu/uvRNR7gVgAVOlE/lo6ePmTFuyRaj0=;
        b=wCFXrfckNMueB4bJX8gqUyoJEn70RI1UVLiK7aTFiCJ6z4fA7wSiKp91pYtV7tA5P1
         okGzR39vLBAe/lxx5bKD51T7Ysg7RyQKgrijQPnWhvvt0Hl5fMpyucyk13shEtmyaa4Y
         weeOl7HvV4Vjy2uho+G2JVKChoFWjwe7LGBIHSZolabC9jBkxSdoImetsuZsQlsSK0kj
         92iEEe0mBs8wxdVEBrIcwAm2m3/gGSCCGfLEMB5SFS1XFm7kJhe0cjDFBYiL/r8zPCAN
         31FPIF4jh5qHFzbKJj3UynlavhSu+gG0bY0+v9lBiQTVrmObQ4uzIfTc3yCUnU/lZICz
         bWhA==
X-Forwarded-Encrypted: i=1; AL+hErGIb+KmTkczONYhuOxJhp5T8uEQneKiPLb9+2qmP137F3UvomSTrBZ80OAofAGW/1JavksXCNb75ObX/3qy+Zs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IY30d7SRtmqSYhgKcpDWv63moPkxghD0EJbT6+gofhCy3dUaV
	/HGIK7dRXM9J+euISNH7MUka1SK1+L+EB3BYymNlTY1i77gqCmDdj0wL
X-Gm-Gg: AZFdTZcBNYlg847NSrs4HkJJJwdVQIw1Ttxdx5BeijMYKSnTIUNp2RBkBEYB8iQD7j8
	MnMS3rHBuKRsAgJDgpSyX+M9jASOEV7uWHwO8Md/NjEKQj1IsueRg+BfDyVZxUmgojs2p8K3yst
	lMp8duBE9UuK9jHxz4ulZB1iITuI7CbPXwJxKwPi21jYeHgiBbgRUpf79c7REXxE8CSA7wIB/Vj
	r4dQfLjttyvbVnKsJMjFxbX/QvNOXgzfHnJ8b6pDJmstddMKFAfw6s5fFk1Tr8U7SKZ0ZCBderG
	N+9TLW6I3fYzYJ518CA6Qg955Yq41iPUpAZ8kTJHT07/4bkWBGNr3LK20KszYJGO3TUMRKKhKpL
	oEfKDZiaCKu+uE5sE0i3Vaa/QnWRPoWTRo97CWPMbBhSS/j/MTtxK1EPA1cQau5ENvHsbuFFkhH
	ZhJRKuQsUGzoFxPNUq4ZKroCw8EwWWzfUmGIWSgLklk0HTPqBK/0Rkb4nB0JzcvlQDLstwLiLFK
	BoLlEPykmwh1LjZH7ImMLnDzAnAznSgh7FMPaTiIq60g42RagYJgUw08KwmxY/sVa69pSCy5NY2
	SZozJFCcg1wTrCnNNgoPi9ObUGXl24MgOUWa7pSdDedA0V2hhJh/C5h5ki/NPTqU9Vh8pEXV/nG
	YJ9Zo5Bc=
X-Received: by 2002:a05:7300:bf10:b0:376:b957:bfb with SMTP id 5a478bee46e88-3856f7563b1mr27002049eec.17.1795717427481;
        Thu, 26 Nov 2026 10:23:47 -0800 (PST)
Received: from localhost.localdomain ([203.202.252.249])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386d605c894sm11826582eec.2.2026.11.26.10.23.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 10:23:46 -0800 (PST)
From: Zhefu Peng <ilskdw@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	kuniyu@google.com,
	mschiffer@universe-factory.net,
	nicolas.dichtel@6wind.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v7 2/2] selftests: net: add a test for vxlan snooping moving a MAC
Date: Fri, 27 Nov 2026 00:23:29 +0600
Message-ID: <20261126182329.91058-3-ilskdw@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261126182329.91058-1-ilskdw@gmail.com>
References: <20261126182329.91058-1-ilskdw@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a test for a learning VXLAN device that snoops a known MAC.

The first case moves the MAC from an on-link IPv4 remote to a remote
behind a router, and checks that traffic to the MAC still flows. Its
pings run on one CPU, because the route cache is per CPU and only the
CPU that filled it hits the stale entry. This case fails while the
device keeps the route cached for the previous remote.

The second case moves the MAC from a global IPv6 remote to a link-local
one, and checks that the FDB entry records the new output interface.
Both remotes are on-link, so this case checks the interface, not the
route cache.

The third case adds a dynamic entry with a "via" device, and checks
that traffic from the entry's remote leaves the device in place.

This test was written with the help of an AI coding assistant.

Signed-off-by: Zhefu Peng <ilskdw@gmail.com>
---
 tools/testing/selftests/net/Makefile          |   1 +
 .../selftests/net/test_vxlan_snoop_move.sh    | 222 ++++++++++++++++++
 2 files changed, 223 insertions(+)
 create mode 100755 tools/testing/selftests/net/test_vxlan_snoop_move.sh

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index baea3e7f0..69d440c5b 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -118,6 +118,7 @@ TEST_PROGS := \
 	test_vxlan_mdb.sh \
 	test_vxlan_nh.sh \
 	test_vxlan_nolocalbypass.sh \
+	test_vxlan_snoop_move.sh \
 	test_vxlan_under_vrf.sh \
 	test_vxlan_vnifilter_notify.sh \
 	test_vxlan_vnifiltering.sh \
diff --git a/tools/testing/selftests/net/test_vxlan_snoop_move.sh b/tools/testing/selftests/net/test_vxlan_snoop_move.sh
new file mode 100755
index 000000000..e1f0ebb19
--- /dev/null
+++ b/tools/testing/selftests/net/test_vxlan_snoop_move.sh
@@ -0,0 +1,222 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Check that a learning VXLAN device fully updates a remote when snooping
+# moves a known MAC to another VTEP:
+#
+# - The route cached for the old remote is dropped. The old remote is
+#   on-link and the new one is behind a router, so a stale cached route
+#   blackholes traffic to the moved MAC.
+# - The output interface follows the new remote. The MAC moves from a
+#   global IPv6 address to a link-local one, which needs an interface.
+# - Traffic from the remote of a dynamic entry keeps the entry's "via"
+#   device.
+
+# shellcheck disable=SC2154,SC2329 # set by setup_ns, run by tests_run
+source lib.sh
+
+ALL_TESTS="
+	test_move_behind_router
+	test_move_to_link_local
+	test_same_remote_keeps_via
+"
+
+MAC=02:00:c0:a8:00:0a
+
+ping_ns()
+{
+	local ns=$1; shift
+
+	ip netns exec "$ns" ping -c 3 -W 1 -i 0.2 "$@" &> /dev/null
+}
+
+ping_pinned()
+{
+	local ns=$1; shift
+
+	taskset -c "$CPU" ip netns exec "$ns" ping -c 3 -W 1 -i 0.2 "$@" \
+		&> /dev/null
+}
+
+add_sw_port()
+{
+	local ns=$1; shift
+	local dev=$1; shift
+	local port=$1; shift
+
+	ip link add "$dev" netns "$ns" type veth peer name "$port" netns "$sw"
+	ip -n "$sw" link set "$port" master br0 up
+	ip -n "$ns" link set "$dev" up
+}
+
+test_move_behind_router()
+{
+	local name="IPv4 move to a remote behind a router"
+
+	RET=0
+
+	if ! setup_ns sw ex a r b; then
+		log_test_skip "$name"
+		return
+	fi
+	defer cleanup_ns "$sw" "$ex" "$a" "$r" "$b"
+
+	ip -n "$sw" link add br0 up type bridge
+	add_sw_port "$ex" e0 s-e
+	add_sw_port "$a" a0 s-a
+	add_sw_port "$r" r0 s-r
+	ip link add r1 netns "$r" type veth peer name b0 netns "$b"
+	ip -n "$r" link set r1 up
+	ip -n "$b" link set b0 up
+
+	ip -n "$ex" addr add 10.0.1.1/24 dev e0
+	ip -n "$ex" route add default via 10.0.1.254
+	ip -n "$a" addr add 10.0.1.2/24 dev a0
+	ip -n "$r" addr add 10.0.1.254/24 dev r0
+	ip -n "$r" addr add 10.0.2.254/24 dev r1
+	ip netns exec "$r" sysctl -wq net.ipv4.ip_forward=1
+	ip -n "$b" addr add 10.0.2.2/24 dev b0
+	ip -n "$b" route add default via 10.0.2.254
+
+	ip -n "$ex" link add vx0 type vxlan id 42 dstport 4789 \
+		local 10.0.1.1 learning
+	bridge -n "$ex" fdb append 00:00:00:00:00:00 dev vx0 dst 10.0.1.2
+	bridge -n "$ex" fdb append 00:00:00:00:00:00 dev vx0 dst 10.0.2.2
+	ip -n "$ex" addr add 192.168.0.1/24 dev vx0
+	ip -n "$ex" link set vx0 up
+
+	ip -n "$a" link add vx0 address "$MAC" type vxlan id 42 dstport 4789 \
+		local 10.0.1.2 remote 10.0.1.1
+	ip -n "$b" link add vx0 address "$MAC" type vxlan id 42 dstport 4789 \
+		local 10.0.2.2 remote 10.0.1.1
+	ip -n "$a" addr add 192.168.0.10/24 dev vx0
+	ip -n "$b" addr add 192.168.0.10/24 dev vx0
+	ip -n "$a" link set vx0 up
+
+	ping_pinned "$ex" 192.168.0.10
+	check_err $? "ping before the move failed"
+
+	ip -n "$a" link set vx0 down
+	ip -n "$b" link set vx0 up
+	ip netns exec "$b" ping -c 1 -W 1 192.168.0.1 &> /dev/null
+
+	bridge -n "$ex" fdb show dev vx0 | grep -q "$MAC dst 10.0.2.2 "
+	check_err $? "fdb entry did not move to the new remote"
+
+	ping_pinned "$ex" 192.168.0.10
+	check_err $? "ping after the move failed"
+
+	log_test "$name"
+}
+
+test_move_to_link_local()
+{
+	local name="IPv6 move from a global to a link-local remote"
+	local ns
+
+	RET=0
+
+	if ! setup_ns sw ex a b; then
+		log_test_skip "$name"
+		return
+	fi
+	defer cleanup_ns "$sw" "$ex" "$a" "$b"
+
+	for ns in "$sw" "$ex" "$a" "$b"; do
+		ip netns exec "$ns" sysctl -wq net.ipv6.conf.all.accept_dad=0
+		ip netns exec "$ns" sysctl -wq \
+			net.ipv6.conf.default.accept_dad=0
+	done
+
+	ip -n "$sw" link add br0 up type bridge
+	add_sw_port "$ex" e0 s-e
+	add_sw_port "$a" a0 s-a
+	add_sw_port "$b" b0 s-b
+
+	ip -n "$ex" addr add 2001:db8:1::1/64 dev e0 nodad
+	ip -n "$ex" addr add fe80::1/64 dev e0 nodad
+	ip -n "$a" addr add 2001:db8:1::2/64 dev a0 nodad
+	ip -n "$b" addr add fe80::b/64 dev b0 nodad
+
+	ip -n "$ex" link add vx0 type vxlan id 42 dstport 4789 \
+		local 2001:db8:1::1 learning
+	bridge -n "$ex" fdb append 00:00:00:00:00:00 dev vx0 dst 2001:db8:1::2
+	bridge -n "$ex" fdb append 00:00:00:00:00:00 dev vx0 dst fe80::b via e0
+	ip -n "$ex" addr add 192.168.0.1/24 dev vx0
+	ip -n "$ex" link set vx0 up
+
+	ip -n "$a" link add vx0 address "$MAC" type vxlan id 42 dstport 4789 \
+		local 2001:db8:1::2 remote 2001:db8:1::1
+	ip -n "$b" link add vx0 address "$MAC" type vxlan id 42 dstport 4789 \
+		local fe80::b remote fe80::1 dev b0 nolearning
+	ip -n "$a" addr add 192.168.0.10/24 dev vx0
+	ip -n "$b" addr add 192.168.0.10/24 dev vx0
+	ip -n "$a" link set vx0 up
+
+	ping_ns "$ex" 192.168.0.10
+	check_err $? "ping before the move failed"
+
+	ip -n "$a" link set vx0 down
+	ip -n "$b" link set vx0 up
+	ip netns exec "$b" ping -c 1 -W 1 192.168.0.1 &> /dev/null
+
+	bridge -n "$ex" fdb show dev vx0 | grep -q "$MAC dst fe80::b via e0 "
+	check_err $? "fdb entry did not move to the new remote and interface"
+
+	ping_ns "$ex" 192.168.0.10
+	check_err $? "ping after the move failed"
+
+	log_test "$name"
+}
+
+test_same_remote_keeps_via()
+{
+	local name="Traffic from the same remote keeps the via device"
+
+	RET=0
+
+	if ! setup_ns sw ex a; then
+		log_test_skip "$name"
+		return
+	fi
+	defer cleanup_ns "$sw" "$ex" "$a"
+
+	ip -n "$sw" link add br0 up type bridge
+	add_sw_port "$ex" e0 s-e
+	add_sw_port "$a" a0 s-a
+
+	ip -n "$ex" addr add 10.0.1.1/24 dev e0
+	ip -n "$a" addr add 10.0.1.2/24 dev a0
+
+	ip -n "$ex" link add vx0 type vxlan id 42 dstport 4789 \
+		local 10.0.1.1 learning
+	bridge -n "$ex" fdb add "$MAC" dev vx0 dst 10.0.1.2 via e0 dynamic
+	ip -n "$ex" addr add 192.168.0.1/24 dev vx0
+	ip -n "$ex" link set vx0 up
+
+	ip -n "$a" link add vx0 address "$MAC" type vxlan id 42 dstport 4789 \
+		local 10.0.1.2 remote 10.0.1.1
+	ip -n "$a" addr add 192.168.0.10/24 dev vx0
+	ip -n "$a" link set vx0 up
+
+	ping_ns "$a" 192.168.0.1
+	check_err $? "ping from the remote failed"
+
+	bridge -n "$ex" fdb show dev vx0 | grep -q "$MAC dst 10.0.1.2 via e0 "
+	check_err $? "fdb entry lost its via device"
+
+	log_test "$name"
+}
+
+cleanup()
+{
+	defer_scopes_cleanup
+}
+
+require_command taskset
+CPU=$(taskset -pc $$ | sed 's/.*: //; s/[-,].*//')
+
+trap cleanup EXIT
+tests_run
+
+exit "$EXIT_STATUS"
-- 
2.54.0

