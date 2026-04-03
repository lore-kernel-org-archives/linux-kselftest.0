Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DF43C8730
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Apr 2026 14:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228369; cv=none; b=HBA/E+off8DcqcZlrpfv1P3B9OZHrQAR4BqDFmgCnmnH6ts7yFRsFzLtWv7zwDlBz402fmGQQQKU3F2nJ1KOWt7+BZXPXJRsn9hpsBrSZcHS89hrMnG61g65BsrFi6QeKklC2gTcpLe58fP214t8SdGubsWyU3Ma4Y4Vnvca5Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228369; c=relaxed/simple;
	bh=r0hAi+8/1aDh2iFsHnAbZTWuQDE4t7kIxRdOWHyRr+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FBHBoaQ2/0OSW2v0Xhd23u5sP1s1KCppZA52FOjTKhWgyp/BpW63i/1d7rt2xTUqYV24hpNawHgSZRiDKATAVU34H2BJOeA3ml+Q6a2XLyimaInztLaiWzswXQ1vbBLJUmIBU+wKImUH4VMSQ9nc7NL4yazlwNkArJRuhfvBPYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dZ6sHxUx; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dZ6sHxUx"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-482f454be5bso33160565e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 03 Apr 2026 07:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775228366; x=1775833166; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OYgqj1zgQSxXbMWVjaEA9XAG2XEf6AIEbv/nbSFPah4=;
        b=dZ6sHxUxwXrbQYXHbCPJoG7Uei640udMjSCid5tmn82H857CKaARz/ipL/+iQ/vcYf
         0SmioO8fGc5T+ewRnprsjVSwpyPwvBFfmK0gQ7YO8yFHoxiA2AQrtCmfWSrV/DsZuCei
         DKDxWOXj2wvwgEkyEZmrprEQbOwKydCpP3Z42iLQw2T+DJd2G+saR0lhU6xBb3+2Ih6l
         VeBGffmxWdtJpUMB7sx6u+cg7JcFKEucd69EpyCJ5VZiImj+VRqouEfIDdqa1ZsRO8xH
         Ve/qD+3aigIghJIak5EFLihrXhvWiIhahDg3uyDxBw0PNwoZeEj5T/j/86P0jJvjwfjE
         NWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228366; x=1775833166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OYgqj1zgQSxXbMWVjaEA9XAG2XEf6AIEbv/nbSFPah4=;
        b=n9vWZQ3FH6SDGOQ6eHLXd7kZe75zoL5RptW6X1hS5pwzzhiyb2/nFBtZO2xg4yUye4
         0C8E0/8nYX91ePtDrxVuljzvDNB4hAFyrJN37UQ3by4qj3j5Jr7SdQ+192c+XHTHtkdk
         cjuyr014xyrWQBKPxjD8G0Due17Rs+PeUqMfD0WG8UykEbxQ0fzeKnKs9XCIpjAdoYFe
         loJYHyYeSVZ5lSkS/iTWlF/aix58R6GGwSYDJTIafDpi3SOQsNd04WGpaqmFpc6EHplS
         3ma+6NOKm7fFcLauD7J3IoOy6nAAprLm0gXVYaqpXby3A4AoE/SGzKl5/hpAWVoyPVOm
         WRGg==
X-Forwarded-Encrypted: i=1; AJvYcCW2b2X69nAhRTVwScXRloPW+usnbJ+Ccr9JQNrBX6v4EM3omj/3+Lm9ZIv0o6M/z4FAZ3zeR8Na1pH9XT7GSXk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwypZ58czQ+mswvtDD3pzy83nfA++dXgXYJr7mduOyWvHyDjiC9
	q4sAeyLNX29sS+90vPFZELLaQhz8Vc6uVrfZKHBfAypDAj/Zxm9z6XA8SYeg6QlDj4c=
X-Gm-Gg: ATEYQzwmUGMwA9E2OHKyH3uIaKIzO/LPKb2+Iy6P4lVQWa+5X4L9fP6iZQ1oC9T60UW
	7qydYoK+/KgMuvmENUb6Pl4/4NHDIgYD8iGl7ATnWXVXeaMXN8SKlpe+S7luOzH0Sa1phKTYxUu
	BneYMTnV/y066vF18TXW26AxG2zOu1IlFJHyXxCgbC8AWRIL94K21i98s0LbiBbSkucHYaRg1ag
	bewaspwVgqkyKF+WmMh7/8vUrXJOqUxANQNeu+Ci24QxjwVf8JyQeAiH6ZHkERcu5OFg8puo5LW
	9Z9OXrCeXshPx0wWD9KB+zjR4zvoLpCTBOcxPwc9lwFOWkBYia1dFJ5f3mnv3uV1PStuiiwb9Zc
	7G2GXRLYDDHblWphxc8Y8mctgMq+wu3QwXxZuOfN8hxJ2m45eout69DofIvkWoX3qPhh+L0MY8M
	9k7cf6Vu+/
X-Received: by 2002:a05:600c:63d7:b0:483:6fe3:bb49 with SMTP id 5b1f17b1804b1-4888df61f12mr83736555e9.0.1775228366187;
        Fri, 03 Apr 2026 07:59:26 -0700 (PDT)
Received: from localhost ([189.99.238.3])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60582e1cc7dsm7452360137.2.2026.04.03.07.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:59:25 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Fri, 03 Apr 2026 11:58:58 -0300
Subject: [PATCH v2 05/10] selftests/bpf: Tolerate test file compilation
 failures
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-selftests-bpf_misconfig-v2-5-f06700380a9d@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775228344; l=1733;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=r0hAi+8/1aDh2iFsHnAbZTWuQDE4t7kIxRdOWHyRr+Y=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHSmdYX2XXWlMXfc0aJJn6g9w1iqwLslrc2d73uxWf06LSA98AtmDYLZCdLQf748TjJDLfJfvWk
 GRJtZN4CeawI=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Individual test files may fail to compile when headers or kernel features
required by that test are absent. Currently this aborts the entire build.

Make the per-test compilation non-fatal: remove the output object on
failure and print a SKIP-TEST marker to stderr. Guard the BTFIDS
post-processing step so it is skipped when the object file is absent.
The linker step will later ignore absent objects, allowing the remaining
tests to build and run.

Signed-off-by: Ricardo B. Marliere <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 72f576a8236a..6a3835a58f87 100644
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
+		if [ -f $$@ ]; then						\
 		$$(call msg,BTFIDS,$(TRUNNER_BINARY),$$@)			\
 		$(RESOLVE_BTFIDS) --btf $(TRUNNER_OUTPUT)/btf_data.bpf.o $$@;	\
-		$(RESOLVE_BTFIDS) --patch_btfids $$@.BTF_ids $$@)
+		$(RESOLVE_BTFIDS) --patch_btfids $$@.BTF_ids $$@;		\
+		fi)
 
 $(TRUNNER_TEST_OBJS:.o=.d): $(TRUNNER_OUTPUT)/%.test.d:			\
 			    $(TRUNNER_TESTS_DIR)/%.c			\

-- 
2.53.0

