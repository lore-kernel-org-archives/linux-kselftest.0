Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C066D332EC1
	for <linux-kselftest@vger.kernel.org>; Tue,  4 Aug 2026 04:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785817289; cv=none; b=p12bknFq0hKwxpTk3m+BqdzIsyzQzC1oLTmB14C6alNcOyJn9OYJt+4dF/1eEt7MDz5Ul2Od6TwT8BPBWRM7xrcYwixCZwA5iaFLOjHr7b0K4ELnTnGJTNIGfdrsBt1vXGNfnHuv1n6p3MjAtycyEw57Gjf9j9FJrYaGo+Rgh4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785817289; c=relaxed/simple;
	bh=JD1AvwQ5UXWFZTP1zIISu/PE9c1xITWEefPIXoyw37M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KW6OK0AvuQ6pDsI3UE5V12xWmjsAdzv6EC7vKkolcH/jIUbOJ0mgTNxBJFEvP9wsiQ/xXDiR8Dg/OmRiSZhiyWkuAMHI/doeskVmUPa6zOPw6q9FZWLEfCTVxdZ4ntDLgbk/V82GugNYDSVGunPiIuHmK7Ix/bwBbczFOh2LLx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kwBHyF6D; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kwBHyF6D"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e1da97175so6785379b3a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Aug 2026 21:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785817287; x=1786422087; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TR4qhJ/Sx3Yvhb5MktlPGJQjJ+lc6YwHU5a7NNiYmZs=;
        b=kwBHyF6DPgRmkdM8FmyC/W8Swk03OO56SnQjUudVu1nTAE7OnrqH93/tJ0bU+JK5XK
         PlZCF+xjdKEILDE4p2VHCD+J8dOB3z64w9UM8ZESSj2YEUPoZduchfIuwc8uEAjzZnmw
         FfCvRangQP/4+W3+5JnGYrBRPpXvoWNRsqS7Z2nF1U0dCVaPejBQolTZ3ZA+w9Bh9v+c
         ANXTehB1PQqccbErIddRmxqbh9TRTJEEG2WKItthAuA9eSZMT3N6LuSOMa6K0256zbS+
         lw9i/s+aBOqpo5P+eVIDve79E+4sEX7zYZ8A4D2UEX2FFCqXDVVUp5rsc4P+xcT6oYlB
         zHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785817287; x=1786422087;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TR4qhJ/Sx3Yvhb5MktlPGJQjJ+lc6YwHU5a7NNiYmZs=;
        b=gvIKR1TPft824ZtPeg+6A6Se0+LyieOFPZovKYVTINvc3hYGkRMo7gyd4Ta142M2d5
         TYjeAf/O39arhTm9uJNX/SmP3LuJeYydNSk9rTra5b4Y+QkUbRRAKEmm4L26BHj1EG+D
         Jl2QJKQHh6SWTgIKA68HV8bXrkJVkiDmMQynchtjME/YP/lNkvc8eYvB7bU1Zw1aJz3L
         +8bJCyUutLiGxRwPsBOZNGkAMw1xW0R6ILX4IMT3fvu2RTCcPZp8OlwBNJNN4dxmpUJy
         bQ5i41QKF/z7hfZeY4dxekZxYq8vx2y7Ebc+FwwWFgN2zlQX42CT3wMl9FTTbjAPmB1v
         7Xuw==
X-Forwarded-Encrypted: i=1; AHgh+RoZGvlPVMeZf8dfwyvGOZjC895hQC38dWU4OuOZ4SRPQ+tULT91YP8ZoPz/P3C2NC9Q0tR3RcKw2lMc/YIq0aI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBfcFHEvToA2N4vVY6KwkJFKXGpYo3fg3xe7WpwW0rPCJCA5Td
	KR/i5DCpoGDZj/M5PHRn4+RPohO4FkW3w845wSyMO5fuLher1RhY+/ranK4ELSJrztGp2/65zY2
	sBCWRBlmXnw==
X-Received: from pfks7.prod.google.com ([2002:a05:6a00:1947:b0:848:4f56:7671])
 (user=wfelipe job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:c82:b0:84a:6540:3389
 with SMTP id d2e1a72fcca58-84ee47f5779mr11550310b3a.10.1785817286673; Mon, 03
 Aug 2026 21:21:26 -0700 (PDT)
Date: Tue,  4 Aug 2026 04:20:45 +0000
In-Reply-To: <20260804042053.56940-1-wfelipe@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260804042053.56940-1-wfelipe@google.com>
X-Mailer: git-send-email 2.55.0.571.g244d577d93-goog
Message-ID: <20260804042053.56940-3-wfelipe@google.com>
Subject: [PATCH 2/2] selftests/cgroup: test_zswap: fix implicit unsigned
 promotion bug in test_no_kmem_bypass
From: Wilson Felipe Pereira <wfelipe@google.com>
To: Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Tejun Heo <tj@kernel.org>, 
	"=?UTF-8?q?Michal=20Koutn=C3=BD?=" <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Wilson Felipe Pereira <wfelipe@google.com>
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

Fix this by checking abs(delta), ensuring the test correctly compares the
absolute difference between system zswap and cgroup zswapped bytes.

Signed-off-by: Wilson Felipe Pereira <wfelipe@google.com>
---
 tools/testing/selftests/cgroup/test_zswap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/selftests/cgroup/test_zswap.c
index 312d51887a1d8..7bc2519862f7e 100644
--- a/tools/testing/selftests/cgroup/test_zswap.c
+++ b/tools/testing/selftests/cgroup/test_zswap.c
@@ -624,7 +624,8 @@ static int test_no_kmem_bypass(const char *root)
 		if (stored_pages > stored_pages_threshold) {
 			int zswapped = cg_read_key_long(test_group, "memory.stat", "zswapped ");
 			int delta = stored_pages * page_size - zswapped;
-			int result_ok = delta < stored_pages * page_size / 4;
+			int result_ok = abs(delta) <
+					stored_pages * page_size / 4;
 
 			ret = result_ok ? KSFT_PASS : KSFT_FAIL;
 			break;
-- 
2.55.0.571.g244d577d93-goog

