Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302563B8D50
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 12:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776342116; cv=none; b=Z1qeq1JN96srwCunn+XJ+eIZM5oRY0/hapmaKc6RFEK9gEFmQdpnr7wMTxkxqSp1g0HW8bHAw2Ye63SghKUoIMyKqzD2vkvbGGgUMBDJcPIPCXzjAMVsT60MoIJEtRdUMJTUn0kIOrXnxAOC0fYbGRy7BRyUZDM+AwfrP2hmVq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776342116; c=relaxed/simple;
	bh=XgVya1wOhlmwdTfwic9NIwBF44z1ohItenbrD/1EmJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jMlxDRY3Dozn6cPvgIr1vIo2dx9tFIeWnbt7ZP3eiRzCl/4qsqviKiHt8P210N/4YEWGlgEmBeJIR5MOb8nOQNVpnsPl7r/CdkBSFvVHoR3DMsFF9qVGzTshiCMFnDPliTRwpGc+xzdqMNXNyBrTwLpGz0XvTpgUQ+KbaY25m0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QbYRVj6Q; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QbYRVj6Q"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso96017595e9.2
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 05:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776342112; x=1776946912; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xFAhrEcbWUNGkUNeZMznGeM5elrK7tHUIUxprsV4V9k=;
        b=QbYRVj6QYNm3no06nsUDnDnZfgZkuioPO+chQvFaKJotfCWfRRHzaAZ/fysjoAplq9
         fx1xixYOdBTIbzCK6ulQvXoxmI5v9XYNVwidl49ZdXN2MheQFEriu+HMU2tNA3DEM1N5
         WiR0murIUUeaTxk2ey6etXSCCOADMHkfFBcNO1TFg15zj8h34mqzv9AZp1ovG4coVZT0
         BikzrahY6uvNaLNsKfXRPZlUbY3djrS5ze0lFY1tNR0M8uhhh9A2wkBgwnNDo+Tnbj9C
         Aeykcryjdva6RTlhy6QqlC4LLZja4HYIc1OnG0nApjjrKifw84vQkOMu6ciB5iUqEeAe
         WUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776342112; x=1776946912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xFAhrEcbWUNGkUNeZMznGeM5elrK7tHUIUxprsV4V9k=;
        b=BxGMGHeJZSpWxyBbg40kGLC75rsZN6gmMgF2083LGTOxu+n/HOk2bXhr8DQmUKM/Zt
         3+AL/sCSq2HqUMltqzYPkG94RjYWs8Y/iyfrF0p694vjgWMlxIop0ksy5ppfKJ3nI1jA
         Rz3jTL9KF70DibA8xyLLCn5gs4OKHqudufotrirLrH5iGxuKpMFr5WVZE7cx46LF8q2S
         DI2arJ9fvyTbYDa06UVPYv8dgs0F28NCeZEk4fCKRMXbE7ADClzGWSiXMs0sGmKGi2+t
         rwhcH9vpTBqiTd0MBfsFcK8SaFjoCvY8wGCG/TiJK+6eRbmHGTptR+hKdvEsKQcLKx9c
         3X9w==
X-Forwarded-Encrypted: i=1; AFNElJ8F2C4ePgUgnrmmU1GQrTndE34eLbMdLdgCNnk7/tmvXR0pFIwd0JWm8Lg5VFrXIOY1YYdS3j4Wf2L3uZ4XxAU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWdd5UeQkZaUTxCagS9bHEqhiQ9waU1TCPyWgv896qTHlQEE7v
	FcvKIhmkqfD+mK1jodSblnUcwiRWpfJBHRPKiuG9WO/tXBqZm+aq9/4TNhS46BD1YmuQnOhrqbU
	CCkeMSNo=
