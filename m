Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F404385536
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Mar 2026 20:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773519287; cv=none; b=mgOvmL9jtsFCm3hjaNGIH4/bAU8KD7PIrSQrDS5rF/smjdWbUbs32IfvQ5WlCnK3K5vH62oLiXBxK6pfqjsoGzYHNl0CNYeWVgTgy4vuy2uF7USiFwwzUvB36VIRKhL9QXZ9/uRKlOD1CloqLzZgmpnnxPvEmzwAyOmpJATX9zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773519287; c=relaxed/simple;
	bh=kQAayNyz3gm5FbyPOD3uaOhq7RsoX4Ii2Fi5JpOs7C0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jjVrJr/vQS9vkuFZxsFeQLSQ3TGgK/erF1oCdSQUdDeZNU6XFrCx52MYFzSBwdRGrNBek5k5RZPR9ASMH5MMuOGroG7+nqDSUvy2RhfKA6fR/HhvtE19fuBpo6kXTr1ipj0u1diK8JyDBI6Zn5IBWOKN/KxEURVO2VY6z1udPE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XCJ0medY; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XCJ0medY"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-67bb04151dcso1903230eaf.0
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Mar 2026 13:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773519284; x=1774124084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=meSreHlytwJ2+CYWUu8fQhMJhkO7SpENNzkrogjDyzo=;
        b=XCJ0medYSyUSQmiTOLhukeVpDbD+puJ/8hkc4j8T4ppJOy2IPw7pcm7waqXMySbFHv
         +uFn4Wk34rscOGfg/JVVvQVVPhXilbjqcUs4j3xJ688YhRUn9KmlFPMPsweGK4GI52N0
         ktmKT52GwZvwkEhywvrQn8k5PAEOg1IXO9GhpQ1OzAi0njDItQESw7Xij9rdL/qREk9j
         1iJ8HwNk43be2Suv1qAsVN3lnFKoZ1B6D2Pyf1xEQqUGO+aa6W0WoqP6ysItY6Cuw+wc
         kLDfSMbDb9co1eJtGvg7ilaAKeka3N/YtLBVwwmxAZctGg5uR59sbfB8dy2pGX8DdPgb
         ITmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773519284; x=1774124084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=meSreHlytwJ2+CYWUu8fQhMJhkO7SpENNzkrogjDyzo=;
        b=rNq5zUrNRy0ZkJUMx9aynWAsfCd4MTzzH3KSNhX2EwgYXWyKdTG2/9sLncvGYHtKeo
         KDfBsErk/W4uJbDxgofuhY+7BkV81Zf7AKCKODVseN5mXO9svQ1t8w1Fobq4tqnqfy0Z
         UZLym113uqTonNSY46z1epfx64pQTmpVumiSbDZ2csWn4BTztZNFm5HrvUarOZGKf8JD
         zAKOCI5c2X0+2G+kSA1mDH2I83pSUT6pmPz5A8cuOO+Mkmx0mRJJAm62TaWgXCAiA54i
         swYSrqfJiB0OeAkuBGJVAoOnfLjFrokn3ZRFZ+X8HjSu69HznruCVWGIwwOH0iOVh2Im
         dlxA==
X-Forwarded-Encrypted: i=1; AJvYcCXdw5g7fNOucFXn4DO00FBvuvXqz/jbWAUV74luAfxDjIHvaa4Fu5qmBSDZe0EJ6fjv5kGuhg375+A4KqNHXWk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFkXy4j7jfKXTEgAhvc1DbL5QRbhoa8z22fW/VFwtLOPEWzWWm
	LfmkCnL9sRo9Itw0/a4F1Qmk+tt9yL6G3iIZHR6s1/KuTOH38ZKD57mN
