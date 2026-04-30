Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52A34266BE
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 13:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777555710; cv=none; b=uE9qgqkViMdRbgNJlqALx7XPtAAVvllfiOdvHQvcZglwpDNloK8m8Nk8vL/CtDxGb/9iZlcd7ezQNbXKw698rp/IJfLMNpECxkc2Wt5Oy8Zh0dqISzD0sSGhsa+Ax9kOUniLp4JaghWy6uTFgpTjq8YgvtwM3GFx7GbsasUS7Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777555710; c=relaxed/simple;
	bh=gB7P3eJLm7f6gdrmg5tjypKWSxIGKIEJjikDtq+N/PI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bq/5Gg8Jr/fzu7YbX8vOak7xYTeRNaBBU1hji7DV2pIXO1ywGHRlQBvftZ0KQsAm30SjnnHSyQoTeOqeTMngWDOFqfL6mxWr+e6FZbZ426NrPalerab/KaspQKpBRMh+6bskT3f1mUVVpXEHX9HwUcFOemOOkXhjooYL2kCPZ3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UVEZ26iL; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UVEZ26iL"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-79885f4a8ffso9807627b3.3
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 06:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777555708; x=1778160508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/f7yMoR7muS6QO32XzrM5AFad/LSJYKKcs2Y+rabA8=;
        b=UVEZ26iLtjQEPQJ4/4cQ6g1KShD3BKIUrbaPQdI52cIHQJljV+wfddJS2saXneEMtD
         mdbBbXBt5po24KMjChpV5x2UnJjmRGBSrFhxy+8ZG++eJhQKWtiGdZ5hrmtXU8F9YQ6c
         kyyV8TBaTY8FECimCBKQEaIUu6C74Ljq3WiLF7ywEJL7ObCWVE0mokYjJ7HsdS4wGBou
         QLUA3xvCpuINcdIFs+IkrbyFV7DsF4KVRnrz02aInFPKI8EAwtf61Qt8RV+P3He5LJc3
         Oi9DvltCOldQAb2VFCLg9zqOaQg3OofmGzonDXpZeKiteVWTwnPd+csis/SnHEp2sKJr
         oDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777555708; x=1778160508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8/f7yMoR7muS6QO32XzrM5AFad/LSJYKKcs2Y+rabA8=;
        b=a9ndl87iBFIQFCRISURmb3EwJqIVpPdGY6xi9S02+TyR2oGqNZtSQP10gCszUFKhBI
         1EIVo6313PxfT6+mt1NB1MAuw8uU396Kp9/KFzbnvmFk4ko2FgjEYNI49+olIeFghig+
         NqAHoWnIZsXsVlEj85VIl3Y4WaLYKBkJ+oKPGA9u/Tieo0KVZ2B04QuKS8WHZVLSC1up
         Ef7EKfvnyZqlFnBOF+SlUPQ9Ej01O+O9OoMcZgcYsaKC8rtUDXZ7YTGMiWx/hXW/D1eP
         3c3/GjfB4Porf/VmXu4AEpINYAR2F1EaKmzjXaDLo59x1ujbxiYSIRqWB+PsQqHaHx9Z
         pb3A==
X-Forwarded-Encrypted: i=1; AFNElJ+tlO2NA/WpAneEq/POMJe9sV/IUz7Hncpl40qVl5f95CzYvZKz2/g2HfokKuViTh28qbB2YRYlCyhCI0oQOvI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwRK4A3YUhDot/0Z6dJuwXHvLfhmgk73hTAsCGE8uPGit44lcs
	w0kVppBxzG7nDGq0Qy+hLLdbWu+eSWlAs9WPfc20hDWEIhYJbFoj6SYLBU/42A==
X-Gm-Gg: AeBDiev+TA6vPe10q0NhVlHstCorBIzfQ9x7Hbnm3gHcnretooOprQB/U1mEhfwspAD
	3UnwKGzGpyS3Y08TZD4pWvfLt1WcXRp1ceS8Ahrb26AdKVaXLPCMtayCqwLJFZqDD04fwEsFD7u
	1KqBy4+Pn3eq31NtqPxA37Gcdl/BkicsmeLcTTC9szENdtSZyjI6mEIpCinPAh+Snb/lHEfWWEA
	wwpj7B5ahTv/aoR4G7VtzFpf7Imyz5du6GOzNnbJTcsQ8ADqSsC0+T6L8de4cBxfTJwN1Ip28ly
	puGCFNWjZktY4ytB4G7VKZjWm0BnYUnAhR2vx52co7muLOs8EQpYcLhgCFcuSino4MsmVVybRt1
	iMG/54PDn3BxQoxPRL/Iq9YhDA+y8caU0CNSbCvKi2/oHn3TWHnIWfwbeox2l6G+PJu3O4HWSEH
	renmLaqggVpO3Q9KeRBCTCGZbB6gEbl57tpAxivAnP5mn9M+mVW7EPWt3iWhX77Kkc4B2maqtFr
	xFEcEKgG9dFTbs7LGQau50/m3n7xlVZJIEgOA==
X-Received: by 2002:a05:690c:7:b0:7b7:29e4:7dd2 with SMTP id 00721157ae682-7bd548fe510mr23600947b3.40.1777555707597;
        Thu, 30 Apr 2026 06:28:27 -0700 (PDT)
Received: from willemb.c.googlers.com.com (172.235.85.34.bc.googleusercontent.com. [34.85.235.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd54b332fcsm8592957b3.16.2026.04.30.06.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 06:28:26 -0700 (PDT)
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
Subject: [PATCH net-next v6 2/3] selftests: net: py: add tc utility
Date: Thu, 30 Apr 2026 09:28:05 -0400
Message-ID: <20260430132820.1944517-3-willemdebruijn.kernel@gmail.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260430132820.1944517-1-willemdebruijn.kernel@gmail.com>
References: <20260430132820.1944517-1-willemdebruijn.kernel@gmail.com>
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

