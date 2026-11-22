Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362540;
	b=n63kH0tzkgQl4QjzfCXQQQXQ3hzKSi/mvLNgu4n25vCHDch4aFVkvJEgq23AzL1631Ba
	 bK6sohhbXiyjoFi+dUxsXYdYtBlTlg/VC75H/bKy46XmpDqk7E7eiV7uArYRa48qbvC49
	 1hbeSEuE8UYAxnj0dpBxIakyX6l+7pno7/uJenXkt3sdlQBCdcymoLqvCX4ELfSMDyW09
	 EXQVSAfWjJsm3OVM4eyBpHyBGG/dSVtM0//LuWEJzS3IBegt//L5nUB1mncwvHzrS3Tix
	 RQnz/sFZrRZRwFVK5LvTu8/FNTswSWwAcnoyHMDzf328gxbZJ75NgDbJBihKpXFGJ/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362540;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=x09BOkoCjwwainokpeegut7oGUBIkIk0fezndKdlsXs=;
	b=3O/I/8BfkNN1LrvYAqOz2W+RWNJURo5WdXU1i0CF/0pGPFr/pG7H35wEhUxWpegRiGQP
	 7Q4O92e6BGtOizoaTN3mE2jCaOd6W+YpH/snD0cg3kE0+LGrLKYp0n5i0Rc/AQpQQTmCh
	 Tyo/jERCm1J9VD4uoDBw5+WRfRuEvTc+bSC5xj5bz9c36tHoh3KvSwDfB0j6T2FQE5ilh
	 SmVcJIIXHdBuwD50l0emwzjb4JPCsuz/u1qP1f9Y9yDBU8R8amiGg2SuzHl5pR8LJtrOk
	 T5tfVzFYWLjKpKOE1uH0KlCdPSXEyYRhA1LB8obN4jMlahG2UqB5r4V+XnDL1QvqNHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=PbbdWMfR;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E23B606A320;
	Sun, 22 Nov 2026 15:48:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E23B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=PbbdWMfR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=PbbdWMfRvOmRtqgqwfe4o8dGqs8mXHBzK2iGqhYYrfGoQI6l+5CFDtDdyJEl0DKgV8Ojse74ZpFBP
	 Or0uH750ahQvYV1s2/2xvqyhcrb2HI3L/mCtLWvNgpUdM8wRRWVHxWMpUgIIfdF/g6pD6OjUi3y4Xr
	 3BkqPZr7MwEeJ9qA=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66b030ee87ac-00ba6;
	Sun, 22 Nov 2026 23:48:56 +0800 (CST)
X-RM-TRANSID:2ee66b030ee87ac-00ba6
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from home-ubuntu-251 (unknown[180.106.213.53])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66b030ee6cca-73242;
	Sun, 22 Nov 2026 23:48:56 +0800 (CST)
X-RM-TRANSID:2ee66b030ee6cca-73242
From: Jingjing Xu <xujingjing@cmss.chinamobile.com>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	kuba@kernel.org,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	shaw.leon@gmail.com
Subject: [PATCH net-next] selftests: net: py: report namespace entry and restoration failures
Date: Sun, 22 Nov 2026 15:48:55 +0000
Message-ID: <20261122154855.1272304-1-xujingjing@cmss.chinamobile.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NetNSEnter ignores setns() failures. A failed entry therefore executes
the with block in the original namespace, and a failed restoration is
also silent. This violates the context's namespace-switching contract.

Enable ctypes errno preservation and check both switches. Close the
saved namespace file after failed entry or a restoration attempt.

Run this as root from tools/testing/selftests/net. The private fixture
uses a child without CAP_SYS_ADMIN. The original prints the error marker;
the fix raises PermissionError before executing the body:

  unshare -mn --propagation private sh -ec '
    mount -t tmpfs tmpfs /run; mkdir /run/netns
    ip netns add review-target
    exec capsh --drop=cap_sys_admin -- -c "python3 -"
  ' <<'PYCODE'
  from lib.py import NetNSEnter
  with NetNSEnter("review-target"):
      print("ERROR: body ran without permission to enter target")
  PYCODE

Found by AI-assisted inspection. This real permission-denial reproducer
and five real-syscall scenarios confirm the fix: successful entry/return,
a body exception, a missing target, entry EPERM and restoration EPERM.
The original meets two of five checks and the fix meets all five.

Failed restoration still leaves the thread in the target namespace;
raising an error does not recover permissions or guarantee that a test
runner will stop subsequent tests. No kernel instrumentation, simulated
syscall returns or fault injection was used. No hardware suite was run.

Fixes: 030329416232 ("selftests: net: Add python context manager for netns entering")
Signed-off-by: Jingjing Xu <xujingjing@cmss.chinamobile.com>
---
 tools/testing/selftests/net/lib/py/netns.py | 22 ++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/net/lib/py/netns.py b/tools/testing/selftests/net/lib/py/netns.py
index 526f6aa80077..472b51c29be2 100644
--- a/tools/testing/selftests/net/lib/py/netns.py
+++ b/tools/testing/selftests/net/lib/py/netns.py
@@ -10,7 +10,7 @@ from pathlib import Path
 
 from .utils import ip
 
-libc = ctypes.cdll.LoadLibrary('libc.so.6')
+libc = ctypes.CDLL('libc.so.6', use_errno=True)
 
 
 class NetNS:
@@ -111,12 +111,24 @@ class NetNSEnter:
     def __init__(self, ns_name):
         self.ns_path = f"/run/netns/{ns_name}"
 
+    @staticmethod
+    def _setns(fd):
+        if libc.setns(fd, 0) == -1:
+            err = ctypes.get_errno()
+            raise OSError(err, os.strerror(err))
+
     def __enter__(self):
         self.saved = open("/proc/thread-self/ns/net")
-        with open(self.ns_path) as ns_file:
-            libc.setns(ns_file.fileno(), 0)
+        try:
+            with open(self.ns_path) as ns_file:
+                self._setns(ns_file.fileno())
+        except BaseException:
+            self.saved.close()
+            raise
         return self
 
     def __exit__(self, exc_type, exc_value, traceback):
-        libc.setns(self.saved.fileno(), 0)
-        self.saved.close()
+        try:
+            self._setns(self.saved.fileno())
+        finally:
+            self.saved.close()
base-commit: 2208ab00f4f213ade91ab775e7f8c4dacdcc856e
-- 
2.53.0