X-Gm-Gg: ATEYQzys9VFbZ8hWg0x4y7OnIaCFajUm4YmzLy6PoN3xN1zyuMsuDiKl5wnMMMuXdS9
	Eeq0xyMsbZyy0Rowus0YpOG7Dlt5jdb/ty91six0XVloMJNiaaP0SIjHVKfB3NWjPyy3O++rwRz
	pDv5s9FWGq7+Lub+DZSJfiJl7PQvLTyQG6lVaDCwjTTd4RewZAPiNZbHxu4dgqcBhuoC91aA4ta
	xSI/C6FfXEDm9as/TXV9MyTa5fKTPoSVwG5FEdrI+qgLZ50Ub5RdG9dlFRQ8prGm4bwsy7eJDum
	38a/GzuDdse22LXpz9EXfRIcCEs3WV0XMK/xe+dPdNPQN0kfnhfNtXrEFm3rwNbtOwIffaQDdeD
	yFYbVE1RZOWDqLxZSz8DCe7SpCQNfGQI5vDGCtGdMDm/eAij4pydoWd/z8OX7G4kevaxTMFUgq9
	oWrVdbv2sJB+PUjJoqwH9SZ9y6/+Jl3NMp+P9mgpO/cygsmFTQhjWot3UMmL0v6qeOFm4tA7oaP
	St06X17ATxTUFYW116PRBtSHlpHOxwZ1ttwU80f
X-Received: by 2002:a05:6820:2909:b0:662:fbd6:1849 with SMTP id 006d021491bc7-67bda98cb6dmr4777838eaf.4.1773519284132;
        Sat, 14 Mar 2026 13:14:44 -0700 (PDT)
