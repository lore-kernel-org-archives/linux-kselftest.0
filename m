Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008783CCFAC
	for <linux-kselftest@vger.kernel.org>; Wed,  5 Aug 2026 03:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785899405; cv=none; b=TLint72m9eOnmvuVsVPfptl2FndN8f9lykd9GcpC4LhbC50ZkPriYz6bbIMmZxOvN40y2j75zHCYaxqI9ngc7Z2y6E0rkiO6XsSSI42+pmr2eCjbp6bhOzmB1/USEGAEtZdrxPFd7OoaZX1zl8T/3UAT93md+mwkR8hrJAisWz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785899405; c=relaxed/simple;
	bh=tLELQpHtU/0IDXoPocx7/QH5OaArIrW/4on7sRVtSdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I1SJ4YjNEsd5BhTlgU08TC9hp+3gSMSwoPnbld+q7n2y0ULgy1PpXQ/pGGefeG4hLXHe8xz851j92iDmWSDGHZgSKvIehSqFADrTtcZbJzhdXg1mVN183UuD4EEMpkPZmc5OuMR7hldizqDqyh8yyitKDu02Z6OY29xk9bVCZ3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oy5fcAKl; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oy5fcAKl"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4a45b3f0becso342694b6e.1
        for <linux-kselftest@vger.kernel.org>; Tue, 04 Aug 2026 20:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785899403; x=1786504203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xek4/jAvqHeG34Edizig0yMhAwZJCf3f9l9B7GvH4hQ=;
        b=oy5fcAKlHORXfl9svRM6QwJpwBM5oS4h/U5zbR0Qc1HyCVo+KBrWaAG2S/Tbg1u5//
         Gm4Hi12HJGFHLoz/iEG7oPWFShgM1OSSCFpd5WYTFM19ZPqK/3KV5ItntahNgTUT7G4S
         aJair7SCYXolj9Z6fL9oNdXpTxNjBzayHxpsdKk2uV6Ssn0DF69nKL/uRLnyz9py7BjN
         ZmyWvanSAs1j1Y+XGeag5UbMkWAqkVOg5KffG19id8FtBtyUB4XDVxkpwhEhLw7sPFHT
         AV3ivCBXAOiTd+z5yLF9FERiMmiB9RkY+RZPAICVeY7hljjMfIFN4km6uVzEHE/myPYF
         mKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785899403; x=1786504203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xek4/jAvqHeG34Edizig0yMhAwZJCf3f9l9B7GvH4hQ=;
        b=sNQaeXhP0g88eS4jyxoAhS/QrMBKKc7TDyX/NOvTqMEdVO9YOuaSszB2201uz2tuCS
         K4QkRhcWXXk/bRglC77aO6oM3MPTchZ9FEABWujS+jP+OSL9L0/NvOXR9SoyHf97ECOB
         MVaymvFHpkuevUMrcJkUb4MpJz1xous6vQ8zjErve5/B8gtCEo8vG3RADXHi+wGce+en
         o092eOgh60hLNg4UXErgNPo/jGLSPuoGYtN2AvWmNaIf7A/A2y/Wf+O0nfhdFKao+6NY
         Ar/50q/WUQTDBEknWM0DcHQVkKaFFWm41gSbeNPM4D9msvIHxXiVe1nONgv8Nis7AymK
         t6jw==
X-Forwarded-Encrypted: i=1; AHgh+RrUHA9p62Yl+8Pcqk5M+/L5FffEJf7vKLEAyfu/x7S9lOA1bOh89APeZzuI12EldJK6XTXluafgWjNN6imbriQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4SECuPrE2NXWrPLmcCi/SfKjEFYzqOO282mmAfoj8sQ6Jez7K
	XFEqkDXouMQ6oqIXhhZcZn3BnccxgJ+pRe19L5P1oMNORcA8YLPoaiQ7
X-Gm-Gg: AR+sD107dr+mZEcqHYkj8Jjt4tuKlCM4iLDyg3gc14gV6Ls+Olw77XmqcdBi6uL/Fos
	Tic+e+xcF2A+vh8sMoo0Ycb93XwpSq7ehSOcirTdNTZkmbWYX+CQqb1FaWFvikns8mHVzthd/sg
	14m2FBLyxvoDEXHA+kXmQ5VhKUG+/YyXKlEHAxLc/r74KO26Nt6sXKwl2inuZBT5WNxfrNbPax8
	HcU3K3AItG1PjLqFfa2xE4oUrUBS+jP+XFw1l7SWN81BwI6u3mZgpCxU3cCHdGiV64sKrZXUWB9
	X1rH1WinZpfA7+xBJcqB45kyzNJUoURDqHpPzUNYgD+1+Y2wIN3m4LeGYIECrHrypGlqkhn7br0
	0fLP1tGnskIJLjZu3O//Esih+FRxbeQO8yIvA+4Iw+egUxf57d+lruL+nep7lRbAoQ57gSBwXb1
	/LbpnNXA0ZiYGqagtGlBcm+nYgMMkvF8Mlgqcwb+TzqGhOIYoVFisvsRMuqO8NDjj17O77
