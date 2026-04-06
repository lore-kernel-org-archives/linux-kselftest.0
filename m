Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A133921F6
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 18:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775499762; cv=none; b=Fp8j5NNWHuKUWPh66G8QhQXM6VzR+f61fcV6a1rksFDKDQLaQ73bHGAVAUIvOO4tR9tM1kSnD7uq2Su7HWpyIw6zuhpzC2sipC+pOVf08PmXIW6VFdG8IiZr36LHesheZ792k3gdkcZxlOaGMR7rRbRWvRMzN+nMjTch2w60o7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775499762; c=relaxed/simple;
	bh=3TV46EUd5SknZIe1cqE/s5d8RQ9ID+g5k7uHbLKYsxk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pcj+CT+WxuYZrg5PPwg5QWtHBbD7rfhmLt4bo/LrPL38iWaShPVaimMx2NTqC1em7EptRn4R/rdz6IRUMf62KyWUxqTSbY24SXGCqmLn3KN2VNEYscnek1xvr7yCYqk0wRsAOR90gL27oH2Qs89fH8VEiwun6Hw0/exEblbyXzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OOfHRBg4; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OOfHRBg4"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-483487335c2so42070925e9.2
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 11:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775499759; x=1776104559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ozbTMFxdM1cFM2UvPkE2WgfaDTmm+Y//gdi2ZxNHkqg=;
        b=OOfHRBg4YXgfTCAbat7s73V14BtxVWe6P5z1top6Se/gwp8kuuX1Xt2Z7v35vkQ3sX
         x0hx8oKqVthmYoaiRg8Cr/OkkojkZU9YaOGLa9u6PTWgqAliCXBZhn1/OzovTDaIpB+0
         OZtGuL/RvlhJUikdW6Z9RW7t7Z+NexYGa6tbO2n8T3Ez5JFWqInB0cy4hgivjsfIcclb
         WwgqbK6acae9z7McykWBUaJkg7PJN9NnlLDwo/40rOQ7JdSi3liMVuHSLC5McxbS/UaJ
         S5+uqSn5BjSYyIiGB7BOQ5y8WemV0RJFLyrjxiBVVEbse7Au6a5+HikzHmtGWu2s5TNY
         JwKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775499759; x=1776104559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ozbTMFxdM1cFM2UvPkE2WgfaDTmm+Y//gdi2ZxNHkqg=;
        b=lSQfiK8lMpNV6qogqJVtM7GIToN82wsW4wO+jBmSJ8tKquNev8SpIq/2IFcu3nKcAp
         hl6QuwRmc7STKuVJsFdvmfQbo3QkjscK5E6ZYMvO1AJUUEvSB46LMweGLJptOseHNot1
         5hdGFU8vJodTpEQHDg1qXOwlMsNxbz0HqE6WcjH2dvNNFS4hbEdY46+PtJkJgiuowwrX
         vnQqHmxW+JHzBK/mnz9o9FB1frAtLp8DILnX7Zuing//e3G3xcuB+oHi710OC2wU64RR
         fMNsmcUsW0CUSlTgNBk11Uvk77QV9jTLELORpla7/yg0w5uIHbd7Wr9kib++qtLexjJQ
         U5DA==
X-Forwarded-Encrypted: i=1; AJvYcCXAsENBJvHkss0yOmVautNxzizKt8EoeyW1AnzrxGeGauYfqbz7B/uUPec0ce8caD9SgO6RCh1mR1PXuV8hu+I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEzIFvxIEDysbOy0unkfcKqFnfdSBg1qY8iIDyjYRwRVinG2XN
	liVrWzt6NZEY9JT26MqyxZbNhmlmRhqLIVJQXimLwn7cGhuxVGBhRF4kwfa7uW5JdMc=
