Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4123F8894
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 11:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784546001; cv=none; b=tVBRMxXNZaT5mjgzUNfAXaf54a1GtR37d42vg4g9Z/PMz+6sH1czOZ65FvlhilNY7TwmIsR0nWPSJ4dobYr+dD4eG4UHO+Qt+qPtw2k7up6+L+PhYG6xMdCE4ntyKGQUpzumk6oo2gA1x2K90A65DxQe6CdZqx1wmH/em8msRFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784546001; c=relaxed/simple;
	bh=vYmmEJdAFCMl4uFdGoDC7UpVngdWPs05SlrMvDkcKoE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RS/mPIW22G6T/OWix9bz4jwFACrrr2ckn66IP/t8iizI2qHA5DwQ4rFYVVGTDXfHewbpXZxCZ0C2VGtcBmR1S6TjwuhaSeuUWIAn4rZQSu/AU5U1r4h30ZE4Xjed743iKkqum49vG0lNxS3ZAPloYQvJ9izceKoIgdVjAVTZLHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZxFw8gfu; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZxFw8gfu"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4955484387cso9025665e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 04:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784545995; x=1785150795; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7uQXAJRjVDCtTQypbHSGkyeg+ewr6QOBdRjNsYUu+5U=;
        b=ZxFw8gfukgCnTGc8TxzeaFi/urviz5iceOXA+xEHNZSK2J7eo09BU32Yc5Sc9MboBg
         ThgcDXL9qdZi37yzBMOU0X5I85CQPwt/6t8CopOfeIdPzhYVLEyR08q1UQb9KJe+7zPk
         DNGZD7PuEvRLpizWXubrxJps76JzvNMdbEzwMIyhLfoO6Jkacw5Sr9euY6JTrH/hgZiR
         dT/LkJzTSYsHptn63qM1teiRkkJ0a4gD5c+xno2Z1xCVpF46LhbvKy1mVptxYs/Nbuvs
         I/phkYTgIuH7WSr9VRpDMKp7bhnGDcb4dg3u0QjAGcYS2ifiFR4Wa8Ewy34gf2Tj3E8q
         yo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784545995; x=1785150795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7uQXAJRjVDCtTQypbHSGkyeg+ewr6QOBdRjNsYUu+5U=;
        b=Z82FlVlVrEUHACCSHw0meCpPoUyTExZMFkhpNbVaaDB6uoKFqav3AnY9OAJu6bEx6Y
         rs4JHjWuVdWknVAg8c4kYe0PqUbOmjijRgOhu1Q4KJckXOWw9e2qs1rG4NQscEDhh+xB
         Pro9mwNKSQrEcArzJLX5A5GFgV+KQ0sWx2Sb7r30kRpT7B0FbwHbRBHhqswRgdRMAys/
         kzMm5xBCV3EAe4PyFKi/6HisDS1y/s2ThhNYcbkQpMGIJ3pm7Pr5xifP83zW+5kQ0XP+
         9TcGZv9qABzLWacoF0nme2JIBFBZGlj5jwfiDRbl0nNqn0CxX0bBsovlkoXN29t3j+VE
         Iw2A==
X-Forwarded-Encrypted: i=1; AHgh+Rpo9Si7GFfvNjRGIJz927tKbrOqXemnjPhFP4nrzBK8D/3y6w1/4PxY8qzDDw2lnvnDhlunMs5Df1+fNWre3nM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4XOAUw4G8MQJiXlPTp5XCmaj0aw8HPucsCy4m4Us4x5bWXkPt
	Yc04+Ej3Meq6VfSPdI2NdHmiprQhEm08eV2OiiKwmVP/Yx2V5cEVVrMAxL/3ipK8UOo=
X-Gm-Gg: AfdE7ckHqfzZfgFGwfkUs0dgh5av+yyTxxDeeCv3MA+zXj4SRFR8g0Os63vAWaTQhKg
	7I64wYTZtZ4AxjFBPhsjx7YMvnS2ee0/+LYSh3FVlZri4oMjoiPVtWAtuBTJysFK9rIh3sok2wY
	72k6JQmeC/DMpTT4+jKOfOpYZw/jckp+z0tQBM56RgurvfJMPACOLGyDpKVfalStYa+lfPb6KPI
	hH6FlUM54dgsRp4NgbX27xsjdN1WPXyv3TizdS2K/TswlsTDJxreL1MQBk0ASIKC8hzbb8jRiWA
	9GFabVc+4krbnG3sxsREbMluV4hjF4nTQ/xRTFGTthQ//rVRy5Vn2LgFpqRQENvxvu3mj4+BrBa
	z+TzRKMfvDqDANivOEHwrqk6c7zzC/2PAySmdC5FyXAYMqZca8zEvKOhlEEa0suBbgg==
