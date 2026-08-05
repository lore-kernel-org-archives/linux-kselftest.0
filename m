Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AF23C2BB9
	for <linux-kselftest@vger.kernel.org>; Wed,  5 Aug 2026 03:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785899395; cv=none; b=FGRZxTSVZUBFfuG/H0GGSoxGzQgOMfn2v5M9FHTGGkhuuz6R/f8r4H+OvxZDnwl7tgRZIK4zkxtRkyKVilMq9ypUhIp+POO46rupkT3gR5CkE+eh8PBVOpnWa1RrItZ9aGN1G7n0cvesoUqZRmiXTX++yDfiZ4SJJWa3PvIDgZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785899395; c=relaxed/simple;
	bh=PE7ifyCGoFgRy7ddoLf7ecEm718DOJWN2jboMYBlwCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E6prhpr84wwHIIxNAhkZeHD0B6lXt2ANWD0K9W9ZMyXolM+vo7HSaloVh3smbejMdu/Ba/5NMelfC7J1KMq8uaZD82XZcKO8+6suueCM9xp/fw5v5WbXi2Ct2A52A9jKvmAvk3SIrHesTc18d9agFx1V8twtrFkoW4twTUHba+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HBb7gtoj; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HBb7gtoj"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6ae50ba83efso866740eaf.0
        for <linux-kselftest@vger.kernel.org>; Tue, 04 Aug 2026 20:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785899391; x=1786504191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lf+95Lv9aBLdQ2fxeuuLQftB8DvcOe6MQ4BDksXA8qc=;
        b=HBb7gtojsfYlAkR1l0hQQZN5GlTdFPTu30bKeB6GWNVz7aYoEdx2pleAntMWnkYOZo
         fXrVRSixOCjqGcA3orqqd2VjtkaICVXB8CG7tvNKt+g5WgCwjUJFwwCR5V8hkFJxEJjZ
         uAUA2GIqwITDBtTNSn7arbs8hB+XezdcDpBdvW1gmSd7gTqYo9fDr+jEws/OC3JOgnhe
         W+qMBjLf9vqv2G9E+9NODTkQ5xLToGSPZz8Il5sCPYctaxErHc8uyaPKa5FVi2MpZ1o2
         aPhjEbKF8gdEYd9duNFBVpiy/sgVKJ5OA30H4Z9+cDPzxWrjXpbr6k9AjEDEEe8qwpC1
         snGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785899391; x=1786504191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lf+95Lv9aBLdQ2fxeuuLQftB8DvcOe6MQ4BDksXA8qc=;
        b=kufjcF0gm46BrRwMf/qhzk3tGcLx6KsvvjelreMCVjjUhNxQr8jqg+6Z6JnHOuSfW5
         6Nd/gWsHFnP5gETupo5S5ALVdohLCKS6P+QoUNl58/O5cLKM8bPW00QNk+9BzFKev+b/
         M1k8BAPj/aVWcgnhFykKincrWeuhKRs9U9+WXaVh7XNgtnqGf65LScQzQkI0ZhCg6MfS
         VJATje/fi4yiRoQum5QIpTu1So+LrTEdlHDtl9woWp7Gd5OpWSQGfJ2XyeztlTD6YHhy
         H0bQ1pc0eLIGcxXvHq9k2aK/qS0QLMGC0NTnhAqFrM9+RmL0oSCdtO76OAusJ710emZ1
         3+pw==
X-Forwarded-Encrypted: i=1; AHgh+RrvJFHnEPeyV/dW7PoSTITrquPkmNJeyNs9GW1f9IMLvGy2SMBNnGPR5pE/RB0AlxximiXejLRI6BxKPdhq+CM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFfJxp30KP3rchgQP7dX1xLOQzy76mpoeN45Z8dn1R1JRFuADA
	Ywu+xplNChb7tqDvbRwmlt2htmhpewEnYR0IMDzcRzWbZ7XIDLg9VNDi
