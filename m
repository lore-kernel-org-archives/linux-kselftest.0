Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCC139BFEE
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 23:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777419958; cv=none; b=bYMdzYbmK3plkbSbfwrvOuBMYQdWPuFYjgF5n8VxsA89wm5Lsmuaq3zPho/ffZ2F8Pxc+7HVVTWDhdNIRhwNL3guVvJ7L5iIXAC/rbTQ0oF37xcrZ+KTczYRMWhtrcOiOeywquaaC+IYwaI0FWeqLopXM1ylWLIpvg/sVQR2HW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777419958; c=relaxed/simple;
	bh=K+vaP2nMwIyYoWLRAJ8KOc+0zXq9dzqeDfUA1fjaXMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RfAD89pj/MdrqyYDYmkZBjSOgRMk1mBjw9SStKDGrV6H290GZBPLV8JNgI2BCGiVqcWgy2gMrMyO//mh/k/ikyvXsGMWZBV6SXFauGFRhaxgKNJC2i+mkhza8wq/Qn1OiZ7o00f7nQrn/m6Qjb1GNCaOvyt8O/4iwMjvS/1sMK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=e8Iu+QOD; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="e8Iu+QOD"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso168558005e9.3
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 16:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777419955; x=1778024755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9hjnI5sv67kd9Z2OrkU0HujdVy68CkTBm54JLMxtNMI=;
        b=e8Iu+QODV8uRdOwMSmRvfGkMPO+3CLU0MsuceJg5CkPdvfWZ57udb6rBfmhS/wfvPZ
         +KAM2XGLc93nDyU5lTh+0icfnITXy5TqICom7agUl5wc77bPXzJbiCfzeWSP/0Za2IgE
         ucrEKYqx5niEaz6auGDFIKgzFAaqIjS+Eb4a7lfzua++S6BrlGuAdSHomhwIFFgRtAl8
         aBdTIneRvTV/utVZ9+gckC1gFx+Ig6YzXKBxlUTMIxwvEvIGtSKnI8m8BaDO1L00WtQ1
         SJtnYTW5pTo9ppX0QogskBGpDw9HApyIdARss/b1LLJBuiOz2UQcgZG23STBMoNPo7v5
         bgjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777419955; x=1778024755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9hjnI5sv67kd9Z2OrkU0HujdVy68CkTBm54JLMxtNMI=;
        b=eYMG5fWWXYm4KW5WyvJdQDDQSfMGLefeMgAXRTzcpEt0VP3SQcUN40MKw4p7O/H1un
         q1fqR5+lIpSAG1cbyys3rcq663z1XpWKxcaDJK/ziwlqsPSwJHDe+XlfBWOeW/0EhwL8
         VkjKQXJM7IX6v4CFqOhoTdN7gPEczqQLm1CmSpun7TCFMqXj8zde++G5fefvdDvGday0
         IscmcJpot1RNcdmsFIihXiBOjYoECm/zXp5w84g78qV0TUBsh/d+As+K9nklhOxW49dn
         j0nIOjpf8tPoCjlkOQwQnIUCeuj3ir2rwvsDgbx5Dy14d9fXbYUl4+iysL4bBGoPIrPF
         oRbw==
X-Forwarded-Encrypted: i=1; AFNElJ9hlD/o+csTuLUAxwmnV2ZossMxjr4UFm+Sx0xitiozeU1joLOeOhyqtjFbCy478HmCcza1r425G0XzpRwNnxg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfwczl6gTKqq85D2bOLTWulqzaRQvlYCCAxmaqdu1ItAZ0jV5G
	IlLCkNwbPBFl03xh7pTtNCnI/rYq3PTZkWv4vR18GPXrMhsLUZRl/0ffdJTtXWgDfzM=
