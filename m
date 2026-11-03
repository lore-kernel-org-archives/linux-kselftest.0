Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.153.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664749;
	b=uFhptnx4yxxr/eziocGVnl8rjCWGN/+6B5VfVitPFbUwRnUTHdJ3iI/xcN/QNcw87IpR
	 4O90KokqO3v/0i8WPz+1LYDRezjU7g3rL3pt1jkcGDo+fBTrj/h+VIXMbc5sxx/Ea4+Xf
	 CVtlV/slOnXQ8Zqp8j28SD925IdC+cgYFj7uWjgN4fSYzqWiSAcsOPWMbXA3XgisAfO5K
	 vokWg+ibkhO7gqBCxc8VziCiZS6DY8yRzxnCjkZgOTPmcC9WzNXD1y2Rdr8Kn6qm/S+rz
	 V1efAmRVQuqEPtDaNEBGsuMZIL+oNYOHIwySMGBAvLU20weziL7go8JijfNgAvZq4GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664749;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version;
	bh=fp2UotNfVGFO18g27Kw9Sr36+lO8V6CBZasq1bBpNoo=;
	b=qnoxxbyjdf035d9+Mgl/8+s9MjgqpW1RIPQw2QjKBaH+2bf/qJ1Ylyf2/B1vMJtN6XhD
	 VX14oho6bbe+2eW9avk0/T08VEwttCrBgA9h5oFHqvivDK8l+4pq3CQINorJOJNzZbEmm
	 FWBZr+TrULjRdUASuBO1E81/LnOvTAGV0CXj1wV3TtkmCnGXLdUdojRmTFEJy3cldUamd
	 N/f2feD/45zOR9KGUMZmO9lKaasbVF5FJ04BqAxuR1t3lDU3BIm0Q74uoXfnDfvtFmH+0
	 KVt69bzLxFKakZilBRb3+OiCZZcNJj9vmhUVR70hKKoD29qJ76PaDeksUAFoYdkKOLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=Y2IvQFhx;
	arc=none smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B715606A326;
	Tue,  3 Nov 2026 00:12:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B715606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=Y2IvQFhx
