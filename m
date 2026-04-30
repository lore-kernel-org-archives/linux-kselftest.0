Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DF533F59E
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 16:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777567940; cv=none; b=StyCiblu3xFbUdX7XRNULE13cxU0hJh9qfkZ3IDM4N0GbFaC7nqy15/Ygz2Hz52/dW1EOH2xXirTtfDDOj1fYmt9/YmvBEfybUgF8tu3YSG4DT5Ps0YBkFMwCGcMrWrRJr3r+rjKbpNXd2RAijARcFnI2RQPGu2SlwjMq6U8l48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777567940; c=relaxed/simple;
	bh=5r2qpsebSMkvi3m6XvxmESYtctah89wmlMLrA/0+UFU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jO3HjHFb/VTxcGf5GXoB63EJpCSIYGPj7/ejHNItLOiwxusPoSq/YclUt33eswuojjNtvHE2qX500ZE4HPb2iVaXcSKClfVNMfV1EWtomcr4RauTpP289DlhhxSvjariizVF6a48JM84bV3UUuXWFfBPCgHGToc+LmZle8KGlw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ey98PURv; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ey98PURv"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c76b9efc299so489899a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 09:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777567939; x=1778172739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yz+m5ys36cUhA483WJwMNGt1SvzoVUKacxRP5e2sWBU=;
        b=Ey98PURvpuuUo/13vjTP9+/CxPA/w7sG4xemOazsJVHhPRpQ2H/uAXr/Zfd0gstPZ7
         zoVIsky8QgZ7je/zX4yfpEWnS+c5CmTgJjJsBTBuzN4NM6OVaDEvMDMIJCXh5fzee8Bs
         wqnCGt2kqHkGB+X8Jolq5FFhxv0+/NukrfD+Vs0ExNMc9RMeS0xCFwmqifvZi/RmOjJ7
         L3IUegXZKx58pe0Vz0m6tD5d0Wa9UKK/dA7mRqSNA31aY/JU9edelt+VZ+TyQNi72Hyq
         nNw3sfxqh9RhuNnMy1EsFm4AB8Ft1DZI7ebdes34imn93dDgBaom7b0OfLcxwCZnGhf2
         cp4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777567939; x=1778172739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yz+m5ys36cUhA483WJwMNGt1SvzoVUKacxRP5e2sWBU=;
        b=DkOXwtFHlLgubCBvXuoxoVReOhrbkRpw6wTyFADEno/No33wl5Ec53+lnNTXjiKXye
         V/yTDm7Al4h4X3KJremaxaRBTK3NA1U09abDCdG5hV3GYgBGaTogOgqDdjwBbaP7WSiQ
         C0vUXdc4FQRShS4Yt4Y2kRm0CIgtSfLZ3gxOMLWrFfra/uB1qmKKw8ZkKJUjod/IWlq3
         bzuwiFzrcRxOBfCgJ6Nb49+/g+YUhFda5fLUHfcnQwndtFWziipCSing58HloMRfoklB
         FslttEkuhYR0NN9uRZvQUDXazllMkTw0zJIDeFcQU37Wh+CE1T3l2YzEN47VuXCgAmS7
         A1Hg==
X-Forwarded-Encrypted: i=1; AFNElJ/R/u6sDxBlVJC1BmFxnY6/95qaykR37K5oSSiNTa123yH9eqOvIE7/PNETxUzkKs29ENWAVlQk8Ds5PaWjqss=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMf6aIIIyiXsVEqSKlUXVvZpFbBP2Gzv++2YvO8TlWUgOo7GPh
	IT7BNBfTq4StrxGTVSr0Uqn7JIGtmyRF1kpBDuUIfHHpebYG/Fwc6N7h
X-Gm-Gg: AeBDievFdk433iiVDAbGCLsAiD9VBmmB/mQO63fJ+72P9JXDZpT5QZ9pFFqQMBVez1v
	7Vv06GdnFImxgXPVUD2qdQdou97LhmERQdVc3i9YhGEjPyrNZCJvpVk8rPKi3kst0oz9jM8vAKk
	gEnFyu6olqX8AbuLHkKoU3u8g+gzySNtzcC85TU9uEd54Uf/UyrqDzYZEC75iZoYLcHlhw+S5Ee
	Txf6sqHTo/KtuLagDsC6NVWgjo7UUQMraUfoKuWWS+7nj2bU05l0G0NjV8+qbF16mHVADtpBbfN
	CSnao3ojFUBki0bWSvdxYs79BjPtQDkdJTnWjLTcZAKlOHO1xZXKOO8vBxOPztWVvgeVFrFmuT/
	YpHDx3eME/ZE5981lmyC+nyPbwCYxNsxzNcrc/zHeMJA5eOATlm/p7woJS/XKRyPMiChYZWXVmJ
	n7Kf5IZSEKDrsR7YoF26eIiQUq2+qaRtWrULVFaHU=
