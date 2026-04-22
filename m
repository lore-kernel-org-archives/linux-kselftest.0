Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1663388371
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 08:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776845110; cv=none; b=EJoOnLTE34OtGg+7iFoXVkbPyn88LLJ/TgxRX/+lM4myDO8zngtLBz1hr4ZTkbrHsOWWRQH4JuPsfjcjfxIpSnCE0ls9ldaPzNdkvkOjcBDxxy3odx9UfQID7IzQJ8bcPPYAjXAnm9JNpqTWrWv2pEB7RICPDYW46FT8br0JB0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776845110; c=relaxed/simple;
	bh=4Gkn7xbb3m3uow51L1xISRweJ7aTWA+LfZ3bn2/d8I4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hg5nyh9cAwnz73jIrkvsMppmCJRVSSsvsIpZYZm+X25LbJ//a2upVyE1Hg25hpjIJu/l664CQ/dtpKw6RLwyGacPjSGFv6IbiqA2Q/xYRerj/ACihwr5fle+hy9KvvnbSHsK9qsCtypRnRHSr9DhTnhhhjfEu3OucUeEzThxpUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2YnwRej; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2YnwRej"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso3070631a91.0
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 01:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776845106; x=1777449906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EgOoLeHSNRmJRchPxzuYzxkblk+pRJMxNj39oO1u7rM=;
        b=H2YnwRejBs+/XNwNh7i6YU2bFmAX0QRr9MsFxRguPbK33TG4eJXsq4hvwsKcCw6nUx
         rR80DMTo6Sa8ndTmbuNsmhyZXN1OHe9exlkvGmiYzRHMsi1oAV0Lf6OIolazJ4c0aLBa
         jGDJSBe25OybRB1wIzDNQyA0xtYWj7cQBeA8rajqctfSwy6QKTNZepqedhKjpgSAMLLA
         ddKzMEViDkIr/d6q/+1uKnvXZ3TskvzhwY0Qryz6GhwcxDkLygpLIsuOQRkuzsVPi9jC
         eu2hWfDJjIWXu8T8HMYdhhVVFCNc+e817BJUWmJ01G4zngoB21fGPQ65c4RnEFApbQsk
         7qvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776845106; x=1777449906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EgOoLeHSNRmJRchPxzuYzxkblk+pRJMxNj39oO1u7rM=;
        b=o7fh1pgQjzr55wS78QgtqEantrFz7fI/whdZPyRE8/lg+BF3V7SL8YqniIy9lsIdn3
         xtGsU8oIiuBGjRjwc0BKcuFMTyNWRV40IA+wqImOCvalKWiMhw1mJIMFns1K/K956RgW
         p7oZb4hP1zNClESp279LbTjfYdOfspCbzoBe43GSfMjAWJQq488zv7uh2pDRUhsg+E1n
         ksyFS52g3lTqo6FJty+dOoiDGwb6tw0yhMqJMCw9U+i9TYP0HKcXl0ktq++MaHaMFra9
         yO3UsSddLXmrpYtvCKW04n8WkHBVV321DvMbKDqem1vtEHmSKv8yXcpFgGcR+RK2RVAR
         eAnA==
X-Forwarded-Encrypted: i=1; AFNElJ9QSwKdFWC4hcsSkboAAKRDStx8bHbyqM1GKUy158oi9h7KKtDpxSUq5IYtJ+ylUa9vuhTss+OR359lFj/rtBo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnY4ziUkY8bbtGSBVEo6KkeZz4WeRHe3gtP8cEiA6vqFIUYNN9
	kp4A6+d3Uu3kM5W8ma6xNS+nyPiDV4bkXgiZFvORXP/p74HNVa65oDw=
