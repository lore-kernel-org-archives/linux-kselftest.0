Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECE53C10B2
	for <linux-kselftest@vger.kernel.org>; Wed,  5 Aug 2026 03:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785899392; cv=none; b=KJ3vMTl8AIUMZmYiIgI2rbFtH9JsxREh78dHtxXLOvW5xSQcQfJzFD3GYNV/aHFOky/XzfaYDM2+TBp3ocRHw57GFAJc5vEfUiNmmc6wei1UhdWMC4liopUWBpeNvpAr6nGcVnF37b5MOIiY7HCn+TciCIo9t0wZUAbZqb8O9XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785899392; c=relaxed/simple;
	bh=XRFbGwBPH+VhcUUJQun7WEUilFRIAXetdV49cKT2ZsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k/zuseh+RQMGOXNS89zHV1uuSr7M+f4VL13EgH5ut0hzLksv6X8VuTNT6cQTv5lYpE0cLUY2b1tQyovoTysCUUqhnBjmbl/rbFYj91iUtGdmmExHB9qnBoHv9Vuv5+pNNaIUIZ7WmLb6g0tZDl0QoJhr9VXdZS1wLko2SV+pkcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a02UEEks; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a02UEEks"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6ae4475c68aso193662eaf.2
        for <linux-kselftest@vger.kernel.org>; Tue, 04 Aug 2026 20:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785899388; x=1786504188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kHy5sGAOZy1JqOYJk5ores2aowoHjNjgJFZMFnGPHyE=;
        b=a02UEEksFWf7VoDG6peKCswahEDu+Wxlm73XYa/rya/kgotgyu+48nd4LcTn+5fHAg
         3QeQTwesRn+/azVHmspQsD4sX7qYmsHxrfBYO6AgmCt4SzJxzRX8zy4rldbFkrqpMao3
         Z+ledxb8IW+POtEO6Mq7PXPsAfChCzGc3oTpadsAcdHT4MtUXpHvi+6w47uTB+8Ll87g
         pIC9H0dsABLeGdL7VuKrtis5dcygVumpQNuJbcirb1KaV0s6J9V3QTr8DxVZh1hnyWic
         CKBI4XaCs7Pn+2FFR4wNLnYh0Oad+Xwg02MFJ662PcuMflD+CbCa9QmI1daY5lC4w5Ta
         Dl6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785899388; x=1786504188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kHy5sGAOZy1JqOYJk5ores2aowoHjNjgJFZMFnGPHyE=;
        b=l+FQwwITwLpovkjCAF/Wr0jrvz9Ic/Jkm2AD6E8ezw6S7Tq3iecrPGvuA7ykmBof3x
         zO4F9vzi9XklY75EnpGmM7veIoJNHmJs0q7pN01riPx+L5FpcbR0loC5TYD4Hjas2XS7
         3j964hDSsTgVJ93GtDmkzKwJReerCHvgUPf90f6EOKjU31S9E5PFW/lJipJeY+aGCGF7
         989eG7Y2V35PUhHsbuWlkdOnFihaRPCdlsxq78pkdZt1DOedLE1kkG2EViA+JivXLX1M
         rNEm4HdbOWd/gruoHztyKhey8Iun00yZyhBwYt44jPcUjSfSfcln3JceU6LH84t65ezG
         JQaQ==
X-Forwarded-Encrypted: i=1; AHgh+RqbLykMZP9ospkERecZM0BqEjrnduXOCubmzCg/YnYytFA3pJQKq/BrHOpaqvk0KuucbaQU5sQgcXuJeUmpCbE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFS1lU/FGhEUC++ZWVfxpyNbtRa4BNimwMFv1K4f/LRXAk87tQ
	MTP7PYU5qO2oGCn77e1ddRP2GpSTIfxSu57uVxie67e6OCLiQWAdx5qE
X-Gm-Gg: AR+sD12J4abmUMIktbtf7YN4nmn9b62EmjL3xo6lCxGuXPfnuohLpFneJ/FEntpMf40
	lN9fmJaVx4P7fv+dVitliusBYFR/Nhz6vMCElllnxR3QlgFbBvH3jERPf02fWpE2wBL/zyWWLvh
	7pthj14vffTwKdThyO60r6XxENHJjamUM0MQdgjW5ePI0GiLAfJyotHQbFoollMT2xoxu/nrGU2
	Hl1rxhxs8zDXg1S/HfCk7hdKMag3WmjQVbA38We5nyazxUvCFOdc7VZCnM0YkojwzgDiZc2Dpp7
	nYXBGQM3xQJCwRrfYlKpW62tAfIu174lvsQhmDD3/Q4siNAcVQ/+QBTcJ1gvZw6+OBpREnytkFM
	lYEXCxlRDpPjionoxxWOrmY7oc4TOWwkodLXFGCv0wJtqQ0QQd5fWCdIdkxNlcqBCIgFteccusO
	m5H1xDXMzdAIuPRQGwJyPZOlqJ61usMrYAj8dzbRp2eYIGbplgjvX54QL/OQ==
