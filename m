Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6E13CB2DC
	for <linux-kselftest@vger.kernel.org>; Wed,  5 Aug 2026 03:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785899400; cv=none; b=VBk5WAfyLBaSu7lsznVEUorjzQT4zHkUJa54o64h5lx3Tn+V7C4ZAdrszcf+51b0KhgvOyxjzLcwwfrKCB2s5aZJTHmKISgDipXYzSQz2xS+YHLHl2YN0J0fQBDZhzm2I+MDa18ndmK7P9Jxwke0yAs7D4ThcQHdnRvjaOzE7eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785899400; c=relaxed/simple;
	bh=3szltxY+VKk6xH+PjO6+PE+6DNN7VLfS1oL4wAwfWNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g50NChgJZcwZimEizxwe5DcsX+rTx5FOs4lSlVHNuIw0ZG4p25m3XXZPHD/FawInDyxMd/WDHXqFB0SOiYD5DFQOhXXFxiQgv+UlVAOfxQTJhR1aQeQBDIR9pjHA3H6NozCA7uqsX6r8VLPKbEtQvCKP1Pkistu6JsaGnZ+Buac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JCqWzAp4; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JCqWzAp4"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6ae8c4b9822so270292eaf.1
        for <linux-kselftest@vger.kernel.org>; Tue, 04 Aug 2026 20:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785899397; x=1786504197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yx9eKdgdP27MAi2E7/idObyxLUuxucE1tvirxr3bM3A=;
        b=JCqWzAp47ocZjsiyfR2ehPlwiOt+9ScULRXT+VW8z0hqai+9mU+qSydfAJY+exETKP
         v0BnmTIEM4Puo2WrOBH0ttrWeQDUvK1SKDW3ApYV1/OBb6pqDVDF+7kwjxiEuoit4MPw
         SOuqghk2VseJhr/vYCr5RjeANbj1++1vn2D/5H1yNkSZu3XXICRrbLcqif8VjlDxTNnr
         lR6VZgkSCyiV5qYdbIEyMzBdkzNLBHdfzBg5i6HXFGmLcF26hPHY1dLNtkgVYptHX8yc
         0V2n3cswvQcADzZfvXWRb6rfjMwbXldQxw8NUPnz4aoIly3VqupjjTNdE4MWdMP7f02T
         VlFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785899397; x=1786504197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yx9eKdgdP27MAi2E7/idObyxLUuxucE1tvirxr3bM3A=;
        b=gdHfEkgAYnCroAeFiUh+8B4UXYJ3RFKhYFm+jmVXuNNAPejcPgZKmdWXC1fUQdFKBk
         nCsFzkRwBjJS8+iHldl8lOWeJK+hUWOkR8Edq5gjmmV+scih08X0cirWuuHJT+5lY1OU
         xaN0Lb6OPyMbQ1ijIoTGwSbOkPps8agqRk8s+qrAfOxRJPzydyRpR9aOsupfwdNBVhTg
         oVggQa1QeL6Fm+4PzKQkONOWweufdMLGZamRseqz1V9X3zpef4r6ifhqbJ7pZO56Xmo/
         Hwy7tY0Lk1HmEACAgZnVg+sk35gGB4OLeylU/mfL2OyB2YGJKcNpuacGtq3I54zAaaN3
         4YLQ==
X-Forwarded-Encrypted: i=1; AHgh+RoLUGCMo5lCsxZKQTLPdbwLOG4wq6GhUWjZiO8X2+8Q69DyMXmKCw+SaV4/+tRRrgaSJkogpVxfxvmb3icRLpw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJsCTLe/W3qsCR/xEawCgVwsGdJAPxwZP+rrNgJpH/0TfzmGrg
	OXQLdj3A87//ge+yPFccN8WQ+XoLEx3WHk4rI0I01r1fyegMPL4ecTyN
X-Gm-Gg: AR+sD13Iu0xeU4T3/dc5wzsVrKOh6z/dwlWZ8UaJ+Jean0dLlHDiQwFq7JkJFJlvcd4
	P6uYQz1PeC1OYqURgSvQTNXLsvv8ntkTMeSAjlbBwawxpFk4D9Fd3w5CM6XvHW/W37TzB5imT0U
	1cxRcAtyBtX7l2zBofGlOxDV/60ixKO9SsYMGNVSgWDYcvAtg1eOfUFoN2b9SKP2709jt14j7Y3
	FY5e9NlzgtTar2dW3AHm4zjBDoLb37DCdHskVaHB6ZrxcwpmuyztTXWyfPBYcpn3YxNTYx52zzX
	GiwM45/MRM13pgqJQ8VT0+xihSoAGyRkyWD1ShDHw0VXawTHlKi3DayQDCGKy3kiSKSJNd/Om82
	B6lLuuqjhKVQqBi4rus77yW5CzEYBPe9PqN1wH8VteZ8+iDKYwV1XLrPG6pdGrpUpVrBVXBltNa
	Tg4bvDS+xYfZGiQRam6Ofkt59d9xzO9yWyqhifMDdgS1v3m+in8oL4NEbJAw==
