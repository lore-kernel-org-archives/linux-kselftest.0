Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792843628;
	b=ZWKOmMfqLgBqRHoGODp96pXNyNmRQNiyjkhm5As2PKchKt14keiufc1HB2BXNHT2mYMN
	 63Gfh9De7xpratW7HwsegFTMeLvFJfkidjfu0svSHEZ1BhAgNECqbrftt43AfuYAxhM9p
	 2Gz4RNr8a/J9rXGjSfeqYz8l6HLCuu7FMspLVPeXuqx4ca0c8DegXrgXBYYkVK8WWZ2xh
	 28dEjErFXMBLl0MEc6uR5U9jfK3yzMx8R69HJeVeOoaWIY2e4s68Gh3upapLsmGsnvrbA
	 H7LsuHFIhO5PsVwpCKfEhpxjto6B0xcCxctBLhleD+00txPIlfq/Cqbgt8KeVdo1AQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792843628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=os4tDb6Xj+U686/n75PMKZ7wN38a+tP5+DzCKnGGcL4=;
	b=zBRwq+be3EONGcAIy4oS4E8w4AFJvwBNGLSyavSWEAG4UiU4p9w8eXqRauYZ1Nh4aoL6
	 DZWvS2edDiianODXdsvG5XFIipbd51bAbviR2Ca8l2hm5E7jCl5BDrYmur7dchiJTAOHb
	 A041d94qfrUazi5yx5/iCdDCh/jb14I+j7wblR5URkRb5fvNqz2km02Xzjg8WBdtSb9Ld
	 t0i9xpX6VYQm22X/qT6tFByGqJMipzWDA7kl+aUALmoIBHT6T1djODngcLschktkrOWIY
	 9n9YVrKo5DlIs6vQ5obQl0WESiR38ubHFpmwE7ZNACWqwd3zFx8j2axfc9AgN1hAGeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XSY6OdDC;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DBE606A332
	for <linux-kselftest@vger.kernel.org>; Sat, 24 Oct 2026 12:07:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21DBE606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XSY6OdDC
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3797995eec.0
        for <linux-kselftest@vger.kernel.org>; Sat, 24 Oct 2026 05:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792843626; x=1793448426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=os4tDb6Xj+U686/n75PMKZ7wN38a+tP5+DzCKnGGcL4=;
        b=XSY6OdDCSUlPOYv4PuPcxjInaUc3nzXMpvI8UYrp5Z4UXpyCr2KHLZRhqqkK3mbiGT
         EYi249un6JB5e4nmMahZ5NCubG4heReC1qXTKlOuJOZHZL8X2AnA56Qe1YVookEARxLG
         hfzgK1l9BzyWOBdfd21r/jlfhADCh1UJf2DzZAYn25t2pDyqrCVH6DxBLpST4JiGoks7
         RHs2HhOc5DFabGn05StfUXP7GRnO2A6nkhLjnjhzHLjcbOwJn6g3Rf3tchbuQ9ZNzVpr
         mIMJ5yCf3dpPOLs7SB4kWN4FCaqw0hiIlb14dGvdW7SPlHb9Jyp38OOazErINnS8VeAx
         MD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792843626; x=1793448426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=os4tDb6Xj+U686/n75PMKZ7wN38a+tP5+DzCKnGGcL4=;
        b=1KAow9EyI9Msk1dJFDk7XRRM8H77vRR79ff5AvZmJGJJH7QawwKrEMESbTLmYIYc32
         NHghUU3qgNFrNOhc01Yd/pQAMXcV3D+dpdqhbK0vb2jg+TXYSU0IlkPbUj60E6q8aMZq
         Q55Cwp/Ysrx162JmybWQMC/zUSmipBQ3ZM+nk6u1F0itEIKdnWqltyieH93GRofknXOH
         6u/vtEuve8IGFCVSs83RwkIE/Ek+odZHJ5bBBGnHpk9wEA+QhHX3lMlFUPbHxDaOEs5F
         TETLbJ51L5zwbYjR/1ZWwTNtEKfjMaNs5s2igRVQ7Vut2KtNBoIA0iPa76dDNm0TITOj
         xYBA==
X-Forwarded-Encrypted: i=1; AKwUvBx3D/oJSY1YEJr2mLqMHdsQqxjFPnFYK4GS/ROuuLgiR7vaPz3aiHXe66iXjj+HQHsxXvKVQ7pNz7UwesctjKk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJTHqLjD1f041SaIBTpqKmnRthLO6TToT55C3NxgN+ktmJ+cuS
	dcHc2Yru08I/CXPEtyuuZOmujJ3AVYB1gf8HwpuKqlYz9KkncppGkMkL
