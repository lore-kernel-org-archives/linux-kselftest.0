Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793854969;
	b=JiyZoV+L1xBQ1bqFsii74Ikebhndby6HMzxSLWrAdohTW0nh4PWLenzqsktEHvnrUUr/
	 88z/IaKdU476E+G/UR+bXNDF1vzDxDPtsPRrqvGgYohCO3ANdh0b+/0Dsj5ji+HhC6lnJ
	 QG8Axvjzu0TZ5iwriIoGkxTHDa8mm00Y26kJwb36HXUUOPeEJh83ynkFOWq922R3UbJkv
	 unOOVbjulSuVc9hBv4XCDOUQlhIYHcfivO1BqrA8M1EbfGqeDiJtsOfEoA8pKnNOEX0zU
	 gQu3JnduA1y33RH7jKUQ0SUAgp3CWf0RS/aJzVHWeRi1383ZuVcyb+Z4iFz4zLnY7cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793854969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZvR6TskZdWW0qqXirA6k1L3BiqLi1sfGsfq7tJ5wLss=;
	b=csorJTNch4TaLPcqtWDSNNC9NHlHX8Kkb1KVC5lbdBo7x5tLeP+JlSnh7tx1fkTkwQ0T
	 cn9RiwnSzSmEEwDby6sumWTOclF2gb5keTQdj6ifsKR63cqgC0EvTh1J3eMA7XI5PxY/l
	 Er/L/3ndVOfF3uWFkpiFlOh9++JiZgXiIZ97D5LHpOjeFIKuxO+VmimIk/pg6ut+sWMNs
	 i5qTWdVHVQkyJwuym30rjRgTDu+bA4C6a64hODuSkAtQPcUUhsydeiD2uSLuieNZkOmLb
	 fPreAUTdzaSbJjI4pJuOTUTC1YjD0tirthEA8kbsfnGN6cLTwX8qMFAsBZFJ7JRvwRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iVqH7DZb;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96436606D80B
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 05:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96436606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iVqH7DZb
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15dd124bbe7so601373c88.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 21:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793854969; x=1794459769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZvR6TskZdWW0qqXirA6k1L3BiqLi1sfGsfq7tJ5wLss=;
        b=iVqH7DZbiXYw9I1iVCOjZ4e9C4Zj9/4MJHBezBN7pD87q4SvUWBwXrtJ0712sceVUR
         gTEj9SaTAXSRg78VMKO4rSzGIfEO2ZIsAhKT9Lqersq8HIbzx2VfuBENhnYee6LUWo89
         Mzg5IVoS2EbjHSPJYEnrLr9ysmuj3LZBkFFEv/iw8HhzS/ss0woub3STdsy4wtFVaEr/
         CfPkxVsI2GMqdOmgw2y+ixrXPdzoeBktMtV9flcUiuk3csIXxTkESHrHRxV6RwZj7Ajk
         ff97Mr2c5lUhf8VKXAZY/9FUMhbt4fdBemrTWsuvFmY2Ok75cUH62NKj0dfX8ogFPceX
         3dWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793854969; x=1794459769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZvR6TskZdWW0qqXirA6k1L3BiqLi1sfGsfq7tJ5wLss=;
        b=v99hqfqdb0LHwdQTcu4Gc+OlfCo1xKy3pZM5fF2ZAwSGbjqO+nCqrY6SXF1VY5fGyx
         i27q4LNfEF1MSIHh9jNrNlAWPnc2rWnqKDYgacfxZKNUd2d/g5iNVnbP/QfCIwg55z8t
         w+7+Uc1cLibxGiUrFoX2tbBRqUWjhzVuCzlGwSvwaNScVCpGw66w//KWEX/I2S+hilN8
         SKLwX5Ff7X9rGTIhyydtO1Stvvmc5ySCIJ08OEsEZ5EvR10unkw99bpqy45VvguK/MOb
         i6/pMmv58Ni5TviC7Wi6RRkCRlQMjI4KzssEpnzitbg+Us+aLBBFD9vYLaSKSz5fub/v
         0tvg==
X-Forwarded-Encrypted: i=1; AKwUvBxgsFA8KSmkfEvQ9BcmLJ6ecd4hW+x9MBPbYg1/39gkZcyWiqPC2Edi9eTCA/jMpGaOJIN8vjXqghSuftK1O4A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rNvWVg6D6HocmtoESdxq+KThrNA8D9WWceVCJNg4lWF1Xu+iM
	4Nf7tnUp8XbaSxaP0Uqxw1OX6uW/sGCKMQ+VW8bY4p56yghX4UAHIS6Z
