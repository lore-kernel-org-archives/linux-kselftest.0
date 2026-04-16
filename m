Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522643E715C
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 19:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776367895; cv=none; b=oS+1ZRLwMCTw93lxqIgwlDNx/UbLTdn4XNl77Zj3+wb/V8kXK2q4GgoEoVB+a71kOHjODWWPlfc2Hn472PJj2g4dobfO+38OglP6Az0gQ7iPyQnWgSPvyrEa8IHy4X19eWW15a6VIcM3dWLhW92isMQVbDHjHUaLoKrCVAjLquY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776367895; c=relaxed/simple;
	bh=5U8TIbN/mzwNj1zjJeSGJwHzlD5O57QgUuewKq4KEws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HbhDYi9N+VY3pz7iOyMcHYSj8N65u8V+jvg+gZWW90g7V1k3HhqG0+bRQghJ3R3PUDJ2ZT819eVMBtYVwF+CfkvdEetFZqGu6aNnyOJf6n4YqwP6XaUXtMGio1e+67kJm+oZHmjqwKV3ewtYVepVneeL5yFMnTAHZphWHYwNTk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Mn2s994n; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Mn2s994n"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4887ca8e529so7657245e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 12:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776367889; x=1776972689; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VXKDU/OMVkefnHkZO//qI2CUfyjPw6Bi2G+7mqZsuYM=;
        b=Mn2s994n9ktSonoNdoYZT1QLOccsn6jW7AlU/e9bXOvQU7dsb0Dxr814i8iVrpF2zw
         oVF5qTcr+N6gEkMRAq0u9L26O8i2xWWmVRLF7GixEBa1SFvEgxe6K4aPkMq+RMuc7Ruw
         poPsKAx6db/JfcWxqTaJVrpURRWjElH0wxPiE8om88YY1hQ9e9f8ayeToYf7gXLBP8bS
         xcCk0eqLx36QUr2YLYx77bGbwSdO/FwqYb85z8UhwEL83dGrTqGbGneW8HdgsQOAF7ej
         tMJh24ATyvCOPmy3YBjGcL24NKjzpUrFUIvgfsbqyDqKuExjsXjyU/iBEV2PRRKnsuQH
         +F5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776367889; x=1776972689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VXKDU/OMVkefnHkZO//qI2CUfyjPw6Bi2G+7mqZsuYM=;
        b=JRE6NjUZhVJypPfMorQHO5K3uXkeIYt5MUn9eKBL0txitmzf0mhAl0Lk2KBYUimELk
         y0aJzeTO2KFn5y7FJzy9WitxOqsMI6EbhCak51+WO1hp8UPUpzPr61F+iFuvBGHEFfjG
         +yrh+MjNkY/WnRqpjoJz0n6G9vgYUvbq2Mtx6ngr8S2TavwhGnyaXUR7VbsZXQt3G4Pz
         6yTKfqUMNtui1qLZZMAh0+ToT9QlgWyTgLiGApALbbN0k2cL9l4I9fKm/mm5+4vnWtry
         RJZN4fN/rYWg+k4tUwjxOlRfcF6ewIcuLjSLU9Gk9xI9i3Kn00pKGmhmtYvms9OdEVrN
         GTaw==
X-Forwarded-Encrypted: i=1; AFNElJ8L4/pGlZBziy4jg1bXPcI8VgMECarSSMrSuTekz2SSiLUTrdpVi0m71IwZzqdHhY3Mi+Krd/RhXJw0oXAg2Lw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPb7rqRKMb/4kC2Gkr3h1rQo0/4+Tm8l5xmkG7mNtFCdoRxUht
	qBT3OFyuo7C9c+O65xCbDgt8xF/sIDXI+bdtU2JTGkgMgvH/Br+15v1fCPRPVQ5jqgU=
