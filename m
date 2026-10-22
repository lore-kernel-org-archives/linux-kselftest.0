Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.153.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792708252;
	b=N7a9+0Luj4h+ILw/LEJrQeYZ0WbjNC2wKmDeCTWItHelMpDKlDugjIXpCQ6XeW/RbwtO
	 a9EPZxCQj5pIys6KTrxyPlsQLFZZ8jIsNk8C+SSGnwVQObWAUQoQ1SRU8ioEoLGIqB6Pp
	 u6z3+QlAsZUUYgqTBFcOepcx6DzX0iJzKr+OMcCvqWAX01DsccwfYCUrmJKD3wuKCMBdV
	 DYIrjQ7/79E++zWLasA25imSAut+ey1lC36RbCon7bxP/P8p1jV+o0HBANReqQNC6VJvf
	 UfsjGI+iDE3qezPY9ikqQUNppQS73+tIhxwzm+EarroRXITJccEJizugbKnGYoGYc0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792708252;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version;
	bh=GfwT+VqD9bB7MUD683SzSGNNpavZ1Sxd/Xird6FfPAA=;
	b=dTt53D9BM/1y6MSmeELtqYoj1XcLw9ooAmhZXGVjbWRV3+FLQD2+aDNDPE1vQIpXQfPv
	 J2KVbCRhZ3QFEK3YLJSmXM8CIThk44c+WoTVevNH/OSdstbAE5FfG4U2+OtE3+pNYvSB/
	 S6lQbj68bLQKf5jP8PGG4AFtYRG9agC+aHRJ9yd5tytPzl7BiyyyXdYdjz5NhcjdAwxfx
	 KHGb/jUTmucayK8jcxrwCapQ116mDtW8HsFUdXZ1Xyi0KR/7D4AeSzLdo+X/cIo2cL1wt
	 4YbBweN9kI0mj+dMXC5t63c4DlRk4LVE1ZWUxuQMLJiZtNu/EBPvvM3tWa4IocCf2og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b="VFJ/788j";
	arc=none smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A82E606A320;
	Thu, 22 Oct 2026 22:30:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A82E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=VFJ/788j
