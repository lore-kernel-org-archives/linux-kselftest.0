Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794536841;
	b=MCPo5EAQjouM+IrVjyAY60eQdnHQ8J82BBDK2vZ24CMg04FxTCF82J5fIWXM6EOsmhTF
	 xWYrpH2nsibJ9TkO6/52rY8+5x5bHMAgGzthp8gc+AOSOSe5FucBasBjAeQjY24uQAUae
	 uV4Z7bQ26YzcI5WAin4nUWWNFhzK+juGwefugFReyUhJN6jDudyCWx1g4FAqXauIHWiBj
	 rrwGgZlhb0PT2HbrIteennOZ8yyKXOYU/TNpT9Ko0svRjInVJ1ZGrwHOWY6Fhzb8CTItm
	 T1kMzXXLFq4IdoiHqZhD+caPHxBxbeBKq56QoV6fuahxHDpTvwRA+CeDNZXmpHWRDYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794536841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dZCnN3zUSocYlZp/Mqt53uqs96/J8YMxA7iHx75dj9o=;
	b=0IMQYsQ9elUVaJW1ub5I2WXmq0ImOtHu/anTDkADCG3c5yddEUqawQ3iFvfYm0U4cMxE
	 2wYnAYHtuoX/fVeq1ej4RhzzhbUJ4nSHZ3z6amES9WMbC1AO0XN0f0yG/Ik6j67peGy/z
	 vDsEFee0lhpirQWmo31eHhXRivBm91jY46Jk5OgSOCFyitL6z87SkYawP6HjgZ+/UEhGr
	 PGwpQdELimqPKnH+j+NGVzakqposSvx1xWyTNT18AK3pCk9Szmv9z1dUzypWLZVGbkXhO
	 whPb55INBnCPvovJGFjyBFP87PhIQbGVkElxigasITEvp3b+mCxfgvYE5OZzPVZaTpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XKXLLfrH;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D46606A880
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 02:27:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9D46606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XKXLLfrH
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b335eeb340so5190627b3.0
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 18:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794536840; x=1795141640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dZCnN3zUSocYlZp/Mqt53uqs96/J8YMxA7iHx75dj9o=;
        b=XKXLLfrHn1TvqoodREmJNONu5R98SSd6i+jsBxzTjl9MCQtryB7SKaWQ6KFrKzx/MW
         XFPBHM5fLPAZJPogD7IvWK/mQcWt0FywrVqOB1XbYlrJEuZUmV+SyQoKWqueFr0aAvKX
         As1v8X4oOkv/mTKmJDYKQsjB8iMWzlHThEBJGZKOS3+AFBXCU4N3K9fJP0X6rGUQna3j
         dgi4ngztdE8J9s3h+EU6ZDCCayree71DSEcTkuMd1BL5j+oHLf4BHYIv8SOVg2Hzt1E5
         UMzfD9D5wY96HBHs25b8SOVh4KNtFG6MHvk0NpeLZ/DyBu+AUwgfo33oH8b2k/f2BLQG
         BmCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794536840; x=1795141640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dZCnN3zUSocYlZp/Mqt53uqs96/J8YMxA7iHx75dj9o=;
        b=rqmQrDlBCgyNeDAKyXk+rjflnpCritHjN9qdOzXPyEGcCO9bmjfUx6J21RWciQEHTP
         FORFh5ZtMkUDJy6pwaCdI/TKfCJKLayk2lOaZFHXMqY4hy71G8gt6bRPMTBJAuXrvm/f
         q8zWBAmcEcvZTC3KJoG990+RB/TBTHRthuI36VDCZuM4uiYsheMbOfBoSm6tYm8nnPDy
         n26HMeQfVBNoN1fnEax7i5vwvQOrI/up/DgpFFnosNlF8LnlEsibXJLCTuEtzp/7ic42
         VCVSTnQ/s65Iwx0L2TJtFGPGo3VZXi+z9pzTCh/N44yeYEOLvURiWdShhr1AGvG9BEYy
         C3gw==
X-Forwarded-Encrypted: i=1; AL+hErGDii2zS2aF7JsEu53CzvYYSEIvoW4p5nMaOv3X1I1KfjMbTWtdii/RDoPLs8NHKptGk29rsC78J5cxlsClJfU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SeQvfLAWsG13/28m0tlMCSHBkdel7CCO10059X273BZ2jfktC
	23mxq2YaK0Q/ZywwFZ/5ovuQ9QSTviShk01puXV+jv4OxcEEAft7rlRx
