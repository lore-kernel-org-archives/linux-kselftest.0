Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742323C9ED1
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Apr 2026 14:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228359; cv=none; b=hWSt8y0rOUlpTX1qkGAhBGgxP3g2KsD0Z/2IvuF2XbBbduNIk2MWNZ6603/6oBq1gNiSb0DFSEtCoVOHLXxYJpZfaBlhKcXIa7G6dNFzyZ9KJBXmbwiHGe+qeJUJcTygLvKQ2lfc6o9pUcWx4QALH5DEQE/ii6bVFgWS0ATj720=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228359; c=relaxed/simple;
	bh=6womnhNkPVIMC9BJtbyzHpcUSwPDJFVk2MnEcmHSrI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WTM0z3NKkQxAm9ZSnCgI5TGdTSWm+sIkna20Kb0SiFqLGhfDwof2eAF6cAAe2sYFAPttiJyrxmwkovBOEDeSIP94wkJoM7IRE1d6ESoWZsfD0L3zSj1tBBOKQ+NRiOHJUyDn3peunL8L7rNac0LgDeU2mTRj7GvHLYYwYJjtXFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DMC897k8; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DMC897k8"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-486ff3a0fc1so18190485e9.2
        for <linux-kselftest@vger.kernel.org>; Fri, 03 Apr 2026 07:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775228356; x=1775833156; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6BE6rCgLm4ycfO9rARPfewZKzJOvUfIcBPg9sKbASzA=;
        b=DMC897k8LZIasNvrcsOytlxbwe+3EZjGs1A875eUn/6MQDJiI0RTE9ORvL04OdAVE6
         +N+MOLaTuoDj99FYJ98xF//17ivdkxAli5yNzDb4KUdqJEtqo7KiQ2vO4EbzqQwKIL5H
         43Zc673deqHPbCsZY98JVUEmY/jqTHGNrh/iOFthrROMbsXyjR0jI2S2o+dEd/tALFnx
         TJaZSlGdWKpoKArv/pviJ8Wt7U72yLPXQkT/QYrshnVHF/T3pNTodVX4Q4OasSHSFQhs
         Fm3KHShZskI5+9jwC2K8bQ81Dmk5vH+aUHsEgTwdI03VOGHCv76uDKwiRTJeVTbsMdcM
         56HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228356; x=1775833156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6BE6rCgLm4ycfO9rARPfewZKzJOvUfIcBPg9sKbASzA=;
        b=IAVxbB1XU9MBJw+Dxnt3+zszp5qBrIuUDIXJuHw/h2slSyGqKVw4gVt3O45KCB8zhE
         fGC4OzbrVMHVF9uBSp7/P2S6rDTusAI1hjQQUq+AvicSwaXDfMxKH89F6wVhVDPljRMm
         yQHSJU1cK7HF77TE32m5xvjues3F26TCf+fNzUcO/A3AwrRuha1sQWxI8hjJTatOrwob
         S6HZpGoxrqDUqVhilo1RZPSJoF56KIYgpfsVD9OsuElC5kzIH1SBp0K+3YxWJxWgSwFd
         z6ZyAuCYNfUpupO7HqKKPJ0DrjtA9dl+gxu07fxj++K3r3rw9B16al6luTcxeSNykJog
         Wj3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUv+imNrJ7vDlAKPVooZM5hrwEnWfIuSxLTA3lCt8LEnM81VD4nSMQKMW7/0kfphsURGCYYEhceHhGUjhZKCJU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4OnqmmZ/tXk8Gk8bIFInJCSz71vcA4K9AU7BSGs2tBoDKm2V6
	8IWkdQ/t4SZfpflmoVuQplspMABAN/z0ILd+DRmxuQPDHgNEzsGaPJfN8Oec9I0YRjI=
