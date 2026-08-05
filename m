Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07CD3D16F8
	for <linux-kselftest@vger.kernel.org>; Wed,  5 Aug 2026 03:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785899419; cv=none; b=TfacYCpgBYSIcVxf/PWNQgytJEOkw4552nd5p0IQFG6qAZfzFi7+lmmHyepJj/9Ab9GlMaydU/fvF98dnQdQACbcmOhFt5OAPWZxHKAvQ6h3QFyUtnXIvZJDb5PfWynIxiz5jg+Qou27dX6chNlWWFlEXJt1AXmyIRmyxm9o2xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785899419; c=relaxed/simple;
	bh=J7+TAxwHTK1cC9KFhwWX1h7vQchRo36B00uXMT5HteU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j893/uO9UhphF6oWZoMSIG0KksboVRdaYVccXFhUzfA/XCVpWTR7hx+DJnpoVBriGnM1L+WFRmWl5dn3K+QH204GdqFWfd5XutEbPn0jU6mRP7tymhkAGLH+FX4/+Y0SJH5zO+D6tpMafomGU9HbrRFcCWZMaXIOX36dPUKwkCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OTIvVOtN; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OTIvVOtN"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-456f7012050so1314075fac.0
        for <linux-kselftest@vger.kernel.org>; Tue, 04 Aug 2026 20:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785899417; x=1786504217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4+lZJMF1bstP0Y7Cx/H1yn52yK2NNJ1xKbJgdUuBFDc=;
        b=OTIvVOtNYFeD/AniBIi3c6qIrwkmzRbDIktZNCP+K5EeLbuSoy7Pg5XGE3k53nZg29
         RRWSb+b4sBqNR/onPc6z90bDQdWA3Xn7OfPiduLavQ3Izm20B1vIBKwuOQ0V+Jley38y
         efFEn8QJpxCXMN+gnsDDRKE/vaRSciFfNc1dh9t/84BQCK68dMSA7DkYWMgmk1TsCbwx
         nbtZoFkTAO6PpKmWkwcimIg0eBcGpJ4r/8vEaQjIeKxCTVYCHdqvfqCOf0mqPXXdQtYF
         4QYf33wIcpH+IJNfkAoHA3UDasGrth3R1rZYXROd5SJjUvH2719LKyx/WbBB72g5aS9r
         LQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785899417; x=1786504217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4+lZJMF1bstP0Y7Cx/H1yn52yK2NNJ1xKbJgdUuBFDc=;
        b=Mg2bx80Zkmk0nSrm9eh9ix5BX9Av/eJzDEAfTP2ppgEtCbM8XmQq4XHeq+ccwDlOYH
         kt779K3zkv7S4NaZ9njtjChby0iKl/dW1oK61xTNTu7pk1HuIVhGJYT16w19bsM8Dzy2
         c/F7z6F6g7JW2Lx+l19N1AaedoS9g648LFsgU4uE2K+a0jF+QR/75EfKydnoH7M+35Lj
         ZABrQ/KNX21Ib4NaukwBtoAYmRuVLUq6iHSt9PHWtjwxYw5Rnmdqeia3VxZZwKhsRXBe
         C6V6b6lTUsJq4nVb0MIfn2mNUMtQrV3tsr+wdBKn4hof+aUiK+hSfGB92VddboWImLgG
         gzpA==
X-Forwarded-Encrypted: i=1; AHgh+RqpyAx6FH24sNLPLWEYalPe2lQEJuRut8/BXqlrkTTdNFuglcmxp3czge65eIi3NhgRVTk5g7dXvJp9HHrAcDM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yypne6WVLy1np3+xK6nfzfmnG57zaIZHZH9HnOSTznW4VP5b1Fb
	+X0k83cAuVQKg+H3+8KnoiKdO9Ayhu6ybIMsOS4MDF+h94P4PWAX4+ay
