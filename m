Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795153804;
	b=3H9hzd0imz4NlrF0gvY4IW52Dh55hXOEeVYeI0EgPDufNMVFlYR02f2DUKJbClWigh0a
	 xx9uQ3ttdhnOfd6akH1XPMS/n35ztOBT2FCZhvw3oY52NjN4Znm3SOmCorJXYeu1ov6e4
	 dy+N46tlOri0O/CFlHr/rlJYsciBUfD3L/oD6WOFSIfyQQfAYxrNejGNWxmmFQ8Htn3YV
	 iPW1XfVpgMJQJx2i+WtlS7nLHoUjhgpU2Dk9u199TLIquILhY6hg3JrY3QVQ32uQgWbzW
	 gh+TPHZ7Et4vVFeDqnk6ytzS2pdL7Y0lD9eoXisn1otEzQW5YR4+LKr3zfEWEkaClJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795153804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=3KVUdhjdUAQUVhU8tF9wbTS923a28qAeS6k6sQNHWmc=;
	b=RRqPiQA0EuquXmdCaWfBHcsrHKbXlvWX8910E9gpz6rWTeDtYUfd8+t6eY02y9MG1Zdy
	 uLk/cUubDWeIF7egY6RLw+Ioo0L+L5EmLOwNO0fheeBZEhZ31BBpMsjLnnAf3ccaef3id
	 gRbhYNdzFSYbucV0QPrZnLow+uI3kR0wtlssAqMaMRMWY+XkUBee8kZ/9tCuAyR6Cp3KQ
	 XIawb8GZJAoSZd+aBJhlsnjVbV58EgDiWFxjbHy5AIVq2X0DB91rDUHIbTYqMirrx34ef
	 C7CAXhn2nLVDw/BrkFAuvCtqGIFQvt4ecCqFrGlcA6j2PDIXNW+byT65+8q96ZSHsuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TMVDcKPp;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE6D606A33C
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 05:50:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFE6D606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TMVDcKPp
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso520733eec.0
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 21:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795153803; x=1795758603; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3KVUdhjdUAQUVhU8tF9wbTS923a28qAeS6k6sQNHWmc=;
        b=TMVDcKPpOpVkqF98votaywv0qrAehZkHAmqpIUewjvV+jeyv/wJVvNlXEDgNtRAr00
         5eeFseYQ2gNtHfjprmp0Iqw9gkuwYzJIWqE85IveBVYZ03hJ7X42dkhyCjqncZEHyHmm
         B+euqHSSbCZUvi4sq1oqgdCZHgo1/rqQx5t/ToDInFxxNiCuPQBt2K26OvtH394KxYRy
         ipu0jaKGS6kZvYTdfNu2H05qBE9M0Vp4zrdzJWX2MiUp5TUC53cZ98RK/sX8FrPeP3P+
         czxxS0SVZnm6/IYnAVJUVcfkmC37lqLS9U2xKqonRnIY5WXSTFNJGyvjUBVi0B0834jj
         MZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795153803; x=1795758603;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3KVUdhjdUAQUVhU8tF9wbTS923a28qAeS6k6sQNHWmc=;
        b=YavFopgiY0bjkzlqgZxHj9n5ls7DrQ7vdvlf1h1aoOm0A2hFqNTDbGep28NWkWb5Dk
         E/foP42jzUYlnfKqfPJip+T088/bexpiEDuQjgYbVesZdIvViUAHS0HNHIuWparfNd8Z
         RZEk9JeW51/c37Q4SZP6PX+fFL9SuEppk2InaU+qCeFt82SWizXjcyY4i7aLV2zS2avx
         w+VrZc5sOGBImcHFsu0JZkqo4fUnPO5fz5ozmDF0CLkz7Zqd26ztkZL9pEpTXeY32+b7
         Bvg7ct1aJAnd85KiByQ4nPEuXgP+8P8S60IKq1rh9af/PkfYfijRsq4VFeOSj2ygTLUJ
         mOtw==
X-Forwarded-Encrypted: i=1; AL+hErGl9ePQ/Qro1OaVARHH6jJKg/XPSZa5c32hHPKIRgrp+pHT29mv8Veybk6jI/24DfhqWM59x9WM3vrDG+RL924=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Kyu90cpPMEtlR5PDoL3weHpvh/hSrWbgMiv/+4cLNWFEjWg+8
	QFeo2MIwfBlMGl7gNCTu86jH4Hdt1lsn1lFZbnwrRExoCrXwbxytonroafJ6lGH7MRmEUHI5sDA
	xPrqr+N5Wd3xvOPvJHmli/R8v+w==
X-Received: from dybme37.prod.google.com ([2002:a05:7301:18a5:b0:384:71f1:1227])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:6e9a:b0:37e:9a3b:76a3 with SMTP id 5a478bee46e88-3856f14b9edmr1567860eec.11.1795153802509;
 Thu, 19 Nov 2026 21:50:02 -0800 (PST)
Date: Fri, 20 Nov 2026 04:59:15 +0000
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
Message-ID: <20261120045918.1239746-5-almasrymina@google.com>
Subject: [PATCH net-next v4 4/7] net: devmem: fold net_devmem_lookup_dmabuf()
 into net_devmem_get_binding()
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	Weiming Shi <bestswngs@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Bobby Eshleman <bobbyeshleman@meta.com>
Content-Type: text/plain; charset="UTF-8"

