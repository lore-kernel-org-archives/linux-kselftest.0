Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE21E30566A;
	Fri, 14 Aug 2026 01:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786670654; cv=none; b=EdE2CfGIXO6G+Xpi50CR0GD5t3LIIJtp8qI+U/jwEKm6CKalEhB60nW9Tx2GNqkV4DntuAresjhtcv8k6XJVk0OyGMidEKK0MY/4OvgE1gy1Neh7EUOxYSMPSYGqbXYINJHsvyy1+XjkjlrKL7ur2+a8qVu2I0/43b9tZUNv7rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786670654; c=relaxed/simple;
	bh=e7LYKBFbEvthm11PSs/C6zIgbmJth/AwSzGHUbofwiE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EQTiWsazqd5CIVKoMC9osN+SZhrDBE+B6vyXehM0xR1LcwC0wzdE+FOSDHRLU+3RuuekZag3OPoIOMx75r0v9dUmOUltuxWCAnt1/QVcfsIEBNMhuOFRyfaZixVAD5F4q7Iqylg1PGOZU1RNNIFvzFehMyXQc+DRe3QxV24SN80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com; spf=pass smtp.mailfrom=fastmail.com; dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b=TIcpuIbl; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MZER5n+P; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b="TIcpuIbl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MZER5n+P"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 95DF31D00367;
	Thu, 13 Aug 2026 21:24:01 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Thu, 13 Aug 2026 21:24:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1786670641; x=
	1786757041; bh=z7+hOQG2YGb/JFBuAeH6YH/vIHUf6ESYw2NhiMLrbag=; b=T
	IcpuIblS6p05P19hgoz9Sqtwr2qCqmsjhRy29FgBheIpDfX70SA6RdvVvqV+vP3W
	KpV3Mrc7xWrdy8pwAaTnPBhyuQViEsrJU/fvrit2dPz4VGfAJ/1Tz4azLUs4ufqP
	5VW8tXcQF9aOElyusst2sGAettNuJgIW2GHd1J4gKrC5bgBRAjKOdQFOjkFoOog8
	5/cqlL8xWXYwnAfKtZhaUs6oDUVVz0o0jROn6tUuWlwnMB64q1OY5D2KVhBJU9Dw
	7YYJKqTDFpnOZWh1+kbp2FLiOIbSDn14nskmTeUrwFnP7gmSvqM2euSlzYF4xvUh
	+pgKCtc+azHXtV7tWbW/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786670641; x=1786757041; bh=z
	7+hOQG2YGb/JFBuAeH6YH/vIHUf6ESYw2NhiMLrbag=; b=MZER5n+P0Nt1r0WsF
	RH/Uni2DpF5ql//WpK5+PNbi8nVzjfMX8ihbQ73xu5EpT+IVgpk5bxvzTgaYB/EQ
	aR7+I3p7+v/QcfnFZiP5RAnCcu/YfOQFG5sV4yPHioDwQ/uy07lc4+9+5RHhw8M7
	z5G5x8dk0xcJMOAMHYhRR7GIxfd56ZSeFB6TCOPAoNfVelwd9eD3K0ytsUn9XgzA
	0WLDicWUz3ahZKhcylRHXFJ7ghJbHaWiiifW1d5yltMelKzvejH+XHFvV0lyiLnB
	dTqO2VyUeIJbZdN/Njr8m5OT7+DrkRa1d+6HoeeO6PwOGXo+KHp1JNjFtGU/TXq4
	K5Spg==
X-ME-Sender: <xms:MW5-ahUGjCNSx9K--ZtFh7YP_MpMcHBVAtE8VUbuPT__19xl_4m0xw>
    <xme:MW5-apyF44NDxjIRw1Oo8yI9RcGRuvWYnF0A9CyKARxmKHJUyFKMBL_nPyNmUk5Pq
    rU-aMZ45-_dJKUNnWpDFE8e_tZl9dxi5ZsJmIrwMnzdYEwxlaPNdOjk>
