Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587374;
	b=CWN5/j85nRszMU66ZcMae0due80iZ91QPAAlRtoAxVjXkW5NgPZ24gIJGhKJYKwfS1Tx
	 +q2jHXIIlUXshbKbxgzltvlFoYQkOV1osQJVUIwOt3q0T0AjGTiKWvf6dFjY2QOrJS2P+
	 ED+138bK0LR8D0z0QgnX9czQ0ZimFzBN1CbiAxgCcMIBwcU3hb/JZnzcI9aNVjFQFzzUy
	 0+Cac8ZZiC/pSJYe+G1x+jPLWPzD7wXo/HM6PepdyvnRDUgfh7TKGMNLGEf5H/kSpvn2Q
	 ZIZ3jP3mlj/dFtsdp7rXomSwJOkc6QTXipt3YiEt4OYK0mXyx/Z2EFdy+bViioYlK1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=+3YNbw7npHYIz6vJpu6w5t/t1EQu1XAkIQnaB2DVcXE=;
	b=Wke48bcuyRqvHpALljtoOCAz0FKRTfyNwLcHbyOK5/ORlKy6Yyb5G0ETp6VUIXOdkEzi
	 8GGztJxonqsjfj1f5Gu/uXJR7zDhStTx4vHh3nOnPzTbypYx/hNfRSabpz7eYnmuhIlzY
	 xKbTUEbqPH7TracNWlXYfT99vqHAdIWqsYazDfu5ra1/j6Rdem6nWHUgW+ZOS5BbmPzJ8
	 VjxihR8g1L4a7pfV3qQ5aYCHllEMLn0Aw4bruXqD2mwlHHrZiuL10v3L+TDV/NZInN9mI
	 BOlExoVGRNA909impmldtdjOcPiwwX6eR3Q549Ye3y3tdvmRvGrfOObOBIqGDJQ5Z7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iLdYEq6j;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204E86070241
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 06:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 204E86070241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iLdYEq6j
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386c3309469so1559984eec.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 22:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795587373; x=1796192173; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+3YNbw7npHYIz6vJpu6w5t/t1EQu1XAkIQnaB2DVcXE=;
        b=iLdYEq6jPFG1k6lRURVTYgkpU0tn2xfKdgxbC9QNFC6g3K7bQcnhf9FCdYqi9Xo5uo
         SBN5Gv4/P2cgIp08qAw8QZoMsboROqKfZkGHPwrTxb0h0vSuGg6jqfV7Pdsi5ps2gvAH
         OdOhZYiJQTNxO6ZwFaUem9SrQ3LA7rcXlYT8RxQANhUprqB2xFBi/FVwPlL4f59N8akj
         B398DOc9rQ7NbwrKpH2N76vv0eAPJUQve1bVdW9SfzaT6L7W8lPsXM/WaRPCqvSfTtUy
         Gbw8nVhHeASvK7e1vBllLSDnJplJRmM16lY1l5+ob+71ZDXfeVq7x0A0bpDEjTwFslrT
         ATvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587373; x=1796192173;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+3YNbw7npHYIz6vJpu6w5t/t1EQu1XAkIQnaB2DVcXE=;
        b=Z9hsrJNf0JzX8oNt0ktk+yGfIjGHRYB9GvbCOPsqxAdHMrNG6EtPCtRHOctvLhDU8C
         tFmGDuUjtCjpqJ869GYSNpU0b4dzYz4ICSiXIePz96MEoZr/oUtSpkKwSFRAKD/ywGiy
         ccm5i3zZpUlKLbbTxRUNOrtjXYorbtlCLmQ488SFP5x7lEIUXf3fpxfqJtytaLfw3g3g
         ko9SimkECDcI6SH18jp7DAMuAZum1ylbjJ61S+0fSXJ63AxMGd6JHMySBQojJrt5jWKe
         IVcDpsvpPK/7Y7Zpokh3Wl82jWmCLk1/RLoGonDof6R03oLQ0H2VUlePmO3IXUXCCRm/
         Bi8A==
X-Forwarded-Encrypted: i=1; AL+hErEVnDF44F969lnC3LkBX8nA+DTc/bjDfRrZtBI7yJ/7QUDVe/s0yUEc+127cYcwqqq1VeG53Dv0afBnsexPfE0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ewzVuvrhfiytBrQWQCIXl+ZQa6SHhEY6JPp0oP13VOJn8yOjy
	tW/qC24eKV1SUpnv5trXwbQStK+nUdRld+l7QGxuSYNGi8hCk+ugsy8rXPQO+3vojBnc/oEGltk
	KZggNxR0YZw==
X-Received: from dybou2.prod.google.com ([2002:a05:7300:e5c2:b0:384:c70c:3c65])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:d809:20b0:386:b070:6f1c
 with SMTP id 5a478bee46e88-386b0707151mr8742111eec.21.1795587372849; Tue, 24
 Nov 2026 22:16:12 -0800 (PST)
Date: Tue, 24 Nov 2026 22:15:01 -0800
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
Message-ID: <20261125061523.1540234-9-irogers@google.com>
Subject: [RFC PATCH v2 08/30] vmlinux.lds.h: Allow architectures to emit
 custom RO_DATA sections
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

Add an optional ARCH_RODATA_SECTIONS hook inside RO_DATA() so
architectures using runtime .eh_frame / .eh_frame_hdr kernel unwinding
can place unwind tables inside write-protected RO_DATA without leaving
them in unmapped rodata/data gap pages.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 include/asm-generic/vmlinux.lds.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 3eb732942d69..1bde7a2a19d0 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -472,6 +472,10 @@
 #endif
 #endif
 
+#ifndef ARCH_RODATA_SECTIONS
+#define ARCH_RODATA_SECTIONS
+#endif
+
 /*
  * Read only Data
  */
@@ -554,6 +558,7 @@
 	RO_EXCEPTION_TABLE						\
 	NOTES								\
 	BTF								\
+	ARCH_RODATA_SECTIONS						\
 									\
 	. = ALIGN((align));						\
 	__end_rodata = .;
-- 
2.56.1.831.g720f3f5937-goog

