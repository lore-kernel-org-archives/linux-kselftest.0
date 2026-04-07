Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0F23CFF6C
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 16:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775580600; cv=none; b=XSiaqFY/dPTqrp1SUfVMrxrvSjq2BcN0foVQJlqXaHXCa6u1zZ2SeOHORpgY+Anq+iVzLMlSbfgKw7U71GnLR8FnZI4WHzKNvNob2sk2OAPXeuZvlk3qWptllT05Q6/zO/CmAUG294HVb7xF1+O1mzYV5iaRgvkMb/6Mt4IUkWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775580600; c=relaxed/simple;
	bh=BMHvtjfT710czgTjwhGkY1ATVukjeSO+Q7OwjohpY6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H+kUIIut4yQMb5wAO+0ltPbmgrBOR7xZuv5uWuEmQvUh6XLY1RYEFkaRo8+1TfYexfY/OS4KkuWFwCwvT4p5Fu5cMPnUu7yY3Q++hPdduNMzpxZ3+HTe9DCkplEaEzdaw3/PEoJMk/O+HX86yI6e8QAnYgAhp46k1vNAzswCwxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q8B5KlmH; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q8B5KlmH"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82ce09b61beso2341605b3a.0
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 09:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775580598; x=1776185398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FwxJ6dtv3f2N2p1vuCTcEPoCe1FyYvFVCjckJ0/pOto=;
        b=q8B5KlmH/ydm2UKUjwwfRDCfgHWzCPA+SL2zg+A2UrHUc6YpabzycKy8FJKPK4FCMh
         LdnyQkQvc88SJqcylLHuSLzPKLgERi1/uHDalPhRaOALk4E9KaGtbEv3xrluWkgSTlNS
         wbmwNvyJ4TiLWK8v/TZFsQIjU8vCSQgSegfIe0l/aVuo9j1dQvmPxLPp9Zlf/fQ4+uTG
         YBKhzyl7D3utR1UodR7eacNaU626Hyfr/fhunD641IoA7D+kFir8v4ctG0N/o0fJxTUY
         oig6XDws3AqfYVGWquMtjqIkhgjJ4IWKHgV6eKQ/NcHEVm374MHfDfmlqWIjoEPjXv7O
         p+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775580598; x=1776185398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FwxJ6dtv3f2N2p1vuCTcEPoCe1FyYvFVCjckJ0/pOto=;
        b=Kl2dsOChLXdVJnvZHuajyMhpHpVg8oQ53JGdO1uaoJZuQ+M5rBBpZSe6i+uYfAXjqg
         B8f0DlOQOHgW0l8a7fLCV4nqesG8Ejd2FrSv3Hkfli8TfYLJYN4lhEpMyNDM8zoRb88W
         x26nhriAHIjE4oisw5Y7aVLij5BMlJ+UVTOUpDxefmRe22wKB+DjBPS4QdIOv6H5TLXZ
         NtPzQaa0zNR9oqP+yZnMJjfwoWap22LiP9DmvwsZYP4svGT+sEAJAuvvcFbC2zHXqzzg
         rjRdKVU+1SSPnggCFOcIHpHVDPMv5hM236u0sDRGo1ND5fmxe+snzR+ClGYdRW7nERuZ
         dVTA==
X-Forwarded-Encrypted: i=1; AJvYcCUwl8UbQdUstrhWe/MuCdMGQkmw+2+9KxYehDvWd4jFmYuow2CxmZqz3Y8Ooh5qsLjoA/mcsU9W/7Jz76w3C8w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp9gt+4DLx3r2f6+sF5tGPthzRBfu0FbIdS0HJ+NLvably7WuF
	FdgdBFPNjAOwRjR9UPHsW90J7fIK0gb3FhtlpHqGOuDLQmX8xQ43Kk/r
X-Gm-Gg: AeBDies3+zOzR5AhHqLpwqTe6K/NAPxLAHeUixKk+bSajV+qCXA+qwQLTcNNzmksMcQ
	MosN0R5YpLhuI+iwKeQP6dbsrCofKqbmhToXFFa2gCYxRzYdstgqi8hhTCkMtkV9c7dlFsfse0Z
	g/aNlKCkSGp7RQlvuJagm6ei56B+VFSlDJpRknb5Ngz/FGsp8dQiGVd7Jxd0UARJDsRwvrTnGAl
	+0LBf+5kL68TusNsWMG76SLFvug+0f/OAjk4N+rJwpZZqmG5+ZBEf6szzRtUB4pMe7s2aUQzbr1
	1kR7JZIb62QXIV08t5BuglqsAv2SENl8Y0K9awvnrqkCn1hoetPcpYCDFjn004rTpzYgW86yeZs
	TLbv9oTyWuUK2JqKhGPQTIPivKbduEOpJODr1k/8bn3Gywg2VPtJoaQgjwl1wNrR4iNu4y+1OVr
	GAThh+l2xNPlTxRQiDCJ9D7jKSsgm6