X-Gm-Gg: AYBFou3/W1vRiN/PCxCYhOIwv4qU1DRFmv4qDMnOssXDjRcdnbZM9lXu63ZZ8FVhNnn
	wcw2miwo3yAJfizI6BR0JnDH1xbze7hmUXYQ6hA5XvePa/7XV2SKvVC4zMRzFvohc+pLkuYjWFE
	6l2TYu8ZV/en4xnLnjO8cmfAeKKXT2XelBTDB+G+22ule6hgG1Y8K3EzCWVFbJbksyv5ozhoLhJ
	xsDj3ia4UtPdEbOJ71bS64JLv0Lhgu/dxIOlHjg3WQ56692SHVIp7UtInJbKlC4/fxMe0nXIBu/
	J0nkuy9JuUYU5hStXEPa7rh0o0qNUgeD4inVJm42zdW7hORNAmb+39Wm21meseJDjCs7kjlcATy
	tmlK/oEBvyOD9204TobbaehR1bg3yTe4GrogbT0CeNcLcAMo3x5JMNuh1SElKp6jNinUxh4Ioga
	AljnylRFNQf3Lo7laTN4C1qliAvqYTouZeW0//DZCl5oupx8h1Zpvb5wwGb95vIxPop5dCHAZik
	GJqCZvmI8dE4lcEZYwA85NDh4X4tQTar+/HOsppuUCzD0+R2+oDoV948jRmPg0jvjECu7yvqYmV
	TasYfe5kZT6gaMyccOHVtCi6ew==
X-Received: by 2002:a05:693c:41c3:10b0:369:efd5:9cad with SMTP id 5a478bee46e88-369efd59d94mr691961eec.8.1792843626034;
        Sat, 24 Oct 2026 05:07:06 -0700 (PDT)
Received: from localhost.localdomain ([136.25.42.214])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d95e91sm8120722eec.15.2026.10.24.05.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 05:07:05 -0700 (PDT)
From: Tim Budding <tim.budding@gmail.com>
To: netdev@vger.kernel.org,
	linux-sctp@vger.kernel.org
Cc: Xin Long <lucien.xin@gmail.com>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tim Budding <tim.budding@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net 2/4] sctp: abort unordered partial delivery when its message is skipped
Date: Sat, 24 Oct 2026 05:06:25 -0700
Message-Id: <20261024120627.837568-3-tim.budding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261024120627.837568-1-tim.budding@gmail.com>
References: <20261024120627.837568-1-tim.budding@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When an I-FORWARD-TSN skips unordered messages on a stream,
sctp_intl_skip() aborts the stream's unordered partial delivery only if
the MID being delivered is lower than the skipped MID. If the skipped
message is the one being partially delivered, partial delivery is left
in progress: the application never gets SCTP_PARTIAL_DELIVERY_ABORTED,
and the next unordered message on that stream is delivered with MSG_EOR
as if it were the rest of the abandoned message, so the application
sees the two messages merged into one. Until a later unordered message
on that stream is abandoned, no other unordered partial delivery can
start there either.

Abort the partial delivery when the MID being delivered is at or below
the skipped MID, as the ordered case already does.

Found by an AI assistant while working on the previous patch. Reproduced
on an unmodified kernel with the uo_pd test of the sctp_ifwdtsn.sh
selftest added later in this series, which passes with this fix.

Fixes: de60fe910543 ("sctp: implement handle_ftsn for sctp_stream_interleave")
Cc: stable@vger.kernel.org
Signed-off-by: Tim Budding <tim.budding@gmail.com>
---
 net/sctp/stream_interleave.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/sctp/stream_interleave.c b/net/sctp/stream_interleave.c
index f8c818a5533c..77fe0db5ff77 100644
--- a/net/sctp/stream_interleave.c
+++ b/net/sctp/stream_interleave.c
@@ -1246,7 +1246,7 @@ static void sctp_intl_skip(struct sctp_ulpq *ulpq, __u16 sid, __u32 mid,
 	struct sctp_stream *stream  = &ulpq->asoc->stream;
 
 	if (flags & SCTP_FTSN_U_BIT) {
-		if (sin->pd_mode_uo && MID_lt(sin->mid_uo, mid)) {
+		if (sin->pd_mode_uo && !MID_lt(mid, sin->mid_uo)) {
 			sin->pd_mode_uo = 0;
 			sctp_intl_stream_abort_pd(ulpq, sid, mid, 0x1,
 						  GFP_ATOMIC);
-- 
2.34.1

