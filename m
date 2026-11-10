Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794327277;
	b=R5y9RmSCt9Vf+xFdJFaRXrQDLtavZtfvNv23oU1psxEvclemHTMNCrhtPkhKGPu/iMbo
	 BGii5C2aFV4HAYYOEuRiC03/1lwA5fwyjAg4jBBzGEnMfjfDzheGKJMWmM2xPdC9NGbBT
	 uRAvSPmDJ1mCblvDiUDLVtSDSfd8FMZlJuoSGbKg4+TJLBhfvITzRS7YtnwoDV1bOFmaC
	 6Je/K2C886qy2/+vfHQzbwgd3LW4nZQysjcZOlY9Yvq+nk5fsjzC/Q/vWVxZaW02TAgWC
	 kDItufEFepNCxh3VQ0VSYJxMP6i1tqJY5tBMR19HK9ENOp+wGmhl9o9S3A4VOGdqnQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794327277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=/Z2uR1x9fdYB5o8OqazRxZXGlL0iuXmq1ohpQ9pf/hA=;
	b=t76vUfbX79DlBMfaK28egpH0IvaPH83X4xO9z/uhuN53jvZaXYZFC590thbFOg1T1Zkf
	 j2KOS419bjBzTejB42yMmfHmpN76lgdrdV1FiwDm6xVv3wYpY3H/ps5mjTAwzlqVwGvdn
	 fF/DOQcQwWKEzrqF5+sFM+9eX2bDTS1wLT1PIaFgWashh/nOpckNZzy/dzsyt2dRqWm5A
	 TqALrHxKOIOVyzMPGjzkbce4gQkoHS1x7qCNAXFADfW/EhSWqOp1yUKxTQ8ufFFXixChg
	 mqXcSL8kZlzEZDmes4UczUUTuD0LP1RQjY1J/3kn8Vz/CyiyTfsvuN/CU/enHdjpkIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n43JhbX4;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556BB60A262F
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 16:14:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 556BB60A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n43JhbX4
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a68f888a41so2041905e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 08:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794327276; x=1794932076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Z2uR1x9fdYB5o8OqazRxZXGlL0iuXmq1ohpQ9pf/hA=;
        b=n43JhbX4vuSMDFaY9JRzX64qJUQxyeKu8ZZ9maJ7929Mn5mhl/M6iNa6i8no8qXtRu
         WMAQo5pDY1XWGjJaaYfM6CqsMbQgqaRdO53+CZIWp39bm3oAfVkfaf1Kspyxvx6cI9rb
         L7Y8O31qvwqCzieXoBVafkW1BeWlhfAwsCFW7dZxemKdypHzYLPLlMjNVM3tHAa67plC
         ymklM6+vvHcqMypveAvkq2VAeJVYpFh0TjmldVaYVyUgEyPJMbFXxeeRByWeQjHbD7/D
         8UeL1dSpaya73PvMcQega8H5QHpmePdsBmuqCPfhd4IF83sSRZIpScowoxCb5145QZq+
         D1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794327276; x=1794932076;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Z2uR1x9fdYB5o8OqazRxZXGlL0iuXmq1ohpQ9pf/hA=;
        b=XT0AxFCzduHnLYYzhIV5uhodskpoEH4ia2W9+DZvxL//WG2h5hrffGIXC5x4bwelI8
         tF+jJWiBOCF+Mtv6GumXDTfXDvRzAlQJjugOmhFUC/aview1QQKKXGmXP8wktE0U5nzb
         hh63OhCgN2gXLx4+2iTD9g41VRbCS7+jzfDnaTJhwhSY9lG8tU9O680y5FkmKscV27BS
         tx/cykLu7P9oJ6wPEq1JsBBzRx7ZylWEQY9e4e/9zudqqXR2Kr7sgjMVqefQICMsthHZ
         8dboylBRV+w5ECx+iiyTygZp/fgg9e5ZNn7NdW+LTawQkWVf5WSIUTd+GvF85DFn5yzR
         yHYQ==
X-Forwarded-Encrypted: i=1; AL+hErFhI4hvgkly1zscIineNw3ZnC6UhQiQPdxdez+i0Vq054AjOhn9eg513GegLhGVNlat9OR4TK0w24lzJg2Cg3E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aTdC859nssnptDGgeJA/eojXpMyFcH0hQvcDtoS1zFVxtl8Ef
	pPMrros08JqmtpQDtRuYKUQslPVNdU5ADlDZVl1KG6Vqb7bZSk+gKs0m
