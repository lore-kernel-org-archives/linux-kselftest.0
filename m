Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A08542317F
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Feb 2026 15:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770218410; cv=none; b=AHdPsIBSy1lG5g0rV+bixyCat5V6tPlGTvA2h8mdx07WELbzsUa59HvdQ8TO+JN3RJGGZFXSQ5iLFiieoiGwuVU8oQ8NUTn+TjrYtuz/KAb+PLWylyUOtRzsXaCu9+JpCb4x8ZJs1wFaJxsNuUCD+1KCJ7D42iDXQMAUelW5XVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770218410; c=relaxed/simple;
	bh=dxAvJxjujXNZpknLxNF/88cnBbkeW92sUEriI7kP+U4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nevBmHQKOEvf+7BV0KCdz6DYGScVZ0pTIvOU+swTpSxgJTYV5A8WPLUe8FU3OQapgboitUVZFGDRNcCnGsePQ1mRwd5QNBMeMgE6rAXNvHvlRSpQkmKNhklGGgQvPAiQx1XWIvgoYlZwLKEN5ml/WwA0iTxZJ1mk8M95LMU1YRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rt+B6zt2; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rt+B6zt2"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-794e0e933ccso33570287b3.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Feb 2026 07:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770218409; x=1770823209; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LOgDKprzLNk/M5L64iqCKl1A9hUUu7EpJXq39MXIcgA=;
        b=Rt+B6zt2G9xi8H9lbj7wvI2acsXaGax3WpWicJ4EbWZInEgFTTJXTFk7EvXVcig5KW
         uT8rRzMeOHrR0DzOqnoVXMIk8WNSk3skFuAVRw2UkqEHUEjeOgmEILa2+/0/ll7e80an
         mtqQQVYLjWdcII0uyQ/6cobCdiz7ijsfP5qbOGJWU6u4lRMSQGB9H5WbTmog9wqYTxTt
         0toCHrOadZ6F7AI+ZBS+lewN1rbQ/3NMORUc8CwiK8d7fygyPBPOBaAy07sKrgGrsNTw
         tvQnQaNSXuLiXFZ1X2RwEu6urhndGwphgolsUd3Gl20V2GDwZLIOT+BTn8VYjukgZm6/
         n7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770218409; x=1770823209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LOgDKprzLNk/M5L64iqCKl1A9hUUu7EpJXq39MXIcgA=;
        b=qQ08G/Z6T+DzQiJ2bhk/7f/CTHLoceM7C+3KuqnuoS8aurO0Cq2YBR/E9KRsh9tfh3
         oXPz3EU513RhuASeWuQ/EJQy0zxl/uTKuIH+u7glnWf8OCWrpwp+AomJg/FMAM7gBtiX
         AXpyUQPV5Z+bFQuK74r/NzRM5dYLdrKcKFSR/A8Pni5VwmU1Nf/f12JIjHTQSw0cXacr
         9oHQJkYVWxxJ+PB4IJDimxBUkpLtU6mRw8I9P8/9fwEAya49pEYw5e1oxJS3PLC8piEm
         8b7jBiZORLl5QTMGBySr70T25CHnriHhvaTzmOhXscCy4HPdLYwngIjPEV901R3cvxmQ
         4kZg==
X-Forwarded-Encrypted: i=1; AJvYcCUI4IzrFBefeI+F+pph87lUZbmnQYVlj+QaV0vIilmbNsBCAtUAQA3JukvLcc24bNyUGO4b+2E03P90rGbbVk0=@vger.kernel.org
X-Gm-Message-State: AOJu0YymA56eC/WALL959UStrk4kruPCnfhQq24USOilslBXWeOHz2+i
	hiA3I61A7B8qhVj+faLXhqqr59WJ78Uvkan3wBaq5C3f3yBSA5wmayqY
X-Gm-Gg: AZuq6aJGot7v/BOm760pzHK0Ts0NHdDBzTUCr5AdoMwo3yW72678pwHxuqrShE2PP+2
	+/AMCm1oEravIHMjHkcjYqdQWu5vH/Zc6LZcvkbkDO3+sPzHoFQ5F5gAacLU9bHNNJLR2Hf+FNF
	g/FZ/jlOP6gym06ptSfSfjZcxkMenZCQ1zZ2t0J1oPtyW9Wc3HW2KskLwnONWt5o1dPUyNSjEMO
	uSM5PbnUSVw6y8FAqEJihlPCZ1WlEs9Dj2UMKM6RX+8rWeRPO4lgr8Rrh45LLtUUpfd4jXFNlWe
	cUkUlXYaprOuy1JMcKYC3yT1PqlFate6TP20Y2fybKu60301RVRERlY+DhaRTAca16L7XfsOXUl
	5QujVR5k2TT48pZUJBsbxhvMD6xZR2VRFcqBaVD3xvJbD257+R6aDlp1cIWI2R0eC5oDdd6WzbA
	onwYtbTZLI
