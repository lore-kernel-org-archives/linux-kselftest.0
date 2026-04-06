Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82C939478A
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 18:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775499760; cv=none; b=r6iF694kPtUdwfO6Z40Ybk6FTyv7CD6Q1L8alqb6QbMdccoEXaJ0LCzGCqN2rVFCOtoPxnmJunrFAfZFDyMKYKLVQ/fr5xAJcn8ymdGqOMUKk951up7SExDKLBK1JQo26HTrINzIj+ifrxOrM8PS6kxXLv1GC/075ELe5wf7F44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775499760; c=relaxed/simple;
	bh=AEn3z1mU2fpCck8UIIjXl5+FxsZFquBJDrd1WRW0HDk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L6tGYVhaBvv6IsB1EMHf/D723+7zDOWJBI/1AqTM9ZYiLA3UIchUgz1id7iT7bleFDZfkEumFuxBbrPvmE1qw0JDfkU7xjA1Ff4PwRYesLzXLW8rpEhbomRpI71N6Op2KoxMAQlVFfYVxcrE42onyaEu1rhU48H8tGvsguJg35I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Yk5O4e/T; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Yk5O4e/T"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488ba6366a7so3366385e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 11:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775499756; x=1776104556; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YvAeDkBxqfN6WYXzL4jwsf1x31D4pD7nsRyWJL/PC4M=;
        b=Yk5O4e/TcP4UHg4r9fqardAFgS32wulK9Ba/8ErLnZR3DJm3jXicA3l2CnBubYt0HF
         fgPLFKwFdZT+KGgqeVdNdme9xJ88cmiWjTN8YOYco0Ntoow0NvhtgP+q20hwwMbhoJix
         yd3VYmRfhjDkHlPBz8rbM6CoeMMXoyFd94QW/a1YaV3ZreBZqb5n4Ms9qRCYro4oGDJJ
         0NZvSzrXBylVWnAIt3JostYy225fB/r6cz4YVl/EmGfwnEO+xLlTMpi7QTcwOhjeAoLU
         5jCPv+a4hXEhjFkiJIUDWXnKZMUhn/oLmLsrivTGh/+GCAPzAwELO8z7teCD8J2nawxi
         1Uww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775499756; x=1776104556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YvAeDkBxqfN6WYXzL4jwsf1x31D4pD7nsRyWJL/PC4M=;
        b=gQgN+YSPOkSKuZZWcZQJsjZDU6hj0nwBTb6G60SrJ4+xVhd2fSeCQ30XoC+bCrfIEo
         afAmnHGPlqJ8h3R4XJoqlf+E8FPvRuKhMqLyUW92ka8gof/W0BCfa23pwXJJGpIxxiLY
         HH+RE416QSx+pVN2iIy6mJiaUvWHieBQR/WoXdRhX212v2s37DaRyOsNqCliar00e6p0
         wLll3nL5BgSwHjKRK5UlJPzUwxFdWotfZL8gAOxP7IqSq7HRxcC941URijERmX0v139U
         0JzWF6wwgLbjMLxZMl2wnj5amymmEptAxFbXFIYSjvJgl/ZOZvnmxKoXGsb1tJzDeslX
         fq1w==
X-Forwarded-Encrypted: i=1; AJvYcCVzLbKNWjNg8jQ6uHbzWLnVpUZ6pdf4CiC1wwK6SGsjMY9SuA7nAE3Q30Am8chzOJCsnCIB0g5NMpDruywsZro=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEFMDO1Zr8k5Y25GDQbHPsQAsn8C2FTjCVvFb+3EMF13NyuxSL
	ZNHkmUG/P7NxAfq0dCvZRtee7008d5AvwVVrtDghZRU0eiO9zAqszcIahYRmgnkeuz0K+W2iG6e
	nZqek
X-Gm-Gg: AeBDieuYOYDFRjMugGbDvZ+0SAy7Om8mj816965AEphf40L2J1qTDesuYAwoGMDQqbh
	VhPiYyOUV1Bei3LtnsqYfi0B/c/GD0+GbqdQPYI+HpZddOUj6N2i9gBxHGTTPL9TRjGcNz+ckAs
	LTDe3KotOriG/Abr+1PfCvakPVFOVe6Lc+/GXawnuxW3yRQy7AgI4S3Jl3uzWjPPxJCqLs54aD1
	G5q9RVYZa422ltrsRNmZ+zjTbOyl590ol7vR4/jvzwk1wX2V1MOU07ukqt/n784cpuSV3OUaZ81
	Ct7aEw7kDxKG/iZ+7N4Vx4HUCxdlQYhP6pX8zOux1NdqPk0fGAtMioFEuHbLBd+pOw4goof5Oz0
	vF9/1ySbEUwVL8WlXuMYSuWI0r0Jmz3i27RfBmCadVNvlH9z50sAuZQfGCaJW3gCNfuQ/mD72no
	vc6BR/dJqs44/AyglT6quX2lU=
