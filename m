Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59D12CCB9
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 00:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785283587; cv=none; b=GECwFwhma6pXuMRKmc0JTcjBgZud33dmHKk69yB+7SvR4laGwChy11DLjwVROEV4/JAoM0cMqAJZXNsc6eLOrq2gBzLoGfmUZcdEJFCL8t1D45vUDfDKnXo3HoohtYgKMQ9bii5px6+LQ4smk/fDD1QwtjrpoY1InymzkmXd6nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785283587; c=relaxed/simple;
	bh=0k4azcIdthEt5DgYBO4Ys2BeNjL1Mx29vfoSKFsW4/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JiQQgDpJWcVYvRWWS59y5e6CXLSZREYbk4FlkTAwqbzZS1MZ112D6nmwy4SVKbjmJ6r30cAuCPVp48lZYVo3A6qYBSi35wr7mPZX/khaF15QriPF8nyRmr2JVW2JegfSdhgiYNzxVtPzfc4FZxnLoBvbyiNIc27DUBf8gjHQUuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=HrUl1b8J; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="HrUl1b8J"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6ab05b2f9daso197555eaf.2
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 17:06:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785283585; x=1785888385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SIUDpC/h4uZd/jWLbB2fgTqOYILtMDS9oUx+I6ndhj4=;
        b=SbSmVOLNWV8GBIX0feeuExFKX8YKfu8LEowfjVD0VRkyORU66p1olw/5bspHkS/K2D
         Co/aMZvbvLtopUEUrwBi4yReo9usmhDUGu0pfffSQiP/olcjXtrPkmOiMC1d9L/Mx8i9
         J3qU8SFvNbxyJVl0txEIzYviSY13hRtxwiCKZ6FykGOfHUYTUS7SrYwY3M1IHRHSkgmD
         3tVJ6UU3Wy2hJExdNsUb9763H9LW5+lfy1KsGu/QWnB7lmvgrWuWDPE2Vmr8Z/XDPOtB
         mo44S+XAc9q3GEjjg7xMwu8UPcHBkpRkBSoV1wAguNcDyPEbYDRSW1talLfdoNl9Dxvp
         DCqg==
X-Forwarded-Encrypted: i=1; AHgh+Rrqpgjk+8ToZX7cTvgUArD2zC9EvWZN/w9/f8omGq6s2L78NpjXaKhUvxIs4YFqE1ZnRAHFtaqPCQrQGfLsInU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKs+/vgDtRM8mi5eOuRnfR8gzlm46ruJ306BkrsAp6bRcf8q18
	i2jJq8+ZwGdAy3k9dhTNnnMhcRxeQhsM3PIu8SlZOQuResAovQNHxu+I
X-Gm-Gg: AR+sD10jWMZUU4CfcguQMbQdeY4RLg0dFR8roNmF/YvCdLAB1Auep8lXEeXvF2iaZvY
	HvmPfoJW+lgWMZVT29/muPOi1BbfOdUCO7V3/cAS0WT91YAi9ZF4T8WnkGeA5a5Vhh+92kdYN6r
	l/ZdUhZL3bjWhvOjAxLP/XkD1TGbmp9Z78rarNvx6sLCmZKAOBIbE6AY8ZTXPqHU+78UnG+pON3
	pi17PUnmZtceox5hYE5mEUNuYT2XzKkzgrPy2uoOCZgytHt18a/hDwP2UN9E6cOPpIfUv75G0kT
	fVD82+MCDizbOkmg2ZN6bSGLhublzzccPQsToIzUi+XPDWUqxXHPrzn7VN4NUk6p6W/i06sL/cD
	WBlTsJcZrkMCdSii8XU5D3QpbDP3eK3wFJOdwEtAq/ih7rG3Z90fRL5qr3unq51Ft0aQ+G99yAG
	b6CUtb306JUrF59+27jeiAgSSbar7ZjM3kmOB90G7vB88AlQ4rFnZgVfhFWkC/i0C3+zezKYHA9
	BBrfcjPOdq3remZ7lrCkxm9CawykXwtPCH6VCfFAaihHYZ3SV3CC8KXmI0JIp6FQg==
