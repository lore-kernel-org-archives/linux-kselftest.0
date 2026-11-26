Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660286;
	b=NJfWXdBUC+9Q0Pl7z1ZhpKJZf9T+6qZ6Oz28xtid4qx9IdzHY/mD9fCCC9lCBe41e+fd
	 GzOKfzbzQkHMJyW7gEdmLOv04P3ScWteglIKqWZ76HYU8txPb0zBmac1Bb5D31lyKCAGH
	 McnAf0JPupARvnoWXWiPHbhqNvyaF7qo8HDt10CY63M5XYzj0W+i+C8TIXCMapnTr5Q4a
	 ig4//X98Gzs90krNpj/gtFEE/y+X3Bl22he1nCYLtdKZRJGyPmiNP22EdPmajcVnO5WPt
	 ZuOygUExNaEkYRCgctAQF+jAiu95+yR8IgdOs3t/zUMPDpCeb50F2MVv8OridoMvC9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660286;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=XoNUqoMOUR4pNg64kYKOFS5cc8mxi4fzlWjxyaA/0Jk=;
	b=QGfAnzMz/UP2ocDtbbmWgHdbACHrzwGvkDCxGse05ni4EecuYZC5UXh0sdsR+qFdbwww
	 tboNjpbC/qHZyB/dyn3zG2NlMQvZCiGr4GgbtRfAoQMTYhXVNQkaH8ygMyEtdkr+ZdAvx
	 iwlet01K0qv4j/h20ND/ktuolEbs0grFE9Vz3AuCBobJDQeVqEDSL3hSnKVyFgLyJj0am
	 hW/uxBucuUHoT7OYF2TUUTmZ5fOqZgAWIK9LJ2na007b4V66sFgMq4qdWh27tcHgo7PdZ
	 B6NYcocDaMxrahpAdg9qFPA7+y6LjdfQqtzQDHgoMU+K31J1wcEz/ik5WRyDwO+NxZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HrDUfDaD;
	arc=none smtp.remote-ip=95.215.58.56
Received: from mta1.migadu.com (out-56.mta1.migadu.com [95.215.58.56])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC6E606A323
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 02:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FC6E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HrDUfDaD
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9ytP9VIUcsucr3RFXON7iMevk/B43pe2qF9qb3+uaGc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795660283; v=1; x=1796265083;
 b=HrDUfDaDQI5v0C4c3EjTC6lOo5ikPvn3xq8modtIXr/rMeTcCmRz4hXOL6vMcT7Y7EuUzH8k
 MFW/K3XQnOYHL1zowMekC2FmH8V4806jzTVdURZxLslZ91PL874e0p1Eu/ufvHAVoapfKfhEDTf
 chhrFKsx/4z18U8kBiNs0MIY=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id e78637e12af0c6eb;
	Thu, 26 Nov 2026 02:31:23 +0000
X-Mizu-Trace-ID: e78637e12af0c6eb
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Thu, 26 Nov 2026 10:30:57 +0800
Subject: [PATCH net 3/3] selftests: bonding: add recovery updelay test for
 broadcast mode
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-bond_broadcast_updelay-v1-3-188e5538d6ca@kylinos.cn>
References: <20261126-bond_broadcast_updelay-v1-0-188e5538d6ca@kylinos.cn>
In-Reply-To: <20261126-bond_broadcast_updelay-v1-0-188e5538d6ca@kylinos.cn>
To: Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Tonghao Zhang <tonghao@bamaicloud.com>, 
 Nikolay Aleksandrov <razor@blackwall.org>, Shuah Khan <shuah@kernel.org>
Cc: "jiangjiehua (A)" <jiangjiehua1@huawei.com>, 
 Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Hangbin Liu <hangbin.liu@linux.dev>
X-Mailer: b4 0.16.0

From: Hangbin Liu <liuhangbin@kylinos.cn>

Add a recovery updelay test for bonding mode 3. Merge all related tests
into a single test file.

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
 .../testing/selftests/drivers/net/bonding/Makefile |  3 +-
 .../drivers/net/bonding/mode-2-recovery-updelay.sh | 45 ----------------------
 ...e-1-recovery-updelay.sh => recovery-updelay.sh} | 13 +++----
 3 files changed, 7 insertions(+), 54 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/bonding/Makefile b/tools/testing/selftests/drivers/net/bonding/Makefile
