Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AC93CC323
	for <linux-kselftest@vger.kernel.org>; Wed,  5 Aug 2026 03:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785899403; cv=none; b=ofzfG1W83UhqQLs6KfPyYEHOYR7mkpbqFnEiY5d77LEySnkEgb0so2F+hsPZUEAnD+JK8Osp7P52of2IGmZfjqpUKvdQls30VCYpO6lykhel/j9gp470lMA6aSMKwoA8c+xXixayLc9RCfKIOSfTaJoZ612Z+10j8Wgncl+4TyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785899403; c=relaxed/simple;
	bh=oQhugvCMYGy3aYRRfeKE10bMevHlLebPckLOxjXzNpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S6e4L6zSBWb92elFBsK4AJbTVZ1N5GI7JOcfyC7X4LUDg8lPw3rxTJU7s17B4Yo+NDeTSpZrhAk7O/27PLSjrTfZzeryia6pGK+6esMH0cQ9YIjrxXadi2PxKf5P0xzehxieSYHLO3wbp8NWljZZWuR5RNzAoaiWSZBkepQS4KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJInWa77; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJInWa77"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6acb63301acso458952eaf.0
        for <linux-kselftest@vger.kernel.org>; Tue, 04 Aug 2026 20:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785899400; x=1786504200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4UYo3FcDc5RU/v3Uu1cX8c+hEHFvI0I8XStdhmaMcys=;
        b=DJInWa77/Uhli2eS954S03nmD0TmZ6G0Oe37JhY7zFrsx8iCJixU6YL8bHH4VBL+cN
         nsCP9BdDvMF141zXjSAVWLAyde+GCSRF6ilHTA2uGokocFCTATJ7++30eswtXkk8tY/c
         j+RoGjXy9FYXk4QjmwnojJGmCfK79HqlTaWwl6CfdCaEptFgr3uorGZMCuY5puVvukbp
         jVd45uVCamwKKMQ2pLU/SuHJL8/m34/olsGLAPlPc0KE8tWaKMbvB613huGVUe9ro0FA
         DzF9gnMwJiC9iSReWwvcTOgmeTj4tXGA2hJBQpkXqdZUilnfzDL11yq1owSuk8V1PrPz
         8NaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785899400; x=1786504200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4UYo3FcDc5RU/v3Uu1cX8c+hEHFvI0I8XStdhmaMcys=;
        b=aGRlchAwA88L0xXRi/w8EDuenxdS8eRRxeD4wH+24lCSRlAt6GDYOFogxSFpgKW8q+
         bBEzrUbYOKtsUVLJO6rqe7eFofdcK9T/dEomRXFJQwtPGcS67r4miCI2jcwPb91+znxk
         yUce/VCJSoT9h4zGW3FkkUvXE0B7dW00B8tjsRfXOe8oJ6jLxLhfFhRY4ZuVsBD+eZuX
         JR3MWm14F7GqkftUJBwlfR+YRbYoioR72iKimEZI/WygFQ2fa7ap7x5gK31WYp32YC4L
         5w6L/T8uwbuZH1yW8Q43OLqXOyzvawMXCKiP4EvAy6dJGw5B90yplBYsXJW18l5+jTKR
         R01w==
X-Forwarded-Encrypted: i=1; AHgh+RqcGv/dHFA3zTo4CCUcwQEXJ4xR4LJqRzIxIcVMlCEObZrq0dOa/O+r2Zc1JmCGzwd5f8Ssu7Ad9DzDrr7llRo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw85QLPofjsdQ3z0aOPqF0lg7unSDaT1U/AOovAQwc+5fc7JOke
	u2y/efS+XsTw4U/ogPtFS4z5CG41q+gMF2/pV5r5V+IMH8cp3E85P3b3
