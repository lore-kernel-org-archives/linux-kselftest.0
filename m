Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7DF344D8B;
	Sat,  8 Aug 2026 16:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786207017; cv=none; b=Yg/5ae1SWerfIvCp4372Exy6ZYQCyxEYf3WNUkw+7R4oKOEfh/Bu9g+n+ht79qBDQuw3RHq/l6AqqZOw2DZsQd+9akicoHgFZJEaFmJPWM3Z/w3hOdkQhmgShSkH8CZoegy+7qsD/6tkQVav2RqNK/5MlNw47nvjKUC22Rd6VBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786207017; c=relaxed/simple;
	bh=6yFsUB6Zn3YWVy9tafaEAuzVwfYDQRZmU4scbY8f6ho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qDRqOkyBfSlREtjeAvwTY5KK8/1QrubvFMonLL0dhhXzLoExC86LqaLAdQINZSp/GrgkPTYwQMQeHvSYEWaooTjK+UwdW7v09HXHWbyApbDL6DDfhNxdGV8K9RzGBb8bId/MC9wC+YEMK8Iwg2jvQTfTbqjvW48BJ7RbnUvSUI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RM1cyMyc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RM1cyMyc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3548A1F00A3A;
	Sat,  8 Aug 2026 16:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786207016;
	bh=qYl+3FZfUFSx8FAL4KOfFtFrgKJ20T3rLXknO/Xxrbc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RM1cyMycncXmUPX1pBjHwGlx8/qeg3rB8RXJN//ILZz+tapAIKE82arsO500rJzyi
	 UFXP/qgoGxfcCkuwcVdwK60gsKTM/nngx5FA2aaaS95nAedmXlazXBSO2jMPYgLciV
	 g4pqIjYmm8Jri06YlTcnHBNDFRhJhYulFRYO45FRJvGlWpAChokOlvMC144OTKa24c
	 lwb77pRmBrDE7H55037CcOJ+tPDPEo9vecg9jIvtSzRGtGltYR3bu1fYIbj0ISiv8M
	 L/FPujWK2lmbrQSkDsPBs5+KmFM+nAxRZC9wHhio2UNqkbY1JwHVZwBO8cf7BG2wqW
	 hiAKczIqbbE3A==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	andrew@lunn.ch,
	shuah@kernel.org,
	dsahern@kernel.org,
	idosch@nvidia.com,
	ioana.ciornei@nxp.com,
	petrm@nvidia.com,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 2/2] selftests: drv-net: let ethtool stats settle before reading
Date: Sat,  8 Aug 2026 09:36:53 -0700
Message-ID: <20260808163653.2460381-2-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260808163653.2460381-1-kuba@kernel.org>
References: <20260808163653.2460381-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some devices refresh the statistics exposed via ethtool only
periodically, every stats-block-usecs (as reported by ethtool -c).
ethtool_std_stats and ethtool_rmon sample the counters immediately
after generating traffic, so on such devices they can read stale
values and fail with a delta short of the packets just sent.

Add a hw_stats_settle() helper which sleeps for 1.25x the configured
stats-block-usecs (defaulting to 20ms when the device reports no, or
a zero, period). Use it for ethtool std stats and RMON.
The 1.25x/20msec heuristic matches what the Python tests do.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: andrew@lunn.ch
CC: shuah@kernel.org
CC: dsahern@kernel.org
CC: idosch@nvidia.com
CC: ioana.ciornei@nxp.com
CC: petrm@nvidia.com
CC: linux-kselftest@vger.kernel.org
---
 .../selftests/drivers/net/hw/ethtool_rmon.sh      |  2 ++
 .../selftests/drivers/net/hw/ethtool_std_stats.sh |  2 ++
 tools/testing/selftests/net/forwarding/lib.sh     | 15 +++++++++++++++
 3 files changed, 19 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/hw/ethtool_rmon.sh b/tools/testing/selftests/drivers/net/hw/ethtool_rmon.sh
index 2ec19edddfaa..a074834cbe59 100755
--- a/tools/testing/selftests/drivers/net/hw/ethtool_rmon.sh
+++ b/tools/testing/selftests/drivers/net/hw/ethtool_rmon.sh
@@ -65,6 +65,8 @@ bucket_test()
 	run_on "$iface" \
 		"$MZ" "$iface" -q -c "$num_tx" -p "$len" -a own -b bcast -d 10us
 
+	hw_stats_settle "$iface"
+
 	after=$(run_on "$iface" ethtool --json -S "$iface" --groups rmon | \
 		jq -r ".[0].rmon[\"${set}-pktsNtoM\"][$bucket].val")
 
diff --git a/tools/testing/selftests/drivers/net/hw/ethtool_std_stats.sh b/tools/testing/selftests/drivers/net/hw/ethtool_std_stats.sh
index 1b329b3f60c2..09f8128c51f3 100755
--- a/tools/testing/selftests/drivers/net/hw/ethtool_std_stats.sh
+++ b/tools/testing/selftests/drivers/net/hw/ethtool_std_stats.sh
@@ -48,6 +48,8 @@ traffic_test()
 	# shellcheck disable=SC2086 # needs split options
 	run_on "$neigh" "$MZ" "$neigh" -q -d 10usec -c "$num_rx" $pkt_format
 
+	hw_stats_settle "$int"
+
 	for i in "${!counters[@]}"; do
 		read -r int grp cnt target exact_check xfail_message \
 			<<< "${counters[$i]}"
diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index ac8358bcb22c..05acd4011456 100644
--- a/tools/testing/selftests/net/forwarding/lib.sh
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -406,6 +406,21 @@ get_ifname_by_ip()
 	__run_on "$target" ip -j addr show to "$ip_addr" | jq -r '.[].ifname'
 }
 
+# Wait for the device to refresh its HW statistics. Devices latch the stats
+# reported via ethtool only every stats-block-usecs, so sample after that.
+hw_stats_settle()
+{
+	local iface=$1; shift
+	local usecs
+
+	# Match only a non-zero integer; 0 or "n/a" use default (20msec)
+	usecs=$(run_on "$iface" ethtool -c "$iface" 2>/dev/null | \
+		sed -n 's/^stats-block-usecs:[[:space:]]*\([1-9][0-9]*\)$/\1/p')
+	usecs=${usecs:-20000}
+
+	sleep "$(echo "$usecs * 1.25 / 1000 / 1000" | bc -l)"
+}
+
 # Whether the test is conforming to the requirements and usage described in
 # drivers/net/README.rst.
 : "${DRIVER_TEST_CONFORMANT:=no}"
-- 
2.55.0