Received: from Atwell-Laptop.. (108-212-132-20.lightspeed.irvnca.sbcglobal.net. [108.212.132.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e5e8185sm11914165fac.12.2026.03.14.13.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 13:14:43 -0700 (PDT)
From: atwellwea@gmail.com
To: netdev@vger.kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@google.com,
	ncardwell@google.com
Cc: linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	mptcp@lists.linux.dev,
	dsahern@kernel.org,
	horms@kernel.org,
	kuniyu@google.com,
	andrew+netdev@lunn.ch,
	willemdebruijn.kernel@gmail.com,
	jasowang@redhat.com,
	skhan@linuxfoundation.org,
	corbet@lwn.net,
	matttbe@kernel.org,
	martineau@kernel.org,
	geliang@kernel.org,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	0x7f454c46@gmail.com
Subject: [PATCH net-next v2 02/14] tcp: snapshot advertise-time scaling for rcv_wnd
Date: Sat, 14 Mar 2026 14:13:36 -0600
Message-ID: <20260314201348.1786972-3-atwellwea@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260314201348.1786972-1-atwellwea@gmail.com>
References: <20260314201348.1786972-1-atwellwea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wesley Atwell <atwellwea@gmail.com>

Track the scaling basis that was in force when tp->rcv_wnd was last
advertised, and provide helpers to refresh or interpret that snapshot.

Later patches use this live-window basis to preserve sender-visible rwnd
accounting when receive-side memory costs drift after advertisement.

Signed-off-by: Wesley Atwell <atwellwea@gmail.com>
---
 .../networking/net_cachelines/tcp_sock.rst    |  1 +
 include/linux/tcp.h                           |  1 +
 include/net/tcp.h                             | 52 ++++++++++++++++++-
 net/ipv4/tcp.c                                |  1 +
 4 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/Documentation/networking/net_cachelines/tcp_sock.rst b/Documentation/networking/net_cachelines/tcp_sock.rst
index fecf61166a54..09ece1c59c2d 100644
--- a/Documentation/networking/net_cachelines/tcp_sock.rst
+++ b/Documentation/networking/net_cachelines/tcp_sock.rst
@@ -11,6 +11,7 @@ Type                          Name                    fastpath_tx_access  fastpa
 struct inet_connection_sock   inet_conn
 u16                           tcp_header_len          read_mostly         read_mostly         tcp_bound_to_half_wnd,tcp_current_mss(tx);tcp_rcv_established(rx)
 u16                           gso_segs                read_mostly                             tcp_xmit_size_goal
+u8                            rcv_wnd_scaling_ratio   read_write          read_mostly         tcp_set_rcv_wnd,tcp_can_ingest,tcp_repair_set_window,do_tcp_getsockopt
 __be32                        pred_flags              read_write          read_mostly         tcp_select_window(tx);tcp_rcv_established(rx)
 u64                           bytes_received                              read_write          tcp_rcv_nxt_update(rx)
 u32                           segs_in                                     read_write          tcp_v6_rcv(rx)
diff --git a/include/linux/tcp.h b/include/linux/tcp.h
index 6982f10e826b..2ace563d59d6 100644
--- a/include/linux/tcp.h
+++ b/include/linux/tcp.h
@@ -297,6 +297,7 @@ struct tcp_sock {
 		est_ecnfield:2,/* ECN field for AccECN delivered estimates */
 		accecn_opt_demand:2,/* Demand AccECN option for n next ACKs */
 		prev_ecnfield:2; /* ECN bits from the previous segment */
+	u8	rcv_wnd_scaling_ratio; /* 0 if unknown, else tp->rcv_wnd basis */
 	__be32	pred_flags;
 	u64	tcp_clock_cache; /* cache last tcp_clock_ns() (see tcp_mstamp_refresh()) */
 	u64	tcp_mstamp;	/* most recent packet received/sent */
diff --git a/include/net/tcp.h b/include/net/tcp.h
index 3a0060599afe..6fa7cdb0979e 100644
--- a/include/net/tcp.h
+++ b/include/net/tcp.h
@@ -1741,6 +1741,31 @@ static inline int tcp_space_from_win(const struct sock *sk, int win)
 	return __tcp_space_from_win(tcp_sk(sk)->scaling_ratio, win);
 }
 
+static inline bool tcp_wnd_snapshot_valid(u8 scaling_ratio)
+{
+	return scaling_ratio != 0;
+}
+
+static inline bool tcp_space_from_wnd_snapshot(u8 scaling_ratio, int win,
+					       int *space)
+{
+	if (!tcp_wnd_snapshot_valid(scaling_ratio))
+		return false;
+
+	*space = __tcp_space_from_win(scaling_ratio, win);
+	return true;
+}
+
+/* Rebuild hard receive-memory units for data already covered by tp->rcv_wnd if
+ * the advertise-time basis is known.
+ */
+static inline bool tcp_space_from_rcv_wnd(const struct tcp_sock *tp, int win,
+					  int *space)
+{
+	return tcp_space_from_wnd_snapshot(tp->rcv_wnd_scaling_ratio, win,
+					   space);
+}
+
 /* Assume a 50% default for skb->len/skb->truesize ratio.
  * This may be adjusted later in tcp_measure_rcv_mss().
  */
@@ -1748,7 +1773,32 @@ static inline int tcp_space_from_win(const struct sock *sk, int win)
 
 static inline void tcp_scaling_ratio_init(struct sock *sk)
 {
-	tcp_sk(sk)->scaling_ratio = TCP_DEFAULT_SCALING_RATIO;
+	struct tcp_sock *tp = tcp_sk(sk);
+
+	tp->scaling_ratio = TCP_DEFAULT_SCALING_RATIO;
+	tp->rcv_wnd_scaling_ratio = TCP_DEFAULT_SCALING_RATIO;
+}
+
+/* tp->rcv_wnd is paired with the scaling_ratio that was in force when that
+ * window was last advertised. Callers can leave a zero snapshot when the
+ * advertise-time basis is unknown and refresh the pair on the next local
+ * window update.
+ */
+static inline void tcp_set_rcv_wnd_snapshot(struct tcp_sock *tp, u32 win,
+					    u8 scaling_ratio)
+{
+	tp->rcv_wnd = win;
+	tp->rcv_wnd_scaling_ratio = scaling_ratio;
+}
+
+static inline void tcp_set_rcv_wnd(struct tcp_sock *tp, u32 win)
+{
+	tcp_set_rcv_wnd_snapshot(tp, win, tp->scaling_ratio);
+}
+
+static inline void tcp_set_rcv_wnd_unknown(struct tcp_sock *tp, u32 win)
+{
+	tcp_set_rcv_wnd_snapshot(tp, win, 0);
 }
 
 /* TCP receive-side accounting reuses sk_rcvbuf as both a hard memory limit
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 516087c622ad..0383ee8d3b78 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -5275,6 +5275,7 @@ static void __init tcp_struct_check(void)
 	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_txrx, received_ce);
 	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_txrx, received_ecn_bytes);
 	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_txrx, app_limited);
+	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_txrx, rcv_wnd_scaling_ratio);
 	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_txrx, rcv_wnd);
 	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_txrx, rcv_mwnd_seq);
 	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_txrx, rcv_tstamp);
-- 
2.43.0

