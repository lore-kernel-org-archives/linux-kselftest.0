Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501953CAE66
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Apr 2026 14:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228372; cv=none; b=hthlbHd+efeU/JfKKjDOzVX0IciI6WiCEdSdSIVv2FFY2IRrEkvTMXIQ/pcVlSAuzPoYFv60rxiYbBua08gSSQRkCBlXJS2S/XJSyyZvo2XZYAO83JSf10NSZaYT+dQpyoeFmF2O5jbwMADa7MMN4bN/1OeMFVp11Oe6NVB+tKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228372; c=relaxed/simple;
	bh=E+XHZs2fGVQU4RACjdHGDrGQXdRXwI+e4g/Lo1v6q2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kMpwhp+GLEmI352Hei6Z7a0swufOzCruJXTsG1dWz5bK62nlLSjpoCNhe0kMGCLOnJ32Z9Nt1c5A+yBDXO6rpDPaFuDkZ83xKyJ8weYzdQOZdEcltGjmKqit28oLO/vYHaq9IwfFfO0hGb0H0yN7AMGVWZ9VXmiw1nqnc2fKcug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=V/hkhn+3; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="V/hkhn+3"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso21747425e9.3
        for <linux-kselftest@vger.kernel.org>; Fri, 03 Apr 2026 07:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775228370; x=1775833170; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XsFRXjs2Dc1/g84L0Y+9YTTSj518lfxy7T1haEQdAvc=;
        b=V/hkhn+38S7ulyX7kBLhltB+fFgUucIYni4Lt2jTlTLYSSz3mRVNLSOVN2WuKN8LXK
         8VnGgFBEngMA7oYAzoGvTae5WaNNYy3J6O4v+005AqjEiKMKQ3uq1OwOgZ8EowGBsXrk
         e5aY1LMl3JrxmpSrD6UFTuOwR/vtsRd2PlXgZ5CfpF5e+MTTmdS/R84fDqVc+ZqX25oL
         ySq+pcaHJE98nRngemPeEnWQRcp7hYUuqoWQWu+EoXVnB3HMYnbXYaPX55DlSUnLM2sI
         qOhBS1U69jMPwu+G9IZNwy0NaDijOsIUdMNEaoah3xXX7e4Q0PgHb3i6oyHhai17nOB2
         gmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228370; x=1775833170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XsFRXjs2Dc1/g84L0Y+9YTTSj518lfxy7T1haEQdAvc=;
        b=QgvPdS9UlFaSr6JuB/Io4/RCOiC9+Y6x1S5yk1ruY253h9HQ9DEFk+ywAmYze0Lkcf
         MUu6kFkNOi3zf/zIa6mhDQKXYvE4DLOphOA/SQmhGEgOgjPzq+ZSQT5yN9cX1TAc/4DX
         qDidhOBbAD5tvz4tVKChREvC5aHnmMahwbO/gdeJeMyJPxUaReofsJxc4ifMBeAuCWJ8
         d4t7RV5PXUMGcT2W8BZwjXqmILbc+uyEgg6TAoTjzpZ7kETzumKQk3kmCdmCgH4czCeX
         GswPcG10ix23jH+gJdMLL4l453C0ciCJYSOOt64MvdFVPdMKXoHjqUaczQTdcVtzxvOI
         2+sg==
X-Forwarded-Encrypted: i=1; AJvYcCU4uORZSXR7DG4QMUHnyWmWlkq2Vw4dXCDB9wApbZP5P7wQW+TIk5KQbetcmmg2j8tNmV1cqOApiq/EODOp1II=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFAF2VhJMbm9ElE1Pt10D5oQIs0sQ2a9OscatwLYcLsAdqAkW3
	H1u7FXZCjrI+PfqsViMdSPx+D6lxpGOZpGdrgQijSvgkDz6UO4I0vXkkogmHVtVI5R8=
