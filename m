Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2D73E3D8B
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 20:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791578819; cv=none; b=OCpQ+UvsmAxia5ToHY3lZ3fl8yksIVObMQ+yZ7YpFAJJEmVl5z/SraYbqUq1xTXZlQ6f6tupQQ9JKmiJyUnfOo0pPRQSse/PKgqEMCNoRJ7ngPDQWK8W4V4nrpxvTVQISZoftNC/+LPFdOcNReqeoXH7XfqhgDQ44qp6zPrqfsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791578819; c=relaxed/simple;
	bh=m9SzRUGKoPR1mS4Dut8vduUMZvxTJbCwvxQZ39wFGuQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g0HeIpayejaTNU1ROTDrzp1LfXIJrkYJF/MKnZu9xXhxvUKGbba/ca68wiBgNtglGYbOAHjvoL2ZmyZDbeKhrOuP2WvkB4Y6kCm71Ggjd4tRb2s3PuUqps+HH5aO/NPcsNxixHhO5WfsTqz5wSznZ5QgA7+XvSc/tElQtYNWevM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qGdf+GWE; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qGdf+GWE"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6cfb1329979so190664eaf.1
        for <linux-kselftest@vger.kernel.org>; Fri, 09 Oct 2026 13:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791578817; x=1792183617; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CpOWbf1c2XqyOW0m3xkZMNlKiHsQ9gzboYYZ3u/tmMs=;
        b=qGdf+GWErpQwEw/XrferFZzN8bTX6u2n21pezPTEEdpq/ZsQdwPdEpg2td3sT+rbCr
         bozH9Euvr7ZkEMV0NtO12nvhq8vY+AwHZotKSDPvG/UTeGa+EJSE3Dtk+194pftlbUZ4
         xFaaX177mo4nX4imYOJKkrd+hF1qju34H6gvHcwz2taxs+psesuzULnV3VCJXm5JS0cZ
         cc/Qu0AoxzxZQjp6E6XFjTuUv/gvroWOpBfZoXLJ7Ct/qJhCGjlmecbGSeevV7EiatAA
         jiws31zEttEiqZU4/Juk4QFxEQTOyT7O9L2fxFVr9/Dkc/DBebqZMi7edaqd4dg8Md+U
         ainw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791578817; x=1792183617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CpOWbf1c2XqyOW0m3xkZMNlKiHsQ9gzboYYZ3u/tmMs=;
        b=x0eU5IZXeVDQNCzmrLnKtJJy1htEHjg94WvMJVVBVJgZ6LWc7d9KPwY68c3MFt9pvd
         xuzEvERwzOCiOmXPJ2bxU56ypzIoI2jsMsqmMO3u7TVNqxkZIjRqYTkUhVR8RY52bRsj
         owub9oDCDEnM27IwPmENXoRBN/ldB+yXZEyNH/ivR9GTwb6Cdi8Y36iqpegWtp0fXnFb
         gicBp7e4XgHbVuOIx1GBRPfUQO7td+vkvbIj2ABliL4YtQYhH85LaCOK9Cr7UH/Sgdqd
         Fkhh4biLzECWuOe/UKP9JPpDTsVGblSESMgcxfeKhqCfOF470TxS2eKvq7kACzdR9ySX
         SxVA==
X-Forwarded-Encrypted: i=1; AKwUvBxz+5iI0Enf2gjpF7O4XiRDqHTzF15ec+aBuv5K6RoRYml6r0lz1fw3f8z3gFYb0GRKEVv4yEsSag+PBJd7I8A=@vger.kernel.org
X-Gm-Message-State: AFuF++lI9QqzhjJDaOrb0I8qeRMcevUIKLGrHGig3H9p4gvhCWnr86OJ
	KZ0z1amlwUQLcjkZQroWrVsG6BWBR/y9iUdnTbq3TQkun3K8IZR7YUOy
X-Gm-Gg: AYBFou3BbDEVRz3T0fzvb6VDWbvrkPPUWy6ZEf2te4v2g508N7njOZyi9sFuTGlaI3T
	Jjcyg7rgDgMzJPLGRZLrNiMTwYqe5OPm4ZV1XT4fw7K0h3CQz2dfBLSpyT0AiJKsf+kNh5+rYzE
	MjqwMtjFOpnKJ71X9vPm7aDUSvKAZUwlQTm5Z+c0kAzP0BfImqzVENb0ko/zUvGmgEDtWXVROro
	i9cVos9HYui/ilu6XWFcNGMR9nLZKbaZfGe/AJF9qDmNnB+H68DYvnig6bxGDW1KP4IJvzTq1jK
	g4MxDT5fcvHXIZ1UiLIdF0415Zj2CJgtALhg5g4cX3MmmWnTZQH3DfTor2FyriQBTc3aw7ikyaL
	zXCR1k43i95fOHvirxg0QeIdkRXFv6ogTKtToeogTTJLK8/YtkSCoELDDdfpqhcabJYlU77SsyG
	S5SP32YEjMPMFwzKHgMAb6B7t1qaD1oXC6/BWdWikOs8894Io1sHyOeSixxTtFEVZBMLDOUQ==