X-Gm-Gg: AR+sD10BYaWg6mThtgjfT08oP+U2ey+GQd5QBi4HMClSun49Hpy24Qt+gEALbbD8CcO
	y7wNTElWB8gXjCPgk1HGyq4DkjhiZzEj7cXzJq8asBFzD8iNvHE43p9Ct37QqVI07RbwS4FTiIx
	g2+IPxOpJYn0xWZp0qxIT/MC+sFBxL+thF9k6itDQN9BRJ6y6+MJ3EUA5bLjAE5auM5w73V8tUt
	oHnJQ8En0B+1/7eo3YSkR+Or3bWLo5hawGqoo60SARljdsAiEj5YR3RWSjchUnBAaMdlsVhEKc/
	Js948h/dFF46s7EnGVWetM1NoZoy8jb3z6S6I2wd8LPWjmDazFFAQUGFRx6I5KqqQWlGrkgJfek
	May+3oU8JyZuPfY31917nVuJhkbfjPSuaejXQI/IjxjsgsvNGbRAON2vppoKB3IZYwSrxOssBwe
	qED0l0/AcnkFjTJTm2bRLPJ2XqE/2IDjk8hD3X7PfR3TVSSVEGxAbEvRTO
X-Received: by 2002:a4a:edca:0:b0:6ae:7f68:22f3 with SMTP id 006d021491bc7-6ae82a9ea9amr7666929eaf.16.1785899391072;
        Tue, 04 Aug 2026 20:09:51 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff:8::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f1df5a4f9bsm2087676a34.23.2026.08.04.20.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 20:09:50 -0700 (PDT)
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
Subject: [PATCH net-next 04/14] selftests: net: shaper: Add basic_groups_with_rate test
Date: Tue,  4 Aug 2026 20:09:26 -0700
Message-ID: <20260805030936.1092907-5-mohsin.bashr@gmail.com>
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

Add a test that groups queues under the netdev parent with rate
limiting enabled. Extract the common group-under-netdev flow into
_group_under_netdev helper to share with basic_groups.

The test independently checks for netdev scope bw_max and metric
capabilities before proceeding, and verifies that the netdev
shaper persists after leaf deletion.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Mohsin Bashir <hmohsin@meta.com>
---
 tools/testing/selftests/drivers/net/shaper.py | 83 +++++++++++++++----
 1 file changed, 68 insertions(+), 15 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/shaper.py b/tools/testing/selftests/drivers/net/shaper.py
index 45a4bf42995e..168a8dd057e5 100755
--- a/tools/testing/selftests/drivers/net/shaper.py
+++ b/tools/testing/selftests/drivers/net/shaper.py
@@ -167,20 +167,25 @@ def del_nshapers(cfg, nl_shaper) -> None:
     shapers = nl_shaper.get({'ifindex': cfg.ifindex}, dump=True)
     ksft_eq(len(shapers), 0)
 
-def basic_groups(cfg, nl_shaper) -> None:
-    _require_queues(cfg, 3)
-
-    _require_caps(cfg, nl_shaper, 'netdev', [], "netdev scope not supported by the device")
-    _require_caps(cfg, nl_shaper, 'queue', ['support-nesting', 'support-weight'],
-                  "queue scope not supported with nesting and weight")
-
-    node_handle = nl_shaper.group({
-                        'ifindex': cfg.ifindex,
-                        'leaves':[{'handle': {'scope': 'queue', 'id': 1},
-                                   'weight': 1},
-                                  {'handle': {'scope': 'queue', 'id': 2},
-                                   'weight': 2}],
-                         'handle': {'scope':'netdev'}})
+def _group_under_netdev(cfg, nl_shaper, bw_max=None):
+    r"""Group queues under a netdev-scope node; caller owns node teardown.
+
+        netdev               netdev
+         /  \      del Q1,Q2
+        Q1  Q2     ------->   (netdev node persists)
+    """
+    group_args = {
+        'ifindex': cfg.ifindex,
+        'leaves': [{'handle': {'scope': 'queue', 'id': 1},
+                    'weight': 1},
+                   {'handle': {'scope': 'queue', 'id': 2},
+                    'weight': 2}],
+        'handle': {'scope': 'netdev'}}
+    if bw_max:
+        group_args['metric'] = 'bps'
+        group_args['bw-max'] = bw_max
+
+    node_handle = nl_shaper.group(group_args)
     ksft_eq(node_handle, {'ifindex': cfg.ifindex,
                           'handle': {'scope': 'netdev'}})
 
