Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFD4374754
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 22:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773700168; cv=none; b=GXf1idVLbCVira/2l6WmzgQVF49arRgPaMjdKNFtj+IHVc3+RbiW2dKlRsT7tbW6/QFRkaVgXQr5/m82pvVgxZBVUiy2HrVnAT11j5ttxYz/cVoauhlxNoA2L8DwgGl7D5AjZtU81Cheyctvylf4mRMGsrstoc3KPkEmIu7Chc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773700168; c=relaxed/simple;
	bh=gPQdSLHqgxDCRlTaUp4gDb596s3Bu8ry/823mecq5og=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HY3IxfD+qw/UhENPkkTJx3Nppic4JOgOcO2sjq4lHIOGM2WtYn5k/GXNDstyy4NLuUg7PU/PuLdsAhEAYvpOGUd/K0JvR3+bjocOalLAfz3DIhPcxdfst8jbZKDumOjGTo9R7rkStPOBBwpseXlmVoA4ZFuYxgtvsl6SXZSyvwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AIHoMSei; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AIHoMSei"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64e87a81639so629380d50.0
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 15:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773700164; x=1774304964; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xYnevcqjsWNhoFXHuzMgmlhvEe4roXm2EbEcJEFKLu8=;
        b=AIHoMSeieDYr+bk4oEBBPZCcyzXRFm2aq8681FdDcs8TNwx4yWrhn1TxluOrsbwM2l
         Leptb2DSSpAa/bmQCnfy2QlyiqhkqDnFwis3t0TYLCKYLckc4w0bfU5zSLTx3EzqAwNw
         1jECWiEwiGTUjci0NwlcA+29RZNi65i51pU+JIJLSzzcfEHunbu16mGkJl0t1kyc7mqn
         4Y0qcapJCWSkgfQrEEoHjwKTMM5M8/OgLK1SWy8VbWkF9TQE+4HENFS9IPh2A58WOoJx
         6rwv6F1KmxQmop+Stn0red1lwOXHwTpi9+uzGsS4avpz1hD9/B10rv7tI9OwnMBAkts1
         IvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773700164; x=1774304964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xYnevcqjsWNhoFXHuzMgmlhvEe4roXm2EbEcJEFKLu8=;
        b=qDSd8/cQTEL9cC/3fIcOCQg7BhJpDbao5zIMB0lrRZ2utuFMrS2zsVJTATpBQmjq1u
         KUdbLKraHGs5eCPj+ijAz32B7pRtavo9dASlZpggluuVdEb5sNvlQ1JmguoL8JjFxMHo
         jPO8zqbdNDmnVOx9aZIiASbYa8gFSuoPKEIKk5L2TSXcchDLu6U5cgY8hoxhYkYKJ+tE
         cpEO8V9NFoqhogjBA31LS2tZQM+HqaObyb2XleeFlvIx+IyOXQKFMKKM1DBzQ5JyHkUB
         vyYrs//7dwztkSE1Cy7YrUCZpOckGus86HwJCVXWS7xCyrXInOOcOIOEFvisspvXdNcV
         5UrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZQ6aorCLQiiA0HkDyMwGV/M3NnMlaPVo6AmiX4xfhz8bOYY9Xh1uU2iASlH/CpxEDk1ldyAQIRlenmA8xJSE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMNgOCbfMwlJH4GyfymYurb5Fr2Ihr5S3NU0YsDhy7jYFalSk3
	i3z+niZW227fUiZBpFWUrtexRVAOPakE/JfXin6+dv6Kz5wHpCu6+PJB
X-Gm-Gg: ATEYQzypoRH/OXAlTs+SAjE7aTWRqSjW3wi7eTJC28KPfp90qdntyh4/OhruRuqbXRD
	wFMPCdMX4RO0UWsmRoJs97mYBdI8Q5XdabvjSWGsoglUVHGtf0hvA6fY5njbgD5W/qDSPgcD7VZ
	wbq687OiE81lV/967OJalBMbv1v8THDZi4MDymvArhDZaqQksV9b7T7C2Uz+vD0eNGtqDRJSULg
	F55hLYT7M8Dl/zn0CpkqLg2/zWY9O5gjj1ZU7JD6Pdc4DCr5u/wFGOaMm+noMkNHb/QySS3a8Kf
	zgUmWcbMwHAqOooWh6iGO9eh/yL9CUfAmTdfno2YiJTX7kpFf6Bekmx9zd/cIXWKHVb76GM+bK1
	F0/hOorvPWSEzOPB4TaAz1VIbHJFs5En1czqsuUpyDUQNhAXzIqMAsdGqcF/tTAKiTAJH2892Zs
	eIberpH5rBAmlwXt/tWQt1