X-Received: by 2002:a05:6a21:6d95:b0:3a2:f14a:427e with SMTP id adf61e73a8af0-3a3cf82c8b0mr4540828637.43.1777567938653;
        Thu, 30 Apr 2026 09:52:18 -0700 (PDT)
Received: from localhost ([2a03:2880:7ff:70::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbbbe8e9sm163022a12.10.2026.04.30.09.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 09:52:18 -0700 (PDT)
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
To: "David S . Miller" <davem@davemloft.net>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Dimitri Daskalakis <daskald@meta.com>,
	David Wei <dw@davidwei.uk>,
	Joe Damato <joe@dama.to>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	Vishwanath Seshagiri <vishs@fb.com>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Michael Chan <michael.chan@broadcom.com>,
	Gal Pressman <gal@nvidia.com>,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next] selftests: drv-net: Enable ntuple-filters if supported
Date: Thu, 30 Apr 2026 09:52:17 -0700
Message-ID: <20260430165217.3700469-1-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dimitri Daskalakis <daskald@meta.com>

Certain devices which support ntuple-filters do not enable the feature
by default. The existing tests will skip (if they check for the feature),
or fail if they blindly attempt to install rules. Therefore, attempt to turn
on ntuple-filters if the device supports them.

Signed-off-by: Dimitri Daskalakis <daskald@meta.com>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 tools/testing/selftests/drivers/net/gro.py         | 10 ++++++++++
 tools/testing/selftests/drivers/net/hw/gro_hw.py   | 10 ++++++++++
 tools/testing/selftests/drivers/net/hw/iou-zcrx.py | 12 ++++++++++++
 tools/testing/selftests/drivers/net/hw/ntuple.py   |  5 ++++-
 tools/testing/selftests/drivers/net/hw/rss_ctx.py  |  7 ++++---
 5 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/gro.py b/tools/testing/selftests/drivers/net/gro.py
index 221f27e57147..5ffaa7bdbff4 100755
--- a/tools/testing/selftests/drivers/net/gro.py
+++ b/tools/testing/selftests/drivers/net/gro.py
@@ -132,11 +132,21 @@ def _get_queue_stats(cfg, queue_id):
     return {}
 
 
+def _require_ntuple(cfg):
+    features = ethtool(f"-k {cfg.ifname}", json=True)[0]
+    if not features["ntuple-filters"]["active"]:
+        if features["ntuple-filters"]["fixed"]:
+            raise KsftXfailEx("Device does not support ntuple-filters")
+        ethtool(f"-K {cfg.ifname} ntuple-filters on")
+        defer(ethtool, f"-K {cfg.ifname} ntuple-filters off")
+
+
 def _setup_isolated_queue(cfg):
     """Set up an isolated queue for testing using ntuple filter.
 
     Remove queue 1 from the default RSS context and steer test traffic to it.
     """
+    _require_ntuple(cfg)
     test_queue = 1
 
     qcnt = len(glob.glob(f"/sys/class/net/{cfg.ifname}/queues/rx-*"))
diff --git a/tools/testing/selftests/drivers/net/hw/gro_hw.py b/tools/testing/selftests/drivers/net/hw/gro_hw.py
index 10e08b22ee0e..70e76e3888bd 100755
--- a/tools/testing/selftests/drivers/net/hw/gro_hw.py
+++ b/tools/testing/selftests/drivers/net/hw/gro_hw.py
@@ -51,11 +51,21 @@ def _resolve_dmac(cfg, ipver):
     return getattr(cfg, attr)
 
 
+def _require_ntuple(cfg):
+    features = ethtool(f"-k {cfg.ifname}", json=True)[0]
+    if not features["ntuple-filters"]["active"]:
+        if features["ntuple-filters"]["fixed"]:
+            raise KsftSkipEx("Device does not support ntuple-filters")
+        ethtool(f"-K {cfg.ifname} ntuple-filters on")
+        defer(ethtool, f"-K {cfg.ifname} ntuple-filters off")
+
+
 def _setup_isolated_queue(cfg):
     """Set up an isolated queue for testing using ntuple filter.
 
     Remove queue 1 from the default RSS context and steer test traffic to it.
     """
+    _require_ntuple(cfg)
     test_queue = 1
 
     qcnt = len(glob.glob(f"/sys/class/net/{cfg.ifname}/queues/rx-*"))
diff --git a/tools/testing/selftests/drivers/net/hw/iou-zcrx.py b/tools/testing/selftests/drivers/net/hw/iou-zcrx.py
index e81724cb5542..d72b76ba0835 100755
--- a/tools/testing/selftests/drivers/net/hw/iou-zcrx.py
+++ b/tools/testing/selftests/drivers/net/hw/iou-zcrx.py
@@ -100,12 +100,22 @@ def rss(cfg):
     defer(ethtool, f"-N {cfg.ifname} delete {flow_rule_id}")
 
 
+def _require_ntuple(cfg):
+    features = ethtool(f"-k {cfg.ifname}", json=True)[0]
+    if not features["ntuple-filters"]["active"]:
+        if features["ntuple-filters"]["fixed"]:
+            raise KsftSkipEx("Device does not support ntuple-filters")
+        ethtool(f"-K {cfg.ifname} ntuple-filters on")
+        defer(ethtool, f"-K {cfg.ifname} ntuple-filters off")
+
+
 @ksft_variants([
     KsftNamedVariant("single", single),
     KsftNamedVariant("rss", rss),
 ])
 def test_zcrx(cfg, setup) -> None:
     cfg.require_ipver('6')
+    _require_ntuple(cfg)
 
     setup(cfg)
     rx_cmd = f"{cfg.bin_local} -s -p {cfg.port} -i {cfg.ifname} -q {cfg.target}"
@@ -121,6 +131,7 @@ def test_zcrx(cfg, setup) -> None:
 ])
 def test_zcrx_oneshot(cfg, setup) -> None:
     cfg.require_ipver('6')
