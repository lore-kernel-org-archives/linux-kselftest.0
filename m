Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794327274;
	b=XLn1vQ88s2xriWgm+dXuR66L6bVWiid4Z5sz6zGrU4JORuq0OoddRXoprJe2mxqIe8vg
	 iUAFDERs63NAq0ntrJGVFeMeU9xwMtmoJRbPEQ0WFoeSojKiF03PlBUDX2yjECvUy6a3m
	 nKkcdjCy6rfd3SPz+1gyptioorejonaenC1bMTjJinNhQU1X3CWZXQYOjUmOK9e7gosSK
	 WpZwUuU4SmT/h4uO666FVjxWv93NpsmjA1f9+bA+i3J3Yzm//RsJysAHmKloGFwoqm6fj
	 I4I6VOtYSafQUNCkzymwSrpBgiVN6TLTrl7L7+rh9fDRLj3Z6+L4xmqLIe+o2IfTChQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794327274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=v9Q/EWwiGYuJJkjQiR3cjpmLENNTVIh5BhWTJNSgmuo=;
	b=V8+xku0XwAPTKGKTeL+f+qmYdUh0x9bVFlZ5lnkP4KU0Oaz8ZcVkUS1ZCS2baBiG7BXw
	 REHjBnDZOa5rNgwuNa2yhxqMZbgbzGqlhfoWMH0llYC3ARYEE59vjUDw/XgLWR5gSJh0I
	 zn84dr6TOMtK6Dbd5d6RlkZW5rjQOisl4ljh2AYV8hmk7QOAhntjLAdhYj4IJtJ36yAc7
	 P7oRk3IeCs6PC1JJanI0zIrFsb1hmP+71WK7TKXDzbNTSbUw0wtcVfNKUB6CZd/IDaqW6
	 552qC7lbHmhl148k3tUHKZ+N+YExsLvi1vz3PblT5phiRd4LKxt/3p79LMjKhxd6Eiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ANrbdB3G;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849DC606A33B
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 16:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 849DC606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ANrbdB3G
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5348aaba5so2356635e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 08:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794327273; x=1794932073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v9Q/EWwiGYuJJkjQiR3cjpmLENNTVIh5BhWTJNSgmuo=;
        b=ANrbdB3Go4OWSCgoHQhcZfpH3ER0+YbD7LsUE/pK48Qm5h+NUSsTOLmM3gxO9NL5lA
         ZKVKd/YHPpAq8U2GunH7+iAAl3JnyP2anpuIP5Dz8Vp25s8Wh3Nv/kFc2+0TVRX75dQl
         sFCRn9agjqsTk/OuQYnMHIMrVTOAsz+Z+AlmlCAYm9XL/H3lABFVa8SEi0jPK8tWcURN
         9uBPBA/45vdVFshrAw3AB8cZ51b3zWOOE52cRxP9OjhibwQBSqt1SmKg6SGqMPuaMyxo
         0sOtGeotvCSJxzlgrgYyzFqWTIxo11MrWjWcOKa+WyCFmC9L24N3rWc7d3x7EuEAsPLE
         85rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794327273; x=1794932073;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v9Q/EWwiGYuJJkjQiR3cjpmLENNTVIh5BhWTJNSgmuo=;
        b=WjuWeP4k7T9zufrliQQcPG2oG20/hR+FXkBRpR8xdVHBkTszYqB0BmnXRIF4NW4zz/
         3O+CDHQ6c+1UqjCaYabmbQQkZDekFxjM07bo6No+TXUw239GccFZfNg0MPUhxpJ9AY4/
         6t9qDNkDKk8N906C4BkKFrG94eh+GbygbwWeefrxxtoGVjBbR1FdrIzyDUnj60crID41
         /ISxrtfvczCNnE9kv0eywYSVaVhEUt+/tifcfXERLz0aGxehj+zOMkJJNmHVpC8POnD+
         Smyig07Qqft36+eK8QeKrL3CkWGZ5TfQqta0aFYKhN5/sIQcZ39ku04FOaQTdejaCUbK
         OcfQ==
X-Forwarded-Encrypted: i=1; AL+hErFhFK6325vCQAK+66W2vKPlCFSh2DDgk9kw5SNRDuvnidbQ0mHdv36cIu5/Nd9XYaq33mOACIZYxW/N3ZXbEQ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tEv3Xx1/LN4kCdDiCjTp3SMfG3C5ACyn2fxkfNlfIjOLCedzU
	4WrQUZaYErH/6iGxvnmn0TN5vLmhX3CmQdTU+2ybZZvKZhV62Wf/Su+a
