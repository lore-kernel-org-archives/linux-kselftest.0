Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FFC40B6F4
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 12:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553628; cv=none; b=DkJURcDozXEB/7Pwr1esl9TdAtUxspmiYfPmf5LQIGGw8wU40bY+3CiUCl17b7F6vf8AveWzH1IsdRljw6cALP/eD1mbQNOjGkMMuhVI3xJoRiKVpPbR0vs4ViciggyyXQ6aAjEw6USm8NbuME03gEOwkt1V4us51ZSupFPjDoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553628; c=relaxed/simple;
	bh=jhJGxFLXxkLJMjYYafkYMHZLmy3CdijahvtwkglC+SU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dnmxQTHjRALoti3R5g/3D/0g4qbHuUemgIzh/thKlDZ0YQjBaslAhTv/VWCt9m3utvJqVyhRP1mhNZ6KSS+nZR1gloJCz9ykXNnLDJHmo9cIWsgjr6GsjJS4LaAp7AShZTvApst5vlBmV9PXFnk8jzgkTep2eTvRE5AjIcRInrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NJb43LMr; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NJb43LMr"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso7459655e9.3
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 05:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777553624; x=1778158424; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FT2xKlbvDdzA1YOF+HW6JVqGVpjLZaiDVQi7htx3o/c=;
        b=NJb43LMru5z2jqAW9FreObAKaEppL2DzYUCPILGchwZ045As3IsaAw1RpnTPqlrQBn
         jtA8sAvBRkR60YRKk/Z2/Txjkj+QMTR0u1xqGC95KoxloC+s6epkSrrTNo3UsPFtVUBO
         Qtn4M3SubCxCpkKFH9OGkWwimJsHZMy6y6WTCYSSjUSiLIw4VWD6eU5M/wTSDLhRDEXM
         Tus003Pqu7o+6PQMqCCfM+K9QTx5BI6VG5saRgz9anSjvRErYu4QBXWuUPRyng7Gcykt
         GMFjvjPhALMfKdFGScvpOukc30XB26QiHqz+kAPbSvCTTlIrCiyF5xAbcV5P07W6d4yv
         U+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777553624; x=1778158424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FT2xKlbvDdzA1YOF+HW6JVqGVpjLZaiDVQi7htx3o/c=;
        b=mZTvp99dwlHbZw0bCGGdfvbjuGHglMeUaWeERPD2Epyo6jMahTqH57Xm8rZ8Jmpd+I
         A3fSP18HhXvSY6LyLtMWSSosWAtp/Ew/a3aOo6+gBlnMgopyAcFIzaYzfTh6GwvahTTT
         H7JX5F2JBUbIOZXqw15quXEIB+cf1pWFEuY0qQ5Orfnn6Ltk7eOaL81dykx0+vcJi32f
         RBBWIpl2GWhusFeE2rvZZIud2vlhqz+YWpn75j1tkolvMcr9Pwq31UnLISYAzpiiyO/P
         XyAsoNCaaUtLnWDub/KVOriUZnK/n+251B5YqVffgjAuOM3SGzFkpIuLNVGvmnWGA5dU
         RwwQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Dhn4cJPdDTCnMEUZ48P2qHM+sVlGXehf/o5NgDijsTXU2t05jX2MJThzPFdvI10pkDdXTaWU3fdKCo+ZOJFg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW9NZp3Vb/ML2dVY2JcAj76FMdumXfupuZzzuPA5sKwQJ78sJb
	Mo4SBHeTSCKYM0Xh22apFzaBhk/k3cT63yjIht49Mkvg3di8VOcBh69a0ZiA6OteHEk=
X-Gm-Gg: AeBDieubv56uCj1MwlgT1DJmC1GqEGt9p444RjTMywO960mcpsSFBgeHLtszGHTUZwR
	L6EtC709OKToG/waTQ1JB/fOPAmBSuFdqY1idH0deoQKJMQ7ig84SzWOBUPO53uVpeCEX7WzwZv
	OXicBpcdNbBVruoXVT+6WDEK5mU0pk5GPLfa5685uVzJzY9WbIVqkv4dxwP4VeTSxzrz7lNGsdf
	hRpGZqymzGRf7hR/L7s/0OX3AEWRUhTlOD0qfzxyEsMlrp0IkQ6sq/pJv2615tlVtDOJyMnX1LI
	kJVoxEh+Pduxar2SavVbEfxlorwzmT1OQQntlBwDy0EU68scLlcYgk7jAJy+p5mAStRDLigGMrD
	uVvUNPd9889WuWWFP7Whs0DebUCyyQvPgRtuxW1UiKC06NkZmaU76Z6NuYc6TFZkwPHynyV7UoE
	M+KlZC5E3T3a2oGCX5muqIX6Tn
X-Received: by 2002:a05:600c:a409:b0:489:1fa5:997f with SMTP id 5b1f17b1804b1-48a83d6c37cmr37470475e9.9.1777553623585;
        Thu, 30 Apr 2026 05:53:43 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed1bf8e268sm6512299eec.12.2026.04.30.05.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:53:42 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 30 Apr 2026 09:53:18 -0300
