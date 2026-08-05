Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4993C3F58
	for <linux-kselftest@vger.kernel.org>; Wed,  5 Aug 2026 03:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785899397; cv=none; b=aqEJUv/pVEaY/R3ORT7OINwDYkJ0fyKo+7ZK1JVvWw+yKGNay0kdU1RjJchwPzB0f5H0DM/nqmVuRdIf0qUXZ/tEqiA4pcWCy6Px0a7FDWJpXzWkr06GQRpeGHTPLDdSV8ZFyXtROEzMTzxjkg9w007PjB+rWnyaPiAQIjo+450=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785899397; c=relaxed/simple;
	bh=5YihlMOGgWUO8737n2nBj1ciLX9CpcxUKVEkBqi2ZII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QiX6uWLczcUdeR/+N+YgaXSGBxyyoGgY7d+hySvKCMcwMJq7DB7qcIn+H/8aM7N1Tmz6IH8qKLmn8AvWev1rbPp2eHufCcxaYyMRK7LBF1ZuB0+68fWOUVlG6IlEC/Litt1th8WS9ZmLyr2juKClTj1J7qY0J2XJue0NfaRH1ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VJfolTUH; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VJfolTUH"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-497d3e4460aso1300569b6e.1
        for <linux-kselftest@vger.kernel.org>; Tue, 04 Aug 2026 20:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785899394; x=1786504194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aYN4g/UA+fKUF44O4j859tRSP2FM/5WK3MFhT5M1mR8=;
        b=VJfolTUHlG+QC7gslElgB7YP2wzkss++2izA4vCSlS3zTyay0IgDXHvJlSNJllLapP
         3ffoQ4+nj2FCNOGXVHSRRho+YSWCT5aDuC+B/phWehZUQzLStFQDvs42+Idk1orNQS5c
         ILODu9WA8jaB3G5yIujiGr2VvYTuApgEEKJiEavN6bjubzKv3XhW3sXNy7ngLHPfnelJ
         kfwoGDOk1o9nVlqtgyc0oBbKCOWgy7vBj7jvopMNo+DBsCi06TAsLh61MHSmXijcuTu2
         XEyFPxbY4faLr1RLfWp0LRLa3gBlzOYkHmeXvRcp5sn0jiV2onGIkCCL920E6eJayCYI
         I3lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785899394; x=1786504194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aYN4g/UA+fKUF44O4j859tRSP2FM/5WK3MFhT5M1mR8=;
        b=jvdHgFsXDe3YdU0sr6vzbhBX9tKLqb+6UiiDccNpd2Lfz/AjsSoJSyiNAxx3HL0e/c
         +hsEiLf7a/TOfHuyx43Xct7JSo5DKYtO4NDEtJaqJBL0ImGLGlUDLOb864b6/MrEcc9Y
         ukFGuHJ2/T5ig6bVjcNq41HCzITry/IEIx0oi8ZI3T2QFkpW0T1/g3F4aJD7wAbAtNOB
         cIZFEPLAY3OplIlLsLbXJxwcayNu+tUFd6xHLfxesPFYoEbZGWbLPl2MMytFbNytDDqv
         HV6a/Yc5Meqr7pFnoeuL1ISM0WQTd/HdA3t/RRFkazMYsH0NC8bv24E972k0ROrcOy/z
         xB5w==
X-Forwarded-Encrypted: i=1; AHgh+RqR1AsIWu7A4jN2AsO2lXm4BTEbL9RXwTlLhkZpRY6yTbqQpvg/sl5ZEb2HwGx7mioMu0DPNBJaXeptPR89/D8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkMGzK3v03iTMXqi7CZUXD1ssvhQTs1UatBIVvSFT4quaSydk1
	sJOlCf6YiryZKmRPuW7jA98NPhFnAfCF0wsst3o+1Hl4KB1gzlUnBfN6
