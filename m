Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4256B4C753A
	for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 23:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789513911; cv=none; b=RKQ1cedskBt3i3HS05YVvTChEeeiHzsBQqII17qoXVXA+wrCUsrMjM1gYDkra5fy3HyqWtw0rhcstCcbPQrI4ylvfv9a8cI3+aH+ZVyBGesJH8fRqcGqj6fycfsFijL7RENeQsirqupXCYrCLPEsgJpscaynPy1dVVntjah7vrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789513911; c=relaxed/simple;
	bh=xzj5JrRuqTHk4w5P83m1fBmEhky7Q1Rt52JCaIt8jAc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tQ9ZNmU9f20aKRryJxNfdIkC79eu0jJi8iojf3+RhqmSUs0ok5XjVUs9qppf94gW5H+RkgrI6ddOqfP1kJN70zmdZ4wfsYiDSKA43e0mvjFjY5eqPnNcFh6M1JwyTE4YBEAp0e2r7VIqcs7on0b/KQcKyjkDTgRj6ZqO6GacJAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D40axnn7; arc=none smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D40axnn7"
Received: by mail-oo2-f40.google.com with SMTP id 006d021491bc7-6b1ae7089c0so225063eaf.0
        for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 16:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789513909; x=1790118709; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t5Dyg4FJfrbU72mUF+76bVoG1ydsA+8WdETFK/WQ+0Q=;
        b=D40axnn7QYqyz0kopw4Uevs/zqqRWx3ZCOWebqGJbHiVauQm8wp2zvP7fXsJNHKSyy
         HWWtoUparUZg6qJ6TFIqNDdDMae8/Ko8B+m/2W7EMjZ3BX+l+3I/ApOi6UG36VlTGOY7
         Oy6M8S1fDyqWHahpWChjy7+2BZxvmTL4/iMQ+dWmqW1vy6v2NZuzLSDSZey2no8AlxtU
         gQGPnqpLE5fgXTvgUVxY7kfitVaEcoYsSRBaSvQ/lsOW8IxuzeCVuc9sedZUZz3SqsK3
         j/QsYJ4f/Xap2VTdrGRkqjlib67GfOWFfm5qvlC1pR+9qkEC3jHszKKtwV6oXAstbeGo
         Gmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789513909; x=1790118709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t5Dyg4FJfrbU72mUF+76bVoG1ydsA+8WdETFK/WQ+0Q=;
        b=MMqeAmsDoSNWRIgbfzRg9TCpyEiJLxzRO0mTNa0Pl3ExQM2XnGL5CsKyFUb76C+tym
         V7dfliD8toiGndUTqGpNgBa5uVGj50dE01LI4SEhjssWFhTbkXztP8t1naq/GZPJrQGP
         gwDhyE4TRhQsg7+TF/Lby6z7syxBxFjQAuRDM2Dtf9GWigblK4o/rhXpqZD3eQg8eca2
         Chfo+polxiKfiBhxZJnTRyjQMw4Vdee6aPAmTCnm8EMs4XwNa2cK/51HflfEQNjcaG6W
         dVn30T4DoIJpXpDrtGoPbR2CleFCLqmW70QScIsbw/QbnUIYbLU82by1abD31Mh0LRDO
         YSNg==
X-Forwarded-Encrypted: i=1; AKwUvBzhtFsM/q0E3pVV+uG1oYjTL7NI6r0xI5lqq3FRAM8/8bOV5hajaSVOofrhZBEB/PaerZ0bQvnnucJ67C6PnIg=@vger.kernel.org
X-Gm-Message-State: AFuF++k9L/hVNiOXrBYlhwhQmS3d/o1I1mISQq+D0BKVBYB3TzNtaGOz
	ZKADDJPWjFM6H+RUDYyMTxkYEhjmoLZFRG8IjcQR6g/EZai+Cp2fQZGd
