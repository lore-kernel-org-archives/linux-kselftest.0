Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794709569;
	b=QyCS+CZOYGzXF8CSWSaW70kNWQcQLTDzK5yyGav/XuYQNbEspW5aQcltMpSatEHsTsMO
	 5HiQvxs6/hNUzt9dGzgx/K3Py8esSL2u/4+RMcfRhVTGTuAU9sCif786KI91HDDTzGZCE
	 72DWRq8GEbYCpPldCG7+7wc8AzeqYfahHZXHIpv/fCHSueWyyAtPXnqsk9l/56U3IEwiN
	 Ku8OHgumiWKNL8D9ajMLVeTYYNUqQXX4eZ/glUw9Q/fjer3FAlK74krDaPFAReq8CoRp0
	 Txc2uMGLPkkll9M8zUOvNGJAx4Ba9rwTdH39BJgKo7AnTaDwduOZN++h8Dezhc/GULQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794709569;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=2gE/Hbfi8pPeMmmTUakexK4mxqaVFBWDBadj/KmoNzw=;
	b=e6scysCmFxtJAC9Oz9eF5zZi2mkDr/z+ZZgvjLmIE+Xrd0L8xdq8t+bYEUSXtqsa1x4y
	 3EkczWV8F99Ym5q5+TXJ1GMRXFsEjcvsIj9is7WfW8sQ9Gp0guWbC3xog24PNxGdHm4uK
	 XpLsiz4nX4ib+sXRnQRzeVgA3k2aPz0znb5UDjbB77+g6N3MQ5bDU87XGpGlCigmcuAvv
	 zgApUNYF/GjN2uu/K/+Aokr7rv1irLa+ohcvMnxEs2DQMEyQS/Ds+k/svtisJoYSOKIUU
	 6rZDSUMdQWAaYdHWjexXl0IxG4fwQrIhE7yVtkOmXrBU4FpxZPYwHpFlrd90SVXv8PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bLswmWZC;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651BE606A323
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 02:26:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 651BE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bLswmWZC
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-378722fd4a3so2675279eec.0
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 18:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794709568; x=1795314368; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2gE/Hbfi8pPeMmmTUakexK4mxqaVFBWDBadj/KmoNzw=;
        b=bLswmWZCix3wzY0ceZoRrsWroupiuTdhBqNGCf7lYu77vcSuk9G+C1JP1zVktgBzX1
         vCMBis1AAAlI+mbyfLLdlPrUJntv3S89cMAYgemDQ1F3oV290zdOzu497aXYlKWPKzua
         +sO3ZxRZX8fv3kQ0SHdS4OqhqFFes/9Ky6G+V0Kay8Co+/WipjNUDVc1nx07HlsQE2gK
         hrz8ISmCyixHggrwzmdlRQzWBNJusjbUtBqAzikBCOP7r0opCguK2HVMt174zFAAyoFq
         BfvcC0IhSqsnfX89NlAg5UOAmU+POhTu+S/AB6ApualvlRCqTHVoLllCR5LDyAZOKV7g
         8p8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794709568; x=1795314368;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2gE/Hbfi8pPeMmmTUakexK4mxqaVFBWDBadj/KmoNzw=;
        b=Beow+vrSJIwfKAeE7JA9UUAOf1rAAiEs0nNj25VzCDAyfor+qZPh7FUvWEJalVbq+/
         M+Ru+7OXeTtaAThlRqzvLKnIQTstF4yUpSwPZR1OLBco1M4CW3mTjvj48OE6MXvfcmQ+
         euzD2PcjDGVgXn49qYDwjJGwi+1/zpDkuua77qig/DBcVMcSH3SIViVBa73I5dwBf0FU
         M3GS+A0nrYiLXsiSIvqvQHzfWGhyG5lmudwJirRtPv4EFG9EGAFyygzEWdOuZ74Xovcu
         67X12ZdSurYoSybg2AaVSnouC51uTGKmgGfcGvCEs0yauIvXogJLzcWVfkt/WdhhBydR
         ZByQ==
X-Forwarded-Encrypted: i=1; AL+hErELRj150bO0OzSKNn3Q9BCtaDK5hWo7jnvrguxEFRRTFmVCO0lmewlNfV8IxHs3yfPOqITjhMk/Wpqwbvr5N0Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qdCVdKwEJx+C/blz/VWl6PcYoj3O6VhTTylt7RbjdcuC48HZw
	/kRV36ezjalwUDclzuwbQOuqTR5Iu3sQE/mxEbiJwTALPoKZHMoUi062bUvjBi0oYgfBoxUKCxC
	Lwpmcg16JaP1FP4uGpxSSSGptEQ==
X-Received: from dyah18-n1.prod.google.com ([2002:a05:693c:83d2:10b0:37a:8a0f:3aba])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:414d:20b0:36c:d1fe:84ce with SMTP id 5a478bee46e88-3796740e475mr7608941eec.33.1794709568218;
 Sat, 14 Nov 2026 18:26:08 -0800 (PST)
