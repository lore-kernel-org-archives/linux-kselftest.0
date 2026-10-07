Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EB64DD3C5
	for <linux-kselftest@vger.kernel.org>; Wed,  7 Oct 2026 18:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791396798; cv=none; b=TD2L8Cx3rmx/PocaWYu1akRsqx8BBz7JRkv07tEzOxcZAXUeoiBkvio8HZyCnrcMo4AKU1n+Djml3otxLKtxJ1M2S0e+lQ/Tb76fvDeEgF/YZ3kDRTO0YDj1tiSJSxfrXtbQ1ZaojaDLd5X124YQjFJJKgGFnEakM2RrlKXfHqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791396798; c=relaxed/simple;
	bh=k183NUhj1qwHVJsFTyAHVX6htBfZ4hKlTE4Xzh8MQTk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GMSmRhP/SfMZoV8e/OWWZfjDLyc7bIfDfLa/77H6rYgndM/UiGCiobyAOtonTXY5KXfDL7X/Bvwvr5/CGdG4pN/zLIjFPDcBFVyVw9NgEHltRqbx+zXmLlTgzlKTJ2ObrdCnG5OUNgME8+E6fK7aWIn6FPB7ww5kjGGpOORmNB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OeVHtaJo; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OeVHtaJo"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3a49a022221so16143711fa.3
        for <linux-kselftest@vger.kernel.org>; Wed, 07 Oct 2026 11:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791396795; x=1792001595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1qSCjp+BKxpET3CUaJgBBRS2Eq6s578cQ0Ck4M7Ypvs=;
        b=OeVHtaJo4Qp54sXfuZ1f3BJZODIVg5XBAmfAWY3/Wnv4qW1/G2a2dYg7ouoZWbuKQg
         usi5SDZCFtI4IGE/iiGwqbIt8+c3gZSXD0S7/t5a7upEXOMZ0ZmTdze6vuvrEbsqahYQ
         ZpGaDssE1ST/iGnr1KP01Fe6EbwEDKuYYXUE2xiOO4khY51nay1guS4HWJyYYq0pO257
         kdHoqrAPJP1KUkQXcmbbQDci9gsxqNsbRdUYh0HfoMUkBUO5yOVg7t6mVMTJotG7cwsP
         f11fYDjjTxf7mzZ/9KLe9LWi5WXxAgOpMH5SBn4xOX6jmJc7c2tTJI4RuMONDaKT7nr/
         Dn4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791396795; x=1792001595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1qSCjp+BKxpET3CUaJgBBRS2Eq6s578cQ0Ck4M7Ypvs=;
        b=OsNDwXyKWXOmFcvobgPBzmQvKCwOmq3/MNpUNR1P0lzRuH/pb7i6CjnwRAGZktQ3d2
         M9kL4W//M7CApj+ZNmI7k9VGLQgSdqexf5ZcgExeYyn5xe9pfS9i4/jKZxRwR31Z8e5X
         1Bwb1CsySSUfsGLtM2QjqjMzflBF10aG/otcByfT3RMKUDj2dIpmfbHeCiIoO4kTkfYa
         WAYrznHc6EKoshzvdfqL4RXIr73k5Nvsfev9bnTdALLrhTJZNeiDHLl69m2OSH0szDIH
         Tvuwcaiy/cIy0a2Kq49fYSjhFOZz1dfOg75C6A4osaIeI00NN9XPosigbYCIcHWrJXGj
         LpTA==
X-Forwarded-Encrypted: i=1; AKwUvBwjn4nxN+OJUb1nwGJNLDvx94WDmj98YrgolPs9wq/GGeZIXt3/IcPgS9gelJ7DUKDqAvha1tDxkaiD7WygCPI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDZEOHwkNXZojN0wFtfBjnk9GoOt5Q/jnne4dXd5qP9s7TyFrF
	pErTuTdo5oSFiGcE+LanSOBxAh0+zzsT3MqY0+WMryxZHxFwAsGlKz/V
X-Gm-Gg: AYBFou00sIia5JY77yLiWXBLkYQiDuEcsp9yZ2OkpuG+Il+H/Rk+C139tbTdOMK2TYb
	TZCzSIctHUQZYIyXmnQpyqYCp2qzy3TXO/94V5tsXlqflmHI7WlDS3C+fRwReDs9EdfXIPb0waD
	VijY5xJLqJrGGI14o1idn7lncHw6lsyPtz/LP5gjr6bGHC6HvJcWsiwyG8p42xLRm0a69uwziUF
	QERp9ey3JW2yB2Fx3sEFpEHwx0miDMA+kYvlyrPGn9AgOMD2WG8oY4gqUfw5cCDKtuJF68Xo6tg
	j/AnNy4U0IZCJM2iG7lEsvlqsZzNWSiY4rqkC0TNT80P5fE4fZs67ay61j4r5CajzmXc7HQDpqW
	xVqVSL+TUhYfgol4lt6wjlOTNXRYL8hIrqM67sOQK+PO3Trj0+1LjPRbHsuEhgeZdC5TiR3Id1t
	+3x+B9LBxYknav200JSG3+huUWkriajS7CC3pd55cqf6scQ4mKFcOugrN/ud7dFqk9DzVVYABzV
	LhGXzIY+EWIijgKmfXQK7S7EkFI3qBvbomHkIhnxElU3mkBwOV3
