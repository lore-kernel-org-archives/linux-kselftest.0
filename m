Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93512DCF57;
	Fri,  3 Apr 2026 18:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775239523; cv=none; b=gJYBf5zXAbT3xy3Yze1+IQFjk6EezgB4Q7GYZCiYZ8XqisvusElhYRhcwvzuZiRCtQKfqPDBtwfkCk9AQldePnBt2iMAniEJb5CF67Gq2FNsIogb9P3Np96pKeKSMKE8EYKb10aVFOLMpqnXNlsIty4gshv6wU1lkY5PWqQVnm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775239523; c=relaxed/simple;
	bh=ro02FtIJr36x2ibFmDyHfIlKaI44RwN4ZHheO9b6kZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j1R9wrAdcy+LFiYD4zbI1pqfm6lWIzbZyqGaVvKERCBPflKpRuvXhQjm83CTDjZvMVldCeQMJvlSI2NBEtMg9b/MiZEbuWDWkRh0emT4dCttaTL+PKE6qKm6rvbgMmmDryutHJ+qQ9hZQtTTfz4/l5Tw9iIj66zVwPxPXxP48io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=UeTHbTDS; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="UeTHbTDS"
Received: from [IPV6:2601:646:8081:9481:131a:c8a1:d20e:30b7] ([IPv6:2601:646:8081:9481:131a:c8a1:d20e:30b7])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 633HWgxg3320304
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 3 Apr 2026 10:32:43 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 633HWgxg3320304
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026032601; t=1775237566;
	bh=e3cR/vToF5Ce/MEbtXk/yw4r80dGioZbyZEkOk9IysM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UeTHbTDSW7NXOxSqySW1Fe9AXp/XbsTTuQ7PecZRfRcXUHUIq0U5C3aovkkizjDpG
	 DWGSm+LGnHY9TJZQqTIVYPg6fJM8K8IVTlnaSolp1Z90hw224PFQXFsjuXkPi95szg
	 P9gnDHvPbCAlY32pirFka5ovuiS2unXtMwk1GNZBpwyKilk6kuvWM9NUtPapyPP5Uv
	 IIUp1Nhbz02EdY+bMV8FpsgOKUPN0c5FKZTBtw/49EbwnQqUaeHkoMAIBNOvss0CC+
	 Fp5Lh9cNjXOit8lwnI8ZhfrUrPmnQ/a7LgOcOKSW35KvkflWDjM6AZeqFgtCxzP8Rc
	 VX1omFB5tVVeQ==
Message-ID: <9e27aab2-7975-4f5f-b952-90e30be26caa@zytor.com>
Date: Fri, 3 Apr 2026 10:32:37 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] selftests/x86: Fix sysret_rip assertion failure on
 FRED systems
To: Andy Lutomirski <luto@kernel.org>, Xin Li <xin@zytor.com>
Cc: Yi Lai <yi1.lai@intel.com>,
        "Peter Zijlstra (Intel)"
 <peterz@infradead.org>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        the arch/x86 maintainers <x86@kernel.org>,
        Khan Shuah <shuah@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-kselftest@vger.kernel.org, yi1.lai@linux.intel.com
References: <1D8D9EE4-D652-4E09-86C2-2D3FAB151100@zytor.com>
 <B916BEC6-D778-46FF-8271-D6BE6EBD042B@zytor.com>
 <C318F823-C3B9-49D1-8048-C57E34538F4D@zytor.com>
 <bd0caa85-f92c-4c06-ba8a-0b3a80f00f5b@app.fastmail.com>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <bd0caa85-f92c-4c06-ba8a-0b3a80f00f5b@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026-04-02 06:21, Andy Lutomirski wrote:
> 
> I don't really agree.  For quite a few years now, we've tried to make the exit path uniform, and we have this logic in syscall_64:
> 
>         /* SYSRET requires RCX == RIP and R11 == EFLAGS */
>         if (unlikely(regs->cx != regs->ip || regs->r11 != regs->flags))
>                 return false;  <-- fall back to IRET
> 
> and this is not just an aesthetic thing -- it allows us to have deliver signals and implement things like sigreturn without needing to track extra flag bits that mean "well, actually, we're in the syscall *code* but we're not returning from a syscall any more".  We had that a long time ago, and it was extremely difficult to understand and maintain.
> 
> So, on current kernels and kernels going back, I dunno, 10 years (I didn't try to dig out the git history, but I did write much of this code...), the semantics have been that we return to usermode in a state that matches pt_regs as precisely as we can arrange.  For the one case where we have a very longstanding divergence between entry and exit regs, we have orig_ax.
> 
> So it would be at least a fairly large maintainability regression to make the non-FRED SYSCALL behavior modify rcx and/or r11 on exit.
> 
> Now we have FRED.  Sure, it would be nice to remember the entry RCX and R11, but if we want to avoid the footgun where the effect of SYSCALL is different on FRED and non-FRED hardware, then we need the context after entry completes to have regs->rcx == regs->rip and regs->rcx == regs->flags (or perhaps RCX and R11 differently poisoned, but that seems a bit silly).
> 
> If we really want to have the option to fish the original rcx and r11 out from somewhere or perhaps to have extra-bonus-efficient many-parameter syscalls (I'm not sure why), then we could add orig_rcx and orig_r11.  Or we could invent a time machine and fix SYSCALL when it first came out.
> 

I certainly see what you're saying. I still don't like the idea of clobbering
registers "just because" for this reason and more...

	-hpa

