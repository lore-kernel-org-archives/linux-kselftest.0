Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C081DDF76
	for <linux-kselftest@vger.kernel.org>; Sun, 26 Jul 2026 10:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785060798; cv=none; b=J0uoJc+vr+Gw/ZLaVcLidZg1xxNEi3NXt5ZDlp/CG3d5LTpQpy0Z611eWbJiL51XbrjX1mxtGwmb8qgwxicceEc9y0tmD428RvgW3HZMi5ZDJ9Uhiis0RHRr0fXt8KLF3iz1Mk4AhtDYDsc/wtptAZBeTEUvZR/nj/M6e1aA3Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785060798; c=relaxed/simple;
	bh=hMbwhWX1Er1b+7H8vHCWQZO1kW/LGuAOr5+dXSIawrE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=S0b8oUGTg4ITf6WJiaChkAo2docudUNlndlA0dWNCfM2UiMo0NLRM/6g5nL5PXg0e3KXoJgX9u8/chNcgLYL4q4U+10DjhSqW7yT3IalTcgDfhZ9gpD9eHUHG20etJU6UDJo3P9IPFSBfAqvfOLY+bYwotYoq+HNvMsRhXOGPYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com; spf=pass smtp.mailfrom=openresty.com; dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b=OL+JDjSg; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openresty.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b="OL+JDjSg"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c9ef3e1337fso1280299a12.2
        for <linux-kselftest@vger.kernel.org>; Sun, 26 Jul 2026 03:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openresty.com; s=google; t=1785060795; x=1785665595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wcAzVpejed4McahzXYzgR83QcZ2K+/EUa6LpMYvOA98=;
        b=OL+JDjSg26XttoCCOfD8lvpEDrXaZw42Pk/KlVdalHZw1gKNORe/4PrQXvJLBl4bzH
         9/LexX73DOcy1UTUc+b6EddzUdjZXlOc83Tykns/27nuasSN8IgCVn5xVzXoqVYVIVyf
         G6BQ2I+HRyXGpkPHaZ7oBtTC/ZW/ansxzsLhtDnQYdGFiLGgpcj1Q8WSGZFhasONeFxl
         V3W0tov6fC35YKb4hnPpaQNmydUY5gOF3Zb5B4s1nVXQJxe4ST4bFJuZ8JriEHn3xooA
         DEMbM08HILIth5jRKLs6ULDavLXfPt+VG+B4zDXtPBN7D3T6Nv3WpotkJR5OwrfFWZGD
         iVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785060795; x=1785665595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wcAzVpejed4McahzXYzgR83QcZ2K+/EUa6LpMYvOA98=;
        b=r3w1tFYt3kDySu9d0wDbo2zlocG+vIGv4h4sbAz0e1gEgREK2SrpcwhSvWBnhP67s0
         kEVhzZsI1EQo2DttYnCtTlrcmspldQPuO/zH0hHeYA0X3I4vW6P83ldfy4jfIEdwpZJG
         XSoIwoBaASdJCH7uNbI7q9dmLgH4KzV1thovOezpbeZnXKhIZSIHqpST6wfkAqzPdvbV
         feL1dMRb5oonn2x3pHRuEb56GQrumcjb/rdI1vZ24UehXu/rNRkBeLhgWJkrW9Zch/4v
         2L9sjIweSqPRw8mbdCRO+iGD4NBYUNtICUAPZUtzJcgx+2RXshgKjJZLhmUqcMDpBwb0
         ZDiA==
X-Forwarded-Encrypted: i=1; AHgh+RoySEiK9WQcoNA/QUxOor4/3wjsr4aE2elVq8k4efBWgnj3EcBt9l2tDYQRKd+0x4Y/BAyZp20febZn38/iMSE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaGozmLEI5AYeubZWN1USc7uUqZhFX96Bl/sh9PDHw31mN0Pf/
	MvDJotHlknC1ucf7halyYDgDTkoNrVyhuBVpSw83y8jWx09ToER4Y0nj0ZzwlzMb6Yc=
