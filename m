Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.229
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389832;
	b=BlpXVbpSkcTFfx/Y/il2a2Mc1XX22zT5bPOgdLwz6WX+QWsc2IBCePVD8EQmtTCeI6et
	 nmhw09yDmwrJP1LzaHF6QwWFJn8NNVIfCr+4y1aH6o8USnC0JAhDpi9zKgQRTW2h8LMmZ
	 F4Mv0I9TGj/Q3h3vvd6l0QDJudgcKk46MEL2AqgXjtE9Qm6nR9RPBAen6/6RxDEhn2jd6
	 5aOCzXb/Tmnjz7KRza8lDg5Sfg9IXpAXtRoPy0/VB4/+EJJGTecYyztWXjWrYfagLdGb+
	 xpWQxePb+X6jjh3jej7AWMKc4/gsXYVcGh1dR5C4xM4ynVRAMwprNb6gMzQ2/ZPBaJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389832;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fU9XfcyXyDYY96b4oLkbxP2QCB6xnQM84ny0U+EIIak=;
	b=0lvIsm5mPA0HY2GCHVF3pQ8TZIzIwd/jyYwwWFTX+aY9e/VV7nOjeD8fLK5vCpHb21jV
	 vQyFos0NFMBNYK/35sI7iODAIDLrdYQVCVHibUwRyC1dTHyld9d6e6FLo3fK6xAZ5thrW
	 HHRTWWTSL2OoBBKEhpiho7uPMDSIhr2GO/FSBmqAF9+VrROsnCsnEF5BnVSR8E/eX4p7m
	 pylWQ5tJuLYhYfkQcaYYo6lGTRkSWb2B2jb+5pKMHkTnNb6h7NTk+AjKvPk4XD/37gx5a
	 PAedIrm/B7QiH6vgIV+p4L88BLw6NusmuVJXdsofd5NQD29vWSvWN+DOcDbAFXUnrhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NCG1t34W;
	arc=none smtp.remote-ip=95.215.58.229
Received: from mta1.migadu.com (out-229.mta1.migadu.com [95.215.58.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354D6606A321
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 09:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 354D6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NCG1t34W
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6wp3khVZFr9nCgPoeJN5KkCAJtgzTDUmCQsA5IU4RCg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794389827; v=1; x=1794994627;
 b=NCG1t34WKyBUf0tl84L2OJ2uuUgCKiHRv5pALWp/FcCwgoX/vp3LA3T0ZWQAB4YbJrZ4Rn0p
 pFvs5QnI+rcSvi9h0WOIk6j/cPzqipj8tfQLzB2C/zzb7+sjjsXBQZ8sl3hkv9mdqDcQ0ecKHD8
 nFpv7YjoNYWjB1Rb3FTkxU5c=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 3265524654880463;
	Wed, 11 Nov 2026 09:37:07 +0000
X-Mizu-Trace-ID: 3265524654880463
X-Migadu-Flow: FLOW_OUT
From: "Xu Xin (vivo)" <xu.xin@linux.dev>
To: david@kernel.org
Cc: akpm@linux-foundation.org,
	chengming.zhou@linux.dev,
	link@vivo.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	tujinjiang@huawei.com,
	xiao.wang@vivo.com,
	xu.xin@linux.dev
Subject: Re: [PATCH 2/4] ksm: skip rmap_item allocation for non-zero pages under only_merge_zero_pages
Date: Wed, 11 Nov 2026 17:36:57 +0800
Message-Id: <20261111093657.123292-1-xu.xin@linux.dev>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <5445434f-078f-47d8-9851-dcc3712d18f1@kernel.org>
References: <5445434f-078f-47d8-9851-dcc3712d18f1@kernel.org>
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

> I think we should get rid of any rmap items when merging the shared zeropage
> only. That might require more changes to the ksm code, but it really doesn't
> make any sense to have rmap items.
> 
> Maybe we just want a separate KSM infrastrcture that only focuses on
> deduplciating shared zeropages in KSM: get a page, see if it is zero-filled. If
> so, try deduplciating with the shared zeropage. Done.
> 
> Mangling this into the existing infrastructure might look easier but it just
> adds things like additional zero-page comparisons and (as Lorenzo points out)
> makes the code harder to understand + maintain.

Makes sense, I agree.

I actually thought about doing it this way at first, but went with the
current approach since it looked simpler back then. Without needing any
rmap_item tracking for zero pages, we can avoid rewriting scan_get_next_rmap_item()
with more complexities.

Splitting them up has two obvious wins:

1. ksm_do_scan() becomes much easier to read:

   if (only_merge_zero_pages) {
           scan_get_empty_page();
           try_to_merge_with_zero_pages();
   } else {
           /* existing logic */
   }

2. We can even add better filtering in scan_get_empty_page() to speed up
   empty page scanning, without making scan_get_next_rmap_item() even messier.

That's a very constructive suggestion. I'll rework v3 this way.

Thanks,
Xu
