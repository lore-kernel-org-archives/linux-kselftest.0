Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3481DED5C
	for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 23:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789083982; cv=none; b=QlrekfDsSiL7CglZTMjuuxqpEgYlBCKNg2p9fVD+uNZ73H6Zfy9+8u4ZLMUtzo5aMd9BQQfx22ZwkmQPBkXqBH7NClxgeyjqgvN5ckV39u5IYgLPAecKYCIW+hnpicvsbAng43KzOvs89EgUiGClnTLbIwB8m3RBJ3vAF0QOsK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789083982; c=relaxed/simple;
	bh=M6jIXaEoyrgc6/WiURsN+U8IhrrnZ9zZFg+Oj7F70yQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KOUJbTpQstBXvLzXXJd9LBE8NdVhActoF5OrH706cQKYxE4NAqTbULf3/sFoVjBQLRr83umClu+nDuSc9lwdSS7wraDZp178UL1yDiliV9JHYsxD8rf000LIATjiFerf2uXcFedS2ShQ0tWZ8/PI2SyBIwtS4uHNY8VNeduadZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h2zxLEdh; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h2zxLEdh"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7f84a55cc06so318521a34.2
        for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 16:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789083980; x=1789688780; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kbyz7e2Zj6Paq1U1ORPGnZB2czddhzmepRdeHB+cyyk=;
        b=h2zxLEdh2X+9pBLiJGXLrsF7DuPx0SdMZj202+AUvu8KfSElB9fEgE145Bxigj4AaA
         u1LgPi24WJzLIPC3Ul4quk3T72yvOtIRcand7Ete+47fyfL//NNTyMG3PXMj/iqH4+Ny
         QNkg2Mhy7ddOPMQ0mBNHQVU4UY1ipAIiXRL+GNmwUvf23+NQm6ZL2AAITHbxx0/6egQN
         6gq/FI7XVpOyAQS+//I6tkbUIJ6SRTYa6fUodc/SD8sHgCYev3YBRNMA3q39ZK04nnYu
         n0UGk+hwJgpsllh4x8XRiPAePsH8aZ83TNZMX8lYIjm2Bl2L0f0Api6sCwAHuAmN3TN2
         mClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789083980; x=1789688780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kbyz7e2Zj6Paq1U1ORPGnZB2czddhzmepRdeHB+cyyk=;
        b=TG0tHrQV+DNOwQ3TcSNAbH8B7F/+7H4rMJQx7DMACuclF+9K1Klh74Ap8QCdLlsZYE
         Lhjwce2jsW7sdi//MiWCwVabxERor4TCETveJ4Q+Y5FIvOWBvhT5C/f1zqI8TdEnK5d2
         ZbjKURICOK+PoEh45gD7rYt5BaSezMhfUDVVRTiZ23tts8Sm3K3pG3EiiL1CLH6bxArD
         S81BzCpxnmVTA7rowsOowLyLehnVWhpkJ52EUt52KG+lxUANqf6Z+eGs/jO9ctcjyWAW
         SXCBkAxC6qazajuvQ8l48xsWjNRARKJYx4jPD2WMfGvM3+yiOYZDg/vYb03cqwNY+K0P
         91ow==
X-Forwarded-Encrypted: i=1; AKwUvBwjHHE6v7qZpSJuKRCNtsOpXmcXRxGCAtX6VM49Y1FLSRByjpy+JKqSsUDLWBaY6+FeR+B3QxeA4Vbx81kaMEY=@vger.kernel.org
X-Gm-Message-State: AFuF++mwG2PQYPDJXgAAi5z5Fg1SgGT0NW/O/KD0HLNM3mbf1eU/huoI
	+ohb/McdDmWATFPqSlU77wIqW2n02rZxTlsxlOPcJnaYwXEFB7p94oYQ
X-Gm-Gg: AYBFou1FJG9qBAeOicfxUv84Rc46V4s2ipNM3II7ggVXLtn0mgSyhOQQ1MCYRqxivAR
	VgJMBMSpGp6dRqsxQNa9D1TVgpxTE/EyRJZVWtF3y21LNrthoKhg8uyDNdBPwfwPb7aZh7+rVr/
	qp5UybVuLpYrw9NZ+EeO3iwZmasclSjiK563n6TVLmnZrC2ivnyXEaobId2qwG253cPLkpe3yPw
	5qaUTNKXfcupdtkhIB1xg52a0EUAY5tZfdRj7D7py5DF2GK9j4kK0M44r6bVT4yO/fpR9fTZ2+R
	H1XfSfUM1AC7NSMPCAyLAvL80gPAs3632tVRVLIGdn9u+Qt0I49YtXeSyRok5+wMEMA2tmmcFWw
	y0ZdUE5ScCrKeRfAfk1ai4bu0P7tsemqj06XiqMa9ZqIAYk7InajtN3dCx6Msw54z85fYWYbyd/
	9T57CzHhFoPxPBEQJYwjThzxPVcaafJFfAlmpksabKTO7g83f9RNdjaWgME30TmwomS5g=