X-Gm-Gg: AYBFou1Y9d5PokZTq7Kv9GQmaPs525XC+FU3b2xrJiAtbLcrFvV0qdlhWWKv+alS1fC
	VM3gh4pDCFXBUv3Pt3lE6StL8qvsCX4d3VKWlNBeS9arkCaW6P6ufcwq6xrH0tBEDLgkm+tAxVn
	aOc842g+1PINqw/GxV85rp91rLzCtDLVvCxv4ZJjUxkzLSp7/OenSYnSZYs+kKM9qMjxrKZgOgJ
	HMPnjZKWrueIuPvciQQQ5XfY+qN/z+5aNtbxYX6vmG2lYGkwqzZLWE2qaLeNLGiA0uGtL+c8C5Y
	IieYWSOLfusPgdXvbNEamgsrhYKmP/N5JGcupmyKqqPyVQakTIWk+r6zNgNkMFvaeqORV4bEwKB
	oX7ujR6tz6bgk8ih8StLnpPtOB1/HwdelcI02T4z+5olKmW0EHLUaWGJqu814m37+P1DbIIzcr1
	w9BQKGFpU/VCUycnIO7A9SPwoc4wL67xhnZ+m/1udPk1ZFoviYBsA8Coq9WcaaFP1LRoDCnYAHC
	mOy2DQEhTktygwGjDOBV7WPOGBSJGQpoK3gfmP3dqAzRnadHU+8Gr/S9oD6Tgq8k+YBC+h98o/t
	alULZCu31SdVA5u9vKuyRKr9OFt8InQbEH84gV65t9lPg0uf4/hmcp0WDRwCd0FuMmvB+lq7
X-Received: by 2002:a05:600c:4812:b0:4a2:417:7db5 with SMTP id 5b1f17b1804b1-4ba0233982cmr34471415e9.2.1794327272780;
        Tue, 10 Nov 2026 08:14:32 -0800 (PST)
