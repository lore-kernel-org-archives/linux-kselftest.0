Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0870A367B70
	for <linux-kselftest@vger.kernel.org>; Mon,  8 Jun 2026 05:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780897190; cv=none; b=RJrQu5RQtn79oxbmmSNiR1hUuCcM6XB8yJOa9gtzfjU/xcKOpxUtstq2SYGeiDo5FOWkc+ntAiAbrWP91wivxo/sO4YJuAvyo6vBO8t9J3uFZEdGlRomSx1Rdq8eo11huXG7P6oYWi7hHCFFl781q0zCnbFVTYK2gk5BFdhSNJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780897190; c=relaxed/simple;
	bh=Gnmcw2vbZS/WMbktkUB/bqnpacEFekF4hl3ujR/jTLk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XxIhvgK8LaFXmwBYK4hikOaEtoR1VBy62dYqzijfjjEDEeZHzCk7yme0u7Ui6CZU+fc4DTdcj/bnIMIK0/umUp2EUBLnUb6vArLEerFX1XXPsXv3Gy4bikVL3PGNohYkPNLT3U7r7IQIYUBm6NrDCinOv/4rd8OGb6MHj7QuOcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=SdgDquuW; arc=none smtp.client-ip=115.124.30.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="SdgDquuW"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780897179; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=Z/M8I0ggV8g5G3rV9SUyknJRWIxHULtKqRop/8E1M9Y=;
	b=SdgDquuWmTNqH15IOGUb2vlVXZ/SEbZr69MS49SGf85m+iu8/TGMmqWXNAmKz3TqZbABCbPI3gzORdq9snPoIOLjeTR58HCTHTDxfhBPVGs4JdeuzyLzSBM39Uo7enXvsuIVnhY+F1f9gC5k/JMmIoEJrrC9bbkGtGHN5OvCiek=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=kanie@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0X4Jq033_1780897174;
Received: from localhost(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0X4Jq033_1780897174 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 08 Jun 2026 13:39:38 +0800
From: Guixin Liu <kanie@linux.alibaba.com>
To: Shuah Khan <shuah@kernel.org>,
	Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Wei Yang <richard.weiyang@gmail.com>
Cc: linux-kselftest@vger.kernel.org,
	xlpang@linux.alibaba.com,
	oliver.yang@linux.alibaba.com
Subject: [PATCH] selftests/uevent: increase __UEVENT_BUFFER_SIZE to avoid ENOBUFS on busy systems
Date: Mon,  8 Jun 2026 13:39:34 +0800
Message-ID: <20260608053934.4059533-1-kanie@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kselftests case uevent.uevent_filtering fails reproducibly on busy
systems (e.g. Intel EMR / AMD servers) with:

  No buffer space available - Failed to receive uevent

The listener binds the NETLINK_KOBJECT_UEVENT socket to all 32 multicast
groups (nl_groups = -1) but only sets SO_RCVBUF to 4 KiB
(__UEVENT_BUFFER_SIZE = 2048 * 2). On hosts with many devices, the
kernel and userspace daemons (udev/systemd) constantly emit uevents on
multiple groups, plus the test itself triggers 10 add events in a row.
The 4 KiB receive buffer overflows before the listener can drain it,
recvmsg() returns -ENOBUFS, and the test bails out as failure.

Increase __UEVENT_BUFFER_SIZE to 1 MiB so the receive buffer is large
enough to absorb the burst of uevents on busy systems. After this
change the test passes consistently across dozens of runs on Intel EMR
and AMD platforms.

Signed-off-by: Guixin Liu <kanie@linux.alibaba.com>
---
 tools/testing/selftests/uevent/uevent_filtering.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/uevent/uevent_filtering.c b/tools/testing/selftests/uevent/uevent_filtering.c
index 974b076f9235..33a09f66d7e2 100644
--- a/tools/testing/selftests/uevent/uevent_filtering.c
+++ b/tools/testing/selftests/uevent/uevent_filtering.c
@@ -22,7 +22,7 @@
 #include "kselftest_harness.h"
 
 #define __DEV_FULL "/sys/devices/virtual/mem/full/uevent"
-#define __UEVENT_BUFFER_SIZE (2048 * 2)
+#define __UEVENT_BUFFER_SIZE (1024 * 1024)
 #define __UEVENT_HEADER "add@/devices/virtual/mem/full"
 #define __UEVENT_HEADER_LEN sizeof("add@/devices/virtual/mem/full")
 #define __UEVENT_LISTEN_ALL -1
-- 
2.43.7