X-Received: by 2002:a05:600c:1c28:b0:493:bd2a:93bb with SMTP id 5b1f17b1804b1-4954a3d0be6mr156951935e9.3.1784545995348;
        Mon, 20 Jul 2026 04:13:15 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:c3e:cc5f:6c4b:db0a:5d2a])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-976fc3f3d1csm7075640241.6.2026.07.20.04.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 04:13:14 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Mon, 20 Jul 2026 08:13:07 -0300
Subject: [PATCH v2 1/3] selftests/bpf: Fix make install target
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260720-selftests-bpf_fixes-v2-1-b450eda93dfe@suse.com>
References: <20260720-selftests-bpf_fixes-v2-0-b450eda93dfe@suse.com>
In-Reply-To: <20260720-selftests-bpf_fixes-v2-0-b450eda93dfe@suse.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Christian Brauner <brauner@kernel.org>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1784545988; l=2003;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=vYmmEJdAFCMl4uFdGoDC7UpVngdWPs05SlrMvDkcKoE=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QOBdurL64DfSVQ3AWQ8Avf1JZq2ngBA6dIuruKmkdnqiFfvE91QiKd05rfeRY6Eu1JA2W3LirdC
 Se9UvaWH6zg4=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

After "make install", test_progs fails because two files end up in the
wrong place:

- bpftool: TEST_GEN_PROGS_EXTENDED flattens it into $(INSTALL_PATH), losing
  the tools/sbin/ prefix that detect_bpftool_path() expects. Remove it from
  TEST_GEN_PROGS_EXTENDED and install it explicitly under tools/sbin/
  instead.

- *.BTF: resolve_btfids writes resolve_btfids.test.o.BTF as a side-effect
  of the build but INSTALL_RULE never copies it over. Install all *.BTF
  files alongside the rest of the per-flavor output.

Fixes: f21fae577446 ("selftests/bpf: Add a few helpers for bpftool testing")
Fixes: 522397d05e7d ("resolve_btfids: Change in-place update with raw binary output")
Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index b642ee489ea6..55d394438705 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -324,8 +324,6 @@ TRUNNER_BPFTOOL := $(DEFAULT_BPFTOOL)
 USE_BOOTSTRAP := "bootstrap/"
 endif
 
-TEST_GEN_PROGS_EXTENDED += $(TRUNNER_BPFTOOL)
-
 $(TEST_GEN_PROGS) $(TEST_GEN_PROGS_EXTENDED): $(BPFOBJ)
 
 TESTING_HELPERS	:= $(OUTPUT)/testing_helpers.o
@@ -1055,10 +1053,13 @@ endif
 DEFAULT_INSTALL_RULE := $(INSTALL_RULE)
 override define INSTALL_RULE
 	$(DEFAULT_INSTALL_RULE)
+	@mkdir -p $(INSTALL_PATH)/tools/sbin
+	@rsync -a $(if $(PERMISSIVE),--ignore-missing-args) $(TRUNNER_BPFTOOL) $(INSTALL_PATH)/tools/sbin/
+	@rsync -a $(if $(PERMISSIVE),--ignore-missing-args) $(OUTPUT)/*.BTF $(INSTALL_PATH)/
 	@for DIR in $(TEST_INST_SUBDIRS); do				  \
 		mkdir -p $(INSTALL_PATH)/$$DIR;				  \
 		rsync -a $(if $(PERMISSIVE),--ignore-missing-args)	  \
-			$(OUTPUT)/$$DIR/*.bpf.o				  \
+			$(OUTPUT)/$$DIR/*.bpf.o $(OUTPUT)/$$DIR/*.BTF \
 			$(INSTALL_PATH)/$$DIR;				  \
 	done
 endef

-- 
2.55.0

