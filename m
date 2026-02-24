Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A0534D392
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 22:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771973224; cv=none; b=Y1DuPsmCV6GcQo7ThgMuFmVFyuBtgkRzExt/3Z4fyL7SkMxnsJHWdhCMBMKvXAYUNk41+XkM1AJBPX3e3O5J9MSoknYnUPJw1VaduDTzGNorCNA5XvkvTGX5gN9FoMa7S5BChCmjxgSDcOYLb/T9hc8TQfLmitjD2n1DR2uTLgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771973224; c=relaxed/simple;
	bh=kALg13wZu04r2k8eCA7cv7uYIYixHQ2BbgkbO8nYIXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iBAf0/pD0GScrKdwpe/Tf1A49w+bpSie8ECBeJlT4dShz+1hrD50QWU6uI6m8QAy0CGJHn+pP74CQL/QQ6MswJEblzli8z/L4WtnrfuSyFKgPSQ3a4+04j/3Nq0JmmOL36rVpOu+yG5obiextyb1zSYs7hNMjVFQYBUSCjndUck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O1CdwjPI; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O1CdwjPI"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7d4c383f2fcso5401464a34.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 14:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771973222; x=1772578022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csuXz/5RrsjgkIQ/6OJbBlQAwM7ZWgpZ3ivhYSSPtBs=;
        b=O1CdwjPI9pnnk2LvXZ2uW+tY/C3TDx4KhO/gMZE5pyUNRxyevIbJ7kDKsGXRmDRS7/
         SejXWz1t2bOUxFqbshN7k2fbAgcsFf8TP5calsqmm8hkxzGwSZlqpJf7rgcdlwxEhMXy
         bNwiLqKIBmr8E4l+bYHDn4KlAMFDUMrujJdQ1hr3TiRJWQoRnUqlEpBf+dPC2OIbSCza
         LSTgP/j8pV+6eZug03wV0ZbLZI7Sh2ZviiZ25UnJI1LWNgy5MVgxwc1A+nYzyLdGjxEL
         KE/f2wI10Qcs3CLKWm/qPhyJh+ivqJIb2qYNiXMmlPPtka8VyGIscU2qh7U4mPFk9OVa
         P7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771973222; x=1772578022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=csuXz/5RrsjgkIQ/6OJbBlQAwM7ZWgpZ3ivhYSSPtBs=;
        b=mbDTq5nuHQFn3595lfJIbqFQtocIy/gBwytacvZxKU3iZ0NVrNwagLJnIz3XyZatyd
         cT+deaTaGjIqII/CV1iAto8gypRvgSUsibKXeSlqJXRoP7iFvzdEknJnFDq7lSsTcMX1
         qCq58NKOztrqBB8BHOf1xkqPaB2ITvNMVRIxcfyxOA/jMrhxtLjtIx8gqG1FIcHzOaCp
         6sfDMt3elCn+JchQ9ZtZZ7qwM4MjUxc+u9NepjWonFmAYV+Wd7PjqYeg63D3YtMzXNiy
         6rpy+GnKV1xIFO3IsJ0AZlUNJzZW3qpAwBtGObH9SGfpORI0YE7mY3EffxYoKyDc9t4H
         fFSg==
X-Forwarded-Encrypted: i=1; AJvYcCX9AkDW40vh8a5ElzEvJNvq/xYHkmG8+OAMdm6eVitCkZhkEif8yGUjfuvR4oaF1EDbD5Abcea2+uXY1NFv2+k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBx4v7wl/OzxljCfUv3UCtG15xB2/k/SEb+azzSoc+B4K63ZWz
	tXbbkxTvtzENmhTwb3kjMOEUVFhjoQI8WMUc3vO0LC6AHgqTBDEE8NcC
X-Gm-Gg: AZuq6aKelTwqjscPiNQc/KoK2jfBdTd0i/NDkgyppofjEC0c3mcDAqza8TXL2Gei5QU
	G+vL/nOilBsf3oDYXkwglKbHRvG6CD2yHg2iMXXgLNxMh1I8EzbONB8G7qbHo6WeMPw/U3orQBQ
	j9bEk6b5hbR+N/O7/tTb4nOaM6+iRqq3C0teit0eDlMlOjpnSAAcY7Mnhsbe8kls0rUk5s7OETa
	Vc0dTew3JycnLoAQSJup3m8AHKKod6vbwEdpDBn2M7IHir7lqZBlH7E5Bd/s0qjhGdCbfY74366
	9aOHo3mkxD2dMpf4asN0Xv+Ouba5o13jKkX7a+SIgivU6Lr9I09wv3R4R5Py95Yg/tnMjQifd8G
	k8PJw6Fsp4dHQ4e5MVrN3CKeC/RDmrtPWE+gy33Hh1AnbAr9fG2iD5kbsAFOeJhX+9ZrSZ/escJ
	3GEoJquMXC0+mhO9db9xqu4YryAJBR/zBnUNiUvA4=