X-Received: by 2002:a05:690c:201c:b0:79a:55f5:a3fa with SMTP id 00721157ae682-79a55f5ecabmr26736657b3.20.1773700164261;
        Mon, 16 Mar 2026 15:29:24 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:8::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79917ee5757sm96813577b3.31.2026.03.16.15.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 15:29:24 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Mon, 16 Mar 2026 15:29:15 -0700
Subject: [PATCH net-next 4/6] selftests: drv-net: add primary RX redirect
 support to NetDrvContEnv
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-scratch-bobbyeshleman-tcp-dm-netkit5-v1-4-b53c8cd72b23@meta.com>
References: <20260316-scratch-bobbyeshleman-tcp-dm-netkit5-v1-0-b53c8cd72b23@meta.com>
In-Reply-To: <20260316-scratch-bobbyeshleman-tcp-dm-netkit5-v1-0-b53c8cd72b23@meta.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: Stanislav Fomichev <sdf@fomichev.me>, 
 Mina Almasry <almasrymina@google.com>, Wei Wang <weibunny@fb.com>, 
 David Wei <dw@davidwei.uk>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 bpf@vger.kernel.org, Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

Add a primary_rx_redirect parameter to NetDrvContEnv that enables a BPF
tc program (nk_primary_rx_redirect.bpf.c) on the primary netkit ingress.
This program redirects traffic to the physical NIC via
bpf_redirect_neigh(), while letting ICMPv6 through for neighbor
discovery.

This will be used by the devmem netkit TX tests where the nk peer is
sending to the nk primary for redirection to the physical NIC.

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 tools/testing/selftests/drivers/net/hw/.gitignore  |  1 +
 .../drivers/net/hw/nk_primary_rx_redirect.bpf.c    | 41 ++++++++++++++++++++++
 tools/testing/selftests/drivers/net/lib/py/env.py  | 39 +++++++++++++++++++-
 3 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/net/hw/.gitignore b/tools/testing/selftests/drivers/net/hw/.gitignore
index 46540468a775..3e5c51f8e1c7 100644
--- a/tools/testing/selftests/drivers/net/hw/.gitignore
+++ b/tools/testing/selftests/drivers/net/hw/.gitignore
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 iou-zcrx
 ncdevmem
+nk_primary_rx_redirect
 toeplitz