Received: from pps.filterd (m0528004.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K6HcN167852;
	Mon, 2 Nov 2026 16:12:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=fp2UotNfVGFO18g27Kw9Sr36+lO8V6CBZasq1
	bBpNoo=; b=Y2IvQFhxcV7hARjz2RifGDZ5lF8/VAdv4RsEcSKsjpwEHPiFKKaXw
	nX7795zAk2Nub9YTio6TXBrEB7sqsN30oh2jZxFtK8No1SgcqnXRUJmP02G6LEtN
	Pfa3HKH5+RBfgafcqlRWwJqOT/wb5wPTx9zuILRVtfhmCiuDaWSTMQ7odWC5zMAZ
	6GODfxTvGQiUmn5W6cjMTq5sCFE1FaTML0riLtu14t4vacNhknlBi6R+K8wwMSRw
	jNCWHuAq/BG2c7WFk2yXuSvu1b4kLARVGH14XMoLDOCWR9gtNbndSxUDRmQSIcC+
	SLxIoviSTVuNvqiCOBMMjXeYXNDbiSL8Q==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hp1ydtfhq-14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 02 Nov 2026 16:12:27 -0800 (PST)
Received: from localhost (2620:10d:c085:108::4) by mail.thefacebook.com
 (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Tue, 3 Nov
 2026 00:12:15 +0000
From: Todd Freed <toddfreed@meta.com>
To: <netdev@vger.kernel.org>, <toddfreed@meta.com>
CC: <linux-kselftest@vger.kernel.org>
Subject: [PATCH net v4 5/7] selftests: drv-net: psp: test ipv6 tcp socket with extension headers
Date: Mon, 2 Nov 2026 16:11:41 -0800
Message-ID: <20261103001143.246081-6-toddfreed@meta.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAwMCBTYWx0ZWRfX/7B/C3qt4S22
 3bu7TZYFfqTLqslASkoM20dfJqlEklPwUNnwezMiw4+KwELg6ixNmqAVTrUBE2IVkzK7zrfnoMS
 4sAsc16MCQX7yJqyp3aukKQwvNy+SLsXOGhhgcmLOABu6fjzhezhcN2OZOmf8CWvGt8GkJgsyPL
 wumc4RNSqsIsZBcaCEgzdr1albrrNeUeLMsG4/hYLg0c1V8OYWhWndSvjMlqUSRSFe6iohRPhmb
 0kZTVEX5oIUxR0uWvs8gBnetHhwT3r4FomMEgqzhr2Q7Jp37FkbyDSYcXnNSi7r7IQFKi7o5iVE
 MuzUMpnK8krUocjIqY3pg+BHlIBDYU3uAqgsz/PilBYyEyLwz5VjzI1rj3Dim7SaAxl9zBKQDgR
 5SnB/ecXaokbOiaNB0cOndMt/0jgLbOL/3nSjYtQyq9WdMv2o9f9ahLsyPUBN8g0nTub8/OwFe0
 lFocmxirp+D28ligI2g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAwMCBTYWx0ZWRfXz5U03KzNAOw8
 jqARBB8Pq5njTcqXRpZZii7aWUvCjyKwIdl/wrIMOFoDqn4yKZGM5aj99/M0qTNso6xxDn73VZ1
 X53vlOZc8gjl+buk/rSERyQ29DQKsRc=
X-Proofpoint-GUID: XmQfDCn5HI5J1GhPA5KA2JE7x7CsEPKG
X-Proofpoint-ORIG-GUID: XmQfDCn5HI5J1GhPA5KA2JE7x7CsEPKG
X-Authority-Analysis: v=2.4 cv=TeADJhQh c=1 sm=1 tr=0 ts=6ae926eb cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=GbPsI2Ihf5RTnMjR_gZv:22 a=VabnemYjAAAA:8 a=JE7m3MBIUUSpghwH1AUA:9
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01

send on a psp tcp socket in three phases, checking the device's
tx-packets and what the peer received after each:

 1/ no socket options. the data is sent, counted, and received.

 2/ an extension header set on the socket. the packets are dropped,
    tx-packets is unchanged, and nothing reaches the peer. the data
    stays queued.

 3/ option removed. the queued data, then new data, is sent, counted,
    and received.

the test has a variant for each extension header a socket can set: a
destination options header (IPV6_DSTOPTS) and a hop-by-hop options
header (IPV6_HOPOPTS), each holding one padn option, and a segment
routing header (IPV6_RTHDR).

a software filter on the peer also counts, and drops, udp packets from
the socket's address to the peer's. psp packets reach the peer as
decrypted tcp packets, as expected. packets which were encapsulated but
are malformed or unencrypted (this is what mlx5 does) show up as udp,
and the test asserts there are none. if the filter cannot be set up the
test is skipped.

tx-packets is read after it has quiesced, because some devices refresh
counters periodically (mlx5 takes about a second).

netdevsim doesn't drop in this case. the packets are encapsulated but in
a malformed way, counted in tx-packets, and the peer fails to decap. so
on netdevsim the test reports xfail without running
(require_nsim(nsim_test=False)).

without the fix in "net/mlx5e: psp: drop ipv6 packets with extension
headers", with mlx5 (connectx-7), the packets go out unencrypted and
aren't counted in tx-packets. the test fails on the udp packets which
reach the peer. capturing on the peer,

  tcpdump -i <dev> -nn -A 'ip6 and src host <sender> and not tcp'

shows them as udp, with the test's payload readable.

Signed-off-by: Todd Freed <toddfreed@meta.com>
---
 tools/testing/selftests/drivers/net/config |   1 +
 tools/testing/selftests/drivers/net/psp.py | 146 ++++++++++++++++++++-
 2 files changed, 144 insertions(+), 3 deletions(-)

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
index a5b1e14f120f..c9a725cc89a2 100755
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
+def _remote_count(cfg, proto, match):
+    """
+    Count, and drop, the @proto packets matching flower @match which reach
+    the remote, with a software filter on its ingress (offloaded filter
+    counters are refreshed periodically). Dropping keeps such packets away
+    from the remote's stack. Returns a function reading the count, or None
+    if the filter can't be installed.
+    """
+    flt = (f"dev {cfg.remote_ifname} ingress protocol {proto} pref 1 "
+           f"handle 0x5053 flower")
+    try:
+        qdiscs = tc(f"qdisc show dev {cfg.remote_ifname}", json=True,
+                    host=cfg.remote)
+        if not any(q['kind'] == 'clsact' for q in qdiscs):
+            tc(f"qdisc add dev {cfg.remote_ifname} clsact", host=cfg.remote)
+            defer(tc, f"qdisc del dev {cfg.remote_ifname} clsact",
+                  host=cfg.remote)
+        tc(f"filter add {flt} skip_hw {match} action drop", host=cfg.remote)
+    except CmdExitFailure as e:
+        ksft_pr(f"Can't install a filter on the remote: {e}")
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
@@ -624,6 +675,94 @@ def removal_device_bi(cfg):
         _close_conn(cfg, s)
 
 
+def _ipv6_exthdr_variants():
+    padn = bytes([0, 0, 1, 4, 0, 0, 0, 0])  # one PadN option
+
+    def srh(peer):
+        """ segment routing header, with @peer as its only segment """
+        return (bytes([0, 2, 4, 0, 0, 0, 0, 0]) +
+                socket.inet_pton(socket.AF_INET6, peer))
+
+    yield KsftNamedVariant("dstopts", socket.IPV6_DSTOPTS, lambda peer: padn)
+    yield KsftNamedVariant("hopopts", socket.IPV6_HOPOPTS, lambda peer: padn)
+    yield KsftNamedVariant("rthdr", socket.IPV6_RTHDR, srh)
+
+
+def _src_addr(dst):
+    """ The source address the kernel picks for @dst """
+    with socket.socket(socket.AF_INET6, socket.SOCK_DGRAM) as u:
+        u.connect((dst, 9))
+        return u.getsockname()[0]
+
+
+@ksft_variants(_ipv6_exthdr_variants())
+def data_send_ipv6_exthdr(cfg, opt, val):
+    """ Test that PSP drops IPv6 packets with an extension header """
+    cfg.require_ipver("6")
+    # netdevsim doesn't drop them: it sends them malformed
+    cfg.require_nsim(nsim_test=False)
+    _init_psp_dev(cfg)
+
+    # Packets which were encapsulated but malformed or left unencrypted
+    # reach the remote as UDP. Set up the count before connecting, so a
+    # skip doesn't leave the responder mid key exchange.
+    peer = cfg.remote_addr_v["6"]
+    remote_udp = _remote_count(cfg, "ipv6", f"src_ip {_src_addr(peer)} "
+                               f"dst_ip {peer} ip_proto udp")
+    if not remote_udp:
+        raise KsftSkipEx("can't count UDP on the remote")
+
+    s = _make_psp_conn(cfg, 0, "6")
+    try:
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
+        # 1. No option: sent, counted, and received
+        tx_pkts = _get_quiesced_stat(cfg, 'tx-packets')
+        total = _send_careful(cfg, s, 20)
+        wait_outq_empty()
+        ksft_gt(_get_quiesced_stat(cfg, 'tx-packets'), tx_pkts)
+        _check_data_rx(cfg, total)
+
+        # 2. With the option: dropped, not counted, and nothing reaches the
+        # peer. The data stays queued.
+        s.setsockopt(socket.IPPROTO_IPV6, opt, val(peer))
+        tx_pkts = _get_quiesced_stat(cfg, 'tx-packets')
+        udp = remote_udp()
+        queued = _send_careful(cfg, s, 20)
+        _check_data_outq(s, queued, force_wait=True)
+        ksft_eq(_get_quiesced_stat(cfg, 'tx-packets'), tx_pkts)
+        ksft_eq(remote_udp(), udp, comment="UDP at the remote")
+        _check_data_rx(cfg, total)
+        total += queued
+
+        # 3. Option removed: the queued data, then new data, sent and
+        # received
+        tx_pkts = _get_quiesced_stat(cfg, 'tx-packets')
+        s.setsockopt(socket.IPPROTO_IPV6, opt, b'')
+        wait_outq_empty()
+        total += _send_careful(cfg, s, 20)
+        wait_outq_empty()
+        ksft_gt(_get_quiesced_stat(cfg, 'tx-packets'), tx_pkts)
+        _check_data_rx(cfg, total)
+    finally:
+        _close_psp_conn(cfg, s)
+
+
 def _get_psp_ver_ip_variants():
     for ver in range(4):
         for ipv in ("4", "6"):
@@ -1019,7 +1158,8 @@ def main() -> None:
                                                           cfg.comm_port),
                                                          timeout=1)
 
-                cases = [data_basic_send, data_mss_adjust]
+                cases = [data_basic_send, data_mss_adjust,
+                         data_send_ipv6_exthdr]
 
                 if has_cont:
                     cases += [
-- 
2.53.0-Meta

