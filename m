Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915C4381B1A
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 20:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773435530; cv=none; b=eCBBbLVJgFSoatfE7puoBCxhW92Xanf2qlWoLmYFMDHlEKTzsUC8ACQ/rr2+Dj6KYbggc4cJ91DbCBQ75T9rjGZchtY5DFJOu7PcejBTZnEFlt5lV6Ovf/+z+TmqCoRS+IzfTPzScQu3eqmaox3EO5aG3sVnwQOq6OQMy5leij0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773435530; c=relaxed/simple;
	bh=8jRkvxxvT99z3b+LG2vpiz3TQlNMu0g+HY9wzZ0lZRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YgpcvK8R1J6EWQLJP5+1Io0xhMZ5TNUC1Q4Rm3E/Tp/tkgpfVFjlxTq1JieQ6vGpkTQIMAcFL3HCOCSUJRYFzJrwHoTQ5i0yYGhSbojsAx8j3iAPedUd0jHnspHm9GlryZ5Jg7TIsqsBHQNpW5qIaBeJhV57sIorOkGZXrk5Ehw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gBLGV6Ln; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gBLGV6Ln"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48540355459so23187595e9.3
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 13:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773435524; x=1774040324; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HVWkiiv18U1tuwb2itRTyF8mnxLw6x7wlBUEkvfx9EI=;
        b=gBLGV6LnOSbQNUAc75Ri1RNAglMHT/blh9GU3ixQNicJLCHqbBQvUbcdjCk+vFfYPu
         cZxajpQ2C9urTfN/IKeWHZZmAPfb1z0lRgWuar3ILPnJO97AiA7PsjLE6g/uKJAwjZk2
         M5DFf/Vinvnl6vXtS2qvtuiPPpxYQPCpca5u6Udbqp3m5uvk16WbKEqmWRKRz7gSAJyO
         jSTIZaT2+UFBzKPD7uf9e+y6vglxcUAU55xiXnxTwF7FTses4MybSD6ZOkRnTyGwcGK6
         T5eepNnTgHaaaGMP7efROOF2/5j7YiNZXa5Lo94rsLdJb7bhU+MxGU/8GP7eIDcJFLZy
         71Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773435524; x=1774040324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HVWkiiv18U1tuwb2itRTyF8mnxLw6x7wlBUEkvfx9EI=;
        b=elWfzE70tJOGxL5HNzh4DRi7xvWUUzElcdACxxzWBTYzkMcgwXrym4L5FxiFDe6Hhb
         eQHcbb8l5Apy3ozUyhcWQTciAKhPv/VmUSLwRY9B3h7pfw64pqaXDu/t6H+ci8rZJCzI
         rLPclWYpZ0Sxbw1caiEKazS1VqMToGeTTx4kREESG4Sax+tplU1vh8wC9ZLlB2b2AlFX
         dNE1fmpwBT4Z5xtvabmhtl3DFWrMUA6UqQE2GPSoPrlPU5Co0Ol3vtyLVhaloCaHOVhJ
         h74JLNfD3oPPuYATDNcquEr19pn5qRX38RYkUNOnjloTaJN0iRY+/xFH+y0nwSdJN9JA
         GeYQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3ZLiwiM9OfggxUAwHDiXLsx+n9253SbLtKS9WL/qyJa3/rTzIJgOUUBKzUXTOnHQlw1RUhq5c/vLnHyq0NKs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTSZFQeP5aHMxzIRkfI8urL7c+Dksyn+rVy9VD/T/drJ+GqJkj
	P3uF/b9GXYon38osa12XLVKxtG8jwDxrptyfEa+U5hc5TrBMP4bAmzTYwE4qybqvoEsn0DsWjPk
	uontKAgo=
X-Gm-Gg: ATEYQzwae4Ry8s3KsG088Xr6lrDZTN2Z69pwntgoUfbO3YxTgV77jJsVKPpkkZzPpvS
	xxCywzC4RxY+FUEOLG5NWR2Jx0tCyiFfSXJNkrFhKFGLyCZTReWXW8qW34Kle0Cj/DhbV89TCjv
	ZfUplKTDcf7C2OBY7IQOnolZwXVI+lboduQKk1BkxqJkDadlebfov1I3mdlUVGqpZnGgB/Y5GSy
	e+FcyZX2LCji+oGZe2yb0OOJ4X9yf9ULliUfVXjZCAoLv71Zytt5Mn3nF5TJGImDJB8w7KTYPmp
	36aXd0BUr6rEOoVrSUfLTyF7QWzH7Kw/jlPayRTCQgl18J9fC9hOcS6eiMNDqksVklvlN2ctuUu
	+nX1osHl/p8KNpVvKD49HMKQ7LSfnJDmbWKOCC62RTxxHugulaTLZ3xTHlHb0hxNR3802/tA0xV
	LjepUxSnB5MpH94vJFJ8m1
X-Received: by 2002:a05:600d:8489:20b0:485:3812:36dc with SMTP id 5b1f17b1804b1-485566d9068mr59603325e9.9.1773435524238;
        Fri, 13 Mar 2026 13:58:44 -0700 (PDT)
Received: from [127.0.0.1] ([2804:5078:834:1300:58f2:fc97:371f:3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab526d3csm4042611eec.18.2026.03.13.13.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 13:58:43 -0700 (PDT)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Fri, 13 Mar 2026 17:58:32 -0300
Subject: [PATCH 1/8] selftests: livepatch: test-syscall: Check for
 ARCH_HAS_SYSCALL_WRAPPER
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-lp-tests-old-fixes-v1-1-71ac6dfb3253@suse.com>
References: <20260313-lp-tests-old-fixes-v1-0-71ac6dfb3253@suse.com>
In-Reply-To: <20260313-lp-tests-old-fixes-v1-0-71ac6dfb3253@suse.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773435515; l=1173;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=8jRkvxxvT99z3b+LG2vpiz3TQlNMu0g+HY9wzZ0lZRw=;
 b=kOkiJw1y1W4Nogu0138hwjYMxSp1GgsM6j987tFoG/Ck+s5vwr5Phe55spvzVJy88qTDJIB+p
 CLzBjIkGSlnCRP4IRl2JxRUjeZDSJTZS+UXo8Bhs57aT5qGKgPcgLxs
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

Instead of checking if the architecture running the test was powerpc,
check if CONF_ARCH_HAS_SYSCALL_WRAPPER is defined or not.

No functional changes.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c b/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c
index dd802783ea849..c01a586866304 100644
--- a/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c
+++ b/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c
@@ -12,15 +12,14 @@
 #include <linux/slab.h>
 #include <linux/livepatch.h>
 
-#if defined(__x86_64__)
+#if !defined(CONFIG_ARCH_HAS_SYSCALL_WRAPPER)
+#define FN_PREFIX
+#elif defined(__x86_64__)
 #define FN_PREFIX __x64_
 #elif defined(__s390x__)
 #define FN_PREFIX __s390x_
 #elif defined(__aarch64__)
 #define FN_PREFIX __arm64_
-#else
-/* powerpc does not select ARCH_HAS_SYSCALL_WRAPPER */
-#define FN_PREFIX
 #endif
 
 /* Protects klp_pids */

-- 
2.52.0