X-Gm-Gg: AeBDiesfcwEG5GKWVzvTXo8QtlSh+mpx+9gCVtpr+xN5ETgNWu0xxpwEIthL6nrDXrA
	sK54FHmBcfQ7wL8/ZsN7EruAPtXesHbhewPhR6wfsC8ZITxq4+Uf3UXcTRa733B++TilzC4Bcpx
	RG52PNjTwQXfRcH+JblEZHjFXcsVxTo/fk+C9ITCj8kEqQ7ijP0m8Fp/K85GgkycP5dWTOTqICi
	QQE3oTyix6dGkEPXCg+fXGD3f752gchiL0JiiIb1pcOk/wpYxT2lnz0H53S/UWOu+w/XI4mBska
	DGsGYlx1whqhcbYyluEsl5ic67Pei0KKpUpcS8zg5/b7f3q1JnG/2pQ+d0ApLc/U/k1GZKZ4mlC
	aeuMfomjTNKFAHvbby87tZoJw1rgeD1IujclKjN49DXPVQcj2YOOUVuD7i/uVvJVf7/Ih/4bHSF
	pgofcYCDrUN/Q=
X-Received: by 2002:a05:600c:474c:b0:487:219e:42d with SMTP id 5b1f17b1804b1-488d67e72b7mr330683115e9.11.1776342112260;
        Thu, 16 Apr 2026 05:21:52 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e41:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e6a860fsm5523313c88.11.2026.04.16.05.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 05:21:51 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 16 Apr 2026 09:21:22 -0300
Subject: [PATCH bpf-next v6 05/11] selftests/bpf: Make skeleton headers
 order-only prerequisites of .test.d
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-selftests-bpf_misconfig-v6-5-7efeab504af1@suse.com>
References: <20260416-selftests-bpf_misconfig-v6-0-7efeab504af1@suse.com>
In-Reply-To: <20260416-selftests-bpf_misconfig-v6-0-7efeab504af1@suse.com>
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
 Alan Maguire <alan.maguire@oracle.com>, 
 "Ricardo B. Marliere" <rbm@suse.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1776342088; l=1610;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=XgVya1wOhlmwdTfwic9NIwBF44z1ohItenbrD/1EmJk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QItrZ/Bp0ea4xdUjeMka6QelzaapYgbCSvM7vE7JnjuhA/jZzjrLzEE61ubPgurq3r7QDEOBjPb
 4zqHoHV3kZgE=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

The .test.d dependency files are generated by the C preprocessor and list
the headers each test file actually #includes. Skeleton headers appear in
those generated lists, so the .test.o -> .skel.h dependency is already
tracked by the .d file content.

Making skeletons order-only prerequisites of .test.d means that a missing
or skipped skeleton does not prevent .test.d generation, and regenerating a
skeleton does not force .test.d to be recreated. This avoids unnecessary
recompilation and, more importantly, avoids build errors when a skeleton
was intentionally skipped due to a BPF compilation failure.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 7d1e5d6c30ec..b3eaa4a93707 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -717,11 +717,11 @@ $(TRUNNER_TEST_OBJS): $(TRUNNER_OUTPUT)/%.test.o:			\
 $(TRUNNER_TEST_OBJS:.o=.d): $(TRUNNER_OUTPUT)/%.test.d:			\
 			    $(TRUNNER_TESTS_DIR)/%.c			\
 			    $(TRUNNER_EXTRA_HDRS)			\
+			    $$(BPFOBJ) | $(TRUNNER_OUTPUT)		\
 			    $(TRUNNER_BPF_SKELS)			\
 			    $(TRUNNER_BPF_LSKELS)			\
 			    $(TRUNNER_BPF_LSKELS_SIGNED)		\
-			    $(TRUNNER_BPF_SKELS_LINKED)			\
-			    $$(BPFOBJ) | $(TRUNNER_OUTPUT)
+			    $(TRUNNER_BPF_SKELS_LINKED)
 
 ifeq ($(filter clean docs-clean emit_tests,$(MAKECMDGOALS)),)
 include $(wildcard $(TRUNNER_TEST_OBJS:.o=.d))

-- 
2.53.0

