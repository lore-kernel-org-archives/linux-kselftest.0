Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674803655CF
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 18:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780684924; cv=none; b=WGmTlI9XpwJerzPSTRL2lH/xA/UVoaFmOqLKMsKr7ptSnv8EdU0hG6Q1EtWf+7LZXc9FbLk39OHCxwkH6geV3iyoQm+PwU4JfUo2YMZQh6C03theTGrTCk5zsdiH80gy7Uyp97z+/av2Zbue4qnyMKjQVO254c7XwdJWc0rh1tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780684924; c=relaxed/simple;
	bh=syqDKQVb127qXyQlw3Eni5jB/EAn4byQMNt5RzflBVM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nmkTgwDCQx7Pon6e5I+HgsUROhQRpbk3gkRL/7/xxoAkuNKvedGaKQs0/cSEbm655qNOEBXAPH0VFmDFamLGSRTPtChRCpoQonsE6Cc2Zc68BQWYwdpt79kPoUqdEO0Vhq2mQ2O4dl8mO/d6/ttu8WVJH1Uxute0tuPe/OLlveg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=AkSIsGXY; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="AkSIsGXY"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5174a1da4b2so17556561cf.2
        for <linux-kselftest@vger.kernel.org>; Fri, 05 Jun 2026 11:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1780684922; x=1781289722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9dziyAFDBMS+ZSt7oFPGlKy1Vv4XAHLNgQ9Ot2eQsEo=;
        b=AkSIsGXY3CAYHKI9+RWZtx1Seo7xf8kie5qtQOu0MBIVGSqGhIsWlLN1VnMaJfr92G
         5L6DYmHErCj2ZUk0L8ordMUJqjLfV1P2l4dvYKhUoRTFMllaAUQK4W03Pkt1GIKkjSaX
         +1MywC5JL21BYOPITxCtlCFSqyIHWJCOnuZjuvig4NIK2OkY4CARaLEt1qNAHeK1AAgq
         yb2SWXCvDvXGd42J5oCvvxYsUKL51Y8IXUSbrnwlx3QT929WIxr9FvD8cS9+gzy+yvRP
         qFJQZqO6W0vIlJz/sdLqGo84T2TjCcWvniImOZeLY8RAcqFuP8aj+Ao5kVxpyW7nqjNq
         mWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780684922; x=1781289722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9dziyAFDBMS+ZSt7oFPGlKy1Vv4XAHLNgQ9Ot2eQsEo=;
        b=CRdcgz/bYJYJVIXMkcXqq7u0qr/es2wiwfr8xudZtelZ7ObcCyxwi1quyUUi69aGBr
         ToiOeJTenTXfMV1FwNOn4JQAyfSQ/fB+khN9UxBXwjAJ12kzQ/w4gbgM9tZy5x4D32kZ
         Tz5EEIcoj0AFmozWkXpCw/BHL+FEZBMb9p+74hM83OAkNQbmEBcrJdW6Bx5dbW2mSs3d
         jAXRS3VapfIajdg0EA7IcIhYLzZb70u2kVL0IUwakb3aqI3xnvPz77GM4sJI5tfAPnLz
         +mFqkBW+bInhM7/TYfjqWWCLJEnH5nZRhz46pX9qOdVWKW5ft4d9IAwZ+g+oV2t+2wZo
         Rf0w==
X-Forwarded-Encrypted: i=1; AFNElJ+1ru7mH7j3rjWC2rbs68yMlA65zbTjR4uoeZXSlSrc04KHBzG9y8/et5slrOECTYiAec86WiHTnPz73G9UvBA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFAQpGkhZ389KVZw9iR2e5TkjxxiIsebFrDPfXllEOZxldgxYf
	FjHjdSjM4UW5/ESiL36OLvxMTu9qInes7UZjs7yZEJ9BD0UHVmjY2ZgsaDOvlQO43/Y=
X-Gm-Gg: Acq92OE845ZRLtUIsVz3/N/UbqATySfdld2rPibo47NaltlOpztsKQMUPF5fPKIg+7x
	vcRhB8NqmvE18u2quUHhmkFB6iOZ2BjfU6za+8UY1bjWF8d6s9rUVG8KA+ospE1oo40SqsHZYvE
	i4e9x5FIqt6+764Rn9Wz7MGkMwGB8MC67nIifTCLKoO3tiifBBoAGI6dUJ0zjMi5JHG5/eukavW
	JrJ8mNuERkK6cvDtUkR527RNgESuQG6hKGr3ZXkA7Y+xzzxf+d0OuVDGRI/C3x7tLw6VmnrazJn
	1/XEfj5yQZ4z1Te2gQD+GWs/2a7ypT3i8m4+poTWjPwuZur1En2zGypaIJaQU+iIJ9D1L0/d/8Q
	dS2KIxh9BNwU38ib+T3Kdr4gjMCwl44zjrz4lI5hiBRtGqNQPCbEI5+DYdNyGwO+6rElWaK96RH
	LxyPDndNm2QA14ZfVbiZ6agWkoddzpE1QrzTvoaw==
X-Received: by 2002:a05:622a:4c13:b0:517:8f2e:5d9e with SMTP id d75a77b69052e-51795a71833mr68589031cf.7.1780684921860;
        Fri, 05 Jun 2026 11:42:01 -0700 (PDT)
Received: from localhost ([161.35.96.86])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-51775c2e2casm85460011cf.9.2026.06.05.11.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 11:42:01 -0700 (PDT)
From: Samuel Moelius <sam.moelius@trailofbits.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Samuel Moelius <sam.moelius@trailofbits.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org (open list:MEMORY MANAGEMENT - MISC),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mm/page_frag: reject invalid CPUs in page_frag_test
Date: Fri,  5 Jun 2026 18:41:52 +0000
Message-ID: <20260605184157.2490353-1-sam.moelius@trailofbits.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The page_frag selftest module accepts test_push_cpu and test_pop_cpu as
signed module parameters, then validates them by passing them directly
to cpu_active().

That validation is itself unsafe for negative or out-of-range CPU
numbers. For example, test_push_cpu=-1 is converted to a very large
unsigned CPU number before cpu_active() reaches cpumask_test_cpu(),
which trips the cpumask range check with CONFIG_DEBUG_PER_CPU_MAPS
enabled.

Reject CPU values outside [0, nr_cpu_ids) before asking whether the CPU
is active.

Assisted-by: Codex:gpt-5.5-cyber-preview
Signed-off-by: Samuel Moelius <sam.moelius@trailofbits.com>
---
 tools/testing/selftests/mm/page_frag/page_frag_test.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/mm/page_frag/page_frag_test.c b/tools/testing/selftests/mm/page_frag/page_frag_test.c
index e806c1866e36..c8584d0fdeab 100644
--- a/tools/testing/selftests/mm/page_frag/page_frag_test.c
+++ b/tools/testing/selftests/mm/page_frag/page_frag_test.c
@@ -131,6 +131,8 @@ static int __init page_frag_test_init(void)
 	init_completion(&wait);
 
 	if (test_alloc_len > PAGE_SIZE || test_alloc_len <= 0 ||
+	    test_push_cpu < 0 || test_push_cpu >= nr_cpu_ids ||
+	    test_pop_cpu < 0 || test_pop_cpu >= nr_cpu_ids ||
 	    !cpu_active(test_push_cpu) || !cpu_active(test_pop_cpu))
 		return -EINVAL;
 
-- 
2.43.0