X-Received: by 2002:a05:6808:50a7:b0:495:f79d:8bd5 with SMTP id 5614622812f47-4afae09f3d9mr1770859b6e.12.1785899402760;
        Tue, 04 Aug 2026 20:10:02 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff:1f::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4afae4fc68fsm980909b6e.8.2026.08.04.20.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 20:10:01 -0700 (PDT)
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
Subject: [PATCH net-next 08/14] selftests: net: shaper: Add child node deletion reparent test
Date: Tue,  4 Aug 2026 20:09:30 -0700
Message-ID: <20260805030936.1092907-9-mohsin.bashr@gmail.com>
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

Add delete_child_reparent to verify that deleting a child node
reparents its queue leaves to the parent node. Creates a two-level
hierarchy (N1 with Q1,Q2 and child N2 with Q3), deletes N2, and
verifies Q3's parent becomes N1.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Mohsin Bashir <hmohsin@meta.com>
---
 tools/testing/selftests/drivers/net/shaper.py | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/shaper.py b/tools/testing/selftests/drivers/net/shaper.py
index 3b72661202f9..1b88e183f1b9 100755
--- a/tools/testing/selftests/drivers/net/shaper.py
+++ b/tools/testing/selftests/drivers/net/shaper.py
@@ -648,6 +648,82 @@ def nested_depth_limit(cfg, nl_shaper) -> None:
         cleanup.exec()
     ksft_eq(len(nl_shaper.get({'ifindex': cfg.ifindex}, dump=True)), 0)
 
+def delete_child_reparent(cfg, nl_shaper) -> None:
+    r"""Deleting a child node reparents its queue leaf to the parent.
+
+        netdev              netdev
+          |                   |
+          N1      del N2      N1
+        / | \     ----->    / | \
+      Q1 Q2 N2            Q1 Q2 Q3
+             |
+            Q3
+    """
+    n1_bw_max = 10000
+    n2_bw_max = 5000
+
+    _require_caps(cfg, nl_shaper, 'node',
+                  ['support-bw-max', 'support-metric-bps', 'support-nesting'],
+                  "device does not support node scope shapers with bw_max, metric bps and nesting")
+    _require_caps(cfg, nl_shaper, 'queue', ['support-nesting', 'support-weight'],
+                  "device does not support nested queue scope shapers with weight")
+
+    _require_queues(cfg, 4)
+
+    # Create parent node N1 with Q1, Q2
+    n1_handle = nl_shaper.group({
+                   'ifindex': cfg.ifindex,
+                   'leaves':[{'handle': {'scope': 'queue', 'id': 1},
+                              'weight': 1},
+                             {'handle': {'scope': 'queue', 'id': 2},
+                              'weight': 1}],
+                   'handle': {'scope':'node'},
+                   'metric': 'bps',
+                   'bw-max': n1_bw_max})
+    n1_id = n1_handle['handle']['id']
+    for i in range(1, 3):
+        defer(_delete_shaper, cfg, nl_shaper, {'scope': 'queue', 'id': i})
+
+    # Create child node N2 under N1 with Q3
+    n2_handle = nl_shaper.group({
+                   'ifindex': cfg.ifindex,
+                   'leaves':[{'handle': {'scope': 'queue', 'id': 3},
+                              'weight': 1}],
+                   'handle': {'scope':'node'},
+                   'parent': {'scope': 'node', 'id': n1_id},
+                   'metric': 'bps',
+                   'bw-max': n2_bw_max})
+    n2_id = n2_handle['handle']['id']
+    defer(_delete_shaper, cfg, nl_shaper, {'scope': 'queue', 'id': 3})
+
+    # Delete child N2 - Q3 should reparent to N1
+    nl_shaper.delete({'ifindex': cfg.ifindex,
+                      'handle': {'scope': 'node', 'id': n2_id}})
+
+    with ksft_raises(NlError):
+        nl_shaper.get({'ifindex': cfg.ifindex,
+                       'handle': {'scope': 'node', 'id': n2_id}})
+
+    shaper_n1 = nl_shaper.get({'ifindex': cfg.ifindex,
+                               'handle': {'scope': 'node', 'id': n1_id}})
+    ksft_eq(shaper_n1, {'ifindex': cfg.ifindex,
+                        'handle': {'scope': 'node', 'id': n1_id},
+                        'parent': {'scope': 'netdev'},
+                        'metric': 'bps',
+                        'bw-max': n1_bw_max})
+    shaper_q3 = nl_shaper.get({'ifindex': cfg.ifindex,
+                               'handle': {'scope': 'queue', 'id': 3}})
+    ksft_eq(shaper_q3, {'ifindex': cfg.ifindex,
+                        'parent': {'scope': 'node', 'id': n1_id},
+                        'handle': {'scope': 'queue', 'id': 3},
+                        'weight': 1})
+
+    # Cleanup
+    for i in range(1, 4):
+        _delete_shaper(cfg, nl_shaper, {'scope': 'queue', 'id': i})
+    shapers = nl_shaper.get({'ifindex': cfg.ifindex}, dump=True)
+    ksft_eq(len(shapers), 0)
+
 def queue_update(cfg, nl_shaper) -> None:
     nq = _require_queues(cfg, 4)
     if not cfg.queues:
@@ -765,6 +841,7 @@ def main() -> None:
                   group_update_rate,
                   delegation,
                   nested_depth_limit,
+                  delete_child_reparent,
                   dup_leaves,
                   queue_update],
                  args=(cfg, NetshaperFamily()))
-- 
2.53.0-Meta