X-Gm-Gg: AYBFou12hMwbXtJ3xie94LBv4+k9Mo8egdkjh3/effIwRcO1wBckXLJIUFvo1daQKbT
	oDo2jEpMthz8C2NLBDZLzGc3P+77e9lREBbz/PPjaxCXiBkIOIqY4F7Mm8YsX6IsT9gePDJy+4s
	XqQoy4fKpZNYWjZyELU8Ppju3Th/F3zPEEohTdhoAAUAC8lLKtxkSlf7vzXowQdzNZWhq8Wuxw5
	1qLWAkNnV7RnygemdSRfRks23mIrqT7SDrfEbdLMt1/8bCwDcN89ETJbb8vMqmbs7cF+bU+jbUv
	ZWekK0wi0oOkwxuj8U3gdclWBZ4UNpgulj+ZTDPsG4zlWGId/1hzKTYt6X1pcjQl//hnp2gqPGf
	8BTpWbFbeXkDMv5m+zQGOr9uFFBvemhF1pB0P+8NHVbGnWHmdK8ON8W8SNqkkVrdBoYLxybmnc1
	OAlee/iAZXMNCIKBnxVPCBo+6JPK1VsELnO+0eAQBqIq1lphhEsZ9AkLSr134E/1cNZnUF3emAo
	3Tt1p6BzwnfYiB7cJ1lxxu/JvDWMdi/2exRUbnu+OUqtKhqs2i+UkTK0xvLR4YcOUs9jFxObbnF
	PCFCfPoJzeqU3btAEzeVLjqe9Q8=
X-Received: by 2002:a05:690c:399:b0:8b1:3707:86a7 with SMTP id 00721157ae682-8b4aa2dd736mr8776587b3.83.1794536839855;
        Thu, 12 Nov 2026 18:27:19 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:34::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa8f3286sm10637027b3.15.2026.11.12.18.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:27:19 -0800 (PST)
From: Mohsin Bashir <mohsin.bashr@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	maxime.chevallier@bootlin.com,
	linux-kselftest@vger.kernel.org,
	hmohsin@meta.com
Subject: [PATCH net v3] selftests: drv-net: pause: Avoid cleanup failures for unsupported link settings
Date: Thu, 12 Nov 2026 18:27:17 -0800
Message-ID: <20261113022717.1914724-1-mohsin.bashr@gmail.com>
X-Mailer: git-send-email 2.53.0
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

From: Mohsin Bashir <hmohsin@meta.com>

pause_setup() saves the initial link settings before tests run. Devices
that report link settings but do not support changing them can reject even
a no-op restore with EOPNOTSUPP. That turns pause tests that use
pause_setup() into cleanup failures.

Fix this by queuing link-setting restores only after a link-setting
request has succeeded. Keep pause_test_support coverage for devices that
cannot change link settings by falling back to forced MAC pause on the
current link. Run the extra link autoneg on/off checks only when those
link setting requests are accepted. Tests that force link autoneg off,
including pause_autoneg_link_autoneg(), now queue their own autoneg-on
restore after the force request succeeds.

Results on fbnic:

  Before: # Totals: pass:0 fail:4 xfail:0 xpass:0 skip:24 error:0
  After:  # Totals: pass:4 fail:0 xfail:0 xpass:0 skip:24 error:0

Fixes: cbd8a536cd6d ("selftests: drv-net: Introduce a selftest for ethtool flow control")
Signed-off-by: Mohsin Bashir <hmohsin@meta.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
Changelog:
v3:
- Drop the remaining unconditional autoneg-on restore from pause_setup()
  and only queue link-setting restores after a link-setting request succeeds.
- Since pause_setup() no longer restores autoneg on, make pause_test_support()
  and pause_autoneg_link_autoneg() queue their own autoneg-on restores after
  they successfully force the link.

v2: https://lore.kernel.org/netdev/20261103190622.3981970-1-mohsin.bashr@gmail.com
v1: https://lore.kernel.org/netdev/20261030173516.1002250-1-mohsin.bashr@gmail.com
---
 .../testing/selftests/drivers/net/hw/pause.py | 56 ++++++++++---------
 1 file changed, 30 insertions(+), 26 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/pause.py b/tools/testing/selftests/drivers/net/hw/pause.py
index ca4a55e59c30..c3398c7452e0 100755
--- a/tools/testing/selftests/drivers/net/hw/pause.py
+++ b/tools/testing/selftests/drivers/net/hw/pause.py
@@ -402,16 +402,13 @@ def pause_setup(cfg):
     if "auto-negotiation" not in link:
         raise KsftSkipEx(f"{cfg.ifname} doesn't report its link modes")
 
-    if link["auto-negotiation"]:
-        defer(cmd, f"ethtool -s {cfg.ifname} autoneg on")
-    elif "speed" in link and "duplex" in link:
-        defer(cmd, f"ethtool -s {cfg.ifname} autoneg off speed {link['speed']} "
-                   f"duplex {link['duplex'].lower()}")
-
     # Local interface admin up, link aneg on
     ip(f"link set {cfg.ifname} up")
     if link["supports-auto-negotiation"] and not link["auto-negotiation"]:
         ethtool(f"-s {cfg.ifname} autoneg on")