X-Gm-Gg: AR+sD12ghLPco3+OAVYjr3VRi7Jlm2IGmCsJ4hvlzOUZtQXsxwLgLF4OESLqUa8DOTZ
	WNM4Zc89KN9eH2lXkkDIXlSkLlKNE1x3miWK/vS0nFSvlmGJNtC3NKgiqj+v44w/QbkQWG8kbxb
	o25wUddU4VZVQ3DzOt0xoIripMpBKgQ7tvVboxIg5e8Sa+hn388lIhiBqI+VZoGGvT0+A/DM6Vv
	gdB9fcO1WNV6+3KQ8eynorIXITkwEt8rELAYxBnrg0lchGW1+l370ac+GZgMZLB+zNhclwtrR9A
	Lgu6D3jkBCjuC6dVOy5E4jCgVpLxLBSWBeXjvj2jaVZkEwYUby9XU0e0ED1NOfA6YS16gmL4rxt
	Bz+EmKkdZkFeZvJ8gTiOoL0gvPkCTIeXvzSnOQci+PKb6P0vaOE9sxDZqTnEGVULHeEEkD4YIvM
	uh/0tSfzcVt6j+uJepmQWFvWqWAio6a0YFR6ZsUmnHd7FKGBW4dnIP0PAi5w==
X-Received: by 2002:a4a:ec42:0:b0:6a3:4e5:5282 with SMTP id 006d021491bc7-6ae965b3107mr1310360eaf.1.1785899399868;
        Tue, 04 Aug 2026 20:09:59 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff:39::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ae93d524d3sm1576806eaf.6.2026.08.04.20.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 20:09:59 -0700 (PDT)
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
Subject: [PATCH net-next 07/14] selftests: net: shaper: Add nested depth limit discovery test
Date: Tue,  4 Aug 2026 20:09:29 -0700
Message-ID: <20260805030936.1092907-8-mohsin.bashr@gmail.com>
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

Add nested_depth_limit to incrementally create deeper nesting
levels until the driver rejects. Reports the maximum supported
nesting depth on both pass and fail. A device advertising nesting
support must support at least depth 2, otherwise nesting is
meaningless.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Mohsin Bashir <hmohsin@meta.com>
---
 tools/testing/selftests/drivers/net/shaper.py | 117 ++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/shaper.py b/tools/testing/selftests/drivers/net/shaper.py
index 5eccbe437ba3..3b72661202f9 100755
--- a/tools/testing/selftests/drivers/net/shaper.py
+++ b/tools/testing/selftests/drivers/net/shaper.py
@@ -532,6 +532,122 @@ def delegation(cfg, nl_shaper) -> None:
     shapers = nl_shaper.get({'ifindex': cfg.ifindex}, dump=True)
     ksft_eq(len(shapers), 0)
 
