Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EBA477E40
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 16:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777564976; cv=none; b=Agm4LxBQ+JrCaSUsrPw7vqnukrhLvnXavlID3N+1cSEhlntVJRGEM7NPJHQLI3QIJAIsW6JTwuv7K02WnfND2ybdTQdVS+GZ7oOhec52+/aYGEZQVghOGW/8twUyuc3MS5mmxlO7ADssI9ZFY52wmlmaNXdm2LV7bHpp7p/Zoyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777564976; c=relaxed/simple;
	bh=0g4nJPTP+SRNnJ6VP5Kw4a/d4c+9xCSL8ZRFVgYSARs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YXYOiC2xodiJeuA5Q4z/G7ChLyL9BLGixYYtZiAAU5al2G3+1TiP0HMSqpIcNT9Qo8SCkpyRacpflGEz8QpFuZ9xliZ98B61g+LISDQduj8weGLwbQAKeIN+qhnAxqEMOpSvzTvKOTxiMRb2eYXfSWoWF3I1PnhoFNrXkHYmSVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AR+CsJmj; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AR+CsJmj"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38ea6a5a0b3so10649631fa.3
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 09:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777564973; x=1778169773; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FrFlzMIY8dqFl9fL6+GZm8ewKnQP1m4Ik6n37xpccCw=;
        b=AR+CsJmjYqsNqqhjnEOBFw1ebkL99wjfEosDhiz7/9UxYaGZEo3eZGZa8yIanwOjCs
         JXRNyC9B9jvHHDexLPvReSyAhEylwLWFxy40cteroArORM4vE7N+5z597eXSThRyYApP
         xLXIaEczED/9zkHUj9O0Qh29x0dhvegP3z3RBxAj3PH/DeUh44Ff0wKbKxxDM+80hQlW
         73rbDRRh6BDFrwWGJIQTolozJbNigK3/TlOgKcMz9EfCZibfeanZQPBbK1gwEtIkTcUM
         cWuc2X1afQ8w/OkVKU7m1cK1pyU38ga9yefPQcbWDnpVEhJT9bNlqBkC1uC0580O6YNO
         cRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777564973; x=1778169773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FrFlzMIY8dqFl9fL6+GZm8ewKnQP1m4Ik6n37xpccCw=;
        b=o+kf6XIBQvtHUPwmSvUdwSe0ob+hsQ0zeFI9Rs+GSTaUs5DioWbqFCv1HfUgfBe1zX
         CxZHEQEoIRfKT1iE/kcFBYX5FxQt1Mm5DzkdTFRW72rQcpGmGoNXN8YLjP56J5lO+gyN
         YMF3e+v+O+3p/r1O6c2PoiIo0j8vbOip36QGyDPP5CIwyIAQC0k0ec2xiOcoOpGkSXxe
         AFSt4Ox9GMMuZ4QU8YoYmqRhwCrBEdwjJtqGGgCDj1fqN2s7raB6xzK4D1s0Ui+meBxG
         bYExNdTGBXkUzP0wtXbu2tdY+uniqW6iNZBBNFlvid9COdVK70xr7j0GTW/EOvj014cf
         AmhA==
X-Forwarded-Encrypted: i=1; AFNElJ9wZOprUDpK8bm1sbLOTyehU/kNKNizzavBdDF5plzFGKN+HwpdARQ5ZxG0bh4Fi2UhRP6chZgwtDMacqiHC2g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDMYYzJ8EMGAkEtrUuvYjhpwtldohdpgundoAg/pe5HIcXc5bu
	V0yUFrMoWO6rRMV3S5PzyGcPpvppvnZryRaAyXOUihC83/YVNyDzIGTdpP/iZLj/pIw=