X-Received: by 2002:a05:600c:6305:b0:488:80b6:873a with SMTP id 5b1f17b1804b1-488997a4679mr190079425e9.21.1775499756358;
        Mon, 06 Apr 2026 11:22:36 -0700 (PDT)
Received: from localhost ([2804:7f0:b767:120d:a4df:3777:2c55:2b95])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9ba80290sm17348275e0c.3.2026.04.06.11.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 11:22:35 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Mon, 06 Apr 2026 15:22:17 -0300
Subject: [PATCH v4 05/10] selftests/bpf: Tolerate test file compilation
 failures
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260406-selftests-bpf_misconfig-v4-5-9914f50efdf7@suse.com>
References: <20260406-selftests-bpf_misconfig-v4-0-9914f50efdf7@suse.com>
In-Reply-To: <20260406-selftests-bpf_misconfig-v4-0-9914f50efdf7@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775499736; l=2101;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=AEn3z1mU2fpCck8UIIjXl5+FxsZFquBJDrd1WRW0HDk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QBGQdeW+jOhSS10zVM6eVqN9J9HSgNEoIUL7UQZAhjF5JdjlnXJ+GxuPnnJgJafk3RlAsBnZGvu
 ywAuIQ2YlbAs=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Individual test files may fail to compile when headers or kernel features
required by that test are absent. Currently this aborts the entire build.

Make the per-test compilation non-fatal: remove the output object on
failure and print a SKIP-TEST marker to stderr. Guard the BTFIDS
post-processing step so it is skipped when the object file is absent.
The linker step will later ignore absent objects, allowing the remaining
tests to build and run.

Use plain printf and $(Q) instead of $(call msg,...) in the BTFIDS block:
the msg macro expands to @printf which is a make-recipe construct and is
invalid as a shell command inside an if-then-fi body; $(Q) restores
echo suppression at the recipe level where it is meaningful.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 72f576a8236a..e67f9c4cb5d7 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -688,11 +688,14 @@ $(TRUNNER_TEST_OBJS): $(TRUNNER_OUTPUT)/%.test.o:			\
 		      $(TRUNNER_TESTS_DIR)/%.c				\
 		      | $(TRUNNER_OUTPUT)/%.test.d
 	$$(call msg,TEST-OBJ,$(TRUNNER_BINARY),$$@)
-	$(Q)cd $$(@D) && $$(CC) -I. $$(CFLAGS) -MMD -MT $$@ -c $(CURDIR)/$$< $$(LDLIBS) -o $$(@F)
+	$(Q)cd $$(@D) && $$(CC) -I. $$(CFLAGS) -MMD -MT $$@ -c $(CURDIR)/$$< $$(LDLIBS) -o $$(@F) || \
+		($(RM) $$(@F); printf '  %-12s %s\n' 'SKIP-TEST' '$$(notdir $$@)' 1>&2)
 	$$(if $$(TEST_NEEDS_BTFIDS),						\
-		$$(call msg,BTFIDS,$(TRUNNER_BINARY),$$@)			\
+		$(Q)if [ -f $$@ ]; then						\
+		printf '  %-8s%s %s\n' "BTFIDS" " [$(TRUNNER_BINARY)]" "$$(notdir $$@)"; \
 		$(RESOLVE_BTFIDS) --btf $(TRUNNER_OUTPUT)/btf_data.bpf.o $$@;	\
-		$(RESOLVE_BTFIDS) --patch_btfids $$@.BTF_ids $$@)
+		$(RESOLVE_BTFIDS) --patch_btfids $$@.BTF_ids $$@;		\
+		fi)
 
 $(TRUNNER_TEST_OBJS:.o=.d): $(TRUNNER_OUTPUT)/%.test.d:			\
 			    $(TRUNNER_TESTS_DIR)/%.c			\

-- 
2.53.0

