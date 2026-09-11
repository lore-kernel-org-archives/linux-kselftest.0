Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D998E3C3443
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 22:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789166578; cv=none; b=nYNf5meNm5CYYQhZJuK/pr8L1ErwG7Ui/F9v+pAW09qHLVgarJoMWwjGMF6NlmwYGkpycKHBRgxYqyP4QdvLutGamOCXdFrlIXCwA7UBwDSkojKgqTN+2FflqjtYBcy32M+oM10hcweLooyq9ryOSLW0KI/7qIWYSEr+npL/380=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789166578; c=relaxed/simple;
	bh=eeH1jPnINjHVHMbG9MoAFrXx/N+k2lCfRvyNTf2dvbA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KqcM1cEfnGvYnO2yZJOK27ssucRKaN7M4ibMndyac4qo87KvD/6URWF0vrGr4zbpiJPgZ/kBk5AXMMEFtfc4blqvvX85UaUjf+VbK6dzWbEksGBrIR0tqrBxg5iMu69QrxTDOPq4QhTGjqrenB6kGkcSCBTo1r66Vg8750l+Rz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G0gFIT7i; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G0gFIT7i"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd78e6eso77336a91.0
        for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 15:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789166576; x=1789771376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NBsqs4IGYYKTCC5Wl01mWLlYRMLLj/HTcQhSnUMd5io=;
        b=G0gFIT7iwYzQZw6mZhQyNLEJD433907H7p4DE6+9IKuH/ko/1ZvqPQqR8/sUUSUxYR
         yGxjW8sMPrXnEeI77y0pdA9vQ6l2Rgro2Q7e/KwMm/iuOIaxYWS/DWERxEb7G26VG1G5
         CcVdEJJyHms+fqE0B3g2Chm0+ywK/Kw0BCiJGDYSzJem0y7shZYMv1soeSWA6oAJFDYO
         IIKvO2qZes2saLSpVCBBPUO37a41PBvPk7tELvl3S2ao+SIATrIHajYSCH8bgVwQVbgm
         zqaNyjs0bess6GGcIFug9aDqGto784OiaefXwTF+EO1Nv/NFtTiQ1YiK1ttLtx4DN3XT
         eP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789166576; x=1789771376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NBsqs4IGYYKTCC5Wl01mWLlYRMLLj/HTcQhSnUMd5io=;
        b=FHaUujbJ0e5ZHWypaWtA7l6LI9TQvTnkqX3gHdGjVv/Kgp344rUZgCqvTg2Rsrc+hd
         3OzESmBNwWgOG3Si9F5Ixym+IQfHsFfXRq3+AO/d2+d0Np4DIurG01/yEx4Nil7hrZBN
         N71kRGUpcEh4cKwjuQgo5tT+QZOg2smwgxVWtomGxxiUMJGOhJeIiuE+u+Stv+RbhwvS
         tVhqW1FufkMXgCLL2D5ucaB+v0xhO1v27p/cTdRuJbvKmwszdeO4ccrYYyTsxueECDMs
         nmij2w5uisiC2+EPq+7GESViIAOwjETIgFe+hea0o7cJ6ceEmVSBsXHlZT5QksI4tKtN
         3fYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwI/tat4qezbMLvX0CD+Xnwr4+kpvAsuQk17m7lFcyaoWqiSih6/Hk73abV3x4TyUU9hsPataec1pVuUAAopv4=@vger.kernel.org
X-Gm-Message-State: AFuF++lBKFwRgGz86hQLHEKDaakjEiAF0Kju+/675FFoau94vE3SFAJl
	JKlgP+izephG+jEhOdjSIbwV7Xf63OOlAPx0mp9fWHTHlKPTbX3fpUXu
