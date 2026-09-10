Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE73C39AD3A
	for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 23:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789083988; cv=none; b=dmnN5Tv7aZSglAzVxj5eigGBTxuzo4a3aNr31uwhy/BuvdGOQ7lWMsEbHFGbZWYYRKOfpT2wwhatM/E7SQ35Fhp5p2BNdB6q9ZnsOZMGPDe4V+CXiSeOftHrQBhiu1jb2TwoCofMSIUFRroSq4I9ozvH8/4ql3JWqiFZk54mxiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789083988; c=relaxed/simple;
	bh=i5SSJclfpTZsD3tbZQrq1a93Y6jfPDeXDX017S0hopk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qgYT2q9z89sVsNVm7uOJdkh8NMfJsvnwrEdQqZWbDSLkfCc9YgeQsTyf0LPIzrTJ+05jnsfh/giyztiVrBfb8gPLSWdJpEWO6E1LXFU6n7KiVt5hENcgp43n0iAhH8GtlVyxghIHCOL8lT1t2xmYtxuXblXTxuc254c8hmAeDQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T7ivxdE4; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T7ivxdE4"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c0766cbe64so250447b6e.3
        for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 16:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789083984; x=1789688784; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6n6jlSmBF1kKwhxMNpXMOGrKa/toteP0cdIVsSP+HbE=;
        b=T7ivxdE4Fif996iORt5oA7e3pLkxwRGj/3nP3hJCO0A9UO23rObl1IjQXF02XW7G4M
         lqlc864YT5wrsuIARDbQdxrB897JjqjUFaTobHCgh8rvtUjKqMt41Wxt5hQJi8M1R0sE
         fnZcfnBs2fNQHVZxE2/gujk78ISoUQGXWPJn2O5SvrZBIcYhA8MjMths9Nzjlz8t/0Jn
         W0emt2tKdBLL5pYBV4gRrmZ2XYPR4sN8Kb5TJ98JscmmGl8pNCPJcvHsxmb6g1M4ea/U
         +QCkGk2ZbObVKbmjgKStRN1UgkDktvQt1HuOntcnWpdrHKAR2cosmWuhvOWbpDdxUPJV
         UZ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789083984; x=1789688784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6n6jlSmBF1kKwhxMNpXMOGrKa/toteP0cdIVsSP+HbE=;
        b=PtNmS/DZmKS/5ryq7gjp7SiwKT+JnnrWw1eOufdluIRsSWyL+9IH06bVdiIGEON2vq
         CRrOqEjWVqOlycCOM7ewuLUDaIsZ+oafbnHI0VCA8cjr04gdOSLaKAxcq50AYeEHFo6v
         9t0to2YSoZHAy3+n8As4hRU+JRnCNUEZCYbQn3VxPvktMDHKdItcC2xPZpI8I3FIuwYK
         H4ZBhLgzzn4tosWk0az4CQAaws70UuauOqpK2e+Rkw99GElUyMGRJu+IkVz/GgngxAhs
         M0uQVtH2ET/nAiz0LBc4ODOYBs+07RhuwKwKqYmXT1jghZkYrkq7fPYyRFFIrqDW7nLk
         Pt6A==
X-Forwarded-Encrypted: i=1; AKwUvBwMcfVIL2g2wSKEO4vSVZxxj3UWmlNrg1JwE4kFThr0awRO6xBGXA29f5JPdr7MHF7vvJQGoybMNZXllhRjhaA=@vger.kernel.org
X-Gm-Message-State: AFuF++kjBUjhHX0Xr5agFBjenb5fn7WmN9Lw0MYgIGzslqgXhhbj5qvR
	qsbuSyICMCNAj/8Xs2HIVQ2M61fV7ky31WYv3QYwdETfExWTqFG9XPQf
X-Gm-Gg: AYBFou2By5T9tcrGHwqrITV5j2Xl8U3XhMYC3t57yxXzVI8cDf5TPQjt3V4BbH6k/yh
	J/KwcMs2SqZIJXSpGEbxJ6gaX0odrlVwdfCLPpki6VwV5B4/431WkjpIi65dH5m/nKNe050vtKC
	ZsVMn8beD4Pp08EZjkrhQllyNtDj4FiV6VL1kgttBHu0plhzqu5rM6zYqKOUDjgDnBkRLOf1xbv
	JGwrWkvpVR609JBvqtvSwbMkcYcrsn2iG28yesXOZuiNYBKcUkeNa5GrC4DK+ZlyFsjKrVeo5ZT
	ucMIiVtHzeigYxj2iqEvpm4AzzaJFroBcxZty9Pn+/YiDO5pzlupM39Z1RCyNffrK+9MxLqtG9K
	EClIE9TsEtPKADkpFww+YUKYIT3M1MPZ/ZohRbzDmIZRD8xgRU/huNz/dTSvrGYLp9rdBpv7AAa
	SyFRihOEjKMLih1Idy3eVwUmHKHq0DnXxOBvJ2tCq+dxvcYZd/4Ol3NIx0scvGSGxVoc/x