+    _require_ntuple(cfg)
 
     setup(cfg)
     rx_cmd = f"{cfg.bin_local} -s -p {cfg.port} -i {cfg.ifname} -q {cfg.target} -o 4"
@@ -134,6 +145,7 @@ def test_zcrx_large_chunks(cfg) -> None:
     """Test zcrx with large buffer chunks."""
 
     cfg.require_ipver('6')
+    _require_ntuple(cfg)
 
     hp_file = "/proc/sys/vm/nr_hugepages"
     with open(hp_file, 'r+', encoding='utf-8') as f:
diff --git a/tools/testing/selftests/drivers/net/hw/ntuple.py b/tools/testing/selftests/drivers/net/hw/ntuple.py
index 232733142c02..ef4604bfa8ef 100755
--- a/tools/testing/selftests/drivers/net/hw/ntuple.py
+++ b/tools/testing/selftests/drivers/net/hw/ntuple.py
@@ -22,7 +22,10 @@ class NtupleField(Enum):
 def _require_ntuple(cfg):
     features = ethtool(f"-k {cfg.ifname}", json=True)[0]
     if not features["ntuple-filters"]["active"]:
-        raise KsftSkipEx("Ntuple filters not enabled on the device: " + str(features["ntuple-filters"]))
+        if features["ntuple-filters"]["fixed"]:
+            raise KsftSkipEx("Device does not support ntuple-filters")
+        ethtool(f"-K {cfg.ifname} ntuple-filters on")
+        defer(ethtool, f"-K {cfg.ifname} ntuple-filters off")
 
 
 def _get_rx_cnts(cfg, prev=None):
diff --git a/tools/testing/selftests/drivers/net/hw/rss_ctx.py b/tools/testing/selftests/drivers/net/hw/rss_ctx.py
index 1243fe426d35..f36f76d6ca59 100755
--- a/tools/testing/selftests/drivers/net/hw/rss_ctx.py
+++ b/tools/testing/selftests/drivers/net/hw/rss_ctx.py
@@ -57,9 +57,10 @@ def ethtool_create(cfg, act, opts):
 def require_ntuple(cfg):
     features = ethtool(f"-k {cfg.ifname}", json=True)[0]
     if not features["ntuple-filters"]["active"]:
-        # ntuple is more of a capability than a config knob, don't bother
-        # trying to enable it (until some driver actually needs it).
-        raise KsftSkipEx("Ntuple filters not enabled on the device: " + str(features["ntuple-filters"]))
+        if features["ntuple-filters"]["fixed"]:
+            raise KsftSkipEx("Device does not support ntuple-filters")
+        ethtool(f"-K {cfg.ifname} ntuple-filters on")
+        defer(ethtool, f"-K {cfg.ifname} ntuple-filters off")
 
 
 def require_context_cnt(cfg, need_cnt):
-- 
2.52.0