X-Received: by 2002:a05:6820:200b:b0:6d8:2fe:efb4 with SMTP id 006d021491bc7-6ef08e6f2b1mr2422812eaf.8.1791578816801;
        Fri, 09 Oct 2026 13:46:56 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:42::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6eefc38911esm3043162eaf.1.2026.10.09.13.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 13:46:56 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Fri, 09 Oct 2026 13:46:41 -0700
Subject: [PATCH net-next v2 1/7] psp: support rx rekey operation
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-psp-v2-1-5596ab50f677@gmail.com>
References: <20261009-psp-v2-0-5596ab50f677@gmail.com>
In-Reply-To: <20261009-psp-v2-0-5596ab50f677@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.13.0

Support updating the rx PSP state used by a socket. This is most
useful to do after a device key rotation has occurred and the key
being used by the peer will become stale after the next device key
rotation.

Create a new psp_assoc for the socket to use that contains the same tx
state, but with new rx state. Copy the previous rx state to use as a
fallback while the peer is in the process of switching to the new key.

skbs matching the current rx spi and generation or the previous rx spi
and generation will be accepted. It might be reasonable to stop
accepting skbs on the previous state after seeing skbs with the new
state and after waiting a grace period, but that is not implemented
for now.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
v2:
- copy old rx state by value instead of pointer to prev
- place non-datapath fields at end of struct psp_assoc
- disallow rx rekey when socket is not in full psp state, or
  dev/version doesn't match.
- require the new rx spi to have the opposite phase bit from the previous
  one
---
 include/net/psp/functions.h | 10 ++++++----
 include/net/psp/types.h     | 14 ++++++++++++++
 net/psp/psp.h               |  3 ++-
 net/psp/psp_sock.c          | 46 +++++++++++++++++++++++++++++++++++++++++----
 4 files changed, 64 insertions(+), 9 deletions(-)

diff --git a/include/net/psp/functions.h b/include/net/psp/functions.h
index b23c30898389..fb80e15e4368 100644
--- a/include/net/psp/functions.h
+++ b/include/net/psp/functions.h
@@ -77,10 +77,12 @@ psp_is_allowed_nondata(struct sk_buff *skb, struct psp_assoc *pas)
 static inline bool
 psp_pse_matches_pas(struct psp_skb_ext *pse, struct psp_assoc *pas)
 {
-	return pse && pas->rx.spi == pse->spi &&
-	       pas->generation == pse->generation &&
-	       pas->version == pse->version &&
-	       pas->dev_id == pse->dev_id;
+	return pse && pas->version == pse->version &&
+	       pas->dev_id == pse->dev_id &&
+	       ((pas->rx.spi == pse->spi &&
+		 pas->generation == pse->generation) ||
+		(pas->prev_spi && pas->prev_spi == pse->spi &&
+		 pas->prev_generation == pse->generation));
 }
 
 static inline enum skb_drop_reason
diff --git a/include/net/psp/types.h b/include/net/psp/types.h
index b8905efbd604..52c78cc72f1f 100644
--- a/include/net/psp/types.h
+++ b/include/net/psp/types.h
@@ -3,6 +3,7 @@
 #ifndef __NET_PSP_H
 #define __NET_PSP_H
 
+#include <linux/bits.h>
 #include <linux/mutex.h>
 #include <linux/refcount.h>
 #include <net/net_trackers.h>
@@ -152,6 +153,15 @@ struct psp_key_parsed {
 	u8 key[PSP_MAX_KEY];
 };
 
