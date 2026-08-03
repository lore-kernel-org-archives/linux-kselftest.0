Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D2143800C;
	Mon,  3 Aug 2026 21:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785791993; cv=none; b=mRCKvOduB7d5qi+3V9Z7r2akYgZngmm8An/kRYS6wEgwnO+ap/sBb1hVx2hhSbOzlxcP8YjW8dPj2iRHjjFF7IaqLKMnmJqHlI2/ocZVZcJm4LR/Fn/xGxMPpcHQqXmz/ukrpER4QuLvaM7qarlpAJ9KarZs+SyqYDfmjFUW0T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785791993; c=relaxed/simple;
	bh=tir6LW7aUj+LYuLgVB9motin0fApLWg0CyExsnpND3U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tCEgRVdthi+92r5Aqm9BoG0gOqMrJihDACL76Jgp9iHI6EC1B4qykG3C+qNvSMcdZyhMPKJloEz1kSpk3W6iVnlaJgHGEwyHgAq3182z7WjS4odiA2KBppBEOeDaiMnDXms1SRcJEdDKv65PHhJUIzl2zQTVAT5XxCJrp+j+EeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RlzAsnbm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RlzAsnbm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9A121F000E9;
	Mon,  3 Aug 2026 21:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785791987;
	bh=l76YY3okD5y9M96yYzcOA2UM5dO+2DAEnIVKUAYYydc=;
	h=From:To:Cc:Subject:Date;
	b=RlzAsnbmiTK4SelzG0ctV6mnP/dG4360jykX1lxz3auMdx2z3bQ6569iGhFGF4hnw
	 GD7z+JHJvL1/v2yQupur/CZWsjK3SAJjnNg41gdPzuVKt2rmKuIFx0H5so1eu4sCGN
	 4iNGdhSH+/yEH0jTgvsfbDCEZMaUPm+OdkloX0d4P+NDIS8WsCz/o/PPd2IfAZBzm8
	 jMC+3MdbtZy4B27BKYvFd1o3wwnYvZtarMuCtwygOX6PhaAeLTtHu+SQO9l/U0CKSK
	 B2dQkR9WpKD+nqDdODIV9pdKx/+gXv6mXo45Z5gIvOa2vbA1zYRdMXOc00DIYOgAIW
	 +qWQZsE7vXV2w==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	shuah@kernel.org,
	sdf@fomichev.me,
	dw@davidwei.uk,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next] selftests: drv-net: print device info at the start
Date: Mon,  3 Aug 2026 14:19:44 -0700
Message-ID: <20260803211944.2166211-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a reviewer asks a developer to run an upstream test during code
review, it's often ambiguous whether the test was actually run against
a real device, or just against netdevsim. Print the driver name and
ifname at the start of the test, e.g.:

  # Interface: enp0s13f0u1u4, driver: r8152
  TAP version 13
  1..1
  ok 1 ...

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: shuah@kernel.org
CC: sdf@fomichev.me
CC: dw@davidwei.uk
CC: linux-kselftest@vger.kernel.org
---
 .../selftests/drivers/net/lib/py/env.py       | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/net/lib/py/env.py b/tools/testing/selftests/drivers/net/lib/py/env.py
index e4acf3d8333f..a8e8029868a7 100644
--- a/tools/testing/selftests/drivers/net/lib/py/env.py
+++ b/tools/testing/selftests/drivers/net/lib/py/env.py
@@ -7,7 +7,7 @@ import time
 import json
 from pathlib import Path
 from lib.py import KsftSkipEx, KsftXfailEx
-from lib.py import ksft_setup, wait_file
+from lib.py import ksft_pr, ksft_setup, wait_file
 from lib.py import cmd, ethtool, ip, CmdExitFailure
 from lib.py import NetNS, NetdevSimDev, UserNetNS
 from .remote import Remote
@@ -31,6 +31,7 @@ from . import bpftool, RtnlFamily, Netlink
 
         # Following attrs must be set be inheriting classes
         self.dev = None
+        self.ifname = None
 
     def _load_env_file(self):
         env = os.environ.copy()
@@ -58,6 +59,22 @@ from . import bpftool, RtnlFamily, Netlink
     def __del__(self):
         pass
 
+    def _print_dev_info(self):
+        """
+        Show whether the test ran on real hardware or netdevsim.
+        Useful to confirm when results are shared on the mailing list.
+        """
+        driver = "unknown"
+        try:
+            info = ethtool(f"-i {self.ifname}").stdout
+            for line in info.splitlines():
+                if line.startswith("driver:"):
+                    driver = line.split(':', 1)[1].strip() or driver
+                    break
+        except (CmdExitFailure, FileNotFoundError):
+            pass
+        ksft_pr(f"Interface: {self.ifname}, driver: {driver}")
+
     def __enter__(self):
         ip(f"link set dev {self.dev['ifname']} up")
         wait_file(f"/sys/class/net/{self.dev['ifname']}/carrier",
@@ -94,6 +111,7 @@ from . import bpftool, RtnlFamily, Netlink
             self.dev = self._ns.nsims[0].dev
         self.ifname = self.dev['ifname']
         self.ifindex = self.dev['ifindex']
+        self._print_dev_info()
 
     def __del__(self):
         if self._ns:
@@ -163,6 +181,7 @@ from . import bpftool, RtnlFamily, Netlink
 
         self.ifname = self.dev['ifname']
         self.ifindex = self.dev['ifindex']
+        self._print_dev_info()
 
         # resolve remote interface name
         self.remote_ifname = self.resolve_remote_ifc()
-- 
2.55.0