X-Gm-Gg: ATEYQzxEwqf8dfKPzloP04s+zFEJcHplNo2a07jWxWQvzEtTMExgSasJANxkfL3eCmL
	s+vZTAtBLD/xowKwNYTinqlXmfhBtFD85KwCu4as3dUjsmJQyyi3ohw0rk/QzYU0vkwTWxDOSuU
	yeIRTI3wInu/u3BpyI8VBWms1ZyidIRet1mOwK7s9sHm2zD8m+da3BXptWQQ+xlu/lmp/lGkHGJ
	N6nOFHof415aRWuZx21xYSbinaR39/CnmX7e7w8wst9fgfAhtEo26hK+XY+ZMfB8JUFsbQ0Ub3i
	xDxthJCw5sZK/O+zzzjRmLB4q5wfJ9aHqDUUc+VnIBkDirrWv3LolkUQjZDw9x6uW2knHarbryS
	r/qPVmpT8m/QbDPuFHOySR0+Q6N6I89kK2uPnQWyJTXtPddTBhb6CZYQ65cJ0mkMJcBy7PdpNVB
	PvBs7J32oA
X-Received: by 2002:a05:600c:8b75:b0:486:f634:ef1 with SMTP id 5b1f17b1804b1-4889978c516mr54726925e9.17.1775228369627;
        Fri, 03 Apr 2026 07:59:29 -0700 (PDT)
Received: from localhost ([189.99.238.3])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fb4fb62esm6284487241.0.2026.04.03.07.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:59:28 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Fri, 03 Apr 2026 11:58:59 -0300
Subject: [PATCH v2 06/10] selftests/bpf: Allow test_progs to link with a
 partial object set
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260403-selftests-bpf_misconfig-v2-6-f06700380a9d@suse.com>
References: <20260403-selftests-bpf_misconfig-v2-0-f06700380a9d@suse.com>
In-Reply-To: <20260403-selftests-bpf_misconfig-v2-0-f06700380a9d@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775228344; l=1805;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=E+XHZs2fGVQU4RACjdHGDrGQXdRXwI+e4g/Lo1v6q2Y=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHlmfpqZa0e3FSsPSm/6s/yAsCmO92EAOj8x/YPOS9q2RTA523Bsm29p5YT3AhTzjKuDZLPYFlE
 MubEyNTxP7gU=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

When individual test files are skipped due to compilation failures, their
.test.o files are absent. The linker step currently lists all expected
.test.o files as explicit prerequisites, so make considers any missing one
an error.

Move TRUNNER_TEST_OBJS to the order-only prerequisite list so that their
absence does not prevent linking. Use $(wildcard ...) in the filter
expression passed to the linker so that only the objects that were actually
built are linked in.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 6a3835a58f87..ca64a7678dfe 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -738,14 +738,14 @@ endif
 # some X.test.o files have runtime dependencies on Y.bpf.o files
 $(OUTPUT)/$(TRUNNER_BINARY): | $(TRUNNER_BPF_OBJS)
 
-$(OUTPUT)/$(TRUNNER_BINARY): $(TRUNNER_TEST_OBJS)			\
-			     $(TRUNNER_EXTRA_OBJS) $$(BPFOBJ)		\
+$(OUTPUT)/$(TRUNNER_BINARY): $(TRUNNER_EXTRA_OBJS) $$(BPFOBJ)		\
 			     $(TRUNNER_LIB_OBJS)			\
 			     $(TRUNNER_BPFTOOL)				\
 			     $(OUTPUT)/veristat				\
-			     | $(TRUNNER_BINARY)-extras
+			     | $(TRUNNER_BINARY)-extras			\
+			     $(TRUNNER_TEST_OBJS)
 	$$(call msg,BINARY,,$$@)
-	$(Q)$$(CC) $$(CFLAGS) $$(filter %.a %.o,$$^) $$(LDLIBS) $$(LLVM_LDLIBS) $$(LDFLAGS) $$(LLVM_LDFLAGS) -o $$@
+	$(Q)$$(CC) $$(CFLAGS) $$(filter %.a %.o,$$^ $$(wildcard $(TRUNNER_TEST_OBJS))) $$(LDLIBS) $$(LLVM_LDLIBS) $$(LDFLAGS) $$(LLVM_LDFLAGS) -o $$@
 	$(Q)ln -sf $(if $2,..,.)/tools/build/bpftool/$(USE_BOOTSTRAP)bpftool \
 		   $(OUTPUT)/$(if $2,$2/)bpftool
 

-- 
2.53.0

