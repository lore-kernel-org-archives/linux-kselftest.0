Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D6F2DCF45
	for <linux-kselftest@vger.kernel.org>; Sun, 24 May 2026 09:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779614376; cv=none; b=GqDtJzDGbdSsOatoIN/Vb4raSYp/ZYE4P9EDg8koQTC4JF1OdaReep49DvfyzmT5+e1YMTctXsdaZxPmSo9i+EAXyMaA36YO40rVw6c7lWnYEJEzxOiTP6XHZt1dMEyE87fZ5NBXZkqGegMiizbkNich7u5+CUP3Ax6vl2M+7Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779614376; c=relaxed/simple;
	bh=ojS7YMq9ny+6I7+wp1Uy03uzolXMYk7P5/Iw5lgboC8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IkXCauuSjWBvvwRh9zEwNzg+jCyk+sSml4U+H/0PfXcf8rVhBdPJA51ls+vTkiEjolNaaSQxQOtpsWwmsQMu61cD+DqOok5dP68FL0FNqjosb1Wp0m5DH4pCLgHsvwiDtd3ng4QXSft9DfT9ZHgVfK7SaYLzigEIBqiaewzdS7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dNGx0ZxG; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNGx0ZxG"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bc6e4556d8so15385985ad.1
        for <linux-kselftest@vger.kernel.org>; Sun, 24 May 2026 02:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779614374; x=1780219174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rzFLSXviPLq0I/Xz70YuBFZ/FEtYhu4eVtx71crsM3c=;
        b=dNGx0ZxG+JPl0JdeAoGuOJmFPG30vKFrKWwNQ6V7OvTQ+0LyxbO2QWUeB+4x65xJla
         TYIVev8cgb5VjoecnMBfHH9O3bvBTlV7Lo3uE6zYs/l7RaJHPlIlJlUG1unu3erfRg5f
         oDmszTIyZC/391wsWGuwys1uBt5SJqP2ojCp2xcVU6i3f9cQ2rcGhjlEwClzepl5HK7+
         jZQwkfDBYGrkNKG66CGiLPnSlFSYyNrJD89il0a2Paz3qRJz11a6QzCzaSs0lBeOzvm2
         j4yBSa0yAma00NYyrWTL37A+wVSAI6Xd9YNNVTZfcXYEus4ce+8Zx7M22zRXIZdz91FI
         mYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779614374; x=1780219174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rzFLSXviPLq0I/Xz70YuBFZ/FEtYhu4eVtx71crsM3c=;
        b=EsXeNeYD5Nkus2CNMWBbTibQ4ygo1ApPZHPPLMKVvEOMNiuaOKyD0lbqmAm080YPWz
         xIpkUEVfTcK6BwyOa+BpJElCXhh3euLYbFZZ/AKWVT+dMzAzCclU70pLGaCUIBsfb0dx
         HyI8Qep+YlmwdEMKY8JhVNhaIucfsTbwYubmUB1d6w6Yoq96fDFK+aPgqWQjLLVKSOq/
         RE81DjEkpyUMQqdS8md2/W3wJNgLE5ZrGSq/WTUAvBiXaAWSwkfouA8OsLtVEsYGfACJ
         7Eie7iwan8w1bzLzFugYRFJT1Szw5ZVXMoWm//XBx9QoQmcznfZGlZ4fCEaH0rMzJLAp
         3N2g==
X-Forwarded-Encrypted: i=1; AFNElJ/FqE3rgQW+i0tuVpe85NYGBUD59SzATna5urx1hYpOoS5kh5nM4+xmpasxXIt4lkWmFxvYnGumsdCVlI+mgtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMHOs1/ac9NCU/FlIlUKI2TbExULR2Chid0d+Dh4MQMk0cEQkb
	c8+cTRWkt8Lmx+2K7fUwd57QGC0+jjevnp0Qtswux4w+BYCg2frce/dV
X-Gm-Gg: Acq92OHOF9BM+FjTRRadahtlEjlRxWZvypiXS65Sa+vxppJk7ljWYj0OtKPTUfMJGKj
	SN13BNGdOSlSyWx1IKWyWJwnyXTPXOtStDPUVzgZOUewRx8aIuKIXHdrj7jaou+y2H/xo6lT58q
	JZb24L5HDQTLoWKQXvcZzDd+nzNa2NHr+4NbNjcfWuc13HZDLRXPjFp8IXYeg/mKeLcWNaTw1hS
	DY9ndTlMlxA6OD1M61wYcLHmZbyafKOujNcO9Dl8DxpjlHAfxaVG9PTsz/gr6HIBaIvyWyJFWwt
	ABoPhT2WK1AGgTSP8Ul/yDRhjnGKruXjtl8jzwcTCfZgF2nzaQnCTSb/5WK919xGtyDg72me+w6
	VYhwmXtx0cbKnpa+6F4Mi+8+OMcAJklAWBdP34MBSO2GMyTcK07G0xav2TB3tipd7V/YdwhoLXN
	slntchTQjWu6AmFZASoDQM4GiICt71iylb8evrxkypEMXLHb54IGxW8aSWjvM=
