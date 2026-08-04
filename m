Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1653921E0;
	Tue,  4 Aug 2026 15:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785856257; cv=none; b=ZESR1v09dV6QBqSTJbHTlirZWLBV1KKjk8NWgZAB6g/8Ycr5FvX6nLBBIOj16UIRvBjlkpd5EX7drt11V+i8XGDKR6rwnNXODdO3LbafUlTzjkAcxvCXNfeYPQZDrXP0QfK7ob2rVqkjtuyEmzxWTLO8zrWgF8+9o78p5TWVNQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785856257; c=relaxed/simple;
	bh=psKjPjIXb8JVBz1qv3QtsZYfDMejQCyHE/83LjvOyBc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JlwM/AnentAVxn3TkEVvaCfnvrYWiHlDhd3dkyuBPH2vvgMjw/SpFBNyzIUEWq6xlfYmY0fCaHO++7QauY5mrHAPdzqfzOCGPSLKKvi0RJ1eNAz/4p+YHrhjm35fcANDbqfQKaSTvIP8ZO+mKVcdl+Ei37HX+4kfp7myIGI9QXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C1RM1nMQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C1RM1nMQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89DE71F000E9;
	Tue,  4 Aug 2026 15:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785856250;
	bh=NE0mxghkIZsUdwYoGrFbccO5wpMDsJ34QPlRnkvtHb0=;
	h=From:To:Cc:Subject:Date;
	b=C1RM1nMQFG7RSB3T+IhFDHt8Wha/C5It7U16Vcdkn/vStTsCNAtYA1oPt8PTOynS2
	 1ULKIGog1T9R3jsV+gbPG4mWbABLJIPSeQcvkaAhcJyYbmkQwnb0uvFbGTwrSV+9pg
	 SmkBAlo3Dg2WnI4lzBT2AV/+3V0Vw3mP6QoDkvwLK8TGHU577QYN7aukrlGS8+EZD4
	 dAWmFOarF7q+2XkeBxTk1ADCOf6wBUAYkUXV5CtRrOVxjIMMDGJRy6/ZXDYLjfFY4B
	 dxPxcTvAKihlc+jyYiU6QCI8owgIicdZhRLuV4vekrU1KL5saJqqTcJ+1z/JEqtNUO
	 aZpLP6b+rSJsA==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	shuah@kernel.org,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	bobbyeshleman@meta.com,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next] selftests: drv-net: hw: reset HDS mode after netkit devmem tests
Date: Tue,  4 Aug 2026 08:10:40 -0700
Message-ID: <20260804151040.2755153-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HDS mode has confusing semantics. On GET kernel reports
effective mode. On SET kernel expects explicit config.
Effective mode on GET means that we know the current
state, but we don't know if it's a driver default
or user setting. This matter because driver default
can change automatically when e.g. XDP is attached.
Explicit user setting must not be lost.

With that in mind, we can't restore the HDS setting
like we restore other NIC config. We should always
reset to default ("unknown").

This fixes an issue with tests running after the devmem
test not being able to attach XDP, e.g.

   Exception|   File "./xdp_metadata.py", line 105, in test_xdp_rss_hash
   [...]
   Exception| net.lib.py.utils.CmdExitFailure: Command failed
   Exception| CMD: ip link set dev ens9np0 xdpdrv pinned /sys/fs/bpf/xdp_metadata_test/xdp_rss_hash
   Exception|   EXIT: 2
   Exception|   STDERR: Error: unable to install XDP to device using tcp-data-split.
   not ok 1 xdp_metadata.test_xdp_rss_hash.tcp

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: shuah@kernel.org
CC: hawk@kernel.org
CC: john.fastabend@gmail.com
CC: sdf@fomichev.me
CC: bobbyeshleman@meta.com
CC: linux-kselftest@vger.kernel.org
---
 tools/testing/selftests/drivers/net/hw/devmem_lib.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/devmem_lib.py b/tools/testing/selftests/drivers/net/hw/devmem_lib.py
index 0921ff03eb81..4e6316c7de96 100644
--- a/tools/testing/selftests/drivers/net/hw/devmem_lib.py
+++ b/tools/testing/selftests/drivers/net/hw/devmem_lib.py
@@ -37,14 +37,13 @@ from lib.py import (bkg, cmd, defer, ethtool, rand_port, wait_port_listen,
     rings = ethnl.rings_get({'header': {'dev-index': cfg.ifindex}})
     orig_rx_rings = rings['rx']
     orig_hds_thresh = rings.get('hds-thresh', 0)
-    orig_data_split = rings.get('tcp-data-split', 'unknown')
 
     ethnl.rings_set({'header': {'dev-index': cfg.ifindex},
                      'tcp-data-split': 'enabled',
                      'hds-thresh': 0,
                      'rx': min(64, orig_rx_rings)})
     defer(ethnl.rings_set, {'header': {'dev-index': cfg.ifindex},
-                            'tcp-data-split': orig_data_split,
+                            'tcp-data-split': 'unknown',
                             'hds-thresh': orig_hds_thresh,
                             'rx': orig_rx_rings})
 
-- 
2.55.0

