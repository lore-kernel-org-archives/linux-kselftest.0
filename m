Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794117495;
	b=hGDgK/Ur0AMcyEegVGhXIT3+O3JayKVbPP4NSuCuKK6BJUaCt4QBlMfoWOeTsOo+Suwo
	 Ai0S44rA9PeJX4frZoEepD1P1T5uLl5Pc1XkYM0bHNn8p2FtJOyPQPdrmjvhwkHpwilo+
	 5W3SFIIgg8RZNZJTWSb9F/DPlPpNwj+NdwQgUwmd1Ar1xR6HjzivwFYFoPBNfqouoVq/d
	 Q3aruDUlyXwwMhLxKHbISMgzE+Hgtry8q2O8w2t8APRd69HHol9f67pnkCzHsRRPuV1SX
	 AWGtIxzIvgj0lvjknGhhzUVWs0lxo2EAsJLxcm9cFwaPbMud/lpYGVjEeGDfjruIi5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794117495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=IJn1AMk3SYqRRM9oElk7NJVUkVbpguV5f8/F8Hoavu0=;
	b=Exxft7s0AnMZTZKF14OY0FgX4kd37bKPppjzCJw8lpSdtY9h3MYdAX4qAQOz/fQJcOdl
	 /gnOSh2Y17Vph3FpYZO1jwl1R3JW1NU6C69pVlC9vuCyIDqGXv3PwrjtgU5XqP6dFgCFQ
	 EHIpOAmEE2142BsKcSVNf/BxpdKWSBAIyFqx95GJI9CAy2Usvk2Qf6W1PWeBW+pTgdBT7
	 2qG1Tt4i1h3D5GnpncgiPSRgTVFw9+781SgDUdX8xTzb/8QdbP4x/Pdyckv6Gz+cV50c7
	 oRYbz+JtJgaV0CyBLr7FtJ6xZM2sJXLDqL2TaIi0hTjBhE2FJlq+2HQ+hkmou8ubw2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=O7JxI+x0;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288F6606A332
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Nov 2026 05:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 288F6606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=O7JxI+x0
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36d69ab3c2bso326792eec.0
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Nov 2026 21:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794117493; x=1794722293; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJn1AMk3SYqRRM9oElk7NJVUkVbpguV5f8/F8Hoavu0=;
        b=O7JxI+x0qDO25SqmddFu2SvxIZxCk1I8uX2KySLYAzcN+dud2mvQ/Nj0Wb8QNaPdrS
         BcuaKSt3nFELUixlFAGVCIUPhxd4TFduwOp0qOpwzfHXtjN0NbivmdfBWSUmdk0jyiYm
         U97RW8W80j2bHND3Bx7qyzfceGOhwgN38DCmbr2HVPi0wjtpN6f9NymxGx0nTgTA16g4
         FsY0Vln8L2bGooYdHCc+FHcOmnRukGXprSdUVktXSVsSTgveYkt7eYb8wzYvREXk7yp7
         UcWTgC/hZhaBkcUHSajMSqRA60hvgi2jM5P4KWemsw3HycUmASrpw5U5juJBuK3dcunq
         vCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794117493; x=1794722293;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IJn1AMk3SYqRRM9oElk7NJVUkVbpguV5f8/F8Hoavu0=;
        b=aqWWr+OdL6DUD2LDQIHHl1b+6Q08FHZkLsaB7RWNt3cajtqfGzPi5RRR+4tPzl9w35
         LilXl8kb9M1wEbEVPBbMqmQh/a6Gr2Tb1qJEy3luwfgm3wci4go7eHcLTrPAwB4pqVDp
         By7HWoYlNuixiWE2s5BQHO5rfEC3SXee3sAk+9vFOYFe5NdlqAvEcG5ATeJwW0tINJdc
         nZaDLUjTJaev0iUel9ta74pPyvc4hIEf4/9u5G1uLnmsw/NEIrpWkWp/2TbjAlqMOalQ
         BcaTIcmw6E+Q6PAm8v/g66l6eHT9+6lyKG9LtwldryJgCCW7izj5S6zida6Wms3gxNBO
         zZ/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxe5+2+cJ/ani00Kyzyo0t9Rf/e0MIe0aXQHMXHYU6beZPQujc3iEni/OkGQfPSwqgxQsFWNvtuOBmkJOsXl9k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9X5DhEdgymUKonSmeTZZsm6miPBnKCFgKlmVswvEVKxVr4oFoX
	hm+FX+xcGIb3Prhc1pdwJsP0jelV5pXQcfE81g7o9QwbAIZ4UGqisf/bYt2B0EDdAHWWulFqrW1
	vN+5khOMGfbZLjgqR9sPIkutR+A==
