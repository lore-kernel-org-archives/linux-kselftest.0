Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF313B634F
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 07:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773215797; cv=none; b=l56Vqx4BY/ow2zF55eIpBfRdwqWPoP1DCPRbcd6INEdrXmFL0Eszf2km2dsrrvpP+nOs9lTtcldsFbTcdrQJcd9GRK7w6L6jkYaSA/YPgYdM2EMFeqQb9EW5hGsARptgxtV+8NAVcZfyRCVI/rxeu4RyWtJaRHOlGutzIbwwWRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773215797; c=relaxed/simple;
	bh=jPhrqcmDRhUMlM7YZP0Vfe8I9hineTPoN8bOhKWBAv0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Vo73B36QlX2tABczpsvhkUo4iPs2O1kWyUZl8Sv5+xwykNnG3MmuEGAUGE1vxlcJ0vxmsXUO2FOH37+qMEHOx1M2dpcqzheORRO2NaEur49L9qo2PpjRGko8dB2vhjKWfqeyl9A4GZjonqSR5NB4nwcC2xqnbfmmZy4K3ndU6m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S1CsQpNo; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S1CsQpNo"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4094b31a037so5817842fac.1
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 00:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773215791; x=1773820591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wacSMrdd6YBSycXcvfypm/nD64eKKUdf2M/29BZscYc=;
        b=S1CsQpNohQf8dC1hcEbbvhhBIN0GGWYdx7VS/SnXvB6+7d4ONkyBsj1dWWoinKVXlz
         diWGDrpkVpvYnWp/QVF0lVnF8qLNRFIjIXx/aaltrDAwz/ypULZjOh09j78TUEX/NuEr
         QyyT29asTIHqmd1JGj/Ja3eRRxvZKIbICFOFa2oRna5Ra/BBh9LKWuFakqVC53uDINgr
         WJs//TuoM2pjPTtGaPia/aOcf1pNXF9CAFNg9UcMH7H8buLuRxV5jLMKCdZRnBMyfrsb
         lgrTVtRkAx+oOROD0aiFAWM9Y3iNMLjNbGrKKAMJwdduuYz8iRq4yimGwMsI8f4/qgXh
         bNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773215791; x=1773820591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wacSMrdd6YBSycXcvfypm/nD64eKKUdf2M/29BZscYc=;
        b=wCSHO+FeGJdhTPKrJiLxh6ODD7v6ULFgnGCuOalKzKcVmU9lrC+zekswAyW747vjI2
         pcUW9MRu51OdTXAwK3fjbQBeJZCRhWddFuQdgO1hkjnWwUYBWGoyE32IhKYgdjmJKY8p
         Q+T+IKPP2lejAmhLYMcOCtQbUxQTc6ce3AwnftLPMzVffkMakMTZ5h1hkxDWwKxVHsKK
         WCQAPfb0g4RCc4Zab5XCAwihtXw7MN7vRPbEF5WzIh9MpmICPoBZr63+XiYBPQM5JfZl
         5GhqisA5yiH6SYj8Ls8hkUcSFNLSpmr1ecrREXKNFE3OLnwFmHHS6dGPw2U1MNXwd8YX
         IVcQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3+sSGm3J9niVNb5u0jNLCYv11fGKvHPvp3jdrLThYu5nvIA8QoS5XtSPKCR6PX0WTlxV9xhohSacOildB5H0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBOxcyPrE7lZkpYACmbltGll2RTH+o5EFNYbmr0cB+m0+fKMY9
	oUosNz9t0vbGBQeHd0/CBRWMKkPYtxBaL6BZB0oSAnv/AVaaaDMpZwXU
X-Gm-Gg: ATEYQzzANiGisSZIC58Ppq8clUPtqrcKqE3ibPQThL+xUVFk8v1VSX4J9OwHOioj3ju
	Vko8fNg5CqFre5qPqcZgZfYBr7IRpL119jQAQ9NVC8dmVBA4BoEPfSmTPf5whPGE6fYT52a3wNU
	bbWsBqTTFArlQkdZspn40RZJMK0dVd/kPFnd6yKqzW4Hk0DCenbabGPlANOQ6Z6BREp9gclLPDE
	QHnZLLbL3zwL6HHJ1EVQb1UzO/AhZ8RwMJJbUvkXrl9TNyOhv/a5h0ixmiJWqefvi74KgTgCbeP
	q58xG2Sq254sMd/oJ3LzcZkrDR41pPLn0ZhFwSi25CtDXVpVau6ae8ukvYrUSneI7zNLZW+OkIb
	SmHsTyy1VFohZvI/ckpEkm3k0IYpzoMmSB3+2rqNyTqWDDsCl5Un0iFzCkU8GahRozM0OodZH/l
	mz9jHdqcpwMMogjnOrd0rNZUyjxw2+RiFXJmfMuBtwm8dobPbMHaSUBAMZ729ZDYGfJMG0sWLGI
	ZaAno7sIhuSXsm+KCbfchWfc1M5YBk6zkEvTlwVDgtGJ1UM
