Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA4D423A80
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Feb 2026 15:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770218411; cv=none; b=GVjEUwSO2+QYk8X2y+7xL8NElrpGr70NPGDdf8LhJMHtlKZJTq0yzCpa09AuoJe2eOe3KcrfTo4AAKI2ZIShCMOdfzcgEzWlPQLadjr77IdSdOOmK+cdK+n4psaaemN+SjvlAUrPBPuxiaiXuIfLFECIOwUkoSpyvRaf1i85934=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770218411; c=relaxed/simple;
	bh=O7q+/ocoPKxpBqhj5gve6uGx9W66E5Yd2InVodGU6/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J0hsv2A7mFAidg5Bdl2VVndu8NQTX4QBPQfQHHEhcZqp8lz9lE49/sbc5RWjZY5lhz7ZRaH5fT1UWoQL+cucAvV4M3zC/pVZg2lr4mQ/S1CNdYiPtAW4NPfWZbAqZ5LIOAR9Mh+IBNZGp3o441xd+wOl9ZqNhEwehl2n/3Yam7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KYi7SXQ9; arc=none smtp.client-ip=209.85.222.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KYi7SXQ9"
Received: by mail-qk1-f193.google.com with SMTP id af79cd13be357-8c710439535so553076385a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Feb 2026 07:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770218410; x=1770823210; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EoAu+Vz+Fjbs8dvMYtpoxIVXzmZB3ySWB8LK5IhrZLo=;
        b=KYi7SXQ9vkSuw4xbn4zoHf2klW9tG2eiHr3cEZ1MhI8BwzzHMkxaOPCyf3fSPUHzSr
         dPyjGY7Tl7vhjz3YL5Qp42JIhgNd2IqFWPK0acCCF994tlxy3AZvwxNFv6TmOClSewED
         CRMlXJodAoY9Cw+MB8OHvyGYLqnFEPEBbw4wrrOMhF6Yjg9IcBkiiIBZMWvnMTL9RsZD
         ye8bQx3ACHdAIKJCmAvgIRYOJ3G6cMrKokJcEnD/yDkBWDmzniXGCYfuqYJXaakwgFxz
         tys+1euKmwRag02ZhBEhgUZjI6AtJ863ma6Mc351/5IUMTX+sTyRsNeHQg0+S5qgDqOz
         bQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770218410; x=1770823210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EoAu+Vz+Fjbs8dvMYtpoxIVXzmZB3ySWB8LK5IhrZLo=;
        b=U0Kb4BrJH6rjyDqOSyKJDPYsaR2ct5F0gooKoEI+47akJonkUFXBpd8Rx6t5MNaF+z
         dHuUqXPDlg7xdUryTTUQ0L81iiW7qX2cd04Tk10JSnG/4EA5oeON4zuwTfNpyab3JSQt
         6HYsBshBhDTBOj0uoQz7zHLofgM6/89n5cWlqtGE456WA9hxVpJlXdEttcOcIKuC9poE
         H+sfgEy1OAW9xmq2LpnLE4R5EWqAsPf5Qi1dY/tLQsHj8ep1xi0d/HHHKnVC6dZGlxcD
         frZbh/v/hcgJoCphSi0sWaXPyu0JsuVlot7BRj5nskbu7rJIcAVTN/0RUBb1+CNf3202
         RG5w==
X-Forwarded-Encrypted: i=1; AJvYcCWhf0POt8gFYz8uRHhy0HoBsjqWzxDcX/6BoKzyrsC+PEGq+SAwV03PU0wSx9VUHPS2j2PeQzJ63kFONSlPZrk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8iZBiq93VxkodBC8Sw4vFiApkUjh20KMA96vAzlcncanFjZyu
	jVR0uEuYELBgVHvyeB9GamSzrWyQMpCqQWaB4R+6WNFHgThP3VnY+TER
X-Gm-Gg: AZuq6aJMOy5xPRwMi+TVh7/TdNsOKrgRL4grdotiqFj+vVFMa5p3ezPOB0C5hZHu78g
	ePJYT80T3Vqi/31cUotxhjw0vpYcGuuXFT1ejYvAakBvlGMJDhOK97NV0C6RhK+83RRH2ZzJPHr
	QD0E+KldwgECpwiJEMl5CsTRb6ABr44ts9mZD7HtENancSiEadimSZOt0Kyhj1sSXkfNiUITT2F
	rvydYK/Mj0GjYdygB1hWOmT2T9sKOEbxVYZCedhzMURsb1+CJc6j42mFFhWmMAkfm43ISuajnme
	z9jKnyMuR7m7KB+bx12A0MzPO12vz7f0tQ/E6ODcFCkwB6fbXIysiI3hwDviRGfIpr/yl2TT4ga
	FFkRZv91v5vNe6c3DmTiwxHQTuQSMO8oM7sSV8e2ZlRimC6wVA6N5mSPqqzwF/UIARkZqxakcK2
	zG2cQ1F0ff
X-Received: by 2002:a05:620a:3720:b0:8c6:e0c5:7bc0 with SMTP id af79cd13be357-8ca2f85d142mr416777885a.36.1770218410430;
        Wed, 04 Feb 2026 07:20:10 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:51::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649dc4b861csm2599617d50.7.2026.02.04.07.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 07:20:09 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Wed, 04 Feb 2026 07:20:06 -0800
