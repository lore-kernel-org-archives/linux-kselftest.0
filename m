Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFB24EBAD2;
	Thu, 15 Oct 2026 08:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054753; cv=none; b=MCovs3yBrbCnjftL2TJ2IAJNh+5mcxVJeyfsG7RPvCKcU8hZfOS4TeLmG6Joyoa84rM9kwQR1E1IU7RnAAGVYkahpoUCeNT9dYCS7TQL6+pOXgBRbMK2R1Oy7kH6pfJgTWJS5emtZnuAGucfVHJg45OFpKjWq0DU7X61YZsEsiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054753; c=relaxed/simple;
	bh=Qyk4fzUIXwUnNk3bSw3qy/UwHIH1593oSmAaBN3Ti8k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Nh25n+Iz9fuzjBCQRdGT56LLnvDV8QYko4bPdkSMKMI405vjedzGCvv6huh+8rqn4a0bQpvW3hlydf9GYClMq4hSFK1w/ZvSiLOdKoyx6WwxRuz9dY0Ew/1AF6WtW57Pk/CRI9r6ocjeWQFG2bl91onzKe53b7Dj6qGrpbTV+Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ehb1dYls; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ehb1dYls"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=/x
	y4dCAFiSOS7bJrEJtqhdCx4Cmu9Io/aYfxxfzJL5A=; b=ehb1dYlsxGIs/XyYln
	b5Q0ak/8ntDQrwMKmR4r5A2f79GWPwFKWAGK+ahz5iQnnVX4vei+LQgRLnsd76Ut
	/NdRLDqfR3jhRsoGfBvHF3qWZbRrpnHJEKUEL6eaO9oESBVdRJNc36nAfg01IVOv
	gABwWQ8CLAuxpv9cRGIrm8yPc=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3n4O5ldBq3yzkAA--.32772S3;
	Thu, 15 Oct 2026 16:58:35 +0800 (CST)
From: Xia Yan <yana06070@163.com>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net 2/2] selftests: net: check veth carrier after changing channel counts
Date: Thu, 15 Oct 2026 16:58:21 +0800
Message-Id: <20261015085821.12725-2-yana06070@163.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20261015085821.12725-1-yana06070@163.com>
References: <20261015085821.12725-1-yana06070@163.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3n4O5ldBq3yzkAA--.32772S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxAF4UtF13JFWUAryUur4xCrg_yoWrAr1fpF
	s3Gw1aqr1IqF13tw1xKrs8ZF48W3Wvqw4jq34ay34DZ3ZFkrnaqr13K347tFyUKrs0qa13
	ZFyS9Fn2g3WUuaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jSrWrUUUUU=
X-CM-SenderInfo: p1dqtiawqxiqqrwthudrp/xtbC-Bti6GrQlbtH6QAA3X

Add a regression test for veth_set_channels() incorrectly enabling
carrier when the peer is administratively down.

Check all combinations of the two ends' administrative states with GRO
enabled and disabled. Resize the RX and TX channel counts in both
directions on each end and verify that carrier is on only when both ends
are up. Also verify that rejecting an out-of-range channel count leaves
carrier unchanged.

On an unpatched kernel the two mixed up/down cases fail with each GRO
setting. All eight cases pass with the carrier restoration fix.

Assisted-by: LLM

Signed-off-by: Xia Yan <yana06070@163.com>
---

Notes (validation):
    Tested with iproute2 and ethtool in an isolated network namespace under
    the unpatched and patched UML kernels. The mixed up/down states fail
    before the driver fix with both GRO settings; all eight cases pass after
    the fix. The script also passes bash -n.
    
    The new file is covered by the existing MAINTAINERS entry for
    tools/testing/selftests/; no MAINTAINERS update is needed.

 tools/testing/selftests/net/Makefile          |  1 +
 .../selftests/net/veth_channels_carrier.sh    | 89 +++++++++++++++++++
 2 files changed, 90 insertions(+)
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
index 0000000..c72a03b
--- /dev/null
+++ b/tools/testing/selftests/net/veth_channels_carrier.sh
@@ -0,0 +1,89 @@
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
+	local expected=$2
+	local carrier=0
+	local link
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
+		RET=$ksft_skip
+		log_test "veth carrier: $left/$right, GRO $gro"
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
+	check_carrier vca "$expected"
+	check_carrier vcb "$expected"
+
+	for dev in vca vcb; do
+		for count in 1 2; do
+			ip netns exec "$ns" ethtool -L "$dev" \
+				rx "$count" tx "$count"
+			check_err $? "Failed to resize $dev channels"
+			check_carrier vca "$expected"
+			check_carrier vcb "$expected"
+		done
+
+		ip netns exec "$ns" ethtool -L "$dev" rx 3 tx 3 \
+			>/dev/null 2>&1
+		check_fail $? "Out-of-range channel counts were accepted"
+		check_carrier vca "$expected"
+		check_carrier vcb "$expected"
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
+			check_state "$left" "$right" "$gro"
+		done
+	done
+done
+
+exit "$EXIT_STATUS"
-- 
2.33.0

