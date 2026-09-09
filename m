Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63633D3D18;
	Wed,  9 Sep 2026 19:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788983506; cv=none; b=FjiMNHU6rbRbB7BD/4YEEnDcVzyxZMbCVD9RlbdcQRpskPIcCQYAIJqsQvWxeMCzHaGJw+VEzIxc1PQgPfNpTPh/E+l55b7f1TqXupHDpjJQA2hEuvnLzvXBIl9jQYudz7iIo6xp3D2RnWRzstzlNCH77iBiAtS7JO8popL73Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788983506; c=relaxed/simple;
	bh=bb5BYgKa09OW6lhhuFRqBlw0NXbM/PKnsSXjhp92tdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HHA1u1R45oLv2Tg171QWC/092oUpfL/svBk4LG5mLjF4M501Q1nUHB7mNivdFUHYPSDW+9+0LQS9wgpM8Sr4Ghktzllocs5lhIqVSQni2t/TWZ+d1pU8dByNfxt2fMuqBudrDtnuxhElqmV2HtAqKoikbCuCBJJ5hDoqKj0J+Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com; spf=pass smtp.mailfrom=fastmail.com; dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b=iKkzZ0GA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VCUdXAc5; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b="iKkzZ0GA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VCUdXAc5"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 8418D1D00067;
	Wed,  9 Sep 2026 15:51:42 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 09 Sep 2026 15:51:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1788983502;
	 x=1789069902; bh=zoVUj5F+8FVqGG22Q1uCXrQ58eGyDtPNSPzvgjqr55k=; b=
	iKkzZ0GAa0tVpMJLSOh2lOPXkLWsxrh9U2OTl1ZMajYtCfbsgJrXtRs6zjDS0ZoN
	7z5ESUatQacKIHQDngIe9sOlInIwpiCQiesR/2hnEN5rAkVh1PGEFPWxnjQTu5Ah
	sRgVTXWbtqh3WuLDcSoMiiorPg8Wh19sLIq5PJTqarzTdVX7RGl8O8XvEAg1uuXX
	DcKcdhV9OlOpgFuEMdqaChlIRXJI0dLBj41fsIqxyoibNQibMgQWPfEJrJIti9xu
	vAKd1FpIa6wC0AxbXzMbPF1FLAX4q5laDy1G1sbl8AEgn5YASaRssx6+VYhUreNT
	BpcZlFnr6FDh93dkn6JR+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788983502; x=
	1789069902; bh=zoVUj5F+8FVqGG22Q1uCXrQ58eGyDtPNSPzvgjqr55k=; b=V
	CUdXAc5+khVbRGY1tm6UYOBJwBgGaRGM7QxpkVBV1sdXkVTLahHtGJGZ/Qmi2C1s
	H3wUWl1Se5qlu7NrUw2/jkFiudcHaEslxcZS8q7f/ML37mLUGPNRqS63s0JZV46O
	Qs9vMKKG+iz8+Rncn8L4+1Ywl869zl4Qb4cyARJzGuc20+sRfa2VYjzOxr095Ki0
	XXrJ+TZBW7fHgvyELdPAXB/H+bhW7F3LwmMBwU4H7/PZPVujzXnPkbevK7HK3nRm
	HBy/8sseMuEpMiEfghz3TEo+KEAiDNfxHkAg+fPjP3Y5LYdI8krZaaegtCdoxJCd
	ePWoRmX7v99xEA2dXk46g==
X-ME-Sender: <xms:zrihajOIlwLs8-bHHEl3qXkpSS3QMu3LYRAzvKZ-__hFu-aLOTUoUQ>
    <xme:zrihamLgWMqh4_DxfEG8PDGzonXpeMElTayjopw_SXs_NaGQ_Ef-LgXrUz1iVAK_i
    REDHXYHbFkM6FEYcDYShkLRxmr9nTrgEqIgKhiAHMHNxjb7elmpBPGc>
