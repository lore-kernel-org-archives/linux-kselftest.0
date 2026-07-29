Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CDB1624C0
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 00:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785283591; cv=none; b=ZtfWPiXe+dxSVh5u95pXxSzLx71dLI8o/jWjhoy+tUgSj1vTh9mngronI0UbMSwZvULKvcWPQL4ODjlYFHfEK7MTtsSS5q9g7+SBFmDZ3hINEMdcq03ABu9sqCE0GG6zG1K80jBQu7A0chv51WHREO9c+9E5HZn270QnFbZDC88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785283591; c=relaxed/simple;
	bh=+21yumqrc3iiQtqtkl1hQgsQq8q/ettUoLBh+1Nj1Zc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HGvBk9Wg2jSlg1AEWstGvqhzKASOlyiEuF7QoKBci0sGhFeFeU3mPxTZfs5Wy2he42Ze++7/OUYizKR5f6mTZwZJCS8Kck//bQkHyMirum1G8uInKxUAEV64VSBySSm4Qd4Fhwn4mBRPo6eLb44SdcyDwzdpA0ibMP91DjYu2co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=SemkvbaJ; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="SemkvbaJ"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6aae244ef49so311667eaf.2
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 17:06:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785283588; x=1785888388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=24j9QhebMBn4aSJO102Oadv+5Gy+qFLKVHNJxhcauas=;
        b=GxtojV67eduZebIGtTo3Uwp1gEniEPH8HQXRcEqzOK1kX3UCGw66Wz1fg5ccVU21O7
         pWIDNgvN6VC0HR+EsWtAx5quT9lHxq4Tx5cTOrRAL0EUzy8SjaXQAKCNNzbCj5Y8F/JX
         m7wrTr9DMFauhIf78HsIs4DaDxRiMbbuvBX/Gpc4R9raPv8iaiHauARpits2sGF2sFwW
         Hr8C56GwYS+sXmJZQ0mE3RX8GXP3rhYXfs/vrWINuNWD54oHR5+n3Q1c2vNzM+kIDVtI
         2ixWYJMC2Lankzr80w80SiJPewWPECOPc5D+LtrvrCmhV2xcXBOEbO9Sb0yQvjpyD2Nc
         1SnA==
X-Forwarded-Encrypted: i=1; AHgh+RpEWqACt6DFMmyzgyYNxrN2UCGKwdHPT+HO6+sXjjoL0g3UkusWi1WJAp2LqfAeAFtDi7fR23Z2OdvQQZht4UQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVR6Z0jHN5Px8PtsB9G8dqOpB+qScs0hEVxmRwxjkO+XH8VKdh
	gAFWUcmp/ZVMKcp5HwOoG9oo+WZQGgaxZHpLMYhT46SdmqKOHxUClMmm
X-Gm-Gg: AR+sD136UkQJE91/gW35ot9Dex9BUe5CRB0MVQlJmLRTlOFnuYDveo+fi3fJ8TYdgYN
	Qdltb1ExGSb/K3NkClIgtqxnmN5Ym2Xy5h0hms62nDADZdwfhZRkI846j4YVK5VCEl+rJBudL60
	asCXkRb0YsZYM+u4PkO68po5EL2+ZSr4ScHOYHZXk13CUHO6FC4MVsHHvx04rUe4bS5BThQMsfR
	IJY8Q2fTVZpFMjBxsI6y2o+o6QryqwkEKLPL4BInBcTS3WgVKzs392Qp+M6aQGBLvEYxHLQ7lMY
	E/zf4iG3zko1MPowWt8qFZigdV4t/jzB0GLeNjOUAY1XYlB/6rRlG6okFJDpj+iHj7b7B5OTNLk
	KQifplNapP0GHlqjfOQ9PSK8thVVWc8mu6sYYGlVruzAYBzr9kftSxMGn/66uQjPoAYmRHkWL9n
	KDKCrN+Jl30Sluyos5qADo74gFzJP9W8T4SHvMuSapfyUToEYDlaa0M3J5Kq4fv/63y+7pPma+H
	x0/H7lsdyrJi76oZtB+7/frav2CDnL6hCBtOONXJYW88Ye5MQXXk8F//NSwIEdE1Q==
X-Received: by 2002:a05:6820:991:b0:6aa:de29:651 with SMTP id 006d021491bc7-6ac96bbc77dmr2563428eaf.16.1785283587566;
        Tue, 28 Jul 2026 17:06:27 -0700 (PDT)
