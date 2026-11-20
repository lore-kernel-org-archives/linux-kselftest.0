Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795153808;
	b=qmKkNreqInSrR5t3OarzCAGuS/+jeJfS4yIprj/8G4pmnKKxKG611DJeWhYeRd5sKMHl
	 Qq0au4kk/+Hm+Vfge78u2dkX1QSe4hgXcOJSjJZRzaYW/nN1N575HrzY2OtIgep+H+Fz6
	 BlD3npDXwwJNbCeWVljWMFJtCBheS6SobgsJebT99Sv6QzQqofhsGX++F3G3Lm7SgeGvD
	 EOMWBMv5WFD3SxrrMvAYLGsnUM78B68xDAR63FVEP6692QGky0Hj4MxXw1K1eC22jgCbJ
	 dxIm2bY0okCSoNsozxlw4UFrdW/1zCsS1zM0xFsx9BcF/dHqshiYmnT9ZFqmoDjBmmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795153808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=7d/1HgJURULJVumT0wvLHjEI3D13OW8Hn3TBUynGK50=;
	b=Mg204CBTfrF/DsA5RyflQbI8iDOtDxJ2r0T0/bELtAMKXcOZAngFM7BpLNgtKuVhZMUB
	 P/mpQjdEVg78vInEitEoD5dYGXT9yTXrVg2tD8HuKV6ifh3IN9ZoqsFZpH8bwsx78hEJm
	 Vo6SlDtgrAQDUHICr/G/ndjx0+hM7+XbWnuxgwMDVAMwfWtTHurNbxTq6xaQ8Lm7x2uNN
	 XlcqrawDdZ0NlP5uhm0KYMBWlgsKOlVnJ3lIgtIcJP2tYQcvbOSKD1YO6+T0rB4Bpo44t
	 HT5vRfH/uqwdBE9T969EanOKqeEkMqSnmhMN7IzrdH0ZyUjamaQlfNiACDyH7Yz9V/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JDteBG5R;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCAE606A32A
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 05:50:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CCAE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JDteBG5R
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1a71dd190b0so1749421c88.1
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 21:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795153807; x=1795758607; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7d/1HgJURULJVumT0wvLHjEI3D13OW8Hn3TBUynGK50=;
        b=JDteBG5RlJEjSkjK7EPbD63yXntVNktOmqe75dO9NMo0J905CVYWFc95Zgcu6gbNaW
         LI1Fo2TQrPBDRaVvir3Eu4ftUHM04Pt7xxLp7o/vhZepSLYQqzYXZoBv8xJoE3eJoU6b
         RmVfns24DmqPRRKjQk3pEyqjBwGDqZg2mkN8kpJdS+FilGqA33KwVFG8r2MiLG2xAo8f
         VyuAGCs2YODXCGTKmwQT44H1SSFL8GztVuIvoFS5HMhfD0sSHGqUle9SQq2+kz/mbM8K
         enRjAIUCHIfcf4lmVPC0FHkRRyDLMQGaPkt9qQUiRq/37uXFV3Q667e1mZ23VfEm6utq
         bnyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795153807; x=1795758607;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7d/1HgJURULJVumT0wvLHjEI3D13OW8Hn3TBUynGK50=;
        b=yR9jHZI7922OWX0bjXMO5dFFeVIXMEcukWWLnHjI9gc2Uq7p7EOs63rJgIC2bZKjNy
         hJLedCEE7mcD8DkJ2/QcjUV+dITv6U5CPj93Ch2byeoi35annKWa3ohTA1KvlkedCwIT
         VwQqfHPMglV1nrt78GVfC2rWxiHJP1tnskxDE7EXeRGx08OPEwFtviQeIMLbVUf/OSFM
         PsGI28hHNHK7X9x+TYcoeBb/ksg33CoHgRtan9CT6Gujufogck5lelGI14UKT0cTnRmn
         VypLvc14yavKV5ugTvSxRe0x1KwzzY2tlZpvHGWJvMygjOiZZAzxo7gVFWdNw1gpTTGB
         aEew==
X-Forwarded-Encrypted: i=1; AL+hErHFSzyijYSNiUtaZL74x9KP8Vf7MTAtfF7QAmE8IvjQzA/zpMCvngQePi0rcr6H7NVeMZaYt8vu+HpW1L0Dte4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Q1y0r7pqJZ9k1ii5ZWS2ljRHWaC/PqsB682kTyiRlhNBO76l8
	OudEEmWiDOByrvIA3CF5Xl9dPlgYi2EBU9ubqp4m3UWiORrVO3mS9hP9DAWFZT7G7IgqjwCTNiG
	yqEtkVKyFkmE2C9NlUqRMgJxsJg==
X-Received: from dli13-n2.prod.google.com ([2002:a05:7022:28d:20b0:19a:484d:c761])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:ea45:b0:1b5:31db:cc3e with SMTP id a92af1059eb24-1b5568b2b4bmr1742533c88.11.1795153806448;
 Thu, 19 Nov 2026 21:50:06 -0800 (PST)
