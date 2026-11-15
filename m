Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794747831;
	b=gVYhySjdC5jgbVu7jeO1rE12dc4E3c9oKXGo3s0yMnPtze5/6MyoyNDTQAUi9xctu7Gy
	 nd43y+ZyxU7s38Mg2AY724m3aPpJW/aaBwcAjuDx9ery3b9dxm1W4dtpsTL8shDVMfVbP
	 +M7dRmXSDaxnMLZCS36owabYoWNRgadubLifj0BMqwxQrasNN7LBA7wgT8ZMu0xHFdjJv
	 wuJKwphNNBwaugm8WPkEfPrgilrlafNfhvhBwVo2pXFBD69md/7xq4qR//t6XsMDLTy6E
	 M95i7HpBFAaISdVeH4jKXwO8NqBSYKNTtGJPQ44AxIugVqzoFEYN2yI03Q11+0H8HPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794747831;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=pon4Orxf+wxXpPtJNQHkuozRV8DRO+bVJt+AyFuNNgA=;
	b=IGSHvNm/ZcTx7qFBWjHJ+jW3rBjF6mwPel1eFqTIH5VbtH1Q00AIw7PtFLMnPo6rzWIa
	 M8uh9FBtNUuth7UG7DDb0aGIEVWAtMUjrebu5Viw/ifySoyWgA0jNijh7bek+dIxNJw7p
	 487zvWgHGPAFKevePd6b0YTgWGEsXpKEurJ/iz0+9eytEmK5G1F5Ht4/JQWw7CgC5c34A
	 X3gGUN7Y2+yxhRml4MyRxA8ZEBHZq9Ov0Tl2X9mJJxl/NLyHHLX39mcCyocQh/XAeY2eC
	 V/hXN1fmMw3CwVBnBu2WscZCJzuI3k5Lu1c58TRWjOh/TYiKQCCaw6CMJE3vmcXtWNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NFY7bNbw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2089E606A31D;
	Sun, 15 Nov 2026 13:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NFY7bNbw
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794747830;
	b=OUSONZFJMDovmjRzOroXfDbn33rzW2XFbRIc/4GuTGtdQySrNYMcSSHHYh7PJ57KKZXv
	 a8R0Sj/qeIwZSlDZZm4PwYGu5u+91rkzQKpRSb+HjB3UrtD3cYD1yY9DqN2Uxy3sMroln
	 ifKrsJIgM7MffpL/KMDt/ffa6yDNaxhe2GUt78Hqmy55tJ4gPpG8jTXioAYy0lRu85KiU
	 Boj6LFoL5IQEa9NaDe/j0DvEbiCk/T0F84mnZ3MUmpHb6AOQRnP27+6ypTMn5tAnD2kQ2
	 q9UoAThK0GnIsZ0htAOyGt3JYGEk+k+J/pRvBynNDU6Im/ZGXeSj6uF/pjR8BViNfZA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794747830;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=pon4Orxf+wxXpPtJNQHkuozRV8DRO+bVJt+AyFuNNgA=;
	b=kAnKTk9er5e3nGLoMvCY9CImUXq8sj/CAcBcY3B4h2I80mxZlZhaoLQLrHxQt35gIIlf
	 htEFrqafR67XuwSWgpfnRmjCvHIWbJ62o/n1UzQlaU2aW3JRBHCcxYYZjbDe9kRSzA0ft
	 8E7FwB+jcUkKGL0xpOyarMIhGy/ZuxrYaSFxSUhAyE7uof8XdeCA2jZIH4xfSIqujRGpE
	 bADcJqUFmY5LbXdinE7t2vFnH+b+WL2mGRrM2YFdk0LZ8fB5L097h4entF2KZfEQkpNk0
	 rBradvBQQKSMGEZgFxI0Bav42V8YaufbLtszlpInchMZLKA5QwAU9PYAhRu3LN/Uvjw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 47B021F000C4;
	Sun, 15 Nov 2026 13:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794747830;
	bh=pon4Orxf+wxXpPtJNQHkuozRV8DRO+bVJt+AyFuNNgA=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=NFY7bNbw18avbta8RqY+5u9GzDzbq00ccvEyvbnxPMuJo3Y56XBdtw6n0iqENZaAv
	 v/2wCrRgp3/NKpuB4p6fNjOvkSetxw1TIg/4ccQeU2VSDXDSvhXKj020bJsRhRyLvN
	 iBf6sXH3VnOXT2eJIamdEyIE86HodgChNM9PpOV7C9Rr4RYLmAEb4SXtoqv23845LI
	 NQSfmLRLxXbNGXJ+lqW3Rq72AF6I7/Xo6vMW8xdi9Aik9HptaAcRJ/kDuZuFQycRW8
	 QQ/SvrkK5+koWDh/K/6uVkMDGMjF41tg+dohe/pda2MhlEE2bAJ9e1qW8rKUdel+i9
	 0WyY+JuRbKUpg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9C0A94A09B;
	Sun, 15 Nov 2026 13:03:49 +0000 (UTC)
