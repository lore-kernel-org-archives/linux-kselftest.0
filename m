Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32960388E55
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 03:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784516644; cv=none; b=QwgJPGKrC0897ih5YvvcTg675fuKUoAnHCTrZp0xicWeP6WoKR/lHgFBoj7lqEv8pgUV7uPcrnUXXc6LTPeGeSF8xJGSOsLMf5COMq8oUPKX8PscXwUh8fvQRxUgPf87vTNQ2FdUP5X9PgXQBK9WlbvJhmmL2GrzQLvCOMjlo2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784516644; c=relaxed/simple;
	bh=YLKc+POCNITKfz5Zq68JdFxIzpDDqljeDs2WwwuKzhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ITOqTlAHtO6qfmfY9PIQXUKZhqWUScU9Wen41IfrXgbVItUbnkfQbZWwyDSVVTk4WTDuh1FI+sI1SsDkUB/08FlVzDfGycyUMDak3ZQAo49H8+EFyer71Dap05DhMizo2CMPhTLiIy9uF+C2bbZtcMv+u56FNaECtrpfeMYCro8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HrLK/q8P; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HrLK/q8P"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cea3004256so111243515ad.0
        for <linux-kselftest@vger.kernel.org>; Sun, 19 Jul 2026 20:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784516641; x=1785121441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zbv8c6XPjklVCkXRSa81M3HIzY/Ff3msBnn5ibeFm/4=;
        b=HrLK/q8PRfkyVvzkhP3WYDphKKdTqg+kPAESMle/XLoss56Fq/z/JhH8oip4g7opsW
         X17Va7UNupTcCsqjhvGTvSa8ZQR0XKfTOCJmMOPxpX9jU+vSrAJqgejtGvA+Dgl6DAaC
         j9RN4JM2H2MboYy6bONjPodBLX7O2QEpSDY4DqzC+3Zl0hD2ERoNZNjJQ3+9GnbP+ZM4
         UzOQ3JTfdySNdnp5Z0fuecsMGVkA8aQCKlASegbbmEoGashAEEeN/BSLTB4V1HPQpxA0
         Dap/tGMKdb/qlhpOaypm6ADn8pGxx/aDeMH85CqSaDqJCWUY1gi2/mlMAnrBdPT+CsWn
         sbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784516641; x=1785121441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zbv8c6XPjklVCkXRSa81M3HIzY/Ff3msBnn5ibeFm/4=;
        b=bJH7o5nJ2YnXh/4HY20+YSrJ3ifC3EoottJmRJ3Po7HTxiacdYoCgSvAbYnD11L2xb
         9mfRC0OC5HV+l7LICUcgegojoZ5VbC88NNHYEJMzYmZUHL9WxfurkgoHLQ//r/8b7PSl
         ekGGU1dj5ZY7FH2w/s02wYGT/Cv7ae/lEVGtY3gUR0VlOG6plBPETS4tOIFiS+pS9KIo
         Tenm2M5kmZCHSX2HL07bihR6CKi6KvCLaVAwg3T66IzrmRUndiIkWQhKGPBYz4W9D3aa
         SsboT9Yh+/OfXt654IjlwD8Q7yfkHbNhTOJbMjrQzqSjw4+hlId79mcarG/uDFCm0IzB
         sGsg==
X-Forwarded-Encrypted: i=1; AHgh+Rq4V3EqBBdz6pbOdYFYYRWyQ22OA6OgSh3dc5hXmSyxrVFwydX5vtPc2rLcO45Jc4TOE4JsE5DeIOM8MkRrSLk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZLyaZEiOhWlJ97SE62BTbcI6gDG+Jz9tdm0AjDnADobJYsFfL
	lOSaENO/lnCYiKGUx0kwOjOo/5rkPkR3z/S32H5LuHe54+i5d5e02/My
X-Gm-Gg: AfdE7cl8yah9JG79QYhJ02WBmVsSmW236+0mBHWcGYt3y7EPS9cDJCUq9qU2rza+bg+
	cHhzPq1+/thYESvDkBvciLYOnv8IWXyiDrSzEgXgiEaMp0v1mmGCfsvCgJvwin08aopibdHJyyH
	p69BK5HlydaCMgWyELtmFHVheOFZBWcQ+HkUb472sHtkLI22nUsYQroZ1PJ1MZsBcJlZ7+0rfdS
	8EiIc2Ebo+kWQXK3OyYofIf1ntIuTZU7qYFZb/v6Rg0ODNaIgfkaga6tnYW/9kw4AUisEaivRo8
	Wf85au9U6RV8BxsegaPR8ewa++vPjMoMkwYde545wxPEX7AlucnX2P/Zck39JFAlOFM/1UgayGk
	Hs+lbcCzigfoImJB/7FhUCmDBFajsrSilLNdNqG9NoqgkW765AGiCyQ9Yim5MKFFxEdpaJ2CoJw
	JI54B/Nu2CeEPCPgR08xwf9tmhmj8=
