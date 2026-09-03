Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0F4421241
	for <linux-kselftest@vger.kernel.org>; Thu,  3 Sep 2026 20:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788467859; cv=none; b=E7JftBALZrmiR4JfPD/j9jIDPG7JTWM7TjQD+tp2ajQJgirdWp+5f3XYyqwV7cJpBtUN//hayERI1Finy6PuYWCnS9D7feJqy+mSGYBM0Ozt/CWIoDtr+2jGEQJUv3YWoW3EluLhD8o1QC5JcWD7gdcu8Am5HuIjj8g+Z5RmH3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788467859; c=relaxed/simple;
	bh=Lp/rpmKZfaRLkZH7ZQedQZ1rtoivwaoM23iRcSg0bAo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EgQ/Oertr7WeFk9A1ywR8oC+E7+QosXe2JQJtGGeLqyvQeKeLGDIzknIqehBUo7/EP5AaBfQd8RwQPQx5AiEkOVaMiTBBzOf9DYi3XSCAk1RyYkFeJu6etJfmcxxVQ9fkFZxf1uWFHx+tptPQwJJU3XzxIQrXzyOIYoCGS/u36E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gzAYV3Bk; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gzAYV3Bk"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f96c5b722so231181f8f.0
        for <linux-kselftest@vger.kernel.org>; Thu, 03 Sep 2026 13:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788467849; x=1789072649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OvK9knuWq5uxHuXSn84mygHm6H7cFKDZ8xVelzi2Vf8=;
        b=gzAYV3BkYhIh+iLCseZOMdubqUnvHnNVSfeVr5E0CnXiH0Ol95sM0X384++NYsJecL
         i8aKzbWiOcTHHnkyDxW0KGJRMV6SlHo0lixmw1anLqjUj1o4c32IOJuuHYXHk18AXzcj
         KvFf1h9Q5Xko6iXGIflyV/Pwr9oU1/emnsknRm6MI4elXiya/hMJ0d61xsKJrxWtOm+q
         EUzsTS29J/KSxYnk7649AJyGfT7Bak72Dn6yV1wOnMO8SBTRhoSg3zs0epUGjydbqshW
         0FkK5ZXUA3LMUpAIPV17AwpdZ1CkV3RdyvytUHh89g5BYsUFTrHkdiDoIhqFZ9SJEmy2
         05nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788467849; x=1789072649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OvK9knuWq5uxHuXSn84mygHm6H7cFKDZ8xVelzi2Vf8=;
        b=aqOXtdnUejFWyWREKOK9BvmHfUZae3N3zdlUv1+GVWD+GqcJssCFqztFMKWC1xUk6E
         QYF0Ad/QU5p0szEqwgJ3J9o8HHmbkwrceKbPgbPuJmNuhGyqJ+tlpoL651bK75Z9MhGK
         hOl5NoFJaCTncIBwT3oFbx7n1+G9xSXnVF73YsMq8N/D6hvSpssYdYTJIikwVNqjK6zU
         mlcZQYkvdjYqBj+uva03+sPPkHRwtn7QjfxHoWEHl+2l/dRTKAQ/kZmmwX0tH+cqJgZm
         JqcvOu9b3pWakJxPSzBsOE+8s8eDPwrtQm67cpoS9T48VTFUxS/xgpZ/YcCf0fsaxvVm
         bOug==
X-Forwarded-Encrypted: i=1; AKwUvByRKii3syjzXfBge+kz0jatcvfoND2uXaRWgXCBZZSQX2/PumCJ4oxXRVIadwz8ephJaaXsSguhg2mB4XwlWI0=@vger.kernel.org
X-Gm-Message-State: AFuF++lARKBIU/yFSbdQNpNQfvynlqKZGKyvC80mDwaoyM3BCj9ma4Px
	5q3WnrZUYyDhj3BV614gsI/r6EkTbmmWd7IjBr51YIz2eUq87mMQkgyf
X-Gm-Gg: AYBFou1PGcZeaTodEP9qB2zeVdvngkERnUAlt3foRpdkkl0BlGnezhj6GNw1tmC3jcp
	sA4NaBdYy74+IEkcBwZhcdSpJun+QXVMAyJB67aUtif1Zz9waamhzMLB1xYrSuqgnNtKgqv9/J9
	7thpFkjN625ZhmYFBpbEG6H02rCbBWd174L44EQ8BiWjqI62kh4ix/HLMJZH0E9eSm6im9mSh54
	O6fB2Jn+Ld/xhXSeilXXw80JfbUHQ1FsJK6UW3iRnlqZ9jTwwbtE84bT8UohVLQbk9E/6XAThHQ
	Z2paAnu5m+DNAVOF8Ue7ZhVoBaOADULCAYMpcfFQ2KBCVgs7nEaG7N1fuM5hcdVIlhYYERFyLJC
	nZruCmbbKrIMUANhO3QqofKYarhPUZ0mr2ZbnZd6Tsf/vnZ82x3FQnBQpXv71pOueLB6pj2HTMZ
	QwsKufhu36UAZJHeBpvXEBeN4vume87HiDr6pdiEOLwv5tyQURE2EtT7r+SlElmbS2I4A/Btd00
	I+6EvsHin5pdXejSwGUpRAc3hSMeU1c/uLZ7lgCTWrjBCdpEs9w0gU7DYDThBU7EXbNVtKQQ63v
	UCzJddVRxnqf4OCKxHM2LrxOYB85/DPmzkyLP6flhRic/yKORm7hM/2F2a+yUrSUDDW+Dsl+tHG
	jDW1A