X-Received: by 2002:a05:6820:f012:b0:6ae:87e3:e306 with SMTP id 006d021491bc7-6ae96ecc5e5mr1905385eaf.20.1785899388158;
        Tue, 04 Aug 2026 20:09:48 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff:46::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f1df5a4f9bsm2087653a34.23.2026.08.04.20.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 20:09:47 -0700 (PDT)
From: Mohsin Bashir <mohsin.bashr@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	alexander.duyck@gmail.com
Subject: [PATCH net-next 03/14] selftests: net: shaper: Decouple basic_groups from netdev rate limiting
Date: Tue,  4 Aug 2026 20:09:25 -0700
Message-ID: <20260805030936.1092907-4-mohsin.bashr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260805030936.1092907-1-mohsin.bashr@gmail.com>
References: <20260805030936.1092907-1-mohsin.bashr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mohsin Bashir <hmohsin@meta.com>

Decouple basic_groups from the set_nshapers test dependency. The
test was gated on cfg.netdev which is set by set_nshapers. Replace
with direct capability checks: netdev scope support (required for
grouping under netdev handle) and queue scope nesting + weight.

Remove bw-max and metric from the .group call so the test validates
pure queue grouping without rate limiting. The rate-limited variant is
restored in the following patch, which adds a dedicated
basic_groups_with_rate test.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Mohsin Bashir <hmohsin@meta.com>
---
 tools/testing/selftests/drivers/net/shaper.py | 40 ++++++++-----------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/shaper.py b/tools/testing/selftests/drivers/net/shaper.py
index 1954f3263f25..45a4bf42995e 100755
--- a/tools/testing/selftests/drivers/net/shaper.py
+++ b/tools/testing/selftests/drivers/net/shaper.py
@@ -168,19 +168,11 @@ def del_nshapers(cfg, nl_shaper) -> None:
     ksft_eq(len(shapers), 0)
 
 def basic_groups(cfg, nl_shaper) -> None:
-    if not cfg.netdev:
-        raise KsftSkipEx("netdev shaper not supported by the device")
     _require_queues(cfg, 3)
 
-    try:
-        caps = nl_shaper.cap_get({'ifindex': cfg.ifindex,
-                                  'scope':'queue'})
-    except NlError as e:
-        if e.error == 95:
-            raise KsftSkipEx("shapers not supported by the device")
-        raise
-    if not 'support-weight' in caps:
-        raise KsftSkipEx("device does not support queue scope shapers with weight")
+    _require_caps(cfg, nl_shaper, 'netdev', [], "netdev scope not supported by the device")
+    _require_caps(cfg, nl_shaper, 'queue', ['support-nesting', 'support-weight'],
+                  "queue scope not supported with nesting and weight")
 
     node_handle = nl_shaper.group({
                         'ifindex': cfg.ifindex,
@@ -188,31 +180,31 @@ def basic_groups(cfg, nl_shaper) -> None:
                                    'weight': 1},
                                   {'handle': {'scope': 'queue', 'id': 2},
                                    'weight': 2}],
-                         'handle': {'scope':'netdev'},
-                         'metric': 'bps',
-                         'bw-max': 10000})
+                         'handle': {'scope':'netdev'}})
     ksft_eq(node_handle, {'ifindex': cfg.ifindex,
                           'handle': {'scope': 'netdev'}})
 
+    del_node = defer(_delete_shaper, cfg, nl_shaper, {'scope': 'netdev'})
+    del_queues = [defer(_delete_shaper, cfg, nl_shaper,
+                        {'scope': 'queue', 'id': qid})
+                  for qid in (1, 2)]
+
     shaper = nl_shaper.get({'ifindex': cfg.ifindex,
                             'handle': {'scope': 'queue', 'id': 1}})
     ksft_eq(shaper, {'ifindex': cfg.ifindex,
                      'parent': {'scope': 'netdev'},
                      'handle': {'scope': 'queue', 'id': 1},
                      'weight': 1 })
+    for dq in del_queues:
+        dq.exec()
 
-    nl_shaper.delete({'ifindex': cfg.ifindex,
-                      'handle': {'scope': 'queue', 'id': 2}})
-    nl_shaper.delete({'ifindex': cfg.ifindex,
-                      'handle': {'scope': 'queue', 'id': 1}})
-
-    # Deleting all the leaves shaper does not affect the node one
-    # when the latter has 'netdev' scope.
     shapers = nl_shaper.get({'ifindex': cfg.ifindex}, dump=True)
-    ksft_eq(len(shapers), 1)
+    ksft_eq(shapers, [{'ifindex': cfg.ifindex,
+                       'handle': {'scope': 'netdev'}}])
 
-    nl_shaper.delete({'ifindex': cfg.ifindex,
-                      'handle': {'scope': 'netdev'}})
+    del_node.exec()
+    shapers = nl_shaper.get({'ifindex': cfg.ifindex}, dump=True)
+    ksft_eq(len(shapers), 0)
 
 def qgroups(cfg, nl_shaper) -> None:
     _require_queues(cfg, 4)
-- 
2.53.0-Meta

