Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9972718B0A
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 00:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785283585; cv=none; b=PhYlNBwc0p3SqV8PCQQlKogX/snuQBUjuyNTAO0WYc8oET/xwfrMSNbSYPjDvkeIlGVszTh3yLepY0pLP8KDSZVZTse/ksf7OHcAifNdaUAfSszpZ6kxdZx27zP4eBR11AqEhHgRGsx7EKXOXgL1C8Uw8BoPhTC/DCY8DzTvzNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785283585; c=relaxed/simple;
	bh=TXUXF0VO2GFK0QXlPAt+DNuTn8oVTdQ2nu33CrL+MtQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mCYMmeRou8fO7MHlRC0WeYwp4w5YoNVO/d3Ie0+THM/HKJVjErQxEU+c620qjOVTeRBBq6VvBV28wNV+kbdSUDeCwVE44+HmXuASbSYZEentQXnVkINN6bZLtNCGynxqo/UOkZA+VohbmtegadXf7N8wHziunqRN0yv/2Rm84UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=I+ZDb8Tb; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="I+ZDb8Tb"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7e9ecb1e13bso205363a34.2
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 17:06:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785283582; x=1785888382;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kSyv1GdEoDI8N+OLKCYpWvu+8qqEzcshmEIrPMKqYZw=;
        b=i22l6sRfKTHZbSIQKpmH7deK71vvTCBShApQmPUCGAFRcq7rZfJ9Fr45zWKFVEmMKl
         PVt0USWZrJdxMN1BTY+KXrWAgFdmqVWcNQnm+R4nY2M43tvoq4Br4eZ8Gu1+WzcEhzaN
         5GzeMWov1FPRZ/yjt538jzUJLsSDF7CBMJ0g+y2Y+o+EllzTokYrzNZqiXTKE1ibpRFy
         3nob7xvbJmNAoj4wIDYbhUyiyYO/3wn/dSuWXZtnO/5ebWTc/YTsZ7wxMPJ7S+8UqwcK
         F4o1MBNd+HXMGUkqvKjadUTk7ieDCfuyfok+pjuVyhMLYgpaA3iI7AY4yBePtQot8ZYK
         LGog==
X-Forwarded-Encrypted: i=1; AHgh+RpjHcaTbXXATWXqnUZK0/6bmf/3RMS/BKW1ZghoJ7sdcybi31lHxGp+NxdY+TfFEUTdrRYafETpXSs9VeiLMbA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUKJ3/MVWBiZN2zyIlzqXyYllAdi/91tX2SY5ashO3YO/pZeJO
	ts+Pvh9+4Ih8/xOKIRkxa4bE7me4r1VHEFCBqESuEuXL5l5hgjANpZEp
X-Gm-Gg: AR+sD11yN1ncn5ne4T0HVaB/iYMW47PEo4jYn+heOt/n/OakpEITqiT2wbutO8lquQR
	hCHuISa9ru7FoxlkN6X5Gg5IZAJGW5Rulr2IX/fMQE8x7mpHKuQF4TwBMIcZv/tWZzDC7qgiMxi
	TSSIIpuZ8usXoOkrNQ9GIwu832lMAF17SbYH+2M/RMl2eywJRoqXMv5Hr9tRlXARGQosHQC6ljT
	KDc5XWZwlv7v69cPQAJykM7ir9UbdsDu8utpmSd1UajgccCmMJAEaApxNQ9TAaJ+tkuUiVXfZHW
	vXcaj8hDpHNsPY37Vu3AMcwMmZq9vBhRTON0B+pv+eT+hUbdOpMiA7zQKa/yIIVy2I4e8C1TwFs
	y2jJRn4pZoBPlN6Pu1Weconv5fHtFr9nG9Hr805k1cXaT/M0mJtkjtHBBGN88nD1JqVIY77x+mw
	wDu7rZLQuNjlsGkEMMy6pKclyN42MyYqzUe9hCQZjni9/6NizWgiNp8e7KHALsxj7NTkXfWA6pZ
	CgqY3+mECQfkwMb21znBf293WVxfNC3RqoWDhA37m4dp3RCPICLTmW6hmTnvoDMOg8=
