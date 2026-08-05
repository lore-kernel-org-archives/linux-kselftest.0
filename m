Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB143CE0A4
	for <linux-kselftest@vger.kernel.org>; Wed,  5 Aug 2026 03:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785899409; cv=none; b=oO80HNZiWBADWDgVZOCowFt6ugs2FtkUyuvVXe3UlIQFkTkVG8NhM2fDuUBVoXsLy6G5MTAyN42rXtjA2lTuS9TU/NPsYcQX4zzxZ0Nn9a+fHmIC6cP6uldWXaAFvEiityUqsjnwHWgMgeeqM7JwHG0+sdP1SlTjNA0MaLe98vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785899409; c=relaxed/simple;
	bh=Jq8G1a8IW2voSAiSYYJVtT2lfUBUkeHKC/7i6E9dQz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tZFOaMtjaqPUMPRV2NHgLtJwMu/mjfYIQ4rQAL9i+s90F3+hUTi8fiR/Nh/QRtmd8aPvhS26iXOZ7Wswbn1ZZSzAldVld1ZmB8e0+AC7ddR2RhD/w6wjPHxHbjX89GcYlFgnR++embVT6RFrQaOTwDccAfofAjpX66A4zyFSuIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QraSKoix; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QraSKoix"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-495b250b01cso333261b6e.0
        for <linux-kselftest@vger.kernel.org>; Tue, 04 Aug 2026 20:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785899405; x=1786504205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/4t3Qh7FD+LIP4Bq9IadDXflLYCCWPdGdCvaAGpR3A=;
        b=QraSKoix/3RHO0vI/Kv4Vt1lYmX9XkWKcvKDuAqUzERfNofgGgLiiHXi8TX9JNRPbb
         G8AXnPMRXzIG3EoftM0sfw9Xh9LLjGOrGMsM6mzT2c5oxn1ZKTREjbPFXps2SrqhqR+/
         FqHfAUPAR9o9oFUpMkljYkskpdP5V+KHPtpwFdGNJPIGG6g5TgGmwGgZ6MALGOgeTDRX
         wNM1HDXGbnanuj6twnC/cZI2/w3k7CAcY6pFnmthGe5owOgg1G709+yDj4FIaPBP9+qQ
         TX67KR4AsTqgVvd2frH6MqnBzK3PQUjC8pQv5MLT9nX3G4rmRodqLUM5MQ9hU3JofFwj
         T46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785899405; x=1786504205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+/4t3Qh7FD+LIP4Bq9IadDXflLYCCWPdGdCvaAGpR3A=;
        b=lxFeAP1U009+Y83As0DXPcxB/owwQ5cM+7GtSmvVE/iTQsBxT843uL8q1mWJZ9hAya
         j+2A4RUsKEmTfdzOAjMIGGhtOGwzg00zoIfKWsRddtn6F4BgMCypsEQqoK48OyfmnD4I
         XdcFc2RIp2h+ZlPlyJ/eO08AEptZR5sopNipx9Q9KFxQqVjeXMQcD9TfB83JmSpaKGLa
         T4epaADJ6622T3qJqaZ1Hbg25RGr2BCb74mmLs/oZHoWuWogXh/XGY7qWf4ECUm6MySc
         2Lfm5pocyBkQfQui/RrzjPcfUrhL27CmEBGqPVMig/95tUjv2+gDRcmjTJppR28qGXWP
         KASw==
X-Forwarded-Encrypted: i=1; AHgh+RqYoyZRySxm44aVuO8qmTue8Bvpilf1JmAJCnWZk4qd9w9KqppydG0XCtkROZbEyC5hiTSkHmeRptcb4mf9A20=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTXHVhdg4+RQlzJqm9rm0rHs1JXCJX/JC8OE+XMlGcybqhTDTZ
	pcZGD0VauNFIfWcKLFKCMiqu0+hO5NjEW+Dp4faMRq7iTmGUoI4Q0VB5
X-Gm-Gg: AR+sD11ewLNRwSarbLHB3q+mSxvV/6KjX/DH1xRCkGk3t1oxKWrueQm26sMX09YIEkX
	FDyVM+LxNfbXNXvEJaynXBpIRGfw/viYj0l0ZaQEHhJL1usSZW/YExvworExCB7wp4vZ6uoBan+
	RRfEAR3rQlnf4fjvk0d+3ZfnHRvzYH4NEj9thMO6JJ5+KPkNXDtWzBTYnQZEr2immACND1ehMyA
	46wOVSUWR4Gyac6cJD984ssrWA4FWUISBKvOni4iEIRzmxD/lYKx+CP5ZWCOhbrrVQB9nSNWttu
	iDYM1ZcLgnU/hM9HMhdDK60Uc9Ht/Xb2S1LZXJcKfxHt7TyaPVB6tSaW5PPt1KCoyKIYty0Stih
	Dq+aJQc5pgrlIE1AAUem6W1U0rfWKMk/FDRJ76EzP9x1n0tZweLm3rq6kP0Dn0jLT/Wenwf+qRP
	sJQOp8yX5/x1oSOMhMKmxcnSjAurJL6v1KpF7ZNZwc8/iAurkHVU1o7+mnXw==
X-Received: by 2002:a05:6808:1185:b0:4a4:934:b316 with SMTP id 5614622812f47-4afae2607a0mr1829050b6e.21.1785899405603;
        Tue, 04 Aug 2026 20:10:05 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff:31::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4afae75ce1bsm977189b6e.15.2026.08.04.20.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 20:10:04 -0700 (PDT)
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
Subject: [PATCH net-next 09/14] selftests: net: shaper: Add queue migration between nodes test
Date: Tue,  4 Aug 2026 20:09:31 -0700
Message-ID: <20260805030936.1092907-10-mohsin.bashr@gmail.com>
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