X-Received: by 2002:a05:6808:30aa:b0:495:eb86:6e8f with SMTP id 5614622812f47-4c31bcf3a50mr2081426b6e.14.1789083983151;
        Thu, 10 Sep 2026 16:46:23 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:72::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4c331bc9342sm698094b6e.12.2026.09.10.16.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:46:22 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Thu, 10 Sep 2026 16:46:05 -0700
Subject: [PATCH net 2/2] selftests: drv-net: psp: test PSP and TCP ULP
 mutual exclusion
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-psp-ktls-fix-v1-2-e3f30aaeca4e@gmail.com>
References: <20260910-psp-ktls-fix-v1-0-e3f30aaeca4e@gmail.com>
In-Reply-To: <20260910-psp-ktls-fix-v1-0-e3f30aaeca4e@gmail.com>
To: Eric Dumazet <edumazet@google.com>, 
 Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.13.0

Test both setting PSP after TLS ULP, and TLS ULP after PSP.

Add CONFIG_TLS=y to the drivers/net/config.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 tools/testing/selftests/drivers/net/config |  1 +
 tools/testing/selftests/drivers/net/psp.py | 46 ++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/config b/tools/testing/selftests/drivers/net/config
index b6989c7d3d9d..4838adf27fa1 100644
--- a/tools/testing/selftests/drivers/net/config
+++ b/tools/testing/selftests/drivers/net/config
@@ -21,5 +21,6 @@ CONFIG_NET_SCH_INGRESS=y
 CONFIG_NET_SCH_PRIO=m
 CONFIG_PPP=y
 CONFIG_PPPOE=y
+CONFIG_TLS=y
 CONFIG_VLAN_8021Q=m
 CONFIG_XDP_SOCKETS=y
diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/selftests/drivers/net/psp.py
index 315648a770d0..12b27f2a3fa1 100755
--- a/tools/testing/selftests/drivers/net/psp.py
+++ b/tools/testing/selftests/drivers/net/psp.py
@@ -23,6 +23,8 @@ from lib.py import NetNSEnter
 from lib.py import bkg, rand_port, wait_port_listen
 from lib.py import ip
 
+TCP_ULP = 31
+
 
 def _get_outq(s):
     one = b'\0' * 4
@@ -333,6 +335,50 @@ def assoc_version_mismatch(cfg):
             ksft_eq(the_exception.nl_msg.error, -errno.EINVAL)
 
 
+def _require_tls_ulp():
+    with socket.create_server(("localhost", 0)) as srv:
+        with socket.create_connection(srv.getsockname()) as s:
+            try:
+                s.setsockopt(socket.SOL_TCP, TCP_ULP, b"tls")
+            except OSError as exc:
+                raise KsftSkipEx("kTLS not available") from exc
+
+
+def assoc_psp_ulp_exclusive(cfg):
+    """ Test that a TCP ULP cannot be attached to a PSP socket """
+    _init_psp_dev(cfg)
+    _require_tls_ulp()
+
+    with _make_clr_conn(cfg) as s:
+        try:
+            cfg.pspnl.rx_assoc({"version": 0,
+                                "dev-id": cfg.psp_dev_id,
+                                "sock-fd": s.fileno()})
+            with ksft_raises(OSError) as cm:
+                s.setsockopt(socket.SOL_TCP, TCP_ULP, b"tls")
+            ksft_eq(cm.exception.errno, errno.EINVAL)
+        finally:
+            _close_conn(cfg, s)
+
+
+def assoc_ulp_psp_exclusive(cfg):
+    """ Test that a PSP assoc cannot be added to a socket with a TCP ULP """
+    _init_psp_dev(cfg)
+    _require_tls_ulp()
+
+    with _make_clr_conn(cfg) as s:
+        try:
+            s.setsockopt(socket.SOL_TCP, TCP_ULP, b"tls")
+            with ksft_raises(NlError) as cm:
+                cfg.pspnl.rx_assoc({"version": 0,
+                                    "dev-id": cfg.psp_dev_id,
+                                    "sock-fd": s.fileno()})
+            ksft_eq(cm.exception.nl_msg.error, -errno.EINVAL)
+            ksft_eq(cm.exception.nl_msg.extack['bad-attr'], ".sock-fd")
+        finally:
+            _close_conn(cfg, s)
+
+
 def assoc_twice(cfg):
     """ Test reusing Tx assoc for two sockets """
     _init_psp_dev(cfg)

-- 
2.52.0

