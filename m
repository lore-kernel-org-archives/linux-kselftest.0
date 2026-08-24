Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82947374E46
	for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 03:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787542549; cv=none; b=XmiyYxGYi3RToD33FRY1uBHSoEXbcd757To5k7ry0Pjh5YjmssRWs4ZkXSwbHLfPQj/tfSnVlS2w2G12Y1WCZ5BSZzjpDYD53Gr3cRJwNgjXzDe8cOxJpoYZ2tlxrwpeU9q2gUoZwjdXYiWDnrv6+5fC/FTIB1EEm2IcnxaxN4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787542549; c=relaxed/simple;
	bh=ZPJSq86XxODsr8ReS9fo29csRVH7asRRDJ2W6dyxgDI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=usOcsZ3gtLGkJLdPIQHEeip4OdBafb/Nici/eG2ouao3G7SwUS9cenVwx1T7OHZmeXPhCDpkBC0kaiR249e2soPkPafyrCmzDEDVkDEXTULJUcpv536TvM/AZ6FDXz9T+logef3c7reixOR6XimoaTqIFUigSYqUQCzEuHK/gHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nEnUIMVv; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nEnUIMVv"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84865f326efso2845688b3a.0
        for <linux-kselftest@vger.kernel.org>; Sun, 23 Aug 2026 20:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787542547; x=1788147347; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DZMAXxlnSgWC5Kd65SinCWudGpzS4DSeLZoz+Rd1kKo=;
        b=nEnUIMVvpmMlTuI/RtQGtW/efiKK2kmdiJtl2hSQj7JK+GrrN+PTZbGCf30cRAbBhD
         pDut+100XrDA1KG2bu2u+5iHny/06KuREhk0isKEUrSSgsg38aD8kVOPhG6A/HyNE2oB
         TqJBwbdGCC9WJaniQHc1ea7uDdHSfG0hJ7WbEa9Gux1gvsA8ujYSZ9RLxwxVuXNM564l
         VOqQ6pfO/M4P4PRzhERGgIWyS7KQVrOSPd8/8R+SvPyZW2gHZAAFOh5zkv7MC4kZbK9f
         C4pOia0vdzNmsmhUTv8Jj+U1ZPqVp0DbKr9lbDCz2ApCueoOJL7hUzXEweTgvgw11lpV
         y80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787542547; x=1788147347;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DZMAXxlnSgWC5Kd65SinCWudGpzS4DSeLZoz+Rd1kKo=;
        b=kW+uROjzrpwuIXQN7hqzdxm8PQZLSg37Pk4GfUrEtdQEhzQ5E7G0ePXkghxcZiCEB1
         USlG6Xrc4Dikj6aMkXee+kNDoTX8Fqo/CD6/Z03ELqbkvHKzW6dPD0ZgoKd4NHDq4PCk
         s4C39oTkw8maJsC2y+nbyVfhG81C/XHL5JFdTGsJ+iOarU1oXCqXGWUYSDg6dApAbS63
         tmvZpM6GEldhRb5R+LJM8bPPoNmipErDvlvv2IdjF9WJZAnZW0F8pypEAX77MDvCfBP4
         DEXky3JNLSq1KJY+AjckiGRWF56U7gOSYhf926DrZQks+ymtX47dMtFhHoqpOMPt+nbm
         PkDw==
X-Forwarded-Encrypted: i=1; AHgh+Rq9bbM+XdNKViLdHUkCSb+Gx92AvaxFpPHUMdXemWKLyuqlC05yIk81m/wPcO/YxmUtdKPjjWUSKwRld4kEOcw=@vger.kernel.org
X-Gm-Message-State: AFuF++kX40koqv8rdBcYl5m7Tz57HnzG+ORdC+VHUnKb+253yF1nQc8r
	tLCNAsYWzRe0x/kdnOHqeTa/M6495FVFMC72rwffjOwgtQjyC40HrqvRrVn79J9wcs5nOKaxvLE
	r+7JdlcN2sQ==
X-Received: from pgnf25.prod.google.com ([2002:a63:7559:0:b0:cc1:513e:8b94])
 (user=wfelipe job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3b89:b0:3c3:7a0a:18a6
 with SMTP id adf61e73a8af0-3cd4bca353cmr29799231637.18.1787542546697; Sun, 23
 Aug 2026 20:35:46 -0700 (PDT)
Date: Mon, 24 Aug 2026 03:33:58 +0000
In-Reply-To: <20260824033533.2147900-1-wfelipe@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260824033533.2147900-1-wfelipe@google.com>
X-Mailer: git-send-email 2.55.0.766.g2966f0265a-goog
Message-ID: <20260824033533.2147900-3-wfelipe@google.com>
Subject: [PATCH v2 2/2] selftests/cgroup: test_zswap: fix implicit unsigned
 promotion bug in test_no_kmem_bypass
From: Wilson Felipe Pereira <wfelipe@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Tejun Heo <tj@kernel.org>, 
	"=?UTF-8?q?Michal=20Koutn=C3=BD?=" <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Wilson Felipe Pereira <wfelipe@google.com>
Content-Type: text/plain; charset="UTF-8"

In test_no_kmem_bypass(), delta (stored_pages * page_size - zswapped) is
checked against stored_pages * page_size / 4 to verify that the pages
pushed to zswap belong to the test memory cgroup.

Due to slight stat update timing differences, delta can evaluate to a small
negative number (e.g. -5MB out of 1GB). Because delta is declared as a
signed int and stored_pages is an unsigned size_t, C's usual arithmetic
conversions implicitly promote a negative delta to a large unsigned 64-bit
integer, causing `delta < stored_pages * page_size / 4` to falsely evaluate
to 0 and fail the test.

Fix this by declaring zswapped and delta as signed longs and comparing
against a signed threshold, ensuring negative deltas correctly evaluate
to true.

Fixes: a549f9f31561a ("selftests: cgroup: add test_zswap with no kmem bypass test")
Signed-off-by: Wilson Felipe Pereira <wfelipe@google.com>
---
 tools/testing/selftests/cgroup/test_zswap.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/selftests/cgroup/test_zswap.c
index a7ff525c1267..15cc1dfdd1f4 100644
--- a/tools/testing/selftests/cgroup/test_zswap.c
+++ b/tools/testing/selftests/cgroup/test_zswap.c
@@ -621,9 +621,11 @@ static int test_no_kmem_bypass(const char *root)
 			break;
 		/* If memory was pushed to zswap, verify it belongs to memcg */
 		if (stored_pages > stored_pages_threshold) {
-			int zswapped = cg_read_key_long(test_group, "memory.stat", "zswapped ");
-			int delta = stored_pages * page_size - zswapped;
-			int result_ok = delta < stored_pages * page_size / 4;
+			long zswapped = cg_read_key_long(
+				test_group, "memory.stat", "zswapped ");
+			long delta = stored_pages * page_size - zswapped;
+			long max_delta = (long)(stored_pages * page_size / 4);
+			int result_ok = delta < max_delta;
 
 			ret = result_ok ? KSFT_PASS : KSFT_FAIL;
 			break;
-- 
2.55.0.766.g2966f0265a-goog

