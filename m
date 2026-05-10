Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F3C3B27F1;
	Sun, 10 May 2026 16:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778431464; cv=none; b=PLu0bKYhilAqNnVMA+nXwhuB5YhRxVmL5WP28oAaltWGPaMxDhLvSlkWjHmEdQZJv0F0vnx2a0EeoXT0Ok1af/AWU4QDaMwCUptXftVOJfoyhCeB+RtTg4yv5i2FgTlEDgoZXl97KIJB8imcDW6WGdeDGuPCHhzVFT96d4+/pJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778431464; c=relaxed/simple;
	bh=LMLVjAsjBuo0szwu8dH3HCZzhlvPuEqY3f0q4+SuHec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C1IDYMKhKf6q8w1RsamR/232e4H/uEfICFnCxkeIUmYzdSPXGlTbr8uwio5UuOuAHkWcJYxdFGbB88q4i3PButj3WiWucHCHHSvFviDVY4PfV8xVMlPx51HO7BKzM26A2x4LS0Z1IeQnXZjL7UHqcel7szYXkwRZGE2FifIU4eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=cnxo1nym; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="cnxo1nym"
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4gD7ws05Ggz9sF1;
	Sun, 10 May 2026 16:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riseup.net; s=squak;
	t=1778431453; bh=auME73nsDxf2WJl0sr95xNr3cPz4BQtxr2Oqi/bQu78=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cnxo1nymR3VHpgSUv37i58tX/jmFJWlYFrMZY8sUZ6fwJTE3Df8NohnhbnBchK4c/
	 CdhtCGj59kKkUM9rrLsogCK5415O0bgbBFPVNd9w4xYuvq4eSescGXaekdXbhoEXbv
	 3XvvWOieNHdZw2HlBzJq0lMiHYW0kQDzN5tsNWtA=
X-Riseup-User-ID: FBFA4F0E5DBAF7474A9843AB26C820C84BC9D8518822C9AB0AA9AB66234F2E5A
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4gD7wn1hpmz1yc3;
	Sun, 10 May 2026 16:44:08 +0000 (UTC)
From: =?UTF-8?q?=C3=8D=C3=B1igo=20Huguet?= <ihuguet@riseup.net>
To: Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Sabrina Dubroca <sd@queasysnail.net>,
	Filip Pokryvka <fpokryvk@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	=?UTF-8?q?=C3=8D=C3=B1igo=20Huguet?= <ihuguet@riseup.net>
Subject: [PATCH net-next 3/5] selftest: netdevsim: test carrier change via sysfs
Date: Sun, 10 May 2026 18:43:35 +0200
Message-ID: <20260510164337.7611-4-ihuguet@riseup.net>
In-Reply-To: <20260510164337.7611-1-ihuguet@riseup.net>
References: <20260510164337.7611-1-ihuguet@riseup.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The previous commits allowed to change the carrier state via the sysfs
carrier attribute and to get the carrier state via ethtool. Add
selftest for it.

Signed-off-by: Íñigo Huguet <ihuguet@riseup.net>
---
 .../selftests/drivers/net/netdevsim/peer.sh   | 59 +++++++++++++++----
 1 file changed, 48 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/netdevsim/peer.sh b/tools/testing/selftests/drivers/net/netdevsim/peer.sh
index f4721f7636dd..5e7b6c1d0bfb 100755
--- a/tools/testing/selftests/drivers/net/netdevsim/peer.sh
+++ b/tools/testing/selftests/drivers/net/netdevsim/peer.sh
@@ -52,21 +52,17 @@ cleanup_ns()
 	ip netns del nssv
 }
 
