Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587376;
	b=DI9hw43EzRxwKiIVH2pSJr1s88Ls8cEuYE5I8ye7e6Of2dt8jCYzLWhxoZUAQ7stmoi8
	 tFukDWZThYIZs4Upl7CRTPIMakHZgXclApbZavJTW9/XQvj1WFXAHTVWXwFaCnFBQbz9h
	 Qe+Jv+q7XBgWHC35A3T0fR2tJTdqE1FIYoDPysNQTGryd0+jF6PdbHHGRJ+XXtOVzdpBB
	 se8E5IWZSBQhRcSaU5PJOwZMzMqNwj7EARYMo0pq0ExSed9e7wDiNkOAyPa7LU1C3/+Mb
	 wNrzxgnPHuYJSHdvsk6v4W5xZGBAYlx59GTF0EOM1Tovj+8FY+bLYOg7rFMU+N77QNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=GGDahMitB3LSpaFaJkVUo1Pzx9kbamS5IbDP2+gBQRY=;
	b=3OHyEJb9crbU/6AV+Z4SwvxEyu7yBIQ2VTNlWmjT0bmcqNi0i8K5LLbHHsxku7D0F4qz
	 VpFEw7Yx0eNNGB9LDQAG30THAy1b+2KLi8wT5yLQ9EFlyR9KmUe+1IH2EIQStC6DgeTy0
	 n2uV7nFE6PTuwJG5KfSC1uwTB2MYCBYSKUPykZyW7mrZBRDisQcFjk+5IFU7Z7+sJeEJh
	 ZFuNOczU/KkKqo1r5J5R6r9yYWWfPa6B/O5rm8QYJASN98kiFfS1hNtcA8qdwaIjZZG7S
	 OVtjlLJRDO1EpADE8liKHFSCagXB28vf3vNRb2ClMX1Bz4SaW9UMuQSEfg4y/tI8XuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NC8TFIwL;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B0C60A3818
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 06:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13B0C60A3818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NC8TFIwL
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-154e9d2d94fso393086c88.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 22:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795587375; x=1796192175; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GGDahMitB3LSpaFaJkVUo1Pzx9kbamS5IbDP2+gBQRY=;
        b=NC8TFIwLTkPbzeWjMCBEzMycXowBO7nwlg1PQhGSIEdoRdcynFgU3xj0z346DalUvK
         CclzOOgsc08nnESEFqDQN8grEdC2dvQQay+O8qqF/cXS/Sx/3fHPHv22bsBKHsHYhqhL
         N7MKQrt38DWZocIKvHgSCP6atdy4p9PvnCrh+EVUWREweUMREZchFqy91Sxrc/M3Gq0x
         4IxBXWtMXRPrVFIYr3Tg854QTdurR/WVRTSLuOea9bx7plqd3QRfrjLI4E++6f3fadBC
         EcD9m8j1xBeixoCWAUp7sngoetkh00EBHTIE3CwevkPOOdyD58gjHWhr5ITeQvpeR1pk
         iPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587375; x=1796192175;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GGDahMitB3LSpaFaJkVUo1Pzx9kbamS5IbDP2+gBQRY=;
        b=ynB30ET2BgRWQLcEz/pk4wNPeoW7Zye3LhpZixeEVe04w0qcFp3aBqNXolrJdWNgqt
         rbOY0cMpZAS8t/6erLF9eepttnUI3wteV5S7NpYaiWp9iFd0YkWpBk1nMScsaVGf3CJ7
         6hnhB+MeMhPLrCJeQuIQQJfHDgQ65LxCATGnyDaYftp6LiCn/gKZvbvynyNK5n3jJ5IR
         LeUmQBgygQv9oKU6UuXc2SN2m3f7CwJg945PlZ7gINmemiT7X/pyACmc1B+g/0b97aai
         WWOzSYU5Ra2OY1wWgqfdjbnRKJJwYBTUvnUQek2n13T+XHoirHxj0wGFcSmKZS6HTgVn
         +35g==