+def nested_depth_limit(cfg, nl_shaper) -> None:
+    r"""Nest nodes as deep as the device allows to find the max depth.
+
+        netdev
+          |
+         N1 -- Q1
+          |
+         N2 -- Q2
+          |
+         N3 -- Q3
+          :       (deepen until the driver rejects)
+    """
+    bw_max = 10000
+
+    _require_caps(cfg, nl_shaper, 'node',
+                  ['support-bw-max', 'support-metric-bps', 'support-nesting'],
+                  "device does not support node scope shapers with bw_max, metric bps and nesting")
+    _require_caps(cfg, nl_shaper, 'queue', ['support-nesting', 'support-weight'],
+                  "device does not support nested queue scope shapers with weight")
+
+    nq = _require_queues(cfg, 3)
+
+    node_ids = []
+    cleanups = []
+    queue_id = 1
+    max_depth = 0
+    limit_err = None
+
+    # Create initial node with a queue leaf
+    node_id = nl_shaper.group({
+        'ifindex': cfg.ifindex,
+        'leaves': [{'handle': {'scope': 'queue', 'id': queue_id},
+                     'weight': 1}],
+        'handle': {'scope': 'node'},
+        'metric': 'bps',
+        'bw-max': bw_max})['handle']['id']
+    node_ids.append(node_id)
+    cleanups.append(defer(_delete_shaper, cfg, nl_shaper,
+                          {'scope': 'node', 'id': node_id}))
+    cleanups.append(defer(_delete_shaper, cfg, nl_shaper,
+                          {'scope': 'queue', 'id': queue_id}))
+    max_depth = 1
+    shaper = nl_shaper.get({'ifindex': cfg.ifindex,
+                            'handle': {'scope': 'node', 'id': node_id}})
+    ksft_eq(shaper, {'ifindex': cfg.ifindex,
+                     'handle': {'scope': 'node', 'id': node_id},
+                     'parent': {'scope': 'netdev'},
+                     'metric': 'bps',
+                     'bw-max': bw_max})
+    shaper = nl_shaper.get({'ifindex': cfg.ifindex,
+                            'handle': {'scope': 'queue', 'id': queue_id}})
+    ksft_eq(shaper, {'ifindex': cfg.ifindex,
+                     'parent': {'scope': 'node', 'id': node_id},
+                     'handle': {'scope': 'queue', 'id': queue_id},
+                     'weight': 1})
+    queue_id += 1
+
+    # Keep nesting deeper until the driver rejects or queues run out.
+    while queue_id < nq:
+        parent_id = node_ids[-1]
+        try:
+            node_id = nl_shaper.group({
+                'ifindex': cfg.ifindex,
+                'leaves': [{'handle': {'scope': 'queue',
+                                       'id': queue_id},
+                             'weight': 1}],
+                'handle': {'scope': 'node'},
+                'parent': {'scope': 'node',
+                           'id': parent_id},
+                'metric': 'bps',
+                'bw-max': bw_max})['handle']['id']
+        except NlError as e:
+            # Only treat "cannot nest deeper" errors as the depth limit;
+            # drivers report it differently (EOPNOTSUPP/ENOSPC/E2BIG/EINVAL).
+            # Anything else (ENOMEM, EIO, EPERM, driver bug) is a real failure.
+            if e.error not in (errno.EOPNOTSUPP, errno.ENOSPC,
+                               errno.E2BIG, errno.EINVAL):
+                raise
+            limit_err = e
+            break
+
+        node_ids.append(node_id)
+        cleanups.append(defer(_delete_shaper, cfg, nl_shaper,
+                              {'scope': 'node', 'id': node_id}))
+        cleanups.append(defer(_delete_shaper, cfg, nl_shaper,
+                              {'scope': 'queue', 'id': queue_id}))
+        max_depth += 1
+        shaper = nl_shaper.get({'ifindex': cfg.ifindex,
+                                'handle': {'scope': 'node', 'id': node_id}})
+        ksft_eq(shaper, {'ifindex': cfg.ifindex,
+                         'handle': {'scope': 'node', 'id': node_id},
+                         'parent': {'scope': 'node', 'id': parent_id},
+                         'metric': 'bps',
+                         'bw-max': bw_max})
+        shaper = nl_shaper.get({'ifindex': cfg.ifindex,
+                                'handle': {'scope': 'queue',
+                                           'id': queue_id}})
+        ksft_eq(shaper, {'ifindex': cfg.ifindex,
+                         'parent': {'scope': 'node', 'id': node_id},
+                         'handle': {'scope': 'queue', 'id': queue_id},
+                         'weight': 1})
+        queue_id += 1
+
+    if limit_err:
+        print(f"# max nesting depth supported: {max_depth} (errno {limit_err.error})")
+    else:
+        print(f"# max nesting depth tested: {max_depth}")
+    ksft_true(max_depth >= 2,
+              f"max nesting depth: {max_depth}")
+
+    # Cleanup: exec the deferred deletes in reverse creation order, so each
+    # queue leaf and deeper node is removed before its parent node.
+    for cleanup in reversed(cleanups):
+        cleanup.exec()
+    ksft_eq(len(nl_shaper.get({'ifindex': cfg.ifindex}, dump=True)), 0)
+
 def queue_update(cfg, nl_shaper) -> None:
     nq = _require_queues(cfg, 4)
     if not cfg.queues:
@@ -648,6 +764,7 @@ def main() -> None:
                   set_node_shaper,
                   group_update_rate,
                   delegation,
+                  nested_depth_limit,
                   dup_leaves,
                   queue_update],
                  args=(cfg, NetshaperFamily()))
-- 
2.53.0-Meta

