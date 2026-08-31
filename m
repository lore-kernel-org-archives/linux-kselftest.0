Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E185D3B774A;
	Mon, 31 Aug 2026 17:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788197714; cv=none; b=WHqebmYyJq+y/VTjLMxk8gB0H3QjNYolGc98nbiIjkyhXYLPGJWa91zh4wzWl4pBjnySRls4TVfAj64dVthnNjioOn5UZoNHGsBdwj335PyTZ4Mmp9WeL3eBrLsEcJsdBKluYtKBAuu/xDspvOVW8fecpfPvAq5dUcmbTLs8Ip4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788197714; c=relaxed/simple;
	bh=bb5BYgKa09OW6lhhuFRqBlw0NXbM/PKnsSXjhp92tdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I9CsYtwsw0W5UXgIl9T//pkYnGavGmvHIVoxkgA6q1yHmjWuDilgb7Yp33hBXgHZiwi5YzP7A8YKHc+hf0GBNzo+IEK+6lOcXrgdoSo5QsTtXBzDqDlflBgfT8Y0QV/7QzbgBxUP9dFl5kmc2jo3IDUR1wYnG+75DZ0DWd5UIaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com; spf=pass smtp.mailfrom=fastmail.com; dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b=LWi9udXJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Mffu6n0j; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b="LWi9udXJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Mffu6n0j"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 31249EC01CC;
	Mon, 31 Aug 2026 13:35:12 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 31 Aug 2026 13:35:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1788197712;
	 x=1788284112; bh=zoVUj5F+8FVqGG22Q1uCXrQ58eGyDtPNSPzvgjqr55k=; b=
	LWi9udXJXaSTU3ohNbSk4edl781X7HKkql3D1KCSCxeUH0nxH9sxhVbjANpjJK52
	U+LPzzqU5Li1vh7UHZFM9FH7YyQpN/wlamCEMktSB6eceDj25djOuA++gyEe8cSd
	VNoyj4PXsXxS57rMnnW+ru1kfs3+rlBrUHQakCr2DSl3xArQSdBGISljI75nxBpN
	8B82DfXyM17ZcZJZuci1ZcAglPxW65xveRca2yw+sRC1aWsb1huepuBnUS68u0cx
	NZ7euiYcpCKSqRlOY86D3sdBEf06NTXH7h0t8cXCQEnUOpSpozrnN311uvs9mdm2
	gmmj7ubAdRIOY/oR8L3Riw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1788197712; x=
	1788284112; bh=zoVUj5F+8FVqGG22Q1uCXrQ58eGyDtPNSPzvgjqr55k=; b=M
	ffu6n0jxdMzEyBaJU/h7AA+T4Gd5cHJ5oJ2/qDOGPrxp0epb5E9B0wW+8ML3BeYx
	3VqD8ikvuGkKVOT3FUN6Pn+cZCz3tHoVTUO35eILJAT+7/KPRSr0M6KR11Yd8naP
	X3I5mxpnwNSBo6Nl5SyHihYPOTonsDtOnEXRsvtLQ2uNp7EdQeASEvSLF3aRvkLi
	ilD/vN8Wezov11HQYYOHwu81Y2UyBTgQdIvH6Rhth+aMCjx6ZGbKXwueErV17sZS
	uWtWLsstSn1FmGKRuFYsmGQMG9QVGGlsPlqf0UeVgzTKBN1efCceyFXZ11ldSYDW
	oG1NF6szDLDQ2pMqTf54A==
X-ME-Sender: <xms:T7uVarFKaVIvHO8naqlhGqFBrvEUJsjT_rE_AQ8H15GsIW1xpYmZpw>
    <xme:T7uVagjkjcsdydiFG4SsbQTuvkfFBdcyuvX2K4V-5WB6z2h_cV18VfyaywopBv3ed
    tcQaQzZw5RhOyJKRtR-PyvHRb0khiATGI6x6vyOItseY7O0hi8A0hze>
