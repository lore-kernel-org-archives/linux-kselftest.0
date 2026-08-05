Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22013C108E
	for <linux-kselftest@vger.kernel.org>; Wed,  5 Aug 2026 03:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785899391; cv=none; b=ICxdAIsBOlvarZisnS77nMCV3R04WJw7duWXeqQKbU7vCDEslJNoUhlmC7BlVvtcxMkZnOev24JV/XfHq6rOPJfBmffqy+p0/HNS5Oy/O8ytfAJc9BMObGA16kw8MLLzeRu8qGWSfEXh6F9n2tXiATKZpuS8bmZdyRnoP77lRSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785899391; c=relaxed/simple;
	bh=rVcVd3C3n+Q0mPC6lk/W4y9JERWfHLNkhFct7QT2Nq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vACQJyhx0Vg9xSUg2aQ7m/JpdabzKvPL+qVQWhib0LjAWDKn5lnhVo+eKZfy9TndBWq3g8PJVtIYiRi77bnwvREk6iaWl7a66/seLgBalwNgllFUsAqf2MXfwOO9cIlnIqLFPAQ5pnHxMHH0qVKHi4JLAtPBj+6FXsWRuQ6NciU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZHuapcYM; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZHuapcYM"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4a46a53abc9so315725b6e.3
        for <linux-kselftest@vger.kernel.org>; Tue, 04 Aug 2026 20:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785899385; x=1786504185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TNgnmn2b+Vqb757WTvKl3lRNBm9PUuScJQ0FPRh8Z4E=;
        b=ZHuapcYM53FQY1mprUSQ8NQCexXrXWFPzKjxcsNuMdEY1rmOF093QxExwWf3e+jVYC
         e3J46hOug+ngs9vVHqgD0Q4B4HlpLD3CXF14RTIlHrE3VjMM/rREuTwN9cryljYZdfTC
         9UkdED6F2sdMOZ38uv8CNtLBOKNSfl5tHcj5OStFU4QHlWeqgyFP0oUA/UWSMdxOsrZa
         TB0juBvXAEnH4QsyqVV8n1GZTOOCoWRLWHjvKNHCrzMoMaClO+TWpX8jqQezG64HJ45a
         2ZUgTRd3pwr6dS8OuKtW6KF1cMnBotja8qk/aApZQq9gZe6MpeOoLOLhAiCGLJq+5FPV
         InQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785899385; x=1786504185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TNgnmn2b+Vqb757WTvKl3lRNBm9PUuScJQ0FPRh8Z4E=;
        b=tH5UPK8KSjjQnQ1f7xPOgJX7FL76OvfNK1+Ze/viNnzWXB29kcEdX+KuaWAxCKwF6e
         AQ/2dcxTApTfaRQ9ZLAwmjVH8bFvgpealTuZUmx2/jK1GPv8zg2CrOpQpbizEgXu79l4
         jRpKe2UX5DRsY+4p5QdAVQKvPufOIQLTHEq6Cq+cyS5qynQ34u9bxQ37skyetSpFDMq4
         AEv18L2QMrw0HSNCT00f8N5+5fU7RPG+Am5TTfYJpymujWaM4L2z5603Nih2LFD1bQbK
         52+99D2bRs1p36UBu6okFdfOS6RDFX/q6iHkXhTkFnjng5+7flUrSlC7HYqgQEQ04tiG
         vkcg==
X-Forwarded-Encrypted: i=1; AHgh+RqZCYoqmJ6zKlE/H4Jt//mk2z1fwez3fc7Hb4UZ8w4n/mVjeCEVRx1RBC3hREY1O8yaITG6/d6AQ8j7ZTDHzW0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtZbbTtmiQFTAQCfyvPIDB0/5dwRQKxRHEG9zgfd8DLqhtr4wM
	9zmva8xBGAaO2gERgJ0/IoAG7VTHfPn2YqMi2uEKzUzIePonlh17sdAY
X-Gm-Gg: AR+sD13CWfLnpH4liluZW0R5LHndfdOZuhrIoS1KEzuR5IkkXTDEv8xAJkSpLGU3k4U
	5Ib2bv1cQv2UUrKrSi5GvH3c2x/dVgK/2UM1jdKu8g8zyvL4fc2N+Xy9a72FdiH2Kq2pdvZaSsy
	PSLsogK9eRjEhVBZf7QYOA+NCcEfBtq27umSkSrCNskYxEzjh/2ldbSqNv5ilqFIHtiu8KxcgvP
	Tlocf5tWZtWk4x8+HacrKnpjZpvDLo0NWA14lmTCo+6UAthDvaVoEYDaAsVjKLi0r7HJotxJTYV
	n2VhLM7xlTEaqoZPIgBDnj+PODExextUt9ksgIMxm1XD6v/hBYG895gkZrhqOHOFYM/niv+Kesy
	FIlI/rG2t/2TRB01aCsjeTzoJtngY1Slcoj+mdErIz3Aycw9LKdmANtCSHo9sk4CSvc76Ok4wFl
	22sUxC9zESh92TPUdFKXb5sNb3A8C5qI4btMLs/Nc9UjsqZx+fg3Tu/rY0Ww==
