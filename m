Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429933;
	b=UpLjyw5FFrYpAAuRU16kXv51SCp54TRDVuLmWADMextDuosiBX1/d5vLoOe8f8qROxHA
	 oViQrAkgiVsQKrgZvFRwCtJi2v+Px3wXJwaDFhnPFISSC0T8rRkE8SVeZcQZ4BNXfyJJ1
	 f9PWlmDS6INFMN61hFEaPEBltB0AFuF/cgsowLg4AQDOHX8MEe47m14rP8HyDzlUak3kd
	 lqNwR2ez7wtV6OtF5hGr7dg5BqwrX0URO5r/lo/nuF0m0mVgNTVD1w84vrxeYR+lXLPOK
	 ZvWm/K1pMZ2Y2v+W5WMf6jfejpveQ+n6/Rc4SJMPWjLXL9Gcy4GIY3LsD+DTeWggGHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429933;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NSkebjJriJxD8huVKtJ/dZPvDeRsYwUsy6nc9NLY9s4=;
	b=WYtHHu8OCr4cDOFA/MGTGSXO02aa2ga3AvhtecwsE5xtyxx0pplVnkoyrd4wc33lPMkb
	 xBY3brZ15h//6JWBb4cMS8fHxCU6mL5qy7C2cyPt0EaOe3MLyTd78WJh6slmcLZKfaIZs
	 0w1ZCToYtmHBiMQ9+w0GH0PQQ1of8qC+01TFUld0/W7ckVrEZOGjliaE6+YxW0gshXoUh
	 nujnF/uEk0axHaKUAc/5zzkPGzHOk+6afqRoAtBeFnrptY+z7Sylux+EwK5JLmbslgP8t
	 WdWtatpToVj8ToVHfkUYrXH8wbWME8dZ6kvajvPA70w5YTE8NUlvUdujEtZlncIMD5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Rs+IINv8;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40209606A331
	for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 17:12:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40209606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Rs+IINv8
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-919abb3335fso20160606d6.0
        for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 10:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792429932; x=1793034732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NSkebjJriJxD8huVKtJ/dZPvDeRsYwUsy6nc9NLY9s4=;
        b=Rs+IINv8Uo+hZJT3YE39Kmz26IQAlH6dRyDbzyySNky+H3Ni9TN5xhTkyRn5QcuYhP
         2vN7m9R/1Xt46k76AXo9EXqR++vmoi78dYd5cSFme9Y3nZDYVqITIWItHVyThfn1DB4b
         awwOjsoO0Kqo1XMIaO9QoOkCmFJSMOl5tTicC4HGI24n3qy501m2sYzf6im3g+bRBYEG
         hkbRlDCmn1fXcyKl9cRdQhcvupU45rHa5OUJRxpuk/J3rtvEb/0HOnO13Kg9fmTG3foG
         SUnMh1fyQHg0NkLqgf9JPmwSSmEtuRAyFAiaQnwukYFKIPjfmqQxflkagNpS1JBz4w2y
         ROlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792429932; x=1793034732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NSkebjJriJxD8huVKtJ/dZPvDeRsYwUsy6nc9NLY9s4=;
        b=pILvwqrYNEKb++tFAkpvFW1qQUKaa82pK8h/OmT9LT3II3452MAYDjwntpqa+sqDtg
         dey/jGOom7kNBKGexpGVSpAXLbRY9PSICt8f7M/NaxPAYL/fIKUxR7PSFGdiL0PgTBDl
         h+7qVL3AuXoO2S2yuHWq3j9dCe7mVuOjxTRzkzGk+PbVgMzQzGhwAvs8o+3jTZjTyXZF
         oHIRLwd0tCiLiDGomEN9DfLX72aVF7nPao8CyBjV6NVBpsxYiVhNyIuZeNnpOkmCmGGG
         FOwneKL320JIGNaSlwYeaH6BIUf5yfylcY/NBo932GlD6JypM5FwvVE2j9n8avm0DsGU
         84jw==
X-Gm-Message-State: AFq9FYKwRGgYKd9aoifWW9V1BYNQxJgJP86hgTibGqsO9BgcFrdpoQ94
	/nmWHZXhOi2JcfYbqgM8t8GQFzDrnt+AyCrl1+BxXNhCZYqUb9NNaJJBzhE0+l+D60/cNshEleG
	ISUXFX1s=
X-Gm-Gg: AYBFou0F1Px09KQYe0d18LXSwI3G0eII0g3bKTAvLMzmJcigyrS7+rUFWZcndrwREnj
	g9oWCABdPUdnXHo1ZSnj151TccjSaNjwUJOhOz73NkP/zymkL8YZlJwed058tW+3O2flagpTGqV
	WdrLy9gA5AnfGOVjKO2osoNO1D71qwaQgmykEOrbU0Jf5uy9vR07teC1hTi13JIKyGT4vtGSEgt
	shGUCFBYwtZL5OeCt009EOv9J6FEEITcYtgQ7onEhtsTiKL99tDu3KC1jXgofaQ62hI6Wm6HNUa
	lMnKnxH6QNj80JiHeikU2bFpkFnGAb/Xia1zpj1rnLEDrHj2xmhE/z1sDkOaNQjpcOHvvuiZoug
	pU2jXOqNWEh4t1es90iWH4Wu3kEOyHtaJ9oKvRrnVF6rZVSQbpRzivrtTyPBDfNAm6RKE0n8e6W
	HrrBK/uLR9/xKduTHrI/H15IRp+/y3H4ig4ZGsP9WkTe4itp5+TgVr6vRaiGG95lC8XVYXFJJQO
	YmN3V1a/79fyCvMBNT1/hE8afYc1BnZJJRo0Wwq9RHlF7RDEsAseA/xf2XByvFkjItWMbvMDAOv
	f8p1fq0H1v/yYtdA1hlPKaOEPZEe/Qc2huRIN23kKg==
