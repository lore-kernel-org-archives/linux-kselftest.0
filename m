Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC6C47D933
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 16:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775060174; cv=none; b=JMnxy9H02v3SCuTsqYg0Q/0x47NhIIDqjLEoUDYBYWrNEuVXHwUUr6XJM3NLy8trSnEGk0tsacYlCBLHL1C3GFycHgH7bVgR47+X64hWfxIs2nWI1L7MTUqK4hUbCH/TEGjRfAeZqTCEaXACi3Y7XTAtEUdZodyHLjh4ujRkH5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775060174; c=relaxed/simple;
	bh=2f5aVKepAPVQ6QAMkIjSa6F59NytLhs5Yj9FO1U5vIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z95rTX43O2Qt87kI2atvVP8mj6rbHZHZ5UNjgmamYyPscLeVMu73XI2ZKmv9jIRGisNtejTB4bR1AbJL6S8AR7nU5b6jghIYNKtYXdcBU6EpOadpjCU7vCzyBCsDVEppGNlM11U9C/n+XBQ8GNCUqPPVBxmFuyl47GpqcvHwAfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=D/MG1imU; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="D/MG1imU"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso74169675e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 09:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775060167; x=1775664967; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GKDIAWuRtDFHvkwbDQCWFyTrBdJA4yobh9R3wJFKPAY=;
        b=D/MG1imUISr8Lnimv0olSHqmMYOaRg2kJIHxlauBpB01snJrSXTyeUCZzupzeKZtAw
         rSL8xj6PQ13CMb+IVrwFn3XbCQoz8RzNVGDEbaOA1TKzXRov5Ky5xL42XbaoODhKMH9d
         Rj1xt3l25xsTUbHTuVMhqMPIhZmGyJ8/OZj3yu4HyT4AmMA5+Du2tiwY3EWl135tdYED
         2BZFtZwHCqAUgHXk4sXuKNW1ErgIo5aFx1hB2BnP4pfqKnXDtzEBBDE8wx/E5hl81arj
         tV4UUGN4P346Ahk2DUJkMFdeTYjZaKiIjJYx+tjIT3lhnoSxvG8yL2e5OUIYTRdgodO/
         BabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775060167; x=1775664967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GKDIAWuRtDFHvkwbDQCWFyTrBdJA4yobh9R3wJFKPAY=;
        b=Tbic1crQSWvWCHq3rRtbRYSTzgGU9IEEzs4aT7i8//YaeYpa+L2jBiS9i0vqORsjUs
         d9q1hP3oKBx4uurWiFVxf1A+CMntPJjGApKriz5det2oHvhzNuC02SqDIEJGpeDcxFoG
         Ca/eyXjUfhvXIcTeNsGp3F4ycldsyz9cAjosx9hQSsC0F2UgLv+aM5z4vXpezsHaDhiu
         czJTtGqw/+M8AnFjt8I8EDyv0QdnaOcrJ/WB/S60JUKBzFIZs7qUuKax92L58rGYL6rg
         Wy8doOI9wtu0mQUTZ9pWQGL9lBm1NO89Q1yQoyLzxIo/6veziDpdni4c5P1F9LMCqXW5
         Yvyg==
X-Forwarded-Encrypted: i=1; AJvYcCW+FQ5eexGSat3Q/e/LTgVidvmGVdLxp+EJMkFm7Zs+Q9u89xPyEJCXgEFdoj7bsnffbPOrQ4euY/MLTR3AXRo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFSE91W82rQWp5DfMWNntzjLp6NwyfIQJxos3D/DeAHNdAPQdy
	kBCtrA8GiP8eoaf9gmmWmheznjteuhu8dw0ns+5+QZ3QNoH392FWUXIM+bs3Rn083IE=