X-ME-Received: <xmr:MW5-ao_NNI9kdYeX3vARyTjGVMvUjFBXXG29sZ6hrghw4ju4Wv51oHkJXpWCteAL2l_5OSTJhaEBs3HoXOR9T85EYwUM3lk>
X-ME-Proxy-Cause: dmFkZTGlnKkc0TwPTb5JNCkAi+5Y8WSjcjjDWnkOIL2wNpUcV13CZto/qOXRm0nqGz7tPy
    KJEebetoFzGPCWAi43zBJPWh3lU6UkLAyBFZ6j4oxxM9R/f/XZ4XCVK2pzL/y7LQGFZvpR
    D/CrmLT9KZ1KsmxXyRJ2t1g6Nt6RO09HBhWhLe5eSw/EkIsnwI9+bk4+c3v7X8vnF67GAZ
    x5aPFmOtLpYkgdaSPCL5jXIqRgeyslKNbDZfP9OeqYyBjk5QInrgyNovvVM3MvStCRC0Vf
    KMYutq9dcLsVOl/YKHQj65USZyVlLayx+Z5CvgQ+ECO90Jd7U6/TgSqqZrFbLu3cB39ndQ
    uWN+CX7tAeFgFapYKKYoGHb8QyK+5VbnCb3J1/DnlUAdrjsE22npxMMBlj4hxfc0mEa2jH
    Scv4dg+wSRORVy/gw7xCQFDaP4cepXQ+r2lJSaVm+Te41finFYW5xCl/1RoABDMjUy8mkR
    olODTuBT9a3NYwJ7Up7qxU4XE3+vWFd4EDm1jo3lW6pwkK4w9qkeJriaExiHLh0y3V0ugl
    dUDUMAJRbRiY28p4aTU9zZ4aS+6n4jos1DAZWBWoW8SU0mQU6oAoobSNS1NxFdP/83YeTN
    Z/X6CNNE9Yo5l4bcdDGJuBrXnlXIRq/NN75m3rX0aE6ncS/Z7dDEnBiI2Jnw
X-ME-Proxy: <xmx:MW5-au-Fdk6eSnpjDQxBOfTPmmlvrVHoudODIWXdGLO_JsSWl-ItiA>
    <xmx:MW5-anUEbpaPPSf1mK1lwdbRWD-AneGFyTBx4b__X94lVfFN3k_oEA>
    <xmx:MW5-arfWmW2pLgy1LduHUZBhIxp2DtpeGtFDqEkAhAGjJVUg1tymOw>
    <xmx:MW5-agbx51OmcnUcNe9lFZwA0SHXnxEzqdBMDfXChsWZyoKGB2HE-g>
    <xmx:MW5-av9-xe1jfLjtftVTSqNRmGSDjACtkhWA1hYE3MAsnQFdvFsqITT7>
Feedback-ID: i80b64ba7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Aug 2026 21:24:00 -0400 (EDT)
From: Juanlu Herrero <juanlu@fastmail.com>
To: netdev@vger.kernel.org,
	dw@davidwei.uk
Cc: io-uring@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kuba@kernel.org,
	asml.silence@gmail.com,
	pabeni@redhat.com,
	shuah@kernel.org,
	Juanlu Herrero <juanlu@fastmail.com>
Subject: [PATCH net-next v5 6/6] selftests: net: add rss_multiqueue test variant to iou-zcrx
Date: Thu, 13 Aug 2026 20:23:48 -0500
Message-ID: <20260814012348.46958-7-juanlu@fastmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260814012348.46958-1-juanlu@fastmail.com>
References: <20260814012348.46958-1-juanlu@fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a rss_multiqueue Python test variant that exercises multi-queue
zero-copy receive on a single listening socket.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Juanlu Herrero <juanlu@fastmail.com>
---
 .../selftests/drivers/net/hw/iou-zcrx.py      | 50 ++++++++++++++++++-
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/iou-zcrx.py b/tools/testing/selftests/drivers/net/hw/iou-zcrx.py
index b7a225fe4beae..c833535d8a03c 100755
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
2.53.0-Meta

