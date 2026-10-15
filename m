Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01A345C6FD
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 16:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792082380; cv=none; b=GVFlF85MuiI6fSNvY88u+NHdz22V0L8B4glo89YAaFA8VdNF6k2AEzy6RCybiHn7UyT1cWT6wHbu4ZKrKA4OP1FjukuW/J23+I+ITLcXqIbC4VhbbKfwmSKQOPv4kgZSbqdfb1C3ALFEL1ExQZM7PPN9SMHSYeIpKAE8ufZJeXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792082380; c=relaxed/simple;
	bh=7+ZuMQGm1WqmYa/SemsnkHIbC/OIMDMcJFeU+26oqOg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TEmrisDk7AAbxekZElexi7hR0zVPmPTrqO0GBL4QortnKKcaNOAsfGO63TArBg1egnQksxpGw/6fQHjCa8/eERFova1pHKOwn0mZ5YzJxFhPjIPA9PgRYUgVnCiTwEi5/mUTx1gv3f7mO2FCNXhU/qWmQw9XM2aUsfOHV9CLEDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v/3NrS3t; arc=none smtp.client-ip=74.125.82.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v/3NrS3t"
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1663fb7e005so6962507c88.0
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 09:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792082362; x=1792687162; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wON/Y5KE9qpxqraW/pAdp0YZ1NlG3ckfd93a0Oe+XQc=;
        b=v/3NrS3tAXlYq5GGohccUKrdWvYYYa5ZPCL3pwov1dZr3Sn46aASVdM/LkM8erPWcP
         xyUKgdaSj7Cnfb20/ihUatWKcAnX4ajUr4rl2D1DghOzwNiRl3Vuitp6oZbDaT2Zhmkv
         MRRR2LxKloftFxrDulx7MPNWPG/g7FHXuY2nZhJNF68ulo51AUBI56FntfJGBXQin1hJ
         FunBwnWWw17cLauAXiD86BGF79dN2uE4vLidEyJcrvTUnUm5NRGLEcALoE1ac1q+HuR/
         +4aHdcge51bpIo9KAaqwIPMxLXJC/BZdtxoq/nCFsCBZQZ/5lM4jQx6AjPr1qlOaRSxP
         he/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792082362; x=1792687162;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wON/Y5KE9qpxqraW/pAdp0YZ1NlG3ckfd93a0Oe+XQc=;
        b=OKVKxzQ39tg6gQkhkjDBWbDb/EyHYWL/auZtzXvz4M0G6Il3/PaHeSmXGfBt83ZqbM
         WFu4KnFcaInTW8htvN/6gmpwD5ghTQJntTKrY5+XE8I3F1CgrK8EsgwLO1RynRC8S5lj
         iKixzi5uo2lcNrbLZVkIhFGaJAqYwtvzHKALzjKVaFQL64a+on748lUFQFGW8n2m7ROE
         sa5R5Aefbcv2mYnvKmUTT+WVa6GO0LtQa2Mwyoe7gaaRS61c5mnJLr4jWeUQqPka7YQy
         hib9SUfJFK+YMqYoPv4OjoaJNms+jlWzHFfaYYoK9EBixVtQUDllusu3Ow1dUUazn0b7
         kF1w==
X-Forwarded-Encrypted: i=1; AKwUvBy3CkqbvSXdITjp3fs+1RMs/0m/IQTruzugXBUlohb3ioWKN+NvribC20dxvdEALiix04m9ZMcZK5ZYGDYG4j8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuWCJ1Njcnjp8likz6o3QocOmirE2wTT550+4TEIHqwyzIVC9D
	wxXLyUJX0LXidRGFNlpuCi2rY3E2puHUOyTJvNnkWivR7Y+VE037kqYYFz8On2hGUI7VJqvz2W1
	zIR1NS7qMGXJsHihDUb6Oz9EOzw==
X-Received: from dldyq4-n2.prod.google.com ([2002:a05:701b:4544:20b0:15f:4035:64c7])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7023:c00a:b0:149:1feb:6da4 with SMTP id a92af1059eb24-18111a09757mr2320444c88.32.1792082361807;
 Thu, 15 Oct 2026 09:39:21 -0700 (PDT)
Date: Thu, 15 Oct 2026 16:39:15 +0000
In-Reply-To: <20261015163915.1166043-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261015163915.1166043-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261015163915.1166043-5-almasrymina@google.com>
Subject: [PATCH net v4 4/4] selftests: net: add devmem RX and TX netdev
 unregister tests
From: Mina Almasry <almasrymina@google.com>
To: Jakub Kicinski <kuba@kernel.org>, Mina Almasry <almasrymina@google.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf@fomichev.me>, Taehee Yoo <ap420073@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Dragos Tatulea <dtatulea@nvidia.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Tariq Toukan <tariqt@nvidia.com>, Kaifeng Wang <kaifengw@google.com>
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
Assisted-by: LLM
Signed-off-by: Mina Almasry <almasrymina@google.com>
Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
---
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
index 737e7e6327b37..1e21f0055a2c0 100644
--- a/tools/testing/selftests/net/config
+++ b/tools/testing/selftests/net/config
@@ -11,6 +11,7 @@ CONFIG_CRYPTO_ARIA=y
 CONFIG_CRYPTO_CHACHA20POLY1305=m
 CONFIG_CRYPTO_SHA1=y
 CONFIG_CRYPTO_SM4_GENERIC=y
+CONFIG_DEBUG_FS=y
 CONFIG_DEBUG_INFO_BTF=y
 CONFIG_DEBUG_INFO_BTF_MODULES=n
 CONFIG_DUMMY=y
@@ -76,6 +77,7 @@ CONFIG_NET_CLS_BPF=m
 CONFIG_NET_CLS_FLOWER=m
 CONFIG_NET_CLS_MATCHALL=m
 CONFIG_NET_CLS_U32=m
+CONFIG_NET_DEVMEM=y
 CONFIG_NETDEVSIM=m
 CONFIG_NET_DROP_MONITOR=m
 CONFIG_NETFILTER=y
@@ -120,6 +122,7 @@ CONFIG_OPENVSWITCH=m
 CONFIG_PAGE_POOL_STATS=y
 CONFIG_PSAMPLE=m
 CONFIG_RPS=y
+CONFIG_SYNC_FILE=y
 CONFIG_SYN_COOKIES=y
 CONFIG_SYSCTL=y
 CONFIG_SYSFS=y
@@ -131,6 +134,7 @@ CONFIG_TEST_BPF=m
 CONFIG_TLS=m
 CONFIG_TRACEPOINTS=y
 CONFIG_TUN=y
+CONFIG_UDMABUF=y
 CONFIG_USER_NS=y
 CONFIG_VETH=y
 CONFIG_VLAN_8021Q=y
diff --git a/tools/testing/selftests/net/nl_netdev.py b/tools/testing/selftests/net/nl_netdev.py
index ceb44c8e1fec5..988878b71358c 100755
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
+        with open(path, "r", encoding="utf-8") as f:
+            lines = f.read().splitlines()
+    except OSError as e:
+        raise KsftSkipEx(f"{path} is not readable: {e}") from e
+
+    ino = os.fstat(dmabuf_fd).st_ino
+    found = False
+    for line in lines:
+        fields = line.split("\t")
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
2.56.0.176.g3575e65682-goog

