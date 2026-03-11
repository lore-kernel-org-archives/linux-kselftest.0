Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183D53BB9F5
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 07:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773215805; cv=none; b=bacs7ORUhBpOpehfRg6MbXU+5p9yaS9yotKPjZyWilwY2kf8frU4/FhOYw8rJwZEujVMFLAgpR88rkHaEclkiKC8wCr6jlE6zRqQTYY/hahp+p4nEyM4SYjMwd5cw6GLBP5iBdemmaf+eOTs27iivpjAqIxar2xiQYxkV7XtT7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773215805; c=relaxed/simple;
	bh=C939i0d+rKTXWj91cA/6uhlPcNX1BycjNPrjJIyRlB0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aMkhtfLwGpxZJ3wvh+AnxkEBvuMegPJKrMo1wdPHfLrb1BLVqGJx2sPq0jtaVlBql18I6qjrBNRJc7sAd2BOOo+8aP4xHLx7DseR0prdLSVX+eQyqytxs2g56Xf+O4BRsXxTtRUElvb4BdLpkAYMi2+F/PyHZvvAPnJlUwO8tQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kh/S2Ut8; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kh/S2Ut8"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-40429b1d8baso3514584fac.0
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 00:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773215799; x=1773820599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4epqsXquWuAivDGaqjYARTGwK/kOqEMKWTt83y67gTo=;
        b=Kh/S2Ut8Mz3IOrJyUF1u8U1hKxWbezXDQfvjBZZZSRIxPlXeO/7kz+0xvq1bMEiJAe
         lXzcI5udhKCFXJqU2fL1KoH6Jdn0FZiXxgwW39Y5VOznkbwDLALQDwc3P74kEVEYjYq+
         yig8cAAHYZAQ9qcVilzLP9jNYCgVewxw+Yb2TwGYXDOSkqfDkRmwMpg3p/Tfa3pSEe9u
         g7bABRqWYHbWBfa3Hjar5WRpxYmkbhu4XEe3Rvhy/d2yHHE/pxgWgsqKVIWOOYvwEhnl
         AVOMSDCrZpk1GXQMspz5ABATP+Km1F5tyN8Czb/z1EperES+Pbim2ngZgi1MZtlBkUbW
         hTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773215799; x=1773820599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4epqsXquWuAivDGaqjYARTGwK/kOqEMKWTt83y67gTo=;
        b=B0AVEHfq5ynBmGrxLqH29gF0+i9lqG7Whly/o+K4houJA+3A8RdDTSa/FgKXpYymiH
         vt3lYKaTsaC3hY1JolcbCplK99NgY9NFwwo8N2SWUdQwJ9+X35/RyuzUh0JxtXy539NY
         d39daElysnO3AyKsOtUoYqYBakZ8tjzZudKu7afT2/jbJU6RUurgE5ztv1OM4DVnrwuG
         xUotDBv+SaEPi1/DXZkPKiOrs685p693lryWFKSleOLx7tl3bt2ruKywKF6lBAkj0Brc
         LEVMv89GvwD8H+Fjh5wjB+DMh3PuYTxHPXhDu9AF5xOsYjAT8Z7KO0xSyvlKen13yr/r
         uAFA==
X-Forwarded-Encrypted: i=1; AJvYcCVdG91Fcd73DUcvUIVC8xx5f6lF8H0gluaK6iDeNrGZA0PhipnfDxSxkRYdesg85fUGEPnQaMzZhRvZkyR3TOM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1FFMNyw+0C0Z7H+W8OzuBaq3079hbuOZLB+Q1w168MwKgTRDL
	7GUQIeL2c94mCor3iMfnqCcrxzS6fujOtVxzvUPlB8Ftnq39KZErNHMl
