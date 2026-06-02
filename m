Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87B03E5A35
	for <linux-kselftest@vger.kernel.org>; Tue,  2 Jun 2026 13:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780405423; cv=none; b=gpPKCE79e/CNc1utf6SaLBK+1yhDHX3GAuF2o5ZJPyR3qP7m1ub+K+8Di6UPhleM6wLlRzwW7SjR8ln0wKEG4IsqBQzsWAJ5yYQQ4AgN/+vEnS44OUg3E3BRcstfUtrNTVLHoJaiqZjlIU3NuT81HMjKYVlMP2fzxX6gbseU65E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780405423; c=relaxed/simple;
	bh=uWNPJAMMvZz9ncMt6g8dFuRJQCqMabAEhkRHLSv2R9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FaRTU/phdv9hIJMN52a/p6t/ZjznGtXONQ8y6oeqJ9/6Sn4LgK2ABsSMmsF6OmT8SRO5O9bKi/oNkarxXRnKohZraXGHpi2y4PHNhfZ5CAdwdGKPJTgwPNCALZNs14m1YkiczpUyBkqVch7BaWCT4qVJ2hGLn4m6GrA+6CKpcvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AmnFz6VH; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AmnFz6VH"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bec423a5265so472237066b.1
        for <linux-kselftest@vger.kernel.org>; Tue, 02 Jun 2026 06:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780405420; x=1781010220; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4XxjnI4cuMJlR6aAdNJiBVaZBbV9Bk2wM3k3iz92VQ8=;
        b=AmnFz6VH7iKgbuLF8co7yeipVvk8Ime8VomLncOB3XqnOTQEqH04aEymAbgHxWPXQX
         CxnJ5Mdto3szDSnZYGiuaxjD6x1CQolfamuZN/UiEw9s7auqHHjvmp1R/LmQl4o7wEwS
         N4WY0AWuToXUgMS1HiXIvRlRp7jMG100gho2d0hyz5b+NqdJ8ko/neqDdHKNX/sCXgK/
         URAtl3xoBnBgIanpY175jmr4s9SbQ/5vHYsCgoT/0lrsfdEzYtwiZIE++oU5J9svhFxl
         YWLdjE2/A9GEd1WJoHqHofRvJe7A5HsF+VQt4ZX350nYkGd0S2ctegbEq4rQkFB87qDc
         ygDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780405420; x=1781010220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4XxjnI4cuMJlR6aAdNJiBVaZBbV9Bk2wM3k3iz92VQ8=;
        b=tBIbIpNckV74RHON4KvJeJJiWL7SyYByNO9Uldc0zJiO3sMt3LURKu07gBuskirr3M
         Gpn49lPd8vo4shjFxyLGnFMoerXUEF2uKUX5SwUTLjJgRD1ZV8MIEqNENsBM7vlYz4ka
         OVyHsZCbEXLDG5EZD4nClrI+KT7rP4vtdSt6Tmj27wQjNeyCxokLLrg3XuP5NgWsuwIU
         dbpXiNEYvMbf7a3GNXSl5G87atql4eZ+Q2CioFo+865nIYI5/lJ432E1oCz2CwtxIoeV
         oPUsLWgzTaGr567fSkQWVjmMNbRpvVfU4vb6vLbCLUexwkfh3skrXceRG0fuCx6UjitI
         BBhQ==
X-Forwarded-Encrypted: i=1; AFNElJ/carNB8fqu4q8Ih9z60BKIBbry8S4POjEls/yiTR8qOR4dlm+IlPFjLhGLWOMlD9PESx7hi4Q2agiXJJZKxN0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQqmVQprv0Pu6W1cDzQqMdwh8uRO6ItRzgGXI1GufYYNK/uU2e
	HoU4yGfvaQyJHIVy+4O6AG9T6KBXBzLEgjvj+JHPwTs2SmIvkVyIG7z97CHHn4E1z6Y=
X-Gm-Gg: Acq92OGmsbWrsjBfLb7dki9RB40QZx7k/2HnaOCnKWJ9o6Pqp6g0J6dJ2Mjb5CQeiQf
	VkoDupVnd5QU1E1717Tcj6z9Bilm3kxMtdSdMguHx2+QwxHpFDeQNyIA+Na/S4hxdClga85XAy0
	HpkKKA+Msh0RauVKRdIGi5Yfuww7xsXl82rhz7RWHWnrHPeXEtY/60e/umJuNmdWICUWuHJYDK1
	49u8I7VWsj97IIN4L8jaONjlouLVmIVjgdGdyyBYcEfFKIHgdwHRyeXJTGPNAKse51Bh+bQoQUv
	NWSFpLZM4SyFUmDY/e8UTBqipt6n17FS6LqtTQAFytPqQDdI/bdTsdcprpy6/WbfwS3fdfEdPtL
	li0aeN+isjvSaLQSqDxV69t1Tdmxd0+Ne+Ab5eQHukiY470JphCS4Um59EkkZ82/cCbRv5JD4ak
	FSUVWGb0ydq+GTIe+PM7PrCB7jAaGiU1Ot
X-Received: by 2002:a17:906:4fc3:b0:be3:d140:2b54 with SMTP id a640c23a62f3a-beab2082dd2mr893000566b.31.1780405420163;
        Tue, 02 Jun 2026 06:03:40 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e15:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-be9d27f2207sm487792066b.2.2026.06.02.06.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 06:03:39 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Tue, 02 Jun 2026 10:02:55 -0300
Subject: [PATCH bpf-next RESEND v12 06/11] selftests/bpf: Tolerate test
 file compilation failures
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260602-selftests-bpf_misconfig-v12-6-27f898b3ba26@suse.com>
References: <20260602-selftests-bpf_misconfig-v12-0-27f898b3ba26@suse.com>
In-Reply-To: <20260602-selftests-bpf_misconfig-v12-0-27f898b3ba26@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1780405395; l=4111;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=uWNPJAMMvZz9ncMt6g8dFuRJQCqMabAEhkRHLSv2R9g=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJfDMS9D/+mnKEi0RM4P2U6qEEc/iRDpOKhEK35wD9KWU6NgFbMRVtLsZpl81hOOy3rU/imj7qV
 RlXJn464vjwE=
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
is invalid inside a shell if-then-fi body) and gate the printf on
$(filter 1,$(V)) so verbose mode (V=1) does not double-print the line
that the recipe shell already echoes; non-verbose modes (V unset, V=0,
V=2, ...) still print the BTFIDS marker, matching the convention of the
shared msg macro.

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
index 09de69a81112..7739799c2566 100644
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
+		$(if $(filter 1,$(V)),true,printf '  %-8s%s %s\n' "BTFIDS" " [$(TRUNNER_BINARY)]" "$$(notdir $$@)"); \
 		$(RESOLVE_BTFIDS) --btf $(TRUNNER_OUTPUT)/btf_data.bpf.o $$@;	\
-		$(RESOLVE_BTFIDS) --patch_btfids $$@.BTF_ids $$@)
+		$(RESOLVE_BTFIDS) --patch_btfids $$@.BTF_ids $$@;		\
+		fi)
 
 $(TRUNNER_TEST_OBJS:.o=.d): $(TRUNNER_OUTPUT)/%.test.d:			\
 			    $(TRUNNER_TESTS_DIR)/%.c			\

-- 
2.54.0