X-Gm-Gg: AR+sD12rOyZthBzXp/sRkxIbFZHdCSGJi5/ElW9/jdrvE2+FjiZS4ofdf+AD78ue4Cl
	wDemIGI1DmKbaukN0UOBUDpNYw68F6FnNIx32myMd+TwAs8HtnGL5KHSZvLtgbHMozXsHnQOYwk
	pTeWsjO1nCmsla//Dbd4rAZ9t6IAIyvEKaloh+vm0hPbGJt1B+VaMqn4STMD4QzFeTx8U6z+Axd
	r0OjUsuYWoA1JivbcPTvrFhUW2x8qv2fRlFdATSmy7oVZYaoE+f6VFvSswn70EDT7/d2c83U4yv
	EfmrTqHO94g7kZXpDs28prgCkEPnGA6XJ1pGpYrH1Uo83ipZQfXHU8RKt/RhJNTOd4KVjYV4WO9
	R854yggCFUfJMKI+Ly8NnkTnQbsWqNc2YrPvkDKVFiqlQDKeRvMf5lcnDgb/1dijp57LsVZ8t+V
	lxsuSj2hM3nj8Vb5H+detJf8iil7hhOKIBSwcKXHhUAuEUM3gt44uHx2d2Dw==
X-Received: by 2002:a05:6808:6c82:b0:496:117b:1f04 with SMTP id 5614622812f47-4af987d26e3mr8317618b6e.2.1785899394199;
        Tue, 04 Aug 2026 20:09:54 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff:17::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4afae75ce1bsm976885b6e.15.2026.08.04.20.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 20:09:53 -0700 (PDT)
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
Subject: [PATCH net-next 05/14] selftests: net: shaper: Add node scope .set rate update test
Date: Tue,  4 Aug 2026 20:09:27 -0700
Message-ID: <20260805030936.1092907-6-mohsin.bashr@gmail.com>
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

Add set_node_shaper to test updating a NODE scope shaper's rate
via the .set callback. Creates a node group with bw_max=10000,
updates to 20000 via .set, and verifies the change.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Mohsin Bashir <hmohsin@meta.com>
---
 tools/testing/selftests/drivers/net/shaper.py | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/shaper.py b/tools/testing/selftests/drivers/net/shaper.py
index 168a8dd057e5..62ac83b7701c 100755
--- a/tools/testing/selftests/drivers/net/shaper.py
+++ b/tools/testing/selftests/drivers/net/shaper.py
@@ -343,6 +343,43 @@ def qgroups(cfg, nl_shaper) -> None:
     shapers = nl_shaper.get({'ifindex': cfg.ifindex}, dump=True)
     ksft_eq(len(shapers), 0)
 
+def set_node_shaper(cfg, nl_shaper) -> None:
+    """ Verify a node-scope shaper rate can be updated via .set. """
+    _require_queues(cfg, 2)
+    _require_caps(cfg, nl_shaper, 'node', ['support-bw-max', 'support-metric-bps'],
+                  "device does not support node scope shapers with bw_max and metric bps")
+    _require_caps(cfg, nl_shaper, 'queue', ['support-nesting', 'support-weight'],
+                  "device does not support nested queue scope shapers with weight")
+
+    node_handle = nl_shaper.group({
+                   'ifindex': cfg.ifindex,
+                   'leaves':[{'handle': {'scope': 'queue', 'id': 1},
+                              'weight': 1}],
+                   'handle': {'scope':'node'},
+                   'metric': 'bps',
+                   'bw-max': 10000})
+    node_id = node_handle['handle']['id']
+    defer(_delete_shaper, cfg, nl_shaper, {'scope': 'queue', 'id': 1})
+
+    # Update the node's rate via .set
+    nl_shaper.set({'ifindex': cfg.ifindex,
+                   'handle': {'scope': 'node', 'id': node_id},
+                   'metric': 'bps',
+                   'bw-max': 20000})
+
+    shaper = nl_shaper.get({'ifindex': cfg.ifindex,
+                            'handle': {'scope': 'node', 'id': node_id}})
+    ksft_eq(shaper, {'ifindex': cfg.ifindex,
+                     'handle': {'scope': 'node', 'id': node_id},
+                     'parent': {'scope': 'netdev'},
+                     'metric': 'bps',
+                     'bw-max': 20000})
+
+    # Cleanup
+    _delete_shaper(cfg, nl_shaper, {'scope': 'queue', 'id': 1})
+    shapers = nl_shaper.get({'ifindex': cfg.ifindex}, dump=True)
+    ksft_eq(len(shapers), 0)
+
 def delegation(cfg, nl_shaper) -> None:
     _require_queues(cfg, 4)
     _require_caps(cfg, nl_shaper, 'node',
@@ -542,6 +579,7 @@ def main() -> None:
                   basic_groups,
                   basic_groups_with_rate,
                   qgroups,
+                  set_node_shaper,
                   delegation,
                   dup_leaves,
                   queue_update],
-- 
2.53.0-Meta