X-ME-Received: <xmr:zrihat1XQmGFK-INhyeBArImlPDqhjDFdR9aKCkp_CF4-6qQNjCEUALGQm94njbT>
X-ME-Proxy-Cause: dmFkZTErJXQT89xdNSpbfG162S52xmEnv9hkTSgvQMpTW0DT7OWpo1xulYU1WJr+H/t/6c
    YxU8mCV7tzNTPWCtrK+C0aefe9D+fIiG8Zwe3e5360Kmzo6PwgnF4zLkhYIqtiFcLHNz8k
    8kG/AdTFqH4mn1i25MWHJD6Y7FW4VS4FnquBG5AbU1b3tpmwsfwuSnobwaN1Xelf708tGu
    KesOufeEfTmdIFrM5T122D4yfOMT2EDLVwpbyJSpx2lsVxxQ6YIaPR83tP7tJog5tFdC3x
    3PPTA3Dgs+0xXrQrjzcZsH/7nbizYjypIVUt9+dLhSQqBsJNdG+VtoaGxFw6+6Yqq+Abit
    T7QBif/3DwoCkHLfp8iQFZzwHyixolWPR9ssTSv60r72xXIvGY1KF0jZ5A5UST654bSvYf
    zknMdCeL8/rsARrlz631r4oTVDutf9kvWSjxR3GYXJEW/yuQ1FRBwYUBTc/SDs3ByKt5YW
    lNxrGbrjtY81iSjb6e4Mpq0wAyQY3TFsRjmX8PZZy0fxXZoXkhDSXMvPJNsrd88Q9897qa
    yW5ihAsgCsI2pli9iVSnnkVvWuhG+rwQw/SDpK7dkpvA5XjrYQHZCfTmxyLRlPqpE7+8ZX
    uv1GJ6pHixu5VYXnddqI0FVGeyBGkxQ/jYdB3EDsTbzMaUUJl4JARkPhngDw
X-ME-Proxy: <xmx:zrihaiV9ZAwjNnuLAdq-z_J4Jrxj89qbg6asZhQ5dk83ZwjabvqwDg>
    <xmx:zrihanPKovp2jKiGUZ2NQ1pZgZr-HsBR5dPRwLa9vCLs2M8j3-GilA>
    <xmx:zrihat1XHEy_YV1bnc-Yk-DbXJ2nKCczj3A2oIadMwqzidT3CamPyg>
    <xmx:zrihajQSiVSxBlG-9ug7AIE1KlFUB8TxVpu0ItJhvV9kvhCgdNmtbw>
    <xmx:zrihai2LQNuTNJJK6GDiqfASbC4vtyRk8g8Q90Wuo4ANhZ0dcDnAuIP6>
Feedback-ID: i80b64ba7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 15:51:41 -0400 (EDT)
From: Juanlu Herrero <juanlu@fastmail.com>
Date: Wed, 09 Sep 2026 14:51:28 -0500
Subject: [PATCH net-next v7 6/6] selftests: net: add rss_multiqueue test
 variant to iou-zcrx
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-iou-zcrx-v7-6-6b5d48a2a922@fastmail.com>
References: <20260909-iou-zcrx-v7-0-6b5d48a2a922@fastmail.com>
In-Reply-To: <20260909-iou-zcrx-v7-0-6b5d48a2a922@fastmail.com>
To: dw@davidwei.uk, netdev@vger.kernel.org
Cc: io-uring@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kuba@kernel.org, asml.silence@gmail.com, 
 pabeni@redhat.com, shuah@kernel.org, juanlu@fastmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3662; i=juanlu@fastmail.com;
 h=from:subject:message-id; bh=bb5BYgKa09OW6lhhuFRqBlw0NXbM/PKnsSXjhp92tdg=;
 b=owGbwMvMwCWW/91SPSt7w03G02pJDFkLdxx9oXFTMcwwr7cl9K1X3hIDtc89t/1UTrAn2ybtX
 X7z5csXHRNZGMS4GCzFFFk8Xoq0aEytaLyrGiEIM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6BgzcHEKwFRL1TAyLH3RE96s6iDLuUyvcLrBX+UZD6N/ri3jt1p4tn/Z6ZY5powMWz6cbzw
 muPPF4gkhatcWyjMYt3zud81eZLJu09IV4u22TAA=
X-Developer-Key: i=juanlu@fastmail.com; a=openpgp;
 fpr=48E9148428957881DD2558116FF739276A6BB0D9

Add a rss_multiqueue Python test variant that exercises multi-queue
zero-copy receive on a single listening socket.

