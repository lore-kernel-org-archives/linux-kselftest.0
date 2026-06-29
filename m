Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C14C3B6356;
	Mon, 29 Jun 2026 23:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782776037; cv=none; b=a4Q9XU8vT8IlMMgfsVK15nkPg+uKgAh2C8qpktxljQaQstrj2rYDfg1LEfO132n2845vs4HJBy34Lsf3SwZ+Vlj7yS2JLYjB76nNm61sOf4fz/g8CjNwkejPRYHesukDsEbuEDS6IcQVi+0oS5ICBKubmzHlVxKEIRWLv1xKj88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782776037; c=relaxed/simple;
	bh=qk60eEMx5MZViFHnzALAlDXXGvNpRAXGV+CAi3eOWhU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pWn+cQmkoaKGyAT6UUR+WWxRWhaBmSrgN6rNRzlI8SjaEi6R3Wo4cpoMerKcvj/08oOHl5bJ9v/MIsFmzR46PzHVorSosbYl8pqMwpHbCbtKwTiBAN8WnWMkMwkhMiAlnuoBef/8Jd2c9sbx9nN1ot2qMedvZ+Ik6Ky7Bie27tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NOVEb6ep; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NOVEb6ep"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 575B31F000E9;
	Mon, 29 Jun 2026 23:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782776036;
	bh=ODL5ahZQ0nGmsDVkXHsLfknLIRGIKeRbHFVqXURQNhc=;
	h=From:To:Cc:Subject:Date;
	b=NOVEb6epc/cPTRS6S5aADbeAeRPZh5dKThVJwxsUKMx5KxI2VIp/9M18IbZopEFs6
	 IhSh+npblvkTVDBVvr01z3vdGLj8S/8mLkKjYT9wyONgj8JTevbiTx4ohZTAvs6IMG
	 0UV+s2nzyS9futbtokihuz68g2r8IRFkvbeu6QmLMC9ks9AW2e7zA10lcj0TdrvTnF
	 TEXnBcv2V68ZT/OTBGcKQws3FI3dcDpdW/TSVCMxS0CViKqYnjmLUHHO7XbrcdGFSr
	 p13/BVPXTkkZfZtRzJdi32Cj43dJketCgJuKU2pRiPcq2GpXV5/EuOx+K/P85ztVg2
	 V3JzUozS3sGUg==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	shuah@kernel.org,
	petrm@nvidia.com,
	leitao@debian.org,
	dw@davidwei.uk,
	noren@nvidia.com,
	gal@nvidia.com,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net] selftests: net: bump default cmd() timeout to 20 seconds
Date: Mon, 29 Jun 2026 16:33:48 -0700
Message-ID: <20260629233348.2145841-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We always used 5 sec as the default command timeout. But soon after
it was introduced, David effectively made us ignore the timeout
(it was passed to process.communicate() as the wrong argument).
Gal recently fixed that, but turns out the 5 sec is not enough
for a lot of tests and setups. The fix regressed regressions.

In particular running reconfig commands (e.g. XDP attach) on mlx5
with 32 rings and 9k MTU, on a heavily-debug-enabled kernel takes
more than 5 sec. The XDP installation command will time out after
5 sec but since the sleeps in the kernel are non interruptible
the command finishes anyway, leaving the XDP program attached,
but with non-zero exit code. defer()ed cleanups are not installed,
breaking the environment for subsequent tests.

Since "install XDP" is a pretty normal command a "point fix"
does not seem appropriate. 32 rings is a fairly reasonable
config, too, so we should just increase the timeout to 20 sec.

There's no real reason behind the value of 20.

Fixes: 1cf270424218 ("net: selftest: add test for netdev netlink queue-get API")
Fixes: f0bd19316663 ("selftests: net: fix timeout passed as positional argument to communicate()")
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: shuah@kernel.org
CC: petrm@nvidia.com
CC: leitao@debian.org
CC: dw@davidwei.uk
CC: noren@nvidia.com
CC: gal@nvidia.com
CC: linux-kselftest@vger.kernel.org
---
 tools/testing/selftests/net/lib/py/utils.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/lib/py/utils.py b/tools/testing/selftests/net/lib/py/utils.py
index 308c91833239..9b40049e2dbb 100644
--- a/tools/testing/selftests/net/lib/py/utils.py
+++ b/tools/testing/selftests/net/lib/py/utils.py
@@ -44,7 +44,7 @@ import time
     Use bkg() instead to run a command in the background.
     """
     def __init__(self, comm, shell=None, fail=True, expect_fail=False, ns=None,
-                 background=False, host=None, timeout=5, ksft_ready=None,
+                 background=False, host=None, timeout=20, ksft_ready=None,
                  ksft_wait=None):
         if ns:
             if hasattr(ns, 'user_ns_path'):
@@ -113,7 +113,7 @@ import time
 
         return stdout, stderr
 
-    def process(self, terminate=True, fail=None, expect_fail=False, timeout=5):
+    def process(self, terminate=True, fail=None, expect_fail=False, timeout=20):
         if fail is None:
             fail = not terminate
 
-- 
2.54.0