@@ -194,10 +199,29 @@ def basic_groups(cfg, nl_shaper) -> None:
     ksft_eq(shaper, {'ifindex': cfg.ifindex,
                      'parent': {'scope': 'netdev'},
                      'handle': {'scope': 'queue', 'id': 1},
-                     'weight': 1 })
+                     'weight': 1})
     for dq in del_queues:
         dq.exec()
 
+    # Caller owns the node teardown so it can verify the netdev-scope node
+    # survives leaf deletion before removing it.
+    return del_node
+
+def basic_groups(cfg, nl_shaper) -> None:
+    r"""Group queues under a netdev-scope node, then tear it down.
+
+        netdev
+         /  \
+        Q1  Q2
+    """
+    _require_queues(cfg, 3)
+
+    _require_caps(cfg, nl_shaper, 'netdev', [], "netdev scope not supported by the device")
+    _require_caps(cfg, nl_shaper, 'queue', ['support-nesting', 'support-weight'],
+                  "queue scope not supported with nesting and weight")
+
+    del_node = _group_under_netdev(cfg, nl_shaper)
+
     shapers = nl_shaper.get({'ifindex': cfg.ifindex}, dump=True)
     ksft_eq(shapers, [{'ifindex': cfg.ifindex,
                        'handle': {'scope': 'netdev'}}])
@@ -206,6 +230,34 @@ def basic_groups(cfg, nl_shaper) -> None:
     shapers = nl_shaper.get({'ifindex': cfg.ifindex}, dump=True)
     ksft_eq(len(shapers), 0)
 
+def basic_groups_with_rate(cfg, nl_shaper) -> None:
+    r"""Rate-limited netdev-scope node outlives deletion of its leaves.
+
+        netdev[10kbps]          netdev[10kbps]
+          /  \       del Q1,Q2
+        Q1    Q2     ------->    (node persists)
+    """
+    bw_max = 10000
+
+    _require_queues(cfg, 3)
+
+    _require_caps(cfg, nl_shaper, 'netdev', ['support-bw-max', 'support-metric-bps'],
+                  "device does not support netdev scope rate limiting")
+    _require_caps(cfg, nl_shaper, 'queue', ['support-nesting', 'support-weight'],
+                  "device does not support queue scope shapers with nesting and weight")
+
+    del_node = _group_under_netdev(cfg, nl_shaper, bw_max=bw_max)
+
+    # Deleting all the leaves shaper does not affect the node one
+    # when the latter has 'netdev' scope.
+    shapers = nl_shaper.get({'ifindex': cfg.ifindex}, dump=True)
+    ksft_eq(shapers, [{'ifindex': cfg.ifindex,
+                       'handle': {'scope': 'netdev'},
+                       'metric': 'bps',
+                       'bw-max': bw_max}])
+
+    del_node.exec()
+
 def qgroups(cfg, nl_shaper) -> None:
     _require_queues(cfg, 4)
     _require_caps(cfg, nl_shaper, 'node',
@@ -488,6 +540,7 @@ def main() -> None:
                   set_nshapers,
                   del_nshapers,
                   basic_groups,
+                  basic_groups_with_rate,
                   qgroups,
                   delegation,
                   dup_leaves,
-- 
2.53.0-Meta

