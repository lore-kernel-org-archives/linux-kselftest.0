Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792950026;
	b=mjmO6p2GDow6PFK3xfWt7mtXjU5ZUlEPSFUOFCp9kLbuL2Nyl70xnBeLcrNZggyGqJ3W
	 IBjtKPs0CTuCl3UqotbiFmXpitDN8cOAB2SooKW0ugl/zeB17be43G2Z3jInyDkFN+Dq+
	 w6EFY1OBjVW+ctMYxCQVK/mSkZQIKdMyAdsuZJk/9sCkBsgPnDjm5V1JVEFdYps8jogMJ
	 pM06id3tJTIkn+DLt7X68wdkhUPmRKCcHVsOXULmhoe6ep/DvF+kKkn7nvZJgyBC/8jr7
	 w2QD7hkUlaj+YDNfU4YG1NCmzrjADiOyeiK49cFzRB6t7R47dk4VOCOcRLirVrtdY/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792950026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Z1nKV9RROXIYz6IEYr9bUViL602rE2TVHzP14wnkAeE=;
	b=QWmzgyH6db6btyIS34wj8l6udHm7Ssgv7Xjimqg8kQjVD5B8KBeXTqIvxSjIYFKlbNex
	 MsZuW12FTssIZS1qHTwNWP980gTAEVVjqdRJO2e817MBJq0sBowiRmcaC02li50T4T0Du
	 1Yr4IOyPtHp0E8r0zSt8GJH+gXwK8Ic5oq0w9cgDWRJMKzWcnoxW/Q3n7qza4fvyC913B
	 a8XzflAkPop/nS5+7Qry7t1nKwzun38CT8bjgKRPUGD841Feqpa+eWhaZmDGBZhs6xRp4
	 ZySDwTHGSqXcNsGWRCe30wYIkVZthV2faIqZ1e9+WbmY7vH4irWq43zxRQLoOLJxoPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=DctjwVz+;
	arc=none smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E69606A323
	for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 17:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68E69606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=DctjwVz+
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5eafa528803so830964e0c.1
        for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 10:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792950025; x=1793554825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z1nKV9RROXIYz6IEYr9bUViL602rE2TVHzP14wnkAeE=;
        b=DctjwVz+9328llN8524p+Cmds/Q+140TdZ6g7BvRcUzBT+WE6FsC0MGdxSUJJONf3L
         JzYBygsyhxXZIUqBri5ZQbsJn1fxnKYmhZr9R6WDH0QceOPsk5VnfbFCG+jZpal6U7L4
         njmvCvamubQ0hOIMW24r7QhKqNBczi6DAV27yhHPnArpdhRPlUkeSV9UCJlDrNYp8pc8
         Ywd93CR+ptwXQY7Ck2Xca5L3oD2bXvekKoIaz09/rFTR/yoI7n1VXvVRDfKN+f/Nzonf
         9WpyxKr/YRx/PtrWLwG8+q5AmVbj1tuX9xcFnPxOwALjB8mSjVLBsSMsCnrEeUw82W1P
         M/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792950025; x=1793554825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Z1nKV9RROXIYz6IEYr9bUViL602rE2TVHzP14wnkAeE=;
        b=ZDNTLYwj7HMwwXzAs/bwd3r7qez31mkhqNSH1P600NQlS4I0VejNwWBEPSrmaUkyxD
         1pfgrHptwg3Mz/OebA7wR0VTQo6AmXDiJuW1T0EOdHDCV1//PuccB09Xr3bu81wCHtNh
         Vg0Kzj9gbkijq9/O/jfPj8/JFqKQ1BGwWOUF3uTG042XEx8qgzma/oUoFbQfmxeHKJCk
         qlfXJLGmX/eVCoXloZ2WEQfsn6tluqBbCK6yM2644GHVPd74A5UcZwhhrgBQmjpf994X
         /othXvTOeJp541wt0u07FpMP7epaAcL36Ptxr9ZKFVKCUhJVAcYFpmd5yUc4HtGvIg9Q
         xhnQ==
X-Gm-Message-State: AFq9FYJ9HhbOqmaGySnpQPG9LT0owNMfcEdGDmvPHW0FRFLEYDVZmkiy
	Gy9xC0vMoGlEBAKi4DqZxyOVp5mz2rYNR0Akj/CiwOyyPhWUUK4IZUu3tD1J4OKrKkJh+3aFFH5
	Jf/9j
