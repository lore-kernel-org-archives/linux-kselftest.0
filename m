Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA263E5571
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 19:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776367885; cv=none; b=EJyRIeYR8jBflT8I2i1aq0+IL0F0Cnlyy3Muk0tHc7vAUIgBoB8zrIavaA7/Kl35QkaAvx/1dQQ2y1APyJpjtc4uAoFnRra7pnr4U1GnXWBRiae1E87Ssthwjr1kHyHKdUeR51OsHv101n1xjo8tGWp4rpiT2O0Uudts6XpUau8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776367885; c=relaxed/simple;
	bh=XgVya1wOhlmwdTfwic9NIwBF44z1ohItenbrD/1EmJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CWErR38zfnR0zBV7ZTk8M+FQ4k31eYuzclHRn1hFf2uxzouH77b8GEEr5Ctv167kKM+gpWeJT1ne6Ir1HPivgJiYGfovIW0aespnh0fd/yAzYx32AiwKfTKfc5lHyCEUMCTmhA1qK+W3nVRs2Yn1Rrl9F1GV5F9BD5EmUWTXWlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cCubihGb; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cCubihGb"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488ba840146so82959175e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 12:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776367876; x=1776972676; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xFAhrEcbWUNGkUNeZMznGeM5elrK7tHUIUxprsV4V9k=;
        b=cCubihGbFYVrFfAiD8iZrYTo98eSUKwUbTcrieoOV4p8wvsn3K1N+03DrXdiheCEbN
         ouIdOlK4kPtm+ujlSpx3fVEpBH2p7lvGrBLS3UcoH1D2tO+nmWbx0pr1aRwfhQocB9wL
         eBfedVsrvKZrnavYnmNHRRyrwUYNaoHIYUtkgRSLAyX5eyLdldt3+IynjzwsXlpKlLlU
         p+8uj9gwDnIEQv/P7eIQZHo8lRBGRN7yhVYUZyXSJtZzJimcu9bb/uc+riytYyom8ihu
         6YetlVXiabFfSHdoxIpMeuS5pY+gctN/1uehCy3IfS/2oVBrdivrt4abZuzJsFmLhGV7
         eIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776367876; x=1776972676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xFAhrEcbWUNGkUNeZMznGeM5elrK7tHUIUxprsV4V9k=;
        b=BDvOiGTSr9MzrSo6HPl/Nf/LyjVpPlUYJhY1uChVCB1igvtDVGUmTaHbristoPuWub
         S8AFLBoV0yWKEMSc2xO0xgqrQlKHVbWPoL3Dzt2OzjGfvII8OGfu/nwl2BMqWo2YI5SL
         GrVqaZxXpPpUNCWmlH7YGNLrcL7rmLMonbV4WO2bKwp0enCA3Z6p+6hGXvzgFOJ/W7o7
         AGKTcvz8uW1B44B79OwM38PIwJTUWpmjKd/zpLBX0WZ4UByZ6qaMV4eYUUVJZSi7aHO2
         Zr3RGmcxC7iVGiDdE2HsFHbR3egHY3bfc6aZ0OSGXA0m2mvS90B9BgAcFNnjX2J5QTw3
         GFTQ==
X-Forwarded-Encrypted: i=1; AFNElJ8j0VJmi8MmQ0LwiHLTRT0bjJXkwVtZPOp80wviiyi5U+/IDBHJfzPFqce9m3ro6AIBNKBQK2VMMSfGuZ2UnXw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7SJIpRbyAjvkSdChachKMpqnx1LnCZkxvdo6W8y2DOqEESxwd
	Va3QO2wBEtYBvHSN696v+Ou+coUAmzCbYzUtczF3bKFmLH0UBRWVLtl60eCEGKmXX7A=
X-Gm-Gg: AeBDieteuvfOGQPlFNbkZW1awyDldbYmfBSV2znLvoFZTx815kLzn4t+miTmkj1DGOA
	OTFgoFeEXXQHIrF72TIx9eJc1GFe8NAsQPaOU4ItbJCoRJQXKq1YFzG+qq41n2ISRVnxBp1g3Lu
	VtnEX05FoLW6nwzaUBXnQV7bt7ENl7lf4+81osSB74OobyMCOUY0BfOEsKi8ejhZUUH/j+UfIih
	Ah2LGX1sjCwq47rRec1UVfvshbFPDsYmMXfFxUdt7g14QGo7kve2eBn+1tJs1UWlNCq8nH4LbBh
	hm4GnAcrQwiYDVdUaseA1fS8EbCdWj4SBwVOgYAab3yqydCcglV3xODs/0wBVLwfj6lPW+JpxD/
	l0quxcuCpc1eL4mgBTfndKVStAJ7gwG3BeU/NI3qX7hnUTGKrZqZB9GPnJ+BzlrwpSJLXgPlhYK
	CeQ7SlFWonpM57PW8VDga4JTXwsq1uRN6f5g==
X-Received: by 2002:a05:600c:c094:b0:488:c530:48a0 with SMTP id 5b1f17b1804b1-488fb29afaamr2206105e9.24.1776367876414;
        Thu, 16 Apr 2026 12:31:16 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:dc8:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8c10a9a3sm10199034eec.2.2026.04.16.12.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 12:31:15 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 16 Apr 2026 16:30:54 -0300
Subject: [PATCH bpf-next v7 05/11] selftests/bpf: Make skeleton headers
 order-only prerequisites of .test.d
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-selftests-bpf_misconfig-v7-5-a078e18012e4@suse.com>
References: <20260416-selftests-bpf_misconfig-v7-0-a078e18012e4@suse.com>
In-Reply-To: <20260416-selftests-bpf_misconfig-v7-0-a078e18012e4@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1776367852; l=1610;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=XgVya1wOhlmwdTfwic9NIwBF44z1ohItenbrD/1EmJk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QA8gh3dRHBMtwujYN77ELK1Q2y3lgLFLhXwEdccEQHfAMu9omeUR05M2rBWqvjkJko8y9zwINYL
 QnWPHjqrffwg=
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

