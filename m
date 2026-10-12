Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B844BF956
	for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 17:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791826986; cv=none; b=E6wfZiPAtM/xGni8N4NWwxemL3zVlFAWyqejetxGvMZi9vAEL7yPt71dJQe+7hMdf49/b9sChmC96ApTFjg9yqvASoVz6aQ+mHMDSeJOdnIBGZIaIDz9dIuiKDzE+lN31STzwxwExnQvhnZthBN7ZKYgmkw9j7Q1HoTFWeGF8j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791826986; c=relaxed/simple;
	bh=w09JRa+8f6pKEl30DKJQ5yMAIvWJUIEbrFF0HQcgelU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=e1yScp5DuMlIlrAeYBfqSrkc1v9N9d4IAIvnR/yuKm+qiyS4qD/h0QAijJIFJjfbdGFK+sQUE3FEa8ZihusVQSc61CU99jIDZAtAt4Pzs3rHnhk7cpKkei5b5haZCRQs9YydLllYvPugcZ0qN9D3k9L7Lyv+sbqnmpU3g+sovWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S1tBKpJZ; arc=none smtp.client-ip=74.125.82.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S1tBKpJZ"
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-357e2bc3b1bso3769831eec.0
        for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 10:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791826984; x=1792431784; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3iJ1fd8MwlejaVJSs6HGpqE749ZNI8lIjAO4rDvQDfA=;
        b=S1tBKpJZr1sPP7TTsVyb7vPFN9irDROHI8VY4dGfBMdrDkI13ajaqpywDiVMCojI5g
         a2zkzWT/J11D7UoUGY70CZ2QL+UC6XttvWWd+12ubnQ5it7nHHNi835t99h+2Bv60uCW
         PijLs/XZhWHmjeG55ASwpS5S1sfhy8/WfT3P7gm9Jlos0aMooA2u3xP7uXXrYfx2BBpw
         HyQLBosSyD4OwxUvZHAWqpoB8OyQTNeSGDPNYd6Ddj/9uGG9E0BYJH6m22JUpk+9iGiM
         NRRg4vbPJy7G0YI9E4VldTHbht7SWLayh0ytclnZOhvlzmbDFR0IyVzkSdcEs+DT1YsL
         U7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791826984; x=1792431784;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3iJ1fd8MwlejaVJSs6HGpqE749ZNI8lIjAO4rDvQDfA=;
        b=q4jPBDSP/cKFWMX+pGFWzbPTPLg1TWAuZtFJ3mifWMUg/UHhI7/YC/d9mg65qdYUwk
         GX4pPpBVqKJMivoDcgF0La+IPJYkrQIQ+ssfmeu7S+fu4bmdbAoE82hFNwNF/k6716dR
         R/8QEj9l80RzC013YzSwFp+UKqpS+rUlXn3tCJDPKnG8D5t4duc5B3tUoOU/YICrEN0q
         AUsRlzVw2e1+NevI+heZf4dfGoIgKHGSq2hciGGXnkA/KKm0Ab89UVbn9jcmH6Lr8TTw
         Xp9uVOTZU0Gj+dFEqab4rpOymbkA1tM1FjgEEyNvGFtUCZMIl6tZtpvcRckXJ0OG045R
         YAuw==
X-Forwarded-Encrypted: i=1; AKwUvBwRcY4m7m4CZ4TyfHnupADVgfKm10hlPcmqbyjgRUN0TGbCS77hkdulGBEUMrHi6GqdV7wZlD/Lr+7j95xI/H4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcVc1ukRDm2MMfSGhe5GkRxUb3J3QNvBmki+2a0ItPp4l5MPsK
	D0IIEkYzOG4MD+joc9T8fC4CprPOGhRAThOhM606tryqXDiCnrUdwn4gX0Y4bRRFVuncPuIJrId
	HDjrmh9UfESvaZxHVEBXIGwaEBg==