X-Gm-Gg: ATEYQzwMBxHKFzDfprWr829S9e0+HHUv31/OagYEwQmAGGckkMPPECin0/NL7WzVQyg
	HyfgrRc8B5n7fEVQ1q855Kx8ObDh/V1s2ulxQkMqsihiyeTa6rFQ8Ib9YwtK6Nef8MA3HJmF7R2
	8b1XSzDKeqwuOCd4W/d3whuqcMDe53mEAe4Xue5qs8hspwegsvK7Ir27vJ2lwMnbRWNChYu7rrn
	dFZV6LxPYFvlr/+2m1IsH8Bq8V3fhcygiFNeX/ePDw+ODrwA7azHAro5GUvB0S9CHVmozUnWIme
	VZKFBM+Ck8/RNom6atMM285lZrWRUp+ZHQmMFuHNJbpBIG9bjFocfZBgkJPRPxWEohwatLpfqa/
	Gavbu7LeLcIVK8GmMWGLJI0AweZGVoUqFbncJLX9+yPscXSe+YhC7RmcxJZGKu+mf/m7qkIsLmc
	jlXkO+Au9qCWsMeG6/Ja5XR6ogtFM6i+cdZFZD47excOwOqbckcuR0dghnCijt7WBGl2fal1802
	70II70RalcSkIuQYm4Hc408fxgEHI4SQPBV1tTMfFF1qZFi
X-Received: by 2002:a05:6870:8e07:b0:3e0:de76:31e5 with SMTP id 586e51a60fabf-4177c8b4e62mr1075613fac.25.1773215798847;
        Wed, 11 Mar 2026 00:56:38 -0700 (PDT)
