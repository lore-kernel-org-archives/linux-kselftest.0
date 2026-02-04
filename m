Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929CC4266A1
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Feb 2026 15:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770218419; cv=none; b=p+aTUGL2egfNfdLiOSLX8gMaP3tlpH5R1oUZM95oGf39nwFxeOXi3P1K3E5a6uj2h+UO8wkJ+nJNFa8eRWhSGZTzAxYT/nQDrPWYxwyR7u92uhEfHwfTIxhk5xMnSbN8sITYfAMV1OEZ9mpgDFeubS2A5Kcp4scUGOjCV/OgIMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770218419; c=relaxed/simple;
	bh=0/nmv0IDyjZ5YED5N+7nUqbvJbs6BmOGKiwyVONZ0o8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=itSVjXsLFMhKutSLeHIog7knEey5wB6Woc33T/eoQ8IhTWmWYKyBuL/H/QLmngIBBSsttyprMKOkoXVyf8Ugb1UfRGgzxda33pBVB+p5VCxqLs4dkA7zoWDpGNRsD/5z5toGHUjoZg5CfbIQLbUa9K4739EbzxXOMhthB82wr/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FAIfj61U; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FAIfj61U"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-649d4690088so1943511d50.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Feb 2026 07:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770218419; x=1770823219; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CSx1gFM/JJEanfUhmz6VoD8iNfqolHu5MhqxWiYgt5I=;
        b=FAIfj61UT4UQF4Gxw+XifDnRlMPLM+B43hMQ6Ze6LyL/abnMMB9mytb0RAebHMaK3J
         fTmbkuvKs/zKpi57rnCW0ElTG9XpmVlzZf+kU9wYhW/qzpnyWouYZrdEmao0YJB61bSp
         LZdOv0a1+Tb2Ux2AG6BWmC0x8mGYADn+SHKsMQ2GlNDgKm4mf+vS1h5eeTOjYTBRa9X0
         vIjGfT0HgKUyHWjEQpjn2vkp0GsCkYfmOD7q2ixeVHtEw4cG+mhGr13+ubMB26ULWohu
         PGBoOloHvfeSva9yC0H0to2bf/a10Dr+7TVDHYQZC+JLAkhGe6Q8oX7mu8lbdTx4OQb3
         /l0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770218419; x=1770823219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CSx1gFM/JJEanfUhmz6VoD8iNfqolHu5MhqxWiYgt5I=;
        b=JMedWmmiWA+J1Eq/0G7bbY3MfKkoWEmjDsTkpHRS1t+Jftr24Vq2hGbpyXa/o+H/qf
         ATadQ3KOEaKQo+PjGOTfJNb8Jv+NoIu+oU6WoQ3psNtak9O9eYuT4Ksyb8hI/wby7ApO
         mszQYvcNnsETm1XBiGR8TTcI50aj+BaA6KHeyNUpwxcWKGLiZZeJ0TlmUf3l87yllC2Y
         MemYMDXrrXu1u0Bbibl/FiZhQLbe8MBVFidz2poNiz6bWhz5LYpb/nmYFNMXwCUkJUB8
         yxBM5C93oCoL9khp9qTRlMpCR0AO5UMt27wTXSkGjCo+C/vl+fibR0R0E9IDerfEyuLN
         4VLg==
X-Forwarded-Encrypted: i=1; AJvYcCU07jxH0ZsV54hem/u/RQeHlZcb0C/pp2PYJZRqQF0YSyhLeCj5CyeQyN0VRMsmtTig6L5hoGDCuObmUMuJEt8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAsDEAMaUnWjOzIgNaBxVemC+GjKEp1VMWsYXHOTdID1epK7Q9
	NM6zXGz9DBg70D3AnMlPGL4CVFuU4GZ5pyqBIpwRYqKp3KUiMuAI6uuR
X-Gm-Gg: AZuq6aIA90ypI/qNXjptS/kc5TVliki7BcjueK5PF1ihYyvvwvcz/gv6zlDaQ2V/r0t
	hq9Kgno4dDpCd8nV25STmUYx/rKvcjSkkFGDmRnK+BOMWW0yBAM6RrTEX2w0goGmVSAQ5sb1MjP
	7pn35Lx/XJRE74XnQctkAdPZrbBIAzqbppM+8EErq+eeFRPn2aP7GfBo31/eiSStQ+HvZG4kgZ2
	fOPA8eKPCjhBeFFu/tCeP14iFUvP+JtxXvM4FFIiTEUZ+18d+Euow7BKSxwFnsYdrZiUntrWker
	oDKJQYNlJPRHeAVzZ35nEoLaKYoYwQjpmWQeo5D46Kt8Y/ZhtZ5ahK4RI7IPKtlUO2XGTMQjyHb
	fEyNt3grWNFlpeBRCJSaUc+kchILfNzjvELrrVDOgW32yg7S+Dt+/mfFRoDOM3jh3WbvUnpaHjk
	+nzwvAaCpL
X-Received: by 2002:a53:e202:0:b0:63f:c816:1169 with SMTP id 956f58d0204a3-649db49940fmr2094091d50.48.1770218418453;
        Wed, 04 Feb 2026 07:20:18 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:4a::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649dc5e4c23sm2595779d50.22.2026.02.04.07.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 07:20:17 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Wed, 04 Feb 2026 07:20:12 -0800
Subject: [PATCH net-next 8/9] selftests: drv-net: psp: lift psp connection
 setup out of _data_basic_send() testcase
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-psp-v1-8-5f034e2dfa36@gmail.com>
References: <20260204-psp-v1-0-5f034e2dfa36@gmail.com>
In-Reply-To: <20260204-psp-v1-0-5f034e2dfa36@gmail.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Donald Hunter <donald.hunter@gmail.com>, Boris Pismenny <borisp@nvidia.com>, 
 Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
 Tariq Toukan <tariqt@nvidia.com>, Mark Bloch <mbloch@nvidia.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Daniel Zahka <daniel.zahka@gmail.com>
X-Mailer: b4 0.13.0

This is a pure refactor, so that the key exchange sequence can be used
in other test cases that start with a key exchange, but might choose
to perform different tx/rx patterns afterwards.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 tools/testing/selftests/drivers/net/psp.py | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/selftests/drivers/net/psp.py
index 864d9fce1094..63dc8757ba37 100755
--- a/tools/testing/selftests/drivers/net/psp.py
+++ b/tools/testing/selftests/drivers/net/psp.py
@@ -360,10 +360,8 @@ def assoc_twice(cfg):
         s.close()
 
 
-def _data_basic_send(cfg, version, ipver):
-    """ Test basic data send """
-    _init_psp_dev(cfg)
-
+def _establish_psp_conn(cfg, version, ipver=None):
+    """Establish a PSP connection and return after key exchange"""
     # Version 0 is required by spec, don't let it skip
     if version:
         name = cfg.pspnl.consts["version"].entries_by_val[version].name
@@ -388,7 +386,14 @@ def _data_basic_send(cfg, version, ipver):
                         "version": version,
                         "tx-key": tx,
                         "sock-fd": s.fileno()})
+    return s
+
+
+def _data_basic_send(cfg, version, ipver):
+    """ Test basic data send """
+    _init_psp_dev(cfg)
 
+    s = _establish_psp_conn(cfg, version, ipver)
     data_len = _send_careful(cfg, s, 100)
     _check_data_rx(cfg, data_len)
     _close_psp_conn(cfg, s)

-- 
2.47.3