X-Gm-Gg: ATEYQzwS8XAULO3jVO4gDqYEOlle4a5esB3AGha4pjTUjoHfiDEypc7lb5kfCvXeYBZ
	MEw6yDbb0u0S6xjaFM0HHpyTvLxsgfjqIDESUd9Ge0T1QFBh5j8BuCH9uQqEOw2TEMAVLEWGvwG
	ZpkgseB5/yiQpqLBe4OEC6+vustbn5Tgy+rtsu+9U57WgrPrUT4vZ9ndCXRPR3ITyMQZBcG2dNp
	20Dkr4wDohtguMSve8PU/fAAcUVXv0HxSgJhb6kKsdezkFR958hnrVBv8n/VPjBE3VIh6JPEWgl
	58ac+jZVZsE9sMWTzzGEywb4ZZD1ufAI7cNK+T+xOdhv2GfGsFsYp6wwfhGwNMJHa4BukJ5lDAu
	mZfe7s6Q3rj4npE/sLIJy+s/0aDNUcuw3cIvldWp6t6B8mXfAuXCKc6AL4J+RGJ6qw5eNJF/mpG
	Olxur9MR4X4C4IR7CrWEI=
X-Received: by 2002:a05:600c:3b23:b0:485:17a7:b9c7 with SMTP id 5b1f17b1804b1-488996ecd50mr49474765e9.10.1775228355687;
        Fri, 03 Apr 2026 07:59:15 -0700 (PDT)
Received: from localhost ([189.99.238.3])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bae1117sm7076592e0c.7.2026.04.03.07.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:59:14 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Fri, 03 Apr 2026 11:58:55 -0300
Subject: [PATCH v2 02/10] selftests/bpf: Tolerate BPF and skeleton
 generation failures
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260403-selftests-bpf_misconfig-v2-2-f06700380a9d@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775228344; l=6534;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=6womnhNkPVIMC9BJtbyzHpcUSwPDJFVk2MnEcmHSrI4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QA7ppl++NinTXsLUpfuCBDtAXqZB4gw73Ar4l/wC46UhDNotof5yGorlVy2s//UHT2uQCoR/rIe
 Z5oq7Tp4+tQw=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Some BPF programs cannot be built on distro kernels because required BTF
types or features are missing. A single failure currently aborts the
selftests/bpf build.

Make BPF object and skeleton generation best effort: emit SKIP-BPF or
SKIP-SKEL, remove failed outputs so downstream rules can detect absence,
and continue with remaining tests.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 77 ++++++++++++++++++++++++------------
 1 file changed, 51 insertions(+), 26 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index f75c4f52c028..6052bba2c157 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -470,22 +470,26 @@ $(OUTPUT)/cgroup_getset_retval_hooks.o: cgroup_getset_retval_hooks.h
 # $4 - binary name
 define CLANG_BPF_BUILD_RULE
 	$(call msg,CLNG-BPF,$4,$2)
-	$(Q)$(CLANG) $3 -O2 $(BPF_TARGET_ENDIAN) -c $1 -mcpu=v3 -o $2
+	$(Q)$(CLANG) $3 -O2 $(BPF_TARGET_ENDIAN) -c $1 -mcpu=v3 -o $2 || \
+		($(RM) $2; printf '  %-12s %s\n' 'SKIP-BPF' '$(notdir $2)' 1>&2)
 endef
 # Similar to CLANG_BPF_BUILD_RULE, but with disabled alu32
 define CLANG_NOALU32_BPF_BUILD_RULE
 	$(call msg,CLNG-BPF,$4,$2)
-	$(Q)$(CLANG) $3 -O2 $(BPF_TARGET_ENDIAN) -c $1 -mcpu=v2 -o $2
+	$(Q)$(CLANG) $3 -O2 $(BPF_TARGET_ENDIAN) -c $1 -mcpu=v2 -o $2 || \
+		($(RM) $2; printf '  %-12s %s\n' 'SKIP-BPF' '$(notdir $2)' 1>&2)
 endef
 # Similar to CLANG_BPF_BUILD_RULE, but with cpu-v4
 define CLANG_CPUV4_BPF_BUILD_RULE
 	$(call msg,CLNG-BPF,$4,$2)
-	$(Q)$(CLANG) $3 -O2 $(BPF_TARGET_ENDIAN) -c $1 -mcpu=v4 -o $2
+	$(Q)$(CLANG) $3 -O2 $(BPF_TARGET_ENDIAN) -c $1 -mcpu=v4 -o $2 || \
+		($(RM) $2; printf '  %-12s %s\n' 'SKIP-BPF' '$(notdir $2)' 1>&2)
 endef
 # Build BPF object using GCC
 define GCC_BPF_BUILD_RULE
 	$(call msg,GCC-BPF,$4,$2)