X-Gm-Gg: AR+sD134rwLXvpRef1NuHXXY31Te/ZMMqMdvj9DDqOtK54uRbwIcqK7dcHx6K/qy1GG
	O3cS+25tv9Qh4jo+vKV058a2AGsgktSJud+D3iowtfhMibN5l+ddkRAkJo+RCXxVy7xdtBlng+8
	r4c6c8UTRJyebMPo2xKf3+xW3aPLApVCnst0RxG0BTa9P0zzubKM/XfBb+SE03ylC3CvJs3dDqO
	8nymb0Z38PwBW/bnTnlWlnV/nPvjeDLRH+vUQ9p6IPbkh8VAgUWeXjDA1w3yBVmXMngarMdUhLn
	OZ9RZgmHH1BWd3ohg3ipe9IYN3IH8n5jvM4ABHQsfxL5OQbG7mQDa3I7KyQsrNPoA39GwCwOa2m
	mjNsrcw5fKmjVIulBM/Q8oVxGzB+R+8wNPDr1FDU1+W+wHX5GKgly13r+L6y6Ma8f0nsrqvTJa2
	GfbeF90c8KEQTalQzpBoU+ztUwGq9PrdjiLZDUTaBSIDSV3oQc95Cikg==
X-Received: by 2002:a05:6871:3a0d:b0:456:7f6e:38b8 with SMTP id 586e51a60fabf-45978d97323mr7502837fac.12.1785899416669;
        Tue, 04 Aug 2026 20:10:16 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4599e24dfa6sm1354093fac.6.2026.08.04.20.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 20:10:16 -0700 (PDT)
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
Subject: [PATCH net-next 13/14] selftests: net: shaper: Cover mixed-parent grouping
Date: Tue,  4 Aug 2026 20:09:35 -0700
Message-ID: <20260805030936.1092907-14-mohsin.bashr@gmail.com>
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

Add coverage for grouping leaves that currently belong to different parent
nodes. The test verifies that an implicit parent is rejected, an explicit
parent succeeds, and the old empty parent nodes are cleaned up.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Mohsin Bashir <hmohsin@meta.com>
---
 tools/testing/selftests/drivers/net/shaper.py | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/shaper.py b/tools/testing/selftests/drivers/net/shaper.py
index 02a11e6b9a05..9264aeb74a7a 100755
--- a/tools/testing/selftests/drivers/net/shaper.py
+++ b/tools/testing/selftests/drivers/net/shaper.py
@@ -275,6 +275,105 @@ def invalid_set_preserves_state(cfg, nl_shaper) -> None:
     shapers = nl_shaper.get({'ifindex': cfg.ifindex}, dump=True)
     ksft_eq(len(shapers), 0)
 
