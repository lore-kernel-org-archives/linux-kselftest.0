Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261A338642F
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Mar 2026 20:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773519289; cv=none; b=Dyuu7qr2b+w0iMcWHxxGyuRJYZ5XXuDJ2Te5BQ2wEbrxthjGvtvBh7toUgW432VyEdYPStq8vZEfRWaDLA6NpR/jXg1E2jcNORDP9eNB5p+jd3iy8LojESSC/x9SNhsc26PiyUymhVTTLTBncHIjKeNuzYi4JKwclX0UO7nz1ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773519289; c=relaxed/simple;
	bh=Ttxd17H5LIzMMzsw2TR13aHibCW2LBBebxMgXaknmMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iRvHxNJyiBaXBw5L5vCGTRSo+7NXoaLbl/B4dEnY2Z/QiBOveYx/OrX51kiMgZN6znwhQlCFEt2kQRWGr2kIMzlYpaH1BEKIgb40hLLDMAdbzZYj5IfU7maTi/h+xrv2yY1rJGVb5H2g6EOKogifY4YUKZwFh870Hd8b8PQfz0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GYmglQBk; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GYmglQBk"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-40429b1d8baso1292772fac.0
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Mar 2026 13:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773519286; x=1774124086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMcuR3aCCM7PiXgftnIc+4nYAKR8gQqAUuswiZ7+FpY=;
        b=GYmglQBkG2E1X7kBarsxxIkNHb6EjaPAexNG1J/bbJZ/0cXvJUreZuGHd6Q8gpCRJc
         THax/x7rWjLdmM93OMlNnpCT6vIx0UK2aWUQwZyYq285oHH2S/GXRP6Hh4G0zUj8G9ZH
         BaoLhauFbOMn6zIIziSlGKm9KLpd8yMaohK8FEe2mw/u8jtJJw4Nt1/KtZSdbznqP9dO
         B5/JjRREpPF0nZGjCDEX4bQQ4+i837nS/KDXSE7C+XV6rClkeTa6XyIG4kaKMeWW9HyO
         9N9bsmPdqkKZEUXtur5bUZFEyOiLFOcW0S3Bcr6PBYq0+xFor32PLTZXUTlUBFPpmhN4
         ZsYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773519286; x=1774124086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zMcuR3aCCM7PiXgftnIc+4nYAKR8gQqAUuswiZ7+FpY=;
        b=E2WMM3Mx/A+VZ60EiSNvbOtvDehR1Zx/7EaKvTdRfJTLqjwwu7SHNpg/+EkPQW2fp2
         OudlRdazrVk2B0NxUcUsEmHFCQ5K0ss61HzV+RGkJKsPAOpnYJ45FAqrgAb9qI5vXOFz
         yGY1ZyVlFvlEO2xO9YkfhdV84DiZyI4kKq0aCrqJd3FCxncphoO4hw5gJDG7TAOVerZ+
         eexBTb+585wjzmQzMLeCjSI2aqp3mzxkg/NNxTNgd2WD64DNfYv04HAqLZIdcZ2amKTp
         WD3c/mBETUacF0VC9xeAnjEcxDYLp9+S1RfyUytBe9L/nnr+QIIXkotiytYo+qLJAQxY
         XJCw==
X-Forwarded-Encrypted: i=1; AJvYcCULdr3/ztXUWHpW6Mm8u7IbWmlDnzhDhS/x1swe90Kie+pxrZatPQYP94WDQmYK5QljyvnMtmNyUUgdSN/srY0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtUrIUYquaNJebIItsav5XOFbnpk9uStns9tTl6FMEpBm9WGmo
	7uaOnv+Vluy6NpKHGK9cmMi+P46H9IVTlAQCRI6ocy//quXpOVIJTuTu