diff --git a/tools/testing/selftests/drivers/net/hw/nk_primary_rx_redirect.bpf.c b/tools/testing/selftests/drivers/net/hw/nk_primary_rx_redirect.bpf.c
new file mode 100644
index 000000000000..fe3c127a4fd0
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/hw/nk_primary_rx_redirect.bpf.c
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/bpf.h>
+#include <linux/if_ether.h>
+#include <linux/ipv6.h>
+#include <bpf/bpf_helpers.h>
+#include <bpf/bpf_endian.h>
+
+#define TC_ACT_OK 0
+#define ETH_P_IPV6 0x86DD
+#define IPPROTO_ICMPV6 58
+
+#define ctx_ptr(field)		((void *)(long)(field))
+
+volatile __u32 phys_ifindex;
+
+SEC("tc/ingress")
+int nk_primary_rx_redirect(struct __sk_buff *skb)
+{
+	void *data_end = ctx_ptr(skb->data_end);
+	void *data = ctx_ptr(skb->data);
+	struct ethhdr *eth;
+	struct ipv6hdr *ip6h;
+
+	eth = data;
+	if ((void *)(eth + 1) > data_end)
+		return TC_ACT_OK;
+
+	if (eth->h_proto != bpf_htons(ETH_P_IPV6))
+		return TC_ACT_OK;
+
+	ip6h = data + sizeof(struct ethhdr);
+	if ((void *)(ip6h + 1) > data_end)
+		return TC_ACT_OK;
+
+	if (ip6h->nexthdr == IPPROTO_ICMPV6)
+		return TC_ACT_OK;
+
+	return bpf_redirect_neigh(phys_ifindex, NULL, 0, 0);
+}
+
+char __license[] SEC("license") = "GPL";
diff --git a/tools/testing/selftests/drivers/net/lib/py/env.py b/tools/testing/selftests/drivers/net/lib/py/env.py
index 08e90448f48d..e124b9c7c95c 100644
--- a/tools/testing/selftests/drivers/net/lib/py/env.py
+++ b/tools/testing/selftests/drivers/net/lib/py/env.py
@@ -327,12 +327,13 @@ class NetDrvContEnv(NetDrvEpEnv):
               +---------------+
     """
 
-    def __init__(self, src_path, rxqueues=1, **kwargs):
+    def __init__(self, src_path, rxqueues=1, primary_rx_redirect=False, **kwargs):
         self.netns = None
         self._nk_host_ifname = None
         self._nk_guest_ifname = None
         self._tc_clsact_added = False
         self._tc_attached = False
+        self._primary_rx_redirect_attached = False
         self._bpf_prog_pref = None
         self._bpf_prog_id = None
         self._init_ns_attached = False
@@ -387,8 +388,14 @@ class NetDrvContEnv(NetDrvEpEnv):
 
         self._setup_ns()
         self._attach_bpf()
+        if primary_rx_redirect:
+            self._attach_primary_rx_redirect_bpf()
 
     def __del__(self):
+        if self._primary_rx_redirect_attached:
+            cmd(f"tc qdisc del dev {self._nk_host_ifname} clsact", fail=False)
+            self._primary_rx_redirect_attached = False
+
         if self._tc_attached:
             cmd(f"tc filter del dev {self.ifname} ingress pref {self._bpf_prog_pref}")
             self._tc_attached = False
@@ -450,6 +457,8 @@ class NetDrvContEnv(NetDrvEpEnv):
         ip(f"-6 addr add {self.nk_guest_ipv6}/64 dev {self._nk_guest_ifname} nodad", ns=self.netns)
         ip(f"-6 route add default via fe80::1 dev {self._nk_guest_ifname}", ns=self.netns)
 
+        ip(f"-6 route add {self.nk_guest_ipv6}/128 via {self.addr_v['6']}", host=self.remote)
+
     def _tc_ensure_clsact(self):
         qdisc = json.loads(cmd(f"tc -j qdisc show dev {self.ifname}").stdout)
         for q in qdisc:
@@ -495,3 +504,31 @@ class NetDrvContEnv(NetDrvEpEnv):
         value = ipv6_bytes + ifindex_bytes
         value_hex = ' '.join(f'{b:02x}' for b in value)
         bpftool(f"map update id {bss_map_id} key hex 00 00 00 00 value hex {value_hex}")
+
+    def _attach_primary_rx_redirect_bpf(self):
+        """Attach BPF redirect program on the primary netkit ingress."""
+        bpf_obj = self.test_dir / "nk_primary_rx_redirect.bpf.o"
+        if not bpf_obj.exists():
+            raise KsftSkipEx("Primary RX redirect BPF prog not found")
+
+        cmd(f"tc qdisc add dev {self._nk_host_ifname} clsact")
+        cmd(f"tc filter add dev {self._nk_host_ifname} ingress"
+            f" bpf obj {bpf_obj} sec tc/ingress direct-action")
+        self._primary_rx_redirect_attached = True
+
+        filters = json.loads(
+            cmd(f"tc -j filter show dev {self._nk_host_ifname} ingress").stdout)
+        redirect_prog_id = None
+        for bpf in filters:
+            if 'options' not in bpf:
+                continue
+            if bpf['options']['bpf_name'].startswith('nk_primary_rx_redirect'):
+                redirect_prog_id = bpf['options']['prog']['id']
+                break
+        if redirect_prog_id is None:
+            raise Exception("Failed to get primary RX redirect BPF prog ID")
+
+        bss_map_id = self._find_bss_map_id(redirect_prog_id)
+        phys_ifindex_bytes = self.ifindex.to_bytes(4, byteorder='little')
+        value_hex = ' '.join(f'{b:02x}' for b in phys_ifindex_bytes)
+        bpftool(f"map update id {bss_map_id} key hex 00 00 00 00 value hex {value_hex}")

-- 
2.52.0