Received: from localhost.localdomain (108-212-132-20.lightspeed.irvnca.sbcglobal.net. [108.212.132.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e6ae0e3sm1568938fac.16.2026.03.11.00.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 00:56:38 -0700 (PDT)
From: Wesley Atwell <atwellwea@gmail.com>
To: davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@google.com,
	ncardwell@google.com,
	dsahern@kernel.org,
	matttbe@kernel.org,
	martineau@kernel.org,
	netdev@vger.kernel.org,
	mptcp@lists.linux.dev
Cc: kuniyu@google.com,
	horms@kernel.org,
	geliang@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	0x7f454c46@gmail.com,
	linux-doc@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org,
	atwellwea@gmail.com
Subject: [PATCH net 6/7] tcp: expose rmem and backlog accounting in rcvbuf_grow tracepoints
Date: Wed, 11 Mar 2026 01:55:59 -0600
Message-Id: <20260311075600.948413-7-atwellwea@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260311075600.948413-1-atwellwea@gmail.com>
References: <20260311075600.948413-1-atwellwea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The receive-window work now depends on keeping sender-visible rwnd and
hard receive-memory accounting aligned.

Expose the current rmem charge and backlog reservation in the TCP and
MPTCP rcvbuf_grow tracepoints so that later drift between advertised
window and local backing is visible during review and debugging.

Signed-off-by: Wesley Atwell <atwellwea@gmail.com>
---
 include/trace/events/mptcp.h | 11 +++++++----
 include/trace/events/tcp.h   | 12 +++++++-----
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/include/trace/events/mptcp.h b/include/trace/events/mptcp.h
index 269d949b2025..167970e8e0a5 100644
--- a/include/trace/events/mptcp.h
+++ b/include/trace/events/mptcp.h
@@ -199,6 +199,8 @@ TRACE_EVENT(mptcp_rcvbuf_grow,
 		__field(__u32, inq)
 		__field(__u32, space)
 		__field(__u32, ooo_space)
+		__field(__u32, rmem_alloc)
+		__field(__u32, backlog_len)
 		__field(__u32, rcvbuf)
 		__field(__u32, rcv_wnd)
 		__field(__u8, scaling_ratio)
@@ -228,6 +230,8 @@ TRACE_EVENT(mptcp_rcvbuf_grow,
 				     MPTCP_SKB_CB(msk->ooo_last_skb)->end_seq -
 				     msk->ack_seq;
 
+		__entry->rmem_alloc = tcp_rmem_used(sk);
+		__entry->backlog_len = READ_ONCE(msk->backlog_len);
 		__entry->rcvbuf = sk->sk_rcvbuf;
 		__entry->rcv_wnd = atomic64_read(&msk->rcv_wnd_sent) -
 				   msk->ack_seq;
@@ -248,12 +252,11 @@ TRACE_EVENT(mptcp_rcvbuf_grow,
 		__entry->skaddr = sk;
 	),
 
-	TP_printk("time=%u rtt_us=%u copied=%u inq=%u space=%u ooo=%u scaling_ratio=%u "
-		  "rcvbuf=%u rcv_wnd=%u family=%d sport=%hu dport=%hu saddr=%pI4 "
-		  "daddr=%pI4 saddrv6=%pI6c daddrv6=%pI6c skaddr=%p",
+	TP_printk("time=%u rtt_us=%u copied=%u inq=%u space=%u ooo=%u scaling_ratio=%u rmem_alloc=%u backlog_len=%u rcvbuf=%u rcv_wnd=%u family=%d sport=%hu dport=%hu saddr=%pI4 daddr=%pI4 saddrv6=%pI6c daddrv6=%pI6c skaddr=%p",
 		  __entry->time, __entry->rtt_us, __entry->copied,
 		  __entry->inq, __entry->space, __entry->ooo_space,
-		  __entry->scaling_ratio, __entry->rcvbuf, __entry->rcv_wnd,
+		  __entry->scaling_ratio, __entry->rmem_alloc,
+		  __entry->backlog_len, __entry->rcvbuf, __entry->rcv_wnd,
 		  __entry->family, __entry->sport, __entry->dport,
 		  __entry->saddr, __entry->daddr, __entry->saddr_v6,
 		  __entry->daddr_v6, __entry->skaddr)
diff --git a/include/trace/events/tcp.h b/include/trace/events/tcp.h
index f155f95cdb6e..92d0bd6be0ba 100644
--- a/include/trace/events/tcp.h
+++ b/include/trace/events/tcp.h
@@ -217,6 +217,8 @@ TRACE_EVENT(tcp_rcvbuf_grow,
 		__field(__u32, inq)
 		__field(__u32, space)
 		__field(__u32, ooo_space)
+		__field(__u32, rmem_alloc)
+		__field(__u32, backlog_len)
 		__field(__u32, rcvbuf)
 		__field(__u32, rcv_ssthresh)
 		__field(__u32, window_clamp)
@@ -247,6 +249,8 @@ TRACE_EVENT(tcp_rcvbuf_grow,
 				     TCP_SKB_CB(tp->ooo_last_skb)->end_seq -
 				     tp->rcv_nxt;
 
+		__entry->rmem_alloc = tcp_rmem_used(sk);
+		__entry->backlog_len = READ_ONCE(sk->sk_backlog.len);
 		__entry->rcvbuf = sk->sk_rcvbuf;
 		__entry->rcv_ssthresh = tp->rcv_ssthresh;
 		__entry->window_clamp = tp->window_clamp;
@@ -269,13 +273,11 @@ TRACE_EVENT(tcp_rcvbuf_grow,
 		__entry->sock_cookie = sock_gen_cookie(sk);
 	),
 
-	TP_printk("time=%u rtt_us=%u copied=%u inq=%u space=%u ooo=%u scaling_ratio=%u rcvbuf=%u "
-		  "rcv_ssthresh=%u window_clamp=%u rcv_wnd=%u "
-		  "family=%s sport=%hu dport=%hu saddr=%pI4 daddr=%pI4 "
-		  "saddrv6=%pI6c daddrv6=%pI6c skaddr=%p sock_cookie=%llx",
+	TP_printk("time=%u rtt_us=%u copied=%u inq=%u space=%u ooo=%u scaling_ratio=%u rmem_alloc=%u backlog_len=%u rcvbuf=%u rcv_ssthresh=%u window_clamp=%u rcv_wnd=%u family=%s sport=%hu dport=%hu saddr=%pI4 daddr=%pI4 saddrv6=%pI6c daddrv6=%pI6c skaddr=%p sock_cookie=%llx",
 		  __entry->time, __entry->rtt_us, __entry->copied,
 		  __entry->inq, __entry->space, __entry->ooo_space,
-		  __entry->scaling_ratio, __entry->rcvbuf,
+		  __entry->scaling_ratio, __entry->rmem_alloc,
+		  __entry->backlog_len, __entry->rcvbuf,
 		  __entry->rcv_ssthresh, __entry->window_clamp,
 		  __entry->rcv_wnd,
 		  show_family_name(__entry->family),
-- 
2.34.1