Date: Fri, 20 Nov 2026 04:59:18 +0000
In-Reply-To: <20261120045918.1239746-1-almasrymina@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261120045918.1239746-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120045918.1239746-8-almasrymina@google.com>
Subject: [PATCH net-next v4 7/7] selftests: net: add leased devmem RX and TX
 netdev unregister tests
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	Weiming Shi <bestswngs@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

Extend nl_netdev.py to cover netdev unregistration while devmem RX and
TX bindings are active on a virtual netkit device leasing an RX queue
from netdevsim:

1. devmem_lease_bind_rx_unregister_check: binds an RX dmabuf to a netkit
   device backed by a leased netdevsim queue and verifies clean teardown
   both when the virtual netkit device is deleted first (unleasing the
   queue while netdevsim remains up) and when the underlying netdevsim
   device is unregistered directly (which uninstalls the physical queue
   memory provider and cascades unregistration to the leasing netkit).
2. devmem_lease_bind_tx_unregister_check: binds a TX dmabuf to a netkit
   device backed by a leased netdevsim queue and verifies clean teardown
   both when the virtual netkit device is deleted first and when the
   underlying netdevsim device is unregistered directly.

Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 tools/testing/selftests/net/nl_netdev.py | 159 ++++++++++++++++++++++-
 1 file changed, 155 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/net/nl_netdev.py b/tools/testing/selftests/net/nl_netdev.py
index dd0321c0b463a..2e4e34257e873 100755
--- a/tools/testing/selftests/net/nl_netdev.py
+++ b/tools/testing/selftests/net/nl_netdev.py
@@ -12,8 +12,10 @@ import os
 import struct
 from os import system
 from lib.py import ksft_run, ksft_exit, KsftFailEx, KsftSkipEx
-from lib.py import ksft_eq, ksft_ge, ksft_ne, ksft_raises, ksft_busy_wait
-from lib.py import EthtoolFamily, NetdevFamily, NetdevSimDev, NlError, defer, ip
+from lib.py import ksft_eq, ksft_ge, ksft_in, ksft_ne, ksft_not_in
+from lib.py import ksft_raises, ksft_busy_wait
+from lib.py import EthtoolFamily, NetdevFamily, NetdevSimDev, Netlink
+from lib.py import NlError, RtnlFamily, cmd, defer, ip
 
 
 def empty_check(nf) -> None:
@@ -423,12 +425,22 @@ def _dmabuf_attach_count(dmabuf_fd) -> int:
     raise KsftFailEx(f"dma-buf {ino} not found in {path}")
 
 
-def _devmem_bind(bind, attrs) -> None:
+def _devmem_bind(bind, attrs, phys_attrs=None) -> None:
     """Run a devmem bind op, skip the test if the device can't do devmem."""
     try:
         bind(attrs)
     except NlError as e:
         if e.error == errno.EOPNOTSUPP:
+            if phys_attrs is not None:
+                try:
+                    bind(phys_attrs)
+                except NlError as probe_e:
+                    if probe_e.error == errno.EOPNOTSUPP:
+                        raise KsftSkipEx(
+                            f"devmem binding not supported: {probe_e}"
+                        ) from probe_e
+                    raise e from probe_e
+                raise
             raise KsftSkipEx(f"devmem binding not supported: {e}") from e
         raise
 
@@ -483,6 +495,143 @@ def devmem_bind_tx_unregister_check(_nf) -> None:
     nf_priv.close()
 
 
