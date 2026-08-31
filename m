Received: from mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C23D3A8724
	for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 03:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788146920; cv=none; b=SxZtJfyRCp7lxV4VOYUURk/J/P8ud0R/ES0Hp+kCpF/3QhW1RgwGh1+7qjZkUE/o8Aalo5YdOwHfNsfmo1j9os3mO7nwrgfrwv8HHoetHtkyutdz/8zdB/0pIuQhSvSKiqQpJaVkKAfI+d30vOZmwusFCQ3KUTDvOS7IKov6Rmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788146920; c=relaxed/simple;
	bh=GdGUFYwI9sLmW78ms41T6yri69KUsRuYa4AHoe0nVuk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bppsAWZLbbfgpeg1BtWS4eDatpXXsDvixvMGvxGEomDLXTM9l3jHUpIsP8yZmc9frmzWAZnQnVJ82Fb0weMYHwivPb2+mp13u3TklBTeWZsFNjO97eMGS7r45YT9vS/Y9VciGtnEgNA+paM4xqRRfnBp9ZHDMtGxS7m05nd3xxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nvsCJ2Qv; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nvsCJ2Qv"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=GdGUFYwI9sLmW78ms41T6yri69KUsRuYa4AHoe0nVuk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788146916; v=1; x=1788751716;
 b=nvsCJ2QvVObrFoWi9rAZvH8VQsu/siGNvljMvf3Sg3MeKfF6ElFOoLzOFxJZ7pIDxMOvPhHT
 6rI6KQ2Ap8Df5LplbVzjktYpBWQbd4P64LiroI/MWtdsYnEU054FOz3+X18NzF9qoSeA1qsCIEs
 /NnMRbZrKgrhrxMJWS76/csE=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d7065f2427c3e93a;
	Mon, 31 Aug 2026 03:28:36 +0000
X-Mizu-Trace-ID: d7065f2427c3e93a
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Mon, 31 Aug 2026 11:28:11 +0800
Subject: [PATCH net-next 2/2] selftests: netdevsim: add speed testing
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-nsim_speed-v1-2-7a651ee65738@kylinos.cn>
References: <20260831-nsim_speed-v1-0-7a651ee65738@kylinos.cn>
In-Reply-To: <20260831-nsim_speed-v1-0-7a651ee65738@kylinos.cn>
To: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Hangbin Liu <liuhangbin@kylinos.cn>
X-Mailer: b4 0.14.3

From: Hangbin Liu <liuhangbin@kylinos.cn>

Add a script for netdevsim speed test. Make sure the speed and duplex
could be changed. And the speed can't be larger than the max speed.

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
 .../selftests/drivers/net/netdevsim/Makefile       |  1 +
 .../drivers/net/netdevsim/ethtool-speed.sh         | 33 ++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/netdevsim/Makefile b/tools/testing/selftests/drivers/net/netdevsim/Makefile
index 9808c2fbae9e..bd3d0f5ee07a 100644
--- a/tools/testing/selftests/drivers/net/netdevsim/Makefile
+++ b/tools/testing/selftests/drivers/net/netdevsim/Makefile
@@ -8,6 +8,7 @@ TEST_PROGS := \
 	ethtool-features.sh \
 	ethtool-fec.sh \
 	ethtool-pause.sh \
+	ethtool-speed.sh \
 	fib.sh \
 	fib_notifications.sh \
 	hw_stats_l3.sh \
diff --git a/tools/testing/selftests/drivers/net/netdevsim/ethtool-speed.sh b/tools/testing/selftests/drivers/net/netdevsim/ethtool-speed.sh
new file mode 100755
index 000000000000..c8aefa9c8a1f
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/netdevsim/ethtool-speed.sh
@@ -0,0 +1,33 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0-only
+
+source ethtool-common.sh
+
+NSIM_NETDEV=$(make_netdev)
+
+set -o pipefail
+
+s=$(ethtool --json "$NSIM_NETDEV" | jq '.[].speed')
+check $? "$s" "5000"
+
+s=$(ethtool --json "$NSIM_NETDEV" | jq -r '.[].duplex')
+check $? "$s" "Full"
+
+ethtool -s "$NSIM_NETDEV" speed 1000 duplex half
+
+s=$(ethtool --json "$NSIM_NETDEV" | jq '.[].speed')
+check $? "$s" "1000"
+
+s=$(ethtool --json "$NSIM_NETDEV" | jq -r '.[].duplex')
+check $? "$s" "Half"
+
+ethtool -s "$NSIM_NETDEV" speed 10000 2>/dev/null
+check $? "" "" 1
+
+if [ "$num_errors" -eq 0 ]; then
+    echo "PASSED all $((num_passes)) checks"
+    exit 0
+else
+    echo "FAILED $num_errors/$((num_errors+num_passes)) checks"
+    exit 1
+fi

-- 
2.55.0

