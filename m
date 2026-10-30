Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349350;
	b=Y0Fihrn3rmgBkTBlaZIcJ4ImXEUP/iLzZJl/0Qunk7G1jLcFjM9Ubkss4WRxJYz2gzb/
	 er54P7ciG12uwFd0lfx9KIntUbh/u5tUfTPf7UwNj3Dh5w6zSNHeF6aYqo9FvNEgdg2Nf
	 hUYoRG6fzYw1sf+oqA+LIQPuUqN8d9x2xeUZmPBcgMsHh8BrtfPSEP4CbJluEWdV+dD6N
	 xUCDb30tWQzByNLbtCI9nFGP2Pew5M3pM+Rmca+A+eO7c/pLsIDI8n3lgggaEOWPaQsoG
	 IdZVUM1H2UE2VsVrfFMYj5Bn0LTLvwVChJ4v3fdPsXntCFDipWRYdC12Ow2qhHCmeJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=m0sDspwW9famWxd+HN3UrvDuJp+BbUhgcFyf3tAv+Sc=;
	b=ZUGfR1VA688JhXWR+mymQe1Lx6JfqPZ+uiSnswypFjInRYKcxFs/mZ1JbiRHBzajFKLC
	 8VeEF/hU1rZj9ZyNQNMN0OJ0OnpzJs7hTLc8b1yN78aARdqV3NPqZQFF6PwGOXt1NYgBa
	 mSucSjhfd+xby/gr+c3w/wxlgaxQ+JngSphyBAf5rAUmm9P+8T16DGdV2OtzX3OKYM6oQ
	 j3T6X0Dlw+7uwTktHqMEmvvVWst7jtF6es+z918LWuPl44QdQDkxlym1alejVwi/gLyd+
	 uq49cW+yn6EqKwim/I5/uNEsefW4Web6xO7DMz16eyP8JxHcDbcyent1W58Fehc7x8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lGZ673nF;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A1860A381B
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 08:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88A1860A381B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lGZ673nF
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-359b81ad4e8so760099eec.0
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 01:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793349345; x=1793954145; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m0sDspwW9famWxd+HN3UrvDuJp+BbUhgcFyf3tAv+Sc=;
        b=lGZ673nF2H/b1E27jZ4a9hERtvOODWCeNAJ/60x70fbZ0TltYXTvjyZ3lkZwRhHUFa
         rkrB2uS/l72voiAj0zIMKBM1Fawb63yTB5qg1BXTb24erHVvNpIUkEPy8B4Ih86OJgdW
         m0RUhc0GDvx0FhtWhp4M+DVtsGQjrMSJ6K7S1MRrxo96rCxeXzDFy2uWzjhuMXsNXma+
         1JuZt5OlP9OSpZZa5Axlcmz64f2M9LWpJNnoKzINKBTtT4SYmvkCdMSZfq1/SaVynmvz
         6PXQwX14Fg02It266DLJzOiXJhHY5HTWwSPtl3Jjtn9H6dZHYPLqaKYPTi84Ox/UGI1q
         CQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793349345; x=1793954145;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m0sDspwW9famWxd+HN3UrvDuJp+BbUhgcFyf3tAv+Sc=;
        b=RUMgx8jr8BABnJpJYJkl+RWCMryMJ9NQhD11jOpn9ZImchT3147KyeIOSkDaCqdW1n
         Kjh/3C7nAI1t/bx599LG2rIFOM067b/y5BOGRMrtH34UMQ1b/+BYQFf1NvrEiiPRuL4x
         DhfViD++VHbsWmgCtvoIjr/pRZ+FBLJzgIv2jvJ95UPJoD0BLADZLMY38tN/5+xwRYmm
         VjO+biWvWrC7XcZQ1QEgMo9E/xjPmTecY9Wg1JCpRtyJJykbXVTJqqbWQx8jZ+lJSWGH
         NnsCImDh1cqQUY2xXAqZiSj2epjGsW8BjhuymV5lWyjJ+GnjsR4C1e13ft4B+RLzZlwz
         RA/w==