X-Gm-Gg: AYBFou0vsD+lm1WWdLiiXNQ+ixmFaHV1f7Ll5AAbHiQGUxGWfbFgwTDOjuXGy6S0y9Y
	NLXVh/BdTyUbGI7TzoEJtAvQLT/2sRF95yuOshDOtHNORZEC9ADqFbksJpJajzIt2wcoAHvgiPB
	UqUI+/U+ywfPBA/TGSrlBJfQnAlTpPmAEQLIXi0Ev6LhgYJMQVkAJmYwDxEwPhKCz8dMqzXQQ7m
	12KiDtHkSmAUm28A+RJerUETEZTW5CAr1hb5Rrseo6Q4O+iP/2S5IjEtuDb7Pa539amg+igGTNr
	nQxpisS1Fkad8mS9gB4n8ysh2wJp1muh2uNQn3/1vP0v+1E1XPVq1ZLaCMZhq/oGKEQ2XM50Ffa
	h1a5aeZd6lqwa67yBX/aXYvVqUiI1PsnaAQkcqMZZ8gAGrZJ5ef3NbOnFAE1UidjTykO2O23wAp
	xKDH6Pv8EDe0SanAyIjorkbaCKqlGBPCP2qnUeJN0N1m53KmaZ/rb3ejS0viob+qJAn47WzJOw/
	iiK/xFGrQnsIul9sYHXDLNIrMzBm0kIs++KoQkOhkRWpFhMWiVldMtaWcCHz0gS/wkaQqp7L1C0
	E1/uStigDjT0ldgPWHjWDFmLtXYJvQSxvljt/BtHd6bwU52MvcwsCxuGJNc6LBHmrKyu/Zy/+X4
	=
X-Received: by 2002:a05:7022:29c:20b0:15a:9834:73f2 with SMTP id a92af1059eb24-1ac5c5554eemr25709808c88.38.1793854968501;
        Wed, 04 Nov 2026 21:02:48 -0800 (PST)
Received: from localhost.localdomain ([136.25.42.214])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c283sm13626735c88.4.2026.11.04.21.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:02:47 -0800 (PST)
From: Tim Budding <tim.budding@gmail.com>
To: netdev@vger.kernel.org,
	linux-sctp@vger.kernel.org
Cc: lucien.xin@gmail.com,
	marcelo.leitner@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tim Budding <tim.budding@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v2 1/4] sctp: abort unordered partial delivery when its message is skipped
Date: Wed,  4 Nov 2026 21:02:22 -0800
Message-Id: <20261105050225.49292-2-tim.budding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105050225.49292-1-tim.budding@gmail.com>
References: <20261105050225.49292-1-tim.budding@gmail.com>
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
sctp_intl_skip() only aborts the stream's unordered partial delivery if
the MID being delivered is lower than the skipped MID. If the skipped
message is the one being partially delivered, partial delivery stays in
progress: no PARTIAL_DELIVERY_ABORTED is sent, and the next unordered
message on the stream is delivered as the rest of the abandoned one.

Abort the partial delivery when the MID being delivered is at or below
the skipped MID, as the ordered case already does.

Reproduced on an unmodified kernel with the uo_pd test of the
sctp_ifwdtsn.sh selftest added later in this series; its partial
delivery checks pass with this fix. Reproduction and fix done with AI
assistance.

Fixes: de60fe910543 ("sctp: implement handle_ftsn for sctp_stream_interleave")
Cc: stable@vger.kernel.org
Signed-off-by: Tim Budding <tim.budding@gmail.com>
---
 net/sctp/stream_interleave.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/sctp/stream_interleave.c b/net/sctp/stream_interleave.c
index 840f24045ae2..869940001588 100644
--- a/net/sctp/stream_interleave.c
+++ b/net/sctp/stream_interleave.c
@@ -1255,7 +1255,7 @@ static void sctp_intl_skip(struct sctp_ulpq *ulpq, __u16 sid, __u32 mid,
 	struct sctp_stream *stream  = &ulpq->asoc->stream;
 
 	if (flags & SCTP_FTSN_U_BIT) {
-		if (sin->pd_mode_uo && MID_lt(sin->mid_uo, mid)) {
+		if (sin->pd_mode_uo && !MID_lt(mid, sin->mid_uo)) {
 			sin->pd_mode_uo = 0;
 			sctp_intl_stream_abort_pd(ulpq, sid, mid, 0x1,
 						  GFP_ATOMIC);
-- 
2.34.1

