Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793995947;
	b=0LswksLOZX4RCTEP90/zoh3rl20/B3BbYk64+V7tCMiCCyGCbvMb/rmwWIHQzqEdqR+u
	 IU7uVjHrgNybczhWwj+W6EFhRq/58Z+p5Hdim8j2Esuanum6uebFp+As6WYTlxv1K0Zix
	 IrzykjXaDd83LQbbKXKi9uFONk/JrByRQSPPw8690d9ZB0zK+foZ3VqsXixrsXRyTJIbw
	 otP7sbTSObIowoJfNxiIva9gMoEmoQyBLMx5aTrLbpCmQmJ4x0SKr4c7C5d4266L6rRwl
	 C7Z8r1oxLRqHR9KH5CnqKJqQK/ZCrU1CTxTESX8/WuQ57O2YNTI8WQcRczON5QzuTCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793995947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=LjKa8iBUCS34wkjPa7UsY4XzJM1Gn1GsRT6Ph6M5uK8=;
	b=gIZBhwkNKgE8PGaR4yILefyfpI9JrLe2uWa0sWyG3/KwtAZdoLSFBYxrnZC7k168VlZ4
	 MBc+QR5SQcThGmRg3eH0MrIqLhSlPH/mx8GxiipywXHX61TuD5OkWPLL0eFe7fi7/2r9G
	 /MrQEy3jSLtTIF+bKCd17bUAKajlMK96RQS0pobzuiYS1CvAQfz+5xt/aDPwCtZCmYsmt
	 KIYJd8eH3bYRqYBbGz4wv3h35mrcVFOoVZJSpFkOv+Rc8M+SiXjm+93dP/pqgahE4LXHK
	 1HCAHWeAojKcTbNxFg00XDfHyl7OvHV3aF6wTfoyOQStuH/x65ES5Rktr8ewFEP1uPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bo848gTT;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F088606A337
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 20:12:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F088606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bo848gTT
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b331cad3cfso8610797b3.1
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 12:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793995945; x=1794600745; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LjKa8iBUCS34wkjPa7UsY4XzJM1Gn1GsRT6Ph6M5uK8=;
        b=Bo848gTTCfuIYSEnzyrjy9H6ebqLo62T4PebafatM3CO74ro0lhGypiUr7Vzd84fO6
         nyDMkicgMEFv1JpMKvdvpbNHK9eU+NTmjOkQhFq7bXH1iDbSgiVVR40sK+cFEFdUvfdS
         hLy+euhG0z1fbCXNp5UzQzIHcQRoH/hdMwHLQEqnB3s2ouYo29W/BZCQnVQiEbbtMgad
         3Id9jB0SaTKQfKIoRfX2pt+D5fS6CDgnMv8G7VfI9B2XzxDWHc+OW5eJ6i/H5C5SMmi1
         pldtswdWJJo1IUu5UxOMRdyPxW91m/gJ4l3vkhfykWTGyul/e2/odZQF2BlY4mKmeMSh
         /BSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793995945; x=1794600745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LjKa8iBUCS34wkjPa7UsY4XzJM1Gn1GsRT6Ph6M5uK8=;
        b=Cx2pWoN95zMtlCPjf2NzoHsz6mNIhzhItURl3vods4FfEKXsjnfTgupABachWEzCoe
         0Uvh2YyF9xlKMpZ3WhsI+1GhHfEmOvifhx2Du+ydDI+NDbO8Oe4dS9Pc1eJ+xeNrBtGy
         Edo0Eh8SsO0PjhoPpd/8Op7dilJOZjSvw7tAbI0+y+m+kf09xgmWmTl8GFBCWvUM/+cS
         a8HetVO/PiWQRJ5BDY0a3/RvtvxC7fAyinXT3YGrPtzxwcDJLq7JgpTliSJIaIUESiqf
         o1cdNLXeIGNWyAkRgWCsx/8CIh43bbpFxF1N4rdA4aWei0iJcbOsSY6ULZEdSXgBnLJ3
         57fg==
X-Forwarded-Encrypted: i=1; AL+hErE2niAFhRDpDGXwS1cUAouAJMeDUNMg7rIpya21d+4DsBmDFjuqg1g52FXywpan6H+8F9nIPu0iWo+viOJWZjA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6EB8HCPYNVCjHXQWAiFMbN9KHu0Ey+f18PsVPX1XtvDyA6Cy1
	RhJv9KnIV5USpSuabmoBTIJ66+Pw/HPoSD/Sdx3FwT8XRz6FeJwNM8zK
