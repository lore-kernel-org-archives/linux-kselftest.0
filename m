Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDAE38CFFE
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 20:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776286798; cv=none; b=iPIH9O0GxbaPSU+hvaXfpwn8TiqPxJSAnpn74KPyULHIZvQ0TOwtWgahpLoDZJInqMLa70qODpQJudkE7a1C2RJ7+hKYLQR4ZHC/NbEIvHaaWpwSlHGAkSag9vVs/+0G4elxZWfqK7QW6cclSLG3tSaU2H5BOi/WMSFrx5mBTFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776286798; c=relaxed/simple;
	bh=sd6o23TXTQBmDe9CNsrT1vAQRg7+CRHUQ5cNo1CDVZ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hzWAmA5UqUnnMnXZ4nW8UPYsnwB9gzc00oELbIgoxEv9TlBgvyqtaw8/gqYYqh0H/xYJlKCNArfDiXPeeQy/0dM8cFVWKxP68SOlMFyQ027YxyC16wQoKaBR/1W1hahY+UcKyltXL39fWuwAFEQ0UtRNwZGniOWxWH2gUSJ6fGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YEZknZHP; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YEZknZHP"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so52104255e9.3
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 13:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776286796; x=1776891596; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+LZLrUSOhq9xIydX+pHIEZAmNfKMNGZSAqdkfa11Ks=;
        b=YEZknZHP9aKPxjBFdRAVs3+YLbAsxo+p+/iUXZR+fmfnc5uCJNOCP3gs1ehyDV9PdL
         Ry6A96FB8ZpHN08SBhoofaPV54RSbyhvuSNwgSPX/Q/XCCJzyz4TpS+w68gS3cblVuY/
         1stdb48ePH4G3nmSmmik1WPKqT1E9GOG2SLLdqVbakeLlx9Slgc9Z6Fqj1CcZLjbF0HE
         oDADoL6SG5HR5N3OlHHle8vYXbd3vg+oB5VlI7x8Gkw9cUKTqzzaVWa4bYxcSrloJIpw
         1ogabcCL2ZMzmA5Co9lHHpRddnSTCaJIzq6l4KP2g1UoP7sBo/sCNERJ6pjVH072XeBY
         idiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776286796; x=1776891596;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R+LZLrUSOhq9xIydX+pHIEZAmNfKMNGZSAqdkfa11Ks=;
        b=M0x81sywKJoWv0aFuV1jN7BleVszVYmth+tH2h+Lfpx2W9bOpFYIeTpfXg/221WWxE
         tTDtFU1tIgO5JaaS5EPvZ6HprkI12aTsp84D8z4zLHVo8d/j2VH1e3Y6tPgcI1St2/ci
         1/CChpu2h3k+rwBmFzDHwBY6rRhkX3oooJFGbFrphvtUejJeWSKjtqqSnj5ikYibG+T8
         yYHc7IXAoCrxAHBN5cu/Rm7L6qO4C5FC9lUlSRdbnVe4OtEDkPeF5h7UMV+nMABpSdZg
         JRHB7tt0AFut/w8gu9dn8OFdHa1HDHCKpQCZjE85ufIkHqO6WWmZFCi03+vnvYoPrpnj
         n7uA==
X-Forwarded-Encrypted: i=1; AFNElJ/RuvGweh1na+9QemUhnWJEghSPIlc/U622DGnL7zs35t9DjE+Cbq3k8oWxuEtgZSxiUiT/EQmnLwqYVqazLL0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7GIv/tnPqsyipoZFnF5J4leWi7hvDf5bIzeDiaUQfsqdKAEct
	IYhmTpRGC94wxp8ZRKWZ8VPOmONXVXYHJpbvaHEkZ10symVoXwkZVMqAtPLv3G9GAxg=
X-Gm-Gg: AeBDievwUxD166jXiBJPWTYqSlTNiyjpjUbK2FTxGn+kXvo0e4J2X5WYi3R1LR19P7M
	nvn5HCjs9ptVWVHyvR/lZLfjG+Ms5OtHwWUHDKdai4QVfcPsAF6gNy4VlmtsGNlZ7GJll+Or82h
	QpjnChWYQ2jU0SdUHsjdZW3zz+ghTooIfzWQGigjUir79L6NizcGc6zsaiG802KDm4p6gi/v8oz
	FVjLru5uItfmLU0QDqu0G7UKVQNDz3Krp2DPoquiJVtvyMLUDW3ui3+dFkUFjWgTFohq8uFqlbD
	6ZO1mGiu/utDOLwhGfovq3m8Ew+PZtNvUrOEtN03i7fEg3T6hfIy/JHo2q0CyMzMBWmLLigO/eG
	rQKTYs5mgJK6VkBXmsfkx1IqBMerGy+N0b409p+zjYf+uhoW8d1OrpTVPxGvY1XvodGReRj+kti
	GBls/xmQDFTEwVLjpZ0B27ig==
X-Received: by 2002:a05:600c:528c:b0:488:a2ac:a337 with SMTP id 5b1f17b1804b1-488d68c2bffmr298755645e9.21.1776286795661;
        Wed, 15 Apr 2026 13:59:55 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e41:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8f65f9bcsm5108876eec.22.2026.04.15.13.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 13:59:54 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 15 Apr 2026 17:59:25 -0300
Subject: [PATCH bpf-next v5 07/11] selftests/bpf: Allow test_progs to link
 with a partial object set
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260415-selftests-bpf_misconfig-v5-7-03d0a52a898a@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1776286765; l=2150;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=sd6o23TXTQBmDe9CNsrT1vAQRg7+CRHUQ5cNo1CDVZ8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKF6hcje9wxrjG1OyZ3oiDzcAPEvRA/9gmflkFbNKl71F/Dnahqeq7yL0Mv6YwaWV6nV/2kL6t7
 4cQZwZlwgbQM=
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
index ee7bbfcd661b..128ea61fd986 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -754,14 +754,14 @@ endif
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
+	$(Q)$$(CC) $$(CFLAGS) $$(filter %.a %.o,$(if $(PERMISSIVE),$$(wildcard $(TRUNNER_TEST_OBJS)),$(TRUNNER_TEST_OBJS)) $$^) $$(LDLIBS) $$(LLVM_LDLIBS) $$(LDFLAGS) $$(LLVM_LDFLAGS) -o $$@
 	$(Q)ln -sf $(if $2,..,.)/tools/build/bpftool/$(USE_BOOTSTRAP)bpftool \
 		   $(OUTPUT)/$(if $2,$2/)bpftool
 

-- 
2.53.0