-is_carrier_up()
-{
-	local netns="$1"
-	local nsim_dev="$2"
-
-	test "$(ip netns exec "$netns"	\
-		cat /sys/class/net/"$nsim_dev"/carrier 2>/dev/null)" -eq 1
-}
-
 assert_carrier_up()
 {
 	local netns="$1"
 	local nsim_dev="$2"
 
-	if ! is_carrier_up "$netns" "$nsim_dev"; then
+	local sysfs_carrier="$(ip netns exec "$netns" \
+		cat /sys/class/net/"$nsim_dev"/carrier 2>/dev/null)"
+	local ethtool_carrier="$(ip netns exec "$netns" \
+		ethtool -j "$nsim_dev" | jq '.[0]["link-detected"]' 2>/dev/null)"
+
+	if [ "$sysfs_carrier" -ne 1 -o "$ethtool_carrier" != "true" ]; then
 		echo "$nsim_dev's carrier should be UP, but it isn't"
 		cleanup_ns
 		exit 1
@@ -78,13 +74,36 @@ assert_carrier_down()
 	local netns="$1"
 	local nsim_dev="$2"
 
-	if is_carrier_up "$netns" "$nsim_dev"; then
+	local sysfs_carrier="$(ip netns exec "$netns" \
+		cat /sys/class/net/"$nsim_dev"/carrier 2>/dev/null)"
+	local ethtool_carrier="$(ip netns exec "$netns" \
+		ethtool -j "$nsim_dev" | jq '.[0]["link-detected"]' 2>/dev/null)"
+
+	if [ "$sysfs_carrier" -ne 0 -o "$ethtool_carrier" != "false" ]; then
 		echo "$nsim_dev's carrier should be DOWN, but it isn't"
 		cleanup_ns
 		exit 1
 	fi
 }
 
+set_carrier_up()
+{
+	local netns="$1"
+	local nsim_dev="$2"
+
+	ip netns exec "$netns" \
+		sh -c "echo 1 > /sys/class/net/$nsim_dev/carrier" 2>/dev/null
+}
+
+set_carrier_down()
+{
+	local netns="$1"
+	local nsim_dev="$2"
+
+	ip netns exec "$netns" \
+		sh -c "echo 0 > /sys/class/net/$nsim_dev/carrier" 2>/dev/null
+}
+
 ###
 ### Code start
 ###
@@ -161,6 +180,14 @@ ip netns exec nssv ip link set dev "$NSIM_DEV_1_NAME" up
 assert_carrier_down nssv "$NSIM_DEV_1_NAME"
 assert_carrier_down nscl "$NSIM_DEV_2_NAME"
 
+set_carrier_up nssv "$NSIM_DEV_1_NAME"
+
+assert_carrier_up nssv "$NSIM_DEV_1_NAME"
+assert_carrier_down nscl "$NSIM_DEV_2_NAME"
+
+set_carrier_down nssv "$NSIM_DEV_1_NAME"
+assert_carrier_down nssv "$NSIM_DEV_1_NAME"
+
 echo "$NSIM_DEV_1_FD:$NSIM_DEV_1_IFIDX $NSIM_DEV_2_FD:$NSIM_DEV_2_IFIDX" > $NSIM_DEV_SYS_LINK
 
 assert_carrier_up nssv "$NSIM_DEV_1_NAME"
@@ -172,6 +199,16 @@ ip netns exec nssv ip link set dev "$NSIM_DEV_1_NAME" up
 assert_carrier_up nssv "$NSIM_DEV_1_NAME"
 assert_carrier_up nscl "$NSIM_DEV_2_NAME"
 
+set_carrier_down nssv "$NSIM_DEV_1_NAME"
+
+assert_carrier_down nssv "$NSIM_DEV_1_NAME"
+assert_carrier_down nscl "$NSIM_DEV_2_NAME"
+
+set_carrier_up nscl "$NSIM_DEV_2_NAME"
+
+assert_carrier_up nssv "$NSIM_DEV_1_NAME"
+assert_carrier_up nscl "$NSIM_DEV_2_NAME"
+
 # send/recv packets
 
 tmp_file=$(mktemp)
-- 
2.53.0