X-Gm-Gg: AeBDietS5j8Bh5MrR//xP/BhgqPJLdV8UuNkR9UtWBjaI8m/9HeMEg0GfM/GpYgzwNS
	3xs/4wj+jMA6xf/MJuY4ELs7wRj5b88YhSEh6nt98lD+bQSzpifEeATcabNqspXYj0FqdJg9i+5
	1/VDsGSHwWhW2GSk4MLfmyLReihjloaqgJ6Fl0z6Idzh6GK+Bm0FjlCvGfptK22OEy8u2L4Ny1r
	wnooJwrTSfbZHovMZmJhkm6P7/FjzOtzp4x0WRhpAloIcsKUzmo2yxHCahx1m2mvjAsFTs05aNk
	W9aT2Cwmsp8lpPuTNkMfL2UtIqUPypuHCVB+rLjKEMr/Bg+rufZm838DJzKkx9fgcaAwuI6EPdO
	XyFrg5ltdTUKl7BwUEx7lwUyid2K0wlTXOsVzb4YerXfduOtfex0/dv03dVqi1rcj+NjwX0VxUw
	O6sWjqNdn5FCWxqmCTQ1/1ugsE/oxaAT2w
X-Received: by 2002:a17:90b:35d2:b0:35f:bbc0:e570 with SMTP id 98e67ed59e1d1-36140228e16mr22584055a91.0.1776845106396;
        Wed, 22 Apr 2026 01:05:06 -0700 (PDT)
Received: from thoundrobot ([43.154.64.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3613fb9b121sm8508494a91.5.2026.04.22.01.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 01:05:05 -0700 (PDT)
From: Li Wang <wangli.ahau@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	Liam.Howlett@oracle.com,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] selftests/mm: suppress compiler error in liburing check
Date: Wed, 22 Apr 2026 16:04:46 +0800
Message-ID: <20260422080446.26020-3-wangli.ahau@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260422080446.26020-1-wangli.ahau@gmail.com>
References: <20260422080446.26020-1-wangli.ahau@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building the mm selftests on a system without liburing development
headers, check_config.sh leaks a raw compiler error:

  /tmp/tmp.kIIOIqwe3n.c:2:10: fatal error: liburing.h: No such file or directory
      2 | #include <liburing.h>
        |          ^~~~~~~~~~~~

Since this is an expected failure during the configuration probe,
redirect the compiler output to /dev/null to hide it.

And the build system prints a clear warning when this occurs:

  Warning: missing liburing support. Some tests will be skipped.

Because the user is properly notified about the missing dependency, the
raw compiler error is redundant and only confuse users.

Additionally, update the Makefile to use $(Q) and $(call msg,...) for
the check_config.sh execution. This aligns the probe with standard
kbuild output formatting, providing a clean "CHK" message instead of
printing the raw command during the build.

Signed-off-by: Li Wang <wangli.ahau@gmail.com>
---
 tools/testing/selftests/mm/Makefile        | 3 ++-
 tools/testing/selftests/mm/check_config.sh | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index 6195770eba6..18779045b7f 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -263,7 +263,8 @@ $(OUTPUT)/migration: LDLIBS += -lnuma
 $(OUTPUT)/rmap: LDLIBS += -lnuma
 
 local_config.mk local_config.h: check_config.sh
-	CC="$(CC)" CFLAGS="$(CFLAGS)" ./check_config.sh
+	$(call msg,CHK,config,$@)
+	$(Q)CC="$(CC)" CFLAGS="$(CFLAGS)" ./check_config.sh
 
 EXTRA_CLEAN += local_config.mk local_config.h
 
diff --git a/tools/testing/selftests/mm/check_config.sh b/tools/testing/selftests/mm/check_config.sh
index b84c82bbf87..32beaefe279 100755
--- a/tools/testing/selftests/mm/check_config.sh
+++ b/tools/testing/selftests/mm/check_config.sh
@@ -16,7 +16,7 @@ echo "#include <sys/types.h>"        > $tmpfile_c
 echo "#include <liburing.h>"        >> $tmpfile_c
 echo "int func(void) { return 0; }" >> $tmpfile_c
 
-$CC $CFLAGS -c $tmpfile_c -o $tmpfile_o
+$CC $CFLAGS -c $tmpfile_c -o $tmpfile_o >/dev/null 2>&1
 
 if [ -f $tmpfile_o ]; then
     echo "#define LOCAL_CONFIG_HAVE_LIBURING 1"  > $OUTPUT_H_FILE
-- 
2.53.0

