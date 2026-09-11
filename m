Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305C5563FCE
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 20:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789159227; cv=none; b=NPWEAtimgjFzK3+KJ+ZZ7wv7FXVyaP81ZhHo5wMDculHlnmYbN+TiKBIfbSLOj5Vu9U1OXQl6fj0Tp7CwyrlYpeSIEh0gX+kv+XQlQqaS65xBgiIy2rIUawSn/QcR/pl1E/K/ffBY5/gdZ18YkZwFq9Wf04RYo1J7t3qCX2snF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789159227; c=relaxed/simple;
	bh=yOHxJv7/hycz6+JN/DFN4bKkpmVEZPmrKh4UqNfOU6M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RrlGo6mTo0p7T23asV3Nz0w18AvQBI6mxKRPIlPyCtGM7ZBt+/M48oD+T8aBzEgisb/DV/7aFzjAVc/tNMiqvw/BXBRDGhPdhmr5YnIET+rji1vPS9LUs5JoyVL9U5PlBs29cFY58Wi7N1lEfwG8Jmdh9ZKCdPloXSm1VyKlTEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7q6OGkL; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7q6OGkL"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49e6ba045ceso1465825e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 13:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789159223; x=1789764023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s4wQKJNxifNdByk8MBibmXjCRQpHWJtfW4Ad4PWk7cY=;
        b=D7q6OGkLEHp4Y0O3I31FGWW8LlvvMkQiHgeXhdkNNoT5nXnJlmVubdf8Nfgj84uYvi
         V+ApotCmGUCIgKxcS4C9WQ1yjfw1yAwmXd/8LxmwmsVz0Ptot7wJhrhiCSV6xxA1yMoi
         fD07N9nKNR7QOCGSotd/sbVlC2CK39Ba9ZQau1pKf0oatzzzwqR8KdM+Q8CI4smIKNEe
         lu9iubwzMVFHVFA8aJ6trQvdwHbIXXtHXGqmGAtbS6gvfoz5IadJiH27l3nvK3KWLM+V
         SfDQntIKyPEdcDmM3yJo1LgXfEThiIvBjYBwQR1dMnq5/mn0msNm/2ytW8NAmzaLPpu6
         WFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789159223; x=1789764023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s4wQKJNxifNdByk8MBibmXjCRQpHWJtfW4Ad4PWk7cY=;
        b=ovIWOI1qLnnFJ2QW2f6yWZooKGGP7rnGAswgy6p8rN9ZIyeRt410KKMcMYulPtQGii
         P5MKIRZGllw/GwEXyhgZuypa2wBWr5X3lj5QaQQ/hIe5ZzCwKIzYY0h+oUfCC44UNHmr
         aoXyVnTn8KV17nKk01p2eILXFidnwI7taUq4UTJlIha81y+Ikc7m2EmiaHwWBlcYfgBx
         IsrlDVP5q4yAi9bkAI0FvC9Yz/DpL50TXqkZSElXUgs39cJvWKINg4uWibMew01XIzSy
         Cr2rJ4agIZSnk+cqJjYLH2YVsYWT5cBH3FzVlGuNXfe8WhlivrBVKsedEDlHZmE2Vge2
         ZCtQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFSn6eugNJV2oKBbU2ZovaLLih07u/PezfIepFFf7Hgtsyz3Q4+Kb8LPQbJaMYjI3BPl1mUatUNzXtZKDL9t0=@vger.kernel.org
X-Gm-Message-State: AFuF++niwAFQAajb58YcaOtG7uspvIcBFrntfeI/we+aVmcPKZR0BPAa
	CFb6doQCWv5lrQdv1Dd3HK7WOpA1bPCq/unwjAa2v0BrM9VIa4GVT1/s
X-Gm-Gg: AYBFou0FWsiow+GiJToV4R5oSt5I1I+WpJJqJd+Oi9mmiqGqQE4/8WDNSpYe8r+fG39
	BhzjFtWczhJX6xiLTUh+hU8HQGnLcUYqEdw7SBONSoAjwegklVWyobBXHcma7tTD0SLqRd74K55
	zQUNHJ8Pykgn2lrkDd7w7aXh+ccVmQ+l9p0v1PAIxBwX7/cNI+y/PzfTQC5sZ20kcTut2f+JVlK
	gYOezI+973DV0r2r3M7k5od2NXDckQ4kEox2P4fDSbRfAyh/RUwoKDJEP+PJctN3vi4Gove6nrR
	TwYvxjWUbWlkzTfKIOwcLaHCpZjrHn3RxSAoKvIZokxMUr3EWseibtoRlW8/QvQBi8ZONgzx9Xo
	G/8YzyiPa+BDnY9nGHMZizr7KZfaZCpcC6cwlzCHmmkCfox+/dP27cGMJFeEFLvFNJNnwrHSEHE
	2CP+A5KppQA41Rfceex2ryfEGSs8o7zzfJ3aCOJ3ixctgcGNdU5YDZc2TH1rFSfzNaohBugySpO
	x7pTQjbLEFuiVvyuaqGkjss1mJuh06NrHDopigc55NlzFcRPxP7iRJ4mXKZ0ctJWki4/Ank6Gru
	1TXvZMEgwuHGlXPfPf5eglJ8ajsd97CaC8/z
X-Received: by 2002:a05:600c:19ce:b0:49c:fc6c:be04 with SMTP id 5b1f17b1804b1-49e619f67bamr68164805e9.27.1789159222962;
        Fri, 11 Sep 2026 13:40:22 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-033-154.95.114.pool.telefonica.de. [95.114.33.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6499d57bsm114619865e9.3.2026.09.11.13.40.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 13:40:22 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Marie Zhussupova <marievic@google.com>,
	kunit-dev@googlegroups.com
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kunit: Fix kunit_register_params_array() reference in kernel-doc
Date: Fri, 11 Sep 2026 22:39:01 +0200
Message-Id: <20260911203901.95078-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel-doc comment of KUNIT_CASE_PARAM_WITH_INIT() refers to
kunit_register_param_array, which does not exist. The name is
kunit_register_params_array. Say kunit_register_params_array.

Fixes: b820b9077b7f ("kunit: Enable direct registration of parameter arrays to a KUnit test")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/kunit/test.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index da5312e0dfa57f37a7e96c9e618b03b0947ede8b..55548dc54444f8c9f9e9319fbc263d93c0a56093 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -239,7 +239,7 @@ static inline char *kunit_status_to_ok_not_ok(enum kunit_status status)
  * that were not managed by the parameterized test, and any other teardown logic.
  *
  * Note: If you are registering a parameter array in param_init() with
- * kunit_register_param_array() then you need to pass kunit_array_gen_params()
+ * kunit_register_params_array() then you need to pass kunit_array_gen_params()
  * to this as the generator function.
  */
 #define KUNIT_CASE_PARAM_WITH_INIT(test_name, gen_params, init, exit)		\
