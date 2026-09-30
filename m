Received: from mail-oi2-f42.google.com (mail-oi2-f42.google.com [74.125.231.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C884BF948
	for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 23:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790812020; cv=none; b=YyyvJW7SrO2VDS1aovq29lQFWBtxEZjeW2BTwkSy86UEzzJv4yYVvhbKOb42doVwDulpNoCLgfyJJTOcql3LcO7vaARyWlxC/mfV16c/c1lANV7q39yT5yzGYDL3idsCELrT6KuhQw/1ABfriefe1LwRMW2OmlpS9cJa+zbjsv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790812020; c=relaxed/simple;
	bh=iblGMahgLZune0cSe5e5OmjGa+556ag6bGB4xcI13V0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J7oYerG7Xhb0m4MuRsKXuCQxIVW/xPaCj59FoyjS4ouExoibsvNI2m0E/a3QGWVpLM7uo2hW5c/abCM/c0J4bXl40+K2NlYFNmJo0tLY1mOx/HaCM8FFvV0wIjzK/iCkzQcG+3ZOv5rI0Msu9KC/4WHQ5tYfjKu6XOKJzJLROY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BpIhlJ5x; arc=none smtp.client-ip=74.125.231.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BpIhlJ5x"
Received: by mail-oi2-f42.google.com with SMTP id 5614622812f47-4e789152a79so2533911b6e.2
        for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 16:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790812017; x=1791416817; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0j17oIRuAGUkTjUjCIFdQDlJWq8HxpJZyTfiOjsPwXU=;
        b=BpIhlJ5xP2y0imDxf5FITGPFXXIaKjNgIwPtITgSurTNLwuyMHaDYdiSzjzcKL6Nab
         XrH2gyxMdT9POEvMKFbvRfjxkmdAUoGAuFR01bqsjuPow3QGeRTNE6AW6vz9BtQhLhbe
         m2pvF1y+YAL9mGLNd/E6chXkO82aF8zVKOlt1653Wujf2EGro0gkBGWKr7Tjaxx6WIT2
         o5tRrDsOHY1PiuO94YE3815/WyldVf2Jd/3tO2u8lCMEREiivYRIc02aZX65EwkYJlCg
         2Q6fmne4LBEISIG7SnhYBRLi8aA5uL9TDcLSeYXDeuEJ1sUBjQeMtwIFhdjYoPyToos0
         i31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790812017; x=1791416817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0j17oIRuAGUkTjUjCIFdQDlJWq8HxpJZyTfiOjsPwXU=;
        b=FG4efJ6eD/KiuE3HaENEL+QaBGdUQG0DjEYjbsmWLya/XaZjoRBv/E5eQIxpgTLy13
         w8fA80xq42T+p2B8m4ntJ9X4755k/LUz4CyFfP7g4aUnuZWmxp+sFOWQdnimilox+PzC
         cErEvoXNLXe4hOGTdRJ9QhtXrdjwHGXxUGv2VGRMdjF2KyGNYbToQmiC2ffS+Z1Pmyj7
         vKUvcPZx8y763h5rZ+94JOc1WIG5Al0K3AlQMy8x6kUP9VQnJfawSAbjBEBTIo/WxrRm
         3lYhiDrX9U9/HAV/9+hPWD8DqF8Xa/uH0ZkueHDAQKaPHJ4cNw8SqVwt4OXTexjGEssk
         SPFg==
X-Forwarded-Encrypted: i=1; AKwUvBwnITPjtLN01sU432m7/Evau2BlCUhXV7NhNkn0sZQ/SSSqiyyqiqWVveHNz+up605M0OvgQvrkZfqZ67ejkAE=@vger.kernel.org
X-Gm-Message-State: AFuF++le8eGIJFssDNRPuA09j4GeH5WVrnBBD6ye+hJMUAI9kskRmV7k
	CE6HGyu9o+pEvYlhlBCkQA22Y6bhHYc0NEbgf5um/j+rCsijus0jvkjq
X-Gm-Gg: AYBFou0mDgxWbM5h7Dv5meQIb1ixlv61LrduM056EQH2v/M0bSQiEuPhXscyvexqGUz
	KJMaqwBc3wNy153iAL8iZ0hjErUCaSnQMn9Px0nV7B1XRGgRJIsb0I0gKhL2gZpuh0mhFzfpu1D
	xn3BPUH6V5m8jRhUM59yWFAEh+QJd5lw0YtsKArK2s4dwYamDqjl43fDKZ4M9e4X0SQCtLYr+bN
	bnTtqoVZf/S3KcfYnHArp9ioYkH20GVhn788kv4Y9+7he5v8GO09bBWRwyvlr0jL8tAuK1buJ08
	HqBt5qS6idZzitf4H4ftrA56myKpgEpWGf7XsagdQ+kcfgpKXMLIOyYG2f0+ha9vHlrl/hhKCKV
	Dm2S+asz7eOStOv/9wY3bHImYM57dMm96UjOR7TKuuZc2Wd76N6p4RaaPpDWa7NXcSUA+uAUv+J
	C4JSbJuYxs5/EfpkIBJcT3ltQyg4uHmBPtXAgADnuxRGLzt4ZAuro4fX2neoJ1BHSdRhU=
X-Received: by 2002:a05:6808:1825:b0:4e5:a74e:d6c0 with SMTP id 5614622812f47-4f1ba4fa10emr3448107b6e.64.1790812016621;
        Wed, 30 Sep 2026 16:46:56 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:9::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4f34c58cb6dsm872370b6e.13.2026.09.30.16.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 16:46:55 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Wed, 30 Sep 2026 16:46:47 -0700
Subject: [PATCH net-next v2 2/4] net: psp: require an established
 connection for association setup
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-psp-defeat-v2-2-f266e7447129@gmail.com>
References: <20260930-psp-defeat-v2-0-f266e7447129@gmail.com>
In-Reply-To: <20260930-psp-defeat-v2-0-f266e7447129@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
 Willem de Bruijn <willemb@google.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.13.0

Check sk_state under the socket lock in both the rx-assoc and tx-assoc
handlers, and only allow association setup on sockets in
TCP_ESTABLISHED. Also, fail connect() when PSP assoc state is already
present, and remove the dead PSP MSS adjustment from
tcp_v[46]_connect().

The net effect of this commit is:
1. PSP assoc state can never exist on a listen socket.
2. The upgrade to PSP must be done while the socket is in
   TCP_ESTABLISHED.

This change defeatures behavior that was previously allowed under the
PSP uapi. My justification is:

Nothing useful can be done after association setup on closed or listen
sockets today. Listen sockets could accept a PSP-encrypted TCP SYN, but
the child socket will not inherit any PSP state. On the other side,
establishing PSP state prior to connect() will result in a PSP-encrypted
TCP SYN sent to a listening peer, which in turn has the aforementioned
limitations. That implies that there cannot be any users of this
feature, so it should be safe to remove it from the PSP uapi.

In theory, the check in the tx-assoc path is more restrictive than
necessary. FIN_WAIT1/2, CLOSING, LAST_ACK and CLOSE_WAIT could be
allowed, and the peer would accept PSP-encrypted ACKs in the
post-FIN-sent states, or data in the half-close case, but it is simpler
to disallow those states because they don't fit the upgrade model.

The check in the tx-assoc path fixes a bug in commit 6b46ca260e22 ("net:
psp: add socket security association code") where an unsynchronized
write can be performed on an assoc shared with a timewait socket when
the socket is in TCP_CLOSE after shutdown. This commit is not targeted
at net because its premise of preventing listen sockets from holding
assoc state depends on net-next commit 8cc3aef0cb19 ("tcp: Do not allow
buggy transitions between ehash and lhash2.")

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
v2:
- reject connect() on sockets with PSP assoc state
- drop PSP MSS overhead handling from tcp_v{4,6}_connect()
---
 Documentation/networking/psp.rst |  8 ++++++++
 net/ipv4/tcp_ipv4.c              |  7 +++++--
 net/ipv6/tcp_ipv6.c              |  9 ++++++---
 net/psp/psp_sock.c               | 12 ++++++++++++
 4 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/Documentation/networking/psp.rst b/Documentation/networking/psp.rst
index 4ac09e64e95a..0f9b6b73f244 100644
--- a/Documentation/networking/psp.rst
+++ b/Documentation/networking/psp.rst
@@ -132,6 +132,14 @@ numbers in a way that deletes a prefix of the PSP protected part of
 the TCP stream. If userspace cares to mitigate this type of attack, a
 special "start of PSP" message should be exchanged after ``tx-assoc``.
 
+Upgrade to PSP must be done on established TCP connections.
+``rx-assoc`` and ``tx-assoc`` will return ``-ENOTCONN`` if
+``sk_state`` is not ``TCP_ESTABLISHED``.
+
+The PSP assoc state of a socket is not reset when the connection is
+torn down. ``connect()`` on a socket that has PSP assoc state will
+return ``-EINVAL``.
+
 Rotation notifications
 ----------------------
 
diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
index c107b7e44e5b..410d63d9e5c1 100644
--- a/net/ipv4/tcp_ipv4.c
+++ b/net/ipv4/tcp_ipv4.c
@@ -238,6 +238,9 @@ int tcp_v4_connect(struct sock *sk, struct sockaddr_unsized *uaddr, int addr_len
 	if (usin->sin_family != AF_INET)
 		return -EAFNOSUPPORT;
 
+	if (psp_sk_assoc(sk))
+		return -EINVAL;
+
 	nexthop = daddr = usin->sin_addr.s_addr;
 	inet_opt = rcu_dereference_protected(inet->inet_opt,
 					     lockdep_sock_is_held(sk));
@@ -291,9 +294,9 @@ int tcp_v4_connect(struct sock *sk, struct sockaddr_unsized *uaddr, int addr_len
 	inet->inet_dport = usin->sin_port;
 	sk_daddr_set(sk, daddr);
 
-	inet_csk(sk)->icsk_ext_hdr_len = psp_sk_overhead(sk);
+	inet_csk(sk)->icsk_ext_hdr_len = 0;
 	if (inet_opt)
-		inet_csk(sk)->icsk_ext_hdr_len += inet_opt->opt.optlen;
+		inet_csk(sk)->icsk_ext_hdr_len = inet_opt->opt.optlen;
 
 	tp->rx_opt.mss_clamp = TCP_MSS_DEFAULT;
 
diff --git a/net/ipv6/tcp_ipv6.c b/net/ipv6/tcp_ipv6.c
index afb4d8e9fa67..e006a30360ea 100644
--- a/net/ipv6/tcp_ipv6.c
+++ b/net/ipv6/tcp_ipv6.c
@@ -153,6 +153,9 @@ static int tcp_v6_connect(struct sock *sk, struct sockaddr_unsized *uaddr,
 	if (usin->sin6_family != AF_INET6)
 		return -EAFNOSUPPORT;
 
+	if (psp_sk_assoc(sk))
+		return -EINVAL;
+
 	fl6 = &inet_sk(sk)->cork.fl.u.ip6;
 	memset(fl6, 0, sizeof(*fl6));
 
@@ -311,10 +314,10 @@ static int tcp_v6_connect(struct sock *sk, struct sockaddr_unsized *uaddr,
 	sk->sk_gso_type = SKB_GSO_TCPV6;
 	ip6_dst_store(sk, dst, false, false);
 
-	icsk->icsk_ext_hdr_len = psp_sk_overhead(sk);
+	icsk->icsk_ext_hdr_len = 0;
 	if (opt)
-		icsk->icsk_ext_hdr_len += opt->opt_flen +
-					  opt->opt_nflen;
+		icsk->icsk_ext_hdr_len = opt->opt_flen +
+					 opt->opt_nflen;
 
 	tp->rx_opt.mss_clamp = IPV6_MIN_MTU - sizeof(struct tcphdr) - sizeof(struct ipv6hdr);
 
diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
index a9cfeebe4ba1..a6b1c42dd626 100644
--- a/net/psp/psp_sock.c
+++ b/net/psp/psp_sock.c
@@ -159,6 +159,12 @@ int psp_sock_assoc_set_rx(struct sock *sk, struct psp_assoc *pas,
 
 	lock_sock(sk);
 
+	if (sk->sk_state != TCP_ESTABLISHED) {
+		NL_SET_ERR_MSG(extack, "Socket must be in established state");
+		err = -ENOTCONN;
+		goto exit_unlock;
+	}
+
 	if (psp_sk_assoc(sk)) {
 		NL_SET_ERR_MSG(extack, "Socket already has PSP state");
 		err = -EBUSY;
@@ -252,6 +258,12 @@ int psp_sock_assoc_set_tx(struct sock *sk, struct psp_dev *psd,
 
 	lock_sock(sk);
 
+	if (sk->sk_state != TCP_ESTABLISHED) {
+		NL_SET_ERR_MSG(extack, "Socket must be in established state");
+		err = -ENOTCONN;
+		goto exit_unlock;
+	}
+
 	pas = psp_sk_assoc(sk);
 	if (!pas) {
 		NL_SET_ERR_MSG(extack, "Socket has no Rx key");

-- 
2.52.0