Received: from mail.marliere.net (137.65.66.34.bc.googleusercontent.com. [34.66.65.137])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aca9a41fddsm25607eaf.8.2026.07.28.17.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 17:06:27 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8649060A0A;
	Wed, 29 Jul 2026 00:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=dkim; t=1785283586;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=24j9QhebMBn4aSJO102Oadv+5Gy+qFLKVHNJxhcauas=;
	b=SemkvbaJN8PBoqDc2hIhliBVn6xQsoEGYpJ+N4j0EFrYmeywHXg+u03tay0LwW3CPcsAbs
	P4c+T9Dz8SnsXA7/guYtoUkwq7FhuvngPgdnBAUNbJDRkX8pgU6QMlsGWgyYWRdlZidk2Q
	WgO+LEcQHsI9kwoNskj/qcc7KzreBirPmHcTiNpNV3hht0RC1R7XkXFkPgYh5wdxfBblW7
	nSnkHFOiLspfBGfnbrtzOiXQuztH6EWH84ZWm9W5XXpG4bKzfDyLIP+V4XIAP0pqqBC5Oe
	KmXflPSb62su/TYDSLevuVGqAtCAd+7eqJ0z8NDq3BvcfDXSjn060mxnNTFQ/g==
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
Date: Tue, 28 Jul 2026 21:06:12 -0300
Subject: [PATCH 2/3] selftests/bpf: Route libarena build artifacts to
 OUTPUT
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260728-selftests-bpf_oot-v1-2-05feb15d94db@marliere.net>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1785283576; l=5081;
 i=ricardo@marliere.net; h=from:subject:message-id;
 bh=+21yumqrc3iiQtqtkl1hQgsQq8q/ettUoLBh+1Nj1Zc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QEKD2FATcCJzGf0QFFFA/qzTxxSDYXZ6pTQK4n8oyAbTjj6MweRHluLsw0fegMwtlVnq2pZ4uDM
 GtTKVmcouYQo=
X-Developer-Key: i=ricardo@marliere.net; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g
X-Last-TLS-Session-Version: TLSv1.3

libarena's BPF objects, linked objects, and skeleton headers are always
written into the source tree regardless of whether an out-of-tree build
directory was specified via O=.

Add OUTPUT support to libarena/Makefile: default OUTPUT to '.' for
standalone builds, prefix all generated file targets with $(OUTPUT)/, and
use addprefix to propagate the directory into the per-object lists. Create
$(OUTPUT) at Makefile-load time with a $(shell mkdir -p) so all rules have
a valid destination.

In the parent bpf/Makefile, pass OUTPUT="$(OUTPUT)/libarena" in
LIBARENA_MAKE_ARGS and update LIBARENA_SKEL/LIBARENA_ASAN_SKEL to reflect
the new location. Pass the absolute target path as the make goal so the
sub-make goal matches the $(OUTPUT)/... rule in libarena/Makefile
regardless of the invocation directory.

Signed-off-by: Ricardo B. Marlière (SUSE) <ricardo@marliere.net>
---
 tools/testing/selftests/bpf/Makefile          | 11 ++++++-----
 tools/testing/selftests/bpf/libarena/Makefile | 24 ++++++++++++++----------
 2 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index b289183475d4..7d42632f9d42 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -826,7 +826,8 @@ LIBARENA_MAKE_ARGS = \
 		CLANG="$(CLANG)" \
 		BPF_CFLAGS="$(BPF_CFLAGS) $(CLANG_CFLAGS)" \
 		BPF_TARGET_ENDIAN="$(BPF_TARGET_ENDIAN)" \