X-Received: from dlbrx22.prod.google.com ([2002:a05:7022:1716:b0:143:7311:4b88])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:4302:b0:1b2:43ac:d3a3 with SMTP id a92af1059eb24-1b39fe9e1famr1103103c88.24.1794117492902;
 Sat, 07 Nov 2026 21:58:12 -0800 (PST)
Date: Sun,  8 Nov 2026 05:58:06 +0000
In-Reply-To: <20261108055809.2122934-1-almasrymina@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261108055809.2122934-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261108055809.2122934-4-almasrymina@google.com>
Subject: [PATCH net-next v2 3/6] net: guard memory provider RX queue open and
 close on unregister
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

When a memory provider RX queue is leased to a virtual netdev,
netif_mp_open_rxq() and netif_mp_close_rxq() redirect through
rxq->lease and lock the physical backing netdev directly rather than via
netdev_get_by_index_lock(). This raises two issues during netdev
unregistration:

1. In __netif_mp_open_rxq(), the physical backing netdev may already be
   in NETREG_UNREGISTERING (after dev_shutdown() and
   dev_memory_provider_uninstall() have run on it, before cascaded
   unregistration of the virtual leasee tears down the lease). Reject
   opening an RX queue if dev->reg_state != NETREG_REGISTERED.
2. In __netif_mp_close_rxq(), when the physical backing netdev
   unregisters before the virtual leasee, dev_memory_provider_uninstall()
   on the physical netdev does not uninstall the virtual queues, so
   phys_rxq->mp_params remains populated until the virtual leasee's
   netif_rxq_cleanup_unlease() or socket teardown runs. At that point
   the physical netdev has already gone through dev_shutdown() and must
   not call netdev_rx_queue_reconfig(). When dev->reg_state >
   NETREG_REGISTERED, clear rxq->mp_params and return 0.

Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 net/core/netdev_rx_queue.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/net/core/netdev_rx_queue.c b/net/core/netdev_rx_queue.c
index a7261fedd5e76..85ae5abf16b8e 100644
--- a/net/core/netdev_rx_queue.c
+++ b/net/core/netdev_rx_queue.c
@@ -193,6 +193,14 @@ static int __netif_mp_open_rxq(struct net_device *dev, unsigned int rxq_idx,
 	struct netdev_rx_queue *rxq;
 	int ret;
 
+	/* A leased physical dev is locked via rxq->lease rather than
+	 * netdev_get_by_index_lock(), so check reg_state under its lock.
+	 */
+	if (dev->reg_state != NETREG_REGISTERED) {
+		NL_SET_ERR_MSG(extack, "Device is being unregistered");
+		return -ENODEV;
+	}
+
 	if (!qops)
 		return -EOPNOTSUPP;
 
@@ -284,12 +292,13 @@ static int __netif_mp_close_rxq(struct net_device *dev, unsigned int rxq_idx,
 
 	rxq = __netif_get_rx_queue(dev, rxq_idx);
 
-	/* Callers holding a netdev ref may get here after we already
-	 * went thru shutdown via dev_memory_provider_uninstall().
+	/* Callers holding a netdev ref or tearing down a queue lease may get
+	 * here after dev already went through shutdown.
 	 */
-	if (dev->reg_state > NETREG_REGISTERED &&
-	    !rxq->mp_params.mp_ops)
+	if (dev->reg_state > NETREG_REGISTERED) {
+		memset(&rxq->mp_params, 0, sizeof(rxq->mp_params));
 		return 0;
+	}
 
 	if (WARN_ON_ONCE(rxq->mp_params.mp_ops != old_p->mp_ops ||
 			 rxq->mp_params.mp_priv != old_p->mp_priv))
-- 
2.56.0.455.g6c5a503b38-goog