index e337c099fb40..c186310c2d6e 100644
--- a/tools/testing/selftests/drivers/net/bonding/Makefile
+++ b/tools/testing/selftests/drivers/net/bonding/Makefile
@@ -15,9 +15,8 @@ TEST_PROGS := \
 	bond_stacked_header_parse.sh \
 	bond_vlan_real_dev.sh \
 	dev_addr_lists.sh \
-	mode-1-recovery-updelay.sh \
-	mode-2-recovery-updelay.sh \
 	netcons_over_bonding.sh \
+	recovery-updelay.sh \
 # end of TEST_PROGS
 
 TEST_FILES := \
diff --git a/tools/testing/selftests/drivers/net/bonding/mode-2-recovery-updelay.sh b/tools/testing/selftests/drivers/net/bonding/mode-2-recovery-updelay.sh
deleted file mode 100755
index 2d275b3e47dd..000000000000
--- a/tools/testing/selftests/drivers/net/bonding/mode-2-recovery-updelay.sh
+++ /dev/null
@@ -1,45 +0,0 @@
-#!/bin/bash
-# SPDX-License-Identifier: GPL-2.0
-
-# Regression Test:
-#  When the bond is configured with down/updelay and the link state of
-#  slave members flaps if there are no remaining members up the bond
-#  should immediately select a member to bring up. (from bonding.txt
-#  section 13.1 paragraph 4)
-#
-#  +-------------+       +-----------+
-#  | client      |       | switch    |
-#  |             |       |           |
-#  |    +--------| link1 |-----+     |
-#  |    |        +-------+     |     |
-#  |    |        |       |     |     |
-#  |    |        +-------+     |     |
-#  |    | bond   | link2 | Br0 |     |
-#  +-------------+       +-----------+
-#     172.20.2.1           172.20.2.2
-
-
-REQUIRE_MZ=no
-REQUIRE_JQ=no
-NUM_NETIFS=0
-lib_dir=$(dirname "$0")
-source "$lib_dir"/../../../net/forwarding/lib.sh
-source "$lib_dir"/lag_lib.sh
-
-cleanup()
-{
-	lag_cleanup
-}
-
-trap cleanup 0 1 2
-
-lag_setup_network
-test_bond_recovery mode 2 miimon 100 updelay 0
-test_bond_recovery mode 2 miimon 100 updelay 200
-test_bond_recovery mode 2 miimon 100 updelay 500
-test_bond_recovery mode 2 miimon 100 updelay 1000
-test_bond_recovery mode 2 miimon 100 updelay 2000
-test_bond_recovery mode 2 miimon 100 updelay 5000
-test_bond_recovery mode 2 miimon 100 updelay 10000
-
-exit "$EXIT_STATUS"
diff --git a/tools/testing/selftests/drivers/net/bonding/mode-1-recovery-updelay.sh b/tools/testing/selftests/drivers/net/bonding/recovery-updelay.sh
similarity index 72%
rename from tools/testing/selftests/drivers/net/bonding/mode-1-recovery-updelay.sh
rename to tools/testing/selftests/drivers/net/bonding/recovery-updelay.sh
index 9d26ab4cad0b..05edf9915cc0 100755
--- a/tools/testing/selftests/drivers/net/bonding/mode-1-recovery-updelay.sh
+++ b/tools/testing/selftests/drivers/net/bonding/recovery-updelay.sh
@@ -34,12 +34,11 @@ cleanup()
 trap cleanup 0 1 2
 
 lag_setup_network
-test_bond_recovery mode 1 miimon 100 updelay 0
-test_bond_recovery mode 1 miimon 100 updelay 200
-test_bond_recovery mode 1 miimon 100 updelay 500
-test_bond_recovery mode 1 miimon 100 updelay 1000
-test_bond_recovery mode 1 miimon 100 updelay 2000
-test_bond_recovery mode 1 miimon 100 updelay 5000
-test_bond_recovery mode 1 miimon 100 updelay 10000
+
+for mode in 1 2 3; do
+	for delay in 0 200 500 1000 2000 5000 10000; do
+		test_bond_recovery mode "${mode}" miimon 100 updelay "${delay}"
+	done
+done
 
 exit "$EXIT_STATUS"

-- 
2.56.0