net_devmem_lookup_dmabuf() has only one caller, net_devmem_get_binding(),
which currently enters two separate RCU read-side critical sections: one
inside net_devmem_lookup_dmabuf() to find the NET_DEVMEM_BINDING_LIVE
entry and acquire a reference, and a second in net_devmem_get_binding()
to verify dst_dev against binding->map_dev and binding->bind_dev.

Because the lookup and device checks are split across two RCU read-side
critical sections, waiting for synchronize_net() after clearing
NET_DEVMEM_BINDING_LIVE does not guarantee that in-flight
net_devmem_get_binding() callers have finished validating the binding
and returned.

Fold net_devmem_lookup_dmabuf() into net_devmem_get_binding() so the
entire lookup, validation, device check, and
net_devmem_dmabuf_binding_get() run inside a single rcu_read_lock()
section. The binding stays alive for the duration of the RCU read-side
critical section because net_devmem_unbind_dmabuf() calls
synchronize_net() after clearing NET_DEVMEM_BINDING_LIVE and before
percpu_ref_kill(). Deferring net_devmem_dmabuf_binding_get() until all
checks pass also eliminates the error-path reference put.

Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 net/core/devmem.c | 38 ++++++++++++--------------------------
 net/core/devmem.h |  6 ------
 2 files changed, 12 insertions(+), 32 deletions(-)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index 604718bed3cb2..6f85b90950f8b 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -211,7 +211,7 @@ void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding)
 	xa_clear_mark(&net_devmem_dmabuf_bindings, binding->id,
 		      NET_DEVMEM_BINDING_LIVE);
 
-	/* Ensure no tx net_devmem_lookup_dmabuf() are in flight after the
+	/* Ensure no tx net_devmem_get_binding() are in flight after the
 	 * mark is cleared.
 	 */
 	synchronize_net();
@@ -521,23 +521,6 @@ net_devmem_bind_dmabuf(struct net_device *map_dev,
 	return ERR_PTR(err);
 }
 
-struct net_devmem_dmabuf_binding *net_devmem_lookup_dmabuf(u32 id)
-{
-	struct net_devmem_dmabuf_binding *binding;
-	unsigned long xa_idx = id;
-
-	rcu_read_lock();
-	binding = xa_find(&net_devmem_dmabuf_bindings, &xa_idx, id,
-			  NET_DEVMEM_BINDING_LIVE);
-	if (binding) {
-		if (!net_devmem_dmabuf_binding_get(binding))
-			binding = NULL;
-	}
-	rcu_read_unlock();
-
-	return binding;
-}
-
 void net_devmem_net_iov_inc_ref(struct net_iov *niov)
 {
 	net_devmem_dmabuf_binding_get(net_devmem_iov_binding(niov));
@@ -552,19 +535,21 @@ struct net_devmem_dmabuf_binding *net_devmem_get_binding(struct sock *sk,
 							 unsigned int dmabuf_id)
 {
 	struct net_devmem_dmabuf_binding *binding;
+	unsigned long xa_idx = dmabuf_id;
 	struct net_device *dst_dev;
 	struct dst_entry *dst;
-	int err = 0;
+	int err;
 
-	binding = net_devmem_lookup_dmabuf(dmabuf_id);
+	rcu_read_lock();
+	binding = xa_find(&net_devmem_dmabuf_bindings, &xa_idx, dmabuf_id,
+			  NET_DEVMEM_BINDING_LIVE);
 	if (!binding || !binding->tx_vec ||
 	    !net_eq(sock_net(sk), read_pnet(&binding->net)) ||
 	    !uid_eq(sk_uid(sk), binding->uid)) {
 		err = -EINVAL;
-		goto out_err;
+		goto out_unlock;
 	}
 
-	rcu_read_lock();
 	dst = __sk_dst_get(sk);
 	/* If dst is NULL (route expired), attempt to rebuild it. */
 	if (unlikely(!dst)) {
@@ -590,15 +575,16 @@ struct net_devmem_dmabuf_binding *net_devmem_get_binding(struct sock *sk,
 		goto out_unlock;
 	}
 
+	if (!net_devmem_dmabuf_binding_get(binding)) {
+		err = -EINVAL;
+		goto out_unlock;
+	}
+
 	rcu_read_unlock();
 	return binding;
 
 out_unlock:
 	rcu_read_unlock();
-out_err:
-	if (binding)
-		net_devmem_dmabuf_binding_put(binding);
-
 	return ERR_PTR(err);
 }
 
diff --git a/net/core/devmem.h b/net/core/devmem.h
index 9dcb629e10bfd..5bfb1b21d19f5 100644
--- a/net/core/devmem.h
+++ b/net/core/devmem.h
@@ -98,7 +98,6 @@ net_devmem_bind_dmabuf(struct net_device *map_dev,
 		       struct netdev_nl_sock *priv,
 		       const struct sock *nl_sk,
 		       struct netlink_ext_ack *extack);
-struct net_devmem_dmabuf_binding *net_devmem_lookup_dmabuf(u32 id);
 struct net_device *
 net_devmem_lock_dev(struct net_device **dev_ptr,
 		    netdevice_tracker *dev_tracker);
@@ -184,11 +183,6 @@ net_devmem_bind_dmabuf(struct net_device *map_dev,
 	return ERR_PTR(-EOPNOTSUPP);
 }
 
-static inline struct net_devmem_dmabuf_binding *net_devmem_lookup_dmabuf(u32 id)
-{
-	return NULL;
-}
-
 static inline struct net_device *
 net_devmem_lock_dev(struct net_device **dev_ptr,
 		    netdevice_tracker *dev_tracker)
-- 
2.56.1.750.gf70dc682cf-goog