X-Received: by 2002:a2e:be04:0:b0:3a6:568f:40dc with SMTP id 38308e7fff4ca-3a9a2bd9398mr7050691fa.2.1791396794682;
        Wed, 07 Oct 2026 11:13:14 -0700 (PDT)
Received: from localhost.localdomain (95-24-167-79.broadband.corbina.ru. [95.24.167.79])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9a1d59661sm9000041fa.18.2026.10.07.11.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 11:13:13 -0700 (PDT)
From: Maxim Skokov <skokovmaksimevg@gmail.com>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	memxor@gmail.com,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	vadim.fedorenko@linux.dev,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maxim Skokov <skokovmaksimevg@gmail.com>
Subject: [PATCH bpf 1/2] bpf: test_run: Fix false -EBADMSG after skb leaves CHECKSUM_COMPLETE
Date: Wed,  7 Oct 2026 21:12:41 +0300
Message-ID: <20261007181249.352831-2-skokovmaksimevg@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261007181249.352831-1-skokovmaksimevg@gmail.com>
References: <20261007181249.352831-1-skokovmaksimevg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With BPF_F_TEST_SKB_CHECKSUM_COMPLETE, bpf_prog_test_run_skb() computes
skb->csum over the packet from the network header to the end and marks
the skb CHECKSUM_COMPLETE. After the program has run, it recomputes the
checksum and returns -EBADMSG if it does not match skb->csum.

bpf_skb_change_tail() resizes the skb with __skb_trim_rcsum() and
__skb_grow_rcsum(), which move a CHECKSUM_COMPLETE skb to CHECKSUM_NONE
and leave skb->csum as it is. The post-run check still compares against
that stale value, so a correct program fails with -EBADMSG. After a
trim, skb->csum still covers the removed bytes. After a grow, later
writes cannot update skb->csum, even with BPF_F_RECOMPUTE_CSUM, because
skb->csum is only adjusted for CHECKSUM_COMPLETE skbs.

skb->csum only holds the packet checksum while ip_summed is
CHECKSUM_COMPLETE. With CHECKSUM_NONE the stack does not rely on it and
validates the packet in software, so there is nothing to compare. Only
do the check if the skb is still CHECKSUM_COMPLETE after the run. A
program that keeps the skb CHECKSUM_COMPLETE but leaves skb->csum stale
still gets -EBADMSG.

Dropping the checksum offload is documented behaviour of
bpf_skb_change_tail() ("implicitly linearizes, unclones and drops
offloads"), and the stack does the same in other places, for example
skb_forward_csum(). The test harness has to accept CHECKSUM_NONE either
way, whether or not the helper is later taught to keep
CHECKSUM_COMPLETE.

Fixes: a3cfe84cca28 ("bpf: Add CHECKSUM_COMPLETE to bpf test progs")
Assisted-by: LLM
Signed-off-by: Maxim Skokov <skokovmaksimevg@gmail.com>
---
 net/bpf/test_run.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/net/bpf/test_run.c b/net/bpf/test_run.c
index 513354e928cb5..45718fa9adfd2 100644
--- a/net/bpf/test_run.c
+++ b/net/bpf/test_run.c
@@ -1237,7 +1237,12 @@ int bpf_prog_test_run_skb(struct bpf_prog *prog, const union bpf_attr *kattr,
 		memset(__skb_push(skb, hh_len), 0, hh_len);
 	}
 
-	if (kattr->test.flags & BPF_F_TEST_SKB_CHECKSUM_COMPLETE) {
+	/* A helper such as bpf_skb_change_tail() may have downgraded the skb
+	 * from CHECKSUM_COMPLETE. skb->csum is then unused by the stack and
+	 * there is nothing to validate.
+	 */
+	if ((kattr->test.flags & BPF_F_TEST_SKB_CHECKSUM_COMPLETE) &&
+	    skb->ip_summed == CHECKSUM_COMPLETE) {
 		const int off = skb_network_offset(skb);
 		int len = skb->len - off;
 		__wsum csum;
-- 
2.47.3