X-Gm-Gg: AeBDietyNJjyTeiTnahU0GlViUvEgKBUXczMPLKV6AkPseJw2KQQvJYkyfAIYC77EWJ
	ifJ6TQeROg8x0yD3+ku6Gf+CakwZuiaBlql0YOcalTUju190jorAD1kY4VrAIf5Caoz/r/BS63Z
	3U1PEoplfyTD/gGkyRWpMYw6bBTQSodmKE32fSdtbCNvuxbk+BNzIMdiKnDSKhH3JS+R71ri5mw
	GY3FzlD8OP5rMqTGjZ+mNcwrqP26giChDbh8wT32aS1N1+fHDae4tGcOQFXkuc4PK5zsUopR7oG
	hfA6l/aXo0xgu4M1fxwIcLYUSf4DbPJH9F83s+UyJNYfAmvUcUks08sjrBRx0jAkjDT9Nf3fGtS
	hlDSHJOUEb3SRq0jeULY62Sn/gkxrFKJXgDvwRqTamEy/SwsbkQPEViVeL2NC5aVZstpl4f4xuv
	SuKOVFt8qMTzriYQIJqVFBSdSm
X-Received: by 2002:a05:600c:8595:b0:489:6c22:e081 with SMTP id 5b1f17b1804b1-48a7b4d5292mr19685905e9.0.1777419955103;
        Tue, 28 Apr 2026 16:45:55 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-573b6d87e40sm207420e0c.12.2026.04.28.16.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 16:45:53 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Tue, 28 Apr 2026 20:45:10 -0300
Subject: [PATCH bpf-next v8 09/11] selftests/bpf: Tolerate benchmark build
 failures
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260428-selftests-bpf_misconfig-v8-9-bf02cf97dbcb@suse.com>
References: <20260428-selftests-bpf_misconfig-v8-0-bf02cf97dbcb@suse.com>
In-Reply-To: <20260428-selftests-bpf_misconfig-v8-0-bf02cf97dbcb@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777419912; l=2217;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=K+vaP2nMwIyYoWLRAJ8KOc+0zXq9dzqeDfUA1fjaXMI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCLRSJzLFmbxcd8Oti89XkYLPxUKPMs9XiDZ2GentAu+0JH4vQWhDEuNUNurJmaqlvTu7XnhPDs
 iNsBf19PdGQ4=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Benchmark objects depend on skeletons that may be missing when some BPF
programs fail to build. In that case, benchmark object compilation or final
bench linking should not abort the full selftests/bpf build.

Keep both steps non-fatal, emit SKIP-BENCH or SKIP-LINK, and remove failed
outputs so stale objects or binaries are not reused by later incremental
builds. Note that because bench.c statically references every benchmark via
extern symbols, partial linking is not possible: if any single benchmark
object fails, the entire bench binary is skipped. This is by design -- the
error handler catches all compilation failures including genuine ones, but
those are caught by full-config CI runs.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 9a5177455f0a..461e2d9416fc 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -939,7 +939,8 @@ $(OUTPUT)/test_cpp: test_cpp.cpp $(OUTPUT)/test_core_extern.skel.h $(BPFOBJ)
 # Benchmark runner
 $(OUTPUT)/bench_%.o: benchs/bench_%.c bench.h $(BPFOBJ)
 	$(call msg,CC,,$@)
-	$(Q)$(CC) $(CFLAGS) -O2 -c $(filter %.c,$^) $(LDLIBS) -o $@
+	$(Q)$(CC) $(CFLAGS) -O2 -c $(filter %.c,$^) $(LDLIBS) -o $@ $(if $(PERMISSIVE),|| \
+		($(RM) $@; printf '  %-12s %s\n' 'SKIP-BENCH' '$(notdir $@)' 1>&2))
 $(OUTPUT)/bench_rename.o: $(OUTPUT)/test_overhead.skel.h
 $(OUTPUT)/bench_trigger.o: $(OUTPUT)/trigger_bench.skel.h
 $(OUTPUT)/bench_ringbufs.o: $(OUTPUT)/ringbuf_bench.skel.h \
@@ -982,7 +983,8 @@ $(OUTPUT)/bench: $(OUTPUT)/bench.o \
 		 $(OUTPUT)/usdt_2.o \
 		 #
 	$(call msg,BINARY,,$@)
-	$(Q)$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.a %.o,$^) $(LDLIBS) -o $@
+	$(Q)$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.a %.o,$(if $(PERMISSIVE),$(wildcard $^),$^)) $(LDLIBS) -o $@ $(if $(PERMISSIVE),|| \
+		($(RM) $@; printf '  %-12s %s\n' 'SKIP-LINK' '$(notdir $@) (some benchmarks may have been skipped)' 1>&2))
 
 # This works around GCC warning about snprintf truncating strings like:
 #

-- 
2.54.0