X-Gm-Gg: AYBFou0Ipgf/KZZU1AwxeY0JbL1PUevb9Mye0TNUnHVL92PniykRfAduGL1N92pJl6f
	SiMe0UT9AVVvgc/mJDfOO+KFTGU2AaC2b/lYAjdjfFZyo7E58HZnUm9Bkx6C+u5bUX67Z3wA3t8
	+jW1UwTijCpV6ivvzPwbndvFYLq95Ktr5RIV6YjY7rD6jC8OLIepbuAPSi295osjpJL9o3Pqx+d
	jE6X+uHo4KfbuonVFUhZqAcQoc6XOLuN7lot77OjpxQJM59158qTpMc5JKVukEmg0PxnvuspS9T
	FYerN91OB2ER2mT4gXWolaYjXbu2nQSYnlXaYPBEpuSTLsqp+ReJwgqkTkCXqE4oa0m8W61XdGZ
	ko1jrm1m5VKqyFZhOHitfApfOs6un9sdZjqyd467CJUOmr29VhgLcEv3qGOAfuNBqL4Cs0S3vIN
	pqNwhE8ul/cJoH/0YgRViFoo8bFC2vmw9FaPhP5s2rzFHdqAdFQ6kyelY+JOW1Nsv5ni48bh25c
	QzhqRgiB97gyqXV9ID9wbrOls43WmDieXYVa0krONYysH9HxZqJPJTcs4vHpkFUfyHSL85TDAUA
	U24FA3iNw6GXQQf13wrusqGaC3J6pxgJnCTOhrGTaMYNtyNnnQdNJ8tYXzqMQ8v5u8O0ncwVPdW
	VdZzO0UC62KQIA+TFvA==
X-Received: by 2002:a05:600c:350f:b0:4b2:3c81:103 with SMTP id 5b1f17b1804b1-4ba0233a711mr52763445e9.2.1794327275658;
        Tue, 10 Nov 2026 08:14:35 -0800 (PST)
Received: from localhost.localdomain ([95.183.147.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0235ef62sm46825525e9.2.2026.11.10.08.14.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 08:14:35 -0800 (PST)
From: =?UTF-8?q?Bilal=20Yaz=C4=B1c=C4=B1o=C4=9Flu?= <ahmetbilalyazicioglu@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Mohsin Bashir <hmohsin@meta.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Bilal=20Yaz=C4=B1c=C4=B1o=C4=9Flu?= <ahmetbilalyazicioglu@gmail.com>
Subject: [PATCH net v2 2/2] selftests: drv-net: ring_reconfig: skip tx stall test without channel config
Date: Tue, 10 Nov 2026 19:14:23 +0300
Message-ID: <20261110161423.77910-3-ahmetbilalyazicioglu@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110161423.77910-1-ahmetbilalyazicioglu@gmail.com>
References: <20261110161423.77910-1-ahmetbilalyazicioglu@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

reconfig_tx_stall() needs at least two combined channels and already
skips devices which don't report enough of them. Two kinds of devices
make it fail instead:

 - drivers without the ethtool get_channels op (e.g. e1000e) fail the
   initial channels_get with -EOPNOTSUPP;
 - drivers with get_channels but no set_channels which report fewer
   active than maximum combined channels fail the attempt to enable a
   second one with -EOPNOTSUPP, and then the restore registered for it.

Skip the test in both cases. When the change is rejected with
-EOPNOTSUPP nothing was changed, so its restore is dropped. Other
netlink errors are still reported as failures, and the restore is
still registered before the change as before.

The issue was found through AI-assisted source code analysis
(OpenAI Codex) and confirmed on a ThinkPad T480 with an Intel I219-V
(e1000e, 8086:15d8). As for the previous patch, an earlier version
with the same channel query handling was run against that device
with a stub environment and ethtool set requests blocked, and the
test was skipped. The set_channels case was only checked against an
emulated ethtool family.

Fixes: c98610c2eb70 ("selftests: drv-net: Test queue stall upon reconfig")
Signed-off-by: Bilal Yazıcıoğlu <ahmetbilalyazicioglu@gmail.com>
---
 .../selftests/drivers/net/ring_reconfig.py    | 20 +++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/ring_reconfig.py b/tools/testing/selftests/drivers/net/ring_reconfig.py
index c7491154d1d..d6e84550d67 100755
--- a/tools/testing/selftests/drivers/net/ring_reconfig.py
+++ b/tools/testing/selftests/drivers/net/ring_reconfig.py
@@ -37,6 +37,18 @@ def _channels_get_or_skip(cfg, ehdr):
         raise
 
 
+def _channels_set_or_skip(cfg, req, restore):
+    """ Set the channel config, skip the test if the device can't. """
+    undo = defer(cfg.eth.channels_set, restore)
+    try:
+        cfg.eth.channels_set(req)
+    except NlError as e:
+        if e.error == errno.EOPNOTSUPP:
+            undo.cancel()
+            raise KsftSkipEx("device does not support changing channels") from e
+        raise
+
+
 def channels(cfg) -> None:
     """
     Twiddle channel counts in various combinations of parameters.
@@ -338,16 +350,16 @@ def reconfig_tx_stall(cfg) -> None:
     other_queue = 0
 
     ehdr = {'header': {'dev-index': cfg.ifindex}}
-    chans = cfg.eth.channels_get(ehdr)
+    chans = _channels_get_or_skip(cfg, ehdr)
 
     if "combined-max" not in chans:
         raise KsftSkipEx("device does not support combined channels")
     if chans.get("combined-max", 0) < 2:
         raise KsftSkipEx("device does not support 2+ combined channels")
     if chans["combined-count"] < 2:
-        defer(cfg.eth.channels_set,
-              ehdr | {"combined-count": chans["combined-count"]})
-        cfg.eth.channels_set(ehdr | {"combined-count": 2})
+        _channels_set_or_skip(
+            cfg, ehdr | {"combined-count": 2},
+            ehdr | {"combined-count": chans["combined-count"]})
 
     rings = cfg.eth.rings_get(ehdr)
     if 'rx' not in rings or 'tx' not in rings:
-- 
2.56.0