X-Received: by 2002:a05:690c:6c91:b0:795:10f0:3342 with SMTP id 00721157ae682-79510f050a1mr3384537b3.61.1770218409257;
        Wed, 04 Feb 2026 07:20:09 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:59::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-794fefe86e2sm23023337b3.45.2026.02.04.07.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 07:20:08 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Wed, 04 Feb 2026 07:20:05 -0800
Subject: [PATCH net-next 1/9] psp: support rx rekey operation
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-psp-v1-1-5f034e2dfa36@gmail.com>
References: <20260204-psp-v1-0-5f034e2dfa36@gmail.com>
In-Reply-To: <20260204-psp-v1-0-5f034e2dfa36@gmail.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Donald Hunter <donald.hunter@gmail.com>, Boris Pismenny <borisp@nvidia.com>, 
 Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
 Tariq Toukan <tariqt@nvidia.com>, Mark Bloch <mbloch@nvidia.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Daniel Zahka <daniel.zahka@gmail.com>
X-Mailer: b4 0.13.0

Support rx-assoc netlink operation on an already keyed socket.

Performing an rx-rekey on a socket involves splicing a new psp_assoc
object with newly generated rx state and reused tx state into a
socket's psp_assoc field. Add a 'prev' field to struct psp_assoc,
because we need to be able to accept skb's matching the previous
assoc. For SADB implementations, after copying the tx state of the
assoc, we need to mark the prior assoc as not needing tx key
cleanup. The 'tx_moved' field is introduced to struct psp_assoc for
this purpose.

With this change, skb's matching the current or previous psp_assoc
will be accepted. It might be reasonable to stop accepting skb's on
the previous assoc after seeing skb's with the new assoc and after
waiting a grace period, but that is not implemented for now.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 include/net/psp/functions.h |  6 ++++++
 include/net/psp/types.h     |  3 +++
 net/psp/psp.h               |  6 +++---
 net/psp/psp_nl.c            |  6 +-----
 net/psp/psp_sock.c          | 41 +++++++++++++++++++++++++++--------------
 5 files changed, 40 insertions(+), 22 deletions(-)

diff --git a/include/net/psp/functions.h b/include/net/psp/functions.h
index c5c23a54774e..0f8b16f2f093 100644
--- a/include/net/psp/functions.h
+++ b/include/net/psp/functions.h
@@ -103,6 +103,12 @@ __psp_sk_rx_policy_check(struct sk_buff *skb, struct psp_assoc *pas)
 		return 0;
 	}
 