-		Q="$(Q)"
+		Q="$(Q)" \
+		OUTPUT="$(OUTPUT)/libarena"
 
 LIBARENA_BPF_DEPS := $(wildcard libarena/Makefile		\
 				 libarena/include/*		\
@@ -835,17 +836,17 @@ LIBARENA_BPF_DEPS := $(wildcard libarena/Makefile		\
 				 libarena/selftests/*		\
 				 libarena/*.bpf.o)
 
-LIBARENA_SKEL := libarena/libarena.skel.h
+LIBARENA_SKEL := $(OUTPUT)/libarena/libarena.skel.h
 
 $(LIBARENA_SKEL): $(INCLUDE_DIR)/vmlinux.h $(BPFOBJ) $(LIBARENA_BPF_DEPS)
-	+$(MAKE) -C libarena libarena.skel.h $(LIBARENA_MAKE_ARGS)
+	+$(MAKE) -C libarena $(LIBARENA_SKEL) $(LIBARENA_MAKE_ARGS)
 
 ifneq ($(CLANG_HAS_ARENA_ASAN),)
-LIBARENA_ASAN_SKEL := libarena/libarena_asan.skel.h
+LIBARENA_ASAN_SKEL := $(OUTPUT)/libarena/libarena_asan.skel.h
 CFLAGS += -DHAS_BPF_ARENA_ASAN
 
 $(LIBARENA_ASAN_SKEL): $(INCLUDE_DIR)/vmlinux.h $(BPFOBJ) $(LIBARENA_BPF_DEPS)
-	+$(MAKE) -C libarena libarena_asan.skel.h $(LIBARENA_MAKE_ARGS)
+	+$(MAKE) -C libarena $(LIBARENA_ASAN_SKEL) $(LIBARENA_MAKE_ARGS)
 endif
 
 # Define test_progs test runner.
diff --git a/tools/testing/selftests/bpf/libarena/Makefile b/tools/testing/selftests/bpf/libarena/Makefile
index 5e2ab514805e..195d5f833186 100644
--- a/tools/testing/selftests/bpf/libarena/Makefile
+++ b/tools/testing/selftests/bpf/libarena/Makefile
@@ -27,10 +27,14 @@ BPFDIR=$(abspath $(LIBARENA)/..)
 INCLUDE_DIR ?= $(BPFDIR)/tools/include
 LIBBPF_INCLUDE ?= $(INCLUDE_DIR)
 
+# Build output directory; defaults to in-tree for standalone builds.
+OUTPUT ?= .
+$(shell mkdir -p $(OUTPUT))
+
 # Scan src/ and selftests/ to generate the final binaries
 LIBARENA_SOURCES = $(wildcard $(LIBARENA)/src/*.bpf.c) $(wildcard $(LIBARENA)/selftests/*.bpf.c)
-LIBARENA_OBJECTS = $(notdir $(LIBARENA_SOURCES:.bpf.c=.bpf.o))
-LIBARENA_OBJECTS_ASAN = $(notdir $(LIBARENA_SOURCES:.bpf.c=_asan.bpf.o))
+LIBARENA_OBJECTS = $(addprefix $(OUTPUT)/,$(notdir $(LIBARENA_SOURCES:.bpf.c=.bpf.o)))
+LIBARENA_OBJECTS_ASAN = $(addprefix $(OUTPUT)/,$(notdir $(LIBARENA_SOURCES:.bpf.c=_asan.bpf.o)))
 
 INCLUDES = -I$(LIBARENA)/include -I$(BPFDIR)
 ifneq ($(INCLUDE_DIR),)
@@ -61,32 +65,32 @@ CFLAGS += $(INCLUDES)
 vpath %.bpf.c $(LIBARENA)/src $(LIBARENA)/selftests
 vpath %.c $(LIBARENA)/src $(LIBARENA)/selftests
 
-skeletons: libarena.skel.h libarena_asan.skel.h
+skeletons: $(OUTPUT)/libarena.skel.h $(OUTPUT)/libarena_asan.skel.h
 .PHONY: skeletons
 
-libarena_asan.skel.h: libarena_asan.bpf.o
+$(OUTPUT)/libarena_asan.skel.h: $(OUTPUT)/libarena_asan.bpf.o
 	$(call msg,GEN-SKEL,libarena,$@)
 	$(Q)$(BPFTOOL) gen skeleton $< name "libarena_asan" > $@
 
-libarena.skel.h: libarena.bpf.o
+$(OUTPUT)/libarena.skel.h: $(OUTPUT)/libarena.bpf.o
 	$(call msg,GEN-SKEL,libarena,$@)
 	$(Q)$(BPFTOOL) gen skeleton $< name "libarena" > $@
 
-libarena_asan.bpf.o: $(LIBARENA_OBJECTS_ASAN)
+$(OUTPUT)/libarena_asan.bpf.o: $(LIBARENA_OBJECTS_ASAN)
 	$(call msg,GEN-OBJ,libarena,$@)
 	$(Q)$(BPFTOOL) gen object $@ $^
 
-libarena.bpf.o: $(LIBARENA_OBJECTS)
+$(OUTPUT)/libarena.bpf.o: $(LIBARENA_OBJECTS)
 	$(call msg,GEN-OBJ,libarena,$@)
 	$(Q)$(BPFTOOL) gen object $@ $^
 
-%_asan.bpf.o: %.bpf.c
+$(OUTPUT)/%_asan.bpf.o: %.bpf.c
 	$(call msg,CLNG-BPF,libarena,$@)
 	$(Q)$(CLANG) $(BPF_CFLAGS) $(ASAN_FLAGS) -DBPF_ARENA_ASAN $(BPF_TARGET_ENDIAN) -c $< -o $@
 
-%.bpf.o: %.bpf.c
+$(OUTPUT)/%.bpf.o: %.bpf.c
 	$(call msg,CLNG-BPF,libarena,$@)
 	$(Q)$(CLANG) $(BPF_CFLAGS) $(BPF_TARGET_ENDIAN) -c $< -o $@
 
 clean:
-	$(Q)rm -f *.skel.h *.bpf.o *.linked*.o
+	$(Q)rm -f $(OUTPUT)/*.skel.h $(OUTPUT)/*.bpf.o $(OUTPUT)/*.linked*.o

-- 
2.55.0

