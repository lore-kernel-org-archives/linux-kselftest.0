Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.153.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792616556;
	b=uK57upSALOPwJrJvVqTxcUSSRiYAFOIbD9WfDGAWd8U6NET9Cgnd3MT3p5CpKvC+BoUy
	 7SDzFfJq4HWbv/Ank49XbyzSa5WtEI++edBG2iQCTJ5CFEAvN0Qdx2wUF+6N1qCwth1hM
	 B8lIXw1uPA6Sf0c2WcGTbnyEMavA2Cr3GOdQf3tWv2MD69rEgQKusWhwc3EsRLZg5st2C
	 4pTBQxZj1duv8cAL6otxwHqNEKRVuIQKmBa4egrQzQcVY5nsBI9btbttJab3TYok8XZcF
	 THcKKbNX9gZGT55xl2EWp4oNo5fVjXn6HHyUx4VRaDhpN5MHOj369+hrVj1WbVALQfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792616556;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=guXwHJBeKgpcSHuaHgUVoRbKFNEjt2EWMlOsJj6Ho9g=;
	b=HjZ63ArBqnu4ZJfz501k46kp+uX1cY/b9qxjToggdEC8hykKLHjez0/0Yy6puYHiVxg9
	 vFiPlfNWyRdfwHkMl+lyCP9d4bJSKmBkLtVSK8ns4MNmWGeGkPoQ186no7C8oU0s6aFwB
	 xzP+MyD/fV6UFWJ9Q1oD/KI9UJ7Eyj1JJXOeCp18BkWA2KGU69ojdQRXrJIQWhlGDKk3X
	 YlCvLvx7r3pNAwX01p1QJWdhvqXzNnbQ8a0smwc17bsM7XSYSKd9EFXIjcBDdZiJyeeqE
	 f8mmaes/unnNo5rMX9rQOd/GG9qsHMiFsF8nt91kHg4gDAI9CUAm5e9H0zHzRAeIrdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=Y198F4NY;
	arc=none smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A58606A333;
	Wed, 21 Oct 2026 21:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39A58606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=Y198F4NY
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LKdvqk3313583;
	Wed, 21 Oct 2026 14:02:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=guXwHJBeKgpcSHuaHgUVoRbKFNEjt2EWMlOsJ
	j6Ho9g=; b=Y198F4NYHpRArn0dNTL8jKQ5RFiIBkIW4kAO+Dn+pClr6xFbELSsi
	RlpCfeywFpAoWOy8cYITLL3c0okt5T5DZkYbf/3PTU/NkwEoRu1gFX0Iyv+TA1dp
	AVPZ/AR/OzDuAyXHrwQM6WuRG2IaHayAHrcchVZayqRSxYruGjv6H6f2UMGD7C8b
	iKx+0fAtJpKXRqVhAcZD7R4zD/I2CaVItECao2xYSljxWvjeoidGyuzao1di2ps1
	nKjgAB//YTVsoLSY2aqFEdoXWL+51wPvN0Jmf4+CYd48VuhBw6KehGtL2AT8HlQ7
	p65hnE6ujO96o2mGS4U9oSUB5ZjMbbsvA==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hdw56r2g8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 21 Oct 2026 14:02:26 -0700 (PDT)