+/**
+ * enum psp_assoc_flags - flags of struct psp_assoc
+ * @PSP_ASSOC_SKIP_TX_KEY_DEL: Do not delete Tx key from psp_dev. It was
+ *	copied to a newer psp_assoc during an Rx rekey.
+ */
+enum psp_assoc_flags {
+	PSP_ASSOC_SKIP_TX_KEY_DEL	= BIT(0),
+};
+
 struct psp_assoc {
 	struct psp_dev *psd;
 
@@ -159,6 +169,10 @@ struct psp_assoc {
 	u8 generation;
 	u8 version;
 	u8 peer_tx;
+	u8 prev_generation;
+	u8 flags; /* Slow path, protected by psd->lock */
+
+	__be32 prev_spi;
 
 	u32 upgrade_seq;
 
diff --git a/net/psp/psp.h b/net/psp/psp.h
index b123c2427905..92d7b92acaed 100644
--- a/net/psp/psp.h
+++ b/net/psp/psp.h
@@ -63,7 +63,8 @@ static inline bool psp_dev_has_sadb(struct psp_dev *psd)
 static inline bool psp_assoc_needs_tx_key_del(struct psp_assoc *pas)
 {
 	lockdep_assert_held(&pas->psd->lock);
-	return psp_dev_has_sadb(pas->psd) && pas->tx.spi;
+	return psp_dev_has_sadb(pas->psd) && pas->tx.spi &&
+	       !(pas->flags & PSP_ASSOC_SKIP_TX_KEY_DEL);
 }
 
 #endif /* __PSP_PSP_H */
diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
index a6b1c42dd626..b5887171c84e 100644
--- a/net/psp/psp_sock.c
+++ b/net/psp/psp_sock.c
@@ -149,10 +149,42 @@ void psp_sk_assoc_free(struct sock *sk)
 	psp_assoc_put(pas);
 }
 
+static int psp_sock_rx_rekey(struct psp_assoc *pas, struct psp_assoc *prev,
+			     struct netlink_ext_ack *extack)
+{
+	if (pas->psd != prev->psd) {
+		NL_SET_ERR_MSG(extack, "PSP device mismatch with existing state");
+		return -EINVAL;
+	}
+	if (pas->version != prev->version) {
+		NL_SET_ERR_MSG(extack, "PSP version mismatch with existing state");
+		return -EINVAL;
+	}
+	if (!prev->tx.spi || !prev->peer_tx) {
+		NL_SET_ERR_MSG(extack, "Socket PSP state is not fully established");
+		return -EBUSY;
+	}
+	if (!((pas->rx.spi ^ prev->rx.spi) & cpu_to_be32(PSP_SPI_KEY_PHASE))) {
+		NL_SET_ERR_MSG(extack, "New and prev SPI have same phase bit");
+		return -EINVAL;
+	}
+
+	pas->peer_tx = 1;
+	pas->prev_spi = prev->rx.spi;
+	pas->prev_generation = prev->generation;
+
+	memcpy(&pas->tx, &prev->tx, sizeof(pas->tx));
+	memcpy(pas->drv_data, prev->drv_data, pas->psd->caps->assoc_drv_spc);
+	prev->flags |= PSP_ASSOC_SKIP_TX_KEY_DEL;
+
+	return 0;
+}
+
 int psp_sock_assoc_set_rx(struct sock *sk, struct psp_assoc *pas,
 			  struct psp_key_parsed *key,
 			  struct netlink_ext_ack *extack)
 {
+	struct psp_assoc *prev;
 	int err;
 
 	memcpy(&pas->rx, key, sizeof(*key));
@@ -165,10 +197,11 @@ int psp_sock_assoc_set_rx(struct sock *sk, struct psp_assoc *pas,
 		goto exit_unlock;
 	}
 
-	if (psp_sk_assoc(sk)) {
-		NL_SET_ERR_MSG(extack, "Socket already has PSP state");
-		err = -EBUSY;
-		goto exit_unlock;
+	prev = psp_sk_assoc(sk);
+	if (prev) {
+		err = psp_sock_rx_rekey(pas, prev, extack);
+		if (err)
+			goto exit_unlock;
 	} else if (sk_has_decrypt_user(sk)) {
 		NL_SET_ERR_MSG(extack, "Socket has incompatible state");
 		err = -EINVAL;
@@ -177,6 +210,7 @@ int psp_sock_assoc_set_rx(struct sock *sk, struct psp_assoc *pas,
 
 	refcount_inc(&pas->refcnt);
 	rcu_assign_pointer(sk->psp_assoc, pas);
+	psp_assoc_put(prev);
 	err = 0;
 
 exit_unlock:
@@ -304,6 +338,10 @@ void psp_assocs_key_rotated(struct psp_dev *psd)
 		pas->generation |= ~PSP_GEN_VALID_MASK;
 		psd->stats.stales++;
 	}
+
+	list_for_each_entry(pas, &psd->active_assocs, assocs_list)
+		pas->prev_generation |= ~PSP_GEN_VALID_MASK;
+
 	list_splice_init(&psd->prev_assocs, &psd->stale_assocs);
 	list_splice_init(&psd->active_assocs, &psd->prev_assocs);
 

-- 
2.52.0