X-Forwarded-Encrypted: i=1; AL+hErEKFVZPTJc88e7xtxWKMcYTr/rAraKZiBdpxxqf9AoVmy2V0yeRYB1hPJqotp1qtadp60vOCtXjTHQ2VGoSw+I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8leG9SWlsfIVTMCLnjwUnB8GsczKgvQ9dZ07ibOGgZ5DkmlhtG
	TPDBAn4RP9p6DRpDP91a9k4m6yjAF4bXaJmkx4muMJKejHUDf5z35zJToThL//C6qn1tj9E4e2s
	mfgZBKP2kiA==
X-Received: from dloo27-n2.prod.google.com ([2002:a05:7023:a5b:20b0:1b5:8761:cc11])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:b902:b0:1a5:9abb:fdd7
 with SMTP id a92af1059eb24-1b556877a2bmr15589113c88.9.1795587374885; Tue, 24
 Nov 2026 22:16:14 -0800 (PST)
Date: Tue, 24 Nov 2026 22:15:02 -0800
In-Reply-To: <20261125061523.1540234-1-irogers@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125061523.1540234-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125061523.1540234-10-irogers@google.com>
Subject: [RFC PATCH v2 09/30] efi/libstub: Disable unwind tables in x86 and
 RISC-V EFI stubs
From: Ian Rogers <irogers@google.com>
To: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org, rostedt@goodmis.org, peterz@infradead.org, 
	mingo@redhat.com, tglx@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com, 
	x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, acme@kernel.org, namhyung@kernel.org, 
	linux-perf-users@vger.kernel.org, mhiramat@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, bpf@vger.kernel.org, 
	nathan@kernel.org, llvm@lists.linux.dev, nsc@kernel.org, 
	linux-kbuild@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, ardb@kernel.org, linux-efi@vger.kernel.org, 
	maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, indu.bhagat@oracle.com, jremus@linux.ibm.com, 
	wnliu@google.com, dylanbhatch@google.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Pass -fno-unwind-tables and -fno-asynchronous-unwind-tables when
building x86 and RISC-V EFI libstub objects so enabling kernel-wide
asynchronous unwind tables under CONFIG_UNWINDER_DWARF_CFI does not emit
unwanted .eh_frame sections into the standalone EFI boot stub.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/firmware/efi/libstub/Makefile | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index bbab12b8eb4b..19c2822eb302 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -19,7 +19,8 @@ cflags-$(CONFIG_X86)		:= $(filter-out -mcmodel=kernel \
 				     $(PADDING_CFLAGS), $(cflags-y))
 cflags-$(CONFIG_X86_32)		+= -march=i386
 cflags-$(CONFIG_X86_64)		+= -mcmodel=small
-cflags-$(CONFIG_X86)		+= -fPIC
+cflags-$(CONFIG_X86)		+= -fPIC -fno-unwind-tables \
+				   -fno-asynchronous-unwind-tables
 # Nothing enables IBT while the stub runs, so ENDBR would only take space.
 cflags-$(CONFIG_X86)		+= $(call cc-option,-fcf-protection=none)
 
@@ -29,7 +30,9 @@ cflags-$(CONFIG_ARM)		+= -DEFI_HAVE_STRLEN -DEFI_HAVE_STRNLEN \
 				   -DEFI_HAVE_MEMCHR -DEFI_HAVE_STRRCHR \
 				   -DEFI_HAVE_STRCMP -fno-builtin -fpic \
 				   $(call cc-option,-mno-single-pic-base)
-cflags-$(CONFIG_RISCV)		+= -fpic -DNO_ALTERNATIVE -mno-relax
+cflags-$(CONFIG_RISCV)		+= -fpic -DNO_ALTERNATIVE -mno-relax \
+				   -fno-unwind-tables \
+				   -fno-asynchronous-unwind-tables
 cflags-$(CONFIG_LOONGARCH)	+= -fpie
 
 cflags-$(CONFIG_EFI_PARAMS_FROM_FDT)	+= -I$(srctree)/scripts/dtc/libfdt
-- 
2.56.1.831.g720f3f5937-goog