X-Forwarded-Encrypted: i=1; AKwUvBzjmftaOGBFhe4OycG+Wtl6qSWoPyugF1P/MZKNLeuFzm6ZNBKni96fIJnwugR+TKjpxOIlXXKlIDpwCQWgMyM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbXcsonQUVxdRezsx0jxrFLg9dNjzp4lS35qHUoNg+BKEqEWqc
	trhxeQzuo8VyFKbYAweHIGx2NcVGThBO0QwsJaA3qH5vP6n/NY7ZmEmEKdSymcFfH060D3Ew0ky
	fTdczJe7n+d7QrzZdAm0IijQMDg==
X-Received: from dycnr19-n1.prod.google.com ([2002:a05:7300:e9d3:10b0:36a:60f:3e5d])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:f285:b0:367:50ee:f7e0 with SMTP id 5a478bee46e88-36a4244116fmr2463232eec.39.1793349344278;
 Fri, 30 Oct 2026 01:35:44 -0700 (PDT)
Date: Fri, 30 Oct 2026 08:35:38 +0000
In-Reply-To: <20261030083539.777877-1-almasrymina@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030083539.777877-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261030083539.777877-5-almasrymina@google.com>
Subject: [PATCH net v5 4/4] selftests: net: add devmem RX and TX netdev
 unregister tests
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Paolo Abeni <pabeni@redhat.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Mina Almasry <almasrymina@google.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, Pavel Begunkov <asml.silence@gmail.com>, 
	David Wei <dw@davidwei.uk>, Taehee Yoo <ap420073@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Philipp Stanner <phasta@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Stanislav Fomichev <sdf.kernel@gmail.com>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Tariq Toukan <tariqt@nvidia.com>, Kaifeng Wang <kaifengw@google.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

Add devmem_bind_rx_unregister_check and devmem_bind_tx_unregister_check
to nl_netdev.py to verify that unregistering a netdevsim device while a
netlink socket holds an active RX or TX devmem binding synchronously
detaches the dma_buf attachment and cleanly closes the netlink socket
without use-after-free or page faults.

Add the dma-buf, udmabuf and devmem options the tests need to
tools/testing/selftests/net/config.

Cc: Tariq Toukan <tariqt@nvidia.com>
Cc: Kaifeng Wang <kaifengw@google.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>
Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
Acked-by: Stanislav Fomichev <sdf@fomichev.me>
---
v5:
- Tolerate non-UTF-8 dma-buf names when parsing debugfs bufinfo (Sashiko).

v3:
- Count attachments of the test's own dma-buf only, and skip instead of
  passing when debugfs bufinfo is not readable (Sashiko).
- Close the netlink socket after removing the device, clean up with
  defer(), and skip on EOPNOTSUPP from bind-rx/bind-tx (Sashiko).
- Replace the hardcoded UDMABUF_CREATE value with a helper that computes
  it for the running architecture (Sashiko, Dragos), and close the memfd
  and /dev/udmabuf fds on errors (Sashiko).
- Add the needed options to tools/testing/selftests/net/config (Sashiko).
---
 tools/testing/selftests/net/config       |   4 +
 tools/testing/selftests/net/nl_netdev.py | 125 ++++++++++++++++++++++-
 2 files changed, 126 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/net/config b/tools/testing/selftests/net/config
index d4416f8bdcfd1..7a89e2618d4c4 100644
--- a/tools/testing/selftests/net/config
+++ b/tools/testing/selftests/net/config
@@ -12,6 +12,7 @@ CONFIG_CRYPTO_ARIA=y
 CONFIG_CRYPTO_CHACHA20POLY1305=m
 CONFIG_CRYPTO_SHA1=y
 CONFIG_CRYPTO_SM4_GENERIC=y
+CONFIG_DEBUG_FS=y
 CONFIG_DEBUG_INFO_BTF=y
 CONFIG_DEBUG_INFO_BTF_MODULES=n
 CONFIG_DUMMY=y