X-Gm-Gg: AR+sD12NkrtF6zwq2XGudm4Prx8xa+Qnyu7zWIYgpSutC5pEXde10k208bPQShC97+G
	Lh6XOWMsgg+eclb3csIpBzKcF3mpprrHL5mYm+n4cJpOlBjog7CUGmXJ1mciy5PCESgHpK1FDDY
	Wak4i3to/O8/DaLHxrTO7RJi2in9ye9fb2jThdSjheZBR6TTwCRyXsziQk31yuz+nKoi/SJgN9U
	JlYAZLI7RFC2oRcSW6qt7j+1Xk4wXcc6SS2mjOZu4UZKXBRTItaqPEW6v3c18YoycHMAxIXNkH9
	43b38lVWmFd1UZbPvXe3433gLvEAh/mOeCkb3YmlW9CQS+NS7lZKpXlfea6NoHc4pj52dff32EK
	9vQqGJedZ0rVLvybSrokeK/hRRqohzS1hPcVSZ69pilv15Op4ZjziA1ZPSy1qhUJ6mh33q0hDA9
	HSP0uK3xxiiF4RZQ==
X-Received: by 2002:a05:6a21:394c:b0:3bf:d1f9:b1df with SMTP id adf61e73a8af0-3c67e0c9effmr4541605637.54.1785060795098;
        Sun, 26 Jul 2026 03:13:15 -0700 (PDT)
Received: from integral2.. ([2402:8780:1329:2779:9db7:a8ec:2e1c:53e1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc59e9fesm17243981eec.27.2026.07.26.03.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 03:13:14 -0700 (PDT)
From: Ammar Faizi <ammarfaizi2@openresty.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Ammar Faizi <ammarfaizi2@openresty.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Kselftest Mailing List <linux-kselftest@vger.kernel.org>,
	LLVM Mailing List <llvm@lists.linux.dev>,
	Yichun Zhang <yichun@openresty.com>,
	Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>,
	Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	gwml@gnuweeb.org
Subject: [PATCH 0/4] nolibc: syscall() and abs() fixes, plus a cleanup
Date: Sun, 26 Jul 2026 17:13:01 +0700
Message-Id: <20260726101306.3772237-1-ammarfaizi2@openresty.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

A small set of fixes and a cleanup. Tested on x86-64 and i386.

This contains:
 
- Evaluate syscall() arguments before they reach the arch macros. The
  __nolibc_syscallN() macros drop their arguments into local register
  variables, which GCC does not guarantee to survive a function call,
  so an argument such as strlen(msg) clobbers the registers that were
  already set up and the wrong syscall is made. Reproduced with gcc on
  i386 and x86-64 at -O0, -O1, -O2, -O3 and -Os.
 
- Avoid signed overflow in abs(), labs() and llabs(): negate in the
  corresponding unsigned type, so passing the type minimum no longer
  invokes undefined behavior. The value is still not representable in
  the result type, so the minimum is returned unchanged. Under the:

    -fsanitize=undefined -fsanitize-trap=all

  flags the selftests are built with, the old code did not merely
  return an unspecified answer, it died with SIGILL (thrown by ud2).
 
- Add an abs() range test walking abs(), labs() and llabs() over the
  interesting points of their argument type: the minimum, the minimum
  plus one, an ordinary negative value, zero and the maximum.
 
- Remove the dead __ARCH_WANT_SYS_OLD_SELECT from arch-x86.h and
  arch-arm.h. It lost its last user when select() was reimplemented on
  top of pselect6 for every architecture.
 
Patches 1 and 2 are fixes. Patch 3 is the selftest that covers patch 2,
and patch 4 is a pure cleanup.

Signed-off-by: Ammar Faizi <ammarfaizi2@openresty.com>
---

Ammar Faizi (4):
  tools/nolibc: evaluate syscall() arguments before the arch macros
  tools/nolibc: stdlib: avoid signed overflow in abs() and friends
  selftests/nolibc: add abs() range test
  tools/nolibc: remove dead __ARCH_WANT_SYS_OLD_SELECT

 tools/include/nolibc/arch-arm.h              |  3 -
 tools/include/nolibc/arch-x86.h              |  3 -
 tools/include/nolibc/stdlib.h                | 12 +++-
 tools/include/nolibc/sys/syscall.h           | 72 +++++++++++++++++++-
 tools/testing/selftests/nolibc/nolibc-test.c | 47 +++++++++++++
 5 files changed, 127 insertions(+), 10 deletions(-)


base-commit: 070cf03f5ec454eec9c42827ee9f3c0b3fad09f1
-- 
Ammar Faizi

