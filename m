Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F783387347
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Mar 2026 20:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773519295; cv=none; b=Ex2unmSJercA1ZxTsHicBOqdVufGzQosaPd8A7skzhAA03eR6uZQhjCIuzy6wWoFnKh84b6rNEkhliCYQqVWRZnJjUoxBi742h4VWhzbGj9sGewvRFujuzvTcc4z3bDh4J1MN0s/q88DbdnR/pIX1EaGehHsbIUGBg/eoQ3+LyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773519295; c=relaxed/simple;
	bh=ww0RG9/Q0OVKyskNxv3bbhNoq1jg/FnsAuo6CN8DsUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hahrg6nM+TOujL3FS/8t/DsFK2D1HO+MEB9gjUvdqXLBNHIVdSpcapnoM+Nyh7G7iYjv13Re9b8dwIyLTGX7Z8QZPwU8d3CNAOS0E6VREZTCcWQTAljQf3JVUclGFVebLrX4cwhRcUu+glVEaLuiiHniMZI7TfcMG6rSZQ08b9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AOWC0qXh; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AOWC0qXh"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7d4c383f2fcso2747400a34.0
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Mar 2026 13:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773519292; x=1774124092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSj81+CF0f4yFIE+he2UWBsfbEKSyH1G8KBdb3oc/PY=;
        b=AOWC0qXh+17dY5zV3bR0wBdty1DN4PVf4/qwtPFcaS+XM1Djn8KeVi5gDTy96aBuvq
         xxTCXRv1DcXqaZS1iOaiahU5QeEVdTPt29VzILWyJLSwn4/Of6Hvu9SeiVuibgzSy1UI
         BTkqBFEUPrRKibNQJ8EiR0USjSx1NjQfRAcsYaZor/av3f4jS7NJys2xlYBY4h0bKa3O
         NFewcN29iIS2T+Zwb28EGxipknPGSw0YQ/2R+Ccs7H8fBhzR3WaO3SMRv0kxt7sShsdy
         gfo17VuqIp6fauojTs7NUc3YQLhSfSPecz8x/2LMVqMMBIU+6c6jcx9RS2GgbprsTzYW
         xgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773519292; x=1774124092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LSj81+CF0f4yFIE+he2UWBsfbEKSyH1G8KBdb3oc/PY=;
        b=Bpom/z4VZmk4hdzSrS0oDGhii93jW5xdLSDWplXB9kohFUkaVsaD+pyCdDMHPiRoiB
         8DmfthMfMOaVgx64l7UgiD/t+yVDD+Kr8U8G6JxvN7UP38USB1+Qyp0X4r4U2HQPQfvX
         s2ISEyTeWC30FS6UF4UM4vGwqnv9gcOlw0ZTt/NwEZYVUUS3UCuoxb/GEp0yqW2ffkSN
         dhJhe0TwRq+MtA/eGFNefAxYjgEaeVWnft4qFXFiTWXJx8E/7R/I1N/CUrI2CkAXPZAE
         hvtklv9SberMCjI4ix8TCn6sYRMP/QjD7oMLP4wLb49qRaw3wA+rXxSOqVaKlrGybza+
         OwNw==
X-Forwarded-Encrypted: i=1; AJvYcCVKjHSkSNjfslQxngq/aT17Q8boeZbJi6I57K1AwtQ8DNPVEkQ4HV4I8fWh3nMW8aTH9nGHFgCFrasHIv6BYA0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpffPnK1Dip+HzW2BH06I0SUyVV6uSW4v2Y2eFwvTB83rv3xV7
	AqR0i2vVAW/6/IBH42IbQwXGG2qK4eoWg/w7AActwjhivW7u/yyjWSmd
