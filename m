Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F352EDD58
	for <linux-kselftest@vger.kernel.org>; Sun, 24 May 2026 10:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779617010; cv=none; b=Vc5mKohgNnCoiV5xTgk6lwg6GzPPNC8lfwdaiAOhs6DLXzQfm8JdJhbeJeASevFD9b4HxOEoZXIli7IiKg90IaotcKj5zVEki5XiT00RjcVZbv+uhU0bfLIlG1HOw8bpTcYJdA5lZSVVqSLfYzWBfg/gcRukxv2HCnCP11j6O7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779617010; c=relaxed/simple;
	bh=8/v42twDQCmIHyF6EGLKUMLW9TV8CTEejmHUQEe3vXQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Jujg2YlSsPinTAC+jJ+sntngOrb1JT03MfbW9s6UT8NSFFZzKiY8Kq2U6m78t2h27CwOnJrGltsHAVPVdQszthh9ugjTnm5v4rPJZbFB2hSiNPHMnZbV3DxmC+8hfur/TdexCqMjgHuC+Eu9Ljp+o4Fh7HFvWYfP/0vNBq1CxZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jK62OnPy; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jK62OnPy"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2be3781e543so12179135ad.0
        for <linux-kselftest@vger.kernel.org>; Sun, 24 May 2026 03:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779617008; x=1780221808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EXBfuqbAyMEZ9CUfrSMvnKn8IB4mQp9S1TVPfOw1Hnw=;
        b=jK62OnPy92kz9ssMEjM9rrgynvTLg5TwopQdMR7cN5ILxtuXAKnLmfpwZnVlt2Iigv
         PVxC/SVbNOGQEKgkVsoQt40ms+a1IRKvVj6G0jbLz7TEjvPy6c6+0NwhmyI3s2sjEc33
         p6i5MI8tJlkxihIUgxZcE4JpBGJTugXKOJz2AVfM3n+aZszRdPvvMHvGekP6/FxOK1D5
         DPqu8KHOwIfpiUrG6GiyiGkP9saInfoyX83iUfQLfAtEKIkocfe8oh8tVj12eh4obg4m
         dvmSRRQKfhSEUfwH99HP4I0VCCqC+iDTu+Se6JXf1FWWSEIC31wP9sKVnsLbngmea6o9
         zR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779617008; x=1780221808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXBfuqbAyMEZ9CUfrSMvnKn8IB4mQp9S1TVPfOw1Hnw=;
        b=mDeRa4ZFelBrfG0FIXPm4kZnMCDKRbEue5Ve1c4iKpwO6tXfpdtx6U5HOmJpVAlpTV
         Cmq+SfQHBRFGCyOUUVcDuwzBi/jWpVXus2W6TgLHfddxidn12K1Dgd6b+51ofRTG+Qs9
         NFXOaQEXUQ6CglmHo1zNYGqbWtAPLarwLcPdMHv/M2Qj966L1ep4/HIcMqZixwww/xjB
         SBfN0LN6OOrvrw5pXAz7fLUo2uvc62VtTnDUyzI2VcWFoICqsgzczgxYGkZ0yr7d5JtM
         rTsm2htZYkAEzAkZF5ItFKt28adzsFxnpDly1AIrpiEb5miRAI4QIyj/pPic4wleZ/CE
         Tx5g==
X-Forwarded-Encrypted: i=1; AFNElJ/F1qI0SGT/A1Soyebo/mIKvXILYcqymOMgz0hvLZRVYgBbwobPUl1gyMiFgd32sKtSecuxHKt0UWGtoDJgHww=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDS+ivjzsrPPBNTniqca9KxS1LTk3Zuzkjd4LXladbuDunf51O
	w1pFwZJDCqDEmFJzmjRU+BqastWtdSDSE8Nr5wM4LMPMD73HzpO57aId
X-Gm-Gg: Acq92OE3Je3kJ+faaeeKe4y2SOr462zXsfP8QqLgGTbLC4wf0jXVVqLGpI60xOuT5Qr
	xYHRm+IfDa7XuSGZ9nxgUHayhy/DYIsNLZI+URxw6cOTFaVWnPUZrB4Q+0MYnoj2hg+KCxRXRP4
	4Es51FbYrqI8tzqZSKUEhVOqJdoBOZJ4nvNLKVj7Arz6PPA9dLX+bvOCOXWxVaSuNwJURbvSSAV
	8VrdU5BkRs+O5PrJL+EGSdkaXPNe66kZ9SuWmba1Am/tz9i68UD44UVB9+6Dv3RgIxxAmrWusm3
	HszXRRTjW5kl8WCqaQ0XJY34YL9x0MyFjk6nzrfs5g3idgtFKUCPc3849Or9XB4HgNrJmMGss2l
	C46LjPNPpyDFk0eswcGV11BjjX4xDF2kudnUXayeNxramcfCMDyfYW2hqeX+JLQKQxtaEdlKIsO
	ewwFyS748vV4xDXOmydUvQCfYV8o798zKCTUqrYbP0WYjZ1wR7u+TB63y8bxA=
