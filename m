Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E227F23A566
	for <linux-kselftest@vger.kernel.org>; Sun, 31 May 2026 09:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780219104; cv=none; b=igQjAaI67gps2J5qHuASn0X3/93IZZ1W91evVqiYzU4S6668zJFx1moN9vm4J5KSdKU/roCY0Mdh2BEC5+n3R4b7Zo1ar4YA6tc/NSBdU2PL6PTZIXwkeHjoy6PIotdLpxXlBknlVsYGf+IpU8qWOL4j3NMZNng2JjxTTNFtlPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780219104; c=relaxed/simple;
	bh=2I7V68wBUEJOhsC+Qjlo0/3i5sUOYGo/ncWhJsZF4yI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P8aq0Dt5ntvPmFvior7gSIKoxhyn+OmRWLSnoy9QgMZTc11TRy5czQw1n2+y/9I699EqsdNEyZdPENzxZUAezQIGcMcRe+ONfUjI3YS2zxdYehd/w3B76IFlylKmErJx5yrWw6FtPwdMfQI1JUqAigCBNtmbu1utIS1Dr3rEGH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=G8EHJ/rD; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="G8EHJ/rD"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780219090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IWyXqkdh8B95Hbx0fw5ujqdH7uVIqVfs8/h+BIpCjW8=;
	b=G8EHJ/rD302WYFwKwCeAEHVsN5ajorXot4mN3ifwo62TT10PHAvV0/oOR9JNE8XCYBZpDw
	u5l5vPqec9u24mGpJoGUXj9aPK6YFYp0raryffYs2b3N8sbPeUhRvrDP4vmUYsR8I2eU7U
	Y7yjeyBTUOfIFwNdNrhKrCHw+Azuv60=
From: Kunwu Chan <kunwu.chan@linux.dev>
To: sj@kernel.org,
	shuah@kernel.org
Cc: damon@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Kunwu Chan <kunwu.chan@gmail.com>,
	Wang Lian <lianux.mm@gmail.com>,
	Kunwu Chan <chentao@kylinos.cn>
Subject: [PATCH 1/5] selftests/damon: prevent cross-context state pollution in DamonCtx
Date: Sun, 31 May 2026 17:17:20 +0800
Message-ID: <20260531091724.84381-1-kunwu.chan@linux.dev>
In-Reply-To: <20260531085633.48626-1-kunwu.chan@linux.dev>
References: <20260531085633.48626-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Kunwu Chan <kunwu.chan@gmail.com>

DamonCtx.__init__() uses mutable default values for
monitoring_attrs, targets, and schemes.  In Python these are
evaluated once at function definition time, so multiple
DamonCtx instances can unintentionally share the same lists
and DamonAttrs instance.

Replace the mutable defaults with None sentinels and
initialize the objects when needed.

Co-developed-by: Wang Lian <lianux.mm@gmail.com>
Signed-off-by: Wang Lian <lianux.mm@gmail.com>
Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 tools/testing/selftests/damon/_damon_sysfs.py | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/damon/_damon_sysfs.py b/tools/testing/selftests/damon/_damon_sysfs.py
index 8b12cc048440..2f6f2699db25 100644
--- a/tools/testing/selftests/damon/_damon_sysfs.py
+++ b/tools/testing/selftests/damon/_damon_sysfs.py
@@ -624,17 +624,23 @@ class DamonCtx:
     pause = None
     idx = None
 
-    def __init__(self, ops='paddr', monitoring_attrs=DamonAttrs(), targets=[],
-            schemes=[], pause=False):
+    def __init__(self, ops='paddr', monitoring_attrs=None, targets=None,
+            schemes=None, pause=False):
         self.ops = ops
+        if monitoring_attrs is None:
+            monitoring_attrs = DamonAttrs()
         self.monitoring_attrs = monitoring_attrs
         self.monitoring_attrs.context = self
 
+        if targets is None:
+            targets = []
         self.targets = targets
         for idx, target in enumerate(self.targets):
             target.idx = idx
             target.context = self
 
+        if schemes is None:
+            schemes = []
         self.schemes = schemes
         for idx, scheme in enumerate(self.schemes):
             scheme.idx = idx
-- 
2.43.0