X-ME-Received: <xmr:T7uVaosJJNdQUv0tCNRBWbLqMyH5XcjG4pUbH33bPkGvZmusSJjutXQUCYNTXo4o7lsZCScXnul1Kh30iIWnCeaWfsNbgg>
X-ME-Proxy-Cause: dmFkZTF6JiRdfk5Vs3phyclJ7AyUnOw1eG5omI5b6IFtHmdMG1Lppg8fUif7VfKKU3b6EJ
    RBQvPQj6dVCJiEi5e+7Y3+kf8PG/Ge5w4TzaXZZ7j3sTkSkMwX4Mi+MkjA0yTzQsSv7usH
    00naaOBrgEdSne1kiz+bIxzSnoR/CSvQ0vMfe1Kjg/eHzpDhX2WM56g/1khOZ1TxFjNTNE
    9tDn1+PQ5yGMB+HjfDSkKDiUv+BDB6Z7IT1pYyJBpAMs+BnD/He17cBJuXR66FgqKrkqHU
    Ytvp0Z86JKudXFPmiy+Ok/IProGM+X4xLlD7XvjGiC7GqHdfdQ3Y+1rrG51Zu4Reqb29D6
    YhFYCFHGpXLFzKXci2uHF8CpA8AMuKtJcvFmZ9IEnAtXEXQwXNIHxl8Fs1G1WU4l8wrKJU
    smEI35lqNW6lBUXQSe4OL65QB+EWXO/gJehvoh6Araa0/ONmZean4DP79qWzqIML/yHJix
    ouGtg1uU9iblmbbo2n2R9QQgYNeVxGBt0vlgBKaDxu+w/KNqEnkMlc/HwrNCKPTRXk8PUw
    qcTBpcdvvPP5Le1F3m+UYqLU4/19ERZO8Hn59kmxtDpqTEp9VvZANcaAkNw2YNyYQz51sE
    lP/Pa+vMxyRcXEnN7lx7YUm2sLOhu8nFKUeXG5HZFeJEqkCTOhmQe3+T6psw
X-ME-Proxy: <xmx:T7uVajt4h7OjHFnow0WUs3qWjb651MjrY-RCstUfzVSOyndhWD2UdQ>
    <xmx:T7uVatF2ZR431AYI-6BnqSY5JXSXlHU9bAX5fd5vYYmITzfwdZk7vw>
    <xmx:T7uVauMvhNejdELgMEA5tqsSWRuk1g5Gfay-_CLQ8sdPy3-pyi4DCQ>
    <xmx:T7uVasJwXVUzGGY3hFh5zABUXSXKSbKv33iPqDD5Z1LWSZwnypTCOQ>
    <xmx:ULuVarvE0eZra04dm0FphoyNIIt5po-KegfFm_SqECQkEVM1HB5udrJd>
Feedback-ID: i80b64ba7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Aug 2026 13:35:11 -0400 (EDT)
From: Juanlu Herrero <juanlu@fastmail.com>
Date: Mon, 31 Aug 2026 12:34:42 -0500
Subject: [PATCH net-next v6 6/6] selftests: net: add rss_multiqueue test
 variant to iou-zcrx
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-iou-zcrx-v6-6-02d1d012f0fd@fastmail.com>
References: <20260831-iou-zcrx-v6-0-02d1d012f0fd@fastmail.com>
In-Reply-To: <20260831-iou-zcrx-v6-0-02d1d012f0fd@fastmail.com>
To: dw@davidwei.uk, netdev@vger.kernel.org
Cc: io-uring@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kuba@kernel.org, asml.silence@gmail.com, 
 pabeni@redhat.com, shuah@kernel.org, juanlu@fastmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3662; i=juanlu@fastmail.com;
 h=from:subject:message-id; bh=bb5BYgKa09OW6lhhuFRqBlw0NXbM/PKnsSXjhp92tdg=;
 b=owGbwMvMwCWW/91SPSt7w03G02pJDFlTd3utifjK8eXPlRNd1yLjQ/psj4vxno05fvmRnpNd7
 37/4tCVHRNZGMS4GCzFFFk8Xoq0aEytaLyrGiEIM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6BgzcHEKwFQrZTH8Zr+zacPyeEfefc8fZaixZHXMWSR4+krN3c9rJ1zS/vfcRZGR4Yby3O0
 Nh+7Mm78tZT2f8WEGgdaNc1+rhFZOl46WEV/HzAcA
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

