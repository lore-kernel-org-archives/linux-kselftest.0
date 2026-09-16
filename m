Received: from mail-pz2-f28.google.com (mail-pz2-f28.google.com [74.125.228.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F4048C8C7
	for <linux-kselftest@vger.kernel.org>; Wed, 16 Sep 2026 21:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789594723; cv=none; b=Oa+OC+0kr4EKd5Z0fHZbonlg1KMFHSI417ZCZ9Cc6EVXjZ+XozKdwjKGxa9ltCeuUcaXLbYTns6QHzsK1EV4EkLH5DOWJkW8oExeQEHwETJ0pcW6OkIZPlAqKKRoN/l53nfjktxrvrF9XYQkyotyL3vjEoYxTORRvAqreJJncpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789594723; c=relaxed/simple;
	bh=+YIq54X0UuVYVuR9Ls3BnI6IJMfiuc+TQ2tyluDUtzA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bsBXdOqFqgco5JmDJaCORZBlymoknHzQqqgHI3+7dlPvXkFkBEhnkfFQn2UnRL9z71hEbK+3qpDry7KtBYWQub7vbIBpd17Xlfcisud/Vo0iIedBwNeojvKeMU/EV/17XgS31KDgXVWxoAq7za++2WoGcEEKq8toVRKeTXPfLOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z6OGHS9X; arc=none smtp.client-ip=74.125.228.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z6OGHS9X"
Received: by mail-pz2-f28.google.com with SMTP id 41be03b00d2f7-cc4ab4fe290so35925a12.1
        for <linux-kselftest@vger.kernel.org>; Wed, 16 Sep 2026 14:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789594706; x=1790199506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E4oSSlXn4ycnPRRmpRIG08U5s07ZsIAZ2+Nia6ab8/Q=;
        b=Z6OGHS9X4c51Sm+d17BnUREukKVAXvCB74TfhEsGkYWb6W5yomVEZ7ahkK+2dhds2C
         OOUn1+62a3AKeATEnVUAyuyaApranPFh3RoIM6jx04qKVlyax3WoQjKP4vGvkxy68Oy2
         0yRbApQQQ9LLXgUsctc3eqrgecgSbWHapbUg+3AqS+ci/lVeqdwwc3GAkUS7ajeLKjHn
         Yp338+s+Ev0hOUts8LPpFmcQMNW+j1719tTiNToHOR/YH3OM6MJvFsCfdduN/tsG0YCM
         y64+ssw/CKRyU6OGUpxpGKFngxDOPH9EcWK67f66vyhrWivJVnBq+nPohA4OESEv/hKo
         RzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789594706; x=1790199506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E4oSSlXn4ycnPRRmpRIG08U5s07ZsIAZ2+Nia6ab8/Q=;
        b=DqBIMGQ7ElBMb3OQZCrS/BwUSVEJw5UIKfZiCZ6zct8vN49ACj+/pUN80nJ6f28HXy
         zp1Tge2K0GMGW4JcY+hwP6kSbPTrts+TmxfrBOcdQrOcN5fFZszlZR6eCfHrVWTrIWEE
         Q80y2NNDkrxtMM/JQg/M7AMT/B6C5X2ugsaIPYKD6DM/MM4C3CQUZtkRrE1Vh5qBph98
         LMgaz59vpDYojOmrscZjWuVDdSDovBP9LJKdRPAfr+8AS5ooadotq5w0W8nU09MVD/su
         30RBTI3krLZWTS9j73Kysjsi0XvArlNwXoMdINNMI+cJY8++widAOXWacDEDJBqXSefB
         dXqg==
X-Forwarded-Encrypted: i=1; AKwUvBxkwUMW2Tt/BEJx5fBwH2bvQBzz1AntwCVL6kRs+Wdyf8ahXgVW5fSx8ipBTYjbHtXwlB4GUMzF7FG8JYDhNYA=@vger.kernel.org
X-Gm-Message-State: AFuF++lWPZQ2/N/O4D5TxLVpIgxaI43GWqtJBVOK1X7L1mLSBMNni5PG
	VLKEbsgePRZ1kUM+8VriTdw3WDMyVMZ70PaEaBUiH+Hz+wXf+3JQ8gv/
X-Gm-Gg: AYBFou0Nf9EHv9fM9EN6NdsFgVa8TsyR/Su/rBEIzqdw1UpPfagT0KOX294ir02o9gm
	HPB+mEggxxp6/lDF4kY2mN9F/DzHYtRs6IOShsPYNRoI5hwzycacSlGrKcnIjLZ29TncsZxsYCv
	yvKBUKRLqYZs2BSerS3n0rV3kvEGGgvTFkitIVI+JPmVXhgr0aZ4OTwDjbELsF6eR/Dd/Sm6Od4
	YjcCPQmHCswFj7JAi3R8whfbnnFyavfwg0I7RyODJwicu35YNXaC2tpW6NVH/0aNG/B1f7BcwGH
	9kcAz6X4WhiqnpdfTNc+M6JwRGmSyN3S6lXox2J1wVIup0d7Q56i+7O+zPeGr2x7fYiYnQK5CQb
	nFNvT+udRyucckoJEMXgRE1ZKaGyMxbq9OfN8gXwt7/c1nDQxV5pXp8jQHgdHeFIFruO0Y8bABH
	qfzX2G6uLNw2es8xYtNBqQLDCT83v0O97zqRxHNsJibQ4B+AWAFW2d8kUksSbMLsa/idQPf+JqV
	BUDTTgynw==
X-Received: by 2002:a17:90b:2b90:b0:39e:1bfa:c5f0 with SMTP id 98e67ed59e1d1-39e35e304f9mr1384454a91.5.1789594706012;
        Wed, 16 Sep 2026 14:38:26 -0700 (PDT)
Received: from [163.43.103.131] ([163.43.103.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35d9f81asm1379913a91.3.2026.09.16.14.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 14:38:25 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Date: Thu, 17 Sep 2026 06:38:13 +0900
Subject: [PATCH RFC net-next v3 2/2] selftests: seg6: add selftest for
 End.MAP behavior
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-seg6-mobile-end-map-v3-2-9890a60ac6a7@gmail.com>
References: <20260917-seg6-mobile-end-map-v3-0-9890a60ac6a7@gmail.com>
In-Reply-To: <20260917-seg6-mobile-end-map-v3-0-9890a60ac6a7@gmail.com>
To: Andrea Mayer <andrea.mayer@uniroma2.it>, 
 Andrea Mayer <andrea@common-net.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>, 
 Ido Schimmel <idosch@nvidia.com>, Shuah Khan <shuah@kernel.org>
Cc: Justin Iurman <justin.iurman@gmail.com>, 
 Florian Westphal <fw@strlen.de>, 
 Fernando Fernandez Mancera <fmancera@suse.de>, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Yuya Kusakabe <yuya.kusakabe@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=22175;
 i=yuya.kusakabe@gmail.com; h=from:subject:message-id;
 bh=+YIq54X0UuVYVuR9Ls3BnI6IJMfiuc+TQ2tyluDUtzA=;
 b=owEBbQKS/ZANAwAIASrX0XUqXRtNAcsmYgBqqwxFHOctRgDIEwMrSQkhIxx1CYshB9Y7ZRC8+
 n7G01zugjSJAjMEAAEIAB0WIQTaB7usAfxNKMeqa6Yq19F1Kl0bTQUCaqsMRQAKCRAq19F1Kl0b
 TaCvEACbzjo0WGwX7FN+l+e8b4JYVAjSVMwR/CgJQEHkACNUiWfzC2aNf1zPiqoPXo7SuHGVBE7
 LVIHqstedSZxuAG1mFwL5meOs6rRQrE22XZ3MMZrzrTaSSFXwNWsPiypT7wUsiJdtDVdI7CRLfq
 IVQhW9dlxVhbubFCbZ4SRL4204uJbf3Izv8ZCOy5jE3iOm/DZt4bgUPUefaes88zHt0G7wkxJzh
 Zx5sdJttZEdq36uWmhN6f6KB6QFtNmvDbXo7M3t7XdorEWDVVAwkS952dds8dQXriZZUOL6nnfI
 /YNrLvjnEWQUQSrWEokMyCCK/HCi3Az0se+VUYhJDJXUcsvbnGZ3miIibXnnSyHzJyscXsITXPp
 nhBtDYcrcYqk/vxqgLOwFY1L6WJA2I+1e/60HofIcW8RpmLOoj2tOD7JmdcKYM5jDYmamunJpRS
 tf7YGBIh5lVPXOWokwI36LzgwtNzdDmd8w8c79gy5j8j8bzdbQokM+ReGKep5QeJhUpxyZFAcXg
 V09jc33PjoS3Myeku7UT7rJsKRNtSVOosQvYF37qbiyE1MMdRFg5oo4AQ6wUO1M1P1YWDsyET48
 6+r3x5NdW6+w+psXvp+V9O+KDLKga+o57Y/dsnJgAJV+7xseGHj/Rs48P484WKEw1z9wmWtPnul
 icZAYkCsl/3oe2A==
X-Developer-Key: i=yuya.kusakabe@gmail.com; a=openpgp;
 fpr=DA07BBAC01FC4D28C7AA6BA62AD7D1752A5D1B4D

This selftest is designed for testing the SRv6 End.MAP behavior.  It
instantiates three network namespaces interconnected through veth
pairs, with the middle one running End.MAP; the topology and the
cases are described in the script header.

The correct execution of the behavior is verified through ICMPv6 echo
reachability with and without an SRH, asserting that the receiver
counts no transport checksum errors, and through the route's own
error counter for the packets End.MAP must drop.  A small C helper,
srv6_mobile_send, crafts the routing headers the standard tools
cannot produce.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Yuya Kusakabe <yuya.kusakabe@gmail.com>
---
 tools/testing/selftests/net/.gitignore           |   1 +
 tools/testing/selftests/net/Makefile             |   2 +
 tools/testing/selftests/net/config               |   1 +
 tools/testing/selftests/net/srv6_end_map_test.sh | 400 +++++++++++++++++++++++
 tools/testing/selftests/net/srv6_mobile_send.c   | 262 +++++++++++++++
 5 files changed, 666 insertions(+)

diff --git a/tools/testing/selftests/net/.gitignore b/tools/testing/selftests/net/.gitignore
index c9f46031ac73..9afff0d83dde 100644
--- a/tools/testing/selftests/net/.gitignore
+++ b/tools/testing/selftests/net/.gitignore
@@ -42,6 +42,7 @@ socket
 so_incoming_cpu
 so_netns_cookie
 so_rcv_listener
+srv6_mobile_send
 stress_reuseport_listen
 tap
 tcp_fastopen_backup_key
diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 3ee3378f8b26..105e0f507791 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -96,6 +96,7 @@ TEST_PROGS := \
 	srv6_end_dx4_netfilter_test.sh \
 	srv6_end_dx6_netfilter_test.sh \
 	srv6_end_flavors_test.sh \
+	srv6_end_map_test.sh \
 	srv6_end_next_csid_l3vpn_test.sh \
 	srv6_end_x_next_csid_l3vpn_test.sh \
 	srv6_hencap_red_l3vpn_test.sh \
@@ -165,6 +166,7 @@ TEST_GEN_FILES := \
 	so_netns_cookie \
 	so_rcv_listener \
 	socket \
+	srv6_mobile_send \
 	stress_reuseport_listen \
 	tcp_fastopen_backup_key \
 	tcp_inq \
diff --git a/tools/testing/selftests/net/config b/tools/testing/selftests/net/config
index 30d5fcb09a83..afe9a5163167 100644
--- a/tools/testing/selftests/net/config
+++ b/tools/testing/selftests/net/config
@@ -49,6 +49,7 @@ CONFIG_IPV6_ROUTE_INFO=y
 CONFIG_IPV6_ROUTER_PREF=y
 CONFIG_IPV6_RPL_LWTUNNEL=y
 CONFIG_IPV6_SEG6_LWTUNNEL=y
+CONFIG_IPV6_SEG6_MOBILE=y
 CONFIG_IPV6_SIT=y
 CONFIG_IPV6_VTI=y
 CONFIG_IPVLAN=m
diff --git a/tools/testing/selftests/net/srv6_end_map_test.sh b/tools/testing/selftests/net/srv6_end_map_test.sh
new file mode 100755
index 000000000000..a4efcb58a1e4
--- /dev/null
+++ b/tools/testing/selftests/net/srv6_end_map_test.sh
@@ -0,0 +1,400 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# author: Yuya Kusakabe <yuya.kusakabe@gmail.com>
+
+# Selftest for the SRv6 End.MAP behavior (RFC 9433).
+#
+#   +------+    2001:db8:1::/64    +------+    2001:db8:2::/64    +------+
+#   | rt-1 | --------------------- | rt-2 | --------------------- | rt-3 |
+#   +------+         veth1         +------+         veth2         +------+
+#                                 (End.MAP)
+#
+# rt-2 holds the End.MAP route for 2001:db8:f::/64 that replaces the
+# IPv6 destination with 2001:db8:3::3 (an address on rt-3's loopback,
+# also used as the final SRv6 segment in the H.Encaps scenario).
+#
+# The original destination 2001:db8:f::1 and the replacement
+# 2001:db8:3::3 have different 16-bit word sums, so any regression in
+# the transport-checksum diff update would corrupt the ICMPv6
+# checksum and bump Icmp6InCsumErrors -- the forwarding cases assert
+# that the counter does not move.
+#
+# Eight cases are exercised:
+#
+#   1. SRH absent     -- plain ICMPv6 echo to the End.MAP SID.
+#   2. SRH present    -- the destination is reached through an
+#                        H.Encaps wrapper that carries an SRH with
+#                        two segments; End.MAP must leave the SRH
+#                        structurally intact.
+#   3. SRH inline     -- the destination is reached through an
+#                        H.Insert wrapper that inserts an SRH whose
+#                        first hop is the End.MAP SID; End.MAP must
+#                        NOT patch the L4 checksum, because the
+#                        receiver's SRv6 processing restores the
+#                        destination from segments[0] before the
+#                        ICMPv6 handler verifies it.
+#   4. RH not an SRH  -- a C helper sends a packet whose Routing
+#                        Header is type 0 rather than 4; End.MAP must
+#                        drop it.  The behavior's own errors counter
+#                        binds the assertion to the drop.
+#   5. SRH malformed  -- the helper sends an SRH whose Last Entry
+#                        exceeds its length; End.MAP must drop it.
+#   6. SRH exhausted  -- the helper sends a valid SRH with Segments
+#                        Left 0, so the IPv6 DA already is the final
+#                        destination; End.MAP must patch the L4
+#                        checksum as in the SRH-absent case and the
+#                        receiver must accept the echo.
+#   7. Fragmented     -- an oversized echo without an SRH is fragmented
+#                        by rt-1; only the first fragment carries the
+#                        ICMPv6 header, and End.MAP must patch its
+#                        checksum so the reassembled echo verifies at
+#                        rt-3.
+#   8. Hop Limit      -- an echo whose Hop Limit is 1 on arrival at
+#                        the End.MAP node must yield an ICMPv6 Time
+#                        Exceeded from that node, confirming Hop Limit
+#                        handling is delegated to the ip6_forward path.
+
+source lib.sh
+
+readonly PING_TIMEOUT_SEC=4
+readonly COUNTER_TIMEOUT_SEC=2
+readonly END_MAP_PREFIX="2001:db8:f::/64"
+readonly END_MAP_SID="2001:db8:f::1"
+readonly RT3_SID="2001:db8:3::3"
+HELPER_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
+readonly HELPER_DIR
+readonly HELPER="${HELPER_DIR}/srv6_mobile_send"
+
+ret=0
+nsuccess=0
+nfail=0
+
+PAUSE_ON_FAIL=${PAUSE_ON_FAIL:=no}
+
+log_test()
+{
+	local rc=$1
+	local expected=$2
+	local msg="$3"
+
+	if [ "${rc}" -eq "${expected}" ]; then
+		nsuccess=$((nsuccess + 1))
+		printf "\n    TEST: %-60s  [ OK ]\n" "${msg}"
+	else
+		ret=1
+		nfail=$((nfail + 1))
+		printf "\n    TEST: %-60s  [FAIL]\n" "${msg}"
+		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
+			echo
+			echo "hit enter to continue, 'q' to quit"
+			read -r a
+			[ "$a" = "q" ] && exit 1
+		fi
+	fi
+}
+
+print_log_test_results()
+{
+	printf "\nTests passed: %3d\n" "${nsuccess}"
+	printf "Tests failed: %3d\n"   "${nfail}"
+}
+
+cleanup()
+{
+	cleanup_all_ns
+}
+
+trap cleanup EXIT
+
+check_dependencies()
+{
+	if [ "$(id -u)" -ne 0 ]; then
+		echo "SKIP: need root privileges"
+		exit "${ksft_skip}"
+	fi
+
+	for cmd in ip ping nstat sysctl ethtool; do
+		if ! command -v "$cmd" >/dev/null; then
+			echo "SKIP: ${cmd} is required"
+			exit "${ksft_skip}"
+		fi
+	done
+
+	if [ ! -x "${HELPER}" ]; then
+		echo "SKIP: ${HELPER} not built"
+		exit "${ksft_skip}"
+	fi
+
+	if ! ip route help 2>&1 | grep -qF "seg6mobile"; then
+		echo "SKIP: iproute2 lacks seg6mobile support"
+		exit "${ksft_skip}"
+	fi
+
+	if ! ip route help 2>&1 | grep -qF "End.MAP"; then
+		echo "SKIP: iproute2 lacks End.MAP action"
+		exit "${ksft_skip}"
+	fi
+}
+
+setup()
+{
+	setup_ns rt1 rt2 rt3
+
+	# shellcheck disable=SC2154 # variables assigned by setup_ns
+	for ns in "$rt1" "$rt2" "$rt3"; do
+		ip -n "$ns" link set lo up
+	done
+
+	ip link add veth1 netns "$rt1" \
+		type veth peer name veth1-rt2 netns "$rt2"
+	ip link add veth2 netns "$rt2" \
+		type veth peer name veth2-rt3 netns "$rt3"
+
+	ip -n "$rt1" addr add 2001:db8:1::1/64 dev veth1 nodad
+	ip -n "$rt2" addr add 2001:db8:1::2/64 dev veth1-rt2 nodad
+	ip -n "$rt2" addr add 2001:db8:2::1/64 dev veth2 nodad
+	ip -n "$rt3" addr add 2001:db8:2::2/64 dev veth2-rt3 nodad
+	# rt-3 also owns the End.MAP replacement SID / SRH endpoint.
+	ip -n "$rt3" addr add "$RT3_SID/128" dev lo nodad
+
+	ip -n "$rt1" link set veth1 up
+	ip -n "$rt2" link set veth1-rt2 up
+	ip -n "$rt2" link set veth2 up
+	ip -n "$rt3" link set veth2-rt3 up
+
+	ip netns exec "$rt2" sysctl -wq net.ipv6.conf.all.forwarding=1
+
+	# rt-3 must accept SRv6 packets so ipv6_srh_rcv lets the
+	# extension header chain through to local delivery.
+	ip netns exec "$rt3" sysctl -wq net.ipv6.conf.all.seg6_enabled=1
+	ip netns exec "$rt3" \
+		sysctl -wq net.ipv6.conf.veth2-rt3.seg6_enabled=1
+	ip netns exec "$rt3" sysctl -wq net.ipv6.conf.lo.seg6_enabled=1
+
+	# Disable HW checksum offload so the kernel software checksum
+	# path runs unconditionally and any csum bug surfaces.
+	ip netns exec "$rt1" ethtool -K veth1 tx off rx off
+	ip netns exec "$rt2" ethtool -K veth1-rt2 tx off rx off
+	ip netns exec "$rt2" ethtool -K veth2 tx off rx off
+	ip netns exec "$rt3" ethtool -K veth2-rt3 tx off rx off
+
+	# rt-1: route the End.MAP locator into rt-2.
+	ip -n "$rt1" -6 route add "$END_MAP_PREFIX" via 2001:db8:1::2
+
+	# rt-1: a separate H.Encaps route for the SRH-present scenario,
+	# wrapping the inner ICMPv6 echo in an outer IPv6+SRH carrying
+	# [End.MAP_SID, RT3_SID].
+	ip -n "$rt1" -6 route add "$RT3_SID/128" via 2001:db8:1::2 \
+		encap seg6 mode encap \
+		segs "$END_MAP_SID","$RT3_SID" \
+		dev veth1
+
+	# rt-2: End.MAP -- swap DA from the End.MAP SID to RT3_SID
+	# (an address on rt-3) and forward via the IPv6 FIB.  "count"
+	# enables the per-behavior counters the drop tests read.
+	ip -n "$rt2" -6 route add "$END_MAP_PREFIX" \
+		encap seg6mobile action End.MAP mapped_sid "$RT3_SID" count \
+		dev veth2
+
+	# rt-2: reach RT3_SID (on rt-3's loopback) through the
+	# directly connected neighbour 2001:db8:2::2.
+	ip -n "$rt2" -6 route add "$RT3_SID/128" via 2001:db8:2::2
+
+	# rt-3: return route for the ICMPv6 echo reply.
+	ip -n "$rt3" -6 route add 2001:db8:1::/64 via 2001:db8:2::1
+}
+
+read_nstat_counter()
+{
+	local ns=$1
+	local name=$2
+
+	# nstat -az reports a counter that has never incremented as 0,
+	# which is what we rely on for a clean before/after delta.
+	ip netns exec "$ns" nstat -az "$name" \
+		| awk -v n="$name" '$1 == n {print $2}'
+}
+
+read_route_errors()
+{
+	# The End.MAP route carries "count", so its errors counter
+	# increments once for every packet the behavior drops.  Reading it
+	# binds the negative test to the drop itself rather than to any
+	# unrelated loss on the path to rt-3.
+	ip -n "$rt2" -j -s -6 route show "$END_MAP_PREFIX" \
+		| grep -oE '"errors":[0-9]+' | grep -oE '[0-9]+'
+}
+
+test_srh_absent()
+{
+	local before after rc=0
+
+	before=$(read_nstat_counter "$rt3" Icmp6InCsumErrors)
+
+	if ! ip netns exec "$rt1" \
+			ping -6 -c 1 -W "$PING_TIMEOUT_SEC" "$END_MAP_SID" \
+			>/dev/null 2>&1; then
+		rc=1
+	fi
+
+	if [ "$rc" -eq 0 ]; then
+		after=$(read_nstat_counter "$rt3" Icmp6InCsumErrors)
+		[ "$before" != "$after" ] && rc=1
+	fi
+
+	log_test "$rc" 0 "End.MAP forwards an ICMPv6 echo without an SRH"
+}
+
+test_srh_present()
+{
+	local before after rc=0
+
+	before=$(read_nstat_counter "$rt3" Icmp6InCsumErrors)
+
+	if ! ip netns exec "$rt1" \
+			ping -6 -c 1 -W "$PING_TIMEOUT_SEC" "$RT3_SID" \
+			>/dev/null 2>&1; then
+		rc=1
+	fi
+
+	if [ "$rc" -eq 0 ]; then
+		after=$(read_nstat_counter "$rt3" Icmp6InCsumErrors)
+		[ "$before" != "$after" ] && rc=1
+	fi
+
+	log_test "$rc" 0 "End.MAP preserves an SRH carried by H.Encaps"
+}
+
+test_srh_inline()
+{
+	local before after rc=0
+
+	ip -n "$rt1" -6 route add 2001:db8:2::2/128 via 2001:db8:1::2 \
+		encap seg6 mode inline segs "$END_MAP_SID" \
+		dev veth1
+
+	before=$(read_nstat_counter "$rt3" Icmp6InCsumErrors)
+
+	if ! ip netns exec "$rt1" \
+			ping -6 -c 1 -W "$PING_TIMEOUT_SEC" 2001:db8:2::2 \
+			>/dev/null 2>&1; then
+		rc=1
+	fi
+
+	if [ "$rc" -eq 0 ]; then
+		after=$(read_nstat_counter "$rt3" Icmp6InCsumErrors)
+		[ "$before" != "$after" ] && rc=1
+	fi
+
+	log_test "$rc" 0 "End.MAP preserves L4 csum across mode inline SRH"
+}
+
+# The drop happens on rt-2's receive path, asynchronously to the
+# sender, so wait for the errors counter instead of sampling it.
+expect_end_map_drop()
+{
+	local before rc=0
+
+	before=$(read_route_errors)
+
+	ip netns exec "$rt1" "$HELPER" -m end-map "$@" \
+		-s 2001:db8:1::1 -d "$END_MAP_SID" >/dev/null 2>&1
+
+	slowwait "$COUNTER_TIMEOUT_SEC" until_counter_is ">= $((before + 1))" \
+		read_route_errors >/dev/null || rc=1
+	[ "$(read_route_errors)" -eq "$((before + 1))" ] || rc=1
+
+	echo "$rc"
+}
+
+test_rh_not_srh()
+{
+	local rc
+
+	rc=$(expect_end_map_drop --rh-type 0)
+	log_test "$rc" 0 "End.MAP drops a routing header that is not an SRH"
+}
+
+test_srh_malformed()
+{
+	local rc
+
+	rc=$(expect_end_map_drop --bad-srh)
+	log_test "$rc" 0 "End.MAP drops a malformed SRH"
+}
+
+test_srh_exhausted()
+{
+	local before_echos before_csum rc=0
+
+	before_echos=$(read_nstat_counter "$rt3" Icmp6InEchos)
+	before_csum=$(read_nstat_counter "$rt3" Icmp6InCsumErrors)
+
+	ip netns exec "$rt1" "$HELPER" -m end-map \
+		-s 2001:db8:1::1 -d "$END_MAP_SID" >/dev/null 2>&1
+
+	slowwait "$COUNTER_TIMEOUT_SEC" \
+		until_counter_is ">= $((before_echos + 1))" \
+		read_nstat_counter "$rt3" Icmp6InEchos >/dev/null || rc=1
+	[ "$(read_nstat_counter "$rt3" Icmp6InCsumErrors)" -eq \
+		"$before_csum" ] || rc=1
+
+	log_test "$rc" 0 "End.MAP patches the L4 csum of an exhausted SRH"
+}
+
+test_fragmented()
+{
+	local before after rc=0
+
+	before=$(read_nstat_counter "$rt3" Icmp6InCsumErrors)
+
+	if ! ip netns exec "$rt1" \
+			ping -6 -c 1 -s 2000 -M dont -W "$PING_TIMEOUT_SEC" \
+			"$END_MAP_SID" >/dev/null 2>&1; then
+		rc=1
+	fi
+
+	if [ "$rc" -eq 0 ]; then
+		after=$(read_nstat_counter "$rt3" Icmp6InCsumErrors)
+		[ "$before" != "$after" ] && rc=1
+	fi
+
+	log_test "$rc" 0 "End.MAP patches the L4 csum of a fragmented echo"
+}
+
+test_hoplimit_expiry()
+{
+	local before after rc=0
+
+	before=$(read_nstat_counter "$rt2" Icmp6OutTimeExcds)
+
+	ip netns exec "$rt1" \
+		ping -6 -c 1 -t 1 -W "$PING_TIMEOUT_SEC" "$END_MAP_SID" \
+		>/dev/null 2>&1
+
+	after=$(read_nstat_counter "$rt2" Icmp6OutTimeExcds)
+	[ "$((after - before))" -eq 1 ] || rc=1
+
+	log_test "$rc" 0 "End.MAP delegates Hop Limit expiry to ip6_forward"
+}
+
+main()
+{
+	check_dependencies
+	setup
+
+	test_srh_absent
+	test_srh_present
+	test_srh_inline
+	test_rh_not_srh
+	test_srh_malformed
+	test_srh_exhausted
+	test_fragmented
+	test_hoplimit_expiry
+
+	print_log_test_results
+	exit "${ret}"
+}
+
+main "$@"
diff --git a/tools/testing/selftests/net/srv6_mobile_send.c b/tools/testing/selftests/net/srv6_mobile_send.c
new file mode 100644
index 000000000000..01329ec61676
--- /dev/null
+++ b/tools/testing/selftests/net/srv6_mobile_send.c
@@ -0,0 +1,262 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Author: Yuya Kusakabe (yuya.kusakabe@gmail.com)
+ *
+ * Helper for SRv6 Mobile (RFC 9433) selftests.
+ *
+ * Usage:
+ *   srv6_mobile_send -m end-map -s <src> -d <dst> [--rh-type N] [--bad-srh]
+ */
+
+#include <arpa/inet.h>
+#include <assert.h>
+#include <errno.h>
+#include <getopt.h>
+#include <netinet/in.h>
+#include <netinet/ip6.h>
+#include <netinet/icmp6.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/socket.h>
+#include <sys/types.h>
+#include <unistd.h>
+
+/* RFC 8200 Routing header common fields are 4 bytes; an additional
+ * 4 bytes of type-specific data follow (the Reserved field for the
+ * deprecated type 0, or first_segment/flags/tag for SRH type 4).  The
+ * segment list then runs in 16-byte units, giving a total of 24 bytes
+ * for one segment -- which is what ip6r_len = 2 advertises.
+ */
+struct srh_one_seg {
+	struct ip6_rthdr rthdr;
+	uint32_t type_data;
+	struct in6_addr segment;
+};
+
+/* Built as a struct so the headers are written through typed, aligned
+ * members rather than casts of a byte array; static_assert keeps it
+ * exactly the on-wire layout.
+ */
+struct end_map_frame {
+	struct ip6_hdr		ip6;
+	struct srh_one_seg	srh;
+	struct icmp6_hdr	icmp6;
+};
+
+static_assert(sizeof(struct end_map_frame) ==
+	      sizeof(struct ip6_hdr) + sizeof(struct srh_one_seg) +
+	      sizeof(struct icmp6_hdr),
+	      "end_map_frame must not contain padding");
+
+enum mode {
+	MODE_NONE,
+	MODE_END_MAP,
+};
+
+struct cfg {
+	enum mode	mode;
+	struct in6_addr	src6;
+	struct in6_addr	dst6;
+	uint8_t		rh_type;
+	bool		bad_srh;
+};
+
+static void usage(const char *bin)
+{
+	fprintf(stderr,
+		"Usage: %s -m <mode> -s <src> -d <dst> [opts]\n"
+		"\n"
+		"Modes:\n"
+		"  end-map    Send IPv6 + SRH + ICMPv6 echo for End.MAP testing\n"
+		"\n"
+		"Mode end-map options:\n"
+		"  --rh-type <n>       Routing Header type (default 4, the SRH)\n"
+		"  --bad-srh           emit an SRH whose Last Entry exceeds its length (drop test)\n"
+		"\n"
+		"Exit: 0 sent, 1 failure, 3 invalid arguments.\n",
+		bin);
+}
+
+static int parse_u32(const char *s, uint32_t *out)
+{
+	unsigned long v;
+	char *end;
+
+	errno = 0;
+	v = strtoul(s, &end, 0);
+	if (errno || !*s || *end || v > 0xffffffffUL)
+		return -1;
+	*out = (uint32_t)v;
+	return 0;
+}
+
+static int parse_u8(const char *s, uint8_t *out)
+{
+	uint32_t v;
+
+	if (parse_u32(s, &v) || v > 0xff)
+		return -1;
+	*out = (uint8_t)v;
+	return 0;
+}
+
+static enum mode parse_mode(const char *s)
+{
+	if (!strcmp(s, "end-map"))
+		return MODE_END_MAP;
+	return MODE_NONE;
+}
+
+static int parse_args(int argc, char **argv, struct cfg *cfg)
+{
+	enum { OPT_RH_TYPE = 256, OPT_BAD_SRH };
+	static const struct option longopts[] = {
+		{ "rh-type",         required_argument, NULL, OPT_RH_TYPE },
+		{ "bad-srh",         no_argument, NULL, OPT_BAD_SRH },
+		{ NULL, 0, NULL, 0 },
+	};
+	int c;
+
+	cfg->rh_type = 4;	/* RFC 8754: the SRH is Routing Header type 4 */
+	while ((c = getopt_long(argc, argv, "m:s:d:", longopts, NULL))
+	       != -1) {
+		switch (c) {
+		case 'm':
+			cfg->mode = parse_mode(optarg);
+			break;
+		case 's':
+			if (inet_pton(AF_INET6, optarg, &cfg->src6) != 1)
+				return -1;
+			break;
+		case 'd':
+			if (inet_pton(AF_INET6, optarg, &cfg->dst6) != 1)
+				return -1;
+			break;
+		case OPT_RH_TYPE:
+			if (parse_u8(optarg, &cfg->rh_type))
+				return -1;
+			break;
+		case OPT_BAD_SRH:
+			cfg->bad_srh = true;
+			break;
+		default:
+			return -1;
+		}
+	}
+	if (cfg->mode == MODE_NONE)
+		return -1;
+	return 0;
+}
+
+static uint16_t csum_fold(uint32_t sum)
+{
+	while (sum >> 16)
+		sum = (sum & 0xffff) + (sum >> 16);
+	return ~sum;
+}
+
+static uint32_t csum_partial(const void *buf, size_t len, uint32_t sum)
+{
+	const uint8_t *p = buf;
+	uint16_t word;
+
+	while (len > 1) {
+		memcpy(&word, p, sizeof(word));
+		sum += word;
+		p += sizeof(word);
+		len -= sizeof(word);
+	}
+	if (len)
+		sum += *p;
+	return sum;
+}
+
+static uint16_t pseudo_csum(const struct in6_addr *src,
+			    const struct in6_addr *dst,
+			    uint32_t plen, uint8_t nexthdr,
+			    const void *payload, size_t len)
+{
+	uint32_t nh = htonl(nexthdr);
+	uint32_t pl = htonl(plen);
+	uint32_t sum;
+
+	sum = csum_partial(src, sizeof(*src), 0);
+	sum = csum_partial(dst, sizeof(*dst), sum);
+	sum = csum_partial(&pl, sizeof(pl), sum);
+	sum = csum_partial(&nh, sizeof(nh), sum);
+	sum = csum_partial(payload, len, sum);
+	return csum_fold(sum);
+}
+
+static int send_end_map(const struct cfg *cfg)
+{
+	struct sockaddr_in6 dst_addr = { .sin6_family = AF_INET6 };
+	struct end_map_frame frame = {};
+	ssize_t res;
+	int fd;
+
+	frame.ip6.ip6_flow = htonl(6u << 28);
+	frame.ip6.ip6_plen = htons(sizeof(frame.srh) + sizeof(frame.icmp6));
+	frame.ip6.ip6_nxt = IPPROTO_ROUTING;
+	frame.ip6.ip6_hops = 64;
+	frame.ip6.ip6_src = cfg->src6;
+	frame.ip6.ip6_dst = cfg->dst6;
+
+	frame.srh.rthdr.ip6r_nxt = IPPROTO_ICMPV6;
+	frame.srh.rthdr.ip6r_len = 2;		/* (1 + ip6r_len) * 8 = 24 */
+	frame.srh.rthdr.ip6r_type = cfg->rh_type;
+	frame.srh.rthdr.ip6r_segleft = 0;
+	/* SRH Last Entry is the high byte of the type-specific word.  A
+	 * single segment makes it 0; --bad-srh claims a second segment the
+	 * header has no room for, which seg6_validate_srh() rejects.
+	 */
+	frame.srh.type_data = htonl((uint32_t)(cfg->bad_srh ? 1 : 0) << 24);
+	frame.srh.segment = frame.ip6.ip6_dst;
+
+	frame.icmp6.icmp6_type = ICMP6_ECHO_REQUEST;
+	frame.icmp6.icmp6_code = 0;
+	frame.icmp6.icmp6_dataun.icmp6_un_data16[0] = htons(0x1234);
+	frame.icmp6.icmp6_dataun.icmp6_un_data16[1] = htons(1);
+	frame.icmp6.icmp6_cksum = pseudo_csum(&frame.ip6.ip6_src,
+					      &frame.ip6.ip6_dst,
+					      sizeof(frame.icmp6),
+					      IPPROTO_ICMPV6, &frame.icmp6,
+					      sizeof(frame.icmp6));
+
+	fd = socket(AF_INET6, SOCK_RAW, IPPROTO_RAW);
+	if (fd < 0) {
+		perror("socket");
+		return 1;
+	}
+	dst_addr.sin6_addr = frame.ip6.ip6_dst;
+
+	res = sendto(fd, &frame, sizeof(frame), 0,
+		     (struct sockaddr *)&dst_addr, sizeof(dst_addr));
+	close(fd);
+	if (res != (ssize_t)sizeof(frame)) {
+		perror("sendto");
+		return 1;
+	}
+	return 0;
+}
+
+int main(int argc, char **argv)
+{
+	struct cfg cfg = {};
+
+	if (parse_args(argc, argv, &cfg)) {
+		usage(argv[0]);
+		return 3;
+	}
+
+	switch (cfg.mode) {
+	case MODE_END_MAP:
+		return send_end_map(&cfg);
+	default:
+		usage(argv[0]);
+		return 3;
+	}
+}

-- 
2.50.1