X-Received: by 2002:a05:6a00:3e19:b0:81f:40e5:34c2 with SMTP id d2e1a72fcca58-82d0db53f87mr17236423b3a.32.1775580597670;
        Tue, 07 Apr 2026 09:49:57 -0700 (PDT)
Received: from localhost ([2a03:2880:7ff:41::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c706f7sm17842349b3a.47.2026.04.07.09.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 09:49:56 -0700 (PDT)
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
To: "David S . Miller" <davem@davemloft.net>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Petr Machata <petrm@nvidia.com>,
	David Wei <dw@davidwei.uk>,
	Chris J Arges <carges@cloudflare.com>,
	Carolina Jubran <cjubran@nvidia.com>,
	Dimitri Daskalakis <daskald@meta.com>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 1/2] selftests: drv-net: Add ntuple (NFC) flow steering test
Date: Tue,  7 Apr 2026 09:49:53 -0700
Message-ID: <20260407164954.2977820-2-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260407164954.2977820-1-dimitri.daskalakis1@gmail.com>
References: <20260407164954.2977820-1-dimitri.daskalakis1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dimitri Daskalakis <daskald@meta.com>

Add a test for ethtool NFC (ntuple) flow steering rules. The test
creates an ntuple rule matching on various flow fields and verifies
that traffic is steered to the correct queue.

The test forces all traffic to queue 0 via the indirection table,
then installs an ntuple rule to steer select traffic to a specific
queue. The test then verifies the expected number of packets is received
on the queue.

This test has variants for TCP/UDP over IPv4/IPv6, with rules matching
the source IP. Additional match fields will be added in the next commit.

 TAP version 13
 1..4
 ok 1 ntuple.queue.tcp4.src_ip
 ok 2 ntuple.queue.udp4.src_ip
 ok 3 ntuple.queue.tcp6.src_ip
 ok 4 ntuple.queue.udp6.src_ip
 # Totals: pass:4 fail:0 xfail:0 xpass:0 skip:0 error:0

Signed-off-by: Dimitri Daskalakis <daskald@meta.com>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 .../testing/selftests/drivers/net/hw/Makefile |   1 +
 .../selftests/drivers/net/hw/ntuple.py        | 145 ++++++++++++++++++
 2 files changed, 146 insertions(+)
 create mode 100755 tools/testing/selftests/drivers/net/hw/ntuple.py

diff --git a/tools/testing/selftests/drivers/net/hw/Makefile b/tools/testing/selftests/drivers/net/hw/Makefile
index deeca3f8d080..1f4ebe70c34c 100644
--- a/tools/testing/selftests/drivers/net/hw/Makefile
+++ b/tools/testing/selftests/drivers/net/hw/Makefile
@@ -35,6 +35,7 @@ TEST_PROGS = \
 	loopback.sh \
 	nic_timestamp.py \
 	nk_netns.py \
+	ntuple.py \
 	pp_alloc_fail.py \
 	rss_api.py \
 	rss_ctx.py \
diff --git a/tools/testing/selftests/drivers/net/hw/ntuple.py b/tools/testing/selftests/drivers/net/hw/ntuple.py
new file mode 100755
index 000000000000..c50b76198fba
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/hw/ntuple.py
@@ -0,0 +1,145 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+"""Test ethtool NFC (ntuple) flow steering rules."""
+
+import random
+from enum import Enum, auto
+from lib.py import ksft_run, ksft_exit
+from lib.py import ksft_eq, ksft_ge
+from lib.py import ksft_variants, KsftNamedVariant
+from lib.py import EthtoolFamily, NetDrvEpEnv, NetdevFamily
+from lib.py import KsftSkipEx
+from lib.py import cmd, ethtool, defer, rand_port, bkg, wait_port_listen
+
+
+class NtupleField(Enum):
+    SRC_IP = auto()
+
+
+def _require_ntuple(cfg):
+    features = ethtool(f"-k {cfg.ifname}", json=True)[0]
+    if not features["ntuple-filters"]["active"]:
+        raise KsftSkipEx("Ntuple filters not enabled on the device: " + str(features["ntuple-filters"]))
+
+
+def _get_rx_cnts(cfg, prev=None):
+    """Get Rx packet counts for all queues, as a simple list of integers
+       if @prev is specified the prev counts will be subtracted"""
+    cfg.wait_hw_stats_settle()
+    data = cfg.netdevnl.qstats_get({"ifindex": cfg.ifindex, "scope": ["queue"]}, dump=True)
+    data = [x for x in data if x['queue-type'] == "rx"]
+    max_q = max([x["queue-id"] for x in data])
+    queue_stats = [0] * (max_q + 1)
+    for q in data:
+        queue_stats[q["queue-id"]] = q["rx-packets"]
+        if prev and q["queue-id"] < len(prev):
+            queue_stats[q["queue-id"]] -= prev[q["queue-id"]]
+    return queue_stats
+
+
+def _ntuple_rule_add(cfg, flow_spec):
+    """Install an NFC rule via ethtool."""
+
+    output = ethtool(f"-N {cfg.ifname} {flow_spec}").stdout
+    rule_id = int(output.split()[-1])
+    defer(ethtool, f"-N {cfg.ifname} delete {rule_id}")
+
+
+def _setup_isolated_queue(cfg):
+    """Default all traffic to queue 0, and pick a random queue to
+       steer NFC traffic to."""
+
+    channels = cfg.ethnl.channels_get({'header': {'dev-index': cfg.ifindex}})
+    ch_max = channels['combined-max']
+    qcnt = channels['combined-count']
+
+    if ch_max < 2:
+        raise KsftSkipEx(f"Need at least 2 combined channels, max is {ch_max}")
+
+    desired_queues = min(ch_max, 4)
+    if qcnt >= desired_queues:
+        desired_queues = qcnt
+    else:
+        ethtool(f"-L {cfg.ifname} combined {desired_queues}")
+        defer(ethtool, f"-L {cfg.ifname} combined {qcnt}")
+
+    ethtool(f"-X {cfg.ifname} equal 1")
+    defer(ethtool, f"-X {cfg.ifname} default")
+
+    return random.randint(1, desired_queues - 1)
+
+
+def _send_traffic(cfg, ipver, proto, dst_port, pkt_cnt=40):
+    """Generate traffic with the desired flow signature."""
+
+    cfg.require_cmd("socat", remote=True)
+
+    socat_proto = proto.upper()
+    dst_addr = f"[{cfg.addr_v['6']}]" if ipver == '6' else cfg.addr_v['4']
+
+    extra_opts = ",nodelay" if proto == "tcp" else ",shut-null"
+
+    listen_cmd = (f"socat -{ipver} -t 2 -u "
+                  f"{socat_proto}-LISTEN:{dst_port},reuseport /dev/null")
+    with bkg(listen_cmd, exit_wait=True):
+        wait_port_listen(dst_port, proto=proto)
+        send_cmd = f"""
+        bash -c 'for i in $(seq {pkt_cnt}); do echo msg; sleep 0.02; done' |
+        socat -{ipver} -u - \
+            {socat_proto}:{dst_addr}:{dst_port},reuseaddr{extra_opts}
+        """
+        cmd(send_cmd, shell=True, host=cfg.remote)
+
+
+def _add_ntuple_rule_and_send_traffic(cfg, ipver, proto, fields, test_queue):
+    dst_port = rand_port()
+    flow_parts = [f"flow-type {proto}{ipver}"]
+
+    for field in fields:
+        if field == NtupleField.SRC_IP:
+            flow_parts.append(f"src-ip {cfg.remote_addr_v[ipver]}")
+
+    flow_parts.append(f"action {test_queue}")
+    _ntuple_rule_add(cfg, " ".join(flow_parts))
+    _send_traffic(cfg, ipver, proto, dst_port=dst_port)
+
+
+def _ntuple_variants():
+    for ipver in ["4", "6"]:
+        for proto in ["tcp", "udp"]:
+            for fields in [[NtupleField.SRC_IP]]:
+                name = ".".join(f.name.lower() for f in fields)
+                yield KsftNamedVariant(f"{proto}{ipver}.{name}",
+                                      ipver, proto, fields)
+
+
+@ksft_variants(_ntuple_variants())
+def queue(cfg, ipver, proto, fields):
+    """Test that an NFC rule steers traffic to the correct queue."""
+
+    cfg.require_ipver(ipver)
+    _require_ntuple(cfg)
+
+    test_queue = _setup_isolated_queue(cfg)
+
+    cnts = _get_rx_cnts(cfg)
+    _add_ntuple_rule_and_send_traffic(cfg, ipver, proto, fields, test_queue)
+    cnts = _get_rx_cnts(cfg, prev=cnts)
+
+    ksft_ge(cnts[test_queue], 40, f"Traffic on test queue {test_queue}: {cnts}")
+    sum_idle = sum(cnts) - cnts[0] - cnts[test_queue]
+    ksft_eq(sum_idle, 0, f"Traffic on idle queues: {cnts}")
+
+
+def main() -> None:
+    """Ksft boilerplate main."""
+
+    with NetDrvEpEnv(__file__, nsim_test=False) as cfg:
+        cfg.ethnl = EthtoolFamily()
+        cfg.netdevnl = NetdevFamily()
+        ksft_run([queue], args=(cfg,))
+    ksft_exit()
+
+
+if __name__ == "__main__":
+    main()
-- 
2.52.0