X-Gm-Gg: ATEYQzwJ9uXtSDV3teUjVxWBS5Tt9A94a7UcbqetHHv2l4FtXhUINuiwAbDSVI4T94b
	5eOOAu4yuUbjq8CFhi23VU3szQY4AyxdT9e9QzrxUeNp8pjmTbaS3VxEUcS3x8CIjnXqexrEjf0
	vDcuvo6g2A1cWn4o9PM/YoTik0kwLioBM4lSRIFTHJf4oN1CqC/kowWtyoYKCIicZ+G80NbuBws
	wEDC+C5mYLSOUiSUnxeC0qyS0suHNcGfysLl2kwNFlxyz8edyPGMMjZGfrJi39Vr5wMRoAlGJfZ
	QFXjmLWy6CC7fGowuhiDywaRE6yVn8i5zDKLwHuiDsvJe5oeZtqjZegmWfFYIjT0w2iyI8CbcHD
	1V3e6g48gV7Hu0L3kMn+Puj/6DDvJHf3rdC3WYsPuE7KIS3bDX8qQptx6aLL/9HlDehXA6PyrL3
	vvltILmbfdqbIjZnF+IXjN4STa4wgujYIApbsZjUG419pOoBBM+KAmbF95t7Spm77+i/fW1e93L
	cHADBAYZBtx7ReSs1bG9xo8Jjhv68B7l+xNI+Qaw0WHIFQtqh0=
X-Received: by 2002:a05:6870:309:b0:40e:95b9:40e6 with SMTP id 586e51a60fabf-417b946c51fmr4109655fac.40.1773519292142;
        Sat, 14 Mar 2026 13:14:52 -0700 (PDT)
