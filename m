Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504600;
	b=sEVbWXs5WmzwpDuEOhy0Lj+cfBT1oqeFe+tjrUS0KpACmsmbEOhNvvnq2GfW/tE0VaKP
	 rVTP9epmEIZHsc4x+ThirMZr1OVUJ9qEXSa7gTL0CFHeYaR+wlEL3ggnKjzU6PDdnp6mU
	 ipuUABOJ9QULNtV3zV4zHJyoeZITkQcvesZ1tgurH03QLboadT093X/LgG79tps5Hw4iC
	 oGZJRov+eOCINcsTJu8sY/B+FIMdP79ejj4j0Ky53zOqoS2vqfBTdBsDHliAHm+Y1qbiJ
	 Rq+IFAYmKXRG8u0TgayvY/a5H5FW1fsBxnFxRqwx8lOf1ljdSTIp9+cRykXNO/Irxhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504600;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=l8TpnDSr4xMVn+kzn3EMXGvx3pJwLmxiXIETZ9Ka+Pw=;
	b=t8ojVmoSg++VVULjcwS5Ngyc5S0OdJLGTEAOkcMIRZufr9iPRROKXKCTBUoiLvsWHT/g
	 kU4rX/pZ+DsrxJ3qIlvlYqXXfyHYd3wAX5Jy8HBdxcB5gz5hLCyqVhuRGH6BowEyeGJ7t
	 D5vAnDSqM8OMCibsOPCVgImhXo8gbjvpyHbFDz5HOWl+DMZ7dJUU5gme7hQlEmIJGXOGF
	 gk9pDtbT347aWqzw56jKeM/ZtBbV6Eq4mSJaPq+WaPpSdh+0YTLG0mSDZQiheXpHX/8oO
	 E1Ww2u0tC498R8VVwtknfWZqzbs2bshFgULfItO0KrCQJcUmQBZb4QBxdkICVOJqogQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Xbn3xy8E;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC3C606A31A;
	Tue, 20 Oct 2026 13:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEC3C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Xbn3xy8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=l8
	TpnDSr4xMVn+kzn3EMXGvx3pJwLmxiXIETZ9Ka+Pw=; b=Xbn3xy8EZpfuq97yov
	qknSOML+iIpfh0Q4t1XjFQbK7MHdWvwpO5ogWN7aXRlAKoEyANtrzzAVB3ybBo8f
	sVefRMzZ1vKFi6XCKG5/Y0cCeF/oVeehlDupT6pbXwe/S2ZJaWrd48vtmri3IYiq
	74bhyW95YsnaJAxCBKSpXLlws=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgD3YQntctdquSfMAw--.51436S3;
	Tue, 20 Oct 2026 21:55:58 +0800 (CST)
From: Xia Yan <yana06070@163.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	yana06070@163.com
Subject: [PATCH net v2 2/2] selftests: net: check veth carrier after changing channel counts
Date: Tue, 20 Oct 2026 21:55:44 +0800
Message-Id: <20261020135544.24441-2-yana06070@163.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20261020135544.24441-1-yana06070@163.com>
References: <20261020135544.24441-1-yana06070@163.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:PSgvCgD3YQntctdquSfMAw--.51436S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxKF4fJr18tF17Gr1kZFWDJwb_yoW7Gw1fpF
	s3Cwn8Gr1IqF1aqw4xKw1xZFyUW3Wqqw4UX34fK34xZ3W7Kr9aqr13K34Ut3W2krs0va13
	ZF9a9Fn2g3WDCaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zifbb_UUUUU=
X-CM-SenderInfo: p1dqtiawqxiqqrwthudrp/xtbC-A9o7mrXcu9LwgAA3c

Add a regression test for veth_set_channels() incorrectly reporting
LOWER_UP on a running interface whose peer is administratively down.

Test the up/up and both mixed up/down combinations with GRO enabled and
disabled. Resize the RX and TX channel counts in both directions on
each end and check LOWER_UP on each running interface. Also verify that
rejecting an out-of-range channel count leaves that state unchanged.

IFF_LOWER_UP is masked on administratively down interfaces, so do not
use it to assert their raw carrier state. Omit the down/down combination,
where neither endpoint can report LOWER_UP.

On an unpatched UML kernel the four mixed up/down cases fail. All six
cases pass with the carrier restoration fix.

Assisted-by: LLM
Signed-off-by: Xia Yan <yana06070@163.com>
---