Assisted-by: Claude:claude-opus-4-8
Reviewed-by: David Wei <dw@davidwei.uk>
Signed-off-by: Juanlu Herrero <juanlu@fastmail.com>
---
 tools/testing/selftests/drivers/net/hw/iou-zcrx.py | 50 +++++++++++++++++++++-
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/iou-zcrx.py b/tools/testing/selftests/drivers/net/hw/iou-zcrx.py
index b7a225fe4bea..c833535d8a03 100755
--- a/tools/testing/selftests/drivers/net/hw/iou-zcrx.py
+++ b/tools/testing/selftests/drivers/net/hw/iou-zcrx.py
@@ -30,6 +30,13 @@ def create_rss_ctx(cfg):
     return int(values)
 
 
+def create_rss_ctx_multi(cfg, start, count):
+    """Create an RSS context spanning count queues from start, return its ID."""
+    output = ethtool(f"-X {cfg.ifname} context new start {start} equal {count}").stdout
+    values = re.search(r'New RSS context is (\d+)', output).group(1)
+    return int(values)
+
+
 def set_flow_rule(cfg):
     output = ethtool(f"-N {cfg.ifname} flow-type tcp6 dst-port {cfg.port} action {cfg.target}").stdout
     values = re.search(r'ID (\d+)', output).group(1)
@@ -127,17 +134,56 @@ def _require_ntuple(cfg):
         defer(ethtool, f"-K {cfg.ifname} ntuple-filters off")
 
 
+def rss_multiqueue(cfg):
+    """Steer the test flow to a multi-queue RSS context for multi-thread zcrx."""
+    channels = cfg.ethnl.channels_get({'header': {'dev-index': cfg.ifindex}})
+    channels = channels['combined-count']
+    if channels < 3:
+        raise KsftSkipEx('Test requires NETIF with at least 3 combined channels')
+
+    rings = cfg.ethnl.rings_get({'header': {'dev-index': cfg.ifindex}})
+    rx_rings = rings['rx']
+    hds_thresh = rings.get('hds-thresh', 0)
+
+    cfg.ethnl.rings_set({'header': {'dev-index': cfg.ifindex},
+                         'tcp-data-split': 'enabled',
+                         'hds-thresh': 0,
+                         'rx': 64})
+    defer(cfg.ethnl.rings_set, {'header': {'dev-index': cfg.ifindex},
+                                'tcp-data-split': 'unknown',
+                                'hds-thresh': hds_thresh,
+                                'rx': rx_rings})
+    defer(mp_clear_wait, cfg)
+
+    cfg.num_threads = 2
+    cfg.target = channels - cfg.num_threads
+    ethtool(f"-X {cfg.ifname} equal {cfg.target}")
+    defer(ethtool, f"-X {cfg.ifname} default")
+
+    rss_ctx_id = create_rss_ctx_multi(cfg, cfg.target, cfg.num_threads)
+    defer(ethtool, f"-X {cfg.ifname} delete context {rss_ctx_id}")
+
+    flow_rule_id = set_flow_rule_rss(cfg, rss_ctx_id)
+    defer(ethtool, f"-N {cfg.ifname} delete {flow_rule_id}")
+
+
 @ksft_variants([
     KsftNamedVariant("single", single),
     KsftNamedVariant("rss", rss),
+    KsftNamedVariant("rss_multiqueue", rss_multiqueue),
 ])
 def test_zcrx(cfg, setup) -> None:
     cfg.require_ipver('6')
     _require_ntuple(cfg)
 
+    cfg.num_threads = 1
+
     setup(cfg)
-    rx_cmd = f"{cfg.bin_local} -s -p {cfg.port} -i {cfg.ifname} -q {cfg.target}"
-    tx_cmd = f"{cfg.bin_remote} -c -h {cfg.addr_v['6']} -p {cfg.port} -l 12840"
+
+    rx_cmd = (f"{cfg.bin_local} -s -p {cfg.port} -i {cfg.ifname} "
+              f"-q {cfg.target} -t {cfg.num_threads}")
+    tx_cmd = (f"{cfg.bin_remote} -c -h {cfg.addr_v['6']} -p {cfg.port} "
+              f"-l 12840 -t {cfg.num_threads}")
     with bkg(rx_cmd, exit_wait=True):
         wait_port_listen(cfg.port, proto="tcp")
         cmd(tx_cmd, host=cfg.remote)

-- 
2.50.1