X-Received: by 2002:a05:6830:6aa3:b0:7cf:d1e2:d386 with SMTP id 46e09a7af769-7d52bf51c6cmr10256909a34.33.1771973222081;
        Tue, 24 Feb 2026 14:47:02 -0800 (PST)
Received: from localhost ([2a03:2880:12ff:1::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d52cf78503sm10903924a34.3.2026.02.24.14.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 14:47:01 -0800 (PST)
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
To: "David S . Miller" <davem@davemloft.net>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Daniel Zahka <daniel.zahka@gmail.com>,
	Carolina Jubran <cjubran@nvidia.com>,
	Gal Pressman <gal@nvidia.com>,
	David Wei <dw@davidwei.uk>,
	Mohsin Bashir <mohsin.bashr@gmail.com>,
	Nimrod Oren <noren@nvidia.com>,
	Breno Leitao <leitao@debian.org>,
	Petr Machata <petrm@nvidia.com>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 1/2] selftests: net: py: Add rand_ports helper method
Date: Tue, 24 Feb 2026 14:46:58 -0800
Message-ID: <20260224224659.1507082-2-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260224224659.1507082-1-dimitri.daskalakis1@gmail.com>
References: <20260224224659.1507082-1-dimitri.daskalakis1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Certain tests need a unique set of ports. Successive calls to the
existing rand_port method may return a duplicate port, resulting in test
flakiness. The new helper keeps sockets open while building a list of
ephemeral ports, thus the kernel enforces their uniqueness.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
---
 .../drivers/net/hw/lib/py/__init__.py         |  5 ++--
 .../selftests/drivers/net/lib/py/__init__.py  |  4 ++--
 .../testing/selftests/net/lib/py/__init__.py  |  5 ++--
 tools/testing/selftests/net/lib/py/utils.py   | 24 ++++++++++++++++---
 4 files changed, 29 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/lib/py/__init__.py b/tools/testing/selftests/drivers/net/hw/lib/py/__init__.py
index d5d247eca6b7..1971577d47e9 100644
--- a/tools/testing/selftests/drivers/net/hw/lib/py/__init__.py
+++ b/tools/testing/selftests/drivers/net/hw/lib/py/__init__.py
@@ -22,7 +22,8 @@ try:
         NlError, RtnlFamily, DevlinkFamily, PSPFamily
     from net.lib.py import CmdExitFailure
     from net.lib.py import bkg, cmd, bpftool, bpftrace, defer, ethtool, \
-        fd_read_timeout, ip, rand_port, wait_port_listen, wait_file, tool
+        fd_read_timeout, ip, rand_port, rand_ports, wait_port_listen, \
+        wait_file, tool
     from net.lib.py import KsftSkipEx, KsftFailEx, KsftXfailEx
     from net.lib.py import ksft_disruptive, ksft_exit, ksft_pr, ksft_run, \
         ksft_setup, ksft_variants, KsftNamedVariant
@@ -36,7 +37,7 @@ try:
                "NlError", "RtnlFamily", "DevlinkFamily", "PSPFamily",
                "CmdExitFailure",
                "bkg", "cmd", "bpftool", "bpftrace", "defer", "ethtool",
-               "fd_read_timeout", "ip", "rand_port",
+               "fd_read_timeout", "ip", "rand_port", "rand_ports",
                "wait_port_listen", "wait_file", "tool",
                "KsftSkipEx", "KsftFailEx", "KsftXfailEx",
                "ksft_disruptive", "ksft_exit", "ksft_pr", "ksft_run",
diff --git a/tools/testing/selftests/drivers/net/lib/py/__init__.py b/tools/testing/selftests/drivers/net/lib/py/__init__.py
index 8b75faa9af6d..5872d114f142 100644
--- a/tools/testing/selftests/drivers/net/lib/py/__init__.py
+++ b/tools/testing/selftests/drivers/net/lib/py/__init__.py
@@ -22,7 +22,7 @@ try:
         NlError, RtnlFamily, DevlinkFamily, PSPFamily
     from net.lib.py import CmdExitFailure
     from net.lib.py import bkg, cmd, bpftool, bpftrace, defer, ethtool, \
-        fd_read_timeout, ip, rand_port, wait_port_listen, wait_file
+        fd_read_timeout, ip, rand_port, rand_ports, wait_port_listen, wait_file
     from net.lib.py import KsftSkipEx, KsftFailEx, KsftXfailEx
     from net.lib.py import ksft_disruptive, ksft_exit, ksft_pr, ksft_run, \
         ksft_setup, ksft_variants, KsftNamedVariant
@@ -34,7 +34,7 @@ try:
                "NlError", "RtnlFamily", "DevlinkFamily", "PSPFamily",
                "CmdExitFailure",
                "bkg", "cmd", "bpftool", "bpftrace", "defer", "ethtool",
-               "fd_read_timeout", "ip", "rand_port",
+               "fd_read_timeout", "ip", "rand_port", "rand_ports",
                "wait_port_listen", "wait_file",
                "KsftSkipEx", "KsftFailEx", "KsftXfailEx",
                "ksft_disruptive", "ksft_exit", "ksft_pr", "ksft_run",
diff --git a/tools/testing/selftests/net/lib/py/__init__.py b/tools/testing/selftests/net/lib/py/__init__.py
index f528b67639de..a584e7f806a4 100644
--- a/tools/testing/selftests/net/lib/py/__init__.py
+++ b/tools/testing/selftests/net/lib/py/__init__.py
@@ -13,7 +13,8 @@ from .ksft import KsftFailEx, KsftSkipEx, KsftXfailEx, ksft_pr, ksft_eq, \
 from .netns import NetNS, NetNSEnter
 from .nsim import NetdevSim, NetdevSimDev
 from .utils import CmdExitFailure, fd_read_timeout, cmd, bkg, defer, \
-    bpftool, ip, ethtool, bpftrace, rand_port, wait_port_listen, wait_file, tool
+    bpftool, ip, ethtool, bpftrace, rand_port, rand_ports, wait_port_listen, \
+    wait_file, tool
 from .ynl import NlError, YnlFamily, EthtoolFamily, NetdevFamily, RtnlFamily, RtnlAddrFamily
 from .ynl import NetshaperFamily, DevlinkFamily, PSPFamily
 
@@ -25,7 +26,7 @@ __all__ = ["KSRC",
            "ksft_run", "ksft_exit", "ksft_variants", "KsftNamedVariant",
            "NetNS", "NetNSEnter",
            "CmdExitFailure", "fd_read_timeout", "cmd", "bkg", "defer",
-           "bpftool", "ip", "ethtool", "bpftrace", "rand_port",
+           "bpftool", "ip", "ethtool", "bpftrace", "rand_port", "rand_ports",
            "wait_port_listen", "wait_file", "tool",
            "NetdevSim", "NetdevSimDev",
            "NetshaperFamily", "DevlinkFamily", "PSPFamily", "NlError",
diff --git a/tools/testing/selftests/net/lib/py/utils.py b/tools/testing/selftests/net/lib/py/utils.py
index 85884f3e827b..487350fb957c 100644
--- a/tools/testing/selftests/net/lib/py/utils.py
+++ b/tools/testing/selftests/net/lib/py/utils.py
@@ -263,9 +263,27 @@ def rand_port(stype=socket.SOCK_STREAM):
     """
     Get a random unprivileged port.
     """
-    with socket.socket(socket.AF_INET6, stype) as s:
-        s.bind(("", 0))
-        return s.getsockname()[1]
+    return rand_ports(1, stype)[0]
+
+
+def rand_ports(count, stype=socket.SOCK_STREAM):
+    """
+    Get a unique set of random unprivileged ports.
+    """
+    sockets = []
+    ports = []
+
+    try:
+        for _ in range(count):
+            s = socket.socket(socket.AF_INET6, stype)
+            sockets.append(s)
+            s.bind(("", 0))
+            ports.append(s.getsockname()[1])
+    finally:
+        for s in sockets:
+            s.close()
+
+    return ports
 
 
 def wait_port_listen(port, proto="tcp", ns=None, host=None, sleep=0.005, deadline=5):
-- 
2.47.3

