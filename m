Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795861060;
	b=POWyKOiGbEwS9YOnEOh3kcR+FONHfLsd+me7obnbjl0qEBS1N1rNnfUDarCcfgbK6n4C
	 8LwcvK1O3ybh0dkk2n2QYhpFfdVP3Awk4EWQzEicDjHbCFkNcCLUZMi7fpkH3rvDvve6n
	 V57ZSTQ+3/eNZk5KA7ZGxteNrC39jWFUpwdjt8RmGUL4l0D4K0zMH3QumauwU2nzgebSP
	 c4Vrru/2aNTegisY6idG+cLqiPXkq04T1RHVvmHO7KOeVvsdNw+lbg8MtIV1+6e0H1BEM
	 BignbnTj4CfMohH2tPg8MCiN48qZH63IDAtNaKrNa6jJ/+YUv9dEaURa/VO0ilJxcIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795861060;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=PlNJtfQJO2+ddsgoMnwmoYZ6WgTRRQQ5xgP2X5wVeT4=;
	b=N4sWVY1k0nJAsKrIXqrxKhmTH7FVVh9zYfs2oQqqQ0EWUpmc59u0OP6nJ/4cRiK8RMuD
	 cqGpdKFbmPUV6RcBeYH3gNsPMD2D6mzwEoJOqdf8y/u+jTHL49F/ysO03A/YrIbmjgNlk
	 HLEYonxwEJxakVILGhl/Ug84N8g4mIH2I7T8aBZ5APW3hAh3VAe8u7wfgdn4e2MklUI9G
	 owdPdwr0UeePIjqvb3LiVUlH1E1zTFJ5LtAOuIm2eoHI3yQGpvjt3EtDX6SW69x4yYImP
	 aVYC45DwWn87W15ba0eImFOqzZtrJl5lHnxSAroPKnysE4SDuGEs2BDmvIob0yRcxjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=VgShlheu;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02261606A31C;
	Sat, 28 Nov 2026 10:17:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02261606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=VgShlheu
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CC0F34E417BE;
	Sat, 28 Nov 2026 10:17:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 83AB8604C0;
	Sat, 28 Nov 2026 10:17:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6B33F11E91158;
	Sat, 28 Nov 2026 11:17:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795861054; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=PlNJtfQJO2+ddsgoMnwmoYZ6WgTRRQQ5xgP2X5wVeT4=;
	b=VgShlheuODqYx7kLiLqJesuy1J8Fg8VMhzLpo2d6lFs6XjdpNv/FU42ybcVk5OoaFaEIet
	p1v9nxJtrxVJg8pZeHNWiRbFMa/8BUqBAvkvrBJChOAwwLpQTjdw25E+WSpAc4NgxDTakX
	ULL7EvABQIssUhfHqIHCgSFmxj9w5wrLMuxn4W0+I4KP3hQhgusamhGSwBbtDiBLlwkZzC
	Br3ydusaT6O+DmIpQsirupSRcPA8JBkskeMDPwJ5HEgAccZ6apK+fXIxNumThVJtT9PtvD
	hRXJV1M+xEeKqkX/kcB4CHYtk/alYbwkrdymNBSVljGrZrR9KgsIUKr/PYeyjA==
From: "Maxime Chevallier (Netdev Foundation)" <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Breno Leitao <leitao@debian.org>,
	matttbe@kernel.org
Cc: "Maxime Chevallier (Netdev Foundation)" <maxime.chevallier@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v2] selftests: drv-net: pause: ensure the link partner sees the link when probed
Date: Sat, 28 Nov 2026 11:17:24 +0100
Message-ID: <20261128101725.17398-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.56.1
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
X-Last-TLS-Session-Version: TLSv1.3

When probing for the kselftest remote in the Pause test, we try to
detect if it is directly connected to the DUT, or if it's reached
through switches.

For that, we trigger a renegotiation on the DUT, and check if the link
flaps on the remote end. The current implementation may hit a race
condition if the link flap happens so fast that we don't see it when
checking on the remote.

Let's rework the logic by measuring the number of link state changes on
the remote, then triggering the renegotiation, then re-checking on the
remote if the link change counter has changed, or changes within the
timeout window.

While at it, do a small refactor to store the "get the link change
counter" command into at dedicated variable that we re-use afterwards.

This has been found while running the stmmac kernel selftest suite
between an imx8mp + ksz9131 PHY and a Intel i350-T4 card, the
renegotiation happened too fast to reliably see it on the intel card
side.

Fixes: 8f897f26ef34 ("selftests: drv-net: pause: Validate the pause autonegotiation with a partner")
Signed-off-by: Maxime Chevallier (Netdev Foundation) <maxime.chevallier@bootlin.com>
---
 tools/testing/selftests/drivers/net/hw/pause.py | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/pause.py b/tools/testing/selftests/drivers/net/hw/pause.py
index ca4a55e59c30..5d7518f33e83 100755
--- a/tools/testing/selftests/drivers/net/hw/pause.py
+++ b/tools/testing/selftests/drivers/net/hw/pause.py
@@ -8,6 +8,7 @@ Driver-related behavior tests for Pause-based Flow Control.
 import errno
 import json
 import os
+import time
 
 from lib.py import KsftFailEx, KsftNamedVariant, KsftSkipEx
 from lib.py import NetDrvEpEnv
@@ -99,8 +100,8 @@ def controllable_lp(cfg):
     if controllable is not None:
         return controllable
 
-    before = int(cmd(f"cat /sys/class/net/{cfg.remote_ifname}/carrier_changes",
-                     host=cfg.remote).stdout)
+    carrier_changes_cmd = f"cat /sys/class/net/{cfg.remote_ifname}/carrier_changes"
+    before = int(cmd(carrier_changes_cmd, host=cfg.remote).stdout)
 
     ret, _ = ethtool_ret(f"-r {cfg.ifname}", is_get=False)
     if ret != 0:
@@ -108,8 +109,14 @@ def controllable_lp(cfg):
 
     wait_for_aneg(cfg, link_drop=True)
 
-    cfg.lp_controllable = int(cmd(f"cat /sys/class/net/{cfg.remote_ifname}/carrier_changes",
-                                  host=cfg.remote).stdout) > before
+    link_changed = False
+    end = time.monotonic() + 5
+    while not link_changed and time.monotonic() < end:
+        time.sleep(0.1)
+        after = int(cmd(carrier_changes_cmd, host=cfg.remote).stdout)
+        link_changed = after > before
+
+    cfg.lp_controllable = link_changed
     return cfg.lp_controllable
 
 def require_controllable_lp(cfg):
-- 
2.56.1