X-Received: by 2002:a05:6820:1c89:b0:6a1:963d:a040 with SMTP id 006d021491bc7-6ae96c1b2famr2191220eaf.2.1785899397197;
        Tue, 04 Aug 2026 20:09:57 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff:47::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ae940782desm1636211eaf.14.2026.08.04.20.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 20:09:56 -0700 (PDT)
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
Subject: [PATCH net-next 06/14] selftests: net: shaper: Add .group rate update test
Date: Tue,  4 Aug 2026 20:09:28 -0700
Message-ID: <20260805030936.1092907-7-mohsin.bashr@gmail.com>
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

Add group_update_rate to test updating an existing node's rate
via the .group callback. Creates a node with bw_max=10000,
re-groups with bw_max=50000, and verifies the rate changed while
leaves remain under the same node.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Mohsin Bashir <hmohsin@meta.com>
---
 tools/testing/selftests/drivers/net/shaper.py | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/shaper.py b/tools/testing/selftests/drivers/net/shaper.py
index 62ac83b7701c..5eccbe437ba3 100755
--- a/tools/testing/selftests/drivers/net/shaper.py
+++ b/tools/testing/selftests/drivers/net/shaper.py
@@ -380,6 +380,72 @@ def set_node_shaper(cfg, nl_shaper) -> None:
     shapers = nl_shaper.get({'ifindex': cfg.ifindex}, dump=True)
     ksft_eq(len(shapers), 0)
 
+def group_update_rate(cfg, nl_shaper) -> None:
+    """ Verify re-grouping a node updates its rate while leaving the leaves untouched. """
+    _require_queues(cfg, 3)
+    _require_caps(cfg, nl_shaper, 'node', ['support-bw-max', 'support-metric-bps'],
+                  "device does not support node scope shapers with bw_max and metric bps")
+    _require_caps(cfg, nl_shaper, 'queue', ['support-nesting', 'support-weight'],
+                  "device does not support nested queue scope shapers with weight")
+
+    # Create node with Q1, Q2 at bw_max=10000
+    node_handle = nl_shaper.group({
+                   'ifindex': cfg.ifindex,
+                   'leaves':[{'handle': {'scope': 'queue', 'id': 1},
+                              'weight': 1},
+                             {'handle': {'scope': 'queue', 'id': 2},
+                              'weight': 1}],
+                   'handle': {'scope':'node'},
+                   'metric': 'bps',
+                   'bw-max': 10000})
+    node_id = node_handle['handle']['id']
+    for i in range(1, 3):
+        defer(_delete_shaper, cfg, nl_shaper, {'scope': 'queue', 'id': i})
+
+    # Update rate via .group on the same node
+    nl_shaper.group({
+                   'ifindex': cfg.ifindex,
+                   'leaves':[{'handle': {'scope': 'queue', 'id': 1},
+                              'weight': 1},
+                             {'handle': {'scope': 'queue', 'id': 2},
+                              'weight': 1}],
+                   'handle': {'scope':'node', 'id': node_id},
+                   'metric': 'bps',
+                   'bw-max': 50000})
+
+    # Verify rate updated
+    shaper = nl_shaper.get({'ifindex': cfg.ifindex,
+                            'handle': {'scope': 'node', 'id': node_id}})
+    ksft_eq(shaper, {'ifindex': cfg.ifindex,
+                     'handle': {'scope': 'node', 'id': node_id},
+                     'parent': {'scope': 'netdev'},
+                     'metric': 'bps',
+                     'bw-max': 50000})
+
+    # Verify leaves unchanged
+    shaper_q1 = nl_shaper.get({'ifindex': cfg.ifindex,
+                               'handle': {'scope': 'queue', 'id': 1}})
+    ksft_eq(shaper_q1, {'ifindex': cfg.ifindex,
+                        'parent': {'scope': 'node', 'id': node_id},
+                        'handle': {'scope': 'queue', 'id': 1},
+                        'weight': 1})
+    shaper_q2 = nl_shaper.get({'ifindex': cfg.ifindex,
+                               'handle': {'scope': 'queue', 'id': 2}})
+    ksft_eq(shaper_q2, {'ifindex': cfg.ifindex,
+                        'parent': {'scope': 'node', 'id': node_id},
+                        'handle': {'scope': 'queue', 'id': 2},
+                        'weight': 1})
+
+    # Make sure we only have 3 shapers including 2 queues and the node
+    shapers = nl_shaper.get({'ifindex': cfg.ifindex}, dump=True)
+    ksft_eq(len(shapers), 3)
+
+    # Cleanup
+    for i in range(1, 3):
+        _delete_shaper(cfg, nl_shaper, {'scope': 'queue', 'id': i})
+    shapers = nl_shaper.get({'ifindex': cfg.ifindex}, dump=True)
+    ksft_eq(len(shapers), 0)
+
 def delegation(cfg, nl_shaper) -> None:
     _require_queues(cfg, 4)
     _require_caps(cfg, nl_shaper, 'node',
@@ -580,6 +646,7 @@ def main() -> None:
                   basic_groups_with_rate,
                   qgroups,
                   set_node_shaper,
+                  group_update_rate,
                   delegation,
                   dup_leaves,
                   queue_update],
-- 
2.53.0-Meta