X-Received: by 2002:a05:6000:26d3:b0:481:5b58:c589 with SMTP id ffacd0b85a97d-485870935eamr2874884f8f.10.1788467848463;
        Thu, 03 Sep 2026 13:37:28 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a979-9501-3df6-d7fa-8a5a-06c5.310.pool.telefonica.de. [2a02:3100:a979:9501:3df6:d7fa:8a5a:6c5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm1005070f8f.8.2026.09.03.13.37.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Sep 2026 13:37:27 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-hardening@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v3 0/5] slab: ZERO_SIZE_PTR alignment and ERR_PTR hardening
Date: Thu,  3 Sep 2026 22:37:15 +0200
Message-Id: <20260903203720.63689-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kmalloc entry points promise ARCH_KMALLOC_MINALIGN alignment but
return (void *)16 for zero-size requests. Patch 1 aligns the sentinel
to that promise.

Patch 2 limits ZERO_OR_NULL_PTR() to NULL and ZERO_SIZE_PTR. Patch 3
handles ERR_PTR explicitly in kfree() and hardened usercopy, without
giving ERR_PTR special meaning to other users such as krealloc(). The
old helper did not match ERR_PTR values either; patch 3 addresses the
adjacent hardening concern raised during review.

If backported, patches 1 and 2 should be taken together.

Patch 4 adds zero-size KUnit coverage; patch 5 adds ERR_PTR KUnit,
LKDTM, and kselftest coverage, which is why Arnd, Greg, Shuah, and
linux-kselftest@vger.kernel.org are newly copied on v3.

Tested on 940de590b839:

  - GCC 15.2 UML slub_test: 10 passed, 2 skipped, including
    test_zero_size_alloc and test_kfree_err_ptr; NULL and ZERO_SIZE_PTR
    produced no warning, and the expected kfree(ERR_PTR) warning was
    suppressed and counted
  - GCC 15.2 matched x86_64 builds immediately before and after patch 3:
    kfree grew by 15 bytes; __check_object_size gained a 13-byte
    comparison on its normal path and a 23-byte cold abort path
  - GCC 15.2 x86_64 defconfig with HARDENED_USERCOPY: build and normal
    QEMU boot passed; the committed LKDTM selftest matched the distinct
    ERR_PTR diagnostic after reaching usercopy_abort()
  - Clang 21.1.8 armv5 UBSAN_ALIGNMENT: no alignment-assumption or
    slab.h report; generated code retains the exact comparison and
    single evaluation
  - GCC 15.2 MIPS64 big-endian noncoherent build passed with
    ARCH_KMALLOC_MINALIGN equal to 128
  - Microchip SAM9X75 hardware (armv5, ARCH_KMALLOC_MINALIGN=32):
    ZERO_SIZE_PTR was 0x20; zero-size allocation, ksize(), and free
    passed with no boot splats
  - Raspberry Pi 400 hardware (arm64, Cortex-A72,
    ARCH_KMALLOC_MINALIGN=8): ZERO_SIZE_PTR remained 0x10; the ERR_PTR
    KUnit and hardened-usercopy rejection paths passed with no boot
    splats; the revised diagnostic was retested under x86_64 QEMU

---
v2 -> v3:

  - document why patch 2's sentinel-derived low-address window in hardened
    usercopy was incidental
  - add new patch 3 to warn and return when kfree() receives an ERR_PTR
    and reject ERR_PTR values in hardened usercopy
  - replace patch 4's pointer-cast static assertion with a run-time KUnit
    expectation
  - add new patch 5 with KUnit and LKDTM coverage for patch 3

v2: https://lore.kernel.org/r/20260811141240.62519-1-kmehltretter@gmail.com
v1: https://lore.kernel.org/r/20260808105622.62026-1-kmehltretter@gmail.com
RFC: https://lore.kernel.org/r/20260712120728.96628-1-kmehltretter@gmail.com

Karl Mehltretter (5):
  slab: align ZERO_SIZE_PTR to ARCH_KMALLOC_MINALIGN
  slab: check for ZERO_SIZE_PTR by exact match
  slab: handle ERR_PTR values in kfree and hardened usercopy
  slab: test zero-size allocations in slub_kunit
  slab: test ERR_PTR handling in kfree and hardened usercopy

 drivers/misc/lkdtm/usercopy.c           | 27 +++++++++++
 include/linux/slab.h                    | 20 ++++++--
 lib/tests/slub_kunit.c                  | 61 +++++++++++++++++++++++++
 mm/slub.c                               |  3 ++
 mm/usercopy.c                           |  3 ++
 tools/testing/selftests/lkdtm/tests.txt |  1 +
 6 files changed, 112 insertions(+), 3 deletions(-)


base-commit: 940de590b839f71d6dc846160534bf202401b8b7
-- 
2.53.0