X-Gm-Gg: AYBFou0iCbYQxeDBL6RPKpU92agmby1vPITyHho9l6HZSU5pavW/hqwwfcPkGQw/Htc
	yzY/mrlArAaZ36ECUrkHyq1HB09dQ3yhxJXdn8/DzTzaOYp7QSBpwg5dE0xuKiN5RWDzXkQWReH
	f892eU4foerQbPwR8BQHCdM3hSp23qcEfvpstZyev9XRPiY8Lsk0/xYRvELMlGCRVaN5e13Tnz+
	SAQ1EwSSt/aL2enzmB/8wSbprg9+yAirWk2C6aq9KVGgoJ0TJ9GbEMzmZqOSHnZVmiaLC1qRAsK
	oO34p+I5qXObxXvb+THBMt5FlWuVvZo4S8PZY0mVXPvTluKNQ5h6wLXd6VEpn1gk3sNZO3el7pA
	oIdnkd0LkOTrbGM77NrPcKlaThsAsG+rfm/0ENLxX3uw1DSLdbvjwOocNkl//xNpV3raEFxc1iZ
	ZxNjl4Y6gLC92dwI5AUybNeyzpKrnJd6VU8Omp0kvQyZulbpMppAaCKawjzEVDYLgZqxpOkW3ez
	UVbvkXJdOdPCjrwLXzj+IYfV6sn8uS8VD0VONLBlrndtl3iuWuY23WEaLDAvaUSaKEgKQ5V0WuK
	L4MG88IN7eO4/D0bNTSGPPt6inY=
X-Received: by 2002:a05:690c:10:b0:8b3:47fd:a020 with SMTP id 00721157ae682-8b347fdb094mr15940227b3.35.1793995945458;
        Fri, 06 Nov 2026 12:12:25 -0800 (PST)
