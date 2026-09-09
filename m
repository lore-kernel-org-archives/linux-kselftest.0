Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA9C3D566B
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 07:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940643; cv=none; b=PQ8QqeonHh8udRuTNAnpcjY3okgzTJ6e1fut0STIqShi57HYBox7Wx+WExW7f3+cyd2eX9kF+SxwHx1g0M+TK+HCDW7WxNJpLG7FQ57r7hFNTrLHMTAwM9vUSq52J3uaXI+OC3jM8bAH32TUCI/UuVw8mLxHS8QBImMjWYyOQkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940643; c=relaxed/simple;
	bh=ziS13Sl0XePVb+8Irj5aKB2uXwjBR2AeCsUFpisyMOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dcadkv3DA5NP9rYzBwsQOUhrFPcznsdGnnKAfWVBB62fIuOB+uqzoD+QaAQwmcl+h5wTcoCQC5MJmI7oxnW8KfEhJegw/ny40fkThVghAuvuFzEg3K77jDQiQtKGgEBJnIWfJT5s5XTq4t256SBz+vh7ikbZBVaNapAkW31+evM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.huji.ac.il; spf=pass smtp.mailfrom=mail.huji.ac.il; dkim=pass (1024-bit key) header.d=mail.huji.ac.il header.i=@mail.huji.ac.il header.b=MZRoQ10C; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.huji.ac.il
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.huji.ac.il
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.huji.ac.il header.i=@mail.huji.ac.il header.b="MZRoQ10C"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d0726cdbcso1801025e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Sep 2026 00:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mail.huji.ac.il; s=mailhuji; t=1788940640; x=1789545440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gukiW5oUha6xq8OwiRh6vFuhYnRARLZXiBZpgrxcnas=;
        b=MZRoQ10Ccji0GI9nMBYVmBRcNtJKGYFDoX6XYyNLw/riDYUXyjTaSHBtrxpdFtSKUw
         t71WXRy/Fo15ymG7IBNrAzh1YplVQfq34DAVQiuKvFp3ca8zwqqLfXxxJ7wAoygqwPYx
         /nrbW5s4rlgMtHWPYzX2+p5wE9+/2JZ6O5FOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940640; x=1789545440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gukiW5oUha6xq8OwiRh6vFuhYnRARLZXiBZpgrxcnas=;
        b=Hy5zBgPoERn2c/rp5Pj+P9EU8THln4gvK1ItFclUZeg058tAEuo4wkf/5Vzxrv33lH
         0beiBuU4uA0/thVMbXmy/hzjbYDPNEGU19llV7GQOM+jFfA2A4cvWtaEdX307i8c7sL2
         ZyqbxLHq2i+z3QGinQ6byb6KDY+Q0NudaIJbPuroP/8ZAlbaI5iu+gH5uHTVPcDS0AGa
         z0AjWEZitCbxtReKLIVWINQ1rgsJKUrUaXmHmPXXCscnqA2JYIRWV/4ydHKeSWNRwfYH
         vtqf0ZOiK+d5KADr0imAph9G8uXBzpO7cr58dzjP9QuT89oLLAvSU1jT/MjojS48nDdu
         NUDA==
X-Forwarded-Encrypted: i=1; AKwUvBy2089jAECwTFut/6EN83mpODr3zm4jEAwvARIsv0QtX7kApyqpkeRYd4jtTZXu4LOfaNHAKLsgSvkXwqBigkQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nKp8G+WwFNOUoDDNo3YlYdAVintMBtLoSMBrsDlZGPMy4YFcQa
	lzLZYd6xSyWsNBtj8jX3xW8fJhYgxuvSVB/bmuTooISXwmr20CcvRn6rfdjfFWu1WA==
