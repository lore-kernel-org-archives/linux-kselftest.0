Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF5E2C027C
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 20:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777321012; cv=none; b=n+k4U1Pz4jVO2bw8kIIj5BR3G+7Hnlw3eiH5Ng3Y4w0GgwmQyzfyqV0L+7C/owq/3c2Ai/0nEEjS+3arY/o/D7PGFZcZ4BFvig/aKo7FkMUml7Z1RB+fpGKrPQTjyJr1a2RljvkU5eprXb8DSauMwWQv1cpZGuJfE5eD0OdN9Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777321012; c=relaxed/simple;
	bh=gB7P3eJLm7f6gdrmg5tjypKWSxIGKIEJjikDtq+N/PI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TrySYZNEX0HlUOuiIRAAuNCIcrYLw0a2cXEQQzkwBf4SjmoWro0CphTyoN6NsIAGKM1mGec1LvVb8cqUALE3wVdO4Uy6F8UgBCVEhCpSZEVxf1zGNU0Ed/Jhbyuv1HJgjS8Q5MnbXfEj1g7kYIfhpkiJyN/l9WFpeCdL0+v0YUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TfVqdmH0; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TfVqdmH0"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-79db5e18ac6so123259777b3.1
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 13:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777321010; x=1777925810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/f7yMoR7muS6QO32XzrM5AFad/LSJYKKcs2Y+rabA8=;
        b=TfVqdmH0RuyTaPLxCv48IA3fJNjPKZaLAS7PYfZltiLaIXx6ZacNtbhBFy1wifISiC
         mihpMRoizGn4iSgeEoI8f/kADnt2bZHobP+Fr6f47eRHPIiCVJmBjvg4VpXy6F8gABEH
         rxxYiU43bNqCjuuLhQBYlz14YfdfUkq0I6EItrC1zqpoZNBmoIUOJu9b/eOzQeuCC8v1
         /TLtOvziTTbdYyVE9eRZx1Kv370ESZD5rD95nQZVwIpJkaFHQZl447QJDZ31DMME8X/4
         kSRLmFwgKpyTFE+I3rKcFzxlZVaXyYa/CvaEw+zGOG6skMxnEwSUJ9LTryoAdn9JHHU6
         stMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777321010; x=1777925810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8/f7yMoR7muS6QO32XzrM5AFad/LSJYKKcs2Y+rabA8=;
        b=MUUL73q7pr8+5BTFYVkSX8rHg89D8Rck6AD/T00XWpjj0qjnowR+W2r71vQ/v8R/RV
         /UGNkVAytGdHup2N01apLnJvo+tWlxqmRGJyfDmeIJPEtr9yjQ8sFeaaRttZmkZWtOxy
         suaGBtndm3oSdShWezTuwanSQx5YsDp0qfkzoRpQXf9yl5J31o/x0s6bTouMH4iwKvTF
         WZ9HNkF8BiGXMhvA7l1WcF+4eJUxFTF9orDT3suaNRqQVIqOO7PRuQd7xHTYyFhm5JgF
         orb6CS0yTGXVoy5cPduKipD3IruPd/hW9Ou+N9bctB6YjQh9jZkn136NJ+F2W4yMvg6+
         IwxQ==
X-Forwarded-Encrypted: i=1; AFNElJ+BtSLWVTjkDpeBVhfMAPOueEz2ldnIB1migg3S5H0NjbZEn+08ukz2INAsl/ly/vyG6ZGPqv7NxPXz/QQO/qs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8OWLw86hdyJd5oiK2/Y/essojveJVeYnq0OMqY+EjX9azdv5s
	5cOAmZoDLu9v3tiuhGO0g7eiE8BhF1YB8vA3pPoDW6A+AfldiyxdTFdopBXmj7d9
X-Gm-Gg: AeBDiet3vH8FYNLw5N8j8VXqLyCs8WGMjJx1XkcAc8wbnTjEgIJGVufcIfMjc1yW7cL
	4zJNAb9fiYNFrvfD2hX8r14H6RnwzOOlJ9tvnIHvzmXR38PEfJNbAKwSmk1tiNiE6heKvsI0TEb
	+HbDiVPvGynoyFX3diiyjFBFHcLJ50A66Yfo+dJCaeIjQ96+eIgrHwS9kN7oRquZLSEh0rWAcLh
	l9D+tKsLzg73ytyZLOMNfOtR5RqEtAek6MuAguNMgOlDWDTbKcDXPjc47NNOMbhoD91uhf7MJ53
	XzeW9EThOWRsAukPCBAAR/4xpMf88JMeYg0d7D5s0/8P1ooYUgcNLVnL9DkmH25h/7a78i76T0c
	cimfprBISEOlVnNoRRHzBg07wcG6cxqduvTYRhMVvLDSCQiozUmjfLpTK8KYwQOuA/8U3UV8GR4
	keU+X/pVZ4xdqgHezj+BtJpoLBGP9mgQ2Za/2lZ4AGuR8hp5rVVWaBfJl5ctdj6Wgo7TGAjAUxJ
	FJXs2I1xrLZaSvrBXALEmB6+61uZ0SpV9gqqQ==
X-Received: by 2002:a05:690c:398:b0:7ba:f2f1:86ef with SMTP id 00721157ae682-7bcf36ec6ddmr1974497b3.35.1777321009793;
        Mon, 27 Apr 2026 13:16:49 -0700 (PDT)
