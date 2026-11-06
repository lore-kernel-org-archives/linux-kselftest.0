Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793942397;
	b=05sdtsTWdTr+Z9bbs0mYEfljVuwEmS86qFWI8qArk4S+DhqD+RU+UlAwCnsDVFbbnkay
	 QGEb9sF31bOB7crJPa7OXINWzTBZ369wFXyEUt27YIqTgnhgGWhZWXDvhkgmnVDn53ToS
	 VIhzNdVEbasrpPqZQde+acJtXhQUz7Yv/MIFTdNhZGnPGHU70j6GKLkr2XH7F5Tmhe4E7
	 7NVzdmdEnmP5SUfG06fZaOjfl8AEnYCeFrFx2HK8QzYJZTt662kUNw5UkHaQsqNXH8iZW
	 bL0VRO+A7jv5ZaN2aJjsUAj9+7S1cn2XcuvfmH02deYaNTMuwtqdpPcZFOJarQJJhCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793942397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EhvxgM4OU3wkthv1IWxSDKnI9mH3KYqlfOb3SM6sBPU=;
	b=3uhG1x4fixwv2GnXKv9ZRkFW9MYnxDmvUC9nLa8ctYtnfE+XtCm7J43ZZBK6Y0MV4dQa
	 9aMrP1uUABnWFF9ZUVNzFVjBe+ZxPC0uI1S3tPfIhgO4VmNnUM7vWbPhREYn0FWcztRah
	 hrxhOo6DduYXW6o0w0NIZQFgq4/x8b0BFuGGBOLY0Z65Il2sX4QipVMfZvvcU87XCyiRu
	 y7Ou4iWu/xnMxMSoYZQl4SnI80q+Cl33JwYGz5NuphoeAuA7xSwr0S+YyKaPvtyYQHaSH
	 5oPqLZ1/fRSeZglS9Xx+YvZaPS7tka7INNGegPJx8JP6zTZ+/fjqaIqeUzlntRg2bnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jNE0BwBp;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBF9606A32E
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 05:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EBF9606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jNE0BwBp
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ed28bac8d7so1244805ad.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 21:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793942397; x=1794547197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EhvxgM4OU3wkthv1IWxSDKnI9mH3KYqlfOb3SM6sBPU=;
        b=jNE0BwBpc/e7lmrNSiB0iQ/tyWQZ0whAica8HVjPbf3YT8WinM+PNzp2uUyvLpRxB/
         pWmeMlkaULtOOo2rcPN7mr98adfqyC8rAiDhlL5S08sCeq/u2UhuE6UQNVyIBPFikQtt
         VZ0BJrTbpPsmFqNdKrSVIZyiAvYRTRugZoC49u9eVJAevGNAELm18oNLJJjyY6T226VU
         ZsJWQlUPzaOlU6i9uxXrElJagj5G+2Ox4/Z+OmijG5vxeiFnNRj5dhUlfie1mKesnWAR
         bo/gPr8W3I7XLc18Jn/NQevyBB//FQPXmvEpdcdGgI3Yfk6fi0jkwWiFloZnJJRwQAVW
         fMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793942397; x=1794547197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EhvxgM4OU3wkthv1IWxSDKnI9mH3KYqlfOb3SM6sBPU=;
        b=anR/hMyvgc/hsQO4QgENLuWibEpxtZyGSuOguZS9v58+SdBSQj6VGrjobbU/GMHVkz
         nyqD0XkmX7CVkh2NMFmah4w5QU7bscToYHd/9xWj3plL24sn5ObfjycPGKyeCA3QS0Q/
         n6qpr+fTUofXiJKYQvPSUGGpsN8K2cvfPnmRxbVcGIFbcLE3aDfZuznabEjdWEOLjhe3
         k5zm2IxbMF0cAXXyngvV7e5MhxBpzi+NVufqxk33p7qtFB0U+4FZCF+0Z4xD7gfbFxu/
         emn57Vz01JaIw88oUBidxPqOXPS/uC4I7HLspsS+KnbpGzEWd+OuLzHeADmqwMyCztOr
         zVFQ==
X-Forwarded-Encrypted: i=1; AL+hErFfllVOHzqk7ogXy1G76lTMz8RDN+TgplLtYxOubz/fiJG1wWlTENR2+WwjIIfyhGN8kvvNrKDSxVK/wklE1SY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KoyxaVR17wV3UQHVF4O40vcyXYEykhnSGZ9bZUbZWoSebCZ6o
	Er43uOigAr/08XY185KXshdyXBd1L/vRYi9qQdi3MhIKh3ztfvDCrKn9