X-Gm-Gg: AeBDiev5BSeLEZH4zNmPR4rRE8eQVIxw92tvqfD1VeddWHvKVD+1fp9Cqf6AUcRfFkN
	r/xdqFipK0R28m6WGOV1oai22tL6hIZ9AdMvF/zwHEvkUO9nkZ9Md2ehwafvVkQiFAdhNeHmnW/
	w77ZLkHdHDYYVmUb9NMRSOwPXuOtdttZFwPQJpkqyJTxxpduWt+f2BY8zRx78FavWEcWsEFJgy+
	jC5gqxmk559w7PBl2IGtH2+NN9145V9YELcEfXgdXHqvl8Ewvhc7flelKHh7ARVGqEE9oFNzt9M
	rygSdrlFvge8JJdEtZqPP1xjUS/+euAWHT0/7KEBp3StBjyZPMPTwQjUUokyZUDRUnz/nl3ZrGK
	4Grk8FInsy7sC5kx7WSAP9bQxs6UW3FVeIaTobf6md57yDiNmHYVqMThFBLGRg6aKc4LXneQiRa
	ZLO+Irf8vCvRmi/SISAftmJ68=
X-Received: by 2002:a05:600c:630a:b0:485:2fe9:336f with SMTP id 5b1f17b1804b1-488998e3cbemr200669865e9.30.1775499759198;
        Mon, 06 Apr 2026 11:22:39 -0700 (PDT)
Received: from localhost ([2804:7f0:b767:120d:a4df:3777:2c55:2b95])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bd03371sm16894540e0c.16.2026.04.06.11.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 11:22:38 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Mon, 06 Apr 2026 15:22:18 -0300
Subject: [PATCH v4 06/10] selftests/bpf: Allow test_progs to link with a
 partial object set
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260406-selftests-bpf_misconfig-v4-6-9914f50efdf7@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775499736; l=2109;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=3TV46EUd5SknZIe1cqE/s5d8RQ9ID+g5k7uHbLKYsxk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHgzmbHrz/FK9Sgm4TZs2qx29QrT5ezLiJaVCMLqS1IqbrpyBg6QBBaO/9Yl2NcpcP/Xuqqj1Sm
 8Cy/tiBeFjAc=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

When individual test files are skipped due to compilation failures, their
.test.o files are absent. The linker step currently lists all expected
.test.o files as explicit prerequisites, so make considers any missing one
an error.

Move TRUNNER_TEST_OBJS to the order-only prerequisite list so that their
absence does not prevent linking. Use $(wildcard ...) in the filter
expression passed to the linker so that only the objects that were actually
built are linked in.

Place the wildcard expansion before $^ in the filter to preserve the
original link order: test objects must precede libbpf.a so that GNU ld,
which scans static archives left-to-right, pulls in archive members that
are referenced exclusively by test objects (e.g. ring_buffer__new from
ringbuf.c).

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index e67f9c4cb5d7..a12bc9d76f8e 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -738,14 +738,14 @@ endif
 # some X.test.o files have runtime dependencies on Y.bpf.o files
 $(OUTPUT)/$(TRUNNER_BINARY): | $(TRUNNER_BPF_OBJS)
 
-$(OUTPUT)/$(TRUNNER_BINARY): $(TRUNNER_TEST_OBJS)			\
-			     $(TRUNNER_EXTRA_OBJS) $$(BPFOBJ)		\
+$(OUTPUT)/$(TRUNNER_BINARY): $(TRUNNER_EXTRA_OBJS) $$(BPFOBJ)		\
 			     $(TRUNNER_LIB_OBJS)			\
 			     $(TRUNNER_BPFTOOL)				\
 			     $(OUTPUT)/veristat				\
-			     | $(TRUNNER_BINARY)-extras
+			     | $(TRUNNER_BINARY)-extras			\
+			     $(TRUNNER_TEST_OBJS)
 	$$(call msg,BINARY,,$$@)
-	$(Q)$$(CC) $$(CFLAGS) $$(filter %.a %.o,$$^) $$(LDLIBS) $$(LLVM_LDLIBS) $$(LDFLAGS) $$(LLVM_LDFLAGS) -o $$@
+	$(Q)$$(CC) $$(CFLAGS) $$(filter %.a %.o,$$(wildcard $(TRUNNER_TEST_OBJS)) $$^) $$(LDLIBS) $$(LLVM_LDLIBS) $$(LDFLAGS) $$(LLVM_LDFLAGS) -o $$@
 	$(Q)ln -sf $(if $2,..,.)/tools/build/bpftool/$(USE_BOOTSTRAP)bpftool \
 		   $(OUTPUT)/$(if $2,$2/)bpftool
 

-- 
2.53.0