X-Gm-Gg: AYBFou3uQyg+631FZqa0/QggR2mQTP5tAxgtxPaHh2z7qXaiO4dDLTzR6XTdZ26UUCu
	WcdAanfyLuu2M4F6LJ4KmBRCYUKbdERTS2dCfpH3hVG1agMQAzBYlqlDJycneMZOupjgYAIVbmK
	Fzu4MYjzXYFxPfpb/0jT+s1FC2yv+9pSCOHQcMKz3j0ylWpGjPQK5Ubf+9+B+dvfk8RJxeUkt/8
	3MPUwC7OsR8Vpjwe1CpWbytX1NFUYPbTaYG9unq5E8Y/3b8fKiUadM399+iPfDfL3eQOl48Kq2E
	UbubwLPNQM8/9I3Ee3PYkhZyZs1xXZCo/0OEXqQx6N+t7z/z125O8CXDhU249YnkQhuljX7iNNS
	3jEC3l3SYUetAGGi5pUYO+GJZ0e3ritpWps5VLxPatOK4dnO5Se1bOapQ81ChamebrxCif4M1J5
	QfL8b5Z4P7BOhNTWODPTUBb+dVPr3dYsfaeuOirY/0ldXZceUUINNXoXsF6hzLvv/R
X-Received: by 2002:a4a:ee06:0:b0:6b3:f762:4d95 with SMTP id 006d021491bc7-6c7d12d21a8mr637679eaf.7.1789513909152;
        Tue, 15 Sep 2026 16:11:49 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-48427b2b702sm1361980fac.1.2026.09.15.16.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 16:11:48 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Tue, 15 Sep 2026 16:11:37 -0700
Subject: [PATCH net v2 1/2] net: psp: avoid conflicts with skb->decrypted
 and sk_validate_xmit_skb()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-psp-ktls-fix-v2-1-0eedc3b148ec@gmail.com>
References: <20260915-psp-ktls-fix-v2-0-0eedc3b148ec@gmail.com>
In-Reply-To: <20260915-psp-ktls-fix-v2-0-0eedc3b148ec@gmail.com>
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
sk->sk_validate_xmit_skb().

Make PSP mutually exclusive with TLS ULP, the only other user of either
of these. As other users of skb->decrypted come along, they can be added
to sk_has_decrypt_user(). It would make sense to also assert that
sk->sk_validate_xmit_skb() is also NULL in both of these setup paths for
similar future proofing, but the PSP listener/sk_clone() path is still
broken and it could be seen as a regression to not allow rx assoc to run
on a child of a listener socket with PSP tx assoc state.

Include all TCP ULPs in the sk_has_decrypt_user() check, even though TLS
is the only one that conflicts with PSP via the decrypted bit. This is
intentional because PSP was not designed to be used with ULPs. It is
best to close off surface area that may make bugs reachable, until
someone wishes to design and test an actual user of PSP with ULPs.

Fixes: 6b46ca260e22 ("net: psp: add socket security association code")
Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 include/net/sock.h | 2 ++
 net/core/sock.c    | 7 +++++++
 net/ipv4/tcp_ulp.c | 4 ++++
 net/psp/psp_sock.c | 4 ++++
 4 files changed, 17 insertions(+)

diff --git a/include/net/sock.h b/include/net/sock.h
index 51185222aac2..60ea55dc1885 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -2312,6 +2312,8 @@ static inline void sk_gso_disable(struct sock *sk)
 	sk->sk_route_caps &= ~NETIF_F_GSO_MASK;
 }
 
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
index 2aa442128630..b58045df101e 100644
--- a/net/ipv4/tcp_ulp.c
+++ b/net/ipv4/tcp_ulp.c
@@ -136,6 +136,10 @@ static int __tcp_set_ulp(struct sock *sk, const struct tcp_ulp_ops *ulp_ops)
 	if (icsk->icsk_ulp_ops)
 		goto out_err;
 
+	err = -EINVAL;
+	if (sk_has_decrypt_user(sk))
+		goto out_err;
+
 	if (sk->sk_socket)
 		clear_bit(SOCK_SUPPORT_ZC, &sk->sk_socket->flags);
 
diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
index 1a2a6b7516b0..e9b53eedf8db 100644
--- a/net/psp/psp_sock.c
+++ b/net/psp/psp_sock.c
@@ -143,6 +143,10 @@ int psp_sock_assoc_set_rx(struct sock *sk, struct psp_assoc *pas,
 		NL_SET_ERR_MSG(extack, "Socket already has PSP state");
 		err = -EBUSY;
 		goto exit_unlock;
+	} else if (sk_has_decrypt_user(sk)) {
+		NL_SET_ERR_MSG(extack, "Socket has incompatible state");
+		err = -EINVAL;
+		goto exit_unlock;
 	}
 
 	refcount_inc(&pas->refcnt);

-- 
2.52.0