@@ -79,6 +80,7 @@ CONFIG_NET_CLS_BPF=m
 CONFIG_NET_CLS_FLOWER=m
 CONFIG_NET_CLS_MATCHALL=m
 CONFIG_NET_CLS_U32=m
+CONFIG_NET_DEVMEM=y
 CONFIG_NETDEVSIM=m
 CONFIG_NET_DROP_MONITOR=m
 CONFIG_NETFILTER=y
@@ -123,6 +125,7 @@ CONFIG_OPENVSWITCH=m
 CONFIG_PAGE_POOL_STATS=y
 CONFIG_PSAMPLE=m
 CONFIG_RPS=y
+CONFIG_SYNC_FILE=y
 CONFIG_SYN_COOKIES=y
 CONFIG_SYSCTL=y
 CONFIG_SYSFS=y
@@ -133,6 +136,7 @@ CONFIG_TEST_BLACKHOLE_DEV=m
 CONFIG_TLS=m
 CONFIG_TRACEPOINTS=y
 CONFIG_TUN=y
+CONFIG_UDMABUF=y
 CONFIG_USER_NS=y
 CONFIG_VETH=y
 CONFIG_VLAN_8021Q=y
diff --git a/tools/testing/selftests/net/nl_netdev.py b/tools/testing/selftests/net/nl_netdev.py
index ceb44c8e1fec5..dd0321c0b463a 100755
--- a/tools/testing/selftests/net/nl_netdev.py
+++ b/tools/testing/selftests/net/nl_netdev.py
@@ -6,10 +6,14 @@ Tests for the netdev netlink family.
 """
 
 import errno
+import fcntl
+import mmap
+import os
+import struct
 from os import system
-from lib.py import ksft_run, ksft_exit
+from lib.py import ksft_run, ksft_exit, KsftFailEx, KsftSkipEx
 from lib.py import ksft_eq, ksft_ge, ksft_ne, ksft_raises, ksft_busy_wait
-from lib.py import NetdevFamily, NetdevSimDev, NlError, defer, ip
+from lib.py import EthtoolFamily, NetdevFamily, NetdevSimDev, NlError, defer, ip
 
 
 def empty_check(nf) -> None:
@@ -366,6 +370,119 @@ def page_pool_stats_ifindex_check(nf) -> None:
     ksft_eq(cm.exception.nl_msg.extack['bad-attr'], '.info.id')
 
 
+def _udmabuf_create_ioctl() -> int:
+    """Return UDMABUF_CREATE, _IOW('u', 0x42, struct udmabuf_create)."""
+    machine = os.uname().machine
+    if machine.startswith(("alpha", "mips", "ppc", "powerpc", "sparc")):
+        ioc_write = 4 << 29
+    elif machine.startswith("parisc"):
+        ioc_write = 2 << 30
+    else:
+        ioc_write = 1 << 30
+    return ioc_write | 24 << 16 | ord("u") << 8 | 0x42
+
+
+def _create_udmabuf(num_pages=64) -> int:
+    """Create a sealed memfd-backed udmabuf fd for devmem tests."""
+    if not os.path.exists("/dev/udmabuf"):
+        raise KsftSkipEx("/dev/udmabuf is not available")
+
+    size = num_pages * mmap.PAGESIZE
+    memfd = os.memfd_create("devmem-ksft", os.MFD_ALLOW_SEALING)
+    try:
+        os.ftruncate(memfd, size)
+        fcntl.fcntl(memfd, fcntl.F_ADD_SEALS, fcntl.F_SEAL_SHRINK)
+        devfd = os.open("/dev/udmabuf", os.O_RDWR)
+        try:
+            req = bytearray(struct.pack("IIQQ", memfd, 0, 0, size))
+            return fcntl.ioctl(devfd, _udmabuf_create_ioctl(), req)
+        finally:
+            os.close(devfd)
+    finally:
+        os.close(memfd)
+
+
+def _dmabuf_attach_count(dmabuf_fd) -> int:
+    """Return the number of devices attached to dmabuf_fd, from debugfs."""
+    path = "/sys/kernel/debug/dma_buf/bufinfo"
+    try:
+        with open(path, "r", encoding="utf-8", errors="replace") as f:
+            lines = f.read().splitlines()
+    except OSError as e:
+        raise KsftSkipEx(f"{path} is not readable: {e}") from e
+
+    ino = os.fstat(dmabuf_fd).st_ino
+    found = False
+    for line in lines:
+        fields = line.split("\t", 6)
+        if not found:
+            found = (len(fields) == 7 and fields[5].isdigit() and
+                     int(fields[5]) == ino)
+        elif line.startswith("Total "):
+            return int(line.split()[1])
+    raise KsftFailEx(f"dma-buf {ino} not found in {path}")
+
+
+def _devmem_bind(bind, attrs) -> None:
+    """Run a devmem bind op, skip the test if the device can't do devmem."""
+    try:
+        bind(attrs)
+    except NlError as e:
+        if e.error == errno.EOPNOTSUPP:
+            raise KsftSkipEx(f"devmem binding not supported: {e}") from e
+        raise
+
+
+def devmem_bind_rx_unregister_check(_nf) -> None:
+    """Verify RX devmem bindings detach dma_buf synchronously on netdev unregister."""
+    dmabuf_fd = _create_udmabuf()
+    defer(os.close, dmabuf_fd)
+    nf_priv = NetdevFamily()
+    defer(nf_priv.close)
+    nsimdev = NetdevSimDev(queue_count=2)
+    defer(nsimdev.remove)
+    nsim = nsimdev.nsims[0]
+
+    ip(f"link set dev {nsim.ifname} up")
+    with EthtoolFamily() as ef:
+        ef.rings_set({"header": {"dev-index": nsim.ifindex},
+                      "tcp-data-split": "enabled"})
+    _devmem_bind(nf_priv.bind_rx, {
+        "ifindex": nsim.ifindex,
+        "fd": dmabuf_fd,
+        "queues": [{"id": 1, "type": "rx"}],
+    })
+    ksft_ge(_dmabuf_attach_count(dmabuf_fd), 1)
+
+    nsimdev.remove()
+    ksft_eq(_dmabuf_attach_count(dmabuf_fd), 0)
+
+    nf_priv.close()
+
+
+def devmem_bind_tx_unregister_check(_nf) -> None:
+    """Verify TX devmem bindings detach cleanly on netdev unregister without UAF."""
+    dmabuf_fd = _create_udmabuf()
+    defer(os.close, dmabuf_fd)
+    nf_priv = NetdevFamily()
+    defer(nf_priv.close)
+    nsimdev = NetdevSimDev(queue_count=2)
+    defer(nsimdev.remove)
+    nsim = nsimdev.nsims[0]
+
+    ip(f"link set dev {nsim.ifname} up")
+    _devmem_bind(nf_priv.bind_tx, {
+        "ifindex": nsim.ifindex,
+        "fd": dmabuf_fd,
+    })
+    ksft_ge(_dmabuf_attach_count(dmabuf_fd), 1)
+
+    nsimdev.remove()
+    ksft_eq(_dmabuf_attach_count(dmabuf_fd), 0)
+
+    nf_priv.close()
+
+
 def main() -> None:
     """ Ksft boiler plate main """
     nf = NetdevFamily()
@@ -379,7 +496,9 @@ def main() -> None:
               page_pool_check,
               page_pool_dump_ifindex,
               page_pool_ifindex_leak_check,
-              page_pool_stats_ifindex_check
+              page_pool_stats_ifindex_check,
+              devmem_bind_rx_unregister_check,
+              devmem_bind_tx_unregister_check
               ],
              args=(nf, ))
     ksft_exit()
-- 
2.56.0.385.gac671c819a-goog

