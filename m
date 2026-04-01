Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F480477984
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 16:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775060165; cv=none; b=mydQsHZR26Q8IRVvAY9lnQ9FtMLhif4qq0+cSv5JaDNy8oaNnx41FZwTjjxRCRBSjzo6nwjbuScC+5QCKdgUy4CeN/s0MRwYnOGjBZMr/56pmRIlEric4u2subvLaV2lwcZm1qXbNSqSKWoLanQycg8nn5198TLp4mTiSlj5FGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775060165; c=relaxed/simple;
	bh=ZDpDhrb8K3x+nKVfSMVripp7Ba903b7FbJshmKVp4e0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Py6M8rm9eq4gyFCmqj9bqBk9DUMsMco+z/fkw6akwPcpD562lMCBmKRzGykZyiNNlPVl/r/VYFWG4kAjuvMUfcTnWRAV4pva/8azP5c2SkV6R1PMRS6Hw+gHFIrhGtP8fRTQaxQHPYqlmlJwT6LC5PMwgb3RcDFNPWq0N+RxD94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Vy3xFPXx; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Vy3xFPXx"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-482f454be5bso12018595e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 09:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775060160; x=1775664960; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sb7iiZJr4C2OmhtNVcbDjj63mOfHgV/qxPdBAzHlw9E=;
        b=Vy3xFPXxkr5pGdwzzkRuDDuMpGah6rwzpH5TZY974lBJYaDPSt4TQH/OTowPz7UHjm
         MchO00bvZAd0dkALduwZjOKivOllT8DvjzalZ43pFzMGBE+Ww7ebRWqvNHQjChXMWXJJ
         WuLMxu2tnadTMQ0UnxeorjUcXoVOHv/o5N3v7mqHRe7Y3yKGTP1vuDuHdmmlx8RBzV2u
         kmQzI/BXmPnTdlCldEQdGVFhiM28Rxf3iFpKhFyop/BEKnRbEDdbLkSMyxyU0tM3JX8v
         YI3p+DlDOBlSFS9qiWqc8spIQ3A6kS9vMvOX+qafyCrGl/4qTR9Z+4f+59ccGbWKc3ic
         btdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775060160; x=1775664960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sb7iiZJr4C2OmhtNVcbDjj63mOfHgV/qxPdBAzHlw9E=;
        b=JAxGYyNeKKRaHGdIlh9lxo54BmZsbdwkSPIJdbbdwilfF/oktL7ps3SlIebB9/FLRh
         KMstH2IeaI8oFlLYiu/fv8RCIVL8tGPh2ZJu/9LKyWy/y8cwvopjp/YmRzY7cQLCmxhk
         rurpunOXM1Nvu1wCWMsxGUO7hYlVC4s/EvMkAiT2Obwhrz3qpQRtqHJDNgNi/PVqjZaA
         zfRvjc78tqJn/idOSaBCaW8kF3SBwPtErwoZec+4Q7J/iZ7MLuvvExF5MTDWNi9ebo95
         1EgqHJ726v4PBO8EkBU2nGQlfPtx7P2Idm4bDAKbfxubqrEx2zyZ/0RDyYQM8lqWEYN1
         NPUA==
X-Forwarded-Encrypted: i=1; AJvYcCUrh217k+VGUsH+NGsgS8faXAsY15lh9Tu4sNFQrDwrIzqY80Zvsqco/kz/4jgMMIOEg72ESNDIg7Gy84uEOXY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4ce9qwWQ4+XXVSni6OHaR5AWPdx/al1U0RJ5VAvhfEbZXGxHP
	SA3KGDoEvTVDewuTdNT9m7qjal8xJE/Fr9UE1mZ0o/XSSlT701NHdDOZXSC1TBujcUg=
