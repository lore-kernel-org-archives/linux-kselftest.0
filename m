Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362574;
	b=Whu1HVqXWCayh4UqRwIn/hP10UlhOcW966qMJAQDfViIoHFHr0NKYuKxwR6ayxrA31Mp
	 /92bnlrvj9YnXS94EVdCBsktbpqNX6VeMG0tpuySpEKBFLGCUqH9Gc7s4LnprSDH4kPs0
	 YjWaPqmdneKfrDnDmLWgzL4YQzb3m3169UbTbMJLBzRuT0W205FPlPjpyyyo8Sg7T3VsY
	 A36kC8aYUQJNR1gmyN36mew4ymsSPFj6TofsJ7jCCm69v4Nlb0iGBX2HUtF9VqlmoVKZo
	 qoRERST6ut40SirfJav5UfRPvfJqfqCF5emN9eqchpGnupfQopWBkqDtJkUltEN1s9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362574;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=d88/0oANKlu0REFGFbk9K6Puvz6VVsJ4TyJhhFFvaw8=;
	b=DVK4N+2tKxTsPce95gKwbeXND7KMsiGRTghr3k9NwWMeGlIu154Fdy97M/kVDY58oKA+
	 4wLqNd0u0/9OTK1OrLHzbJlT7RPOS/MORfeW+dHmy+c62kOrESiUyiUFufR1MdZ/2tCTP
	 dW5OfJVGR35Nhzt/RPeI4hXiXqrz4Hvq99603m139TbDU+cE2Ho9YhpXrFEiExdZHrOCW
	 4YS4ropqCPZSxt9GEF0dN8LI8inxVQgwA7gAM/Vq6l2f1fPToqiHIBVp6oNjYmUZbW2re
	 RnloIDvmMLYmnxhA4N3x0atZEagRp6pphk+oVpRGR03WpubfqpN7TdZ9id/tp0hJp5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=US7gZquz;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC47F606A320;
	Sun, 22 Nov 2026 15:49:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC47F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=US7gZquz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=US7gZquzk6TcYlwsaRwatyB5hkhd2PAftqRFYIudGXnHdEErZx6MkSTqElxfQbwr7oh9uRir3USeb
	 Y/h/OwOL1ksc6obcCUohcxCpDtNkNZpT1aaHECn+9Mjd3yVfngDmYxn/neSfBp1lBSPz8sPw5TFtS9
	 Nhn2vS3BB4uLbqW8=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76b030f01e85-34f85;
	Sun, 22 Nov 2026 23:49:24 +0800 (CST)
X-RM-TRANSID:2ee76b030f01e85-34f85
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from home-ubuntu-251 (unknown[180.106.213.53])
	by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee26b030f01b31-73064;
	Sun, 22 Nov 2026 23:49:24 +0800 (CST)
X-RM-TRANSID:2ee26b030f01b31-73064
From: Jingjing Xu <xujingjing@cmss.chinamobile.com>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	kuba@kernel.org,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	willemb@google.com
Subject: [PATCH net-next] selftests: net: match the local port in wait_port_listen
Date: Sun, 22 Nov 2026 15:49:23 +0000
Message-ID: <20261122154923.1272551-1-xujingjing@cmss.chinamobile.com>
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

wait_port_listen() searches anywhere in each /proc/net/{tcp,udp}* row.
For UDP, a connected client whose remote port matches the requested port
therefore makes the helper return even if no local receiver is bound.
Callers waiting for a UDP server can consequently continue too early.

Anchor the pattern to the start of the row and consume the slot and local
address before matching the port. Consume the remote address before the
TCP state, and terminate the LISTEN state match at a word boundary.
Keep accepting locally bound connected UDP sockets.

For example, in an isolated network namespace with loopback up, run this
from tools/testing/selftests/net, with port 12345 unused locally:

  import socket
  from lib.py import wait_port_listen
  s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
  s.connect(("127.0.0.1", 12345))
  wait_port_listen(12345, proto="udp", deadline=0.1)

The original helper returns; the fixed helper times out as expected.
AI-assisted review found this issue. Real IPv4/IPv6 socket tests covered
absent, remote-only, bound and connected UDP ports, and absent, bound,
established and listening TCP sockets: the original failed two of 16
cases, and the fixed helper passed all 16. No hardware tests were run.

No kernel instrumentation or fault injection was used.

Fixes: 31611cea8f0f ("selftests: drv-net: add a TCP ping test case (and useful helpers)")
Signed-off-by: Jingjing Xu <xujingjing@cmss.chinamobile.com>
---
 tools/testing/selftests/net/lib/py/utils.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/lib/py/utils.py b/tools/testing/selftests/net/lib/py/utils.py
index 1727bc418073..d3877f8bc2df 100644
--- a/tools/testing/selftests/net/lib/py/utils.py
+++ b/tools/testing/selftests/net/lib/py/utils.py
@@ -342,9 +342,9 @@ def rand_ports(count, stype=socket.SOCK_STREAM):
 def wait_port_listen(port, proto="tcp", ns=None, host=None, sleep=0.005, deadline=5):
     end = time.monotonic() + deadline
 
-    pattern = f":{port:04X} .* "
+    pattern = rf"^\s*\d+:\s+\S+:{port:04X}\s+\S+\s+"
     if proto == "tcp": # for tcp protocol additionally check the socket state
-        pattern += "0A"
+        pattern += r"0A\b"
     pattern = re.compile(pattern)
 
     while True:
base-commit: 2208ab00f4f213ade91ab775e7f8c4dacdcc856e
-- 
2.53.0