X-Received: by 2002:a05:6a21:4a8c:b0:39b:b6d2:1f24 with SMTP id adf61e73a8af0-3b3285caaf4mr5506279637.0.1779617008111;
        Sun, 24 May 2026 03:03:28 -0700 (PDT)
Received: from localhost.localdomain ([60.243.191.184])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165009761sm7630123b3a.60.2026.05.24.03.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 03:03:27 -0700 (PDT)
From: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
To: sj@kernel.org
Cc: shuah@kernel.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Subject: [PATCH v2] selftests/damon: add regression test for damos_walk() vs kdamond exit race
Date: Sun, 24 May 2026 15:32:58 +0530
Message-Id: <20260524100258.36819-1-saileshnandanavanam@gmail.com>
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
rapidly calls update_schemes_tried_regions in a separate thread to
hit the race window. Using a thread with join timeout ensures the
test can detect kernel-level deadlocks where the system call blocks
in uninterruptible state.

The sysfs state path is resolved dynamically via the kdamonds object
instead of being hardcoded, and exceptions are handled specifically
as OSError rather than using a bare except block.

Fixes: 33c3f6c2b48c ("mm/damon/core: fix damos_walk() vs kdamond_fn() exit race")
Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
---
 tools/testing/selftests/damon/Makefile        |  1 +
 .../sysfs_damos_walk_kdamond_exit_race.py     | 82 +++++++++++++++++++
 2 files changed, 83 insertions(+)
 create mode 100755 tools/testing/selftests/damon/sysfs_damos_walk_kdamond_exit_race.py

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
new file mode 100755
index 000000000000..8e8006d63926
--- /dev/null
+++ b/tools/testing/selftests/damon/sysfs_damos_walk_kdamond_exit_race.py
@@ -0,0 +1,82 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+#
+# Regression test for damos_walk() vs kdamond_fn() exit race.
+#
+# When kdamond_fn() finishes its main loop, it cancels remaining damos_walk()
+# requests and unsets damon_ctx->kdamond. If damos_walk() is called right
+# after cancellation but before kdamond pointer unset, it could wait forever
+# for handling that never comes, causing a deadlock.
+#
+# This test verifies the fix by rapidly calling update_schemes_tried_regions
+# while kdamond is naturally terminating (monitored process exits).
+# Without the fix (commit 33c3f6c2b48c), this would hang indefinitely.
+
+import os
+import subprocess
+import threading
+import time
+import _damon_sysfs
+
+def call_update(kdamond, result):
+    err = kdamond.update_schemes_tried_regions()
+    result['err'] = err
+    result['done'] = True
+
+def main():
+    proc = subprocess.Popen(['sleep', '0.3'])
+
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
+
+    err = kdamonds.start()
+    if err is not None:
+        print('kdamond start failed: %s' % err)
+        exit(1)
+
+    # Wait for monitored process to die naturally
+    proc.wait()
+
+    # Rapidly call damos_walk() while kdamond is exiting
+    # Use a thread with real timeout to detect kernel-level deadlock
+    deadline = time.time() + 5
+    while time.time() < deadline:
+        result = {'done': False, 'err': None}
+        t = threading.Thread(target=call_update,
+                             args=(kdamonds.kdamonds[0], result))
+        t.daemon = True
+        t.start()
+        t.join(timeout=5)
+
+        if not result['done']:
+            print('FAIL: update_schemes_tried_regions hung - '
+                  'possible damos_walk/kdamond exit race deadlock')
+            exit(1)
+
+        if result['err'] is not None:
+            # kdamond stopped cleanly - expected
+            break
+
+        # Check kdamond state via sysfs using dynamic path
+        state_path = os.path.join(
+                kdamonds.kdamonds[0].sysfs_dir(), 'state')
+        try:
+            with open(state_path) as f:
+                if f.read().strip() == 'off':
+                    break
+        except OSError as e:
+            print('failed to read kdamond state: %s' % e)
+            exit(1)
+
+    print('PASS: damos_walk() vs kdamond exit race not triggered')
+
+if __name__ == '__main__':
+    main()
-- 
2.34.1

