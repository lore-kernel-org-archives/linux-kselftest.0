Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6658B34AB19
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 22:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771973225; cv=none; b=jNBaR6TI4QZiLO7Skor/DIOFqTw6Lh7CZ/QHMOCqahGBk8hTiHOXaMlOto/5RweHVO1ZoUURPSpbKDOIigg4siLoNJ+rnNkmrtaDp0QTEosgi3Ydvr5L0My2DG1GTDpWM5gTrakGG6CWr7CtUhpmJJ9xFAZjrsaom0Yekslzc38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771973225; c=relaxed/simple;
	bh=/tw21Vut8zaBzWz0mRW54oOqpRQBfU4CqKnZ0Ydz0t4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L7mJa4GGFBF8I3oMioZL+jHyEvNdEPcGXSKqf6lkykl9+NAZwy3UTF0chY6eON3YlhlKmkVl+vpmQyZzqQ1wWovlgtnlUWjgSwys9eSQaSvd/T7WlhpOheTxvnTfn6sWsoVp0UpvTI3y9WJgoWUUvq6LlngwMyp6zlUsQA+lORA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D8FMCWox; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D8FMCWox"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-66f3e7d9eccso3446243eaf.1
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 14:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771973223; x=1772578023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKkhc4BD4XEPfl/FTpjBpxdNdc/bH+oIOhQJYr5AIbA=;
        b=D8FMCWoxcryrvvJzpoCeZbaEtJR5ixd2I2vUWiWPiFQ5d/aCWPrYYwrAsFdRQv9pQl
         +f4GIsmwPjG+c9bGpabOEzXx93816Jsh1uAIQKnfoeqiTKO/y6RtYJUwRwhGak1/5IkA
         BFdFLmgcaPDezKkqprGdJWyvE59MMfXD0dFgsMaa47XCLsxiCOVuvarfiGd4aEXzBK2k
         PMKkHliaJJHsoYc1Huf9lKk42W+lgi7EnbNS3z+B3q7JkKiUTX6E269bmQjKUvQ2pfrw
         yVh/gwSRD8eyfV1hPmVOwVQSjNlJAZpnf8A7jk46YejXs7Iq5JjusmmYZDdh0P5W0uGe
         jlBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771973223; x=1772578023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aKkhc4BD4XEPfl/FTpjBpxdNdc/bH+oIOhQJYr5AIbA=;
        b=Sk+wh4/aruJzkYqzaUXGuo3ntJ2VUmKSiwGI8+rqTC/gGnard3i+PUrrA5N4xkcjbk
         gYDtF7cmWpdKyvmYPzitwVAYCkzyS20g4hrERtdmql4a3kh4NYaN2SXYehGFg0Y7AObc
         vZzjqncPyLpmx5NkUdIl2DkaXdbMRz6wIUiNuHwaMLQV4zxp+XH08dgCUQIsx1FS7HUd
         LjmVWyced/eXidf7MSKouhOVHNaiEXDsXznVBEc0J1+uAGJnaWSAT98MHXOzYoJkG1hH
         VdHtMwJdtgdgQGP1UHnD1jsmRnVdCQbj5JTxaAb/XqBLOivsQSvlkdBrg5EcdKX4v80y
         +0kw==
X-Forwarded-Encrypted: i=1; AJvYcCWWIanErNFw29xjSY/z5bVwyUOoHAw8KRbUoViyl2yd07ygATIMxPoTwNNw0r+2sBm0heBR3Xi+TlqG3Knhexk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnFq/zTfPWOER9dHl9S58ZD3xu7IyNYtrh3qQlmWYKGct31mzI
	5Uu7bouZ7E5Fh80U6OHsLA1A524QvaGjSJk5lVMLhZWstxGu/1qmao06
X-Gm-Gg: AZuq6aIvWuPak5Vu8TQipDMEbvmnU0ok2dgqGbXn9rFxzed1pEv79+i1gV9GuTaNDe4
	p9vEDk7hzXHmeias0xpncWXqSaxDbbwUT/LjtLvENbsREFZXDBiMlxh3Q6YhSkTdaGZuBSwGkjV
	znKOPcDQbhIc+lEsx+KYfJxyWaVj5lXU8L/PuNIV0MbqetpS5ee/kR5PBDSwGEwYeh2F03S+pkh
	tVuaZtdWPCakO5zr9sPyK30SCZntI5x1jHDmPsayLGldwdBD9vwMnStfBuPK2Gn2BlOVPiGemnO
	1udb/B1dCtnYf8rKfWSRnzN1fKQSWRMULC9y3nUdUFZIqPEgdwDS4c00a5tzbKKszHgtsZ8jM7h
	bIOygTppqSgVsBxeP12Osi0DLi0jfiOmaiHxgnA0tYm85XnJdY1dsLaqDzBQFjA==
X-Received: by 2002:a05:6820:828:b0:677:a19a:55f with SMTP id 006d021491bc7-679c46432f3mr6818336eaf.63.1771973223411;
        Tue, 24 Feb 2026 14:47:03 -0800 (PST)