X-Received: by 2002:a05:6808:118c:b0:497:df42:1e05 with SMTP id 5614622812f47-4afade463b8mr2002026b6e.8.1785899385498;
        Tue, 04 Aug 2026 20:09:45 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff:59::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4afae45b630sm1066020b6e.1.2026.08.04.20.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 20:09:44 -0700 (PDT)
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
Subject: [PATCH net-next 02/14] selftests: net: shaper: Prepare helpers for group tests
Date: Tue,  4 Aug 2026 20:09:24 -0700
Message-ID: <20260805030936.1092907-3-mohsin.bashr@gmail.com>
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

dup_leaves expects the kernel to reject a group request that lists the same
queue twice. When that rejection does not happen, ksft_raises only records
a failed check and leaves cm.exception as None, so the following errno
check raises AttributeError. Worse, the accepted group request leaves a
node shaper and queue 0 behind, which makes later tests fail for an
unrelated reason. Handle the negative test explicitly instead. If group
fails, verify that the errno is EINVAL and return. If group succeeds,
delete the node returned by the operation and queue 0 before reporting the
failure.

Give the duplicate leaves different weights so the request still contains
two distinct leaf entries while exercising duplicate handle validation.
This also introduces _delete_shaper(), cached _cap_get(), and
_require_caps() helpers as preparation for the following shaper group
tests. The follow-on tests need the same capability checks for node and
queue scope support. Keeping that logic in one place avoids repeating raw
EOPNOTSUPP handling in each test.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Mohsin Bashir <hmohsin@meta.com>
---
 tools/testing/selftests/drivers/net/shaper.py | 145 +++++++++++-------
 1 file changed, 86 insertions(+), 59 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/shaper.py b/tools/testing/selftests/drivers/net/shaper.py
index c80a4bf8cc05..1954f3263f25 100755
--- a/tools/testing/selftests/drivers/net/shaper.py
+++ b/tools/testing/selftests/drivers/net/shaper.py
@@ -2,13 +2,52 @@
 # SPDX-License-Identifier: GPL-2.0
 
 import errno
+import glob
 
 from lib.py import ksft_run, ksft_exit
-from lib.py import ksft_eq, ksft_raises, ksft_true, KsftSkipEx
+from lib.py import ksft_eq, ksft_true, ksft_raises, KsftSkipEx
 from lib.py import EthtoolFamily, NetshaperFamily
 from lib.py import NetDrvEnv
 from lib.py import NlError
-from lib.py import cmd
+from lib.py import cmd, defer
+
+def _delete_shaper(cfg, nl_shaper, handle) -> None:
+    """ Delete the shaper identified by handle, ignoring a missing-shaper error. """
+    try:
+        nl_shaper.delete({'ifindex': cfg.ifindex,
+                          'handle': handle})
+    except NlError as e:
+        if e.error != errno.ENOENT:
+            raise
+
+def _require_queues(cfg, count):
+    """ Return the netdev TX queue count, skipping the test if fewer than count exist. """
+    qcnt = len(glob.glob(f"/sys/class/net/{cfg.ifname}/queues/tx-*"))
+    if qcnt < count:
+        raise KsftSkipEx(f"netdev has {qcnt} queues, {count} required")
+    return qcnt
+
+def _cap_get(cfg, nl_shaper, scope):
+    """ Return the shaper capabilities for the given scope, caching them on cfg. """
+    if not hasattr(cfg, 'cap_cache'):
+        cfg.cap_cache = {}
+    if scope not in cfg.cap_cache:
+        cfg.cap_cache[scope] = nl_shaper.cap_get({'ifindex': cfg.ifindex,
+                                                  'scope': scope})
+
+    return cfg.cap_cache[scope]
+
+def _require_caps(cfg, nl_shaper, scope, caps, msg) -> None:
+    """ Skip the test unless the given scope advertises all the required caps. """
+    try:
+        supported = _cap_get(cfg, nl_shaper, scope)
+    except NlError as e:
+        if e.error == errno.EOPNOTSUPP:
+            raise KsftSkipEx(f"{scope} scope shapers not supported by the device")
+        raise
+
+    if not set(caps).issubset(supported):
+        raise KsftSkipEx(msg)
 
 def get_shapers(cfg, nl_shaper) -> None:
     try:
@@ -44,17 +83,8 @@ def set_qshapers(cfg, nl_shaper) -> None:
     if not 'support-bw-max' in caps or not 'support-metric-bps' in caps:
         raise KsftSkipEx("device does not support queue scope shapers with bw_max and metric bps")
 
-    cfg.queues = True;
-    netnl = EthtoolFamily()
-    channels = netnl.channels_get({'header': {'dev-index': cfg.ifindex}})
-    if channels['combined-count'] == 0:
-        cfg.rx_type = 'rx'
-        cfg.nr_queues = channels['rx-count']
-    else:
-        cfg.rx_type = 'combined'
-        cfg.nr_queues = channels['combined-count']
-    if cfg.nr_queues < 3:
-        raise KsftSkipEx(f"device does not support enough queues min 3 found {cfg.nr_queues}")
+    _require_queues(cfg, 3)
+    cfg.queues = True
 
     nl_shaper.set({'ifindex': cfg.ifindex,
                    'handle': {'scope': 'queue', 'id': 1},
@@ -140,8 +170,7 @@ def del_nshapers(cfg, nl_shaper) -> None:
 def basic_groups(cfg, nl_shaper) -> None:
     if not cfg.netdev:
         raise KsftSkipEx("netdev shaper not supported by the device")
-    if cfg.nr_queues < 3:
-        raise KsftSkipEx(f"netdev does not have enough queues min 3 reported {cfg.nr_queues}")
+    _require_queues(cfg, 3)
 
     try:
         caps = nl_shaper.cap_get({'ifindex': cfg.ifindex,
@@ -186,28 +215,14 @@ def basic_groups(cfg, nl_shaper) -> None:
                       'handle': {'scope': 'netdev'}})
 
 def qgroups(cfg, nl_shaper) -> None:
-    if cfg.nr_queues < 4:
-        raise KsftSkipEx(f"netdev does not have enough queues min 4 reported {cfg.nr_queues}")
-    try:
-        caps = nl_shaper.cap_get({'ifindex': cfg.ifindex,
-                                  'scope':'node'})
-    except NlError as e:
-        if e.error == 95:
-            raise KsftSkipEx("shapers not supported by the device")
-        raise
-    if not 'support-bw-max' in caps or not 'support-metric-bps' in caps:
-        raise KsftSkipEx("device does not support node scope shapers with bw_max and metric bps")
-    try:
-        caps = nl_shaper.cap_get({'ifindex': cfg.ifindex,
-                                  'scope':'queue'})
-    except NlError as e:
-        if e.error == 95:
-            raise KsftSkipEx("shapers not supported by the device")
-        raise
-    if not 'support-nesting' in caps or not 'support-weight' in caps or not 'support-metric-bps' in caps:
-            raise KsftSkipEx("device does not support nested queue scope shapers with weight")
+    _require_queues(cfg, 4)
+    _require_caps(cfg, nl_shaper, 'node',
+                  ['support-bw-max', 'support-metric-bps'],
+                  "device does not support node scope shapers with bw_max and metric bps")
+    _require_caps(cfg, nl_shaper, 'queue',
+                  ['support-nesting', 'support-weight'],
+                  "device does not support nested queue scope shapers with weight")
 
-    cfg.groups = True;
     node_handle = nl_shaper.group({
                    'ifindex': cfg.ifindex,
                    'leaves':[{'handle': {'scope': 'queue', 'id': 1},
@@ -285,17 +300,12 @@ def qgroups(cfg, nl_shaper) -> None:
     ksft_eq(len(shapers), 0)
 
 def delegation(cfg, nl_shaper) -> None:
-    if not cfg.groups:
-        raise KsftSkipEx("device does not support node scope")
-    try:
-        caps = nl_shaper.cap_get({'ifindex': cfg.ifindex,
-                                  'scope':'node'})
-    except NlError as e:
-        if e.error == 95:
-            raise KsftSkipEx("node scope shapers not supported by the device")
-        raise
-    if not 'support-nesting' in caps:
-        raise KsftSkipEx("device does not support node scope shapers nesting")
+    _require_queues(cfg, 4)
+    _require_caps(cfg, nl_shaper, 'node',
+                  ['support-bw-max', 'support-metric-bps', 'support-nesting'],
+                  "device does not support node scope shapers with bw_max, metric bps and nesting")
+    _require_caps(cfg, nl_shaper, 'queue', ['support-nesting', 'support-weight'],
+                  "device does not support nested queue scope shapers with weight")
 
     node_handle = nl_shaper.group({
                    'ifindex': cfg.ifindex,
@@ -376,19 +386,24 @@ def delegation(cfg, nl_shaper) -> None:
     ksft_eq(len(shapers), 0)
 
 def queue_update(cfg, nl_shaper) -> None:
-    if cfg.nr_queues < 4:
-        raise KsftSkipEx(f"netdev does not have enough queues min 4 reported {cfg.nr_queues}")
+    nq = _require_queues(cfg, 4)
     if not cfg.queues:
         raise KsftSkipEx("device does not support queue scope")
 
+    netnl = EthtoolFamily()
+    channels = netnl.channels_get({'header': {'dev-index': cfg.ifindex}})
+    ch_type = 'combined' if channels['combined-count'] else 'tx'
+
     for i in range(3):
         nl_shaper.set({'ifindex': cfg.ifindex,
                        'handle': {'scope': 'queue', 'id': i},
                        'metric': 'bps',
                        'bw-max': (i + 1) * 1000})
+    defer(cmd, f"ethtool -L {cfg.dev['ifname']} {ch_type} {nq}")
+
     # Delete a channel, with no shapers configured on top of the related
     # queue: no changes expected
-    cmd(f"ethtool -L {cfg.dev['ifname']} {cfg.rx_type} 3")
+    cmd(f"ethtool -L {cfg.dev['ifname']} {ch_type} 3")
     shapers = nl_shaper.get({'ifindex': cfg.ifindex}, dump=True)
     ksft_eq(shapers, [{'ifindex': cfg.ifindex,
                        'parent': {'scope': 'netdev'},
@@ -408,7 +423,7 @@ def queue_update(cfg, nl_shaper) -> None:
 
     # Delete a channel, with a shaper configured on top of the related
     # queue: the shaper must be deleted, too
-    cmd(f"ethtool -L {cfg.dev['ifname']} {cfg.rx_type} 2")
+    cmd(f"ethtool -L {cfg.dev['ifname']} {ch_type} 2")
 
     shapers = nl_shaper.get({'ifindex': cfg.ifindex}, dump=True)
     ksft_eq(shapers, [{'ifindex': cfg.ifindex,
@@ -423,7 +438,7 @@ def queue_update(cfg, nl_shaper) -> None:
                        'bw-max': 2000}])
 
     # Restore the original channels number, no expected changes
-    cmd(f"ethtool -L {cfg.dev['ifname']} {cfg.rx_type} {cfg.nr_queues}")
+    cmd(f"ethtool -L {cfg.dev['ifname']} {ch_type} {nq}")
     shapers = nl_shaper.get({'ifindex': cfg.ifindex}, dump=True)
     ksft_eq(shapers, [{'ifindex': cfg.ifindex,
                        'parent': {'scope': 'netdev'},
@@ -443,25 +458,37 @@ def queue_update(cfg, nl_shaper) -> None:
 
 def dup_leaves(cfg, nl_shaper) -> None:
     """ Ensure that the kernel rejects duplicate leaves. """
-    if not cfg.groups:
-        raise KsftSkipEx("device does not support node scope")
+    _require_caps(cfg, nl_shaper, 'node', ['support-bw-max', 'support-metric-bps'],
+                  "device does not support node scope shapers with bw_max and metric bps")
+    _require_caps(cfg, nl_shaper, 'queue', ['support-nesting', 'support-weight'],
+                  "device does not support nested queue scope shapers with weight")
 
+    node_handle = None
     with ksft_raises(NlError) as cm:
-        nl_shaper.group({
+        node_handle = nl_shaper.group({
                    'ifindex': cfg.ifindex,
-                   'leaves':[{'handle': {'scope': 'queue', 'id': 0}},
-                             {'handle': {'scope': 'queue', 'id': 0}}],
+                   'leaves':[{'handle': {'scope': 'queue', 'id': 0},
+                              'weight': 1},
+                             {'handle': {'scope': 'queue', 'id': 0},
+                              'weight': 2}],
                    'handle': {'scope':'node'},
                    'metric': 'bps',
                    'bw-max': 10000})
+
+    # Clean up in case the kernel wrongly accepted the request.
+    if node_handle:
+        _delete_shaper(cfg, nl_shaper, node_handle['handle'])
+    _delete_shaper(cfg, nl_shaper, {'scope': 'queue', 'id': 0})
+
+    # ksft_raises() has already recorded the failure if nothing was raised.
+    if cm.exception is None:
+        return
     ksft_eq(cm.exception.error, errno.EINVAL)
 
 def main() -> None:
     with NetDrvEnv(__file__, queue_count=4) as cfg:
         cfg.queues = False
         cfg.netdev = False
-        cfg.groups = False
-        cfg.nr_queues = 0
         ksft_run([get_shapers,
                   get_caps,
                   set_qshapers,
-- 
2.53.0-Meta