X-Received: by 2002:a05:6214:dcd:b0:91b:9061:b7f7 with SMTP id 6a1803df08f44-91bdf059500mr152667696d6.20.1792429932077;
        Mon, 19 Oct 2026 10:12:12 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c040d4cedsm723116d6.34.2026.10.19.10.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:12:11 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-kselftest@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org
Subject: [PATCH v3 2/7] selftests/mm: check MADV_COLD and MADV_PAGEOUT range handling
Date: Mon, 19 Oct 2026 13:12:01 -0400
Message-ID: <20261019171206.3331374-3-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019171206.3331374-1-gourry@gourry.net>
References: <20261019171206.3331374-1-gourry@gourry.net>
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

madvise(2) accepts a zero-length range, rejects an unaligned start, and
reports an unmapped gap in the range with ENOMEM while still applying the
advice to the mapped pages on either side.

Check each of these for both hints. Around the gap, only MADV_PAGEOUT has
an effect the test can observe, so only MADV_PAGEOUT is checked for
paging out both neighbors, and only if MADV_PAGEOUT can swap at all.
Both hints' ENOMEM is checked first, so it is covered without swap.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 .../testing/selftests/mm/madv_cold_pageout.c  | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/tools/testing/selftests/mm/madv_cold_pageout.c b/tools/testing/selftests/mm/madv_cold_pageout.c
index 5d451d409937..8cbbfd4c24c4 100644
--- a/tools/testing/selftests/mm/madv_cold_pageout.c
+++ b/tools/testing/selftests/mm/madv_cold_pageout.c
@@ -141,6 +141,86 @@ TEST_F(madv_cold_pageout, locked_vma_is_rejected)
 	ASSERT_EQ(munmap(mapping, page_size), 0);
 }
 
+/* A zero-length range is accepted. */
+TEST_F(madv_cold_pageout, zero_length_is_accepted)
+{
+	char *mapping;
+
+	mapping = mmap(NULL, page_size, PROT_READ | PROT_WRITE,
+		       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(mapping, MAP_FAILED);
+
+	ASSERT_EQ(madvise(mapping, 0, MADV_COLD), 0);
+	ASSERT_EQ(madvise(mapping, 0, MADV_PAGEOUT), 0);
+
+	ASSERT_EQ(munmap(mapping, page_size), 0);
+}
+
+/* The start of the range must be page-aligned. */
+TEST_F(madv_cold_pageout, unaligned_start_is_rejected)
+{
+	char *mapping;
+
+	mapping = mmap(NULL, 2 * page_size, PROT_READ | PROT_WRITE,
+		       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(mapping, MAP_FAILED);
+	mapping[0] = 1;
+
+	ASSERT_EQ(madvise(mapping + 1, page_size, MADV_COLD), -1);
+	ASSERT_EQ(errno, EINVAL);
+	ASSERT_EQ(madvise(mapping + 1, page_size, MADV_PAGEOUT), -1);
+	ASSERT_EQ(errno, EINVAL);
+	ASSERT_EQ(mapping[0], 1);
+
+	ASSERT_EQ(munmap(mapping, 2 * page_size), 0);
+}
+
+/*
+ * An unmapped gap in the range makes either hint fail with ENOMEM, after
+ * advising the mapped pages on both sides of the gap. Only MADV_PAGEOUT has
+ * an effect on those pages that the test can observe.
+ */
+TEST_F(madv_cold_pageout, unmapped_gap_fails_after_advising)
+{
+	bool swapped = false;
+	char *mapping;
+	int retry;
+
+	mapping = mmap(NULL, 3 * page_size, PROT_READ | PROT_WRITE,
+		       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(mapping, MAP_FAILED);
+	mapping[0] = 1;
+	mapping[2 * page_size] = 1;
+	ASSERT_EQ(munmap(mapping + page_size, page_size), 0);
+
+	ASSERT_EQ(madvise(mapping, 3 * page_size, MADV_COLD), -1);
+	ASSERT_EQ(errno, ENOMEM);
+	ASSERT_EQ(madvise(mapping, 3 * page_size, MADV_PAGEOUT), -1);
+	ASSERT_EQ(errno, ENOMEM);
+	ASSERT_EQ(mapping[0], 1);
+	ASSERT_EQ(mapping[2 * page_size], 1);
+
+	if (!can_swap)
+		SKIP(return, "MADV_PAGEOUT cannot swap");
+
+	for (retry = 0; retry < PAGEOUT_RETRIES && !swapped; retry++) {
+		ASSERT_EQ(madvise(mapping, 3 * page_size, MADV_PAGEOUT), -1);
+		ASSERT_EQ(errno, ENOMEM);
+		swapped = pagemap_is_swapped(self->pagemap_fd, mapping) &&
+			  pagemap_is_swapped(self->pagemap_fd,
+					     mapping + 2 * page_size);
+		if (!swapped)
+			usleep(10000);
+	}
+	ASSERT_TRUE(swapped)
+		TH_LOG("MADV_PAGEOUT did not page out both sides of the gap");
+	ASSERT_EQ(mapping[0], 1);
+	ASSERT_EQ(mapping[2 * page_size], 1);
+
+	ASSERT_EQ(munmap(mapping, page_size), 0);
+	ASSERT_EQ(munmap(mapping + 2 * page_size, page_size), 0);
+}
+
 /* Neither hint may fault a swapped page back in. */
 static void check_skips_swapped_pte(struct __test_metadata *_metadata,
 				    int pagemap_fd, int advice)
-- 
2.56.0

