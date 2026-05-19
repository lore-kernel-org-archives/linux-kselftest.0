Received: from mail-108-mta224.mxroute.com (mail-108-mta224.mxroute.com [136.175.108.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEB83ED3AB
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 13:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779196801; cv=none; b=MoDafv88KQGN2hbK3+gmZfN++bT8HamloWi3MkV8yBYHZmjvgo79s6qFBDVmx9cJ18xwtKKbFJHUwfrHN1dDMsxySA2VlwyH86xEht7JOptPHqXMuqA32UoJOHlCMJwFH+3nggqMDyMFgbO0sLxcPCgxRFhsJDU//uGcw109PoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779196801; c=relaxed/simple;
	bh=7agi6H0+Rwc3XPoRG2oJXlm/cXh7VkrCvKUxNMYowGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FzjRi4jW9m/bSfclorfCAkBN9d8jGrPxdCEyV7nKsZuvswS2R5iCvUWbUaYu6loSFWWoSXFrkomWsHOayKACQMGEe/3hJAxbotRF3B9SVq5Mt4yBUWwA8caR5cWRpFfz8gGRHflD4TWt936Pz0/OhXJp4+h+P/TmQ3mf2xEHAVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b=OTFXNPuP; arc=none smtp.client-ip=136.175.108.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b="OTFXNPuP"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta224.mxroute.com (ZoneMTA) with ESMTPSA id 19e405fda1600067f7.00e
 for <linux-kselftest@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 19 May 2026 13:14:44 +0000
X-Zone-Loop: defba1baa79b0ffa0ad2a22b0a998fd770cf04c07160
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc
	:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=wJgkN/kB4QKRM+t/h307nbO9m47Uz4y5IRxBD/CeA+Q=; b=OTFXNPuPKsWEXT3mv1lZIP7dzY
	GzofJXI6VzueLQZksqg2HgZAxmUwRL+HoCPNgYDOQjQ6/BFi255DRoHKNfa3RhMwWEl1b5Aqr17iS
	l0nR7MQ6D3FkxTnUz4/RUHkvgY9Z+CWhzY/bXRZaVsjhMpqgrZ+WOPLIagR/rPWlYeJPT/E3L7pz8
	FgWQ8QuPkLxeqpe5jhJ9FErFBkVhpnPpiTCadMfJXIypYQ79cDLXsDmDHebblPLKO2EqnutiLajVv
	k5nuo1sKMe9BENhYtYw4auylf4YusKw1/whUozpgT3fKcXrFuwX2Ad6gGlWQsPZeJi20FScoYffEq
	wakkLrlw==;
Date: Tue, 19 May 2026 13:14:33 +0000
From: Richard Patel <ripatel@wii.dev>
To: David Laight <david.laight.linux@gmail.com>
Cc: x86@kernel.org, Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>, Kees Cook <kees@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] Usermode Indirect Branch Tracking
Message-ID: <agxiORpLBErOxLin@wii.dev>
References: <20260517183024.16292-1-ripatel@wii.dev>
 <20260519103345.49e52ceb@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519103345.49e52ceb@pumpkin>
X-Authenticated-Id: ripatel@wii.dev

On Tue, May 19, 2026 at 10:33:45AM +0100, David Laight wrote:
> Isn't using 'notrack jmp *reg' for jump tables actually more secure?
> If an attacker can write code it doesn't matter.
> The jump table in is RO memory so can't be written.
> But if there are ENDBR on all the jump table targets they become
> possibly useful code addresses to arrange to write into some RW
> function pointer table - which might be useful.

You're right. I was worried about an invalid jump table index at first.
Clang 22 happily optimizes away jump table index bounds checks. GCC 16
seems to be more careful. We should probably patch LLVM to never
optimize it away, e.g.:

	// funny.c
	// clang -c -fcf-protection=branch -O2 -o funny.o funny.c
	// objdump -d funny.o -M intel
	int t0(void), t1(void), t2(void), t3(void);
	int funny(unsigned long target) {
		__builtin_assume(target < 4);
		switch (target) {
		case 0: return t0();
		case 1: return t1();
		case 2: return t2();
		case 3: return t3();
		}
	}

	// Clang 22
	0000000000000000 <funny>:
	       0: f3 0f 1e fa                  endbr64
	       4: 55                           push rbp
	       5: 48 89 e5                     mov rbp, rsp
	       8: 3e ff 24 fd 00 00 00 00      notrack jmp qword ptr [rdi*8+0x0] // vulnerable
	      10: 5d                           pop rbp
	      11: e9 00 00 00 00               jmp 0x16 <funny+0x16>
	      16: 5d                           pop rbp
	      17: e9 00 00 00 00               jmp 0x1c <funny+0x1c>
	      1c: 5d                           pop rbp
	      1d: e9 00 00 00 00               jmp 0x22 <funny+0x22>
	      22: 5d                           pop rbp
	      23: e9 00 00 00 00               jmp 0x28 <funny+0x28>

-Richard
