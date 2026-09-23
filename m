Received: from mail-oi2-f28.google.com (mail-oi2-f28.google.com [74.125.231.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F603D47A7
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 20:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790196987; cv=none; b=Sm2hyNkdlqicayn1c/tBnu22LJovszDyZ05qDQBIO0JK1WJinnbReu4hxpyjXI54UDMVz5B5RARE+U5InQ0K3xdtQJdxCcSpLd0Mxxv/gZ/Gy8KkL31oJIDMK+FxevqYuBlc1yl1kMua2lvXR/cmPl6HpeZSeKbA/CYkg2F/RdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790196987; c=relaxed/simple;
	bh=W1wFHElEz1b/dayThNRVFfN+kigL6G25ODCAEJSlsog=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jI9ugGNpzc4tl4uVYC9aD3EG6CT60bZe10bgLz04ihVen26F6kIs3hSjN6AXzBg1HH5Y5VAI2CrHgxkpXnyRGz8FE/Ad6ye5jX//7ZPGYC3IT4poKIpY/XQIIFWRETXzDh6KCtJqryCUbvbqfPFpu8wSfChBKowJRXfeg/rzvvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abznh2cR; arc=none smtp.client-ip=74.125.231.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abznh2cR"
Received: by mail-oi2-f28.google.com with SMTP id 46e09a7af769-80a18990c76so1112971a34.2
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 13:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790196985; x=1790801785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FcKyz98Jefny6nggmzRRJAKdNeUQm5PRvYIxlTnznGY=;
        b=abznh2cRfzonhhRyGmX6b6idZiAVQhhlq3kq28Dvbt2uwgGrHtTAfrNC5ZJ3DUSjIc
         xwnBrDhyyqNOKdL0dtOVkAbMBpHtVAUFsPZ2bAQJc6ycim8lIZzXF8wDDCfsd+6Kuj+5
         cYh0jS51WcXuInqDO6Dmn9f2qjpl2QXR32YbC7c0JRXJJa34tb66wcIML+7y8kc4qeXq
         23F2ssqKA9MfcthWpSc6cl1AKir++wE2slIe6DujIqSftGJavAmuCJ9gBK95+AOpHioi
         sHLp9KYCrQr6pwtt/rHZDgQBHyytwVCooRju7peiS8KwbrEGdqYCv9VKowKWGcRgbNdt
         hy3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790196985; x=1790801785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FcKyz98Jefny6nggmzRRJAKdNeUQm5PRvYIxlTnznGY=;
        b=2IYhrlgxb185k0Ff93R+gHDSiAEIJppG7f5JPBp32jzHn6Hz/PO850CT6s/O/Fzdnt
         y6M2xyrxL83uRvuP8XCJBPJ5C/cVUnzCTe6rcMgOpqWPA1c7OOrOQmZ7Z8YMPOta9wTs
         eqsGTZ5QIanpN4dr7q7Dl46KhFaKqJpBTlcCYpRno9P9ioWGerv1xtJnO/xQmXqFEF6z
         ru7kMecjte8sGW9SXuUhyRdFs5YzrRV9VSBkBAEFAU93DxK9sazN9UXJLRT8Ze+ELYcx
         B8TTExsY4Ps7mlo3aR5jx2KjlZUS9oCw3T284h8JiTtPJTZT1Z+uYj1FpDdV36vv+DBC
         aoXA==
X-Forwarded-Encrypted: i=1; AKwUvBwaJFPtZYwlfjNfuRlAQpciK6uoaz5+0Svi8Y1QaVbHAQgjYy+vZigfrYwQHWwY41Xk+1a0s/hqjYjtgBOzprQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kLGqMv0Vzb6PnpzEkBfOaMZ6uLm3n5wOnM1YTqmThetBy7uaeb
	w7xMXNz+Qm3gjdyLar3yjuHENWyz7SDag4TV8Ey6BPfl+rp2J4fzLvgU
X-Gm-Gg: AYBFou1FV9yKIqOGC3HLsyYGGtmGtQEsDA2GGlhJEVc2sDr1pv98k2elBNc3oERDjKC
	pCdKW2MLHL9ryEMIxZji74KqMg1oYpKv6bnopit9vcUhHENWC+27tUvxzO8LSwUEJiZCJ6auXrL
	jrOZAbrv9hgJHkOYym3wIxd/dZyhLg2rCJe11k3dIHLVH+4HanTp7XBx9pQWsYr5MV94+G2R8gj
	gAJVkDl6/1eAlnWMP5xTQbAmZ3H+lu9LMOYaKxll2LwSaOsoGnucYCcuDdM+YG3xUk5MDVaDw2b
	kfWy04iTOZiYJtZe+33iMmh795g0oncae6WtEAepNo58rkP+xXEFpFtLhSdsTzeawRW7wRindpp
	ONjkO6r2hUP9K4XIOX7aq0sKeszXVobmaVeN6WhLmtC+GaYtWXeGqyaLFz01Nl64t9Gcgw3tepV
	aWvH2zjlmAkbqfoOsE5bAxTA/gZ+8u5R/zLwo3/idONPfsbIL6bvN5bdELuXbqry5gva1V9xzWQ
	4qh4/1U2FyQbvS+8+2I9xrtTf4H3q/2C73Rsj1nKa3AFq1c/yc=
X-Received: by 2002:a05:6830:6308:b0:80c:d34f:5f61 with SMTP id 46e09a7af769-81783984e99mr475510a34.26.1790196984749;
        Wed, 23 Sep 2026 13:56:24 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-81603ad0f20sm4498893a34.9.2026.09.23.13.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:56:23 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH 0/2] tools/nolibc: fix WIFSIGNALED() for status 0
Date: Wed, 23 Sep 2026 15:56:20 -0500
Message-ID: <20260923205622.1123270-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nolibc's WIFSIGNALED() is true for status 0, so a child that exits with
0 looks as if it was killed by signal 0. I ran into it in a nolibc init
for a QEMU test, which reported every clean exit of a child that way.

Patch 1 fixes the macro. Patch 2 adds nolibc-test cases for the wait
status macros, which would have caught it.

Tested on top of nolibc/for-next f2212892b6a0:
- x86_64: without patch 1, the new wifsignaled_exit0 test fails, and
  the rest of nolibc-test gives the same results with and without it.
- x86_64, i386, and arm and sparc64 under qemu-user: all new tests pass.
- libc-test against glibc: all new tests pass, so the expected values
  match glibc.

Danish Khateeb (2):
  tools/nolibc: fix WIFSIGNALED() for status 0
  selftests/nolibc: add tests for the wait status macros

 tools/include/nolibc/types.h                 | 2 +-
 tools/testing/selftests/nolibc/nolibc-test.c | 8 ++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)


base-commit: f2212892b6a0c2adab438783e9fa8093c90786d7
-- 
2.55.0

