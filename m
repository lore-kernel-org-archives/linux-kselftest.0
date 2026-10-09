Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590683E6396
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 20:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791578839; cv=none; b=O/LvB9z1KPYK+xfjXf2EfGlMjYukFc1lkPV1I4Ofr4eJsuWyLZMahlmsYO5qALKywAQ09p063Qi/THjdEMXO0zbq21rZA4AHNb4d3/2Tz52c3G8KZ8vcBKmIy9YG9oRqkO/24Jx4/YGhac5zCnnAqakYXCfsiUyXP8eNvC/NLS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791578839; c=relaxed/simple;
	bh=LBwl+SzL4uAe4dJCVrnFKcpS3FQeoy1u1iGROM2mTIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BUmu8schO3EksRjTKMUK6nqMFs1/VdvD3w4pr70lGNA/yUpKpPxeeutVa5cpsk3SqzGIj083aH496oUpEWQVtJa37Qnt/R6zmcQP9EuO3qL3d5mf6o22DbQJjFAhOLb22PhGcTO/MwnvV2ypa7lh+UHrnpSfKfSvgaB1/u22eVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UNtxPOLJ; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UNtxPOLJ"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-822ddb835fbso175744a34.0
        for <linux-kselftest@vger.kernel.org>; Fri, 09 Oct 2026 13:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791578836; x=1792183636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rkPDFYijzQZJ2NGaKP+B4N2cwOmAwTIMH1IeAG6Lc2Y=;
        b=UNtxPOLJZfM0oJ4th9IJfabEiQJssKNwXnM3t/hCUDh22zqDfLVndDrhHLG/10NcmD
         4Ob2slwhVQKkfjayiGwtEL2vEoGvgkXlLLqWoAI5NnQnDu96Y/cLLCR1v3Dy6wbBcrPq
         ol4wap2uwpOWNqCOE2VBc10d/u6e9SWLZdKVeve1TVUIaBCWgSY0CAK09afrM7S83sme
         ttO9s0tEai6PfSxRSCSJQmvBinAWLmgviWClXWoGhAU/kkWPWvlrHTZoE5aomLSbBrDa
         1PnkL+Yg7jem0btdlGq4CsaZ103wSAz3k/3CZtBz5AIrDW6oEnmnTIJT7rlX61RKicq0
         sRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791578836; x=1792183636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rkPDFYijzQZJ2NGaKP+B4N2cwOmAwTIMH1IeAG6Lc2Y=;
        b=BzG9ykyYl8N7hEx75hCzXRwKf4hhZu+mbtnglWo0ZaX+eP75LybJi9YFhK2NzIaQrQ
         /6MuQ+b8sx4zmgbYgDNdhGgkd7762HF5P0LkjoANCoD/fAdXitet7eLRYCPXfQxs6KTy
         7sB53IAogfNS5GOkOHz3opuXs2vl802GilNGAHSTN5k9/6Zl4tSY4nxVFXwhjOLXXubX
         GRf5bVySrIeU2sbkZzNk5K0bRKsayjsTaufxuadTfl8EDipdMsGtpL8fjPUdEHHQV4mL
         0Iq6LLttlBwEdeub3aMXB7ckihnS09p1ZuImxdoBUiXYz9x6T94ssNmFLbLxE30vaBIe
         tMXg==
X-Forwarded-Encrypted: i=1; AKwUvBwq0aMH3ITOdJ5KNvkMP4r41bX1bx+V4psmgfRVTcH4tTR2VGZFnetHPizFUNhY+BWdlp4JxY09KUVy3X6WZio=@vger.kernel.org
X-Gm-Message-State: AFuF++nlMjTE4wb4M5IqwlzdFaVxZ2v01w8ksi4d4KKZL736gcZlQjzB
	hlJQDNOt3e+/zLvYIHE9Z/DXxnYWpzUifx+71Scs3xd+978uqDDZVq1I
X-Gm-Gg: AYBFou0JMGKYCH2TKKm7K7QV6IpSCIlQ78l5mO5CyqgejONeEiYPAICHf+uD07JsMe+
	weNzKTJFlw9zZ/EOsLuDAobdKRg2U133qk0EL7vWF+6hbOyn0eRMIa+jnp3Hjr2rEntYZFJ3zSj
	pcO8TiQOJEMU7eVniAjsQuuY186dDfsL2QdSJZrNVXkxx5fW+bLZyT1afsUFBRvw5dLCXd2FItN
	LKsI0emAMqm0WbU9j8bx82Rp2395nUrGd8m5n1tIeaXJNstn+xms0Xy+s4k5hJZNpNp3ODZ0KUa
	C9LYkf6ZmFdGFNQHZp3i94UKKVH8a/DQlkU977sHeUM42rXMfzopS4+LYQySPM1VuUWmdkK7RiW
	bb5Cxf173S1PYr+lg6R7VKh2WgQlIsHQd6HOf0BGUGBzbR97MW7XWX9Tf+yU6IS5dGVV6X4mtDk
	uX3DDRD8YegNMYjM11lQr+j57k2mbFaYHo+0FWHQJaBev9DQaRbUWvvAFcyh/sPHjaJZw=
