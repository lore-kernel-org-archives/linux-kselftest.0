Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793748427;
	b=Pfu34/ItKMf4THiJ21SRpzNrCbDs8APCEuM3z10vfKatp0pkCWj5KXNe0fS9KIfJ33Ie
	 6/biVWRhvaZHWxaAklkOK7+jq0btCTI5FX2xdhK3JymsSKFw5EmiWBnjxOWZlpMwx0EDM
	 koUG+KXuMOzEPiHS9N2MQckIou0I9Mlm0ueOjL0iFskvN9r7B9xn+2z/htDhnKzFphr0m
	 W2hVOzqZPlcIx1ISp5IgGPmddp0Xyt/jVscg/NYkvfW5Hmb99EvaqYKkKNUiK51RwpgVi
	 8dU33Q8YyGlHKxR1P44ULuz8YPhMM1fT1Qy6iKLK+GCfuVV3/iIvWWKI2ITxW0LJftg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793748427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=jXhCU8aTCRcUFtzSj/0RSnPMzYxt/D+w9lGl53yy+rI=;
	b=BrfaxlNmSjK5icap88uvQC+3KbOgonFaVRiKIpkWeDk+PCWh/unftalGwzkdFP0EOv4T
	 r8QmiZOc4rySQUpYdyGMsH01m+SV/qfkBESt7eSUsPKtSEkvYmLsXInWPQFk3qGuFWlUi
	 Qvj+E/a1T4Tv2UdfEVc0QnJOfYoFYhCnOg2uGoYJONRx1KyqPDjB7kjTdG76I6hxq7CZg
	 IF+jLvkbMu2r3dpZvpqUqW38Ib+C1WyV0KbUVy9l25ggRQS1OpRo+jhNq2NE2PF0aUhEf
	 q4ZO96u1efic72rmmL66ztLRP9kJk83QpgK14JlWQ31qD/8qdleLtlE2yoILxJYJCYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HROsKG+G;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7FC606A332
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 23:27:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E7FC606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HROsKG+G
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so139074eec.1
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 15:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793748425; x=1794353225; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jXhCU8aTCRcUFtzSj/0RSnPMzYxt/D+w9lGl53yy+rI=;
        b=HROsKG+GVnqEnZ/Dn4knrVp5DGPAf0vKxZUQsAOuBUqvVTFec6gRpqMkLpPHcgedkF
         T8nVyu/8WnihyQDrozm1LCNslaIUBHna5Nuooi4JLkeyinjuoLTpwRtJop6LSAxu5jk6
         +QDI8QCdG2+WKGDrFA8tZE8utN7paHBKEfImmoAW4quAYCbdxQFk6GiIPodiD6MUylyA
         pmI5y/MVKzug8rhKtxMnLqn3PzqvCJY5KUFduYIF2n18pzVFmZ5km9CpbIHED+SyfU0z
         ghUBCFYpUyi+eKa5C/ndDSMQe1KGwN5Y9YnpfuXL1HA8c80gExmFL1aBt8epreztZ+/i
         rcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793748425; x=1794353225;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jXhCU8aTCRcUFtzSj/0RSnPMzYxt/D+w9lGl53yy+rI=;
        b=d/3NUEdb/jPd7QQzpLWTVdUkujvAAs1UD4hPGKF6qz0bOIgHwILqaftZjowwXZ9aj4
         mJbocpEey10Uhg8pDxq8/Htiyk+6PbP8d9zfCJk4QQnpR2Uyt6U3RHpunqOAdjkQsVS9
         2SxEDAqj2+c6BgraegpgkFDDuV6Be79SzHYP7ik6gVLM2tsQyLlkLoQAkas7ahojBVv8
         htQrRiuK1uXVoACNvAvqtRuKePb0e292Nbr4qkOONIUXZJz1otPzi9d0NknD/nF2yPHo
         VPHPl9dxQo/4V3zeUdK3fxMX4f04jhfocRfgy6twlg/FGk66xYFmD0py6kNCZWeee414
         zUZw==
