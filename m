Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795391941;
	b=3596PG/lCfUdtB7Ik5yCxqTGObaqINX3vVlhp5Ttn7ialGhRNYc0JqMS8XPvh55MRAWW
	 IEAhWYjxtmvP3dYfcw7/fDiJQOiKde43olq1Ql3nkegHndBM42XalNA7Q0pYHiyXLZuza
	 xPnw0SeAZadLE93rr04VxXxb6nVA9cjKqevqkhd1PwvPoYcSsWyh1y32TJHKGVvUGN16U
	 r0DWBPtqjip0X/bUwlNX1Qq36x6iR7VP1JhPT3HO/UQqhcmb+Xi6+iC5/kZawIQohP4tz
	 xIDeEZ63rl924j7MWuBoUaUWem+7L7f6pBLwD6XLne8qPQrSo4YyRJ4pRMLeKAmP4Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795391941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=i8uld7tmFhu1BHNbYnDkojgUSUIEcHmlm+27ijCZsTc=;
	b=iiDGu5A9O7sVrzoLLNV9liAa72MnNZRRK0wcT+rrBVyns2OtuhG+40m5wOIxNlgDwPhT
	 r8dT3g12RhXu/822oy9msBddDGk5EaBVO+qXbZgNlsc/LOOCknnr4a0iwkdAvEvZfjENV
	 oMCbDaqx2ZCC/HrxKE5MMTkndiWIKA8EU2zOFKxOi0bKHeUGuEPvu+rXUkNdBK6tXpnJg
	 MGhApTx8zr36bq9WSkHzAXerLD8uxN29ntXs8PqAUZxoQGV+Hs3TaftmgmE+/gWqWXLmH
	 jAlgLXCYqw8Tv6DFdRD6CQJ9eKVfedPNY7v7J7nf6i2Ll0a2r3rp6RkKOpFgXJWyblg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TyUDCgqY;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7127606A699
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 23:59:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7127606A699
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TyUDCgqY
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-38355b03cb8so2782732eec.0
        for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 15:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795391939; x=1795996739; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i8uld7tmFhu1BHNbYnDkojgUSUIEcHmlm+27ijCZsTc=;
        b=TyUDCgqYty24hwzQiVgzV6cAroGrASGFCo5faG8BLCvvT4N+KN/irtx9tUxtuAPEPC
         UAeX9B1fMex1L+853B7S+4EGCuzKWHqm/jpDHJ4HPWpZ7lia2iknFUM6fZwfF0jZg1gI
         pXfptARV2I9Hl2D3a/Fcik6I2+0pORdptTBDVYvS9gYJ6UwErmgBY+9nsKpDfCqSloup
         d9+cvk4rX8n359+CQz+mk1K0CtIBOHe/SQ5KHixByqZHsvSTE/CtAsVS5ZeXsOhmd8it
         kzuRh+wrE6r1MrvHOUrYdYCzaO85t7V5tdnPQQN7QSIhMP8SCUUBlHtQeGHywbnIwTpE
         H/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795391939; x=1795996739;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i8uld7tmFhu1BHNbYnDkojgUSUIEcHmlm+27ijCZsTc=;
        b=irjiLs5UMofYdaNCC0FfEWUoV3ePJYS7Wzq0yG4CZw0QPSMC2P0+e9K6F/jGSz/l/S
         3DfJabgR1u4x6aHFK0XZ49DBiKXX1ucusRUc4Qk+xdTiwr3Ix4g4u0h2zPMI3Se8YGRI
         FXCCGufb9JG/z9VWEaVr6La2FDbtSRKUBIIVWVYv4yfQ7NEtMUSe5jVnBCEiGZ2wz0p2
         EraJUVP828FaReSKNw4XVlFOFgfas5ai4XfMdq0OWtLMmKTTnaLvQ3vkL+eZ8pkpwX/k
         heUXhQrbhKWA2X24YYAD+z4+Fo8FzdsjwWck7Qpq42/iKJCi/HCKFIqmuN+/3wT2l+ZV
         jung==
X-Forwarded-Encrypted: i=1; AL+hErEmAqlX3UCG/DMo4AzCvdeg7cKMfXvB5a/8wJcVDY8j5YpfdiiQzTP7gbdYTvp4aLlEvlo+3K/myS+XLn8/X/c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1ljW5CcfYylKkKZbUpPi8C4w+modC1Rmu6KnwcgL17RbAiTzo
	CXoGpAyoOSE75oeBlQcb7G32tXWKwTpNI78N9jjA25xO9wjnUmBL792/b0DoOCbTu8jlqbdgoN8
	XwQUJNAUI5A==
X-Received: from dyclv5-n2.prod.google.com ([2002:a05:7301:6185:20b0:351:4a2a:1ece])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:1505:b0:384:df31:6a07
 with SMTP id 5a478bee46e88-386a87efea0mr3258907eec.30.1795391939090; Sun, 22
 Nov 2026 15:58:59 -0800 (PST)
Date: Sun, 22 Nov 2026 15:57:50 -0800
In-Reply-To: <20261122235757.3456048-1-irogers@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261122235757.3456048-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261122235757.3456048-5-irogers@google.com>
Subject: [RFC PATCH v1 04/11] objtool/ibt: Ignore .eh_frame relocations during
 ENDBR validation
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
	nathan@kernel.org, nsc@kernel.org, linux-kbuild@vger.kernel.org, 
	ojeda@kernel.org, rust-for-linux@vger.kernel.org, ardb@kernel.org, 
	linux-efi@vger.kernel.org, maz@kernel.org, oupton@kernel.org, 
	kvmarm@lists.linux.dev, shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	indu.bhagat@oracle.com, jremus@linux.ibm.com, wnliu@google.com, 
	dylanbhatch@google.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

When vmlinux.o is built with -fasynchronous-unwind-tables and
CONFIG_X86_KERNEL_IBT=y, .eh_frame FDE headers contain PC-relative
relocations referencing function start addresses across .text. Because
.eh_frame is read-only unwind metadata rather than executable code or
indirect branch targets, skip .eh_frame* sections during objtool's IBT
relocation validation alongside .orc_unwind_ip and DWARF .debug_*
sections.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/objtool/check.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 931c5c412f15..e631b0da9bad 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -4644,6 +4644,7 @@ static int validate_ibt(struct objtool_file *file)
 		if ((!strncmp(sec->name, ".discard", 8) &&
 		     strcmp(sec->name, ".discard.ibt_endbr_noseal"))	||
 		    !strncmp(sec->name, ".debug", 6)			||
+		    !strncmp(sec->name, ".eh_frame", 9)			||
 		    !strcmp(sec->name, ".altinstructions")		||
 		    !strcmp(sec->name, ".ibt_endbr_seal")		||
 		    !strcmp(sec->name, ".kcfi_traps")			||
-- 
2.56.1.750.gf70dc682cf-goog