X-Received: by 2002:a17:902:ea01:b0:2bc:f1da:4c09 with SMTP id d9443c01a7336-2beb037fb81mr59515795ad.2.1779614373960;
        Sun, 24 May 2026 02:19:33 -0700 (PDT)
Received: from localhost.localdomain ([60.243.191.184])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58c69a0sm62023705ad.59.2026.05.24.02.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 02:19:33 -0700 (PDT)
From: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
To: sj@kernel.org
Cc: shuah@kernel.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Subject: [PATCH] selftests/damon: add regression test for damos_walk() vs kdamond exit race
Date: Sun, 24 May 2026 14:48:12 +0530
Message-Id: <20260524091812.35283-1-saileshnandanavanam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a regression test that verifies damos_walk() does not deadlock
when racing with kdamond_fn() exit.

When kdamond_fn() finishes its main loop, it cancels remaining
damos_walk() requests and unsets damon_ctx->kdamond. Without the fix
in commit 33c3f6c2b48c, damos_walk() could be called right after
cancellation but before kdamond pointer unset, causing it to wait
forever for handling that never comes.

The test starts kdamond monitoring a short-lived process, waits for
the process to exit naturally triggering kdamond termination, then
rapidly calls update_schemes_tried_regions to hit the race window.
Without the fix this would hang indefinitely.

Fixes: 33c3f6c2b48c ("mm/damon/core: fix damos_walk() vs kdamond_fn() exit race")
Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
---
 tools/testing/selftests/damon/Makefile        |  1 +
 .../sysfs_damos_walk_kdamond_exit_race.py     | 47 +++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 tools/testing/selftests/damon/sysfs_damos_walk_kdamond_exit_race.py

diff --git a/tools/testing/selftests/damon/Makefile b/tools/testing/selftests/damon/Makefile
index 2180c328a825..60c83d6c318e 100644
--- a/tools/testing/selftests/damon/Makefile
+++ b/tools/testing/selftests/damon/Makefile
@@ -20,6 +20,7 @@ TEST_PROGS += sysfs_update_removed_scheme_dir.sh
 TEST_PROGS += sysfs_update_schemes_tried_regions_hang.py
 TEST_PROGS += sysfs_memcg_path_leak.sh
 TEST_PROGS += sysfs_no_op_commit_break.py
+TEST_PROGS += sysfs_damos_walk_kdamond_exit_race.py
 
 EXTRA_CLEAN = __pycache__
 
diff --git a/tools/testing/selftests/damon/sysfs_damos_walk_kdamond_exit_race.py b/tools/testing/selftests/damon/sysfs_damos_walk_kdamond_exit_race.py
new file mode 100644
index 000000000000..9b9d66a23f51
--- /dev/null
+++ b/tools/testing/selftests/damon/sysfs_damos_walk_kdamond_exit_race.py
@@ -0,0 +1,47 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+#
+# Regression test for damos_walk() vs kdamond_fn() exit race.
+import subprocess
+import time
+import _damon_sysfs
+def main():
+    proc = subprocess.Popen(['sleep', '0.3'])
+    kdamonds = _damon_sysfs.Kdamonds([_damon_sysfs.Kdamond(
+            contexts=[_damon_sysfs.DamonCtx(
+                ops='vaddr',
+                targets=[_damon_sysfs.DamonTarget(pid=proc.pid)],
+                schemes=[_damon_sysfs.Damos(
+                    action='stat',
+                    access_pattern=_damon_sysfs.DamosAccessPattern(
+                        nr_accesses=[0, 200]))]
+                )]
+            )])
+    err = kdamonds.start()
+    if err is not None:
+        print('kdamond start failed: %s' % err)
+        exit(1)
+    proc.wait()
+    completed = False
+    timeout = time.time() + 5
+    while time.time() < timeout:
+        err = kdamonds.kdamonds[0].update_schemes_tried_regions()
+        if err is not None:
+            completed = True
+            break
+        try:
+            with open('/sys/kernel/mm/damon/admin/kdamonds/0/state') as f:
+                state = f.read().strip()
+            if state == 'off':
+                completed = True
+                break
+        except:
+            completed = True
+            break
+    if not completed:
+        print('FAIL: test timed out - possible damos_walk/kdamond exit race deadlock')
+        kdamonds.stop()
+        exit(1)
+    print('PASS: damos_walk() vs kdamond exit race not triggered')
+if __name__ == '__main__':
+    main()
-- 
2.34.1