Subject: [PATCH bpf-next v10 06/11] selftests/bpf: Tolerate test file
 compilation failures
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260430-selftests-bpf_misconfig-v10-6-cd302a31af16@suse.com>
References: <20260430-selftests-bpf_misconfig-v10-0-cd302a31af16@suse.com>
In-Reply-To: <20260430-selftests-bpf_misconfig-v10-0-cd302a31af16@suse.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777553600; l=3956;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=jhJGxFLXxkLJMjYYafkYMHZLmy3CdijahvtwkglC+SU=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPyh1r4yQgGiTl7p10u76G1+dBl73UkoQ6YCfM7dVMhLmRrPWXvgE4uU12xenX0boJ/djBmN+wv
 lxiN8QRBfcwM=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Individual test files may fail to compile when headers or kernel features
required by that test are absent. Currently this aborts the entire build.

Make the per-test compilation non-fatal: remove the output object on
failure and print a SKIP-TEST marker to stderr. Guard the BTFIDS
post-processing step so it is skipped when the object file is absent. The
linker step will later ignore absent objects, allowing the remaining tests
to build and run.

Group cd and CC in a sub-shell so a cd failure cannot leak into the
error-handling branch and operate in the original working directory; use
$@ (absolute path) for $(RM) so it cannot match an unrelated file there.

Replace the $(call msg,...) in the BTFIDS block with a plain printf
(the msg macro expands to @printf, which is a make-recipe construct and
is invalid inside a shell if-then-fi body) and gate the printf on $(V)
so verbose mode does not double-print the line that the recipe shell
already echoes.

Restrict tolerance to test_progs and its flavors via an inlined
$(if $(filter test_progs%,$1),$(if $(PERMISSIVE),...)) check: runners
with strong cross-object references (e.g. test_maps) would link-fail
with a partial object set, so they keep strict semantics even when
BPF_STRICT_BUILD=0. The check is inlined rather than stored in a helper
variable so $1 is substituted at $(call) time and the per-runner result
is baked into each recipe.

Note on bisectability: this change is gated entirely behind PERMISSIVE
for test_progs%, so default builds (BPF_STRICT_BUILD!=0) compile and
run identically at every commit in the series. Bisecting in PERMISSIVE
mode at this commit still requires the next two patches ("selftests/bpf:
Skip tests whose objects were not built" and "selftests/bpf: Allow
test_progs to link with a partial object set") to avoid the linker
rejecting missing objects and the runtime aborting on NULL function
pointers.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 608e6dff0392..9becc077eb23 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -588,6 +588,12 @@ endef
 # $2 - test runner extra "flavor" (e.g., no_alu32, cpuv4, bpf_gcc, etc)
 define DEFINE_TEST_RUNNER_RULES
 
+# Permissive build behaviour (skip-on-failure compile, partial-link) only
+# applies to test_progs and its flavors; runners that use strong cross-object
+# references (e.g. test_maps) keep strict semantics even when permissive.
+# The check is inlined per-runner so $1 is substituted at $(call) time and
+# the result is baked into each rule's recipe.
+
 ifeq ($($(TRUNNER_OUTPUT)-dir),)
 $(TRUNNER_OUTPUT)-dir := y
 $(TRUNNER_OUTPUT):
@@ -717,11 +723,14 @@ $(TRUNNER_TEST_OBJS): $(TRUNNER_OUTPUT)/%.test.o:			\
 		      $(TRUNNER_TESTS_DIR)/%.c				\
 		      | $(TRUNNER_OUTPUT)/%.test.d
 	$$(call msg,TEST-OBJ,$(TRUNNER_BINARY),$$@)
-	$(Q)cd $$(@D) && $$(CC) -I. $$(CFLAGS) -MMD -MT $$@ -c $(CURDIR)/$$< $$(LDLIBS) -o $$(@F)
+	$(Q)(cd $$(@D) && $$(CC) -I. $$(CFLAGS) -MMD -MT $$@ -c $(CURDIR)/$$< $$(LDLIBS) -o $$(@F)) $(if $(filter test_progs%,$1),$(if $(PERMISSIVE),|| \
+		($(RM) $$@; printf '  %-12s %s\n' 'SKIP-TEST' '$$(notdir $$@)' 1>&2)))
 	$$(if $$(TEST_NEEDS_BTFIDS),						\
-		$$(call msg,BTFIDS,$(TRUNNER_BINARY),$$@)			\
+		$(Q)if [ -f $$@ ]; then						\
+		$(if $(V),true,printf '  %-8s%s %s\n' "BTFIDS" " [$(TRUNNER_BINARY)]" "$$(notdir $$@)"); \
 		$(RESOLVE_BTFIDS) --btf $(TRUNNER_OUTPUT)/btf_data.bpf.o $$@;	\
-		$(RESOLVE_BTFIDS) --patch_btfids $$@.BTF_ids $$@)
+		$(RESOLVE_BTFIDS) --patch_btfids $$@.BTF_ids $$@;		\
+		fi)
 
 $(TRUNNER_TEST_OBJS:.o=.d): $(TRUNNER_OUTPUT)/%.test.d:			\
 			    $(TRUNNER_TESTS_DIR)/%.c			\

-- 
2.54.0