X-Gm-Gg: AYBFou1bcKRAq619vjfc7YhP1BlemmFVs4NP1g1O33qpzDTLfqnWKWPQiteyMMYSHBa
	Yndgx9g4yuFBn0MX14R5/9RHnCR6A3GC6KpkxBHzSeRtCeVuQ43DfhJbjprl3ACrngS6ToYkozC
	Sp4RlfwVSXhkVOygTsmpYK7qUF8IreAT5x4krpZ4/6uAfLONDrerfAMwlM+o0YP+QOxfSE3wnjI
	zfU214noTkjLn2qtfONifDdGBv6ZLwnNgyZWeGFvu87aYGn7UzzBP6TC41+G1CrDoYQmAh0Pf9x
	FiohnUPOO1z56Sf0LHp7pSSSm8LVviqCgkbYeorqsPlE50+SZOhtO/l1tDu7QqaHlg263AbUhIe
	1uW8vphe6ziyuvYOMkilFogTFrqw9s7tRgksKpLx1GMyRbUQfOJRYflCf4CPaQ37Qf7ErE0UXDK
	5kfMv4AO+lbIhj5Ew7h0fLce8b6mj7MuFV3DnboKelMZIPTshFl+s5loxWXVYiOPvma+jxLnycl
	ZinFNpVVzXERBj4kjhqi1r8bDVJXv2LBflk
X-Received: by 2002:a05:600c:3b25:b0:49b:910c:76fb with SMTP id 5b1f17b1804b1-49d01dd415bmr218970125e9.2.1788940639866;
        Wed, 09 Sep 2026 00:57:19 -0700 (PDT)
Received: from inbal-OptiPlex-Micro-7020.tailf3f5b8.ts.net ([2a06:c701:c272:d400::7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20db6e76sm45677255e9.3.2026.09.09.00.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:57:19 -0700 (PDT)
From: Inbal Schussheim <inbal.lipshtat@mail.huji.ac.il>
To: netdev@vger.kernel.org
Cc: edumazet@google.com,
	ncardwell@google.com,
	kuniyu@google.com,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	Inbal Schussheim <inbal.lipshtat@mail.huji.ac.il>,
	Amit Klein <amit.klein@mail.huji.ac.il>,
	Tamir Shahar <tamir.shahar1@mail.huji.ac.il>
Subject: [PATCH net v2 1/2] tcp: exclude old ACKs from tcp fast path
Date: Wed,  9 Sep 2026 10:56:43 +0300
Message-ID: <20260909075644.1408171-2-inbal.lipshtat@mail.huji.ac.il>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909075644.1408171-1-inbal.lipshtat@mail.huji.ac.il>
References: <20260909075644.1408171-1-inbal.lipshtat@mail.huji.ac.il>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exclude old ACKs before SND.UNA from the tcp fast path
as well as ACKs after SND.NXT.

Such ACKs will fall through to the slow path, where tcp_ack()
performs the appropriate validation and challenge ACK handling
according to RFC5961 and Commit 3d501dd326fb1c7 ("tcp: do not
accept ACK of bytes we never sent").

This prevents old ACKs from being accepted
or modifying connection state as part of the fast path before
appropriate ACK validation is applied.

Reported-by: Amit Klein <amit.klein@mail.huji.ac.il>
Reported-by: Tamir Shahar <tamir.shahar1@mail.huji.ac.il>
Reported-by: Inbal Schussheim <inbal.lipshtat@mail.huji.ac.il>
Suggested-by: Eric Dumazet <edumazet@google.com>
Signed-off-by: Inbal Schussheim <inbal.lipshtat@mail.huji.ac.il>
---
 net/ipv4/tcp_input.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index daff93d51342..57fec58a4f15 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -6539,7 +6539,7 @@ void tcp_rcv_established(struct sock *sk, struct sk_buff *skb)
 
 	if ((tcp_flag_word(th) & TCP_HP_BITS) == tp->pred_flags &&
 	    TCP_SKB_CB(skb)->seq == tp->rcv_nxt &&
-	    !after(TCP_SKB_CB(skb)->ack_seq, tp->snd_nxt)) {
+	    between(TCP_SKB_CB(skb)->ack_seq, tp->snd_una, tp->snd_nxt)) {
 		int tcp_header_len = tp->tcp_header_len;
 		s32 delta = 0;
 		int flag = 0;
-- 
2.43.0