+def _create_netkit_single(rxqueues=2):
+    """Create a single-device netkit interface for queue lease tests."""
+    ifname = f"nk{os.getpid()}"
+    try:
+        with RtnlFamily() as rtnl:
+            rtnl.newlink(
+                {
+                    "ifname": ifname,
+                    "linkinfo": {
+                        "kind": "netkit",
+                        "data": {
+                            "mode": "l2",
+                            "pairing": "single",
+                        },
+                    },
+                    "num-rx-queues": rxqueues,
+                },
+                flags=[Netlink.NLM_F_CREATE, Netlink.NLM_F_EXCL],
+            )
+    except NlError as e:
+        if e.error in (errno.EOPNOTSUPP, errno.ENOENT):
+            raise KsftSkipEx(f"netkit single mode not supported: {e}") from e
+        raise
+    defer(cmd, f"ip link del dev {ifname}", fail=False)
+
+    link = ip(f"-d link show dev {ifname}", json=True)[0]
+    return ifname, link["ifindex"]
+
+
+def _queue_lease(nf, nk_ifindex, phys_ifindex, phys_qid=1):
+    try:
+        return nf.queue_create({
+            "ifindex": nk_ifindex,
+            "type": "rx",
+            "lease": {
+                "ifindex": phys_ifindex,
+                "queue": {"id": phys_qid, "type": "rx"},
+            },
+        })
+    except NlError as e:
+        if e.error == errno.EOPNOTSUPP:
+            raise KsftSkipEx(f"queue lease not supported: {e}") from e
+        raise
+
+
+def devmem_lease_bind_rx_unregister_check(nf) -> None:
+    """Verify leased RX devmem bindings detach cleanly on virt/phys unregister."""
+    for remove_virt_first in (False, True):
+        dmabuf_fd = _create_udmabuf()
+        defer(os.close, dmabuf_fd)
+        nf_priv = NetdevFamily()
+        defer(nf_priv.close)
+        nsimdev = NetdevSimDev(queue_count=2)
+        defer(nsimdev.remove)
+        nsim = nsimdev.nsims[0]
+
+        ip(f"link set dev {nsim.ifname} up")
+        with EthtoolFamily() as ef:
+            ef.rings_set({"header": {"dev-index": nsim.ifindex},
+                          "tcp-data-split": "enabled"})
+
+        nk_ifname, nk_ifindex = _create_netkit_single(rxqueues=2)
+        ip(f"link set dev {nk_ifname} up")
+
+        res = _queue_lease(nf, nk_ifindex, nsim.ifindex)
+
+        _devmem_bind(nf_priv.bind_rx, {
+            "ifindex": nk_ifindex,
+            "fd": dmabuf_fd,
+            "queues": [{"id": res["id"], "type": "rx"}],
+        }, phys_attrs={
+            "ifindex": nsim.ifindex,
+            "fd": dmabuf_fd,
+            "queues": [{"id": 0, "type": "rx"}],
+        })
+        ksft_ge(_dmabuf_attach_count(dmabuf_fd), 1)
+        phys_q = nf.queue_get({"ifindex": nsim.ifindex, "id": 1, "type": "rx"})
+        ksft_in("dmabuf", phys_q)
+        ksft_in("lease", phys_q)
+
+        if remove_virt_first:
+            ip(f"link del dev {nk_ifname}")
+            phys_q = nf.queue_get({"ifindex": nsim.ifindex, "id": 1,
+                                   "type": "rx"})
+            ksft_not_in("dmabuf", phys_q)
+            ksft_not_in("lease", phys_q)
+            ksft_ge(_dmabuf_attach_count(dmabuf_fd), 1)
+            nsimdev.remove()
+        else:
+            nsimdev.remove()
+            ksft_ne(cmd(f"ip link show dev {nk_ifname}", fail=False).ret, 0)
+            cmd(f"ip link del dev {nk_ifname}", fail=False)
+        ksft_eq(_dmabuf_attach_count(dmabuf_fd), 0)
+
+        nf_priv.close()
+
+
+def devmem_lease_bind_tx_unregister_check(nf) -> None:
+    """Verify leased TX devmem bindings detach cleanly on virt/phys unregister."""
+    for remove_virt_first in (False, True):
+        dmabuf_fd = _create_udmabuf()
+        defer(os.close, dmabuf_fd)
+        nf_priv = NetdevFamily()
+        defer(nf_priv.close)
+        nsimdev = NetdevSimDev(queue_count=2)
+        defer(nsimdev.remove)
+        nsim = nsimdev.nsims[0]
+
+        ip(f"link set dev {nsim.ifname} up")
+
+        nk_ifname, nk_ifindex = _create_netkit_single(rxqueues=2)
+        ip(f"link set dev {nk_ifname} up")
+
+        _queue_lease(nf, nk_ifindex, nsim.ifindex)
+
+        _devmem_bind(nf_priv.bind_tx, {
+            "ifindex": nk_ifindex,
+            "fd": dmabuf_fd,
+        }, phys_attrs={
+            "ifindex": nsim.ifindex,
+            "fd": dmabuf_fd,
+        })
+        ksft_ge(_dmabuf_attach_count(dmabuf_fd), 1)
+
+        if remove_virt_first:
+            ip(f"link del dev {nk_ifname}")
+            ksft_ge(_dmabuf_attach_count(dmabuf_fd), 1)
+            nsimdev.remove()
+        else:
+            nsimdev.remove()
+            ksft_ne(cmd(f"ip link show dev {nk_ifname}", fail=False).ret, 0)
+            cmd(f"ip link del dev {nk_ifname}", fail=False)
+        ksft_eq(_dmabuf_attach_count(dmabuf_fd), 0)
+
+        nf_priv.close()
+
+
 def main() -> None:
     """ Ksft boiler plate main """
     nf = NetdevFamily()
@@ -498,7 +647,9 @@ def main() -> None:
               page_pool_ifindex_leak_check,
               page_pool_stats_ifindex_check,
               devmem_bind_rx_unregister_check,
-              devmem_bind_tx_unregister_check
+              devmem_bind_tx_unregister_check,
+              devmem_lease_bind_rx_unregister_check,
+              devmem_lease_bind_tx_unregister_check
               ],
              args=(nf, ))
     ksft_exit()
-- 
2.56.1.750.gf70dc682cf-goog

