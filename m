Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA8D47B43E
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 16:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775060161; cv=none; b=dmYnB+6BVlhqh/+3T7qn0FqrYdHcqAAIHAArXnG6RFCjZvm5zbv8TDSTyjar/JSmHQAmjPfsd9lgl7HOpTYttoWoHyiR2XX5XPxzswLkjldS4PuNEjO29GPDYjD+5IUHShtbRE8KdYxlTQjb10LKzO9Ye7o+n4ats+wN5t6qvnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775060161; c=relaxed/simple;
	bh=nKWUAS1x9dQP6xP+ZsIvQUaxyr6H2YAkABQODu7Fen0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gKVYLdz3KrIM4CxXIx9llRNbdGtUAUQSzNsRfXL2rawGx+Ct0URbWzmIdWPSQeiE1i6LJ6Ns1rbdGUZQITUDXluTiHLU3dZZd+EJgpcaz47BBgUqFiWXJGmM+avcWOeDgLglBpBpr+INoy/9oDlrTIC+QZB6u/p28af9sCThoe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GAysxWoo; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GAysxWoo"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486ff3a0fc1so65396985e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 09:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775060157; x=1775664957; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=86AThs0RBETCI/C2kzJRThc82KiZw7KQ/KbK0v91i7s=;
        b=GAysxWoojRbT6cuX5IpgzCeLGpGIrD37EjMMy4pt4Jox9nzFjCsQly6bKw9DRvThqO
         HesvOdk4hCRkSmEc8fEEBzuvC5LDZQcbnEG3oU3aFfiyOJVRKB5A3k8I2kymWxaf8+3c
         CK5NGTDNlCAsp9atBaPo9sbmwFmCeC2GASboG6fcm5wQGE6tTUQ968QXqQRPvjeiegXI
         kqVWzyKKVmPv5eukmOmAI/jWcMYGsKxMsFXwY/VsEZZAR5UulDALhODfdq8VuNfEGBvV
         OnTuYXTdtZoA5dKq2FtPwlqDQNZI4+c51K7CRzLOMyaWXIECrchI51HpzNLJV0TB/1Qv
         6HqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775060157; x=1775664957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=86AThs0RBETCI/C2kzJRThc82KiZw7KQ/KbK0v91i7s=;
        b=KlsafCML4BH8QX3tWXdwena9DLiH2F8Api9EOK1P/X7RX82Cp5LkiJ0hKVx0f7r6hM
         bvQnqe9l5Gaubwec4/jhQIZ4blTVmUNLG+4/DpxmZzsB7qgSCujE95HGvCy9ff0kZliQ
         jtw5ZfJikI0a+0J1FddAVU91VuGWkJ87GypgNMMOLbeJICLumkv7RpAiOMlwhq3JpMNT
         Tz/WKxeQmEdEucGvdvYOYtyqzP/PyZmVSZ/k8Mp7DbnZK7odXMJ/0lok+okARS5Ir+fu
         JXAaYV9AG7+zD7KGJ6btTmug986sXQGbAOAXaDdExTxPYvPoPyggLHr8hrtH1PIfuaGd
         MAqA==
X-Forwarded-Encrypted: i=1; AJvYcCXGCz97Bimh9NVnq1jQzhmXW8T9VfpNu5uxd45pHnGI0IKMz3yIN6pP/T3jsZFbZhgcLjz2wWyV23ICWdKooRI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1zY0GSy//8KTwx1Ye6hUiWjyoFV+SzZOXw1tgdJlhC2fgGbE8
	NWBuw9pieKPcAXR36pCvaXyLXg+yoJjg2K6l3fnWF+b7gcvHdfpHlDJD2UmBGbVIadY=
X-Gm-Gg: ATEYQzw8YJUa07ciDiHFYoCkqGDtgE+My+s3CTCSB+9+Z87ZAoJGylX7f5/vurIhU4B
	NGD1RGtJl/TDtpFS/ZKMhfD5qNxLizT1VclpsHIX11gZhx2QU+BQCnI+jD7LyvG/joHZX68KLcd
	3zw2NLCiHBz5xcs3c9F6cTuOsh0Dn5ucZvN7yzk02EizKENu7UKU40iuTjsZl/r3X0KO5EuOhsT
	PeGmeE/u9AInIRW4BRj4Ejz7Ye8a+w80HPKZIJrEgkCnqXqUsh2tV8Gr2nB9tB4m1ONz9apAo2n
	mk9lTXx9ven5+WgK/DC98skmAnXFvKQf0JbR4Wejj/V/vk+7fIyHAcYtjJvRQBuJtwzCwcyAEXm
	tqJWXDsm1Tb8hvNwafI0Ypq9WmyE5FxVQOpzVoqqB3R4mN6u0DmlPKlkJFzTUpB5ZOK5XpmK49b
	hEj2uTREDHzDNExgpPlWc=
X-Received: by 2002:a05:600c:818f:b0:485:4bd1:4c64 with SMTP id 5b1f17b1804b1-48883596fa0mr72497305e9.31.1775060156827;
        Wed, 01 Apr 2026 09:15:56 -0700 (PDT)
Received: from localhost ([189.99.238.3])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fbac4aa9sm438728241.12.2026.04.01.09.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 09:15:55 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 01 Apr 2026 13:15:13 -0300
Subject: [PATCH 06/10] selftests/bpf: Allow test_progs to link with a
 partial object set
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260401-selftests-bpf_misconfig-v1-6-3ae42c0af76f@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775060128; l=1805;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=nKWUAS1x9dQP6xP+ZsIvQUaxyr6H2YAkABQODu7Fen0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMkvYrI+uScD1xtnMfLEIEvmAO3zcn5+JIYxMY1NIomVVLoJVfBoKb5D9aMTaWPOF9WOiycQi1l
 blzKKjFjITgc=
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

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 37a454e4cc3e..7f4825dfa5ce 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -736,14 +736,14 @@ endif
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
+	$(Q)$$(CC) $$(CFLAGS) $$(filter %.a %.o,$$^ $$(wildcard $(TRUNNER_TEST_OBJS))) $$(LDLIBS) $$(LLVM_LDLIBS) $$(LDFLAGS) $$(LLVM_LDFLAGS) -o $$@
 	$(Q)ln -sf $(if $2,..,.)/tools/build/bpftool/$(USE_BOOTSTRAP)bpftool \
 		   $(OUTPUT)/$(if $2,$2/)bpftool
 

-- 
2.53.0