X-Gm-Gg: AeBDiescLx24oJLBQM+G/+eWJ3l38Dt6bGErazTmFacJAC3yrQs7+cze+JqpYLUqnL5
	dH/JIhngXLcrp55dtUSMaz+QZnrjwMTEoEVmjy0drM2wav5SMIHvrq3AShigFeoTG3S3jGE8VrV
	Mu4p6GJk1DyvcKx9eXlvRnDm83bcxFUNuylWLWEkIJtmUnzWvDbjw8zc4gaq+BgkIR+YMnMT+yX
	PfXFqWoFHdWNsh2MwZYCL4IEUfPFhp3XRtkRusVNeuuVaR8qqXH42kSk18Im8WcU38R7vBsWMFm
	0QcPNAndyr0rm+36QWu3OJ4sv8F433CX6YcEbh4NnFvRJL4O2XcacROOFCyOX4qjGi/Y5Vdn4MD
	KcCgBrZRoGZZEV9yjaYFsgQ400nNw5YIf7bqVmnAe3A3FgKZtRtjYiC7Hju//mtt1oeJ1A2+yPR
	u1DYDYL8gI2aBfpvk+TgEnLuE8
X-Received: by 2002:a2e:9dcf:0:b0:391:11de:dd6c with SMTP id 38308e7fff4ca-3934e27876fmr12461231fa.16.1777564973242;
        Thu, 30 Apr 2026 09:02:53 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee38d79eb9sm610895eec.8.2026.04.30.09.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 09:02:52 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 30 Apr 2026 13:02:12 -0300
Subject: [PATCH bpf-next v11 11/11] selftests/bpf: Tolerate missing files
 during install
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260430-selftests-bpf_misconfig-v11-11-e11f7a8c4fdc@suse.com>
References: <20260430-selftests-bpf_misconfig-v11-0-e11f7a8c4fdc@suse.com>
In-Reply-To: <20260430-selftests-bpf_misconfig-v11-0-e11f7a8c4fdc@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777564926; l=2156;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=0g4nJPTP+SRNnJ6VP5Kw4a/d4c+9xCSL8ZRFVgYSARs=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QBSctWHKemMRwsrUhGlHgWOBzzJbhHVoeimaKLPlrUVLkf+65H78hcts5/x+c9oZ8Ecuvc8yUz6
 YyMVNTWCMBgU=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

With partial builds, some TEST_GEN_FILES entries can be absent at install
time. rsync treats missing source arguments as fatal and aborts kselftest
installation.

Override INSTALL_SINGLE_RULE in selftests/bpf to use --ignore-missing-args,
while keeping the existing bpf-specific INSTALL_RULE extension logic. Also
add --ignore-missing-args to the TEST_INST_SUBDIRS rsync loop so that
subdirectories with no .bpf.o files (e.g. when a test runner flavor was
skipped) do not abort installation.

Note that the INSTALL_SINGLE_RULE override applies globally to all file
categories including static source files (TEST_PROGS, TEST_FILES). These
are version-controlled and should always be present, so the practical risk
is negligible.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index a460f2ad3cff..9948a0a02bb9 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -1023,12 +1023,23 @@ EXTRA_CLEAN := $(SCRATCH_DIR) $(HOST_SCRATCH_DIR)			\
 # Delete partially updated (corrupted) files on error
 .DELETE_ON_ERROR:
 
+# When permissive, tell rsync to ignore missing source arguments so that
+# partial builds do not abort installation.
+ifneq ($(PERMISSIVE),)
+override define INSTALL_SINGLE_RULE
+	$(if $(INSTALL_LIST),@mkdir -p $(INSTALL_PATH))
+	$(if $(INSTALL_LIST),rsync -a --copy-unsafe-links --ignore-missing-args $(INSTALL_LIST) $(INSTALL_PATH)/)
+endef
+endif
+
 DEFAULT_INSTALL_RULE := $(INSTALL_RULE)
 override define INSTALL_RULE
 	$(DEFAULT_INSTALL_RULE)
-	@for DIR in $(TEST_INST_SUBDIRS); do		  \
-		mkdir -p $(INSTALL_PATH)/$$DIR;   \
-		rsync -a $(OUTPUT)/$$DIR/*.bpf.o $(INSTALL_PATH)/$$DIR;\
+	@for DIR in $(TEST_INST_SUBDIRS); do				  \
+		mkdir -p $(INSTALL_PATH)/$$DIR;				  \
+		rsync -a $(if $(PERMISSIVE),--ignore-missing-args)	  \
+			$(OUTPUT)/$$DIR/*.bpf.o				  \
+			$(INSTALL_PATH)/$$DIR;				  \
 	done
 endef
 

-- 
2.54.0