X-Received: by 2002:a05:6830:6d45:b0:822:978:f7bd with SMTP id 46e09a7af769-8309815eac7mr2560571a34.28.1791578836162;
        Fri, 09 Oct 2026 13:47:16 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:8::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-830385ba23csm2799922a34.7.2026.10.09.13.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 13:47:15 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Fri, 09 Oct 2026 13:46:47 -0700
Subject: [PATCH net-next v2 7/7] selftests: drv-net: psp: add a tx rekey
 drain test for SADB drivers
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-psp-v2-7-5596ab50f677@gmail.com>
References: <20261009-psp-v2-0-5596ab50f677@gmail.com>
In-Reply-To: <20261009-psp-v2-0-5596ab50f677@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.13.0

Drivers that export the tx-key-count stat, should drain queued tx key
deletions in a timely manner.

Add a test that performs multiple tx rekeys on a connection and waits
to make sure tx-key-count returns to pre-rekey level.

There is a bit of noise in tx-key-count due to stale timewait sockets
from prior tests. If these sockets die between the initial and final
readings, it could only serve to cover up for a queued key deletion
that is not actually drained, so the test should not flake, but may
fail to detect an actual driver bug.

This test will likely not work if other processes on the system are
using psp on the DUT, because then the tx-key-count will be completely
unrelated to what we are doing in our tests.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 tools/testing/selftests/drivers/net/psp.py | 38 +++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/selftests/drivers/net/psp.py
index af67c9e8c40f..b22891b7f5ce 100755
--- a/tools/testing/selftests/drivers/net/psp.py
+++ b/tools/testing/selftests/drivers/net/psp.py
@@ -15,7 +15,7 @@ from contextlib import contextmanager
 
 from lib.py import defer
 from lib.py import ksft_run, ksft_exit, ksft_pr
-from lib.py import ksft_true, ksft_eq, ksft_ne, ksft_gt, ksft_raises
+from lib.py import ksft_true, ksft_eq, ksft_ne, ksft_ge, ksft_gt, ksft_raises
 from lib.py import ksft_not_none
 from lib.py import ksft_variants, KsftNamedVariant
 from lib.py import KsftSkipEx, KsftFailEx
@@ -30,6 +30,8 @@ TCP_ULP = 31
 
 _PSP_MAX_KEY_LEN = 32
 _PSP_ASSOC_MSG = f'!IB3x{_PSP_MAX_KEY_LEN}s'
+_TX_REKEY_ROUNDS = 20
+_TX_KEY_DRAIN_TIMEOUT = 5
 
 
 def _get_outq(s):
@@ -202,6 +204,19 @@ def _require_version(cfg, version):
 def _get_stat(cfg, key):
     return cfg.pspnl.get_stats({'dev-id': cfg.psp_dev_id})[key]
 
+
+def _get_tx_key_count(cfg):
+    return cfg.pspnl.get_stats({'dev-id': cfg.psp_dev_id}).get('tx-key-count')
+
+
+def _wait_tx_key_drain(cfg, base):
+    cnt = _get_tx_key_count(cfg)
+    end = time.monotonic() + _TX_KEY_DRAIN_TIMEOUT
+    while cnt > base and time.monotonic() < end:
+        time.sleep(0.1)
+        cnt = _get_tx_key_count(cfg)
+    ksft_ge(base, cnt, comment="tx keys not removed from device after rekey")
+
 #
 # Test case boiler plate
 #
@@ -730,6 +745,27 @@ def rekey_tx_basic(cfg, version):
         _close_psp_conn(cfg, s)
 
 
+def rekey_tx_drain(cfg):
+    """Test that Tx rekeys do not leak keys on the device"""
+    _init_psp_dev(cfg)
+
+    if _get_tx_key_count(cfg) is None:
+        raise KsftSkipEx("Device does not track Tx keys")
+
+    s = _establish_psp_conn(cfg, 0)
+    try:
+        data_len = _psp_txrx(cfg, s, 1)
+        base = _get_tx_key_count(cfg)
+
+        for _ in range(_TX_REKEY_ROUNDS):
+            _remote_key_rotate(cfg)
+            data_len = _rekey_tx(cfg, s, data_len)
+
+        _wait_tx_key_drain(cfg, base)
+    finally:
+        _close_psp_conn(cfg, s)
+
+
 @ksft_variants(_get_psp_ver_variants())
 def rekey_both_sides(cfg, version):
     """Test rekeying both directions"""

-- 
2.52.0