Add move_queue_between_nodes to verify that a queue can be moved
from one node to another via re-grouping. Creates N1 with Q1,Q2
and N2 with Q3, then re-groups N2 with Q1,Q3 to steal Q1 from
N1. Verifies Q1 moved to N2 and Q2 remains under N1.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Mohsin Bashir <hmohsin@meta.com>
---
 tools/testing/selftests/drivers/net/shaper.py | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/shaper.py b/tools/testing/selftests/drivers/net/shaper.py
index 1b88e183f1b9..62c74a0c0563 100755
--- a/tools/testing/selftests/drivers/net/shaper.py
+++ b/tools/testing/selftests/drivers/net/shaper.py
@@ -724,6 +724,107 @@ def delete_child_reparent(cfg, nl_shaper) -> None:
     shapers = nl_shaper.get({'ifindex': cfg.ifindex}, dump=True)
     ksft_eq(len(shapers), 0)
 
+def move_queue_between_nodes(cfg, nl_shaper) -> None:
+    r"""Move a queue between nodes by re-grouping the destination node.
+
+        netdev                  netdev
+        /    \    .group N2      /    \
+       N1     N2  {Q1,Q3}       N1     N2
+      /  \    |   ------->       |    /  \
+     Q1  Q2  Q3                 Q2  Q1   Q3
+    """
+    n1_bw_max = 10000
+    n2_bw_max = 20000
+
+    _require_caps(cfg, nl_shaper, 'node',
+                  ['support-bw-max', 'support-metric-bps', 'support-nesting'],
+                  "device does not support node scope shapers with bw_max, metric bps and nesting")
+    _require_caps(cfg, nl_shaper, 'queue', ['support-nesting', 'support-weight'],
+                  "device does not support nested queue scope shapers with weight")
+
+    _require_queues(cfg, 4)
+
+    # Create N1 with Q1, Q2
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
+    # Create N2 with Q3
+    n2_handle = nl_shaper.group({
+                   'ifindex': cfg.ifindex,
+                   'leaves':[{'handle': {'scope': 'queue', 'id': 3},
+                              'weight': 1}],
+                   'handle': {'scope':'node'},
+                   'metric': 'bps',
+                   'bw-max': n2_bw_max})
+    n2_id = n2_handle['handle']['id']
+    defer(_delete_shaper, cfg, nl_shaper, {'scope': 'queue', 'id': 3})
+
+    # Move Q1 from N1 to N2 by re-grouping N2 with Q1, Q3
+    nl_shaper.group({
+                   'ifindex': cfg.ifindex,
+                   'leaves':[{'handle': {'scope': 'queue', 'id': 1},
+                              'weight': 2},
+                             {'handle': {'scope': 'queue', 'id': 3},
+                              'weight': 1}],
+                   'handle': {'scope':'node', 'id': n2_id},
+                   'metric': 'bps',
+                   'bw-max': n2_bw_max})
+
+    shaper_n1 = nl_shaper.get({'ifindex': cfg.ifindex,
+                               'handle': {'scope': 'node', 'id': n1_id}})
+    ksft_eq(shaper_n1, {'ifindex': cfg.ifindex,
+                        'handle': {'scope': 'node', 'id': n1_id},
+                        'parent': {'scope': 'netdev'},
+                        'metric': 'bps',
+                        'bw-max': n1_bw_max})
+    shaper_n2 = nl_shaper.get({'ifindex': cfg.ifindex,
+                               'handle': {'scope': 'node', 'id': n2_id}})
+    ksft_eq(shaper_n2, {'ifindex': cfg.ifindex,
+                        'handle': {'scope': 'node', 'id': n2_id},
+                        'parent': {'scope': 'netdev'},
+                        'metric': 'bps',
+                        'bw-max': n2_bw_max})
+
+    # Verify Q1 moved to N2
+    shaper_q1 = nl_shaper.get({'ifindex': cfg.ifindex,
+                               'handle': {'scope': 'queue', 'id': 1}})
+    ksft_eq(shaper_q1, {'ifindex': cfg.ifindex,
+                        'parent': {'scope': 'node', 'id': n2_id},
+                        'handle': {'scope': 'queue', 'id': 1},
+                        'weight': 2})
+
+    # Verify Q2 still under N1
+    shaper_q2 = nl_shaper.get({'ifindex': cfg.ifindex,
+                               'handle': {'scope': 'queue', 'id': 2}})
+    ksft_eq(shaper_q2, {'ifindex': cfg.ifindex,
+                        'parent': {'scope': 'node', 'id': n1_id},
+                        'handle': {'scope': 'queue', 'id': 2},
+                        'weight': 1})
+
+    # Verify Q3 remained under N2
+    shaper_q3 = nl_shaper.get({'ifindex': cfg.ifindex,
+                               'handle': {'scope': 'queue', 'id': 3}})
+    ksft_eq(shaper_q3, {'ifindex': cfg.ifindex,
+                        'parent': {'scope': 'node', 'id': n2_id},
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
@@ -842,6 +943,7 @@ def main() -> None:
                   delegation,
                   nested_depth_limit,
                   delete_child_reparent,
+                  move_queue_between_nodes,
                   dup_leaves,
                   queue_update],
                  args=(cfg, NetshaperFamily()))
-- 
2.53.0-Meta