X-Received: by 2002:a05:6820:4b88:b0:6aa:c76b:6c31 with SMTP id 006d021491bc7-6ac96befbabmr2273298eaf.44.1785283584770;
        Tue, 28 Jul 2026 17:06:24 -0700 (PDT)
Received: from mail.marliere.net (137.65.66.34.bc.googleusercontent.com. [34.66.65.137])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f00d9a4e8bsm918460a34.25.2026.07.28.17.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 17:06:24 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B36F760A0A;
	Wed, 29 Jul 2026 00:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=dkim; t=1785283583;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SIUDpC/h4uZd/jWLbB2fgTqOYILtMDS9oUx+I6ndhj4=;
	b=HrUl1b8JmMm5y2VRhjfxjBMd7jMkf2kE3ILczHouhNByTbLs6mpsimnSI+a7f+lm0HPGC1
	tnbA4VZiyyp109a96bCbH+HWdpI6eqhBGJfkJ3daWLUa9SdLUJyKPJjq1R77YFi3+uT3iF
	buiu4MCM04CREU0p4cfpaVS3syA6kkSc1PhybjQ477F9+4mKnXsFYobCJgorSUItXi8t7f
	WIPeW2EESAn2ODc8LaaE0pVK1aG9/olhGhAPWt1piWClkKXFFS2/yml2bFCLMp/6kYIToH
	StP1dFG0Ngj7LvsiEHtp+MpkNNB4Hdw+TYAPgezxD1mpNDa/GrAJDEl3BdAmTQ==
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
Date: Tue, 28 Jul 2026 21:06:11 -0300
Subject: [PATCH 1/3] selftests/bpf: Route generated test headers to OUTPUT
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260728-selftests-bpf_oot-v1-1-05feb15d94db@marliere.net>
References: <20260728-selftests-bpf_oot-v1-0-05feb15d94db@marliere.net>
In-Reply-To: <20260728-selftests-bpf_oot-v1-0-05feb15d94db@marliere.net>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1785283576; l=3990;
 i=ricardo@marliere.net; h=from:subject:message-id;
 bh=0k4azcIdthEt5DgYBO4Ys2BeNjL1Mx29vfoSKFsW4/8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QAQr6nDdOEbAHttLwCY1viAQ41HeLzTpEQWJ7z8qUEyMUACLgW+rYZgtYW7CqBEipY4+LMsN28+
 6Uhyh61AgEAQ=
X-Developer-Key: i=ricardo@marliere.net; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g
X-Last-TLS-Session-Version: TLSv1.3

When building with O= the test-runner enumeration headers
(prog_tests/tests.h, map_tests/tests.h), the verifier test list
(verifier/tests.h) and the signing certificate header (verification_cert.h)
are written into the source tree instead of the out-of-tree build
directory.

Fix TRUNNER_TESTS_HDR to resolve under $(OUTPUT) and add an order-only
prerequisite so the subdirectory exists before the recipe runs. The mkdir
must precede the shell redirect in the same command, so use '&&' rather
than nesting mkdir inside the parenthesised group (the redirect opens the
file before the subshell starts).

Fix VERIFY_SIG_HDR likewise; the recipe already writes to $@ so no further
changes are needed there.

For verifier/tests.h, also resolve the target under $(OUTPUT) and generate
absolute paths in the '#include' directives, since the relative '"file.c"'
form would resolve against the output directory rather than the source
tree.