X-Received: by 2002:a05:6830:270e:b0:7e6:c819:22e9 with SMTP id 46e09a7af769-7efff03695bmr3342584a34.17.1785283582435;
        Tue, 28 Jul 2026 17:06:22 -0700 (PDT)
Received: from mail.marliere.net (137.65.66.34.bc.googleusercontent.com. [34.66.65.137])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f00d5f4df0sm955524a34.11.2026.07.28.17.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 17:06:21 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F1F7060A0A;
	Wed, 29 Jul 2026 00:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=dkim; t=1785283580;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=kSyv1GdEoDI8N+OLKCYpWvu+8qqEzcshmEIrPMKqYZw=;
	b=I+ZDb8TbQT/hOBMmXCnG5eOgKU/W+PVk5er//DVsyGdr7vQNN11br9G6oIwim9K6bLcvfD
	lY5S3Oy+yjs6KSbPFzn6IAG8aaA/lcdkDcJqRWkZ5C+EFlLQXTff9Z3I4TguHYJFzxBtPg
	4M8hmGp46gB2ZcGL5u8GYSs8ogiwpvTz1C/Oi/MtPbPJSbLR9ak9b+3z64Q+gmyBSXcyN2
	XYqv3TqFm2UWiENC1m+wNm6Q4jHOShtGvnRlpldKEL+Xk0ecg2a99S8goxxIJ1GSp+mxLh
	HNqRhZCvYOrcRyNpZyfKuQdPbTc30UmQVdIhlju5BR/phgtHMnX9q13IGRXrxA==
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
Subject: [PATCH 0/3] selftests/bpf: Fixes for out-of-tree builds
Date: Tue, 28 Jul 2026 21:06:10 -0300
Message-Id: <20260728-selftests-bpf_oot-v1-0-05feb15d94db@marliere.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPJDaWoC/yWMUQrCMBAFr1L222ANWFuvIiLZdNOuaFJ2owild
 zfRz3m8mRWUhEnh3Kwg9GblFAscdg342cWJDI+Fwba2a0+2N0qPkEmzGlzCLaVsRtfjcUDqhuC
 heItQ4M+vebn+WV94J59rqD7QKRkUF/1cpyQ8cdw/nWYS2LYvH23TbZUAAAA=
X-Change-ID: 20260728-selftests-bpf_oot-da8b59be69fc
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1785283576; l=6738;
 i=ricardo@marliere.net; h=from:subject:message-id;
 bh=TXUXF0VO2GFK0QXlPAt+DNuTn8oVTdQ2nu33CrL+MtQ=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGxpt6/EpaqHAAkaOhbnr6bqqCdchfTO9P6m557iXvyF/1ftl6q1xnbMVYth5OOxEx1nX55sQ4i
 pyuHR+lYGgws=
X-Developer-Key: i=ricardo@marliere.net; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g
X-Last-TLS-Session-Version: TLSv1.3

Hello,

When doing a simple out-of-tree build, e.g.:

$ git clean -fdx
$ mkdir ../build
$ make defconfig O=../build
$ scripts/kconfig/merge_config.sh -O ../build ../build/.config tools/testing/selftests/bpf/{config,config.x86_64}
$ make O=../build
$ make -C tools/testing/selftests install O=$PWD/../build SKIP_TARGETS= TARGETS=bpf

Will leave behind several build artifacts:

$ git clean -fdx
Removing tools/testing/selftests/bpf/libarena/asan.bpf.o
Removing tools/testing/selftests/bpf/libarena/asan_asan.bpf.o
Removing tools/testing/selftests/bpf/libarena/buddy.bpf.o
Removing tools/testing/selftests/bpf/libarena/buddy_asan.bpf.o
Removing tools/testing/selftests/bpf/libarena/common.bpf.o
Removing tools/testing/selftests/bpf/libarena/common_asan.bpf.o
Removing tools/testing/selftests/bpf/libarena/libarena.bpf.o
Removing tools/testing/selftests/bpf/libarena/libarena.skel.h
Removing tools/testing/selftests/bpf/libarena/libarena_asan.bpf.o
Removing tools/testing/selftests/bpf/libarena/libarena_asan.skel.h
Removing tools/testing/selftests/bpf/libarena/rbtree.bpf.o
Removing tools/testing/selftests/bpf/libarena/rbtree_asan.bpf.o
Removing tools/testing/selftests/bpf/libarena/spmc.bpf.o
Removing tools/testing/selftests/bpf/libarena/spmc_asan.bpf.o
Removing tools/testing/selftests/bpf/libarena/st_asan_buddy.bpf.o
Removing tools/testing/selftests/bpf/libarena/st_asan_buddy_asan.bpf.o
Removing tools/testing/selftests/bpf/libarena/st_buddy.bpf.o
Removing tools/testing/selftests/bpf/libarena/st_buddy_asan.bpf.o
Removing tools/testing/selftests/bpf/libarena/test_parallel_spmc.bpf.o
Removing tools/testing/selftests/bpf/libarena/test_parallel_spmc_asan.bpf.o
Removing tools/testing/selftests/bpf/libarena/test_rbtree.bpf.o
Removing tools/testing/selftests/bpf/libarena/test_rbtree_asan.bpf.o
Removing tools/testing/selftests/bpf/libarena/test_spmc.bpf.o
Removing tools/testing/selftests/bpf/libarena/test_spmc_asan.bpf.o
Removing tools/testing/selftests/bpf/map_tests/tests.h
Removing tools/testing/selftests/bpf/prog_tests/tests.h
Removing tools/testing/selftests/bpf/test_kmods/..module-common.o.cmd
Removing tools/testing/selftests/bpf/test_kmods/.Module.symvers.cmd
Removing tools/testing/selftests/bpf/test_kmods/.bpf_test_modorder_x.ko.cmd
Removing tools/testing/selftests/bpf/test_kmods/.bpf_test_modorder_x.mod.cmd
Removing tools/testing/selftests/bpf/test_kmods/.bpf_test_modorder_x.mod.o.cmd
Removing tools/testing/selftests/bpf/test_kmods/.bpf_test_modorder_x.o.cmd
Removing tools/testing/selftests/bpf/test_kmods/.bpf_test_modorder_y.ko.cmd
Removing tools/testing/selftests/bpf/test_kmods/.bpf_test_modorder_y.mod.cmd
Removing tools/testing/selftests/bpf/test_kmods/.bpf_test_modorder_y.mod.o.cmd
Removing tools/testing/selftests/bpf/test_kmods/.bpf_test_modorder_y.o.cmd
Removing tools/testing/selftests/bpf/test_kmods/.bpf_test_no_cfi.ko.cmd
Removing tools/testing/selftests/bpf/test_kmods/.bpf_test_no_cfi.mod.cmd
Removing tools/testing/selftests/bpf/test_kmods/.bpf_test_no_cfi.mod.o.cmd
Removing tools/testing/selftests/bpf/test_kmods/.bpf_test_no_cfi.o.cmd
Removing tools/testing/selftests/bpf/test_kmods/.bpf_test_rqspinlock.ko.cmd
Removing tools/testing/selftests/bpf/test_kmods/.bpf_test_rqspinlock.mod.cmd
Removing tools/testing/selftests/bpf/test_kmods/.bpf_test_rqspinlock.mod.o.cmd
Removing tools/testing/selftests/bpf/test_kmods/.bpf_test_rqspinlock.o.cmd
Removing tools/testing/selftests/bpf/test_kmods/.bpf_testmod.ko.cmd
Removing tools/testing/selftests/bpf/test_kmods/.bpf_testmod.mod.cmd
Removing tools/testing/selftests/bpf/test_kmods/.bpf_testmod.mod.o.cmd
Removing tools/testing/selftests/bpf/test_kmods/.bpf_testmod.o.cmd
Removing tools/testing/selftests/bpf/test_kmods/.bpf_testmod.o.d
Removing tools/testing/selftests/bpf/test_kmods/.module-common.o
Removing tools/testing/selftests/bpf/test_kmods/.modules.order.cmd
Removing tools/testing/selftests/bpf/test_kmods/Module.symvers
Removing tools/testing/selftests/bpf/test_kmods/bpf_test_modorder_x.ko
Removing tools/testing/selftests/bpf/test_kmods/bpf_test_modorder_x.mod
Removing tools/testing/selftests/bpf/test_kmods/bpf_test_modorder_x.mod.c
Removing tools/testing/selftests/bpf/test_kmods/bpf_test_modorder_x.mod.o
Removing tools/testing/selftests/bpf/test_kmods/bpf_test_modorder_x.o
Removing tools/testing/selftests/bpf/test_kmods/bpf_test_modorder_y.ko
Removing tools/testing/selftests/bpf/test_kmods/bpf_test_modorder_y.mod
Removing tools/testing/selftests/bpf/test_kmods/bpf_test_modorder_y.mod.c
Removing tools/testing/selftests/bpf/test_kmods/bpf_test_modorder_y.mod.o
Removing tools/testing/selftests/bpf/test_kmods/bpf_test_modorder_y.o
Removing tools/testing/selftests/bpf/test_kmods/bpf_test_no_cfi.ko
Removing tools/testing/selftests/bpf/test_kmods/bpf_test_no_cfi.mod
Removing tools/testing/selftests/bpf/test_kmods/bpf_test_no_cfi.mod.c
Removing tools/testing/selftests/bpf/test_kmods/bpf_test_no_cfi.mod.o
Removing tools/testing/selftests/bpf/test_kmods/bpf_test_no_cfi.o
Removing tools/testing/selftests/bpf/test_kmods/bpf_test_rqspinlock.ko
Removing tools/testing/selftests/bpf/test_kmods/bpf_test_rqspinlock.mod
Removing tools/testing/selftests/bpf/test_kmods/bpf_test_rqspinlock.mod.c
Removing tools/testing/selftests/bpf/test_kmods/bpf_test_rqspinlock.mod.o
Removing tools/testing/selftests/bpf/test_kmods/bpf_test_rqspinlock.o
Removing tools/testing/selftests/bpf/test_kmods/bpf_testmod.ko
Removing tools/testing/selftests/bpf/test_kmods/bpf_testmod.mod
Removing tools/testing/selftests/bpf/test_kmods/bpf_testmod.mod.c
Removing tools/testing/selftests/bpf/test_kmods/bpf_testmod.mod.o
Removing tools/testing/selftests/bpf/test_kmods/bpf_testmod.o
Removing tools/testing/selftests/bpf/test_kmods/modules.order
Removing tools/testing/selftests/bpf/verification_cert.h
Removing tools/testing/selftests/bpf/verifier/tests.h

This series fixes this.

Assisted-by: claude sonnet
Signed-off-by: Ricardo B. Marlière (SUSE) <ricardo@marliere.net>
---
Ricardo B. Marlière (SUSE) (3):
      selftests/bpf: Route generated test headers to OUTPUT
      selftests/bpf: Route libarena build artifacts to OUTPUT
      selftests/bpf: Route test_kmods build artifacts to OUTPUT

 tools/testing/selftests/bpf/Makefile            | 45 ++++++++++++++-----------
 tools/testing/selftests/bpf/libarena/Makefile   | 24 +++++++------
 tools/testing/selftests/bpf/test_kmods/Makefile |  3 ++
 3 files changed, 42 insertions(+), 30 deletions(-)
---
base-commit: 62cc90241548d5570ee68e01aaba6506964e9811
change-id: 20260728-selftests-bpf_oot-da8b59be69fc

Best regards,
--  
Ricardo B. Marlière (SUSE) <ricardo@marliere.net>

