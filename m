Received: from mail-qv1-f99.google.com (mail-qv1-f99.google.com [209.85.219.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3263DEAF9
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 14:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777906427; cv=none; b=qkh6oL41qznoDLjt9YA4c548KZU5Rat/9G5BzW18VlTpw66MwtgturnClu84yLxcCBEk4Ws+oHTxLXDCYZJdQqdUFT+3W4hYlZUkoS89tOHn7N2XyOI4xeG2h50EttVfEhcIxlNGq2+l5s6F7XXN+b3LEs66df22QBQiAaXd9iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777906427; c=relaxed/simple;
	bh=+HKGs/2OnYxSKjzoiGas5+wk6yJPcmLe0BbCqba4bFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bRFxQkXwqwnRUNsKFSBYnHEZNn5vrNAVKLogJlRVyYpklLKSnkJxN9Qm9JPtMJUJ/jXw7OM0RvJQlbjbr9HgP8Wra1027qFU90zE2RP4Q+WmaRgHH7UrMBpyGwixuhanTyBmPpjfrui70Mlt0hXHIgkDL2B+MbWgegyChrU1VA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ObksJA4p; arc=none smtp.client-ip=209.85.219.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ObksJA4p"
Received: by mail-qv1-f99.google.com with SMTP id 6a1803df08f44-8acb1f75435so7606106d6.1
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 07:53:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777906425; x=1778511225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SHhLI5sBgOBTw5yVBP3uB++yW6cjDecz6JHS4uWuFPI=;
        b=T0l265zL8NpL6ZUeHG80kfdCq09v4+FMhsS9xHtwfrUwKS3b/wvmePYe5vH2QADZ2r
         tYtvlUl2AH91th4vwQ/xUngRS6l9f41m5i6k6kKy1li9QC8gwr9KU7vOCBpreNhrmzye
         1yYMdZDsIGadLnIRzKnpGkqWEyFfLPTVfSrcnr+w/W3oI+usxeSYHFJta6usAmdVpRyQ
         1RPJ1/45c3WptJm8fsnab9rxtB1an6y3VpXoEt2deKVCFt4QtemTCtAQhtyjb70/x+yN
         5ByZV9yQFvQbwlL6t4pVjLK3IyU7ELKLDzH87EA9Tdtuntwx+QiFDjcfFaLAiQpOJUoS
         Pt7A==
X-Forwarded-Encrypted: i=1; AFNElJ8juLdV7klxMLACzlPMMjSPX5JAzp69CmOroh79LmP4TZcnOuAbO057494FyVcuP39x03fgCuN039bHJXVaA8k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0a8VhMjqxcj7Wz0Xb6ga/FwPPrGGhYb2jjzaX/9zL96nRuRKD
	0U7AdOSFcLTNnxS1WExbj5dPZIl768k8PRbcCtMCgE3J+qmbYVWfJvzXpPpZjM44d73+ivNmAoj
	oSypD1i4sf1ejR7TJyKDzW+FyJfek5soo2LHkQSsXnE5UyxPKM/jVoljbH9CmbRCQO2kx3TBYtk
	KwkXVrbFaHZNWa5IAtG6E23H1A6K0OGRupaQkPW/OYoGIDpHJgbQ/squHMeorYM66/tP7IsJOQ0
	dOegJT+1Sdp8uSV/B+H5jdsitE=
X-Gm-Gg: AeBDievL4/X2Kggzxi4sKvOlhM+g9RiGyRMDdgVzRVvZrHAdWdC2thbvDALgvBcH5Qt
	ZiCH4Zg70BEEx1rcb+s4L3nm760sNCkHyLsCD5mvzHHrhOGHlprvtA8+JfegX/9dlY5TlVfYdHg
	nYQpUlaJ4pKd0ZoSCOyx0UYjgHH8mv4FPeuAE5plG0hwMGVZHdQtFD3scjh0tj2CE7VYQ0eqrfE
	JXpluUq8FsnnP4K4teGHSGN8J80wbIZBTf9aobYsmDNeOkR6IEqRmw6cvMd9Akkc7XrCV9r+Lpr
	9Z8H8j54Mfwv0EbDhKzKmNH1jQLavCt7Smk39weN6Racp5k85HJEZtY1xNpupRk+ssrHxqp8PgX
	OcVluBt/gZWUNKLv8iSnMhmNmiIcbzycLqWRx2sWYALTPj6B+zfK57QCHhjXeiMLV04FC5ZUfO/
	t0ELwetcNlrPZLYEM3mqMfGbcKbWItf6mc2heq8lKJfNHO5A3hlGfg8n128T18swI5RuCE
X-Received: by 2002:a05:6214:2261:b0:8b3:efa6:5440 with SMTP id 6a1803df08f44-8b66798795bmr118273556d6.4.1777906424437;
        Mon, 04 May 2026 07:53:44 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-8b53b33a3c3sm9270116d6.16.2026.05.04.07.53.44
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 May 2026 07:53:44 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8eab2831ba2so62883185a.3
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 07:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1777906423; x=1778511223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHhLI5sBgOBTw5yVBP3uB++yW6cjDecz6JHS4uWuFPI=;
        b=ObksJA4pnQhBSAvWIlDAJrJB4q6sWkfeHGYpb3Dwcf4KkCqQRTd6Q7jPBa8XELVREk
         /aEPB7HOoCCTMAQ+AkyLtcP8vJc6tvPNuJtdC/RLofnvaa+ofQ4Iyhi1CjgBovNTAA91
         PIqDaHjPfGFC/IuYitNovAczPAgA6OmfVwZys=
X-Forwarded-Encrypted: i=1; AFNElJ/avSF+/J3DhZvYf5sxDSi5Xg5HNNJy4Z6Dq2G69JULqUey3iuEkzTmaHPoLypvnuk2cVa+2Gl42obfHnL8uRc=@vger.kernel.org
X-Received: by 2002:a05:620a:4154:b0:8d7:3f45:b95c with SMTP id af79cd13be357-8fd155f14camr1002869485a.2.1777906423647;
        Mon, 04 May 2026 07:53:43 -0700 (PDT)
X-Received: by 2002:a05:620a:4154:b0:8d7:3f45:b95c with SMTP id af79cd13be357-8fd155f14camr1002864185a.2.1777906422882;
        Mon, 04 May 2026 07:53:42 -0700 (PDT)
Received: from photon-d7fac424c0d3 ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91fb3bsm1046315985a.41.2026.05.04.07.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 07:53:42 -0700 (PDT)
From: Ankit Jain <ankit-aj.jain@broadcom.com>
To: edumazet@google.com,
	kuba@kernel.org,
	netdev@vger.kernel.org
Cc: davem@davemloft.net,
	pabeni@redhat.com,
	ncardwell@google.com,
	kuniyu@google.com,
	horms@kernel.org,
	shuah@kernel.org,
	quic_subashab@quicinc.com,
	quic_stranche@quicinc.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	karen.badiryan@broadcom.com,
	ajay.kaher@broadcom.com,
	alexey.makhalov@broadcom.com,
	vamsi-krishna.brahmajosyula@broadcom.com,
	yin.ding@broadcom.com,
	tapas.kundu@broadcom.com,
	Ankit Jain <ankit-aj.jain@broadcom.com>
Subject: [PATCH net v2 1/2] tcp: protect locked SO_RCVBUF from Silly Window Syndrome
Date: Mon,  4 May 2026 14:49:44 +0000
Message-ID: <20260504144945.13477-2-ankit-aj.jain@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260504144945.13477-1-ankit-aj.jain@broadcom.com>
References: <20260504144945.13477-1-ankit-aj.jain@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

When an application locks SO_RCVBUF, it expects strict memory bounds and
disables TCP window auto-tuning. However, recent TCP memory fragmentation
optimizations still apply dynamic truesize penalties to the `scaling_ratio`
of these locked sockets.

For workloads processing small, fragmented packets (like Java's Tomcat),
this penalty drops the scaling_ratio to 1. This shrinks the dynamically
calculated advertised window, leading to Silly Window Syndrome (SWS)
deadlocks and 504 Gateway Timeouts.

This patch fixes the issue by bypassing the truesize penalty for sockets
with `SOCK_RCVBUF_LOCK` set. To ensure the kernel still defends against
memory exhaustion from large aggregate payloads (e.g., GRO), the penalty
is still applied if `skb->len` exceeds the advertised MSS.

Fixes: a2cbb1603943 ("tcp: Update window clamping condition")
Reported-by: Karen Badiryan <karen.badiryan@broadcom.com>
Signed-off-by: Ankit Jain <ankit-aj.jain@broadcom.com>
---
 net/ipv4/tcp_input.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index d5c9e65d9760..569299dafa88 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -240,8 +240,14 @@ static void tcp_measure_rcv_mss(struct sock *sk, const struct sk_buff *skb)
 		/* Note: divides are still a bit expensive.
 		 * For the moment, only adjust scaling_ratio
 		 * when we update icsk_ack.rcv_mss.
+		 *
+		 * Protect locked SO_RCVBUF from Silly Window Syndrome
+		 * due to truesize penalties on small packets. Allow
+		 * penalty if aggregate payload (e.g., GRO) exceeds MSS.
 		 */
-		if (unlikely(len != icsk->icsk_ack.rcv_mss)) {
+		if (unlikely(len != icsk->icsk_ack.rcv_mss &&
+			     (!(sk->sk_userlocks & SOCK_RCVBUF_LOCK) ||
+			      skb->len > tcp_sk(sk)->advmss))) {
 			u64 val = (u64)skb->len << TCP_RMEM_TO_WIN_SCALE;
 			u8 old_ratio = tcp_sk(sk)->scaling_ratio;

--
2.53.0

