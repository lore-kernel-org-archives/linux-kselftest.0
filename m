Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B65D4F0531
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 17:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791568101; cv=none; b=dRSUjdDmdzGevRoDSfkx5XKCoyylzR3hOMfrrQhX3i0FlMke6ySJYM+u/SG+dYCae4+7Y0gTGAIXCN3G+eCqVBUq0R6W//yxQKrHnUriK3j0tQcdTetRO1Gy3PoJxgwjCzQKIjGsRamGCo4MEgX1P6tzpN1X95KoUOqY3WiEfB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791568101; c=relaxed/simple;
	bh=ZB+QhjWlZihQRfvMv/Dj875JM0J+8Z4G9ddtInYgxfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uzkBlFx6romqzkyxQFnRdcXXFv7Z1O027VIwPeBH8CYdG07T8y3MJCySpXr/fV3+R4RldrNkmKdCDojkjbX5/aXmrfTZjTbXQ+GBjy3XZvVuocvtZOOre+lSTPiWY8hiEupctQB5BCAbIt9jfspvJZD5zNEeVYw5IJEHIp8yiUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=biE+TwwW; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="biE+TwwW"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bb7c6980f1so3719237e87.2
        for <linux-kselftest@vger.kernel.org>; Fri, 09 Oct 2026 10:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791568098; x=1792172898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vIoLucY46RoOKAE4YSSq9qK6HFpOXQ4Dt4VNaChanAo=;
        b=biE+TwwWREc9Dgg/R0yHvgk7JCDD01AOWNsS3sAKOdxatRnJ22vN2FmAKMpWXqd8el
         mtfE1dxIOwze2nRvYlCmINnmG4ifPn1HAaIrnXx+9OxFGFNMXEpUBSJaoeJomW+nax3N
         LES0AaCT6xs1xfhQZbrfqMRc4UiXuJJ4t+uLdCX5ziQFlwTp1gVPT1EJA0feyrddCQR6
         TNsDYx8Bu7QLG30wPzXfgcXZK17G4IHOZadX89C08HQw+lWYbJVpWl6pgHRtFa6yk1Tb
         NXkkBqvuNHEz3RKsWwWaQpjAd6a8AvjmHhZ2MHspbnDMIQ1h2mmFe3/Sg8TCf+OPfaWP
         KTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791568098; x=1792172898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vIoLucY46RoOKAE4YSSq9qK6HFpOXQ4Dt4VNaChanAo=;
        b=IhZu0IT91bo/saIL85+9ZwT4BHxLRpeLtPdPP1FSXnJVOp5szH7cRcYcgI99eDbUIl
         xlFPM7ehU2GnQc+dcL4akgoduRzF2HSZ+3qpEeR5wVIBLa8CuNqscr4imuuTUALZESWX
         W+SEZdKoiNFq6qVQ/AkVTgt8IfNwNxV+v2JWwArjo8RoVxaXOc2Dvp06B7S59KyVFcm/
         9KRjmP3l7K5FlyR67um8ZviREPLLkFVtNumfucZa56xZBGrXhpR82pXDrEVnH/DXSGWw
         ybPOnWQz8qJE3J3yghiy+Iuxokoz/zpcTu0gCqI1wKyIc+yttyBpQhhv1eaIQZWDMPr5
         vWyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFn5WoPyGGCVsi/mOtZK1U/BRNrVlEatRjoTNB7cg4Hs+imJPUu30Nvf7Pt4lTToCga26ndIt4IHeAd1Fs8qQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyGmKPJ33VqHf3zRMOsCRTnOh2tMsQJWcDNeSeNZ5GsThREYzz
	0FBF+N8lZ0JAR6pCxBxNFSIpvAA5YVhE0R2kEM546l5MUb8pG0ECMIok
X-Gm-Gg: AYBFou2wZzmQg88+NQqRoSppjBB6WLj29qtiThVK2+WaVmi+mI/kmKgUFGtkiO/24py
	K2BQRREDiMZ0+S6xM3XufCmblis5GSJp8f3VyEv9QYDRR6EkGrQxl+GeTP9DI0gnIrj5t+hMVQC
	iN4cXmxOkNR4Ksy9Ak8NpG2xV/OMIfP0idfVnbHW55w+k8RxvdMUjcKNKNn8is7ejKlYFKscAYw
	rUpljqS4sKX4UqVNM0a4u8c5rsRoLf/xJ7zrSSEXaqVc+I1H6AddBfzwYsCNf6E74yZM4y262JO
	oSH3y68xH5R0aoFXQonvqCI2ElPmpzp3SJaLPCGdy8/uBuCOQjFzxZ1OZJe/VpSX8MkBNU1vdK0
	BpwrlnOkQjz630OVYbRu83CEYhpKTnyMmTk+HISpXzBW/FD1ZWc/uIasdt4XCvJJBB8fhWyO4h3
	mwSOH6gZNrYs/ItWKMUIhb13GB2W2q9YIXgtjNrEm16ZLTHEuGV22yOSV/jaPYkuKQZL8U5nhvG
	+bT7MpzGmBlpDawZWTDQ0qcOOG+IJrJCBpG5vGo0ZuoUTmO4IRBEB1O+ISf+SI=
X-Received: by 2002:a05:6512:2c8b:b0:5b8:bc5e:d0fc with SMTP id 2adb3069b0e04-5bcde6cfc3emr972437e87.38.1791568097844;
        Fri, 09 Oct 2026 10:48:17 -0700 (PDT)
Received: from localhost.localdomain (95-24-167-79.broadband.corbina.ru. [95.24.167.79])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcddeb5604sm852635e87.63.2026.10.09.10.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 10:48:17 -0700 (PDT)
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
Subject: [PATCH bpf v2 1/2] bpf: test_run: Fix false -EBADMSG after skb leaves CHECKSUM_COMPLETE
Date: Fri,  9 Oct 2026 20:47:47 +0300
Message-ID: <20261009174755.22026-2-skokovmaksimevg@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009174755.22026-1-skokovmaksimevg@gmail.com>
References: <20261009174755.22026-1-skokovmaksimevg@gmail.com>
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
 net/bpf/test_run.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/net/bpf/test_run.c b/net/bpf/test_run.c
index 513354e928cb5..d73cd247f8cd0 100644
--- a/net/bpf/test_run.c
+++ b/net/bpf/test_run.c
@@ -1237,7 +1237,13 @@ int bpf_prog_test_run_skb(struct bpf_prog *prog, const union bpf_attr *kattr,
 		memset(__skb_push(skb, hh_len), 0, hh_len);
 	}
 
-	if (kattr->test.flags & BPF_F_TEST_SKB_CHECKSUM_COMPLETE) {
+	/*
+	 * A helper such as bpf_skb_change_tail() may have downgraded the skb
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