Received: from localhost.localdomain ([95.183.147.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0235ef62sm46825525e9.2.2026.11.10.08.14.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 08:14:32 -0800 (PST)
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
Subject: [PATCH net v2 1/2] selftests: drv-net: ring_reconfig: handle devices without channel config
Date: Tue, 10 Nov 2026 19:14:22 +0300
Message-ID: <20261110161423.77910-2-ahmetbilalyazicioglu@gmail.com>
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

Drivers which don't implement the ethtool get_channels op (e.g.
e1000e) make ETHTOOL_MSG_CHANNELS_GET fail with -EOPNOTSUPP, and
drivers which implement get_channels but not set_channels (e.g.
vmxnet3, r8169) make ETHTOOL_MSG_CHANNELS_SET fail the same way. YNL
raises that as an NlError, so ring_reconfig reports failures on such
devices:

 - channels() fails on its first channels_get call or, if the device
   can't change channels, when restoring the original counts;
 - ringparam() fails in _configure_min_ring_cnt() before any ring
   size is tested. The helper only reduces the channel count to
   speed up the reconfiguration, ringparam() does not depend on it.

Skip channels() when the channel query is not supported, or when every
channel layout it tries is rejected with -EOPNOTSUPP; nothing was
changed in that case, so the restore is dropped. Return early from
_configure_min_ring_cnt() when the channel count can't be queried or
changed, logging that it was left unchanged. Other netlink errors are
still reported as failures.

The issue was found through AI-assisted source code analysis
(OpenAI Codex) and confirmed on a ThinkPad T480 with an Intel I219-V
(e1000e, 8086:15d8): "ethtool -l" fails with "Operation not
supported" while "ethtool -g" works, and running the test functions
with the in-tree YNL library against the device fails with NlError
95 (EOPNOTSUPP). The get_channels-only case was reported by the
Sashiko AI review of v1.

No remote endpoint was available, so the full test was not run. On
the same machine, an earlier version of this patch with the same
channel query handling was run under ksft_run with a stub
environment and all ethtool set requests blocked: channels() was
skipped and _configure_min_ring_cnt() returned after the channel
query. The handling of a rejected channel change, and devices which
support changing channels, were only checked against an emulated
ethtool family.

Fixes: ecca75ae5ae6 ("selftests: drv-net: replace the nsim ring test with a drv-net one")
Signed-off-by: Bilal Yazıcıoğlu <ahmetbilalyazicioglu@gmail.com>
---

Notes:
    Note, not part of this fix: with this patch ringparam() gets past
    _configure_min_ring_cnt() on e1000e and reaches the ring size loop.
    e1000e clamps ring sizes below 64 instead of rejecting them, so the
    check that the requested minimum was applied is expected to fail on
    that driver. I could not run that part (it needs a remote endpoint),
    and whether the test or the driver should change is a separate
    question.

 .../selftests/drivers/net/ring_reconfig.py    | 45 +++++++++++++++++--
 1 file changed, 41 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/ring_reconfig.py b/tools/testing/selftests/drivers/net/ring_reconfig.py
index 6682d4badfb..c7491154d1d 100755
--- a/tools/testing/selftests/drivers/net/ring_reconfig.py
+++ b/tools/testing/selftests/drivers/net/ring_reconfig.py
@@ -5,6 +5,7 @@
 Test channel and ring size configuration via ethtool (-L / -G).
 """
 
+import errno
 import socket
 import struct
 import time
@@ -26,6 +27,16 @@ MIN_TX_RING = 32
 MAX_TX_RING = 1024
 
 
+def _channels_get_or_skip(cfg, ehdr):
+    """ Get the channel config, skip the test if the device has none. """
+    try:
+        return cfg.eth.channels_get(ehdr)
+    except NlError as e:
+        if e.error == errno.EOPNOTSUPP:
+            raise KsftSkipEx("device does not support channel config") from e
+        raise
+
+
 def channels(cfg) -> None:
     """
     Twiddle channel counts in various combinations of parameters.
@@ -33,7 +44,7 @@ def channels(cfg) -> None:
     if the config is accepted and crashes.
     """
     ehdr = {'header':{'dev-index': cfg.ifindex}}
-    chans = cfg.eth.channels_get(ehdr)
+    chans = _channels_get_or_skip(cfg, ehdr)
 
     all_keys = ["rx", "tx", "combined"]
     mixes = [{"combined"}, {"rx", "tx"}, {"rx", "combined"}, {"tx", "combined"},
@@ -47,21 +58,26 @@ def channels(cfg) -> None:
             supported.add(key)
             restore |= {key + "-count": chans[key + "-count"]}
 
-    defer(cfg.eth.channels_set, ehdr | restore)
+    restore_chans = defer(cfg.eth.channels_set, ehdr | restore)
 
     def test_config(config):
+        applied = False
         try:
             cfg.eth.channels_set(ehdr | config)
+            applied = True
             get = cfg.eth.channels_get(ehdr)
             for k, v in config.items():
                 ksft_eq(get.get(k, 0), v)
         except NlError as e:
             failed.append(mix)
+            if e.error == errno.EOPNOTSUPP and not applied:
+                unsupported.append(mix)
             ksft_pr("Can't set", config, e)
         else:
             ksft_pr("Okay", config)
 
     failed = []
+    unsupported = []
     for mix in mixes:
         if not mix.issubset(supported):
             continue
@@ -72,6 +88,13 @@ def channels(cfg) -> None:
             config[key + "-count"] = 1 if key in mix else 0
         test_config(config)
 
+    # Every config was rejected as unsupported, so nothing was changed:
+    # the device reports channels but can't change them
+    attempted = [m for m in mixes if m.issubset(supported)]
+    if attempted and unsupported == attempted:
+        restore_chans.cancel()
+        raise KsftSkipEx("device does not support changing channels")
+
     for mix in mixes:
         if not mix.issubset(supported):
             continue
@@ -88,7 +111,14 @@ def channels(cfg) -> None:
 def _configure_min_ring_cnt(cfg) -> None:
     """ Try to configure a single Rx/Tx ring. """
     ehdr = {'header':{'dev-index': cfg.ifindex}}
-    chans = cfg.eth.channels_get(ehdr)
+    try:
+        chans = cfg.eth.channels_get(ehdr)
+    except NlError as e:
+        # Reducing the channel count is only an optimization
+        if e.error == errno.EOPNOTSUPP:
+            ksft_pr("Channel configuration unsupported; continuing ring test")
+            return
+        raise
 
     all_keys = ["rx-count", "tx-count", "combined-count"]
     restore = {}
@@ -107,7 +137,14 @@ def _configure_min_ring_cnt(cfg) -> None:
         # looks like we're already on 1 channel
         return
 
-    cfg.eth.channels_set(ehdr | config)
+    try:
+        cfg.eth.channels_set(ehdr | config)
+    except NlError as e:
+        # Some drivers report channels but can't change them
+        if e.error == errno.EOPNOTSUPP:
+            ksft_pr("Channel configuration unsupported; continuing ring test")
+            return
+        raise
     defer(cfg.eth.channels_set, ehdr | restore)
 
 
-- 
2.56.0