X-Gm-Gg: AeBDiesaiglqcQC+giJQhFs19YolqBmgQ1IRLMPVkv+5Lwl3tEVXPJrBn+Xavvh+j25
	bRYXrsqbz/ZAHe8FVN2GtidrbPjlyVTn1Tp0BAyfohc+4WZtUB+fepzGBUq1d6K8VGk+Y4qtxSF
	zEAH3uO2M4QbJonZVGk47vcSyvTY9BQEVvT3E8yQcku/22muCJoFenHaAfQThzJjsxnYHnxa/Er
	gXs9MppK1tXPkSFGfAxkubmCrkut6z9OU3TtlV1zuhkF8owjeSw/BikOhSffeT9fDK7A2Ee0/LZ
	PmYFjvOtER1csQLrOdSNfZYeGsDwU+Ocpe4B/HqDnA19lj0b4kV+5Hz0o0ii9kH+8GksvU/H841
	JoR+jhL7NCDxfRyg+9/GEtwgEVy69wEkHE2owNbGbM3BX9V0UHVq/q2m8tl1V+24P2AgJ4ztj1p
	pm47/sXM17TYlUAfGf215wVJ8=
X-Received: by 2002:a7b:cb10:0:b0:486:fcc7:6811 with SMTP id 5b1f17b1804b1-488fa8ec417mr5190175e9.10.1776367889102;
        Thu, 16 Apr 2026 12:31:29 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:dc8:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8f6615d5sm10798290eec.24.2026.04.16.12.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 12:31:28 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 16 Apr 2026 16:30:57 -0300
Subject: [PATCH bpf-next v7 08/11] selftests/bpf: Allow test_progs to link
 with a partial object set
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-selftests-bpf_misconfig-v7-8-a078e18012e4@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1776367852; l=2156;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=5U8TIbN/mzwNj1zjJeSGJwHzlD5O57QgUuewKq4KEws=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QONTkF/ZR6INLgA6jIuOfO+7ACHpfnck930ufRHZ8hvwjxS8M6MclxSL84x2+0W8DdhP3yinoQg
 fJwg3i3v+Swo=
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

Place the wildcard expansion before $^ in the filter to preserve the
original link order: test objects must precede libbpf.a so that GNU ld,
which scans static archives left-to-right, pulls in archive members that
are referenced exclusively by test objects (e.g. ring_buffer__new from
ringbuf.c).

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 5ad50d3ff2f8..a5597e8431a0 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -758,14 +758,15 @@ endif
 # some X.test.o files have runtime dependencies on Y.bpf.o files
 $(OUTPUT)/$(TRUNNER_BINARY): | $(TRUNNER_BPF_OBJS)
 
-$(OUTPUT)/$(TRUNNER_BINARY): $(TRUNNER_TEST_OBJS)			\
+$(OUTPUT)/$(TRUNNER_BINARY): $(if $(PERMISSIVE),,$(TRUNNER_TEST_OBJS))	\
 			     $(TRUNNER_EXTRA_OBJS) $$(BPFOBJ)		\
 			     $(TRUNNER_LIB_OBJS)			\
 			     $(TRUNNER_BPFTOOL)				\
 			     $(OUTPUT)/veristat				\
-			     | $(TRUNNER_BINARY)-extras
+			     | $(TRUNNER_BINARY)-extras			\
+			     $(if $(PERMISSIVE),$(TRUNNER_TEST_OBJS))
 	$$(call msg,BINARY,,$$@)
-	$(Q)$$(CC) $$(CFLAGS) $$(filter %.a %.o,$$^) $$(LDLIBS) $$(LLVM_LDLIBS) $$(LDFLAGS) $$(LLVM_LDFLAGS) -o $$@
+	$(Q)$$(CC) $$(CFLAGS) $$(filter %.a %.o,$(if $(PERMISSIVE),$$(wildcard $(TRUNNER_TEST_OBJS))) $$^) $$(LDLIBS) $$(LLVM_LDLIBS) $$(LDFLAGS) $$(LLVM_LDFLAGS) -o $$@
 	$(Q)ln -sf $(if $2,..,.)/tools/build/bpftool/$(USE_BOOTSTRAP)bpftool \
 		   $(OUTPUT)/$(if $2,$2/)bpftool
 

-- 
2.53.0