+def mixed_parent_group_requires_parent(cfg, nl_shaper) -> None:
+    r"""Grouping leaves from different nodes requires an explicit parent.
+
+        netdev             netdev
+        /    \             parent=netdev
+       N1     N2  group        N
+       |      |   {Q0,Q1}     / \
+       Q0     Q1  ------->   Q0  Q1
+
+    Without an explicit parent the group is rejected; parent=netdev
+    collapses the leaves into one new node.
+    """
+    _require_queues(cfg, 2)
+    _require_caps(cfg, nl_shaper, 'node',
+                  ['support-bw-max', 'support-metric-bps'],
+                  "device does not support node scope shapers with bw_max and metric bps")
+    _require_caps(cfg, nl_shaper, 'queue',
+                  ['support-nesting', 'support-weight'],
+                  "device does not support nested queue scope shapers with weight")
+
+    n1_handle = nl_shaper.group({
+                   'ifindex': cfg.ifindex,
+                   'leaves':[{'handle': {'scope': 'queue', 'id': 0},
+                              'weight': 1}],
+                   'handle': {'scope':'node'},
+                   'metric': 'bps',
+                   'bw-max': 10000})
+    n1_id = n1_handle['handle']['id']
+    defer(_delete_shaper, cfg, nl_shaper, {'scope': 'queue', 'id': 0})
+
+    n2_handle = nl_shaper.group({
+                   'ifindex': cfg.ifindex,
+                   'leaves':[{'handle': {'scope': 'queue', 'id': 1},
+                              'weight': 2}],
+                   'handle': {'scope':'node'},
+                   'metric': 'bps',
+                   'bw-max': 20000})
+    n2_id = n2_handle['handle']['id']
+    defer(_delete_shaper, cfg, nl_shaper, {'scope': 'queue', 'id': 1})
+
+    with ksft_raises(NlError):
+        nl_shaper.group({
+                   'ifindex': cfg.ifindex,
+                   'leaves':[{'handle': {'scope': 'queue', 'id': 0},
+                              'weight': 3},
+                             {'handle': {'scope': 'queue', 'id': 1},
+                              'weight': 4}],
+                   'handle': {'scope':'node'},
+                   'metric': 'bps',
+                   'bw-max': 30000})
+
+    shaper_q0 = nl_shaper.get({'ifindex': cfg.ifindex,
+                               'handle': {'scope': 'queue', 'id': 0}})
+    ksft_eq(shaper_q0, {'ifindex': cfg.ifindex,
+                        'parent': {'scope': 'node', 'id': n1_id},
+                        'handle': {'scope': 'queue', 'id': 0},
+                        'weight': 1})
+    shaper_q1 = nl_shaper.get({'ifindex': cfg.ifindex,
+                               'handle': {'scope': 'queue', 'id': 1}})
+    ksft_eq(shaper_q1, {'ifindex': cfg.ifindex,
+                        'parent': {'scope': 'node', 'id': n2_id},
+                        'handle': {'scope': 'queue', 'id': 1},
+                        'weight': 2})
+
+    node_handle = nl_shaper.group({
+                   'ifindex': cfg.ifindex,
+                   'leaves':[{'handle': {'scope': 'queue', 'id': 0},
+                              'weight': 3},
+                             {'handle': {'scope': 'queue', 'id': 1},
+                              'weight': 4}],
+                   'handle': {'scope':'node'},
+                   'parent': {'scope': 'netdev'},
+                   'metric': 'bps',
+                   'bw-max': 30000})
+    node_id = node_handle['handle']['id']
+
+    for old_id in (n1_id, n2_id):
+        with ksft_raises(NlError):
+            nl_shaper.get({'ifindex': cfg.ifindex,
+                           'handle': {'scope': 'node', 'id': old_id}})
+
+    shaper_q0 = nl_shaper.get({'ifindex': cfg.ifindex,
+                               'handle': {'scope': 'queue', 'id': 0}})
+    ksft_eq(shaper_q0, {'ifindex': cfg.ifindex,
+                        'parent': {'scope': 'node', 'id': node_id},
+                        'handle': {'scope': 'queue', 'id': 0},
+                        'weight': 3})
+    shaper_q1 = nl_shaper.get({'ifindex': cfg.ifindex,
+                               'handle': {'scope': 'queue', 'id': 1}})
+    ksft_eq(shaper_q1, {'ifindex': cfg.ifindex,
+                        'parent': {'scope': 'node', 'id': node_id},
+                        'handle': {'scope': 'queue', 'id': 1},
+                        'weight': 4})
+
+    for i in range(2):
+        _delete_shaper(cfg, nl_shaper, {'scope': 'queue', 'id': i})
+    shapers = nl_shaper.get({'ifindex': cfg.ifindex}, dump=True)
+    ksft_eq(len(shapers), 0)
+
 def _group_under_netdev(cfg, nl_shaper, bw_max=None):
     r"""Group queues under a netdev-scope node; caller owns node teardown.
 
@@ -1193,6 +1292,7 @@ def main() -> None:
                   del_nshapers,
                   set_all_supported_attrs,
                   invalid_set_preserves_state,
+                  mixed_parent_group_requires_parent,
                   basic_groups,
                   basic_groups_with_rate,
                   qgroups,
-- 
2.53.0-Meta