X-Gm-Gg: AYBFou2ku0NOfDmO9fTPq/ek4XNgeLUEunVvgIoyrnYwhYlk5lBnhs2gc/TP9PEixny
	1IJdeEqcIMTFBuPNZ5GUt6Zk7+rA+5cCQXnefgFf1rhp8W8LxOHbibzvVv/2S4Gtg22TdSeUQLp
	+6fMzLQfIsyjffSogXQGrAMR1OpB1qBxumq8VNJz+qvFNF5unndGBhs1dTSd3GQBC1IwyTlwKFC
	EAW51/7AxNTWeBWmg8CCR68QhVS3kut8jbNAtDF65XJSuVU4ei64parsHRBwKyxR2uY6KSS/87e
	KOP7UMdkimd19Pbp28nllx1Z0T4PzfW7HwSYlekYhPNMkW50CaVd+3hxISPOusTc7DV6YUxJ3bn
	Mv3+tTLUHt7164ehNAU0CYmHE7yRlQ94tR1YNaXRGze6eNLYgCi8nOvyhAYQXglFYyfMWWWKmud
	L3S3bF9IHPTVxpq91Lgwi+59l+ssM9w/P5XORvCdDS1RJgvJPukdScEjoJxYe+NZ0fzXTGZ3+WM
	a6wlKH60/K4h4J37RCMQaC0bwQDFBMTMB5ZG3rhexBXEaAte8Xubzdd1nnPrGQpBc5pxCXBaVRC
	fJIbhwmhA0X3QSTT2LnIR66ePX83LD4QqOdd2wbt3z3bYSaqSR5wV8ybfreW2tUuoOJ6ml58cx+
	9
X-Received: by 2002:a05:6122:83c3:b0:5ea:d1c4:7cbe with SMTP id 71dfb90a1353d-5ec2332c72bmr1427722e0c.23.1792950025414;
        Sun, 25 Oct 2026 10:40:25 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec234673ebsm5783333e0c.13.2026.10.25.10.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 10:40:25 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	kuba@kernel.org,
	enelsonmoore@gmail.com,
	bp@alien8.de,
	shuah@kernel.org,
	david@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	vbabka@kernel.org,
	dapeng1.mi@linux.intel.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	surenb@google.com,
	pasha.tatashin@soleen.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org,
	elver@google.com,
	graf@amazon.com,
	lirongqing@baidu.com,
	liam@infradead.org,
	jlayton@kernel.org
Subject: [PATCH v2 4/9] kho: do not modify incoming serialized blocks
Date: Sun, 25 Oct 2026 13:40:11 -0400
Message-ID: <20261025174017.3870481-5-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261025174017.3870481-1-pasha.tatashin@soleen.com>
References: <20261025174017.3870481-1-pasha.tatashin@soleen.com>
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

When restoring an incoming block set via kho_block_set_restore(), the
physical chain of blocks is already linked and bs->head_pa is already
set. However, kho_block_add() unconditionally rewrites last->ser->next
and bs->head_pa, and kho_block_set_shrink_one() clears
new_last->ser->next even when operating on an incoming block set.

In the upcoming KHO read-only mode, incoming serialized blocks are
mapped read-only and must not be modified. Guard the ser->next and
bs->head_pa updates in kho_block_add() and kho_block_set_shrink_one()
with !bs->incoming.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/kho_block.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/kernel/liveupdate/kho_block.c b/kernel/liveupdate/kho_block.c
index 0d2a342ef422..a4e945f28fad 100644
--- a/kernel/liveupdate/kho_block.c
+++ b/kernel/liveupdate/kho_block.c
@@ -93,10 +93,12 @@ static int kho_block_add(struct kho_block_set *bs,
 	list_add_tail(&block->list, &bs->blocks);
 	bs->nblocks++;
 
-	if (last)
-		last->ser->next = virt_to_phys(ser);
-	else
-		bs->head_pa = virt_to_phys(ser);
+	if (!bs->incoming) {
+		if (last)
+			last->ser->next = virt_to_phys(ser);
+		else
+			bs->head_pa = virt_to_phys(ser);
+	}
 
 	return 0;
 }
@@ -133,10 +135,10 @@ static void kho_block_set_shrink_one(struct kho_block_set *bs)
 	kfree(last);
 
 	new_last = list_last_entry_or_null(&bs->blocks, struct kho_block, list);
-	if (new_last)
-		new_last->ser->next = 0;
-	else
+	if (!new_last)
 		bs->head_pa = 0;
+	else if (!bs->incoming)
+		new_last->ser->next = 0;
 }
 
 /**
-- 
2.56.0.307.g5fe7bd680c-goog

