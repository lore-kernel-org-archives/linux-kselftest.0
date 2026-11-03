Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664749;
	b=aiGQMVUMIgFP8eciStD85+8roG9xvrgN0VY2a/B1ZNx16XEjqsz5fuaaPJXkca/MAIbY
	 I0D/MYxw72kOe96SOcnMweVH6Xo0O8H86ReKWRE7yjwKNKlBpwKHIetXSevtlRjn8GTJZ
	 J2xjKzAfL4QgDZPR0cm0OFKRbeIrX320rN+poyTD3GdTtfRe5jBnjJFjiDFF2aT8VV3t4
	 2OG5klC4wOSxOO02cEZyROP9xKgaCd1QvEWjsfkhvJaFN/ZJRH3VQEHiXOJFhjH3L5L8r
	 feiZuwF2+h/DeHgDezvYStKYKWx4t49ahVbejkFir/eYATlwNIevNbSKNCxxQj25Ryg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664749;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version;
	bh=p0+uy4Q7WsYmM0w7JtDL8fVxsiHZ6mwnGoP++w9tQW8=;
	b=NT0sxIfPeH7S+D4BwjnZiZw2IrnW/F+yl3k8xq4BGvEe33y9Hq/uknQvqcs3t4E/IWFf
	 VWMogVfHcvcs4GLR8PiXPNS13HTWKvUC7RMdZgroIMi/YjwzUm2idvKuk15bXJclo2Lod
	 4ROhyiSp7zmdXgwugf08i12gwjAv5Q0dUy5bvit3SWVG5ERweKd1hs0JkGvCD1txs8Ppq
	 3C23Z31FO9HthCcg7S3aySFhG63x+/UIF9IOc2Q87jSA9x9+9mnAON2rT/d8AJ51I1C8p
	 27XqjQVou0UJ/DCoTB79HpseTYsI499RMx46vzJQIrJhO7N9VEakdNGp6rB2QgX8rZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=YrIv1ebQ;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EB8606A329;
	Tue,  3 Nov 2026 00:12:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1EB8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=YrIv1ebQ
