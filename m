Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010983;
	b=NAQgPR3iilYUjq+L2RgMplyVHIvWpeIHy9gfl9QnkRnk7jtN+WINN5PAeEFfTJUZlW59
	 cN7C7b+X5ZQNpcAogefNs0ug2ZkREXqrLeB+P3c1PERsuxPatjyYXyRM0qm27Pr5ysuZ0
	 Id+oZty3cSQrLMuiJ2LGwdV5rVhfQyxjS0YzsJVG9GU+sfT7/iKZEI/DlxGK0L3HbFEWt
	 qfqGEktmtVvcm2PT6TP+m9hRts8CgYa/fU/4BC3tjj3i3JblzNgvK1DNg8M4dbXVx8l1T
	 79D3EwrAUBhnWjxwmN/6Q9Eu3njKnLyj7tD6bLKQsJID3jp8Qr9Kh7UKVFW4awGTogA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=BhI9NvyCgtOZtuaslrAqMXx6Ds5DSmZ6/JAKnGkqXCU=;
	b=UpiJ4XPtmsZziOQjLuvi+hktJbMO50U8hwD4m2lDWiEoxFQZC5ur+C2SIgAodhBjjF7r
	 v28YnR9Z4ijiNdagqfMng1bXF7Fd3tUMTJgkpP8h7MpCaiJYmG/3Pmb1UT0dsgvVzmu8C
	 roCpeZ5xoJicnX4+fmqi52WRrzpf4KyN7ERzrsUrMVm7CdSgpwnXDlIr+o04hkp1Gr1+7
	 2CE1teUctarbMuYoJYUOrZb8s1MD2Ik0GgvTRz9121kra2D5OltBdVUOTKqim6LwGOkvo
	 CGN3HXUsMhAqWsH/t/zbD6KzCG0WryO9Qhz9tDM8xzCntBbK9f4O/2HxXhGIe4TP76g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D7Q7R2io;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7776360A2627
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 14:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7776360A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D7Q7R2io
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-86156cf8a7eso1473399a34.1
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 06:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795010980; x=1795615780; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BhI9NvyCgtOZtuaslrAqMXx6Ds5DSmZ6/JAKnGkqXCU=;
        b=D7Q7R2ioolNlOqkHOMmCmgYJugv+9RIyIrdghZ4WbG4sWvx+OjE4Yd+UEoQ4Zs0h6g
         mlRSvlyXr8lRNf8nvEnAHPOftraDFhiZsw7rjprV6d5kC9TFxUvBbOwBNj9viXW6FSbx
         hQKnhPJs4pKUJwFLI19DnSy5+zxBdq3ijnKIivDYeAZaa67W7IpHTrjbJlP1AkiF9u7P
         T4n9vrt/RJYhhi0+ndHof7y2UBd/F/MSARkDslMt3xAPyotgr6N96YuHgXMECEn1Kvat
         Pfqz1kFAOZCR3vbtKl+QcKXPIdhyMmfvAKiAlfLl+9bjxZrFkKYxbCnxPe3KrqLGxsUi
         Fn+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795010980; x=1795615780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BhI9NvyCgtOZtuaslrAqMXx6Ds5DSmZ6/JAKnGkqXCU=;
        b=owXPD6bLqH9tQV9YCqpUCvNXVPZL7iahPEgI1PeKPhtiDI6Bv7bjEp8YPhy3MeBZXI
         itCW0YSwvlHjAGDuZmhG+0ndNsOvTBsbP2ZFpTs44RM2WTP8QpT1ENLjdos4KBYci+DN
         JziCuyA6iNcmTr4xwFOWlR62Qffe4MIDXMuRJJ8Ua+jaumb/nE9Y5uHu76PS4L6s2KvP
         UI2r28zzKqEGE24fhdAEqSil/imkLrEsfaWJqdmWaqm9oU6HrQaEIADELE8eeuQ4rMNA
         GJ7gVpaps975JhSv5lRW6Yq7fTqYPc8Wfpv4q9e3inzy+EIUGOCzGJ+fF4qSOer4KPY1
         kO2w==
X-Forwarded-Encrypted: i=1; AL+hErGHIwSgdzJsr6twSHlfuEm7Al71dp39PBH9rGi4crpNShrLGNc1InW7MLDKU1KLY+BINzEwNTrt2p8NDDB55Dg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KG8I5/swkOc2G+BgkVdZBTyFJ6R0NAXXEGP/W0Zsy6nJnLfWU
	z+S9YTvp1hPDL23IUUUBJcBgyB6X8KxRwZlKWVSPmt94Q1sz2RWXD0XO
X-Gm-Gg: AYBFou0ROh3WE/M+oI/XzntsBHgKBaxA0B9+2HcRtMp14bw1bPNf3DkSUhVEaMxvy/k
	0bgxzmxv1H/rFxWvn+8ObaYb+9c6W1oKZQKjKoDRCytCYRptncM4v7FBbmqApuOcDD/HaUcHZ4s
	JMZohtXhuThE/1WwoYzFI4q2g4apBvXic7ZgA9Sx1Kv7wEyFzBHWE79kISyRVn0xQOhOHw7y14n
	1Thngfs5fPcRtR9AmpJ9GCmLMD7va0IRIBLg+P4R5w3zSt0RAUAXv3Ftz/JFT4JeHLxypXBsRP4
	QekhRYMsWsiQY84UmzZ/2hm0DZtaD3MGi6ZeKbFA9LP2QRRYf6nBFHxXKQdn/CKSMFI+gR1IUPy
	dIBLkWmpd26CvmJIH7dtjBXvAHFUztpZJpwB2C9e7g2U/Oz3p4NGOVI7qC203/zhjAmUvj5RSeO
	+2+LczuUhWrjot35tpvVXO6DAc8SgWbJfrXBVY4HByspzSsO6fyTnJtry95A8Dp/ne+zw7ZiExE
	FbXpvPToWUXF35ykfqSWCyLMBUikhfR9+kgtoMncoLfQ5gAE1lgrvb6xiQ18sfVnPRUFggqvxYB
	n5Z+KP2DeKrUWxbnRepVOkfrGQ==
X-Received: by 2002:a05:6830:680d:b0:845:8d86:9f81 with SMTP id 46e09a7af769-862f0832679mr1678535a34.6.1795010980265;
        Wed, 18 Nov 2026 06:09:40 -0800 (PST)
Received: from localhost ([2a03:2880:30ff:7::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f021295csm2160757a34.15.2026.11.18.06.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:09:39 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Wed, 18 Nov 2026 06:08:03 -0800
Subject: [PATCH net-next v5 1/6] psp: support rx rekey operation
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
Message-Id: <20261118-psp-v5-1-b9ec840e0296@gmail.com>
References: <20261118-psp-v5-0-b9ec840e0296@gmail.com>
In-Reply-To: <20261118-psp-v5-0-b9ec840e0296@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: Daniel Zahka <daniel.zahka@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Willem de Bruijn <willemb@google.com>
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

Reviewed-by: Willem de Bruijn <willemb@google.com>
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
2.52.1