-	$(Q)$(BPF_GCC) $3 -DBPF_NO_PRESERVE_ACCESS_INDEX -Wno-attributes -O2 -c $1 -o $2
+	$(Q)$(BPF_GCC) $3 -DBPF_NO_PRESERVE_ACCESS_INDEX -Wno-attributes -O2 -c $1 -o $2 || \
+		($(RM) $2; printf '  %-12s %s\n' 'SKIP-BPF' '$(notdir $2)' 1>&2)
 endef
 
 SKEL_BLACKLIST := btf__% test_pinning_invalid.c test_sk_assign.c
@@ -591,32 +595,53 @@ $(TRUNNER_BPF_OBJS): $(TRUNNER_OUTPUT)/%.bpf.o:				\
 					  $$($$<-$2-CFLAGS),$(TRUNNER_BINARY))
 
 $(TRUNNER_BPF_SKELS): %.skel.h: %.bpf.o $(BPFTOOL) | $(TRUNNER_OUTPUT)
-	$$(call msg,GEN-SKEL,$(TRUNNER_BINARY),$$@)
-	$(Q)$$(BPFTOOL) gen object $$(<:.o=.linked1.o) $$<
-	$(Q)$$(BPFTOOL) gen object $$(<:.o=.linked2.o) $$(<:.o=.linked1.o)
-	$(Q)$$(BPFTOOL) gen object $$(<:.o=.linked3.o) $$(<:.o=.linked2.o)
-	$(Q)diff $$(<:.o=.linked2.o) $$(<:.o=.linked3.o)
-	$(Q)$$(BPFTOOL) gen skeleton $$(<:.o=.linked3.o) name $$(notdir $$(<:.bpf.o=)) > $$@
-	$(Q)$$(BPFTOOL) gen subskeleton $$(<:.o=.linked3.o) name $$(notdir $$(<:.bpf.o=)) > $$(@:.skel.h=.subskel.h)
-	$(Q)rm -f $$(<:.o=.linked1.o) $$(<:.o=.linked2.o) $$(<:.o=.linked3.o)
+	$(Q)if [ ! -f $$< ]; then					\
+		printf '  %-12s %s\n' 'SKIP-SKEL' '$$(notdir $$@)' 1>&2; \
+		exit 0;							\
+	fi;								\
+	printf '  %-12s %s\n' 'GEN-SKEL' '[$(TRUNNER_BINARY)] $$(notdir $$@)' 1>&2; \
+	$$(BPFTOOL) gen object $$(<:.o=.linked1.o) $$< &&		\
+	$$(BPFTOOL) gen object $$(<:.o=.linked2.o) $$(<:.o=.linked1.o) && \
+	$$(BPFTOOL) gen object $$(<:.o=.linked3.o) $$(<:.o=.linked2.o) && \
+	diff $$(<:.o=.linked2.o) $$(<:.o=.linked3.o) &&		\
+	$$(BPFTOOL) gen skeleton $$(<:.o=.linked3.o) name $$(notdir $$(<:.bpf.o=)) > $$@ && \
+	$$(BPFTOOL) gen subskeleton $$(<:.o=.linked3.o) name $$(notdir $$(<:.bpf.o=)) > $$(@:.skel.h=.subskel.h) || { \
+		$$(RM) $$@ $$(@:.skel.h=.subskel.h); \
+		printf '  %-12s %s\n' 'SKIP-SKEL' '$$(notdir $$@)' 1>&2; \
+	}; \
+	rm -f $$(<:.o=.linked1.o) $$(<:.o=.linked2.o) $$(<:.o=.linked3.o)
 
 $(TRUNNER_BPF_LSKELS): %.lskel.h: %.bpf.o $(BPFTOOL) | $(TRUNNER_OUTPUT)