Received: from localhost ([2a03:2880:12ff:4::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679c56dbde9sm9532514eaf.11.2026.02.24.14.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 14:47:02 -0800 (PST)
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
Subject: [PATCH net-next 2/2] selftests: drv-net: rss: Generate unique ports for RSS context tests
Date: Tue, 24 Feb 2026 14:46:59 -0800
Message-ID: <20260224224659.1507082-3-dimitri.daskalakis1@gmail.com>
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

The RSS ctx tests rely on NFC rules with unique ports to steer packets
to the correct ctx. This updates the test to use the new rand_ports()
helper to guarantee the ports are unique.

Manual testing shows that generating 32 ports with the existing method
would result in at least one duplicate 4% of the time.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
---
 tools/testing/selftests/drivers/net/hw/rss_ctx.py | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/rss_ctx.py b/tools/testing/selftests/drivers/net/hw/rss_ctx.py
index ed7e405682f0..cbeb3a38fdfe 100755
--- a/tools/testing/selftests/drivers/net/hw/rss_ctx.py
+++ b/tools/testing/selftests/drivers/net/hw/rss_ctx.py
@@ -9,7 +9,7 @@ from lib.py import ksft_eq, ksft_ne, ksft_ge, ksft_in, ksft_lt, ksft_true, ksft_
 from lib.py import NetDrvEpEnv
 from lib.py import EthtoolFamily, NetdevFamily
 from lib.py import KsftSkipEx, KsftFailEx
-from lib.py import rand_port
+from lib.py import rand_port, rand_ports
 from lib.py import ethtool, ip, defer, GenerateTraffic, CmdExitFailure
 
 
@@ -452,7 +452,7 @@ def test_rss_context(cfg, ctx_cnt=1, create_with_cfg=None):
         except:
             raise KsftSkipEx("Not enough queues for the test")
 
-    ports = []
+    ports = rand_ports(ctx_cnt)
 
     # Use queues 0 and 1 for normal traffic
     ethtool(f"-X {cfg.ifname} equal 2")
@@ -486,7 +486,6 @@ def test_rss_context(cfg, ctx_cnt=1, create_with_cfg=None):
         ksft_eq(min(data['rss-indirection-table']), 2 + i * 2, "Unexpected context cfg: " + str(data))
         ksft_eq(max(data['rss-indirection-table']), 2 + i * 2 + 1, "Unexpected context cfg: " + str(data))
 
-        ports.append(rand_port())
         flow = f"flow-type tcp{cfg.addr_ipver} dst-ip {cfg.addr} dst-port {ports[i]} context {ctx_id}"
         ntuple = ethtool_create(cfg, "-N", flow)
         defer(ethtool, f"-N {cfg.ifname} delete {ntuple}")
@@ -542,7 +541,7 @@ def test_rss_context_out_of_order(cfg, ctx_cnt=4):
 
     ntuple = []
     ctx = []
-    ports = []
+    ports = rand_ports(ctx_cnt)
 
     def remove_ctx(idx):
         ntuple[idx].exec()
@@ -574,7 +573,6 @@ def test_rss_context_out_of_order(cfg, ctx_cnt=4):
         ctx_id = ethtool_create(cfg, "-X", f"context new start {2 + i * 2} equal 2")
         ctx.append(defer(ethtool, f"-X {cfg.ifname} context {ctx_id} delete"))
 
-        ports.append(rand_port())
         flow = f"flow-type tcp{cfg.addr_ipver} dst-ip {cfg.addr} dst-port {ports[i]} context {ctx_id}"
         ntuple_id = ethtool_create(cfg, "-N", flow)
         ntuple.append(defer(ethtool, f"-N {cfg.ifname} delete {ntuple_id}"))
@@ -788,9 +786,10 @@ def test_rss_default_context_rule(cfg):
     ethtool(f"-N {cfg.ifname} {flow_generic}")
     defer(ethtool, f"-N {cfg.ifname} delete 1")
 
+    ports = rand_ports(2)
     # Specific high-priority rule for a random port that should stay on context 0.
     # Assign loc 0 so it is evaluated before the generic rule.
-    port_main = rand_port()
+    port_main = ports[0]
     flow_main = f"flow-type tcp{cfg.addr_ipver} dst-ip {cfg.addr} dst-port {port_main} context 0 loc 0"
     ethtool(f"-N {cfg.ifname} {flow_main}")
     defer(ethtool, f"-N {cfg.ifname} delete 0")
@@ -803,7 +802,7 @@ def test_rss_default_context_rule(cfg):
                           'empty' : (2, 3) })
 
     # And that traffic for any other port is steered to the new context
-    port_other = rand_port()
+    port_other = ports[1]
     _send_traffic_check(cfg, port_other, f"context {ctx_id}",
                         { 'target': (2, 3),
                           'noise' : (0, 1) })
-- 
2.47.3

