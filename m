Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6F72749ED
	for <linux-kselftest@vger.kernel.org>; Sun,  5 Apr 2026 19:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775417168; cv=none; b=AOp9oE5Axos/yDBYvh91aZUYbpmy5JGIb3N0qTcNsAct+V36qMZHgHd2zFxT2+QPbsIkX1U252pMA8DB8XJASjFyzAON+pDr4Gr1a/56SOUMz5cpgc+1hXyWTt24nBDYwBPhjAZg6cJzOmkZba7o/IGAU21UMIgbLmK6dyjrE6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775417168; c=relaxed/simple;
	bh=ZBcZvYg8chUVeBHLb5Nc7LtAXrw1Wxzm2f8jbkheAh0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D9Bhk2IYCPGJ1JS4JZLP1Fktc2ftrs4PFwmtYtQvbAWayy4gKALAP12I7kidNe0hWTqe+Sc285cdllYubPXDJtgQcrxL2MZNI9UAosXTHvbrqM6AJ2fs+kajDfv+vNXlnc/WgqVgKRPkBJQ1OmX13BW8oVtmmGx1ENCKhSkMGow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=LGyn4a3e; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="LGyn4a3e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=5m
	GncB5DdcDF2waWfzv/OqLYXp86WXSXhTdoWwc5NhA=; b=LGyn4a3eKVa/LpBrQI
	+iZYVph2VOuR7NIUMR2mZeR5sX+HfJCvDjAjeE5AubWG+R6jTw4O0pFn7dciUXtd
	9NViKZXU0npVgRcvrmyMGNSL0PWIlxLSqoGeJL9+4kyBkQBVkyuiRUU/XmeK4Zcm
	Mbbmg4i+dgrgM7mL4WrCdrcRE=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgA3QaIut9Jp8AzwUw--.1691S2;
	Mon, 06 Apr 2026 03:25:38 +0800 (CST)
From: CaoRuichuang <create0818@163.com>
To: shuah@kernel.org
Cc: skhan@linuxfoundation.org,
	linux-kselftest@vger.kernel.org,
	CaoRuichuang <create0818@163.com>
Subject: [PATCH] selftests: kselftest: avoid mktemp -u in runner
Date: Mon,  6 Apr 2026 03:25:29 +0800
Message-Id: <20260405192529.81684-1-create0818@163.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgA3QaIut9Jp8AzwUw--.1691S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF1furyxur4kWrWrtry7Jrb_yoW8Cr4UpF
	4rAa15Kr1jywnrGF1xGr17XF4fAr4kZFWUuwn5J348Aw15uF1xXr4I9F1qv3WkArZ5Xrn0
	yayDK3WxWrn8ZFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUndjiUUUUU=
X-CM-SenderInfo: pfuht3jhqyimi6rwjhhfrp/xtbCvxIJQmnStzITYgAA3p

run_in_netns() uses mktemp -u to generate both the network namespace name and the per-test log path. That pattern is inherently racy because it only prints a candidate name without creating anything.

Switch to mktemp() and mktemp -d so the temporary path is created atomically first, then derive the namespace name from the allocated path. Also return immediately when ip netns add fails instead of continuing in a broken state.

Signed-off-by: CaoRuichuang <create0818@163.com>
---
 tools/testing/selftests/kselftest/runner.sh | 24 +++++++++++++--------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
index 3a62039fa..13cdbaf36 100644
--- a/tools/testing/selftests/kselftest/runner.sh
+++ b/tools/testing/selftests/kselftest/runner.sh
@@ -164,18 +164,24 @@ in_netns()
 
 run_in_netns()
 {
-	local netns=$(mktemp -u ${BASENAME_TEST}-XXXXXX)
-	local tmplog="/tmp/$(mktemp -u ${BASENAME_TEST}-XXXXXX)"
-	ip netns add $netns
-	if [ $? -ne 0 ]; then
+	local netns_tmp netns tmplog
+
+	netns_tmp=$(mktemp -d "/tmp/${BASENAME_TEST}-netns-XXXXXX")
+	netns=${netns_tmp##*/}
+	rmdir "$netns_tmp"
+	tmplog=$(mktemp "/tmp/${BASENAME_TEST}-log-XXXXXX")
+
+	if ! ip netns add "$netns"; then
 		echo "# Warning: Create namespace failed for $BASENAME_TEST"
 		echo "not ok $test_num selftests: $DIR: $BASENAME_TEST # Create NS failed"
+		rm -f "$tmplog"
+		return
 	fi
-	ip -n $netns link set lo up
-	in_netns $netns &> $tmplog
-	ip netns del $netns &> /dev/null
-	cat $tmplog
-	rm -f $tmplog
+	ip -n "$netns" link set lo up
+	in_netns "$netns" >"$tmplog" 2>&1
+	ip netns del "$netns" >/dev/null 2>&1
+	cat "$tmplog"
+	rm -f "$tmplog"
 }
 
 run_many()
-- 
2.39.5 (Apple Git-154)

