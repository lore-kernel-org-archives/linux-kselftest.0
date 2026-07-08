Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BCF3BB673
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 03:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783481794; cv=none; b=DXFNjeH/ZmmBssq3PpgrITsb4dqdpSMtHMBLPD4+67IbQe/G/W75nJ/2c84POzoPPUB6z0OqnUyfsEJRWCsZcEsfACiA0YF+XXtN2yuMweVZUXAFHHEX3akJlzFyiXkzrlIgpD8JKavhTyXBXaeLSc+sw4Ssr92jDJfxTO6Fpvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783481794; c=relaxed/simple;
	bh=DCPKi33NYT6bX9zlswitk1aeo+c7wEE6BumaxclqcxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fgBu6N8oTsQejC5AhUzEsbDnF+4QCDzEP6OzgazzPcgxT0l+nCfXGwx2uDanDUO1To13k2d+aKWeFIB/9/4g1pqSIfPdenlnInogRtlRhA2EnHxd3RzJAmgAPs/+DfPkRLf1iQGbIDDLUSJsJPk+TCFQQUqpqltpfqGJ60+Tm5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lri5tohc; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lri5tohc"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-388b404ea89so272943a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 20:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783481791; x=1784086591; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7uwJLmhKNEIHTwQycd7laGxNA3BK/zUUdv4a0SBN/M4=;
        b=Lri5tohcjBZunv9ewOIov+3BKrwWekZrFv+MSdaPFYkQnkipWHzIQHMCWyO0xDWjht
         aCBir20aA/kFrGhJL1PxQAxXm4NqEx43iesFJLKTGpJo3Y6gWGvCQizIQLV6wwn+Qw9z
         InyyM3eapUlXXGMzkhJBV71txHQ+Ruktu5XM7dUvzWoMF+mvDF/ixB4qgf5pHQrCVTQ5
         D3xG8YOB4yGRaFCFWl1HzTUs3NtqReL/dRl+PUIph3SW/17Q8zyG4asRn6K1irnF1AGi
         WHrK7pUZmK9WJ4O9V+FXJWxJVBw0k4Cp4cr7foxBVT9X57Iaq0dLr4cPFgT5pIDA5DM1
         nx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783481791; x=1784086591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7uwJLmhKNEIHTwQycd7laGxNA3BK/zUUdv4a0SBN/M4=;
        b=K4rpdhOlnr2MaOY2XV9uuTCXdJOPLBK7PEEtOz4W9bv47oGtc99OLo+B+fzBXuX9Cy
         Tu3HtfsSytt5GQjfVNsQ3pb8cO3XCdepXpEzeRF7q7Zvtd0tCzee/JsfF3ezsLRNjaPM
         qYS2DHmDWSGh8ZQzs824/n+KYMoIs8TNN6mFqjpH0JuiCYL5hLtr9r5YBDdaoMFwT7sf
         ry+uNP25QJCxDf3iLFXFhYyLY9pB6uoEWBv4HoWalhpmn3uBH5AvLAtdYgB73Z3gXGeB
         7Zf0X7c8fwsXXMviLyAuMT9QuKv6Qc+8VW2FCHFIKPkP/siWkQZZojIAUMXWn3iogP/+
         PzUQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqm7TLn5W11SuVLhOtaUoYdsrdUYd/8Rs+o/4Dymm5Ss9sxFC3MvCdtPSeHQVbk6gxMzk9yUg+5KrwvQeczS7g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2qS8He2WyRs70pK9hMS+3vptrW9I7yDA+z8jjkEHAX/NrLXXT
	qU/i+6gS2XGNCFMeX+aYxHc4Ei5LZJtcwqIlYoseyqxhG4TroCY2694k7omOb4g/