From: Alexey Skidanov via B4 Relay <devnull+alexeys.xsightlabs.com@kernel.org>
Date: Sun, 15 Nov 2026 15:03:29 +0200
Subject: [PATCH net] selftests: drv-net: psp: skip unsupported versions in
 netkit data test
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261115-main-v1-1-7011cd84e54a@xsightlabs.com>
X-B4-Tracking: v=1; b=H4sIAKCt+WoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0NT3dzEzDxdgyRj87SkVNNUwxQjJaDSgqLUtMwKsDHRSnmpJUqxtbU
 AdT6qw1sAAAA=
X-Change-ID: 20261115-main-0b37fbe5e1d2
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, Wei Wang <weiwan@google.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, guyt@xsightlabs.com, 
 Alexey Skidanov <alexeys@xsightlabs.com>, 
 Lior Yizchak <liory@xsightlabs.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794747829; l=1543;
 i=alexeys@xsightlabs.com; s=20261115; h=from:subject:message-id;
 bh=+HHsLPET6WB6VgqdrP9TIelZlMYJuT8XLUrUt8UuqfA=;
 b=vVXw9si6EHE39Eo2dXea6LyskLSwuKQn3lHCXtuRRoLGUziB4aoRDjPgOp+NV7p3TzDUs3tu5
 g/A3NOSYmkgD2g/WBTPcfCZDxW5rub9IeXDMvfNx86udW9Ok7PKo00K
X-Developer-Key: i=alexeys@xsightlabs.com; a=ed25519;
 pk=ve3muo5qeQ0fgK78LFE9NWqGShBLIHZrMBKOM0exhfY=
X-Endpoint-Received: by B4 Relay for alexeys@xsightlabs.com/20261115 with
 auth_id=1532
X-Original-From: Alexey Skidanov <alexeys@xsightlabs.com>
Reply-To: alexeys@xsightlabs.com
Content-Transfer-Encoding: 7bit

From: Alexey Skidanov <alexeys@xsightlabs.com>

data_basic_send_netkit_psp_assoc() runs for PSP versions 0-3. The
non-netkit data path already skips versions the device does not
advertise in psp-versions-cap. The netkit path does not, so those
cases fail instead of skipping.

Version 0 stays mandatory. Skip an unadvertised version before opening
the PSP connection.

Fixes: 43cf629700fa ("selftests/net: psp: add dev-assoc data path test")
Signed-off-by: Alexey Skidanov <alexeys@xsightlabs.com>
Signed-off-by: Lior Yizchak <liory@xsightlabs.com>
---
 tools/testing/selftests/drivers/net/psp.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/selftests/drivers/net/psp.py
index c114d2245135..7c8fb2200b39 100755
--- a/tools/testing/selftests/drivers/net/psp.py
+++ b/tools/testing/selftests/drivers/net/psp.py
@@ -728,6 +728,12 @@ def _data_basic_send_netkit_psp_assoc(cfg, version, ipver):
     """
     _assoc_nk_guest(cfg)
 
+    # Version 0 is required by spec, don't let it skip
+    if version:
+        name = cfg.pspnl.consts["version"].entries_by_val[version].name
+        if name not in cfg.psp_info['psp-versions-cap']:
+            raise KsftSkipEx("PSP version not supported", name)
+
     # Enter guest namespace (netns) to run PSP test
     with NetNSEnter(cfg.netns.name):
         cfg.pspnl = PSPFamily()

---
base-commit: aa40afa831ebfe45e40a23721711059f2ac584d4
change-id: 20261115-main-0b37fbe5e1d2

Best regards,
-- 
Alexey Skidanov <alexeys@xsightlabs.com>


