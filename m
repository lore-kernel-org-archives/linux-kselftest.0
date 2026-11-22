Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362529;
	b=En00QGSlCmgTv9Px4m82yXI5IlCCWygLdwYVxM2cnheXRZuHsBWv7lSR8UG0sv9DnN2j
	 ZW26mzHLzAxfyZgnAIJtMiF4H6ZArWjI1DQr2/5oT9npkR/IMaOhOUXTOP/V9imoYNHWI
	 F6fqH7s5f+DsogVIdfMdtrqzdqVO+V1OVmgu4/hz1VOX65x5bgZiE4JilSbzP4XEl+OXH
	 mc+in4WY2HYRAV3PWwuYULZ641il3RuVwxzDUwOVq3T/hQHoqDVN6bu5uubYzrwkrnFBU
	 m38fA5Zzw+vMEI0rqvrUJQzv5xd89tTU72Rv7HEvfkW/OEGYgn5k7N/gHQE/RoF+j+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362529;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=esH12vzr2t3nTD+acOaBkj79Ql9gTvcuxE2yoWswOSI=;
	b=qWf9gR/VBBEHLUCoZKkpJIfEjYAQiajfTjixTDFVCfV0BsT8HyI/QFeH8lv41hWIYQMj
	 pyA4S+4tD73+aMMQEKx0+JIKh6CJYAYgkIHMpqQbQyKuYNHXazm1o09VoQjYidDv49g7j
	 5HdgRwJU+WcXCaCLIRAbz4SPwINoRPfPf5ktT6AnNVEDWpX9ql2H6o1i4UfnE19xTJPeo
	 ZPLySWuekpYhRxZrzvQPUJUc8htdTdBhHAOzRGT8w9LJEZ55DpyxM7EKlm/ERDOoSznGj
	 6EDtT1NDmG0dQ3+SEmMlkuZJN+FNHjVA+Uale85BZMpO9i+aC5WVXdVJbYMhWPFFd/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=j4mivLUg;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0300606A333;
	Sun, 22 Nov 2026 15:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0300606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=j4mivLUg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=j4mivLUgRulDXixCxmSaw/I5P6UzilBrb1gt9Jtp7Go/RmyrBaVrvxLePTy5D+bl6WyXdITend46s
	 vfgkwceGqVpv7ZR2fh+riTAqs1povUVJH56SNkJHUxPldC8gbFWBMpPC2kn7eHXBBZ49cG9qr914cv
	 zX8syYdQ8RXY3jbI=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46b030edda13-d4093;
	Sun, 22 Nov 2026 23:48:45 +0800 (CST)
X-RM-TRANSID:2ee46b030edda13-d4093
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from home-ubuntu-251 (unknown[180.106.213.53])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6b030edcf26-72726;
	Sun, 22 Nov 2026 23:48:45 +0800 (CST)
X-RM-TRANSID:2eea6b030edcf26-72726
From: Jingjing Xu <xujingjing@cmss.chinamobile.com>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	kuba@kernel.org,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	willemb@google.com
Subject: [PATCH net-next] selftests: net: py: preserve existing namespaces on creation failure
Date: Sun, 22 Nov 2026 15:48:44 +0000
Message-ID: <20261122154845.1272203-1-xujingjing@cmss.chinamobile.com>
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

NetNS records its name before running ip netns add. If creation fails
because that name already exists, destruction of the partially built
object deletes the pre-existing handle that it never acquired.

Initialize the owned name to None and record it only after creation
succeeds. Successful creation and context cleanup keep their behavior.

Run this as root from tools/testing/selftests/net. Its mount and network
namespaces are private; it prints False before the fix and True after:

  unshare -mn --propagation private sh -ec '
    mount -t tmpfs tmpfs /run; mkdir /run/netns
    exec python3 -
  ' <<'PYCODE'
  import gc, os
  from lib.py import CmdExitFailure, NetNS, ip
  ip("netns add review-existing")
  try: NetNS("review-existing")
  except CmdExitFailure: pass
  gc.collect()
  print(os.path.exists("/run/netns/review-existing"))
  PYCODE

Found by AI-assisted inspection and reproduced with real ip netns calls.
Eight ownership/lifecycle checks go from six to eight passing, including
preservation of the original inode and marker interface. Explicit,
automatic and empty-name creation, body exceptions and repeated cleanup
were checked. Current in-tree callers normally use generated names;
this is not a claim of frequent collisions. Removing a named handle does
not necessarily destroy all namespace references. No kernel modification
or fault injection was used, and no hardware suite was run.

Fixes: 1880f272d2f9 ("selftests: drv-net: construct environment for running tests which require an endpoint")
Signed-off-by: Jingjing Xu <xujingjing@cmss.chinamobile.com>
---
 tools/testing/selftests/net/lib/py/netns.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/net/lib/py/netns.py b/tools/testing/selftests/net/lib/py/netns.py
index 526f6aa80077..981be5f842ff 100644
--- a/tools/testing/selftests/net/lib/py/netns.py
+++ b/tools/testing/selftests/net/lib/py/netns.py
@@ -15,11 +15,11 @@ libc = ctypes.cdll.LoadLibrary('libc.so.6')
 
 class NetNS:
     def __init__(self, name=None):
-        if name:
-            self.name = name
-        else:
-            self.name = ''.join(random.choice(string.ascii_lowercase) for _ in range(8))
-        ip('netns add ' + self.name)
+        self.name = None
+        if not name:
+            name = ''.join(random.choice(string.ascii_lowercase) for _ in range(8))
+        ip('netns add ' + name)
+        self.name = name
 
     def __del__(self):
         if self.name:
base-commit: 2208ab00f4f213ade91ab775e7f8c4dacdcc856e
-- 
2.53.0



