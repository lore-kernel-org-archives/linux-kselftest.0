Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11013B8BD1
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 12:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776342119; cv=none; b=ndfEzK5aerOzOfiI4tyrCHQnvqtsMUvhjXdovo0LwIlDJsUXqHD9uqBLWwWgvnDwdT/uvXb06uZ7faYxka5lRmLDnCXqz72AUHJQSq/FiovNa9seiu1Mb+qB5PrA3zvMPiEpVEY276OmEENPcub/KAm3Ioixp8VxG/XW2PlvxRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776342119; c=relaxed/simple;
	bh=DXqH+tS5C79NJ+J0fc2RdGELwdh06ZOzO/YLsYIRLlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ged6uJYZpZjVbcS1o+QHTKAPXsDo76n3TmmuN9KpIQAGjGj/SOl1ixDDny7sjI6B70ysD5XYlLOmbq2KuMFl1iDMAHPh260Eu1lG9nUlEauTsKih+IW/lFIfNT9wZLn7/rFtRVPkmVu/IzZ9riOMRppNlfk29bKUSF8/lqz/b5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZS9Ivag5; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZS9Ivag5"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488aa77a06eso129763695e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 05:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776342116; x=1776946916; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yTWGN6AOI1k/C39wxoz1HQGoi2yZHDMyrh0AH1c9Jig=;
        b=ZS9Ivag5yq3x7Q2UNpC0+1DbmIKXHSrFsqy2sPyLBMtmWw0Wj8p73f3AV+gk3ZWyc1
         Ogd2wr+7DqbkDQlyqXIKJKyTe4abo9T8nGU7oYsW9cndRemlcMAO7H2byvmDmVaNcyNV
         mYEmfQ8PEQrVNgF8HY9/cUudvmAXPgUIKkzZIZf0lbolnmsKMCiz9gGAiVsxA6+glEHj
         FnNtTOSIPHOW5jw+i0edmUswc/7K+MU0JG+42EbW1JBBC0HBTPunE6UV356TKYzYbGY+
         +PrWOR7BeQ4ep61XEJgxhUTHauM7Pop6lDLAmPde/DNsftWiOWkbKU6eAqRX0QRXRnm7
         fRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776342116; x=1776946916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yTWGN6AOI1k/C39wxoz1HQGoi2yZHDMyrh0AH1c9Jig=;
        b=DsLvhsFMaHA73BFZ5vA5otLUVkWndY+6K5d+7+Bjqq8t21oQ96hp/UfQzPBZg/MSb5
         cG8Fc1ZIfiHYQdOEgzstbXu1+BkCmUn8/w6IXGNcy9yTHRHEvceCCXd1Ts+xj3t1ZqwQ
         mWKzQ3V4hcFPkMuSIk/X3xVTUnfaE7IyQufIhob22x76bvsvYrvmLHJMj6z81xt2DHlR
         sY2c/ZbSvWYPFZQOHivBBBTLQ6J/YOMqDGyCFADTTb0pcGJWc1eGx6OTvDZ+o1esUV9K
         k+aizM7orl3jyuHrO63HTcXXdlqxd+OWnpRBXWBj4p5GJo81X5NW3yVWRMFY9WL9GB1X
         YXmg==
X-Forwarded-Encrypted: i=1; AFNElJ/dd1GjftrBoy4ZTmq1Lrn6nJNjj6pBmE1RmnVmbWvIZETwjQrtgKprEr7ML3FSVA7Lvh87iAojsLNFA8X/zjg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDiFFcg2iA/lGN8QfhKOAwwotmou/QIaD/hWlqu8xN0bAo8hZM
	ZB4ss1Jw59pFdcne+omexsJ+K0ECwaAADHSEJXg+P5ytqGltmFRx8v5hT0781ZMhWL+Rtp7QJIO
	NSUUH4+c=
X-Gm-Gg: AeBDiet7Dpm0PSbUNeCH1wAsGSH37O1wDPEaKh7YJwYr1F4gzkZz0IqlrYMPhJNBVb0
	/0KW+r1tnrcOD9ucC8i5HviA8EmxrWHWyEiErVHs7Yy7dx0V0OR1CDxwsW4kYPsc//mDI2Vzbxj
	OMsDk2SX/dQB+QB9nldKtLl6ktEbOySag9p01bIDyf7NaksASG/DMXqQNfhCgIj8lf2n77Eb2TN
	3Kh8OJW3WP7rOR2g3pTGO/FT/s+PqyJMD9B5oBSNPE+6xokIYp7VCI9tRL+fkzakeZR/zkO0wBV
	qAqmREsgatdZYNSCYZtO4zUfXfdJ9T0U20CAA1j0xDbXFDlOMoNuOvwGa6js0vqO+ej5KEn9ZfM
	BFsdTeFD+9TYL6cdS5f/zO0NuoPwKnFGUUBrrWvMJ4xshNmCw80ZCTuBING5zEmqNOqahT2yPFT
	PhLfGUjXXq4Is=
X-Received: by 2002:a05:600c:c117:b0:487:4eb:d125 with SMTP id 5b1f17b1804b1-488d67e370bmr245841095e9.9.1776342115876;
        Thu, 16 Apr 2026 05:21:55 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e41:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8c606925sm8842298eec.12.2026.04.16.05.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 05:21:54 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 16 Apr 2026 09:21:23 -0300
Subject: [PATCH bpf-next v6 06/11] selftests/bpf: Tolerate test file
 compilation failures
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-selftests-bpf_misconfig-v6-6-7efeab504af1@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1776342088; l=2121;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=DXqH+tS5C79NJ+J0fc2RdGELwdh06ZOzO/YLsYIRLlg=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKigpFwzlStOY1ycEC12VqPdpBtK91EhWN628NnwRCrzsbHJFzsb4ToJ8GTSTzn3m4fy2E8uX19
 iGwcjaAK0uA0=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Individual test files may fail to compile when headers or kernel features
required by that test are absent. Currently this aborts the entire build.

Make the per-test compilation non-fatal: remove the output object on
failure and print a SKIP-TEST marker to stderr. Guard the BTFIDS
post-processing step so it is skipped when the object file is absent. The
linker step will later ignore absent objects, allowing the remaining tests
to build and run.

Use plain printf and $(Q) instead of $(call msg,...) in the BTFIDS block:
the msg macro expands to @printf which is a make-recipe construct and is
invalid as a shell command inside an if-then-fi body; $(Q) restores echo
suppression at the recipe level where it is meaningful.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index b3eaa4a93707..5ad50d3ff2f8 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -708,11 +708,14 @@ $(TRUNNER_TEST_OBJS): $(TRUNNER_OUTPUT)/%.test.o:			\
 		      $(TRUNNER_TESTS_DIR)/%.c				\
 		      | $(TRUNNER_OUTPUT)/%.test.d
 	$$(call msg,TEST-OBJ,$(TRUNNER_BINARY),$$@)
-	$(Q)cd $$(@D) && $$(CC) -I. $$(CFLAGS) -MMD -MT $$@ -c $(CURDIR)/$$< $$(LDLIBS) -o $$(@F)
+	$(Q)cd $$(@D) && $$(CC) -I. $$(CFLAGS) -MMD -MT $$@ -c $(CURDIR)/$$< $$(LDLIBS) -o $$(@F) $(if $(PERMISSIVE),|| \
+		($(RM) $$(@F); printf '  %-12s %s\n' 'SKIP-TEST' '$$(notdir $$@)' 1>&2))
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

