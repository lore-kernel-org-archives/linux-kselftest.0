Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C0C392823
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 14:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469621; cv=none; b=I8zIpjfCUOTr0EA/NmceHEGJNBycy8n6V5wSSOS3ExivldY2AUlhdvl9/v0D8HgHzYs4jv6U9ar8LKFpPjFMZkmAa9tJtn8LtS9rMzzV6Cwhe5VOOLX0nydd0Z+h5gfYcUOxWDza0TpJ+bKUfOO2k537p0w9mArWYiagkIGQ/9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469621; c=relaxed/simple;
	bh=Dzp81zKH00fiouFRLt+kpVFgidfU7yX2stkNLfmz3/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gsyWx0bXXK/VV0l2N3qvrS443AHaF1O94A/4O0pm2/X+KLwhA2O/yywgY4yJF1EVj9SO5oVdLt8XqitL5P/CcHxbzssbZGPuCL5vf+JV2Oq1wNFUnHZPTJQDjzFt+ZlJu6xAFamRehNUsk/sX1/firaIYRjzBC1dPxHdsTgvPqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DPg7xpSD; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DPg7xpSD"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a161d9b8c7so22983955e9.3
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 07:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791469619; x=1792074419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bNF0o9YXeO0p9stG5/R43z7vztlln4NrtxYfCDjv5q8=;
        b=DPg7xpSDrLvIC3D4pLRjCePsa+WmiOsuPo/e6ygB2XAE8dBOKICpx76FbYl8v23onu
         n88PJdkDCZpXrR/hEdDO74YNn1X3+IKXqzAeA+HR/NZzrXXtUObRE45Aqy2aRQArFYQA
         f5XxjwAZ5XDvvOR6sMneffJT/CjT8apyO1GEb/KwAxzpDljF+FVPCjeLrAc6SIcpX5HC
         1EsoF/Mc9vswo0wxbAbJlePfoqT0yptOLgCUExJTImhU2jp7USb5guyu8AUE33BhNzL5
         JrphNbn440j6IVit0ZXkSKWgP31S994QwkdZ6IA6e/W5VlICkI4Bp7EzkPdgBT7HQKiE
         383w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791469619; x=1792074419;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bNF0o9YXeO0p9stG5/R43z7vztlln4NrtxYfCDjv5q8=;
        b=O3GDpJoWDIWkj1HGfbZszF7WpjRloEqNjSvwHy8ofqiGhFT5z6Mv7RSHQIcySmMYFq
         H8++yQr70S+LCVvxUAtb0erXtErtozh+fPKLlKybUQwacPgmTej5bNO+9JJ19HaM2CEa
         tfsrr5yz3JIbihQZyawFFXXAzT4jiaHCq1wlerUiyuQ1hbMiB4oFOUe037U8I/J15Enf
         Mph7xrA1JUXe/IL7YblGCQvD9gvNOs9fTp34dZ/z4fTqrP5bFxnbm28ICKKUTItJy6Sc
         nxdPkhxqmGR95GxbneB0sxGAijmMEumayAhdt3CR6+qXhsMICgmZEgkThivkPAfl8Ibq
         OAqg==
X-Forwarded-Encrypted: i=1; AKwUvBxrDSv77PfHjsDxICEjF9G4YEsmLh+aj/qST5dLgVjtE2ZjuuXr9WmR7bbdqWyR7QKvkRbyggcRBFLYzgRy5YY=@vger.kernel.org
X-Gm-Message-State: AFuF++l1WW6bIWqdDDeuC16tTK1eE4SD2tlmwXKY/fgzlX51J54DoTRq
	GtZWKyE7OirpbdtumC4Wlu3Xs2/O66BOZcrdInXucglXRD5KmfjyWupwZgvBvAQ8
X-Gm-Gg: AYBFou1TANAQPI2j12C16c4IurgF1aCUHxI9Xy1RPQAYrX5F2shT9Tj/zRdq4QVIzNf
	gQELsRFYHxrZDaZZ6+I+or5Ioziv2uCYQcz2o/0ID5I0itNs3lPz27nJCPWVt5bSTsKhTsdEUYd
	Y0MXL5p5lcdV/3rWAdfQQbMz2vWk63qt3IZyvHvNvmUxflzM+0uROyZRF1MM7rqxhHTSEWM5/sZ
	lmC1J6RqSrS9icHg4xBFSW+7a2PFp5295F1qn7eK1G95j58ry7R5eMMEpRFtic+2q1+qEqrBfLy
	FSQtyYN+evQNlBYvd41zD/MdSqP1OuIwnYvof4u01QtdazufMUlbi4fmB3B+c8O173oEawyrxu6
	YrbOQHheJHn/ModVVH7GgarWBlX/Mjvp+AMs9akCwCkY0/6G/82ZP69SX5csW3jrjEXo11R14nS
	tbdOjITaH4BwfYLfymXev4/Acm68xVfecWEPWTGXw1/tr7ptfKctMKIosRL8PzxJm9/qvTwFQkU
	XTR/XQMXFvfQr4hUUDh74U=
X-Received: by 2002:a05:600c:154c:b0:4a0:2500:2cd0 with SMTP id 5b1f17b1804b1-4a18043c4a6mr107513645e9.18.1791469618401;
        Thu, 08 Oct 2026 07:26:58 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1843cb256sm67266125e9.5.2026.10.08.07.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:26:57 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: Wang Yan <wangyan01@kylinos.cn>,
	linux-kselftest@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/27] selftests/landlock: Fix the reported clock tick rate in fs_bench
Date: Thu,  8 Oct 2026 16:25:35 +0200
Message-ID: <20261008142604.39107-8-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261008142604.39107-2-gnoack3000@gmail.com>
References: <20261008142604.39107-2-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since time is measured using times(2), ticks per second are obtained
using sysconf(_SC_CLK_TCK) instead of CLOCKS_PER_SEC.  (c.f. times(2)
man page)

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/fs_bench.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/testing/selftests/landlock/fs_bench.c b/tools/testing/selftests/landlock/fs_bench.c
index 78d1efcb2d20..05082562d272 100644
--- a/tools/testing/selftests/landlock/fs_bench.c
+++ b/tools/testing/selftests/landlock/fs_bench.c
@@ -32,7 +32,6 @@
 #include <sys/prctl.h>
 #include <sys/stat.h>
 #include <sys/times.h>
-#include <time.h>
 #include <unistd.h>
 
 #include "wrappers.h"
@@ -206,7 +205,7 @@ int main(int argc, char *argv[])
 	       end_time.tms_stime - start_time.tms_stime);
 	printf("User  : %ld clocks\n",
 	       end_time.tms_utime - start_time.tms_utime);
-	printf("Clocks per second: %ld\n", CLOCKS_PER_SEC);
+	printf("Clocks per second: %ld\n", sysconf(_SC_CLK_TCK));
 
 	close(curr);
 
-- 
2.56.0