+	if (pas->prev && psp_pse_matches_pas(pse, pas->prev)) {
+		pas->peer_tx = 1;
+		pas->prev->peer_tx = 1;
+		return 0;
+	}
+
 	if (!pse) {
 		if (!pas->tx.spi ||
 		    (!pas->peer_tx && psp_is_allowed_nondata(skb, pas)))
diff --git a/include/net/psp/types.h b/include/net/psp/types.h
index 25a9096d4e7d..52844ac6f870 100644
--- a/include/net/psp/types.h
+++ b/include/net/psp/types.h
@@ -139,6 +139,9 @@ struct psp_assoc {
 
 	u32 upgrade_seq;
 
+	struct psp_assoc *prev;
+
+	bool tx_moved;
 	struct psp_key_parsed tx;
 	struct psp_key_parsed rx;
 
diff --git a/net/psp/psp.h b/net/psp/psp.h
index 9f19137593a0..b86539d5137a 100644
--- a/net/psp/psp.h
+++ b/net/psp/psp.h
@@ -21,9 +21,9 @@ void psp_nl_notify_dev(struct psp_dev *psd, u32 cmd);
 struct psp_assoc *psp_assoc_create(struct psp_dev *psd);
 struct psp_dev *psp_dev_get_for_sock(struct sock *sk);
 void psp_dev_tx_key_del(struct psp_dev *psd, struct psp_assoc *pas);
-int psp_sock_assoc_set_rx(struct sock *sk, struct psp_assoc *pas,
-			  struct psp_key_parsed *key,
-			  struct netlink_ext_ack *extack);
+void psp_sock_assoc_set_rx(struct sock *sk, struct psp_assoc *pas,
+			   struct psp_key_parsed *key,
+			   struct netlink_ext_ack *extack);
 int psp_sock_assoc_set_tx(struct sock *sk, struct psp_dev *psd,
 			  u32 version, struct psp_key_parsed *key,
 			  struct netlink_ext_ack *extack);
diff --git a/net/psp/psp_nl.c b/net/psp/psp_nl.c
index 6afd7707ec12..a540a1e77694 100644
--- a/net/psp/psp_nl.c
+++ b/net/psp/psp_nl.c
@@ -446,11 +446,7 @@ int psp_nl_rx_assoc_doit(struct sk_buff *skb, struct genl_info *info)
 		goto err_free_pas;
 	}
 
-	err = psp_sock_assoc_set_rx(socket->sk, pas, &key, info->extack);
-	if (err) {
-		NL_SET_BAD_ATTR(info->extack, info->attrs[PSP_A_ASSOC_SOCK_FD]);
-		goto err_free_pas;
-	}
+	psp_sock_assoc_set_rx(socket->sk, pas, &key, info->extack);
 	psp_assoc_put(pas);
 
 	return psp_nl_reply_send(rsp, info);
diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
index f785672b7df6..3a8abd023f99 100644
--- a/net/psp/psp_sock.c
+++ b/net/psp/psp_sock.c
@@ -85,7 +85,7 @@ static int psp_dev_tx_key_add(struct psp_dev *psd, struct psp_assoc *pas,
 
 void psp_dev_tx_key_del(struct psp_dev *psd, struct psp_assoc *pas)
 {
-	if (pas->tx.spi)
+	if (pas->tx.spi && !pas->tx_moved)
 		psd->ops->tx_key_del(psd, pas);
 	list_del(&pas->assocs_list);
 }
@@ -99,6 +99,7 @@ static void psp_assoc_free(struct work_struct *work)
 	if (psd->ops)
 		psp_dev_tx_key_del(psd, pas);
 	mutex_unlock(&psd->lock);
+	psp_assoc_put(pas->prev);
 	psp_dev_put(psd);
 	kfree(pas);
 }
@@ -129,30 +130,42 @@ void psp_sk_assoc_free(struct sock *sk)
 	psp_assoc_put(pas);
 }
 
-int psp_sock_assoc_set_rx(struct sock *sk, struct psp_assoc *pas,
-			  struct psp_key_parsed *key,
-			  struct netlink_ext_ack *extack)
+static void psp_sock_rx_rekey(struct psp_assoc *pas, struct psp_assoc *prev)
 {
-	int err;
+	lockdep_assert_held(&pas->psd->lock);
+
+	pas->peer_tx = prev->peer_tx;
+	pas->upgrade_seq = prev->upgrade_seq;
+
+	/* steal refcount from sk->psp_assoc */
+	pas->prev = prev;
+
+	memcpy(&pas->tx, &prev->tx, sizeof(pas->tx));
+	memcpy(pas->drv_data, prev->drv_data, pas->psd->caps->assoc_drv_spc);
+	prev->tx_moved = true;
+
+	psp_assoc_put(prev->prev);
+	prev->prev = NULL;
+}
+
+void psp_sock_assoc_set_rx(struct sock *sk, struct psp_assoc *pas,
+			   struct psp_key_parsed *key,
+			   struct netlink_ext_ack *extack)
+{
+	struct psp_assoc *prev;
 
 	memcpy(&pas->rx, key, sizeof(*key));
 
 	lock_sock(sk);
 
-	if (psp_sk_assoc(sk)) {
-		NL_SET_ERR_MSG(extack, "Socket already has PSP state");
-		err = -EBUSY;
-		goto exit_unlock;
-	}
+	prev = psp_sk_assoc(sk);
+	if (prev)
+		psp_sock_rx_rekey(pas, prev);
 
 	refcount_inc(&pas->refcnt);
 	rcu_assign_pointer(sk->psp_assoc, pas);
-	err = 0;
 
-exit_unlock:
 	release_sock(sk);
-
-	return err;
 }
 
 static int psp_sock_recv_queue_check(struct sock *sk, struct psp_assoc *pas)

-- 
2.47.3