X-Gm-Gg: AfdE7cnNCm6VqhtRpusQYBxbYTHtF91PpvzqNP8eReTGsUQOHXdA/pi0V62GEtmAVgw
	uKgYG5yes8TPVERMqRDdSgW/Ag8PWbWN6KWLEPrjevxqPfHs5UW9dp8SiXd4LrM8BdDYDax8CH5
	gu17621XW3GgRH46iZzxAEydtEC31JmiPchJ2wbDMVXAPP0lNu1BRhuu4jkvhHfYFsSPX4MjD8M
	7GKYoy1LJXpzohTTIhypfIkYuyXmLU2CPE2QGNteOEtJktNg42Gf1pW5ERk/OvWt35iA6oadMig
	DqmMkqoW0GKfiUoFK1YJeRdQM2LYew8nak+v+OWc1F02mH3DKlk2t3g+l7Q1LA3YB38tk5cJES7
	liLjUW8o5atOvodNJ7q6jNGcAFlG6DSue5PlQUPebHPZ+l/+UDKOW8Xs1BUQ3UMlwSAAjANTssu
	LtHZelL9AfLWaK2tathUBtXWT9y1nJFgcaWDro3Hs=
X-Received: by 2002:a17:90b:5544:b0:36b:de66:92c3 with SMTP id 98e67ed59e1d1-387d880b730mr5823258a91.10.1783481791130;
        Tue, 07 Jul 2026 20:36:31 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accae5sm21092850eec.29.2026.07.07.20.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:36:30 -0700 (PDT)
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Tue, 07 Jul 2026 20:34:30 -0700
Subject: [PATCH v3 07/17] riscv: Maintain epc on misaligned emulation error
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-riscv_insn_table-v3-7-3f8e5f75ba97@gmail.com>
References: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
In-Reply-To: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Nam Cao <namcao@linutronix.de>, Alexandre Ghiti <alex@ghiti.fr>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Conor Dooley <conor@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>, 
 Jesse Taube <jtaubepe@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783481777; l=1589;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=DCPKi33NYT6bX9zlswitk1aeo+c7wEE6BumaxclqcxQ=;
 b=zvComs8b88dWvy8jLEjCRmfCDTkUEyxqVH8c14cT2/SUZEuhkK2O/aL6Gz7C5H53JvlCy3eJM
 ZgtW3tHJOY9B6zTgPHaM+IBbpBPY7YSN2Dmbugepwe7vF4SZTq+lmse
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=

Currently the epc is set to zero when there is a misaligned emulation
error. This will print a misleading error message with the current epc
value of zero instead of the epc value that triggered the emulation.
Avoid setting epc to zero to maintain the state of epc.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 arch/riscv/kernel/traps_misaligned.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 81b7682e6c6d..524215a186e0 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -238,8 +238,6 @@ static int handle_scalar_misaligned_load(struct pt_regs *regs)
 	if (get_insn(regs, epc, &insn))
 		return -1;
 
-	regs->epc = 0;
-
 	if ((insn & INSN_MASK_LW) == INSN_MATCH_LW) {
 		len = 4;
 		shift = 8 * (sizeof(unsigned long) - len);
@@ -303,7 +301,6 @@ static int handle_scalar_misaligned_load(struct pt_regs *regs)
 		shift = 8 * (sizeof(ulong) - len);
 		insn = RVC_RS2S(insn) << SH_RD;
 	} else {
-		regs->epc = epc;
 		return -1;
 	}
 
@@ -349,8 +346,6 @@ static int handle_scalar_misaligned_store(struct pt_regs *regs)
 	if (get_insn(regs, epc, &insn))
 		return -1;
 
-	regs->epc = 0;
-
 	val.data_ulong = GET_RS2(insn, regs);
 
 	if ((insn & INSN_MASK_SW) == INSN_MATCH_SW) {
@@ -405,7 +400,6 @@ static int handle_scalar_misaligned_store(struct pt_regs *regs)
 		len = 2;
 		val.data_ulong = GET_RS2S(insn, regs);
 	} else {
-		regs->epc = epc;
 		return -1;
 	}
 

-- 
2.54.0