-	$$(call msg,GEN-SKEL,$(TRUNNER_BINARY),$$@)
-	$(Q)$$(BPFTOOL) gen object $$(<:.o=.llinked1.o) $$<
-	$(Q)$$(BPFTOOL) gen object $$(<:.o=.llinked2.o) $$(<:.o=.llinked1.o)
-	$(Q)$$(BPFTOOL) gen object $$(<:.o=.llinked3.o) $$(<:.o=.llinked2.o)
-	$(Q)diff $$(<:.o=.llinked2.o) $$(<:.o=.llinked3.o)
-	$(Q)$$(BPFTOOL) gen skeleton -L $$(<:.o=.llinked3.o) name $$(notdir $$(<:.bpf.o=_lskel)) > $$@
-	$(Q)rm -f $$(<:.o=.llinked1.o) $$(<:.o=.llinked2.o) $$(<:.o=.llinked3.o)
+	$(Q)if [ ! -f $$< ]; then					\
+		printf '  %-12s %s\n' 'SKIP-SKEL' '$$(notdir $$@)' 1>&2; \
+		exit 0;							\
+	fi;								\
+	printf '  %-12s %s\n' 'GEN-SKEL' '[$(TRUNNER_BINARY)] $$(notdir $$@)' 1>&2; \
+	$$(BPFTOOL) gen object $$(<:.o=.llinked1.o) $$< &&		\
+	$$(BPFTOOL) gen object $$(<:.o=.llinked2.o) $$(<:.o=.llinked1.o) && \
+	$$(BPFTOOL) gen object $$(<:.o=.llinked3.o) $$(<:.o=.llinked2.o) && \
+	diff $$(<:.o=.llinked2.o) $$(<:.o=.llinked3.o) &&		\
+	$$(BPFTOOL) gen skeleton -L $$(<:.o=.llinked3.o) name $$(notdir $$(<:.bpf.o=_lskel)) > $$@ || { \
+		$$(RM) $$@; \
+		printf '  %-12s %s\n' 'SKIP-SKEL' '$$(notdir $$@)' 1>&2; \
+	}; \
+	rm -f $$(<:.o=.llinked1.o) $$(<:.o=.llinked2.o) $$(<:.o=.llinked3.o)
 
 $(TRUNNER_BPF_LSKELS_SIGNED): %.lskel.h: %.bpf.o $(BPFTOOL) | $(TRUNNER_OUTPUT)
-	$$(call msg,GEN-SKEL,$(TRUNNER_BINARY) (signed),$$@)
-	$(Q)$$(BPFTOOL) gen object $$(<:.o=.llinked1.o) $$<
-	$(Q)$$(BPFTOOL) gen object $$(<:.o=.llinked2.o) $$(<:.o=.llinked1.o)
-	$(Q)$$(BPFTOOL) gen object $$(<:.o=.llinked3.o) $$(<:.o=.llinked2.o)
-	$(Q)diff $$(<:.o=.llinked2.o) $$(<:.o=.llinked3.o)
-	$(Q)$$(BPFTOOL) gen skeleton $(LSKEL_SIGN) $$(<:.o=.llinked3.o) name $$(notdir $$(<:.bpf.o=_lskel)) > $$@
-	$(Q)rm -f $$(<:.o=.llinked1.o) $$(<:.o=.llinked2.o) $$(<:.o=.llinked3.o)
+	$(Q)if [ ! -f $$< ]; then					\
+		printf '  %-12s %s\n' 'SKIP-SKEL' '$$(notdir $$@)' 1>&2; \
+		exit 0;							\
+	fi;								\
+	printf '  %-12s %s\n' 'GEN-SKEL' '[$(TRUNNER_BINARY) (signed)] $$(notdir $$@)' 1>&2; \
+	$$(BPFTOOL) gen object $$(<:.o=.llinked1.o) $$< &&		\
+	$$(BPFTOOL) gen object $$(<:.o=.llinked2.o) $$(<:.o=.llinked1.o) && \
+	$$(BPFTOOL) gen object $$(<:.o=.llinked3.o) $$(<:.o=.llinked2.o) && \
+	diff $$(<:.o=.llinked2.o) $$(<:.o=.llinked3.o) &&		\
+	$$(BPFTOOL) gen skeleton $(LSKEL_SIGN) $$(<:.o=.llinked3.o) name $$(notdir $$(<:.bpf.o=_lskel)) > $$@ || { \
+		$$(RM) $$@; \
+		printf '  %-12s %s\n' 'SKIP-SKEL' '$$(notdir $$@)' 1>&2; \
+	}; \
+	rm -f $$(<:.o=.llinked1.o) $$(<:.o=.llinked2.o) $$(<:.o=.llinked3.o)
 
 $(LINKED_BPF_OBJS): %: $(TRUNNER_OUTPUT)/%
 

-- 
2.53.0