Subject: [PATCH net-next 2/9] psp: move code from psp_sock_assoc_set_tx()
 into helper functions
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-psp-v1-2-5f034e2dfa36@gmail.com>
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

This commit is a pure refactor. Its purpose is to lift code that needs
to be called from both initial tx establishment and tx rekeying into
dedicated functions.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 net/psp/psp_sock.c | 94 +++++++++++++++++++++++++++++++++---------------------
 1 file changed, 58 insertions(+), 36 deletions(-)

diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
index 3a8abd023f99..9b0ecce8350f 100644
--- a/net/psp/psp_sock.c
+++ b/net/psp/psp_sock.c
@@ -187,12 +187,67 @@ static int psp_sock_recv_queue_check(struct sock *sk, struct psp_assoc *pas)
 	return 0;
 }
 
+static int
+psp_pas_set_tx_key(struct psp_dev *psd, struct psp_assoc *pas,
+		   struct psp_key_parsed *key, struct netlink_ext_ack *extack)
+{
+	struct psp_assoc *dummy;
+	int rc;
+
+	/* Pass a fake association to drivers to make sure they don't
+	 * try to store pointers to it. For re-keying we'll need to
+	 * re-allocate the assoc structures.
+	 */
+	dummy = psp_assoc_dummy(pas);
+	if (!dummy)
+		return -ENOMEM;
+
+	memcpy(&dummy->tx, key, sizeof(*key));
+	rc = psp_dev_tx_key_add(psd, dummy, extack);
+	if (rc)
+		goto exit_free_dummy;
+
+	memcpy(pas->drv_data, dummy->drv_data, psd->caps->assoc_drv_spc);
+	memcpy(&pas->tx, key, sizeof(*key));
+
+exit_free_dummy:
+	kfree(dummy);
+	return rc;
+}
+
+static int
+psp_sock_set_tx_key(struct sock *sk, struct psp_dev *psd, struct psp_assoc *pas,
+		    struct psp_key_parsed *key, struct netlink_ext_ack *extack)
+{
+	struct inet_connection_sock *icsk;
+	int err;
+
+	err = psp_sock_recv_queue_check(sk, pas);
+	if (err) {
+		NL_SET_ERR_MSG(extack, "Socket has incompatible segments already in the recv queue");
+		return err;
+	}
+
+	err = psp_pas_set_tx_key(psd, pas, key, extack);
+	if (err)
+		return err;
+
+	WRITE_ONCE(sk->sk_validate_xmit_skb, psp_validate_xmit);
+	tcp_write_collapse_fence(sk);
+	pas->upgrade_seq = tcp_sk(sk)->rcv_nxt;
+
+	icsk = inet_csk(sk);
+	icsk->icsk_ext_hdr_len += psp_sk_overhead(sk);
+	icsk->icsk_sync_mss(sk, icsk->icsk_pmtu_cookie);
+
+	return err;
+}
+
 int psp_sock_assoc_set_tx(struct sock *sk, struct psp_dev *psd,
 			  u32 version, struct psp_key_parsed *key,
 			  struct netlink_ext_ack *extack)
 {
-	struct inet_connection_sock *icsk;
-	struct psp_assoc *pas, *dummy;
+	struct psp_assoc *pas;
 	int err;
 
 	lock_sock(sk);
@@ -220,40 +275,7 @@ int psp_sock_assoc_set_tx(struct sock *sk, struct psp_dev *psd,
 		goto exit_unlock;
 	}
 
-	err = psp_sock_recv_queue_check(sk, pas);
-	if (err) {
-		NL_SET_ERR_MSG(extack, "Socket has incompatible segments already in the recv queue");
-		goto exit_unlock;
-	}
-
-	/* Pass a fake association to drivers to make sure they don't
-	 * try to store pointers to it. For re-keying we'll need to
-	 * re-allocate the assoc structures.
-	 */
-	dummy = psp_assoc_dummy(pas);
-	if (!dummy) {
-		err = -ENOMEM;
-		goto exit_unlock;
-	}
-
-	memcpy(&dummy->tx, key, sizeof(*key));
-	err = psp_dev_tx_key_add(psd, dummy, extack);
-	if (err)
-		goto exit_free_dummy;
-
-	memcpy(pas->drv_data, dummy->drv_data, psd->caps->assoc_drv_spc);
-	memcpy(&pas->tx, key, sizeof(*key));
-
-	WRITE_ONCE(sk->sk_validate_xmit_skb, psp_validate_xmit);
-	tcp_write_collapse_fence(sk);
-	pas->upgrade_seq = tcp_sk(sk)->rcv_nxt;
-
-	icsk = inet_csk(sk);
-	icsk->icsk_ext_hdr_len += psp_sk_overhead(sk);
-	icsk->icsk_sync_mss(sk, icsk->icsk_pmtu_cookie);
-
-exit_free_dummy:
-	kfree(dummy);
+	err = psp_sock_set_tx_key(sk, psd, pas, key, extack);
 exit_unlock:
 	release_sock(sk);
 	return err;

-- 
2.47.3