Date: Sun, 15 Nov 2026 02:26:01 +0000
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261115022607.348112-1-almasrymina@google.com>
Subject: [PATCH net-next v3 0/6] net: devmem: support leased RX and TX queues
 on netdev unregister
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

Support leased RX and TX devmem bindings when either the virtual device
(e.g. netkit) or the physical backing net_device is unregistered:

1. Pass struct net_device **dev_ptr to net_devmem_lock_dev() so callers
   can lock either binding->map_dev or binding->bind_dev.
2. Rename binding->dev and binding->vdev to binding->map_dev (physical
   DMA device) and binding->bind_dev (device passed to bind-rx/bind-tx).
3. Introduce netif_lease_valid() and guard netif_mp_open_rxq(),
   netif_mp_close_rxq(), and netif_rxq_cleanup_unlease() against an
   unregistering physical device reached through a queue lease.
4. Always populate bind_dev on RX and TX bindings and handle teardown
   and netdev unregistration of both bind_dev and map_dev.
5. Resolve the physical backing map_dev in netdev_nl_get_dma_dev() for
   leased RX bindings, lock map_dev around net_devmem_bind_dmabuf() on
   bind-rx when map_dev differs from netdev, assert both devices are
   locked, and check netif_lease_valid(map_dev).
6. Add kselftests in nl_netdev.py covering leased RX and TX devmem
   bindings across both virtual-first and physical-first netdev
   unregistration orders.

v3:
- Rebase onto latest net-next/main.
- Add netif_lease_valid() helper and keep lease validity checks in the
  lease-aware callers (netif_mp_open_rxq(), netif_mp_close_rxq(),
  netif_rxq_cleanup_unlease(), and net_devmem_bind_dmabuf()) rather than
  inside __netif_mp_open_rxq() / __netif_mp_close_rxq(), and document why
  mp_params is cleared directly when !netif_lease_valid(dev) (Stanislav,
  Sashiko).
- Guard the bound_rxqs loop in net_devmem_unbind_dmabuf() with
  if (binding->bind_dev), keep the !netif_is_queue_leasee(dev) guard in
  net_devmem_dev_unregister() in patch 4/6 until patch 5/6 resolves
  binding->map_dev to the physical device so the series is bisectable at
  every commit, and document the use-after-free in dma_unmap_sg_attrs() on
  physical netdev teardown in patch 5/6 (Sashiko).
- In nl_netdev.py, verify dmabuf and lease on the physical queue after
  binding, skip when queue_create returns EOPNOTSUPP, probe the physical
  device on EOPNOTSUPP so a broken lease lookup is not masked as SKIP, and
  clean up nk_ifname between loop iterations (Sashiko).
- v2: https://lore.kernel.org/netdev/20261108055809.2122934-1-almasrymina@google.com/

v2:
- Split patch 3/4 from v1 into 3 smaller commits (patches 3/6..5/6).
- Clear rxq->mp_params and return 0 in __netif_mp_close_rxq() whenever
  dev is already unregistering, avoiding queue reconfiguration on an
  already-shut-down map_dev during cascaded lease teardown (Sashiko).
- Drop unnecessary xa_erase() in net_devmem_unbind_dmabuf() and use a
  local map_dev variable in net_devmem_get_binding() (Stanislav).
- Restore ASSERT_EXCLUSIVE_WRITER(binding->bind_dev) in
  mp_dmabuf_devmem_uninstall(), drop redundant bind_dev->reg_state check
  in net_devmem_bind_dmabuf(), and expand commit message rationale
  (Dragos, Stanislav).
- v1: https://lore.kernel.org/netdev/20261103232659.1340283-1-almasrymina@google.com/

Mina Almasry (6):
  net: devmem: pass net_device pointer to net_devmem_lock_dev()
  net: devmem: rename binding dev and vdev to map_dev and bind_dev
  net: guard memory provider RX queue open and close on unregister
  net: devmem: always populate bind_dev and detach both devices on
    unregister
  net: devmem: resolve physical map_dev for leased RX bindings
  selftests: net: add leased devmem RX and TX netdev unregister tests

 net/core/dev.c                           |   2 +-
 net/core/dev.h                           |   7 +
 net/core/devmem.c                        | 123 ++++++++++--------
 net/core/devmem.h                        |  25 ++--
 net/core/netdev-genl.c                   |  58 +++++----
 net/core/netdev_rx_queue.c               |  31 ++++-
 tools/testing/selftests/net/nl_netdev.py | 159 ++++++++++++++++++++++-
 7 files changed, 304 insertions(+), 101 deletions(-)


base-commit: 6964ff21c5d8b75649211a52dbfd92753e605649
-- 
2.56.0.611.g1030f0b940-goog

