Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854443E4C7A
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 17:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777916469; cv=none; b=ZsEmnfpqnFcKf9UbKcCin2R31uVJ6gzrAUReGYHhnFsyKJB2gdt/z5eUw8SvgopWHD4VwX/eAepcScMs7KgKqdzJKriswHiyG3NPRr+Jg8ikYHII+jSMTch3Nf4REvV3Z1yqBCLaxSJgpRZdxotiSYGetbVy1gASKhhX0m3zV8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777916469; c=relaxed/simple;
	bh=ufkONH4lXdgrenYZU9xGx8aA3dUY2Vs/P/4JdsvRg+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fc0LfMrITdBaWul/f88qlX5AbPpU/6LoiKqvxgEAQSJpyipuoajrAVt1tahfQsuU6kOhlfniOyCPTQynx7QmWvhXvnTywWVGZyCLSpzvt/tna/tM5I4pBt2uSCXMmFrzUP/NX9F2C+9fdvNev6Kxdw+4gMaYHmQ0RRIXb5uuH5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oY5yEO2Y; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oY5yEO2Y"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7bd5e373d07so35760357b3.2
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 10:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777916466; x=1778521266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZVl8pNWWJ1FZhRJZlr6BIN+M7SkdqpWm1WnyYftGcVM=;
        b=oY5yEO2Y1r8qJyJLft9tVECCiJ80oT56tXpDR9Vo2R9JHQT9vwrKeXwUWr56Rn1Ts1
         eLNqvAgQ4BKegWdOQhToOCpEs9VTZ7He75XUlPjIvb6T8/AA+COF1zjBOtbAGlXq3nx/
         OHD+En8gedA4Dnil8uiFK5htXOWOr6jI34UzLpvDU9I4C6FF1TGSG+AB12K59pEVLT1L
         10hPWjjk6uW9MRdfmAsdivmDlQHEf2O/gOaNIuPU80r8xQvCHzXxvCrXthIwE+jwaAke
         UegToVbmXD31VTE/vebP71+K2frD6DOZ1EkkowROcprOTgA3RthCNmzXlYW/CVIR1fwP
         CBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777916466; x=1778521266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZVl8pNWWJ1FZhRJZlr6BIN+M7SkdqpWm1WnyYftGcVM=;
        b=k9VWMVhwSqlyEbjGkUaa82hOrHWH+7eE6TiX4XAlAutbvlxeNfXm8INM3x+DVD5cXz
         klccwXG05sGmEa5shXzvwiXN/xtqD2m47dAbak6tp2SghLWwr8p8Ia6e3jqq3WmpP5yU
         dk6VZqZ0ZnkzIUT5Xzi5nO0YN1cQULltvChQiMyUKyL8W3fUw92TKKKPnXSXDCe5A4Lv
         FJnWyrVgBXXg92JMoQn+3ixyznUS2q8LzBm5yBT1EFZuMrmaxuTyzFyF5ltnRkYjmjbu
         kkgEq5YPed6rbUdZD38SWGw2GSQEm5fs0lwtLSRuBO9+CvlK15n01qtDXqkS6EZ+4sZC
         8fBw==
X-Forwarded-Encrypted: i=1; AFNElJ89M+ewQ2GV1qTtOy2RaPtEsZCqGBYpXfI+GuGk7Ni9ETFVAtTF4mUbp9RXXf7AO7ecrVItRdUzA0ZbSH5VGvk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxakMKz98rNv+FLHjBYxGR0oNBekmgADI5pfSqQelzIa11t3Ym6
	jy2eSWriReUsK1a45e/DgmfSmFZhT1p65KvzBAk/IX5BvD/wrf7Xpq9v
X-Gm-Gg: AeBDieuUwg0YQPtb7uJpOu3+iNUUIe7smuQYBrsFpuHp7lgf3Mz45kLLPFjYfARQV2T
	U2wH48HAGr7edNBkMluwKs0OV7qOWqHiSXbbRAs5Q2OoSJ/pCxEW/G1GQu9YwBKcnIwWtbg+bqj
	pT1PstG9/g7unubOH3bKKM176YJMQfDhCVYgWSDGOFbeNT32/AQqUyhf/usE3sHfESqE/0qh8kP
	J1t2osg+4GVJXY/EDqAViuOiS3OfMZYKM7W+v6piOSJ+OkF0Uft1qU2F/ZTtZ0ng7pjSMr1yiP1
	8vQL3Aju1/+tsWOyREHJceJt/1uf/qHOVS/u7Rur6GT9ebnauauEhkhwbwsw/zNUBTZLhNmeNNX
	4vExW+RVryiaOmhDqsKzTVxMjuhA+8PRKx8JdM86eRKpABct+yK2ThoPGveefXtpdS1aMPAE9sM
	FVkk0u7fqkStUEmbHTRPPH14H/iA1Ax/H9aI6fTj+07iJRN5IGIG3ZKftfTHtvlqyql+bqGA3Ar
	1eMeK0Lonien4gEzgG696r8AVN9vvmp98p5YG/QspDwr91y
X-Received: by 2002:a05:690c:a01c:b0:7b8:bc4e:ac3 with SMTP id 00721157ae682-7bd77104b4emr103087397b3.26.1777916466466;
        Mon, 04 May 2026 10:41:06 -0700 (PDT)
Received: from willemb.c.googlers.com.com (172.235.85.34.bc.googleusercontent.com. [34.85.235.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6685d0cbsm51551767b3.35.2026.05.04.10.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 10:41:06 -0700 (PDT)
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
Subject: [PATCH net-next v7 2/3] selftests: net: py: add tc utility
Date: Mon,  4 May 2026 13:38:33 -0400
Message-ID: <20260504174056.565319-3-willemdebruijn.kernel@gmail.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260504174056.565319-1-willemdebruijn.kernel@gmail.com>
References: <20260504174056.565319-1-willemdebruijn.kernel@gmail.com>
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
index b68d4607114d..be9408a77168 100644
--- a/tools/testing/selftests/net/lib/py/utils.py
+++ b/tools/testing/selftests/net/lib/py/utils.py
@@ -239,7 +239,10 @@ class defer:
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
@@ -257,6 +260,13 @@ def ip(args, json=None, ns=None, host=None):
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

