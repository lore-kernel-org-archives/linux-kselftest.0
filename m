Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794709576;
	b=APOJkQvPmoj/NqVGnrOtNebv9x3YteB99fIuJqpcqqZTKYAG7sfEZt3kCPMNWwT5V/2p
	 82kflfVH/u7zWOaQa5tIUoR+7jla2egQpFnnjOZnfrRpvzrKqjlmqejElJVDUMlUx6H/x
	 HLFDfjIkm03MFNwutCSx9QCJZE0TkHJ/uBLF7uq1k3qBut+E/IbL+dCBpI7wKBe5+cyhm
	 twoH2MaV1MPPZt0An5hSNjyv6kArgAnBo+xCTsBcLxCeHnYqHB73ZmO+4+wOTCtDRm8m0
	 hn54XrCT23h2554JtBUkQFY/xutFgo/pmkWpG3Vc97fycHVUm1uJh0hU7L5nQnyvB/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794709576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=PtHeqDpn0F+FD4D08P2fvOlL4SuwQcvcficGZrgtsYM=;
	b=ults4yxCihgRpS4/VVteDjRuU+gaLjICZmg7CxddOjrQfj1q5xALyitE9+XCAyUFA2eW
	 YMrdiN3UEbs+mq3j7rvIubKspkh6M6h/VNkT1SHP1MUU1vS/+7RDFjPjKtB9p78G10KEa
	 pcT1JgBUUzjEX/h8g63Xi63UPlZdUPjP9FPw9yN7Sr3EqaG5P2WbNLHmyWnfnPskqzwrt
	 UZG1Iw1aTP22m/cCosX85jGlfBNVQbaFXqDZq01G7e8XmtXIFQEV9PfU/YA7boKCZnib8
	 sIIMBUqZIVn7tEbDfe7uONPxvqrbVrXz3FjGZficbZ6CuQTsnPL7Nq4CgLnx2mF0DWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RWIuLnAm;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5340F606A8AC
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 02:26:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5340F606A8AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RWIuLnAm
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36f479b9819so477756eec.1
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 18:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794709576; x=1795314376; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PtHeqDpn0F+FD4D08P2fvOlL4SuwQcvcficGZrgtsYM=;
        b=RWIuLnAmyxQGxVWkdrGCJ/0/6Q60rFIC+A5rzmBrXqbBUQOTDFoCmWY15oxMiawi36
         8dL3srAMlkK3y5x8anTOgJRF6AXwbd5+H1IpbjnxLUpiWepOvfr6qUG2LEQKMH8x4MJ0
         Kvn2DF4BwqAy7JvfnulXXzq0kFKGeePxYQFzKqPJkS0xWFsqhl9m7Ulo355lX83z7QQ2
         nwpSZoqpFkl3i9Re2r/WZmZbW21iBDYAZ/FBUragQT1NxGh43eJBOkmtcnkC9/yvFzW/
         mAT7DNFbPSV8DhiC67vw6JPAXagYOMs7MSZ1lsTBIo8ZjEBhfti6tktzr13f0smQjUHk
         KG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794709576; x=1795314376;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PtHeqDpn0F+FD4D08P2fvOlL4SuwQcvcficGZrgtsYM=;
        b=LKrTOxaYD+VkTSbfzglOG3+7ovyM5E6lTAU3mzXjbqJp9RG/D38ep6hzwTkFEgPInI
         DEto0JbqAfZAaEzX8YeGkbPvlWvENEnIohD71UIVmn+6Eg07Gnf6HMpjFMYL72LA3ing
         j7UpN1vtacvCEoRb9OzcH+y4LrBhan3YBOCUoaoIdK1hO/v4+x5IIFrMl2mogruYkq5V
         U8Dk7zzQ7fIJBzozvxYHupd6kFd9iTgaRmwLIRnW1asEi915aRmCIb3e7YD8bhTxKPaN
         0EZETxexidkDwLjoRWstt2Qkvk2jT8uE6lSuslaxZBeCLRluBx6hzZ7gdjTrNf7geKWZ
         lOEQ==
X-Forwarded-Encrypted: i=1; AL+hErHVGTC4IW93ODef2rIeIJlaAL1JNtKRgKMLOaoFrWx7cU5JBXI1DlLX5nrDPFQ5oIT0zs0svMe/oPSyvkGg3Gs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Vo0AkVz0/OnNDaR7JPo2qRwD5Ygp+WWPw+Z8ijzja42dHvfxz
	QkfxJe53hsUyEhGBHzeWCUBAyPndJOEpApMnnOQFs6i/UugY18Ih6CdXCwr7uDu48LOSlsuGDXq
	sp5FJZ+Fjzu+gSkIK7Qt+ZIy8eA==
X-Received: from dyab25.prod.google.com ([2002:a05:693c:8319:b0:372:7af9:c0a7])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:cca2:b0:36e:371:8255 with SMTP id 5a478bee46e88-379603825bemr6161512eec.0.1794709575230;
 Sat, 14 Nov 2026 18:26:15 -0800 (PST)
Date: Sun, 15 Nov 2026 02:26:07 +0000
In-Reply-To: <20261115022607.348112-1-almasrymina@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261115022607.348112-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261115022607.348112-7-almasrymina@google.com>
Subject: [PATCH net-next v3 6/6] selftests: net: add leased devmem RX and TX
 netdev unregister tests
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Weiming Shi <bestswngs@gmail.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
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
2.56.0.611.g1030f0b940-goog