X-Forwarded-Encrypted: i=1; AKwUvByxm2uyHJKiqJEAvlH/9YRZIs3P6taVKXba/fU0Iw4ZRVGV9yW6XzCNV5Y3KU9WLrPT55y16AfFuOBhk7j7yLs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TbWq/FJdJF6vcWa1kVH3NxiN0YE9kOoY+AR4lTT7XK3u2H33Y
	EVlWhTpievCaPY8yavQStU9dmxDXiiRYfvEkl05OtbesFfP3YDN0mhmKnlYyJq7t5Z+gP6uNMgg
	gZRpuhiQs6onmB/rg6ZO9BojvqQ==
X-Received: from dyaw26-n1.prod.google.com ([2002:a05:693c:415a:10b0:35c:eb2a:8c31])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:87ce:10b0:36a:1fa2:fbbe with SMTP id 5a478bee46e88-36a424658edmr22381343eec.41.1793748425129;
 Tue, 03 Nov 2026 15:27:05 -0800 (PST)
Date: Tue,  3 Nov 2026 23:26:59 +0000
In-Reply-To: <20261103232659.1340283-1-almasrymina@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103232659.1340283-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103232659.1340283-5-almasrymina@google.com>
Subject: [PATCH net-next v1 4/4] selftests: net: add leased devmem RX and TX
 netdev unregister tests
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	David Wei <dw@davidwei.uk>
Content-Type: text/plain; charset="UTF-8"

Add devmem_lease_bind_rx_unregister_check and
devmem_lease_bind_tx_unregister_check to nl_netdev.py to verify that
leased RX and TX devmem bindings on a netkit interface backed by a
netdevsim queue detach their dma-buf cleanly while the netlink socket
remains open, both when the virtual device (bind_dev) is unregistered
before the physical device (map_dev) and when the physical device is
unregistered directly (which uninstalls the physical queue memory
provider and cascades unregistration to the leasing netkit).

Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 tools/testing/selftests/net/nl_netdev.py | 132 ++++++++++++++++++++++-
 1 file changed, 129 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/net/nl_netdev.py b/tools/testing/selftests/net/nl_netdev.py
index dd0321c0b463a..fa4b5be093257 100755
--- a/tools/testing/selftests/net/nl_netdev.py
+++ b/tools/testing/selftests/net/nl_netdev.py
@@ -12,8 +12,9 @@ import os
 import struct
 from os import system
 from lib.py import ksft_run, ksft_exit, KsftFailEx, KsftSkipEx
-from lib.py import ksft_eq, ksft_ge, ksft_ne, ksft_raises, ksft_busy_wait
-from lib.py import EthtoolFamily, NetdevFamily, NetdevSimDev, NlError, defer, ip
+from lib.py import ksft_eq, ksft_ge, ksft_ne, ksft_not_in, ksft_raises, ksft_busy_wait
+from lib.py import EthtoolFamily, NetdevFamily, NetdevSimDev, Netlink
+from lib.py import NlError, RtnlFamily, cmd, defer, ip
 
 
 def empty_check(nf) -> None:
@@ -483,6 +484,129 @@ def devmem_bind_tx_unregister_check(_nf) -> None:
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
+        res = nf.queue_create({
+            "ifindex": nk_ifindex,
+            "type": "rx",
+            "lease": {
+                "ifindex": nsim.ifindex,
+                "queue": {"id": 1, "type": "rx"},
+            },
+        })
+
+        _devmem_bind(nf_priv.bind_rx, {
+            "ifindex": nk_ifindex,
+            "fd": dmabuf_fd,
+            "queues": [{"id": res["id"], "type": "rx"}],
+        })
+        ksft_ge(_dmabuf_attach_count(dmabuf_fd), 1)
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
+        nf.queue_create({
+            "ifindex": nk_ifindex,
+            "type": "rx",
+            "lease": {
+                "ifindex": nsim.ifindex,
+                "queue": {"id": 1, "type": "rx"},
+            },
+        })
+
+        _devmem_bind(nf_priv.bind_tx, {
+            "ifindex": nk_ifindex,
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
+        ksft_eq(_dmabuf_attach_count(dmabuf_fd), 0)
+
+        nf_priv.close()
+
+
 def main() -> None:
     """ Ksft boiler plate main """
     nf = NetdevFamily()
@@ -498,7 +622,9 @@ def main() -> None:
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
2.56.0.385.gac671c819a-goog

