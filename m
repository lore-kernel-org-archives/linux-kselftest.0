Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795464870;
	b=xhen6FjjXLGi/W+oMfPZ2P7GkZgfNLLMUarS75gaHU9RcE5MAserZ5EH9LrPVIQwVHNI
	 4NLRclaIcJBB0H4dRAR66rq55HWW3dFavM6jr7cN1icLzp3kQjQGYUoAzwNnYkEM7nx3c
	 2TUNVwHzkdJINJrWGDKtohq21Nf1/TK3rJ+MeMmpOWyDJqKcp7Ymq/TGanwfm71BACSnu
	 NMkUR1kH9uUAq9U9CAmXpd+ybnAVdoXcxq9DnHtwprcuOQyht3HhkOBIfJei+hvqXDUqQ
	 WR/23xZWYJ7QvfsrbA6juDdHlxlrVhtqN9kUc1BenNH65PjwvlkjDe7Z1wL0ByMZ9Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795464870;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=SKSnthlrVLK0ONivHUUb2WWqe4zjQ/MAmFiGwKLAN0U=;
	b=Ow02suQueHJVY3ztJ+T9ELCxnwfFJefF6QkzaT7OaDIAg4ntDQLKBg8QAGfMgz5yFMgZ
	 KVT+MhRBqPZB8kn8HK19/7Ooj/qp9tWbMG8MpU6lyKrjnlZAEKMxFRI+X2LsN2ONEI0d3
	 rVQkwEzEUzKVosFYDtP24Wp8fGWIQ8NYPv7HDLIF8S37pr+DD2+VDHU4/VvTSlwekwl6n
	 O80jbo2FZljCgHxXapl3/id8QEFtIEjPDStZx8qLelNK1Yx7GmnyerpfkWoECPLKJSWbB
	 Zh9NfjN+JbbnEuKQKgDXSmljX4TPrZhB44BnF1JPAVofesw7yOjxBUCBBsWFl34GstA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ks6A74Va;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E439606A31E;
	Mon, 23 Nov 2026 20:14:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E439606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ks6A74Va
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id ECA701A17A2;
	Mon, 23 Nov 2026 20:14:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AA112601E1;
	Mon, 23 Nov 2026 20:14:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D0C811E6A9CF;
	Mon, 23 Nov 2026 21:14:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795464865; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=SKSnthlrVLK0ONivHUUb2WWqe4zjQ/MAmFiGwKLAN0U=;
	b=ks6A74VaTAi+ez9pFScgXV39CcJytHQPqcjVoHiHRpoSdlwmlOtGdFptdOq0hTMkuTehvc
	YJh3HutnAUP1t4BYUcxGyfCSUXY2k/BNq9yZjdIIyrNNzL8hw2FbbQ/TsUnYbDJKMWZS6x
	eOE1mfOqKJ85sfi9fie5Ou8bhFOTfxy4fWDmMT5zkDRGcPp/T8qxfrgw7lGf2UPgRzLIo2
	rzNOnDxyQbEK+NtZYNY4ZgANztZBxc8BYLiaLsgAns6Xm8efQQxKEzLXRNajZgqXkn1jkJ
	S6Imnby+d/lTGop/4YhoaoNwLD2gjjho9cs5/7NdXFy2Qc+/vLdqye+VG+qIRQ==
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
Subject: [PATCH net] selftests: drv-net: pause: detect the link partner from the remote side
Date: Mon, 23 Nov 2026 21:14:05 +0100
Message-ID: <20261123201406.479904-1-maxime.chevallier@bootlin.com>
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

The logic used to detect if the kselftest remote we're interacting with
is directly connected to us uses link renegotiation to flap the link,
that way we know if there's a switch between the remote and the DUT.

However the current logic is racy. It triggers a link renegotiation,
wait for the link to come back up locally, and looks on the remote if
the link flap counter changed.

It's possible that this entire cycle happens locally before the peer
reports the link flap, in which case it reports that we're not directly
connected to the peer when we actually are.

Solve that by reversing the logic : Trigger a link renegotiation on the
peer, and check if we see the link flap locally. The current
wait_for_aneg() already waits for a full "up - down - up" cycle, so
it doens't really matter which side of the link flaps first here.

This was found in the stmmac CI setup, between an Intel I350-T4 card and
an iMX8mp + KSZ9131 board. The Pause test was failing seemingly at
random, due to the link flap occuring either on the host or the remote
first.

Fixes: 8f897f26ef34 ("selftests: drv-net: pause: Validate the pause autonegotiation with a partner")
Signed-off-by: Maxime Chevallier (Netdev Foundation) <maxime.chevallier@bootlin.com>
---
 .../testing/selftests/drivers/net/hw/pause.py | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/pause.py b/tools/testing/selftests/drivers/net/hw/pause.py
index ca4a55e59c30..31518b7ec53b 100755
--- a/tools/testing/selftests/drivers/net/hw/pause.py
+++ b/tools/testing/selftests/drivers/net/hw/pause.py
@@ -90,8 +90,8 @@ def controllable_lp(cfg):
     For low level ethtool tests, we need to have the remote directly connected
     to the local host (i.e. not through a switch).
 
-    This is tested by taking triggering a link renegotiation and checking the
-    carrier_changes counter on the partner.
+    This is tested by triggering a link renegotiation on the remote and
+    checking that the local link flaps.
 
     :returns: True if the remote is our link partner
     """
@@ -99,17 +99,17 @@ def controllable_lp(cfg):
     if controllable is not None:
         return controllable
 
-    before = int(cmd(f"cat /sys/class/net/{cfg.remote_ifname}/carrier_changes",
-                     host=cfg.remote).stdout)
-
-    ret, _ = ethtool_ret(f"-r {cfg.ifname}", is_get=False)
+    ret, _ = ethtool_ret(f"-r {cfg.remote_ifname}", is_get=False,
+                         host=cfg.remote)
     if ret != 0:
-        raise KsftSkipEx(f"ethtool -r {cfg.ifname} failed: {errno.errorcode.get(ret, ret)}")
+        raise KsftSkipEx(f"ethtool -r {cfg.remote_ifname} failed: {errno.errorcode.get(ret, ret)}")
 
-    wait_for_aneg(cfg, link_drop=True)
+    try:
+        wait_for_aneg(cfg, link_drop=True)
+        cfg.lp_controllable = True
+    except TimeoutError:
+        cfg.lp_controllable = False
 
-    cfg.lp_controllable = int(cmd(f"cat /sys/class/net/{cfg.remote_ifname}/carrier_changes",
-                                  host=cfg.remote).stdout) > before
     return cfg.lp_controllable
 
 def require_controllable_lp(cfg):
-- 
2.56.1