Signed-off-by: Ricardo B. Marlière (SUSE) <ricardo@marliere.net>
---
 tools/testing/selftests/bpf/Makefile | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index b642ee489ea6..b289183475d4 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -580,7 +580,7 @@ TRUNNER_EXTRA_OBJS := $$(patsubst %.c,$$(TRUNNER_OUTPUT)/%.o,		\
 TRUNNER_LIB_OBJS := $$(patsubst %.c,$$(TRUNNER_OUTPUT)/%.o,		\
 				 $$(filter %.c,$(TRUNNER_LIB_SOURCES)))
 TRUNNER_EXTRA_HDRS := $$(filter %.h,$(TRUNNER_EXTRA_SOURCES))
-TRUNNER_TESTS_HDR := $(TRUNNER_TESTS_DIR)/tests.h
+TRUNNER_TESTS_HDR := $(OUTPUT)/$(TRUNNER_TESTS_DIR)/tests.h
 TRUNNER_BPF_SRCS := $$(notdir $$(wildcard $(TRUNNER_BPF_PROGS_DIR)/*.c))
 TRUNNER_BPF_OBJS := $$(patsubst %.c,$$(TRUNNER_OUTPUT)/%.bpf.o, $$(TRUNNER_BPF_SRCS))
 TRUNNER_BPF_SKELS := $$(patsubst %.c,$$(TRUNNER_OUTPUT)/%.skel.h,	\
@@ -720,9 +720,9 @@ endif
 # ensure we set up tests.h header generation rule just once
 ifeq ($($(TRUNNER_TESTS_DIR)-tests-hdr),)
 $(TRUNNER_TESTS_DIR)-tests-hdr := y
-$(TRUNNER_TESTS_HDR): $(TRUNNER_TESTS_DIR)/*.c
+$(TRUNNER_TESTS_HDR): $(TRUNNER_TESTS_DIR)/*.c | $(TRUNNER_OUTPUT)
 	$$(call msg,TEST-HDR,$(TRUNNER_BINARY),$$@)
-	$$(shell (echo '/* Generated header, do not edit */';					\
+	$$(shell mkdir -p $$(dir $$@) && (echo '/* Generated header, do not edit */';			\
 		  sed -n -E 's/^void (serial_)?test_([a-zA-Z0-9_]+)\((void)?\).*/DEFINE_TEST(\2)/p'	\
 			$(TRUNNER_TESTS_DIR)/*.c | sort ;	\
 		 ) > $$@)
@@ -802,7 +802,7 @@ $(OUTPUT)/$(TRUNNER_BINARY): $(if $(filter test_progs%,$1),$(if $(PERMISSIVE),$$
 endef
 
 VERIFY_SIG_SETUP := $(CURDIR)/verify_sig_setup.sh
-VERIFY_SIG_HDR := verification_cert.h
+VERIFY_SIG_HDR := $(OUTPUT)/verification_cert.h
 VERIFICATION_CERT   := $(BUILD_DIR)/signing_key.der
 PRIVATE_KEY := $(BUILD_DIR)/signing_key.pem
 
@@ -923,14 +923,14 @@ $(eval $(call DEFINE_TEST_RUNNER,test_maps))
 # It is much simpler than test_maps/test_progs and sufficiently different from
 # them (e.g., test.h is using completely pattern), that it's worth just
 # explicitly defining all the rules explicitly.
-verifier/tests.h: verifier/*.c
-	$(shell ( cd verifier/; \
+$(OUTPUT)/verifier/tests.h: verifier/*.c | $(OUTPUT)
+	$(shell mkdir -p $(OUTPUT)/verifier && ( \
 		  echo '/* Generated header, do not edit */'; \
 		  echo '#ifdef FILL_ARRAY'; \
-		  ls *.c 2> /dev/null | sed -e 's@\(.*\)@#include \"\1\"@'; \
+		  ls verifier/*.c 2> /dev/null | sed -e 's@\(.*\)@#include "$(CURDIR)/\1"@'; \
 		  echo '#endif' \
-		) > verifier/tests.h)
-$(OUTPUT)/test_verifier: test_verifier.c verifier/tests.h $(BPFOBJ) | $(OUTPUT)
+		) > $(OUTPUT)/verifier/tests.h)
+$(OUTPUT)/test_verifier: test_verifier.c $(OUTPUT)/verifier/tests.h $(BPFOBJ) | $(OUTPUT)
 	$(call msg,BINARY,,$@)
 	$(Q)$(CC) $(CFLAGS) $(filter %.a %.o %.c,$^) $(LDLIBS) -o $@
 

-- 
2.55.0