X-Gm-Gg: AYBFou39XFBRI0jtm99wNpATQD/RkjgoAEp82N+7ZM/ywi/hpNHaXrZtMhe6XSAmh6B
	sd9HxeW3DdVfG6dLLXd0IONEb9dKKGsufr1ETfPH7k7ghiXRWlyGO5WoMplsfxJg9dBZ1ZMT2SY
	w5EWx9tnUyHiL0s8jw2e6FkD0m1mREW4lTTzWXXz7rKmhpd1KMgYE7Ydf6ogPUlJ6tyPy1hRb0t
	ti0BVYD0Q632s99pQHwNxQCOsmBwBXCENsh82tfqh413RZxobRKqiOF8jIX0QVZKB7I0Z1934s2
	j6DOL+ivGNhuZlkkJRTGMSpGTnYDIBP3ohZnbc9qEau8cUbZ9hFO5Iq+02FZAw9FKt5Id+sDz3F
	fjqrqnvUC8xnmlK+kRHWGC1+HgWBz5YUcRevRdTi6vjgz678bYMTsjd/Ku4fy1EWK4pNHAOsqPb
	obNxgnl++cpzUh3Bqd/4woiKgOgtOEbFE7/LjFGyEtKzYnS9heqxxfPxbKmmqT+56bdJYf/XaRZ
	ynQ
X-Received: by 2002:a17:90b:4d0d:b0:38e:6d55:b1a6 with SMTP id 98e67ed59e1d1-39d97ea0248mr5492514a91.3.1789166576074;
        Fri, 11 Sep 2026 15:42:56 -0700 (PDT)
Received: from localhost ([2a03:2880:7ff:4c::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d99531b21sm6673425a91.13.2026.09.11.15.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:42:55 -0700 (PDT)
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
To: "David S . Miller" <davem@davemloft.net>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
Subject: [PATCH net-next] selftests: drv-net: remove duplicate functions in hds.py
Date: Fri, 11 Sep 2026 15:42:55 -0700
Message-ID: <20260911224255.3675903-1-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dimitri Daskalakis <daskald@meta.com>

There were duplicate definitions of the enabled_set_xdp and set_xdp
test methods. The two enabled_set_xdp copies were identical apart from
a comment and whitespace.

The set_xdp copies differed by a reset of the hds configuration.
commit ee3ae27721fb ("selftests: drv-net: hds: restore hds settings")
introduced the config reset, but this was shadowed by the copy.

Signed-off-by: Dimitri Daskalakis <daskald@meta.com>
---
 tools/testing/selftests/drivers/net/hds.py | 29 ----------------------
 1 file changed, 29 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hds.py b/tools/testing/selftests/drivers/net/hds.py
index c4fe049e9baa..606e26d75951 100755
--- a/tools/testing/selftests/drivers/net/hds.py
+++ b/tools/testing/selftests/drivers/net/hds.py
@@ -240,35 +240,6 @@ def enabled_set_xdp(cfg, netnl) -> None:
         _xdp_onoff(cfg)
 
 
-def set_xdp(cfg, netnl) -> None:
-    """
-    Enable single-buffer XDP on the device.
-    When HDS is in "auto" / UNKNOWN mode, XDP installation should work.
-    """
-    mode = _get_hds_mode(cfg, netnl)
-    if mode == 'enabled':
-        netnl.rings_set({'header': {'dev-index': cfg.ifindex},
-                         'tcp-data-split': 'unknown'})
-
-    _xdp_onoff(cfg)
-
-
-def enabled_set_xdp(cfg, netnl) -> None:
-    """
-    Enable single-buffer XDP on the device.
-    When HDS is in "enabled" mode, XDP installation should not work.
-    """
-    _get_hds_mode(cfg, netnl)  # Trigger skip if not supported
-
-    netnl.rings_set({'header': {'dev-index': cfg.ifindex},
-                     'tcp-data-split': 'enabled'})
-    defer(netnl.rings_set, {'header': {'dev-index': cfg.ifindex},
-                            'tcp-data-split': 'unknown'})
-
-    with ksft_raises(CmdExitFailure) as e:
-        _xdp_onoff(cfg)
-
-
 def ioctl(cfg, netnl) -> None:
     mode1 = _get_hds_mode(cfg, netnl)
     _ioctl_ringparam_modify(cfg, netnl)
-- 
2.52.0

