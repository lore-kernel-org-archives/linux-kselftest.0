Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071C838CFEE
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 20:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776286795; cv=none; b=eEoCMNVnfYxRW4fua02/Zv42w4K5dPGzCV/EZDl79gr5vBYheTfd6vz9Q0/MbOKaP+BVUVGzRliNoCbHc0Z7TZQR0jv4Uwch+WLpX7pch4MViQFnev9Ltvr52+rlw9KdR9tn9Fnd4xCkuDJ36aYW6GAz1bhD8YvxYI6kZhuK2Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776286795; c=relaxed/simple;
	bh=GbttUT6vyhtCn2eIxN8DR5H29xyp1zOxmftUR/Likoo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ix5u9PLNHli1ye0pPIWjwXYR6UxTdZuJVGYTh7saIopKVmVk9QVRQRDjWVkrja4y0nsxSjouchP+fYWHrqPOJqeCL1EM76+IEhwBO/rdBsaTpJGJtn5fS5ooz3uSah7H5wroPPTibrTwmp+wGc0NtqUsC8JsgPNXODZDeWGA9SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Rnh1Dybd; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Rnh1Dybd"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4887fd35e60so50655595e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 13:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776286792; x=1776891592; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Mfo/BD19IRGxdfb+sFo/dHsayqzRb0xyff0MVjqgFk=;
        b=Rnh1Dybd9hOAXM49NhyY7YtyfDn254B5cWHqYUheuD2MaAxIIljgCymv8CnljZ6XRP
         PA9CbZIkuPUleaZl6nvQkKghmZfw81/ooQ2iJyMiiCvlUIQ3Fq+pEq5EOIBMJz430Kxf
         pTZ1q9a/6YnkWO4sRq9BX+iez4wGLzh6mf27NhqKpnj3Gl/6VU4IRKj2fyVQMVId8Sjg
         oJXZ2Bv61CZkPpfOrV8KOJcXiJT6FxA7GFyq3YtuxoaMz5b7YF81i5fEfgnsxtE52AHp
         zziX7d6EUaJg3ZUqKtcZQ5UDZu74wPk1kNQ8deu3c0galDoQtH81wjVslEGSQJDoYcOl
         2SNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776286792; x=1776891592;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/Mfo/BD19IRGxdfb+sFo/dHsayqzRb0xyff0MVjqgFk=;
        b=dRgeQjr29WDFrDY9ecxZxeXxBZjERwQx0ktaZlwX9IaOl3NANRVJSPjeGfs44EnxaX
         jBE2RupVt9Se5gx+hv/Im9OS3lB0VlDaCLR12TiCagImepxZKd6Uv2Yfc+BJwYAcLsBz
         d/xi0Byn80CUBA4tN3/zb1xEj7fkPpgbGNeBpJtlTyPhiNfyggCX/n0PkaZSrH3ylFwU
         Cu0+Y+c2/wQ4tbCKCEVjRB9pSHyJMJVA3pjio5BuQGohkO4LBT2AU4ZLHO9ZEyXC71zc
         HD48tEUqlSkB0gPd5dB0lBaHHpDnGibvfCG6CfWccR1yhKe21BIJb9BdZ1EmqO6BAJzJ
         77Dg==
X-Forwarded-Encrypted: i=1; AFNElJ+lF4sOSd0jUoSTBOleK8/N66ytJ/Hegdu+hRrG8x8qx5Fr/cQvq1YmV2+q5h+QpOsvexnMXe8JxJuFF710QK8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5IvCeLQkk2TvNGhV4dzeC0ltOHuitrdjla7FAtE36fl8rCqnA
	cHX/mJJ/jwqRWy3uxuel4S9SPTHWEYqNhHSSYc3HwliImugoeo23BF7viVqzKhIv854=
X-Gm-Gg: AeBDiet8mDTYzApjdW0mEwxtZjDK0PIKYguj6nNeDAC8BhLA5iutP91AFWsrBilHBN6
	HKjNnpROyIO0FKjrv6kFS+d996RXBW4017sLhZJT97dfm67C5v0mpRdYV8pMOzEUo5Rc4E9xKpT
	icYJ+zHPc1qRAom0iON56CDNs09R8uHNsTDq46HeTqKpRK+rdXEBOVExhU2DxxUIcHSR3CwIWTe
	Q6eyni2N9Wbahpxub86WMBHBv6QgTaper8k/OwJS1gLIimr+lDJxFj5iS56dW7zpZuLYGEdCYc0
	HRJFpFKd5AjPNuUvNilfk8FOjwzUf6t7wdgbZUdwLh/R/d/J9xVa1Ldhxni1u35KJA1y6QTU/v/
	Ean2DMSBPQTbTNx7qrOEM/i7FEcqUm3I75o496YA8wloJiOGWmT9DdL9cXDbnR3/ggpwSlcitpp
	swF1UV1MjOpuw=
X-Received: by 2002:a05:600c:a109:b0:488:af7f:7751 with SMTP id 5b1f17b1804b1-488d6836508mr224987635e9.15.1776286792383;
        Wed, 15 Apr 2026 13:59:52 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e41:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8f65fc42sm4398617eec.23.2026.04.15.13.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 13:59:51 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 15 Apr 2026 17:59:24 -0300
Subject: [PATCH bpf-next v5 06/11] selftests/bpf: Tolerate test file
 compilation failures
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260415-selftests-bpf_misconfig-v5-6-03d0a52a898a@suse.com>
References: <20260415-selftests-bpf_misconfig-v5-0-03d0a52a898a@suse.com>
In-Reply-To: <20260415-selftests-bpf_misconfig-v5-0-03d0a52a898a@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1776286765; l=2121;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=GbttUT6vyhtCn2eIxN8DR5H29xyp1zOxmftUR/Likoo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QH3cGtcWTizPM2OE5ymULTo3iCCGvIHO81cuS4JZD6Ja/+3FrPxfKy+il554FamZbpk/0Qtz4cU
 dQjIhgbwTtQ8=
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
index 3c9d61023414..ee7bbfcd661b 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -704,11 +704,14 @@ $(TRUNNER_TEST_OBJS): $(TRUNNER_OUTPUT)/%.test.o:			\
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