Received: from localhost ([2a03:2880:30ff:41::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f865b4esm27079897b3.39.2026.11.06.12.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:12:24 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Fri, 06 Nov 2026 12:12:09 -0800
Subject: [PATCH net-next v3 1/5] psp: support rx rekey operation
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-psp-v3-1-a8dd38f5a727@gmail.com>
References: <20261106-psp-v3-0-a8dd38f5a727@gmail.com>
In-Reply-To: <20261106-psp-v3-0-a8dd38f5a727@gmail.com>
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
v3:
- move the replaced assoc to psd->stale_assocs, so a rotation
  racing with its free doesn't count it in stale-events
- drop the requirement that the new rx spi has the opposite phase
  bit from the previous one
- keep prev_generation valid across a rotation when the prev SPI is
  from the same generation
- document rx rekey in the rx-assoc op doc in psp.yaml

v2:
- copy old rx state by value instead of pointer to prev
- place non-datapath fields at end of struct psp_assoc
- disallow rx rekey when socket is not in full psp state, or
  dev/version doesn't match.
- require the new rx spi to have the opposite phase bit from the previous
  one
---
 Documentation/netlink/specs/psp.yaml |  4 ++-
 Documentation/networking/psp.rst     | 23 ++++++++++++++--
 include/net/psp/functions.h          | 10 ++++---
 include/net/psp/types.h              | 17 +++++++++++-
 net/psp/psp.h                        |  3 ++-
 net/psp/psp_sock.c                   | 52 +++++++++++++++++++++++++++++++++---
 6 files changed, 96 insertions(+), 13 deletions(-)

diff --git a/Documentation/netlink/specs/psp.yaml b/Documentation/netlink/specs/psp.yaml
index f3266763c325..d5713f5d1af7 100644
--- a/Documentation/netlink/specs/psp.yaml
+++ b/Documentation/netlink/specs/psp.yaml
@@ -265,7 +265,9 @@ operations:
 
     -
       name: rx-assoc
-      doc: Allocate a new Rx key + SPI pair, associate it with a socket.
+      doc: |
+        Allocate a new Rx key + SPI pair, associate it with a socket.
+        If the socket already has PSP state, rekey its Rx direction.
       attribute-set: assoc
       do:
         request:
diff --git a/Documentation/networking/psp.rst b/Documentation/networking/psp.rst
index 0f9b6b73f244..fab797506b0a 100644
--- a/Documentation/networking/psp.rst
+++ b/Documentation/networking/psp.rst
@@ -140,14 +140,33 @@ The PSP assoc state of a socket is not reset when the connection is
 torn down. ``connect()`` on a socket that has PSP assoc state will
 return ``-EINVAL``.
 
+Rekeying
+--------
+
+A connection which has completed the exchange described above and is
+in the "PSP Full" state can be rekeyed in place without being torn
+down, using the same netlink calls as in connection setup.
+
+``rx-assoc`` allocates a new Rx key and SPI, which should be passed
+to the peer exactly as during the initial exchange. The SPI which was
+in use before the rekey remains acceptable on the socket until the
+next Rx rekey, or until the device key it was derived from has been
+rotated out, so packets the peer sent before it learned the new SPI
+are still received.
+
+A rekey is rejected with ``-EINVAL`` if it would change the PSP device
+or the PSP version of the association. It is rejected with ``-EBUSY``
+if the socket has not completed its initial exchange in both
+directions.
+
 Rotation notifications
 ----------------------
 
 The rotations of device key happen asynchronously and are usually
 performed by management daemons, not under application control.
 The PSP netlink family will generate a notification whenever keys
-are rotated. The applications are expected to re-establish connections
-before keys are rotated again.
+are rotated. Applications are expected to rekey their connections,
+as described above, before device keys are rotated again.
 
 Kernel implementation
 =====================
diff --git a/include/net/psp/functions.h b/include/net/psp/functions.h
index 410adb6718c1..5a7a518b9579 100644
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
index b8905efbd604..9eb89d2d680c 100644
--- a/include/net/psp/types.h
+++ b/include/net/psp/types.h
@@ -3,6 +3,7 @@
 #ifndef __NET_PSP_H
 #define __NET_PSP_H
 
+#include <linux/bits.h>
 #include <linux/mutex.h>
 #include <linux/refcount.h>
 #include <net/net_trackers.h>
@@ -78,7 +79,8 @@ struct psp_assoc_dev {
  * @active_assocs:	list of registered associations
  * @prev_assocs:	associations which use old (but still usable)
  *			device key
- * @stale_assocs:	associations which use a rotated out key
+ * @stale_assocs:	associations which use a rotated out key, or were
+ *			superseded by a rekey
  *
  * @stats:	statistics maintained by the core
  * @stats.rotations:	See stats attr key-rotations
@@ -152,6 +154,15 @@ struct psp_key_parsed {
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
 
@@ -159,6 +170,10 @@ struct psp_assoc {
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
index f2cba3fa3a23..c1e38845f08c 100644
--- a/net/psp/psp_sock.c
+++ b/net/psp/psp_sock.c
@@ -149,10 +149,39 @@ void psp_sk_assoc_free(struct sock *sk)
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
+
+	pas->peer_tx = 1;
+	pas->prev_spi = prev->rx.spi;
+	pas->prev_generation = prev->generation;
+
+	memcpy(&pas->tx, &prev->tx, sizeof(pas->tx));
+	memcpy(pas->drv_data, prev->drv_data, pas->psd->caps->assoc_drv_spc);
+	prev->flags |= PSP_ASSOC_SKIP_TX_KEY_DEL;
+	list_move(&prev->assocs_list, &prev->psd->stale_assocs);
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
@@ -165,10 +194,11 @@ int psp_sock_assoc_set_rx(struct sock *sk, struct psp_assoc *pas,
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
@@ -177,6 +207,7 @@ int psp_sock_assoc_set_rx(struct sock *sk, struct psp_assoc *pas,
 
 	refcount_inc(&pas->refcnt);
 	rcu_assign_pointer(sk->psp_assoc, pas);
+	psp_assoc_put(prev);
 	err = 0;
 
 exit_unlock:
@@ -302,8 +333,21 @@ void psp_assocs_key_rotated(struct psp_dev *psd)
 	 */
 	list_for_each_entry_safe(pas, next, &psd->prev_assocs, assocs_list) {
 		pas->generation |= ~PSP_GEN_VALID_MASK;
+		pas->prev_generation |= ~PSP_GEN_VALID_MASK;
 		psd->stats.stales++;
 	}
+
+	/* Don't allow SPI from two generations ago to alias one from the
+	 * current generation. Rx rekeying under the same device key generation
+	 * is currently permitted, so skip if the previous SPI is from just one
+	 * generation ago.
+	 */
+	list_for_each_entry(pas, &psd->active_assocs, assocs_list) {
+		if ((pas->rx.spi ^ pas->prev_spi) &
+		    cpu_to_be32(PSP_SPI_KEY_PHASE))
+			pas->prev_generation |= ~PSP_GEN_VALID_MASK;
+	}
+
 	list_splice_init(&psd->prev_assocs, &psd->stale_assocs);
 	list_splice_init(&psd->active_assocs, &psd->prev_assocs);
 

-- 
2.52.0