X-Received: by 2002:a05:6870:91cb:b0:3e8:8e56:674b with SMTP id 586e51a60fabf-4177ca09363mr1118957fac.53.1773215791030;
        Wed, 11 Mar 2026 00:56:31 -0700 (PDT)
Received: from localhost.localdomain (108-212-132-20.lightspeed.irvnca.sbcglobal.net. [108.212.132.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e6ae0e3sm1568938fac.16.2026.03.11.00.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 00:56:30 -0700 (PDT)
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
Subject: [PATCH net 2/7] tcp: preserve rcv_wnd snapshot when updating advertised windows
Date: Wed, 11 Mar 2026 01:55:55 -0600
Message-Id: <20260311075600.948413-3-atwellwea@gmail.com>
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

Once tp->rcv_wnd carries paired snapshot semantics, every write of the
advertised window has to refresh the snapshot at the same time.

Convert the active-open, passive-open, and normal advertised-window
update sites to use tcp_set_rcv_wnd(). This keeps new sockets and later
window advertisements initialized with a valid advertise-time basis
before the receive-memory logic starts consuming it.

Signed-off-by: Wesley Atwell <atwellwea@gmail.com>
---
 net/ipv4/tcp_minisocks.c | 2 +-
 net/ipv4/tcp_output.c    | 8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/net/ipv4/tcp_minisocks.c b/net/ipv4/tcp_minisocks.c
index dafb63b923d0..ae8a466b5298 100644
--- a/net/ipv4/tcp_minisocks.c
+++ b/net/ipv4/tcp_minisocks.c
@@ -603,7 +603,7 @@ struct sock *tcp_create_openreq_child(const struct sock *sk,
 	newtp->rx_opt.sack_ok = ireq->sack_ok;
 	newtp->window_clamp = req->rsk_window_clamp;
 	newtp->rcv_ssthresh = req->rsk_rcv_wnd;
-	newtp->rcv_wnd = req->rsk_rcv_wnd;
+	tcp_set_rcv_wnd(newtp, req->rsk_rcv_wnd);
 	newtp->rx_opt.wscale_ok = ireq->wscale_ok;
 	if (newtp->rx_opt.wscale_ok) {
 		newtp->rx_opt.snd_wscale = ireq->snd_wscale;
diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
index 326b58ff1118..c1b94d67d8fe 100644
--- a/net/ipv4/tcp_output.c
+++ b/net/ipv4/tcp_output.c
@@ -291,7 +291,7 @@ static u16 tcp_select_window(struct sock *sk)
 	 */
 	if (unlikely(inet_csk(sk)->icsk_ack.pending & ICSK_ACK_NOMEM)) {
 		tp->pred_flags = 0;
-		tp->rcv_wnd = 0;
+		tcp_set_rcv_wnd(tp, 0);
 		tp->rcv_wup = tp->rcv_nxt;
 		return 0;
 	}
@@ -314,7 +314,7 @@ static u16 tcp_select_window(struct sock *sk)
 		}
 	}
 
-	tp->rcv_wnd = new_win;
+	tcp_set_rcv_wnd(tp, new_win);
 	tp->rcv_wup = tp->rcv_nxt;
 
 	/* Make sure we do not exceed the maximum possible
@@ -4150,6 +4150,10 @@ static void tcp_connect_init(struct sock *sk)
 				  READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_window_scaling),
 				  &rcv_wscale,
 				  rcv_wnd);
+	/* tcp_select_initial_window() filled tp->rcv_wnd through its out-param,
+	 * so snapshot the scaling_ratio we will use for that initial rwnd.
+	 */
+	tcp_set_rcv_wnd(tp, tp->rcv_wnd);
 
 	tp->rx_opt.rcv_wscale = rcv_wscale;
 	tp->rcv_ssthresh = tp->rcv_wnd;
-- 
2.34.1