X-Gm-Gg: ATEYQzxJKH4SoUiqcRbLhkevrcbyIxiHd8njx/zWSw/3FsZKQUjx1gGm63TjJNlpm75
	ix8FQREub+gRqwfentmm8/G6uGn8MBYsCiGE4dhLKIKg3t9RCF4r2liHRLBh16dWpVpLV9yTe3U
	67HWiY/ZYRSzk09MF0u3qAUZACIs9eSYF1nYw3NlkSCj6kuZHtRbHqaBmJDxJy7sSQ+E4qHrGHo
	72KKHRePnCJWg7o9pVvH2pU9C2SlvMfCOiWIpqgXT2/cV0p6IcPIM5jb9JZJd2xO50FzgGN90Oe
	P2eDsfAvyd+r0+oBIuCIb5ztPrWxg55PUfxn37W0tHmbdUfCIHmrDK4/IjiIk2jcIiPephIwSxW
	exA3sP2wLfa7aTbQL5XhObPVJv+Ad0//Ew9hYjsi1a+9361uWR2LPxOWUG4tMIOjqnfSHjKL5DE
	Gtvd68npBP/RRBYOe+LAn0uIwp3sGELHj6XbP2p/jxx6dLh/DWdJKSgMyQb4VlElR/wc63LJ2He
	SkmOEHMzS0iIbtKueGYEkstnI2xTKxISkOKUHUj
X-Received: by 2002:a05:6870:ebc9:b0:404:590:59dc with SMTP id 586e51a60fabf-417b938f328mr3924319fac.33.1773519285922;
        Sat, 14 Mar 2026 13:14:45 -0700 (PDT)
Received: from Atwell-Laptop.. (108-212-132-20.lightspeed.irvnca.sbcglobal.net. [108.212.132.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e5e8185sm11914165fac.12.2026.03.14.13.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 13:14:45 -0700 (PDT)
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
Subject: [PATCH net-next v2 03/14] tcp: refresh rcv_wnd snapshots at TCP write sites
Date: Sat, 14 Mar 2026 14:13:37 -0600
Message-ID: <20260314201348.1786972-4-atwellwea@gmail.com>
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

Refresh the live rwnd snapshot whenever TCP updates tp->rcv_wnd at the
normal write sites, including child setup, tcp_select_window(), and the
initial connect-time window selection.

This keeps the live sender-visible window paired with the scaling basis
that was actually advertised.

Signed-off-by: Wesley Atwell <atwellwea@gmail.com>
---
 net/ipv4/tcp_minisocks.c | 2 +-
 net/ipv4/tcp_output.c    | 8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/net/ipv4/tcp_minisocks.c b/net/ipv4/tcp_minisocks.c
index d350d794a959..1c02c9cd13fe 100644
--- a/net/ipv4/tcp_minisocks.c
+++ b/net/ipv4/tcp_minisocks.c
@@ -603,7 +603,7 @@ struct sock *tcp_create_openreq_child(const struct sock *sk,
 	newtp->rx_opt.sack_ok = ireq->sack_ok;
 	newtp->window_clamp = req->rsk_window_clamp;
 	newtp->rcv_ssthresh = req->rsk_rcv_wnd;
-	newtp->rcv_wnd = req->rsk_rcv_wnd;
+	tcp_set_rcv_wnd(newtp, req->rsk_rcv_wnd);
 	newtp->rcv_mwnd_seq = newtp->rcv_wup + req->rsk_rcv_wnd;
 	newtp->rx_opt.wscale_ok = ireq->wscale_ok;
 	if (newtp->rx_opt.wscale_ok) {
diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
index 35c3b0ab5a0c..0b082726d7c4 100644
--- a/net/ipv4/tcp_output.c
+++ b/net/ipv4/tcp_output.c
@@ -291,7 +291,7 @@ static u16 tcp_select_window(struct sock *sk)
 	 */
 	if (unlikely(inet_csk(sk)->icsk_ack.pending & ICSK_ACK_NOMEM)) {
 		tp->pred_flags = 0;
-		tp->rcv_wnd = 0;
+		tcp_set_rcv_wnd(tp, 0);
 		tp->rcv_wup = tp->rcv_nxt;
 		tcp_update_max_rcv_wnd_seq(tp);
 		return 0;
@@ -315,7 +315,7 @@ static u16 tcp_select_window(struct sock *sk)
 		}
 	}
 
-	tp->rcv_wnd = new_win;
+	tcp_set_rcv_wnd(tp, new_win);
 	tp->rcv_wup = tp->rcv_nxt;
 	tcp_update_max_rcv_wnd_seq(tp);
 
@@ -4148,6 +4148,10 @@ static void tcp_connect_init(struct sock *sk)
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
2.43.0