X-Gm-Gg: AYBFou12+O0ycBa8XETE9celRRGLJ9A4ZMxru7vS1zRmDVtLaKGrN0uEhSYB9MATapa
	977ZhU7wiXRQ8Yb/eTPHdlG8vp8R2yyDkd0uSF3wi7bg1I23ViPv2p32iszFbSmlkPJ8nv80MFC
	QXd0FPreplD+y/0NHcLTzEfRsyE6mXT+MgL6ES8k1KfPDwtyuJevTb/1Uh1YkLj33vSCtRCmtAk
	9Yd5f6+0fBd5CAhkQCTIBXXRdx2bdy42AIk9vnZGckXDVIh+xd4C+dJluBJxTviGAy33aKL6zdp
	tIE/KL5fX16ZCjU5KckEYnfq1r5vrkysjslsgUezWzX0jQRCwBDRJGPVUmZXL7O3IuJ7n+RRm+L
	Z9c1MJKuZER/nJvoEdus19n7TyuE204a6py7bBB/jTY99BQ+XZ+ayFkQ1O7gTPa2JUha8yn4UcV
	x3EyXZgl/IzpPWz80lJC26aJIE0d3DYwvCdtVJKPPs7k2iceLDrKk6UbPXffAwgnBEjimfZy+yf
	yI/uQ0Z64cVzanqMYvwojfG1MTU25bKBpmfXt8ChsoNib1w3GeS2ef3fEaAF4WW6W409nFSlgKM
	H8z5twQDbmTDSu7J6c/+BIIxa2Woou5L39q/CqHRmwBoFaC6DLXHHfzCDcBEFhRJPJ2PDzv8gCR
	lnOyJ0iKnJORXlm8TLAjp7ZrWFktdOyFJ0+VTXWM8GOw3ujxZhfwgqhMTtD1x4hrGcOwxZekmgg
	jLiKownYMIPlJbMiFS4z/kBiopA4Npydb9niYjL+od
X-Received: by 2002:a17:903:2343:b0:2e5:1069:fc11 with SMTP id d9443c01a7336-2ed23e53491mr32343595ad.1.1793942396545;
        Thu, 05 Nov 2026 21:19:56 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d7bd2esm1594465ad.56.2026.11.05.21.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:19:56 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Jann Horn <jannh@google.com>,
	Kirill Tkhai <tkhai@ya.ru>,
	apais@microsoft.com,
	rlmenge@gmail.com,
	hargar@linux.microsoft.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Subject: [PATCH net 1/4] af_unix: Fix inq_len leak when skipping unread OOB skb.
Date: Fri,  6 Nov 2026 05:19:02 +0000
Message-ID: <20261106051905.218638-2-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106051905.218638-1-sidchintamaneni@gmail.com>
References: <20261106051905.218638-1-sidchintamaneni@gmail.com>
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

When queue_oob() enqueues an out-of-band skb onto a stream socket's
receive queue, it increments u->inq_len by 1 for the OOB byte.

If !sock_flag(sk, SOCK_URGINLINE) and the OOB byte has not been consumed
via MSG_OOB, a subsequent normal read in manage_oob() unlinks the
unconsumed u->oob_skb from sk_receive_queue and drops it via
kfree_skb_reason(unread_skb, SKB_DROP_REASON_UNIX_SKIP_OOB), but fails to
decrement u->inq_len.

As a result, unix_inq_len() (reported via ioctl(SIOCINQ), SCM_INQ, and
sock_diag) remains permanently elevated by 1 for each skipped OOB skb.

Decrement u->inq_len under sk_receive_queue.lock when unlinking
unread_skb in manage_oob().

Fixes: f4e1fb04c123 ("af_unix: Use cached value for SOCK_STREAM in unix_inq_len().")
Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 net/unix/af_unix.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
index 98fcfd7301f6..bfaab7c6d720 100644
--- a/net/unix/af_unix.c
+++ b/net/unix/af_unix.c
@@ -2853,6 +2853,7 @@ static struct sk_buff *manage_oob(struct sk_buff *skb, struct sk_buff **last,
 		WRITE_ONCE(u->oob_skb, NULL);
 
 		if (!sock_flag(sk, SOCK_URGINLINE)) {
+			WRITE_ONCE(u->inq_len, u->inq_len - 1);
 			__skb_unlink(skb, &sk->sk_receive_queue);
 			unread_skb = skb;
 			skb = skb_peek(&sk->sk_receive_queue);
-- 
2.43.0