Notes:
    Changes in v2:
    - Limit carrier assertions to running endpoints and omit down/down, since
      IFF_LOWER_UP does not expose a down endpoint's raw carrier state.
    - Use log_test_skip() on veth creation failure to avoid a stale retmsg.
    - Include the discovery and reproduction details in the driver commit.
    - Driver code is unchanged.
    
    v1: https://lore.kernel.org/netdev/20261015085821.12725-1-yana06070@163.com/
    Review: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/8081
    
    Validation for the revised selftest on the original net baseline:
    - bash -n passed.
    - Unpatched UML kernel: 2 pass, 4 fail (the mixed up/down cases).
    - Patched UML kernel: 6 pass.
    - Injected veth creation failure after an earlier failed case: SKIP no
      longer repeats the earlier error; the aggregate failure is preserved.
    
    Reused the existing UML kernels; no kernel rebuild was performed for
    this revision. Prior build results and their limits remain archived.

 tools/testing/selftests/net/Makefile          |  1 +
 .../selftests/net/veth_channels_carrier.sh    | 93 +++++++++++++++++++
 2 files changed, 94 insertions(+)
 create mode 100755 tools/testing/selftests/net/veth_channels_carrier.sh

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 590b33e..4004014 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -128,6 +128,7 @@ TEST_PROGS := \
 	udpgso_bench.sh \
 	unicast_extensions.sh \
 	veth.sh \
+	veth_channels_carrier.sh \
 	vlan_bridge_binding.sh \
 	vlan_hw_filter.sh \
 	vrf-xfrm-tests.sh \
diff --git a/tools/testing/selftests/net/veth_channels_carrier.sh b/tools/testing/selftests/net/veth_channels_carrier.sh
new file mode 100755
index 0000000..03c2995
--- /dev/null
+++ b/tools/testing/selftests/net/veth_channels_carrier.sh
@@ -0,0 +1,93 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"
+
+require_command ip
+require_command ethtool
+
+if [ "$EUID" -ne 0 ]; then
+	echo "SKIP: root privileges are required"
+	exit "$ksft_skip"
+fi
+
+trap cleanup_all_ns EXIT
+setup_ns ns || exit $?
+
+check_carrier()
+{
+	local dev=$1
+	local state=$2
+	local expected=$3
+	local carrier=0
+	local link
+
+	# IFF_LOWER_UP is reported only for running interfaces.
+	[ "$state" = up ] || return 0
+
+	link=$(ip -n "$ns" -o link show dev "$dev")
+	check_err $? "Failed to read $dev link state"
+	[[ $link == *LOWER_UP* ]] && carrier=1
+	[ "$carrier" -eq "$expected" ]
+	check_err $? "$dev carrier is $carrier, expected $expected"
+}
+
+check_state()
+{
+	local left=$1
+	local right=$2
+	local gro=$3
+	local expected=0
+	local count dev
+
+	RET=0
+	if ! ip -n "$ns" link add vca numtxqueues 2 numrxqueues 2 \
+		type veth peer name vcb numtxqueues 2 numrxqueues 2; then
+		log_test_skip "veth carrier: $left/$right, GRO $gro"
+		return
+	fi
+
+	ip -n "$ns" link set vca "$left"
+	check_err $? "Failed to configure vca"
+	ip -n "$ns" link set vcb "$right"
+	check_err $? "Failed to configure vcb"
+	ip netns exec "$ns" ethtool -K vca gro "$gro" >/dev/null
+	check_err $? "Failed to configure GRO"
+	ip netns exec "$ns" ethtool -K vcb gro "$gro" >/dev/null
+	check_err $? "Failed to configure peer GRO"
+
+	[ "$left" = up ] && [ "$right" = up ] && expected=1
+	check_carrier vca "$left" "$expected"
+	check_carrier vcb "$right" "$expected"
+
+	for dev in vca vcb; do
+		for count in 1 2; do
+			ip netns exec "$ns" ethtool -L "$dev" \
+				rx "$count" tx "$count"
+			check_err $? "Failed to resize $dev channels"
+			check_carrier vca "$left" "$expected"
+			check_carrier vcb "$right" "$expected"
+		done
+
+		ip netns exec "$ns" ethtool -L "$dev" rx 3 tx 3 \
+			>/dev/null 2>&1
+		check_fail $? "Out-of-range channel counts were accepted"
+		check_carrier vca "$left" "$expected"
+		check_carrier vcb "$right" "$expected"
+	done
+
+	ip -n "$ns" link del vca
+	check_err $? "Failed to delete the veth pair"
+	log_test "veth carrier: $left/$right, GRO $gro"
+}
+
+for gro in off on; do
+	for left in down up; do
+		for right in down up; do
+			[ "$left" = down ] && [ "$right" = down ] && continue
+			check_state "$left" "$right" "$gro"
+		done
+	done
+done
+
+exit "$EXIT_STATUS"
-- 
2.43.0