Received: from pps.filterd (m0528006.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MMUgw51606812;
	Thu, 22 Oct 2026 15:30:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=GfwT+VqD9bB7MUD683SzSGNNpavZ1Sxd/Xird
	6FfPAA=; b=VFJ/788jQoaBNeCmbRG/4xLdM6MVaVEk0FfoTatFc4ke0BYv/1res
	dbjA+MgxLBsQ1/omw3UsYjUjoqcGiX9yKn9cyTpraRx0X5axgynqfxG0qGs09pTy
	ay1b1Ks2140+d9mb7yIuwyTTge0em0yhL4MaTi1XWWGwKvAbd2RbPzxycH5MvGFK
	wy8pPWkKnkQZJcNj6Nz2jzqISQZKMlFDfEo2UIEil0XefbvM1UF5ALnX8Pn+a3pC
	T7u2Hmr9BBTHaUorAx2T72K8+Gss1WTV1SdGNDalx+ieGqES1//3ZyU9kr32smmC
	CQCwBKXL+ICqERW6UYj09Joh8xTmfiJdA==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hfjf64jnr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 22 Oct 2026 15:30:42 -0700 (PDT)
Received: from localhost (2620:10d:c085:108::4) by mail.thefacebook.com
 (2620:10d:c08b:78::c78f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Thu, 22 Oct
 2026 22:30:40 +0000
From: Todd Freed <toddfreed@meta.com>
To: <netdev@vger.kernel.org>, <toddfreed@meta.com>
CC: Daniel Zahka <daniel.zahka@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>, Andrew Lunn
	<andrew+netdev@lunn.ch>,
        Shuah Khan <shuah@kernel.org>, Raed Salem
	<raeds@nvidia.com>,
        Rahul Rameshbabu <rrameshbabu@nvidia.com>,
        Cosmin Ratiu
	<cratiu@nvidia.com>, <linux-kernel@vger.kernel.org>,
        <linux-kselftest@vger.kernel.org>,
        =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?=
	<bjorn@kernel.org>
Subject: [PATCH net v2 2/2] selftests: drv-net: psp: test ipv6 tcp socket with extension headers
Date: Thu, 22 Oct 2026 15:30:14 -0700
Message-ID: <20261022223014.556388-3-toddfreed@meta.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261022223014.556388-1-toddfreed@meta.com>
References: <20261022223014.556388-1-toddfreed@meta.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA4OSBTYWx0ZWRfX9nR6g9UMrEw2
 eACY2JTqNeT4hLYHpbzR+jjtIYUVKj7GBl1cF/xA6UEtT61v9Hbn6n4PaV+nGexIweKIfdT7bJT
 t+Hhl5q9Y0Axz57+PLLj6QiacHW6PyU=
X-Proofpoint-GUID: 4FQ7PNgVUg67fnDbaUl2CWAABfiZ6-dO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA4OSBTYWx0ZWRfX/YvfwfHWbpnn
 w/W/cVnk+ceFpj+EGGZiRl9yvjOY9xTyENS5dFT/MOJEZeRate65YB+S5jPbCJ5WpE2P6B1DHET
 PUoFnRUx4pE9LGFHpVNZxagoPaTsGnORFd1mWLNHWkoP/aFWnPxBlA5cZvTY+CrDSrpHpvF8IU6
 AFzf3t3Ikf8hLPCtOcnuGdAojrab5btT77Rg59f1P+8wdKmz3Ix8glR2mEbHFipT+rCL9Xnz9Dz
 0Msmo0XZZ2g4rhTPzQM1ml4vbD1EYct1srZBra5VTx4K4WJFS38mHVCTDc9FM0utKwpXyg5cWtC
 sEpd2yUiLOBUNvQWhd3kdKqM0kDhd6f8Dv8I8DiRV7SMB42wRiYukTN5guQJsTPfy42SQyYjwSA
 CVRbExJp1D7DDl9aXXb1/qyDOtSzdDn3vixY38mxMIklg2Ee4x8KfOznCGh+plb/cRLREMbA6iz
 KbcIKw2+O96ChQV0wUA==
X-Authority-Analysis: v=2.4 cv=VN5IDNPX c=1 sm=1 tr=0 ts=6ada8e92 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=kkcUborcUVj0H7zxAXTl:22 a=VabnemYjAAAA:8 a=JE7m3MBIUUSpghwH1AUA:9
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-ORIG-GUID: 4FQ7PNgVUg67fnDbaUl2CWAABfiZ6-dO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_07,2026-10-21_02,2025-10-01_01

send on a psp tcp socket in three phases, checking the device's
tx-packets and what the peer received after each

1/ no socket options - the data is sent and counted.

2/ an extension header set on the socket - with destination or
   hop-by-hop options, the data is sent, counted, and received by the
   peer. with a routing header, the packets are dropped, tx-packets is
   unchanged, nothing reaches the peer, and the data stays queued.

3/ option removed - any queued data, then new data, is sent, counted,
   and received.

phases 2 and 3 run three times: with a destination options header
(IPV6_DSTOPTS) and with a hop-by-hop options header (IPV6_HOPOPTS), each
holding one padn option, and with a segment routing header
(IPV6_RTHDR) whose only segment is the peer.

in phase 2, a software filter on the peer also counts udp packets from
the socket's address to the peer's. the psp packets reach the peer as
decrypted tcp packets, as expected. malformed or unencrypted packets
show up as udp, and the test asserts there are none. if the peer can't
take the filter, the test is skipped.

tx-packets is read after it has quiesced, because some devices refresh
counters periodically (mlx5 takes about a second).

without the fix in the preceding patch:

- with netdevsim, the peer receives none of the data of phase 2, and the
  test fails on that.
- with mlx5 (connectx-7), the packets go out unencrypted and aren't
  counted in tx-packets. the test fails on the udp packets which reach
  the peer. capturing on the peer,

    tcpdump -i <dev> -nn -A 'ip6 and src host <sender> and not tcp'

  shows them as udp, with the test's payload readable

Signed-off-by: Todd Freed <toddfreed@meta.com>
---
 tools/testing/selftests/drivers/net/config |   1 +
 tools/testing/selftests/drivers/net/psp.py | 138 ++++++++++++++++++++-
 2 files changed, 137 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/config b/tools/testing/selftests/drivers/net/config
index 4838adf27fa1..409f9a96a102 100644
--- a/tools/testing/selftests/drivers/net/config
+++ b/tools/testing/selftests/drivers/net/config
@@ -4,6 +4,7 @@ CONFIG_DEBUG_INFO_BTF_MODULES=n
 CONFIG_INET_PSP=y
 CONFIG_IPV6=y
 CONFIG_MACSEC=m
+CONFIG_NET_ACT_GACT=m
 CONFIG_NET_ACT_SKBEDIT=m
 CONFIG_NET_CLS_ACT=y
 CONFIG_NET_CLS_BPF=y
diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/selftests/drivers/net/psp.py
index a5b1e14f120f..47e8cb19f376 100755
--- a/tools/testing/selftests/drivers/net/psp.py
+++ b/tools/testing/selftests/drivers/net/psp.py
@@ -16,12 +16,12 @@ from lib.py import ksft_run, ksft_exit, ksft_pr
 from lib.py import ksft_true, ksft_eq, ksft_ne, ksft_gt, ksft_raises
 from lib.py import ksft_not_none
 from lib.py import ksft_variants, KsftNamedVariant
-from lib.py import KsftSkipEx, KsftFailEx
+from lib.py import KsftSkipEx, KsftFailEx, CmdExitFailure
 from lib.py import NetDrvEpEnv, NetDrvContEnv
 from lib.py import Netlink, NlError, PSPFamily, RtnlFamily
 from lib.py import NetNSEnter
 from lib.py import bkg, rand_port, wait_port_listen
-from lib.py import ip
+from lib.py import ip, tc
 
 TCP_ULP = 31
 
@@ -120,6 +120,57 @@ def _check_data_outq(s, exp_len, force_wait=False):
 def _get_stat(cfg, key):
     return cfg.pspnl.get_stats({'dev-id': cfg.psp_dev_id})[key]
 
+
+def _get_quiesced_stat(cfg, key, timeout=10):
+    """
+    Like _get_stat(), but wait till the value stops changing. Note
+    that some devices refresh flow counters periodically, e.g. once
+    per second with mlx5.
+    """
+    val = _get_stat(cfg, key)
+    end = time.monotonic() + timeout
+    while True:
+        time.sleep(1.5)
+        new = _get_stat(cfg, key)
+        if new == val:
+            return val
+        val = new
+        if time.monotonic() >= end:
+            ksft_pr(f"{key} still changing after {timeout}s: {val}")
+            return val
+
+
+def _remote_udp_from(cfg, src, dst):
+    """
+    Count what reaches the remote from @src to @dst as UDP, with a software
+    filter on its ingress (offloaded filter counters are refreshed
+    periodically). Returns a function reading the count, or None if the
+    filter can't be installed.
+    """
+    flt = (f"dev {cfg.remote_ifname} ingress protocol ipv6 pref 1 "
+           f"handle 0x5053 flower")
+    try:
+        qdiscs = tc(f"qdisc show dev {cfg.remote_ifname}", json=True,
+                    host=cfg.remote)
+        if not any(q['kind'] == 'clsact' for q in qdiscs):
+            tc(f"qdisc add dev {cfg.remote_ifname} clsact", host=cfg.remote)
+            defer(tc, f"qdisc del dev {cfg.remote_ifname} clsact",
+                  host=cfg.remote)
+        tc(f"filter add {flt} skip_hw src_ip {src} dst_ip {dst} "
+           f"ip_proto udp action drop", host=cfg.remote)
+    except CmdExitFailure as e:
+        ksft_pr(f"Can't count UDP on the remote: {e}")
+        return None
+    defer(tc, f"filter del {flt}", host=cfg.remote)
+
+    def count():
+        filters = tc(f"-s filter get {flt}", json=True, host=cfg.remote)
+        for f in filters:
+            for act in f.get("options", {}).get("actions", []):
+                return act["stats"]["packets"]
+        raise KsftFailEx("no action on the remote filter")
+    return count
+
 #
 # Test case boiler plate
 #
@@ -624,6 +675,89 @@ def removal_device_bi(cfg):
         _close_conn(cfg, s)
 
 
+def data_send_ipv6_exthdr(cfg):
+    """ Test PSP on IPv6 packets with extension headers """
+    cfg.require_ipver("6")
+    _init_psp_dev(cfg)
+
+    s = _make_psp_conn(cfg, 0, "6")
+    try:
+        # In happy path, PSP traffic arrives at the remote decrypted as TCP
+        remote_udp = _remote_udp_from(cfg, s.getsockname()[0],
+                                      s.getpeername()[0])
+        if not remote_udp:
+            raise KsftSkipEx("can't count UDP on the remote")
+
+        rx_assoc = cfg.pspnl.rx_assoc({"version": 0,
+                                       "dev-id": cfg.psp_dev_id,
+                                       "sock-fd": s.fileno()})
+        tx = _spi_xchg(s, rx_assoc['rx-key'])
+        cfg.pspnl.tx_assoc({"dev-id": cfg.psp_dev_id,
+                            "version": 0,
+                            "tx-key": tx,
+                            "sock-fd": s.fileno()})
+        _check_data_outq(s, 0)
+
+        def wait_outq_empty():
+            for _ in range(100):
+                if _get_outq(s) == 0:
+                    break
+                time.sleep(0.5)
+            _check_data_outq(s, 0)
+
+        # 1. No options: sent and counted
+        tx_pkts = _get_quiesced_stat(cfg, 'tx-packets')
+        total = _send_careful(cfg, s, 20)
+        wait_outq_empty()
+        ksft_gt(_get_quiesced_stat(cfg, 'tx-packets'), tx_pkts)
+        _check_data_rx(cfg, total)
+
+        # An extension header with one PadN option, as destination options
+        # and as hop-by-hop options, and a segment routing header with the
+        # peer as its only segment
+        padn = bytes([0, 0, 1, 4, 0, 0, 0, 0])
+        srh = bytes([0, 2, 4, 0, 0, 0, 0, 0]) + \
+            socket.inet_pton(socket.AF_INET6, s.getpeername()[0])
+        for name, opt, val, sent in (
+                ("IPV6_DSTOPTS", socket.IPV6_DSTOPTS, padn, True),
+                ("IPV6_HOPOPTS", socket.IPV6_HOPOPTS, padn, True),
+                ("IPV6_RTHDR", socket.IPV6_RTHDR, srh, False)):
+            # 2. With the option. Destination and hop-by-hop options: sent
+            # encrypted, with UDP + PSP after the extension header, counted,
+            # and received. Routing header: dropped, not counted, and the
+            # data stays queued. Nothing reaches the peer as plain UDP.
+            s.setsockopt(socket.IPPROTO_IPV6, opt, val)
+            tx_pkts = _get_quiesced_stat(cfg, 'tx-packets')
+            udp = remote_udp()
+            queued = _send_careful(cfg, s, 20)
+            if sent:
+                total += queued
+                wait_outq_empty()
+                ksft_gt(_get_quiesced_stat(cfg, 'tx-packets'), tx_pkts,
+                        comment=name)
+            else:
+                _check_data_outq(s, queued, force_wait=True)
+                ksft_eq(_get_quiesced_stat(cfg, 'tx-packets'), tx_pkts,
+                        comment=name)
+            ksft_eq(remote_udp(), udp, comment=f"{name}: UDP at the remote")
+            _check_data_rx(cfg, total)
+            if not sent:
+                total += queued
+
+            # 3. Option removed: any queued data, then new data, sent and
+            # counted
+            tx_pkts = _get_quiesced_stat(cfg, 'tx-packets')
+            s.setsockopt(socket.IPPROTO_IPV6, opt, b'')
+            wait_outq_empty()
+            total += _send_careful(cfg, s, 20)
+            wait_outq_empty()
+            ksft_gt(_get_quiesced_stat(cfg, 'tx-packets'), tx_pkts,
+                    comment=name)
+            _check_data_rx(cfg, total)
+    finally:
+        _close_psp_conn(cfg, s)
+
+
 def _get_psp_ver_ip_variants():
     for ver in range(4):
         for ipv in ("4", "6"):
-- 
2.53.0-Meta