X-Received: from dybfc20.prod.google.com ([2002:a05:7300:3e94:b0:35a:6ed3:3ee9])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:de49:b0:35b:b3fa:40f7 with SMTP id 5a478bee46e88-35bb3fa4218mr1447041eec.38.1791826981179;
 Mon, 12 Oct 2026 10:43:01 -0700 (PDT)
Date: Mon, 12 Oct 2026 17:42:56 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261012174300.2338784-1-almasrymina@google.com>
Subject: [PATCH net v2 0/4] net: devmem: fix RX and TX binding teardown on
 device unregistration
From: Mina Almasry <almasrymina@google.com>
To: Jakub Kicinski <kuba@kernel.org>, David Wei <dw@davidwei.uk>, 
	Pavel Begunkov <asml.silence@gmail.com>, Mina Almasry <almasrymina@google.com>, 
	Taehee Yoo <ap420073@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, Paolo Abeni <pabeni@redhat.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Tariq Toukan <tariqt@nvidia.com>, 
	Kaifeng Wang <kaifengw@google.com>
Content-Type: text/plain; charset="UTF-8"

Fix two device-unregistration lifecycle bugs in devmem TCP bindings and
add netdevsim support plus selftests covering both RX and TX device
unregistration:

1. net: devmem: unmap dma_buf synchronously on queue uninstall
   Synchronously unmap and detach binding->attachment under binding->lock
   when the last RX queue is uninstalled in mp_dmabuf_devmem_uninstall(),
   and unmap RX bindings that were already unbound on NETDEV_UNREGISTER,
   preventing slab-use-after-free in dma_unmap_sg_attrs() when the binding
   is freed after dma_dev.

2. net: devmem: detach TX bindings on NETDEV_UNREGISTER
   Extend net_devmem_dev_unregister() to fully detach and unmap TX
   bindings when binding->dev unregisters, or clear binding->vdev alone
   when only a virtual device unregisters while binding->dev lives.

3. netdevsim: support devmem RX and TX bindings
   Enable PP_FLAG_DMA_MAP | PP_FLAG_ALLOW_UNREADABLE_NETMEM, 64-bit DMA mask
   on nsim_bus_dev, and NETMEM_TX_DMA on netdevsim so devmem RX/TX bindings
   can be exercised in software selftests.

4. selftests: net: add devmem RX and TX netdev unregister tests
   Add devmem_bind_rx_unregister_check and devmem_bind_tx_unregister_check
   to tools/testing/selftests/net/nl_netdev.py.

Cc: Tariq Toukan <tariqt@nvidia.com>
Cc: Kaifeng Wang <kaifengw@google.com>

---
v2:
- 1/4: Don't unmap when a leased queue is unleased. Keep bindings in
  net_devmem_dmabuf_bindings until freed, hidden from TX lookups by an
  xarray mark, and unmap unbound RX bindings on NETDEV_UNREGISTER. Update
  the binding->lock and binding->ref comments. (Sashiko)
- 2/4: Detach TX bindings from the same net_devmem_lock-protected walk,
  which now also covers unbound TX bindings, and clear the LIVE mark
  instead of erasing the ID. The walk no longer uses RCU or takes
  binding references (Stanislav).
- Link to v1: https://lore.kernel.org/netdev/20261010025532.839559-1-almasrymina@google.com/

Mina Almasry (4):
  net: devmem: unmap dma_buf synchronously on queue uninstall
  net: devmem: detach TX bindings on NETDEV_UNREGISTER
  netdevsim: support devmem RX and TX bindings
  selftests: net: add devmem RX and TX netdev unregister tests

 drivers/net/netdevsim/bus.c              |   1 +
 drivers/net/netdevsim/netdev.c           |  21 ++--
 net/core/devmem.c                        | 121 ++++++++++++++++++++---
 net/core/devmem.h                        |  10 +-
 net/core/netdev-genl.c                   |   1 +
 tools/testing/selftests/net/nl_netdev.py | 108 +++++++++++++++++++-
 6 files changed, 236 insertions(+), 26 deletions(-)


base-commit: 4f6ac74fa594a918d41255c941256e1d51592d3b
-- 
2.56.0.385.gd3acb90ef8-goog