Received: from pps.filterd (m0528008.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K5tA83565492;
	Mon, 2 Nov 2026 16:12:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=p0+uy4Q7WsYmM0w7JtDL8fVxsiHZ6mwnGoP++
	w9tQW8=; b=YrIv1ebQw0OXeh7Pn/QpZuvAdZam6hDfwaBPSMvA//bfr7swwVT93
	43PUAEpwGVhAa29zdlKTl4AJhuypBxiZgpC51ZnPdqtGQbWx2EkEcFS6CTrm9PVI
	mFDRCZ23MzEw9cC07VIBhibFc/qmYxgT9MDWrPCpfjO0C7VotpZlF2CbpFfBjTuf
	6h6bFJEsH5ZHW52cyxNYQBAMW+eDeRKeBzoTBoLkyswQ4tOMi9a6kFbFz2CVQcz3
	2k4n87bjuTsoYMr06kUqBl2Lq6NkVKtoJtl1stqQWTPOXjmmg2kBF+vdhCvfRJUv
	1FMlrKkUR71oUQz4Ke0I0ZlYm3gAH+OzQ==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hp5tsafpx-18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 02 Nov 2026 16:12:28 -0800 (PST)
Received: from localhost (2620:10d:c085:108::4) by mail.thefacebook.com
 (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Tue, 3 Nov
 2026 00:12:17 +0000
From: Todd Freed <toddfreed@meta.com>
To: <netdev@vger.kernel.org>, <toddfreed@meta.com>
CC: <linux-kselftest@vger.kernel.org>
Subject: [PATCH net v4 6/7] selftests: drv-net: psp: test that ipv4 psp packets aren't fragmented
Date: Mon, 2 Nov 2026 16:11:42 -0800
Message-ID: <20261103001143.246081-7-toddfreed@meta.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103001143.246081-1-toddfreed@meta.com>
References: <20261103001143.246081-1-toddfreed@meta.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAwMCBTYWx0ZWRfX5py5LH03GCXv
 k0jApkPL7kLABkUjbPVrjeTeKQKzn/ezhI4F9n8lwQUXEjkwg728/hPCX8FZTNoUGJItyv0JkAN
 mUL8mVJZR173e5/kTY3DOnXiPF7fjGs=
X-Proofpoint-GUID: kzVhtP9LQf9qYIshmbTPShsm2d5SORkA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAwMCBTYWx0ZWRfX3xvo9x2ngEjt
 0oDYQTJHVC/THnYqrjW8G1nHI/G/jmIhmyk/5xXZUHMDHSqSVkP777WDCz1K4tYiuOMymtFzBCx
 AeHUn7i0kH5F/HQE5cT1lfj+BCf8wEvlVNCD6hnWA3mbSQnU1Zek/hq8jan8xDzcgFt+pcklvL+
 lzLm6DBBGp4Rk88lIwRibieDRhprfYrDowYeJrQ6UUc/8KabmI9vYA0irif/nvyoPCbTdYkIaEl
 Q8iGw/vLApyrPVE1sx/ZOlJ23ErXDn48X63vl5HEmSOWD2n+yiDEKL+rpce4zSgenH8TY4MfYl+
 c9d2xG0zI4n3yUJDYngWnSEjpCa1OIc5/o0TqZZujhTwtzqCKkjPMABDoSR1Lcyu4qzlInjm6Yo
 hpMvZgwRz0u5MkArh2v/PGxNd5MYULVrNNph0Tr+RwFqydZdkDtaHM0Zv/4813FdxF/ZR4+K8RQ
 fRBTHUQ5rZ+0PczLyDg==
X-Authority-Analysis: v=2.4 cv=d79gWhjE c=1 sm=1 tr=0 ts=6ae926ec cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=_1IyUuN4QrATX339ibzo:22 a=VabnemYjAAAA:8 a=1mFHcsHpRWvCl12i8bsA:9
 a=O8hF6Hzn-FEA:10 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-ORIG-GUID: kzVhtP9LQf9qYIshmbTPShsm2d5SORkA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01

make the ipv4 packets of a psp tcp socket need fragmenting, and check
that they're dropped (IpFragFails) and not transmitted unencrypted.

tcp sizes its segments from the route mtu. with IP_PMTUDISC_OMIT, ip
fragments them to the device mtu, and doesn't set df. so the test sets a
route mtu of twice the device mtu on both ends (the peer's mss limits
ours too), keeping the device and source address of the current route,
and IP_PMTUDISC_OMIT on the socket. if the peer isn't on-link, or the
socket's mss doesn't need fragmenting, the test is skipped.

a software filter on the peer counts, and drops, the ipv4 fragments
which reach it from the socket's address, and the test asserts there are
none. IpFragFails is per netns, so it only confirms that the packets
were dropped.

while both route mtus are in place, a new ssh connection to the remote
over these addresses can stall: its segments are sized from the route
mtu, and sent with df set. so the local route is added last, and removed
before the next remote command.

no ipv6 test because the stack won't fragment ipv6 tcp packets.

without the fix in "net: don't fragment decrypted skbs", the packets are
fragmented, and the fragments go out unencrypted. they reach the peer,
IpFragFails doesn't move, and the test fails.

Signed-off-by: Todd Freed <toddfreed@meta.com>
---
 tools/testing/selftests/drivers/net/psp.py | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/selftests/drivers/net/psp.py
index c9a725cc89a2..f6888f93cb93 100755
--- a/tools/testing/selftests/drivers/net/psp.py
+++ b/tools/testing/selftests/drivers/net/psp.py
@@ -24,6 +24,8 @@ from lib.py import bkg, rand_port, wait_port_listen
 from lib.py import ip, tc
 
 TCP_ULP = 31
+IP_MTU_DISCOVER = 10
+IP_PMTUDISC_OMIT = 5
 
 
 def _get_outq(s):
@@ -763,6 +765,87 @@ def data_send_ipv6_exthdr(cfg, opt, val):
         _close_psp_conn(cfg, s)
 
 
+def _ipv4_snmp(key):
+    """ An Ip: counter of this netns, from /proc/net/snmp """
+    with open("/proc/net/snmp", encoding="utf-8") as f:
+        ip_lines = [line.split() for line in f if line.startswith("Ip:")]
+    return int(ip_lines[1][ip_lines[0].index(key)])
+
+
+def _ipv4_route_mtu(dst, mtu, host=None):
+    """ Add a route to @dst with @mtu, keeping the device and source of
+    the current one, which must be on-link. Returns the defer removing it.
+    """
+    route = ip(f"-4 route get {dst}", json=True, host=host)[0]
+    if route.get("gateway"):
+        raise KsftSkipEx(f"{dst} isn't on-link")
+    try:
+        ip(f"route add {dst}/32 dev {route['dev']} src {route['prefsrc']} "
+           f"mtu {mtu}", host=host)
+    except CmdExitFailure as e:
+        raise KsftSkipEx(f"can't set the route mtu to {dst}: {e}") from e
+    return defer(ip, f"route del {dst}/32 dev {route['dev']}", host=host)
+
+
+def data_send_ipv4_frags(cfg):
+    """ Test that IPv4 packets of a PSP TCP socket aren't fragmented """
+    cfg.require_ipver("4")
+    _init_psp_dev(cfg)
+
+    # Fragments which get out reach the remote. Set up the count before
+    # connecting, so a skip doesn't leave the responder mid key exchange.
+    loc, rem = cfg.addr_v["4"], cfg.remote_addr_v["4"]
+    remote_frags = _remote_count(cfg, "ip",
+                                 f"src_ip {loc} dst_ip {rem} ip_flags frag")
+    if not remote_frags:
+        raise KsftSkipEx("can't count fragments on the remote")
+
+    # TCP sizes its segments from the route MTU. With IP_PMTUDISC_OMIT, IP
+    # fragments them to the device MTU. Set a route MTU above the device
+    # MTU on both ends, since the peer's MSS limits ours too. While both
+    # are in place, a new ssh connection to the remote over these addresses
+    # can stall, so add the local one last, and remove it first.
+    mtu = min(2 * max(cfg.dev['mtu'], cfg.remote_dev['mtu']), 65535)
+    _ipv4_route_mtu(loc, mtu, host=cfg.remote)
+    local_route = _ipv4_route_mtu(rem, mtu)
+
+    s = _make_psp_conn(cfg, 0, "4")
+    try:
+        rx_assoc = cfg.pspnl.rx_assoc({"version": 0,
+                                       "dev-id": cfg.psp_dev_id,
+                                       "sock-fd": s.fileno()})
+        tx = _spi_xchg(s, rx_assoc['rx-key'])
+        cfg.pspnl.tx_assoc({"dev-id": cfg.psp_dev_id,
+                            "version": 0,
+                            "tx-key": tx,
+                            "sock-fd": s.fileno()})
+        s.setsockopt(socket.IPPROTO_IP, IP_MTU_DISCOVER, IP_PMTUDISC_OMIT)
+        mss = s.getsockopt(socket.IPPROTO_TCP, socket.TCP_MAXSEG)
+        if mss + 40 <= cfg.dev['mtu']:
+            raise KsftSkipEx(f"mss {mss} needs no fragmenting")
+
+        fails = _ipv4_snmp("FragFails")
+        # The packets are dropped, so the send may not complete (with a
+        # jumbo device MTU, the socket buffer can take all of it)
+        s.settimeout(3)
+        try:
+            s.sendall(b'f' * 200000)
+        except socket.timeout:
+            pass
+        fails = _ipv4_snmp("FragFails") - fails
+
+        # Before the next ssh to the remote, see above
+        local_route.exec()
+
+        # Fragments would go out unencrypted: the packets must be dropped
+        # instead of fragmented. FragFails is per netns, so it only
+        # confirms the drop: the remote count is what decides.
+        ksft_eq(remote_frags(), 0, comment="fragments reached the remote")
+        ksft_gt(fails, 0, comment="packets dropped instead of fragmented")
+    finally:
+        _close_psp_conn(cfg, s)
+
+
 def _get_psp_ver_ip_variants():
     for ver in range(4):
         for ipv in ("4", "6"):
-- 
2.53.0-Meta

