Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDA71F427C;
	Fri, 25 Sep 2026 13:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.117.225.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790344529; cv=none; b=jzMDtLG7SHLHjwpWjpwGczFXFevS2Yn97HP0zXkqcJUsomFZAxJJh3bdxq34lxTNeeqF7BfLgmwUXpswzlQry/iUOF122JqAdI+BGKUci+1si8qBNVI/zxlHc6tBp/D/Oz6uuqV6v5CdcekTo9QhG4Qb6mxh99XCZW1PqmWCbvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790344529; c=relaxed/simple;
	bh=yuzmuhcmB59EFA5J1e1i/MwAa37CU8+wBkxTu4Bf0kg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BwDgRHVbD2N3xKN/L08/r/xd5aP+xRLstFHtC2x4D1SKqw0n9XbI+ZgECaMK9p2p0pFtUTsZ1mq0BK/U80SAdS3h8vAq/lAjkjhkHd0J0rAjzQcrqCkuqPhK1oZEaBI271MyGobBT2Z0fL8jkjws1tWrUUciNDZHy+RaPiVh9XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=NPxzNXEW; arc=none smtp.client-ip=130.117.225.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="NPxzNXEW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=MIME-Version:Message-ID:Date:Subject:From:
	Content-Type; bh=8qSCqfOlWz0Nr/sTQ88XP03QdzOIpyDNK0I5ummP6ys=; b=NPxzNXEWUzXO
	OYJfy7q2pUH/stKeKnyd+L+yDnrROisf7oW30NlfxJz9v9cH2T/iLunQOa8w6PDTV70lYJyc2R+2m
	gpBWScgHnEb7w+lrHpQsQ8rpWmvEoJd3fIndUjOngEqsf+5n8ru3KCTzVR2f5pivS/LeRFVx8NoIl
	jmjMvxkldD+BViGIo5NsGIWpWj7JYpTynNFajLidGIk5+Gx6cPdvLu+J0yLWh32HwJSKQXpk15rEe
	VYF+YgEgfgCMq9inygczBAzkFyK8vkfcfoxEAC2P6EXZ1SoSWeTa0AGX52JSq5Q8qewukNx4Bz+KM
	jyabhJeiJcpOO0fXqrqtIA==;
Received: from ch-vpn.virtuozzo.com ([130.117.225.6] helo=LekKit-T14)
	by relay.virtuozzo.com with esmtp (Exim 4.96)
	(envelope-from <eva.kurchatova@virtuozzo.com>)
	id 1xA6LY-008rPD-05;
	Fri, 25 Sep 2026 15:55:16 +0200
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Eva Kurchatova <eva.kurchatova@virtuozzo.com>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests: netdevsim: skip the rate tc-bw check without tool support
Date: Fri, 25 Sep 2026 16:55:01 +0300
Message-ID: <20260925135512.3644101-1-eva.kurchatova@virtuozzo.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tc-bw attribute was added to devlink in iproute2 6.17, together
with the kernel side in v6.17. An older devlink has no such option and
the rate test fails on "Unknown option" instead of skipping.

Probe once in rate_test() and skip the tc-bw checks as a whole, so that
a missing option costs a single skip line rather than one per rate
object.

Signed-off-by: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
---
 .../drivers/net/netdevsim/devlink.sh          | 29 +++++++++++++------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/netdevsim/devlink.sh b/tools/testing/selftests/drivers/net/netdevsim/devlink.sh
index 22a626c6cde3..1ba925459aff 100755
--- a/tools/testing/selftests/drivers/net/netdevsim/devlink.sh
+++ b/tools/testing/selftests/drivers/net/netdevsim/devlink.sh
@@ -849,6 +849,13 @@ rate_test()
 {
 	RET=0
 
+	local tc_bw_supported=false
+	if devlink port function rate help 2>&1 | grep -q tc-bw; then
+		tc_bw_supported=true
+	else
+		log_test_skip "rate tc-bw" "Current iproute doesn't support rate option 'tc-bw'."
+	fi
+
 	echo $VF_COUNT > /sys/bus/netdevsim/devices/$DEV_NAME/sriov_numvfs
 	devlink dev eswitch set $DL_HANDLE mode switchdev
 	local leafs=`rate_leafs_get $DL_HANDLE`
@@ -872,12 +879,14 @@ rate_test()
 		rate=$(($rate+100))
 	done
 
-	local tc_bw="0:0 1:40 2:0 3:0 4:0 5:0 6:60 7:0"
-	for r_obj in $leafs
-	do
-		rate_attr_tc_bw_check "$r_obj" "$tc_bw" \
-			"$DEBUGFS_DIR"/ports/"${r_obj##*/}"
-	done
+	if $tc_bw_supported; then
+		local tc_bw="0:0 1:40 2:0 3:0 4:0 5:0 6:60 7:0"
+		for r_obj in $leafs
+		do
+			rate_attr_tc_bw_check "$r_obj" "$tc_bw" \
+				"$DEBUGFS_DIR"/ports/"${r_obj##*/}"
+		done
+	fi
 
 	local node1_name='group1'
 	local node1="$DL_HANDLE/$node1_name"
@@ -897,9 +906,11 @@ rate_test()
 		$DEBUGFS_DIR/rate_nodes/${node1##*/}/tx_max
 
 
-	local tc_bw="0:20 1:0 2:0 3:0 4:0 5:20 6:60 7:0"
-	rate_attr_tc_bw_check $node1 "$tc_bw" \
-		"$DEBUGFS_DIR"/rate_nodes/"${node1##*/}"
+	if $tc_bw_supported; then
+		local tc_bw="0:20 1:0 2:0 3:0 4:0 5:20 6:60 7:0"
+		rate_attr_tc_bw_check $node1 "$tc_bw" \
+			"$DEBUGFS_DIR"/rate_nodes/"${node1##*/}"
+	fi
 
 
 	rate_node_del "$node1"
-- 
2.55.0