Received: from Atwell-Laptop.. (108-212-132-20.lightspeed.irvnca.sbcglobal.net. [108.212.132.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e5e8185sm11914165fac.12.2026.03.14.13.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 13:14:51 -0700 (PDT)
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
Subject: [PATCH net-next v2 07/14] tcp: honor the maximum advertised window after live retraction
Date: Sat, 14 Mar 2026 14:13:41 -0600
Message-ID: <20260314201348.1786972-8-atwellwea@gmail.com>
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

If receive-side accounting retracts the live rwnd below a larger
sender-visible window that was already advertised, allow one in-order
skb within that historical bound to repair its backing and reach the
normal receive path.

Hard receive-memory admission is still enforced through the existing
prune and collapse path. The rescue only changes how data already
inside sender-visible sequence space is classified and backed.

Signed-off-by: Wesley Atwell <atwellwea@gmail.com>
---
 net/ipv4/tcp_input.c | 92 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 86 insertions(+), 6 deletions(-)

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index d76e4e4c0e57..4b9309c37e99 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -5376,24 +5376,86 @@ static void tcp_ofo_queue(struct sock *sk)
 static bool tcp_prune_ofo_queue(struct sock *sk, const struct sk_buff *in_skb);
 static int tcp_prune_queue(struct sock *sk, const struct sk_buff *in_skb);
 
+/* Sequence checks run against the sender-visible receive window before this
+ * point. If later receive-side accounting retracts the live receive window
+ * below the maximum right edge we already advertised, allow one in-order skb
+ * which still fits inside that sender-visible bound to reach the normal
+ * receive queue path.
+ *
+ * Keep receive-memory admission itself on the legacy hard-cap path so prune
+ * and collapse behavior stay aligned with the established retracted-window
+ * handling.
+ */
+static bool tcp_skb_in_retracted_window(const struct tcp_sock *tp,
+					const struct sk_buff *skb)
+{
+	u32 live_end = tp->rcv_nxt + tcp_receive_window(tp);
+	u32 max_end = tp->rcv_nxt + tcp_max_receive_window(tp);
+
+	return after(max_end, live_end) &&
+	       after(TCP_SKB_CB(skb)->end_seq, live_end) &&
+	       !after(TCP_SKB_CB(skb)->end_seq, max_end);
+}
+
 static bool tcp_can_ingest(const struct sock *sk, const struct sk_buff *skb)
 {
-	unsigned int rmem = atomic_read(&sk->sk_rmem_alloc);
+	return tcp_rmem_used(sk) <= READ_ONCE(sk->sk_rcvbuf);
+}
+
+/* Caller already established that @skb extends into the retracted-but-still-
+ * valid sender-visible window. For in-order progress, regrow sk_rcvbuf before
+ * falling into prune/forced-mem handling.
+ *
+ * This path intentionally repairs backing for one in-order skb that is already
+ * within sender-visible sequence space, rather than treating it like ordinary
+ * receive-buffer autotuning.
+ *
+ * Keep this rescue bounded to the span accepted by this skb instead of the
+ * full historical tp->rcv_mwnd_seq. However, never grow below skb->truesize,
+ * because sk_rmem_schedule() still charges hard memory, not sender-visible
+ * window bytes.
+ */
+static void tcp_try_grow_retracted_skb(struct sock *sk,
+				       const struct sk_buff *skb)
+{
+	struct tcp_sock *tp = tcp_sk(sk);
+	int needed = skb->truesize;
+	int span_space;
+	u32 span_win;
+
+	if (TCP_SKB_CB(skb)->seq != tp->rcv_nxt)
+		return;
+
+	span_win = TCP_SKB_CB(skb)->end_seq - tp->rcv_nxt;
+	if (TCP_SKB_CB(skb)->tcp_flags & TCPHDR_FIN)
+		span_win--;
+
+	if (tcp_space_from_rcv_mwnd(tp, span_win, &span_space))
+		needed = max_t(int, needed, span_space);
 
-	return rmem <= sk->sk_rcvbuf;
+	tcp_try_grow_rcvbuf(sk, needed);
 }
 
+/* Sender-visible window rescue does not relax hard receive-memory admission.
+ * If growth did not make room, fall back to the established prune/collapse
+ * path.
+ */
 static int tcp_try_rmem_schedule(struct sock *sk, const struct sk_buff *skb,
 				 unsigned int size)
 {
-	if (!tcp_can_ingest(sk, skb) ||
-	    !sk_rmem_schedule(sk, skb, size)) {
+	bool can_ingest = tcp_can_ingest(sk, skb);
+	bool scheduled = can_ingest && sk_rmem_schedule(sk, skb, size);
+
+	if (!scheduled) {
+		int pruned = tcp_prune_queue(sk, skb);
 
-		if (tcp_prune_queue(sk, skb) < 0)
+		if (pruned < 0)
 			return -1;
 
 		while (!sk_rmem_schedule(sk, skb, size)) {
-			if (!tcp_prune_ofo_queue(sk, skb))
+			bool pruned_ofo = tcp_prune_ofo_queue(sk, skb);
+
+			if (!pruned_ofo)
 				return -1;
 		}
 	}
@@ -5629,6 +5691,7 @@ void tcp_data_ready(struct sock *sk)
 static void tcp_data_queue(struct sock *sk, struct sk_buff *skb)
 {
 	struct tcp_sock *tp = tcp_sk(sk);
+	bool retracted;
 	enum skb_drop_reason reason;
 	bool fragstolen;
 	int eaten;
@@ -5647,6 +5710,7 @@ static void tcp_data_queue(struct sock *sk, struct sk_buff *skb)
 	}
 	tcp_cleanup_skb(skb);
 	__skb_pull(skb, tcp_hdr(skb)->doff * 4);
+	retracted = skb->len && tcp_skb_in_retracted_window(tp, skb);
 
 	reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	tp->rx_opt.dsack = 0;
@@ -5667,6 +5731,9 @@ static void tcp_data_queue(struct sock *sk, struct sk_buff *skb)
 			    (TCP_SKB_CB(skb)->tcp_flags & TCPHDR_FIN))
 				goto queue_and_out;
 
+			if (retracted)
+				goto queue_and_out;
+
 			reason = SKB_DROP_REASON_TCP_ZEROWINDOW;
 			NET_INC_STATS(sock_net(sk), LINUX_MIB_TCPZEROWINDOWDROP);
 			goto out_of_window;
@@ -5674,7 +5741,20 @@ static void tcp_data_queue(struct sock *sk, struct sk_buff *skb)
 
 		/* Ok. In sequence. In window. */
 queue_and_out:
+		if (unlikely(retracted))
+			tcp_try_grow_retracted_skb(sk, skb);
+
 		if (tcp_try_rmem_schedule(sk, skb, skb->truesize)) {
+			/* If the live rwnd collapsed to zero while rescuing an
+			 * skb that still fit in sender-visible sequence space,
+			 * report zero-window rather than generic proto-mem.
+			 */
+			if (unlikely(!tcp_receive_window(tp) && retracted)) {
+				reason = SKB_DROP_REASON_TCP_ZEROWINDOW;
+				NET_INC_STATS(sock_net(sk),
+					      LINUX_MIB_TCPZEROWINDOWDROP);
+				goto out_of_window;
+			}
 			/* TODO: maybe ratelimit these WIN 0 ACK ? */
 			inet_csk(sk)->icsk_ack.pending |=
 					(ICSK_ACK_NOMEM | ICSK_ACK_NOW);
-- 
2.43.0