X-Received: by 2002:a17:902:d4cc:b0:2c9:e9db:8167 with SMTP id d9443c01a7336-2cf348193f5mr133308615ad.7.1784516641437;
        Sun, 19 Jul 2026 20:04:01 -0700 (PDT)
Received: from localhost.localdomain ([112.65.87.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344d80e6sm47783065ad.29.2026.07.19.20.03.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Jul 2026 20:04:01 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: damon@lists.linux.dev,
	linux-mm@kvack.org
Cc: sj@kernel.org,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	npache@redhat.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	ryan.roberts@arm.com,
	daichaobing@sangfor.com.cn,
	wangkefeng.wang@huawei.com,
	gutierrez.asier@huawei-partners.com,
	zengheng4@huawei.com,
	kasong@tencent.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	lianux.mm@gmail.com,
	lianux.wang@processmission.com,
	kunwu.chan@linux.dev
Subject: [RFC PATCH v3 3/3] selftests/damon: add functional test for DAMOS_SPLIT
Date: Mon, 20 Jul 2026 11:03:27 +0800
Message-ID: <20260720030327.80153-4-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260720030327.80153-1-lianux.mm@gmail.com>
References: <20260720030327.80153-1-lianux.mm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add damos_split.py, which allocates a MADV_HUGEPAGE-backed region in a
child process and runs a DAMON/DAMOS scheme with action 'split' and
target_order 0 against it, then verifies the huge pages are split into
base pages (the child's AnonHugePages drops).

Extend the _damon_sysfs.py Damos helper with the target_order parameter
so a scheme's split target can be expressed.



Co-developed-by: Kunwu Chan <kunwu.chan@linux.dev>
Signed-off-by: Kunwu Chan <kunwu.chan@linux.dev>
Signed-off-by: Lian Wang (Processmission) <lianux.mm@gmail.com>
---
 tools/testing/selftests/damon/Makefile        |   1 +
 tools/testing/selftests/damon/_damon_sysfs.py |   9 +-
 tools/testing/selftests/damon/damos_split.py  | 125 ++++++++++++++++++
 3 files changed, 134 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/damon/damos_split.py

diff --git a/tools/testing/selftests/damon/Makefile b/tools/testing/selftests/damon/Makefile
index ece244e5c5b9..a623c271355f 100644
--- a/tools/testing/selftests/damon/Makefile
+++ b/tools/testing/selftests/damon/Makefile
@@ -12,6 +12,7 @@ TEST_PROGS += sysfs.sh
 TEST_PROGS += sysfs.py
 TEST_PROGS += sysfs_update_schemes_tried_regions_wss_estimation.py
 TEST_PROGS += damos_quota.py damos_quota_goal.py damos_apply_interval.py
+TEST_PROGS += damos_split.py
 TEST_PROGS += damos_tried_regions.py damon_nr_regions.py
 TEST_PROGS += sysfs_refresh.py
 TEST_PROGS += reclaim.sh lru_sort.sh
diff --git a/tools/testing/selftests/damon/_damon_sysfs.py b/tools/testing/selftests/damon/_damon_sysfs.py
index e6a2265d721e..5a01f31ad9f2 100644
--- a/tools/testing/selftests/damon/_damon_sysfs.py
+++ b/tools/testing/selftests/damon/_damon_sysfs.py
@@ -419,6 +419,7 @@ class Damos:
     filters = None
     apply_interval_us = None
     target_nid = None
+    target_order = None
     dests = None
     idx = None
     context = None
@@ -429,7 +430,7 @@ class Damos:
     def __init__(self, action='stat', access_pattern=DamosAccessPattern(),
                  quota=DamosQuota(), watermarks=DamosWatermarks(),
                  core_filters=[], ops_filters=[], filters=[], target_nid=0,
-                 dests=DamosDests(), apply_interval_us=0):
+                 target_order=0, dests=DamosDests(), apply_interval_us=0):
         self.action = action
         self.access_pattern = access_pattern
         self.access_pattern.scheme = self
@@ -448,6 +449,7 @@ class Damos:
         self.filters.scheme = self
 
         self.target_nid = target_nid
+        self.target_order = target_order
         self.dests = dests
         self.dests.scheme = self
 
@@ -492,6 +494,11 @@ class Damos:
         if err is not None:
             return err
 
+        err = write_file(os.path.join(self.sysfs_dir(), 'target_order'), '%d' %
+                         self.target_order)
+        if err is not None:
+            return err
+
         err = self.dests.stage()
         if err is not None:
             return err
diff --git a/tools/testing/selftests/damon/damos_split.py b/tools/testing/selftests/damon/damos_split.py
new file mode 100644
index 000000000000..089fbe0f0d4d
--- /dev/null
+++ b/tools/testing/selftests/damon/damos_split.py
@@ -0,0 +1,125 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+#
+# Functional test for the DAMOS_SPLIT action.
+#
+# A child process allocates a MADV_HUGEPAGE-backed anonymous region and
+# faults it in so that it is backed by (m)THPs.  The parent then runs a
+# DAMON/DAMOS scheme with action 'split' and target_order 0 against the
+# child and checks that the huge pages are split into base pages, i.e. the
+# child's AnonHugePages (as reported by /proc/<pid>/smaps) drops.
+
+import ctypes
+import os
+import signal
+import sys
+import time
+
+import _damon_sysfs
+
+PMD_SIZE = 2 * 1024 * 1024
+MADV_HUGEPAGE = 14
+PROT_READ_WRITE = 0x1 | 0x2
+MAP_PRIVATE_ANON = 0x2 | 0x20
+REGION_SIZE = 32 * PMD_SIZE
+
+def child_workload():
+    '''Allocate a PMD-aligned, THP-backed region, fault it in, then idle.'''
+    libc = ctypes.CDLL('libc.so.6', use_errno=True)
+    libc.mmap.restype = ctypes.c_void_p
+    libc.mmap.argtypes = [ctypes.c_void_p, ctypes.c_size_t, ctypes.c_int,
+                          ctypes.c_int, ctypes.c_int, ctypes.c_long]
+    libc.madvise.argtypes = [ctypes.c_void_p, ctypes.c_size_t, ctypes.c_int]
+
+    # Over-allocate so that a PMD-aligned window is available.
+    raw = libc.mmap(None, REGION_SIZE + PMD_SIZE, PROT_READ_WRITE,
+                    MAP_PRIVATE_ANON, -1, 0)
+    if raw is None or raw == ctypes.c_void_p(-1).value:
+        os._exit(2)
+    base = (raw + PMD_SIZE - 1) & ~(PMD_SIZE - 1)
+    libc.madvise(ctypes.c_void_p(base), REGION_SIZE, MADV_HUGEPAGE)
+
+    buf = (ctypes.c_char * REGION_SIZE).from_address(base)
+    for off in range(0, REGION_SIZE, 4096):
+        buf[off] = 1
+
+    # Ready; idle until the parent tears us down.
+    signal.pause()
+
+def anon_huge_kb(pid):
+    total = 0
+    try:
+        with open('/proc/%d/smaps' % pid) as f:
+            for line in f:
+                if line.startswith('AnonHugePages:'):
+                    total += int(line.split()[1])
+    except FileNotFoundError:
+        return -1
+    return total
+
+def main():
+    if not os.path.exists('/sys/kernel/mm/transparent_hugepage/enabled'):
+        print('SKIP: transparent hugepage is not available')
+        exit(0)
+
+    pid = os.fork()
+    if pid == 0:
+        child_workload()
+        os._exit(0)
+
+    try:
+        # Give the child time to fault in its huge pages.
+        time.sleep(2)
+        before = anon_huge_kb(pid)
+        if before <= 0:
+            print('SKIP: workload did not get any THP (AnonHugePages=%d)'
+                  % before)
+            os.kill(pid, signal.SIGKILL)
+            exit(0)
+
+        # Split every large folio in the target down to order-0 base pages.
+        kdamonds = _damon_sysfs.Kdamonds([_damon_sysfs.Kdamond(
+            contexts=[_damon_sysfs.DamonCtx(
+                ops='vaddr',
+                targets=[_damon_sysfs.DamonTarget(pid=pid)],
+                schemes=[_damon_sysfs.Damos(
+                    action='split',
+                    target_order=0,
+                    # match every region regardless of access/age/size, so
+                    # the ARM64 stale-TLB blind spot cannot mask the target
+                    access_pattern=_damon_sysfs.DamosAccessPattern(
+                        size=[0, 2**64 - 1],
+                        nr_accesses=[0, 2**64 - 1],
+                        age=[0, 2**64 - 1]),
+                    apply_interval_us=0)])])])
+        err = kdamonds.start()
+        if err is not None:
+            print('kdamonds start failed: %s' % err)
+            os.kill(pid, signal.SIGKILL)
+            exit(1)
+
+        # Let the scheme find and split the regions.
+        after = before
+        for _ in range(50):
+            time.sleep(0.2)
+            after = anon_huge_kb(pid)
+            if after == 0:
+                break
+
+        kdamonds.stop()
+        os.kill(pid, signal.SIGKILL)
+
+        if after >= before:
+            print('FAIL: AnonHugePages did not shrink: before=%d KiB '
+                  'after=%d KiB' % (before, after))
+            exit(1)
+        print('PASS: AnonHugePages %d KiB -> %d KiB after DAMOS_SPLIT'
+              % (before, after))
+    finally:
+        try:
+            os.kill(pid, signal.SIGKILL)
+        except ProcessLookupError:
+            pass
+
+if __name__ == '__main__':
+    main()