X-Received: by 2002:a05:6830:81cf:b0:7dc:df37:844b with SMTP id 46e09a7af769-803fadd1e9dmr1084870a34.4.1789083979942;
        Thu, 10 Sep 2026 16:46:19 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:1::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f5adf6absm926604a34.6.2026.09.10.16.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:46:19 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Thu, 10 Sep 2026 16:46:04 -0700
Subject: [PATCH net 1/2] net: psp: avoid conflicts with skb->decrypted and
 sk_validate_xmit_skb()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-psp-ktls-fix-v1-1-e3f30aaeca4e@gmail.com>
References: <20260910-psp-ktls-fix-v1-0-e3f30aaeca4e@gmail.com>
In-Reply-To: <20260910-psp-ktls-fix-v1-0-e3f30aaeca4e@gmail.com>
To: Eric Dumazet <edumazet@google.com>, 
 Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.13.0

PSP conflicts with TLS ULP in its usage of both skb->decrypted and
sk->sk_validate_xmit_skb(). Offloaded TLS conflicts on both sides in
both Tx and Rx. SW TLS could mistake skb->decrypted in the Rx path set
by a PSP device as being a decrypted TLS record.

Prevent PSP from being used with other socket features that use
skb->decrypted or sk->sk_validate_xmit_skb().

For now, we include all TCP ULPs in the sk_has_decrypt_user() check,
even though TLS is the only one that conflicts with PSP via the
decrypted bit. This is intentional because PSP was not designed to be
used with ULPs. It is best to close off surface area that may make bugs
reachable, until someone wishes to design and test an actual user of PSP
with ULPs.

Fixes: 6b46ca260e22 ("net: psp: add socket security association code")
Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 include/net/sock.h | 11 +++++++++++
 net/core/sock.c    |  7 +++++++
 net/ipv4/tcp_ulp.c |  4 ++++
 net/psp/psp_sock.c |  4 ++++
 4 files changed, 26 insertions(+)

diff --git a/include/net/sock.h b/include/net/sock.h
index 51185222aac2..ba5e5092f192 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -2312,6 +2312,17 @@ static inline void sk_gso_disable(struct sock *sk)
 	sk->sk_route_caps &= ~NETIF_F_GSO_MASK;
 }
 
+static inline bool sk_has_validate_xmit_skb(const struct sock *sk)
+{
+#ifdef CONFIG_SOCK_VALIDATE_XMIT
+	return !!sk->sk_validate_xmit_skb;
+#else
+	return false;
+#endif
+}
+
+bool sk_has_decrypt_user(const struct sock *sk);
+
 static inline int skb_do_copy_data_nocache(struct sock *sk, struct sk_buff *skb,
 					   struct iov_iter *from, char *to,
 					   int copy, int offset)
diff --git a/net/core/sock.c b/net/core/sock.c
index fa60b7494c58..9489d9c47949 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -142,6 +142,7 @@
 
 #include <trace/events/sock.h>
 
+#include <net/psp.h>
 #include <net/tcp.h>
 #include <net/busy_poll.h>
 #include <net/phonet/phonet.h>
@@ -2670,6 +2671,12 @@ void sk_setup_caps(struct sock *sk, struct dst_entry *dst)
 }
 EXPORT_SYMBOL_GPL(sk_setup_caps);
 
+bool sk_has_decrypt_user(const struct sock *sk)
+{
+	return psp_sk_assoc(sk) ||
+	       (sk_is_inet(sk) && inet_csk_has_ulp(sk)); /* for tls */
+}
+
 /*
  *	Simple resource managers for sockets.
  */
diff --git a/net/ipv4/tcp_ulp.c b/net/ipv4/tcp_ulp.c
index 2aa442128630..f3e0c9d379bb 100644
--- a/net/ipv4/tcp_ulp.c
+++ b/net/ipv4/tcp_ulp.c
@@ -136,6 +136,10 @@ static int __tcp_set_ulp(struct sock *sk, const struct tcp_ulp_ops *ulp_ops)
 	if (icsk->icsk_ulp_ops)
 		goto out_err;
 
+	err = -EINVAL;
+	if (sk_has_decrypt_user(sk) || sk_has_validate_xmit_skb(sk))
+		goto out_err;
+
 	if (sk->sk_socket)
 		clear_bit(SOCK_SUPPORT_ZC, &sk->sk_socket->flags);
 
diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
index 1a2a6b7516b0..509035617894 100644
--- a/net/psp/psp_sock.c
+++ b/net/psp/psp_sock.c
@@ -143,6 +143,10 @@ int psp_sock_assoc_set_rx(struct sock *sk, struct psp_assoc *pas,
 		NL_SET_ERR_MSG(extack, "Socket already has PSP state");
 		err = -EBUSY;
 		goto exit_unlock;
+	} else if (sk_has_decrypt_user(sk) || sk_has_validate_xmit_skb(sk)) {
+		NL_SET_ERR_MSG(extack, "Socket has incompatible state");
+		err = -EINVAL;
+		goto exit_unlock;
 	}
 
 	refcount_inc(&pas->refcnt);

-- 
2.52.0