Received: from localhost (2620:10d:c085:108::150d) by mail.thefacebook.com
 (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Wed, 21 Oct
 2026 21:02:24 +0000
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
        Shuah Khan <shuah@kernel.org>,
        Rahul Rameshbabu
	<rrameshbabu@nvidia.com>,
        Raed Salem <raeds@nvidia.com>, Cosmin Ratiu
	<cratiu@nvidia.com>,
        <linux-kselftest@vger.kernel.org>
Subject: [PATCH net 2/2] selftests: drv-net: psp: test ipv6 tcp socket with extension headers
Date: Wed, 21 Oct 2026 14:02:00 -0700
Message-ID: <20261021210200.788191-3-toddfreed@meta.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021210200.788191-1-toddfreed@meta.com>
References: <20261021210200.788191-1-toddfreed@meta.com>
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
X-Authority-Analysis: v=2.4 cv=TqFzFzXh c=1 sm=1 tr=0 ts=6ad92862 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=wpfVPzegXHpEFt3DAXn9:22 a=VabnemYjAAAA:8 a=siQUhuSm5cGfE-PE1GcA:9
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-ORIG-GUID: I3sb83EtLy_uFApx3f--MK7stLaMnss7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfX6vlTtqDqYTkD
 RNzlZsUVn29vxSHa1r+PbIhcuXFiT1DR6DZZoQAPVx4lbxSdZap7qFximxsG2Zb6Qb/h+ZzGTqU
 AUbV0iLK4nQycqANsICAf/JB/ufE6m8=
X-Proofpoint-GUID: I3sb83EtLy_uFApx3f--MK7stLaMnss7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfX+qGnKlsFthPi
 mxfyfIeA4/MVgyPCePBq5vVU3BnmxRKQEJdA2TjbCR58JWNB+3AslBEQnJbM2caez5OEWCK3DId
 0iNZbkZn4Fp6katj/85qYyCkumNcU4Qz8IFIwKehCq/6Nl7t8lLgUP/zQOwpbj/nDdaipojGHWH
 XWMRC4HG4P5uIK+DG0a8mnJGID5KClt8SBpJ/RQzcwPktFfkjLCrAjd/YfCGSuLafkO3KAQzEX0
 rSFTlbFDhr1bhlO0n+svFORDDE8QSkQV91HNssXZR87v3BjS8yaK4zsQJaPhHrguvSFvGGw3ZRM
 eFI46F3iSntRTguummlb2IVMnUvUyriTYifE6/ML7z4TCGj8oF4u56YKbu+re+c0LKRbLoeLPzt
 2f8aFKY+CLlQ3o8KrUMiohRmIxyf1nPLTpvtb7gr0rkERL079vZ4Sw/BYQ9xVStte/ZOKHpeBo/
 iiWIEhZCpxD/7FtUeUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01

send on a psp tcp socket in three phases, checking the device's
tx-packets and what the peer received after each

1/ no socket options - the data is sent and counted.

2/ an extension header set on the socket - assert that the packets are
   dropped, that tx-packets is unchanged, and that nothing reaches the
   peer. the data stays queued.

3/ option removed - the queued data and new data are sent and counted,
   and the peer gets all of it.

phases 2 and 3 run twice, with a destination options header
(IPV6_DSTOPTS) and with a hop-by-hop options header (IPV6_HOPOPTS), each
holding one padn option.

in phase 2, a software filter on the peer also counts udp packets from
the socket's address to the peer's. the well-formed psp packets reach
the peer as decrypted tcp packets, as expected. the malformed packets
show up as udp. if the peer can't take the filter, that check is
skipped.

tx-packets is read after it has quiesced, because some devices refresh
counter periodically (mlx5 takes about a second).

without the fix in the preceding patch:

- with netdevsim, the packets of phase 2 are encapsulated and counted in
  tx-packets, and the test fails on that.
- with mlx5 (connectx-7), the packets go out unencrypted and aren't
  counted in tx-packets. the test fails on the udp packets which reach
  the peer. capturing on the peer,

    tcpdump -i <dev> -nn -A 'ip6 and src host <sender> and not tcp'

  shows them as udp, with the test's payload readable

Signed-off-by: Todd Freed <toddfreed@meta.com>
---
 tools/testing/selftests/drivers/net/config |   1 +
 tools/testing/selftests/drivers/net/psp.py | 120 ++++++++++++++++++++-
 2 files changed, 119 insertions(+), 2 deletions(-)

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
index a5b1e14f120f..2a109ef61468 100755
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
@@ -624,6 +675,71 @@ def removal_device_bi(cfg):
         _close_conn(cfg, s)
 
 
+def data_send_ipv6_exthdr(cfg):
+    """ Test that IPv6 packets with extension headers are dropped """
+    cfg.require_ipver("6")
+    _init_psp_dev(cfg)
+
+    s = _make_psp_conn(cfg, 0, "6")
+
+    rx_assoc = cfg.pspnl.rx_assoc({"version": 0,
+                                   "dev-id": cfg.psp_dev_id,
+                                   "sock-fd": s.fileno()})
+    tx = _spi_xchg(s, rx_assoc['rx-key'])
+    cfg.pspnl.tx_assoc({"dev-id": cfg.psp_dev_id,
+                        "version": 0,
+                        "tx-key": tx,
+                        "sock-fd": s.fileno()})
+    _check_data_outq(s, 0)
+
+    def wait_outq_empty():
+        for _ in range(100):
+            if _get_outq(s) == 0:
+                break
+            time.sleep(0.5)
+        _check_data_outq(s, 0)
+
+    # 1. No options: sent and counted
+    tx_pkts = _get_quiesced_stat(cfg, 'tx-packets')
+    total = _send_careful(cfg, s, 20)
+    wait_outq_empty()
+    ksft_gt(_get_quiesced_stat(cfg, 'tx-packets'), tx_pkts)
+    _check_data_rx(cfg, total)
+
+    # In happy path, PSP traffic arrives at the remote decrypted as TCP
+    remote_udp = _remote_udp_from(cfg, s.getsockname()[0],
+                                  s.getpeername()[0])
+
+    # An extension header with one PadN option, as destination options and
+    # as hop-by-hop options
+    for name, opt in (("IPV6_DSTOPTS", socket.IPV6_DSTOPTS),
+                      ("IPV6_HOPOPTS", socket.IPV6_HOPOPTS)):
+        # 2. With the option: dropped, not counted, and nothing reaches
+        # the peer. The data stays queued.
+        s.setsockopt(socket.IPPROTO_IPV6, opt,
+                     bytes([0, 0, 1, 4, 0, 0, 0, 0]))
+        tx_pkts = _get_quiesced_stat(cfg, 'tx-packets')
+        udp = remote_udp() if remote_udp else 0
+        queued = _send_careful(cfg, s, 20)
+        _check_data_outq(s, queued, force_wait=True)
+        ksft_eq(_get_quiesced_stat(cfg, 'tx-packets'), tx_pkts, comment=name)
+        if remote_udp:
+            ksft_eq(remote_udp(), udp, comment=f"{name}: UDP at the remote")
+        _check_data_rx(cfg, total)
+        total += queued
+
+        # 3. Option removed: the queued data, then new data, sent and
+        # counted
+        tx_pkts = _get_quiesced_stat(cfg, 'tx-packets')
+        s.setsockopt(socket.IPPROTO_IPV6, opt, b'')
+        wait_outq_empty()
+        total += _send_careful(cfg, s, 20)
+        wait_outq_empty()
+        ksft_gt(_get_quiesced_stat(cfg, 'tx-packets'), tx_pkts, comment=name)
+        _check_data_rx(cfg, total)
+    _close_psp_conn(cfg, s)
+
+
 def _get_psp_ver_ip_variants():
     for ver in range(4):
         for ipv in ("4", "6"):
-- 
2.53.0-Meta

