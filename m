Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FE818A6CF
	for <linux-kselftest@vger.kernel.org>; Fri,  7 Aug 2026 07:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786086959; cv=none; b=N14F6zzYJkIyXoQm3GEAAFBJewzFZpPqIS2dEZfSoqqjcOE0RE/LAV0+MbygnD3g8Lu7HBlVF5Sh6p9g7sVPbAw7NQV36Vh93XffCkHkHUL9wrsgtnIz76bJza748PBhLBXI2cQzDjZHepFHpBkYtfchKYcWppJh2YeSm0C3F2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786086959; c=relaxed/simple;
	bh=OI7QrsMQNhBkUbXbDedXRM4+k89J3FHmGl5n8mZroyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lHGJ27gD71LQxOUQvl8CICHKW5384JRihVR2oyk6Uakeam3woeor/07EFQSnNHNadCTTXOqTjnd+GBhc3oEyFKbabrrCWYhoCEHB0LM4OMXPQcfupMCVP58LAsgXiIajugTHvuLetTL2OCbzYZKJJVsuGk0WX4rtSRqIikHA8nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oYyA4hTi; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oYyA4hTi"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786086954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l4DWvEGYbao3vqUAJY7j23ePYp52prm/BteFU7Kg8VM=;
	b=oYyA4hTiStR5sbH3FPHxiOI76f0UYzrrcwsX51RqGMtYzV/aHmKaypBzke7NaK4fgYs3ae
	cyCIxSiTD+8iylSdqeVzsKiTtrBZVrJ6uJpNQc14z22gO3wJe57xeUDXG3oHK6VKr3TaSq
	/WQpafIFXAchGBmT973PI/8Ry0tvv6k=
From: Hongfu Li <hongfu.li@linux.dev>
To: sj@kernel.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	hongfu.li@linux.dev,
	liam@infradead.org,
	lihongfu@kylinos.cn,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	rppt@kernel.org,
	shuah@kernel.org,
	surenb@google.com,
	vbabka@kernel.org
Subject: Re: [PATCH v2] selftests/mm: Drop duplicate test_seal_mprotect_two_vma_with_gap() call
Date: Fri,  7 Aug 2026 15:15:33 +0800
Message-ID: <20260807071533.48130-1-hongfu.li@linux.dev>
In-Reply-To: <20260807003126.81629-1-sj@kernel.org>
References: <20260807003126.81629-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

> > ---
> > v2:
> > - update ksft_set_plan(88) to 87 to match the actual number of tests
> >   after removing the duplicate call.
> 
> I wonder if there could be an automated way for this.  Obviously not a question
> to the author but just my loud thought.

Glad you brought this up, I totally agree with your thought.

Something like the below refactor could achieve that automation:

+typedef void (*test_fn)(void);
+typedef void (*test_fn_seal)(bool seal);
+
+static const struct {
+    test_fn_seal fn;
+    bool seal;
+} tests_seal[] = {
+    { test_seal_mprotect, false },
+    { test_seal_mprotect, true },
...
+};
+
+static const test_fn tests[] = {
+    test_seal_addseal,
+    test_seal_unmapped_start,
...
+};
+
+
 int main(void)
 {
...
-       ksft_set_plan(87);
+       ksft_set_plan(ARRAY_SIZE(tests) + ARRAY_SIZE(tests_seal));
+       for (size_t i = 0; i < ARRAY_SIZE(tests); i++)
+               tests[i]();
+       for (size_t i = 0; i < ARRAY_SIZE(tests_seal); i++)
+        tests_seal[i].fn(tests_seal[i].seal);

Though I'm still unsure whether this extra complexity is really worthwhile.
