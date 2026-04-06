Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1453C388391
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 16:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775491919; cv=none; b=LG9s9Ab123jaQsz8SVqlhohtipP1ffH6ssi7qAe+h+d4tW4YF1PYcha39uuGwvlKmF95p5yyzLIXKiL1bcHhQTw5GHt3gBmULY2D6ytudvtM73QY+/6Fo/Yr7k8zQI9AGMs7GjyHQ7f/u8US95pB7mYg3CDDeM7IUlSbHcV3i8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775491919; c=relaxed/simple;
	bh=THQvdXVv31TpQ7mxGEsKklR/hWrRMotZuvkB5HuFY5g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iKRIkONwt7EbTaUf9evbo3ZJkMMy9aqbhGQlM0XTYjYtBtHBIKli2Kx6IiiQ5V8CbONI6NdrBx8qOXpJpavjAC5yGfEV01s0sQv5KvOUyUXdS+BATj5KvLGsGFhSO7Q1HysnoNlJsT+GA+Dp8Cp0TSt3vVLiJYnFlWRSyzMz7ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VZPag/3y; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VZPag/3y"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso30836745e9.3
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 09:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775491916; x=1776096716; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UhJemnsUkZv11ibw/3C7vkexNe+w6VJ9//yKII3jtCI=;
        b=VZPag/3yd6kdLJ0QhfxPNveoRj5yWqv1T7OaRlItdUg+vLGfRdXDjKLfC5ZV1NSxQQ
         XnGPX8ty5KpI/z/S4sDurZY0epb2AzxRgi2Q65oxSDozcvP53+DjJ0OCDwMqSdlYTNL0
         VtyWUIcJIjA18uYIBmVreqiwIJDh6vQE5WWzxX9RMJ9haEOmhFqESvjQZg0zaDFoPsqR
         tHlTDnHQS53YdnbRGv7d6LrqtuAKI6UhaWo0MZYy2QZhqokBvZ/syeCGT1mC2YsI8/za
         E43uqN+OLXGUANgRSEZL3IoP4BJ+itsq63MBmu6j6EN9FBENeH+/npHi9weyrDXu49HR
         yNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775491916; x=1776096716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UhJemnsUkZv11ibw/3C7vkexNe+w6VJ9//yKII3jtCI=;
        b=dperQ57WFuAcmCHiQrTVDycnvnosgeAJIu8skASUE5uCkPj+KAfz1QBk/SzP4JFgzt
         7VwGS+AC3vp06wTSmXn0LkC7mb0iNmXfVSkDUxvRUGO6goTVWBMefdQFoziLE+XX9hpA
         egFmNV5HiinOojEsvD+2uRBtuHHXE4u113WvTIq+mXKP2yfFjlzU5+S09LkQzlCMCs0V
         OeBdBZ4bvubdcX3O/sg8YNyqlbABLLELNfmsx4jDey9pObNLXDywy5NdKi+TT6R8f8nE
         0+kF5vdz19mb3Qh283kzYHbKUrOOfbRzZXLnfBuKEjJk7n1QaMQHM8rPVka3YGMh7UII
         fOng==
X-Forwarded-Encrypted: i=1; AJvYcCXHgmPq6G5G9tQYiO2HoZi0tVQ7yNvlJp1q/pNsaezh/2gb8W+DlHz4CFXR49VURC0/3HrLszg/6KfXGuhbTv0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyppxCp30brIGWve+qomjELYpOiIZbP1TSUIHo8MRQ156zucwTw
	g0VioK5C55szGspY6lMp9yJ8A7y55j7u+Uv85eqh9ugGHM2FwQKu9fFBxOTwDnx+zyA=
X-Gm-Gg: AeBDietXlw5YODFldXX/A31ft1HXk8rXe0Q7LfyQtzSbPiCY3gODN8r6h0Okmu6rlCp
	ITcYWMgKO6c4dFIyC09403kcq+/LAnxxFkFzVzEhO663JYyw1Hbo7KPfztdqEuXPNJfDZq71MZQ
	BByahkM51SHuSerDzbvlvImEls22dbm53dlf77pzR3pNTkiza7vuiK6Png0tu5XD75jrA7XmjV8
	hCZOqDJNMjK/xKmT0SCsEbPUh4kwttd8oz8i2RPY6mm4XGfpsyqIYoQWpSUupgtImGA0yIPFeZb
	6u2XaClF6MOHz0Y6zYz5Vsk8moPZGCsT4bAnYUIaHypelIGiZBdhEFtXx//ZpYmRI4cNeMiSpzH
	GVL69Xoh+nBrQSZNE0RIN9ZbzCRHQXh9UgPJPLDGxXZoHaEbPcF4+xU77dQgoCgQ+fz7x+nRro7
	3buQhbggXCGJij
X-Received: by 2002:a05:600c:4512:b0:488:9324:3ab8 with SMTP id 5b1f17b1804b1-4889977604emr189339735e9.18.1775491915600;
        Mon, 06 Apr 2026 09:11:55 -0700 (PDT)
Received: from localhost ([2804:7f0:b767:120d:a4df:3777:2c55:2b95])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fba6abbcsm13665264241.9.2026.04.06.09.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 09:11:54 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Mon, 06 Apr 2026 13:11:29 -0300
Subject: [PATCH v3 07/11] selftests/bpf: Allow test_progs to link with a
 partial object set
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260406-selftests-bpf_misconfig-v3-7-587a1114263c@suse.com>
References: <20260406-selftests-bpf_misconfig-v3-0-587a1114263c@suse.com>
In-Reply-To: <20260406-selftests-bpf_misconfig-v3-0-587a1114263c@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775491886; l=2109;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=THQvdXVv31TpQ7mxGEsKklR/hWrRMotZuvkB5HuFY5g=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNnqnfZdGW7vaNVUnntgaLMuLsEhZuzIG++xaZXo9auz86OmMepb4i7aY3wF2d3bC6A5TkvYvxc
 EhZXeyhwnqAc=
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
index e8e92ba9d5b4..bfdae212037b 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -734,14 +734,14 @@ endif
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