X-Gm-Gg: ATEYQzy2UR3lxlGsbSwC2hTqvrD151j7EEIoo2Od/3OP4a9aEh6thqTq/fe0mhk4rRU
	0LzVy3tQVSZYYeI3MrIdi/VtYGBjc/WBWCRPOTboWnuZsVMJQUf/JfwmjiPEpaLmRoWsU8f058h
	58wB+APzC5XzzIcgQKmfnGTomgfsUyToV1QXvcE7xuMkFm8bw+zHYloYlTf1bDWSmAMfxHciXu9
	EDH1gP9Ft4DfsbLWGXTHphASAsf+tCMe5OEjsmvMNnEEDBUiaPB7BGEEEk0E63LVKKjz8ZENMTm
	+JaMwIkPpTc+4Cn2tRYrySMtIHuJTbrTZ6pt1hbb4ED2JU7Ji+Er2qBjPWwaulZF5w5zvFfNS0X
	/88lkcnl7Ona3mVsJmm01uWYVu6ofQ8H3J7NSxtyEeMgpYMmPvjzR05+hzruIX8LbofyOua+73H
	q6OrQLxs5X
X-Received: by 2002:a05:600c:a016:b0:485:3f30:6250 with SMTP id 5b1f17b1804b1-4888359d87amr72407385e9.20.1775060166677;
        Wed, 01 Apr 2026 09:16:06 -0700 (PDT)
Received: from localhost ([189.99.238.3])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60582e1cc7dsm248896137.2.2026.04.01.09.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 09:16:05 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 01 Apr 2026 13:15:16 -0300
Subject: [PATCH 09/10] selftests/bpf: Skip tests whose objects were not
 built
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260401-selftests-bpf_misconfig-v1-9-3ae42c0af76f@suse.com>
References: <20260401-selftests-bpf_misconfig-v1-0-3ae42c0af76f@suse.com>
In-Reply-To: <20260401-selftests-bpf_misconfig-v1-0-3ae42c0af76f@suse.com>
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openssh-sha256; t=1775060128; l=1739;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=2f5aVKepAPVQ6QAMkIjSa6F59NytLhs5Yj9FO1U5vIg=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QESQ8jQYRTSBwqtN8EitrNVoaqkz400h/f5Q/b0EPyzDIcsKlqjHpAExkAHN4X0lp2TmRmgC7E0
 kwIDQWtvo3A0=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

When Kconfig options or missing headers cause a .test.o not to be compiled,
the corresponding prog_test_def entry in tests.h has NULL for both run_test
and run_serial_test. The existing infrastructure check treats this case as
a fatal coding error and calls exit().

Separate the two failure modes: having both function pointers non-NULL is a
genuine coding error and remains fatal. Having both NULL means the test
object was intentionally omitted from the build; mark it should_run=false
and continue so that the remaining tests are unaffected.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/test_progs.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/test_progs.c b/tools/testing/selftests/bpf/test_progs.c
index 0929f4a7bda4..85ac25a51a8d 100644
--- a/tools/testing/selftests/bpf/test_progs.c
+++ b/tools/testing/selftests/bpf/test_progs.c
@@ -2022,12 +2022,15 @@ int main(int argc, char **argv)
 		test->should_run = should_run(&env.test_selector,
 					      test->test_num, test->test_name);
 
-		if ((test->run_test == NULL && test->run_serial_test == NULL) ||
-		    (test->run_test != NULL && test->run_serial_test != NULL)) {
+		if (test->run_test && test->run_serial_test) {
 			fprintf(stderr, "Test %d:%s must have either test_%s() or serial_test_%sl() defined.\n",
 				test->test_num, test->test_name, test->test_name, test->test_name);
 			exit(EXIT_ERR_SETUP_INFRA);
 		}
+		if (!test->run_test && !test->run_serial_test) {
+			test->should_run = false;
+			continue;
+		}
 		if (test->should_run)
 			test->should_tmon = should_tmon(&env.tmon_selector, test->test_name);
 	}

-- 
2.53.0