X-Gm-Gg: ATEYQzxukJiP24nCqaKi+Wm/aPflOkmZ3unRC1CYfCAiBghctBB4xfAPd3+0vToKMi0
	HI0G7t7PWVSRtIzS6TPwKPb2g+BDG8eLIOgPbNZOPZDzlWzd29XR10vFCOU0xd4khibjBrKdqoG
	QLgpcLXRDWtHJAAAfhCILhPVU3AzgQGhfkoPWGDGN6b4XFxZyhqwn9PYrFMEaLKsFNQN8I+zTOZ
	jBzz5hZPOBXBSW+A5UxvgdFV5v4Zh1LVSLAmmZ7CeyH1hAH1qrdhoDat+6cL6/R7QUpCpuX9r5x
	uMvmJuK8okhjAh6aFQYC81WfMkPSIUlh2cbJTrR4/yEVeiZJq7XPmgfX6JXyzAHLipA4jr7i+Al
	ipafcBexGmRbA2C/8cQf/ZTX5/rKhk+vdbvw8KOPclV88Cz+vENJiD9pnRY6OqvZIQhSvWDynlO
	EN8+8QTFC2
X-Received: by 2002:a05:600c:8509:b0:483:6fe3:bb49 with SMTP id 5b1f17b1804b1-4887810ff5dmr180318755e9.0.1775060159808;
        Wed, 01 Apr 2026 09:15:59 -0700 (PDT)
Received: from localhost ([189.99.238.3])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9b8d22b4sm68767e0c.0.2026.04.01.09.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 09:15:58 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 01 Apr 2026 13:15:14 -0300
Subject: [PATCH 07/10] selftests/bpf: Tolerate benchmark build failures
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260401-selftests-bpf_misconfig-v1-7-3ae42c0af76f@suse.com>
References: <20260401-selftests-bpf_misconfig-v1-0-3ae42c0af76f@suse.com>
In-Reply-To: <20260401-selftests-bpf_misconfig-v1-0-3ae42c0af76f@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775060128; l=1818;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=ZDpDhrb8K3x+nKVfSMVripp7Ba903b7FbJshmKVp4e0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCk0g95hLxMgDX1/3jTgSqsYvNrwe673JDbDzKeVbl4dGxCLuUY1QTt62Siq6f/tZmrRb9DqVZp
 ZpVL2gveRFgU=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Benchmark objects depend on skeletons that may be missing when some BPF
programs fail to build. In that case, benchmark object compilation or final
bench linking should not abort the full selftests/bpf build.

Keep both steps non-fatal, emit SKIP-BENCH or SKIP-LINK, and remove failed
outputs so stale objects or binaries are not reused by later incremental
builds.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 7f4825dfa5ce..3d5b88435446 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -873,7 +873,8 @@ $(OUTPUT)/test_cpp: test_cpp.cpp $(OUTPUT)/test_core_extern.skel.h $(BPFOBJ)
 # Benchmark runner
 $(OUTPUT)/bench_%.o: benchs/bench_%.c bench.h $(BPFOBJ)
 	$(call msg,CC,,$@)
-	$(Q)$(CC) $(CFLAGS) -O2 -c $(filter %.c,$^) $(LDLIBS) -o $@
+	$(Q)$(CC) $(CFLAGS) -O2 -c $(filter %.c,$^) $(LDLIBS) -o $@ || \
+		($(RM) $@; printf '  %-12s %s\n' 'SKIP-BENCH' '$(notdir $@)' 1>&2)
 $(OUTPUT)/bench_rename.o: $(OUTPUT)/test_overhead.skel.h
 $(OUTPUT)/bench_trigger.o: $(OUTPUT)/trigger_bench.skel.h
 $(OUTPUT)/bench_ringbufs.o: $(OUTPUT)/ringbuf_bench.skel.h \
@@ -916,7 +917,8 @@ $(OUTPUT)/bench: $(OUTPUT)/bench.o \
 		 $(OUTPUT)/usdt_2.o \
 		 #
 	$(call msg,BINARY,,$@)
-	$(Q)$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.a %.o,$^) $(LDLIBS) -o $@
+	$(Q)$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.a %.o,$(wildcard $^)) $(LDLIBS) -o $@ || \
+		($(RM) $@; printf '  %-12s %s\n' 'SKIP-LINK' '$(notdir $@) (some benchmarks may have been skipped)' 1>&2)
 
 # This works around GCC warning about snprintf truncating strings like:
 #

-- 
2.53.0