Received: from willemb.c.googlers.com.com (172.235.85.34.bc.googleusercontent.com. [34.85.235.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e6149sm1753387b3.11.2026.04.27.13.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 13:16:49 -0700 (PDT)
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	kuba@kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH net-next v5 2/3] selftests: net: py: add tc utility
Date: Mon, 27 Apr 2026 16:14:34 -0400
Message-ID: <20260427201640.294694-3-willemdebruijn.kernel@gmail.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260427201640.294694-1-willemdebruijn.kernel@gmail.com>
References: <20260427201640.294694-1-willemdebruijn.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Willem de Bruijn <willemb@google.com>

Add a wrapper similar to existing ip, ethtool, ... commands.

Tc takes a slightly different syntax. Account for that.

The first user is the next patch in this series, converting so_txtime
to drv-net. Pacing offload is supported by selected qdiscs only.

Signed-off-by: Willem de Bruijn <willemb@google.com>
---
 .../testing/selftests/drivers/net/lib/py/__init__.py |  5 +++--
 tools/testing/selftests/net/lib/py/__init__.py       |  4 ++--
 tools/testing/selftests/net/lib/py/utils.py          | 12 +++++++++++-
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/lib/py/__init__.py b/tools/testing/selftests/drivers/net/lib/py/__init__.py
index 2b5ec0505672..09aac4ce67bc 100644
--- a/tools/testing/selftests/drivers/net/lib/py/__init__.py
+++ b/tools/testing/selftests/drivers/net/lib/py/__init__.py
@@ -23,7 +23,8 @@ try:
         NlError, RtnlFamily, DevlinkFamily, PSPFamily, Netlink
     from net.lib.py import CmdExitFailure
     from net.lib.py import bkg, cmd, bpftool, bpftrace, defer, ethtool, \
-        fd_read_timeout, ip, rand_port, rand_ports, wait_port_listen, wait_file
+        fd_read_timeout, ip, rand_port, rand_ports, tc, wait_port_listen, \
+        wait_file
     from net.lib.py import bpf_map_set, bpf_map_dump, bpf_prog_map_ids
     from net.lib.py import KsftSkipEx, KsftFailEx, KsftXfailEx
     from net.lib.py import ksft_disruptive, ksft_exit, ksft_pr, ksft_run, \
@@ -36,7 +37,7 @@ try:
                "NlError", "RtnlFamily", "DevlinkFamily", "PSPFamily", "Netlink",
                "CmdExitFailure",
                "bkg", "cmd", "bpftool", "bpftrace", "defer", "ethtool",
-               "fd_read_timeout", "ip", "rand_port", "rand_ports",
+               "fd_read_timeout", "ip", "rand_port", "rand_ports", "tc",
                "wait_port_listen", "wait_file",
                "bpf_map_set", "bpf_map_dump", "bpf_prog_map_ids",
                "KsftSkipEx", "KsftFailEx", "KsftXfailEx",
diff --git a/tools/testing/selftests/net/lib/py/__init__.py b/tools/testing/selftests/net/lib/py/__init__.py
index 7c81d86a7e97..64a8c1ed4950 100644
--- a/tools/testing/selftests/net/lib/py/__init__.py
+++ b/tools/testing/selftests/net/lib/py/__init__.py
@@ -14,7 +14,7 @@ from .netns import NetNS, NetNSEnter
 from .nsim import NetdevSim, NetdevSimDev
 from .utils import CmdExitFailure, fd_read_timeout, cmd, bkg, defer, \
     bpftool, ip, ethtool, bpftrace, rand_port, rand_ports, wait_port_listen, \
-    wait_file, tool
+    wait_file, tool, tc
 from .bpf import bpf_map_set, bpf_map_dump, bpf_prog_map_ids
 from .ynl import NlError, NlctrlFamily, YnlFamily, \
     EthtoolFamily, NetdevFamily, RtnlFamily, RtnlAddrFamily
@@ -29,7 +29,7 @@ __all__ = ["KSRC",
            "NetNS", "NetNSEnter",
            "CmdExitFailure", "fd_read_timeout", "cmd", "bkg", "defer",
            "bpftool", "ip", "ethtool", "bpftrace", "rand_port", "rand_ports",
-           "wait_port_listen", "wait_file", "tool",
+           "wait_port_listen", "wait_file", "tool", "tc",
            "bpf_map_set", "bpf_map_dump", "bpf_prog_map_ids",
            "NetdevSim", "NetdevSimDev",
            "NetshaperFamily", "DevlinkFamily", "PSPFamily", "NlError",
diff --git a/tools/testing/selftests/net/lib/py/utils.py b/tools/testing/selftests/net/lib/py/utils.py
index ef31c0ba47fc..165adf33e1b5 100644
--- a/tools/testing/selftests/net/lib/py/utils.py
+++ b/tools/testing/selftests/net/lib/py/utils.py
@@ -224,7 +224,10 @@ class defer:
 def tool(name, args, json=None, ns=None, host=None):
     cmd_str = name + ' '
     if json:
-        cmd_str += '--json '
+        if name == 'tc':
+            cmd_str += '-json '
+        else:
+            cmd_str += '--json '
     cmd_str += args
     cmd_obj = cmd(cmd_str, ns=ns, host=host)
     if json:
@@ -242,6 +245,13 @@ def ip(args, json=None, ns=None, host=None):
     return tool('ip', args, json=json, host=host)
 
 
+def tc(args, json=None, ns=None, host=None):
+    """ Helper to call tc with standard set of optional args. """
+    if ns:
+        args = f'-netns {ns} ' + args
+    return tool('tc', args, json=json, host=host)
+
+
 def ethtool(args, json=None, ns=None, host=None):
     return tool('ethtool', args, json=json, ns=ns, host=host)
 
-- 
2.54.0.545.g6539524ca2-goog