+        if "speed" in link and "duplex" in link:
+            defer(cmd, f"ethtool -s {cfg.ifname} autoneg off speed {link['speed']} "
+                       f"duplex {link['duplex'].lower()}")
 
     # Get remote pause params
     ret, params = ethtool_ret(f"-a {cfg.remote_ifname}", host=cfg.remote)
@@ -426,18 +423,14 @@ def pause_setup(cfg):
     if "auto-negotiation" not in link:
         raise KsftSkipEx(f"{cfg.remote_ifname} doesn't report its link modes")
 
-    if link["auto-negotiation"]:
-        defer(cmd, f"ethtool -s {cfg.remote_ifname} autoneg on",
-              host=cfg.remote)
-    elif "speed" in link and "duplex" in link:
-        defer(cmd, f"ethtool -s {cfg.remote_ifname} autoneg off "
-                   f"speed {link['speed']} duplex {link['duplex'].lower()}",
-                   host=cfg.remote)
-
     # Remote interface admin up, link aneg on
     ip(f"link set {cfg.remote_ifname} up", host=cfg.remote)
     if link["supports-auto-negotiation"] and not link["auto-negotiation"]:
         ethtool(f"-s {cfg.remote_ifname} autoneg on", host=cfg.remote)
+        if "speed" in link and "duplex" in link:
+            defer(cmd, f"ethtool -s {cfg.remote_ifname} autoneg off "
+                       f"speed {link['speed']} duplex {link['duplex'].lower()}",
+                       host=cfg.remote)
 
     wait_for_link(cfg)
 
@@ -470,9 +463,12 @@ def pause_test_support(cfg, pauseparams):
 
     forced = forced_link_settings(cfg)
     _, supported = get_local_pause_supported(cfg)
+    link_config_tested = False
 
     # We check that what we can configure in the pause params matches what we
-    # support under various contditions : Link aneg on/off, pause aneg on/off
+    # support under various conditions: link aneg on/off, and pause aneg
+    # on/off. If no link configuration change is supported, fall back to
+    # checking forced MAC pause on the current link.
     ret, _ = ethtool_ret(f"-s {cfg.ifname} autoneg on", is_get = False)
     if ret != 0:
         ksft_pr("link autoneg on refused, not tested")
@@ -481,18 +477,23 @@ def pause_test_support(cfg, pauseparams):
                                "link autoneg on")
         expect_pauseparams_set(cfg, pauseparams, True, supported,
                                "link autoneg on")
+        link_config_tested = True
 
     if not forced:
         ksft_pr("link speed unknown, the forced link is not tested")
-        return
-
-    ret, _ = ethtool_ret(f"-s {cfg.ifname} autoneg off {forced}", is_get = False)
-    if ret != 0:
-        ksft_pr(f"link autoneg off {forced} refused, not tested")
-        return
-
-    expect_pauseparams_set(cfg, pauseparams, False, supported, "link autoneg off")
-    expect_pauseparams_set(cfg, pauseparams, True, supported, "link autoneg off")
+    else:
+        ret, _ = ethtool_ret(f"-s {cfg.ifname} autoneg off {forced}", is_get = False)
+        if ret != 0:
+            ksft_pr(f"link autoneg off {forced} refused, not tested")
+        else:
+            if link_config_tested:
+                defer(cmd, f"ethtool -s {cfg.ifname} autoneg on")
+            expect_pauseparams_set(cfg, pauseparams, False, supported, "link autoneg off")
+            expect_pauseparams_set(cfg, pauseparams, True, supported, "link autoneg off")
+            link_config_tested = True
+
+    if not link_config_tested:
+        expect_pauseparams_set(cfg, pauseparams, False, supported, "current link")
 
 @ksft_variants(pauseparams_variants)
 @ksft_disruptive
@@ -902,11 +903,14 @@ def pause_autoneg_link_autoneg(cfg):
                          is_get=False, host=cfg.remote)
     if ret != 0:
         raise KsftSkipEx(f"Can't force the peer's link at {forced}")
+    remote_restore = defer(cmd, f"ethtool -s {cfg.remote_ifname} autoneg on",
+                           host=cfg.remote)
 
     ret, _ = ethtool_ret(f"-s {cfg.ifname} autoneg off {forced}",
                          is_get=False)
     if ret != 0:
         raise KsftSkipEx(f"Can't force the link at {forced}")
+    local_restore = defer(cmd, f"ethtool -s {cfg.ifname} autoneg on")
 
     try:
         wait_for_aneg(cfg)
@@ -917,8 +921,8 @@ def pause_autoneg_link_autoneg(cfg):
     check_local_pauseparams(cfg, True, rx, tx)
 
     # Re-enable autoneg
-    ethtool(f"-s {cfg.remote_ifname} autoneg on", host=cfg.remote)
-    ethtool(f"-s {cfg.ifname} autoneg on")
+    remote_restore.exec()
+    local_restore.exec()
     wait_for_aneg(cfg)
 
     # Pause autoneg must still be on
-- 
2.53.0-Meta

