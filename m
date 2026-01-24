Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6B04964F;
	Sat, 24 Jan 2026 01:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769216553; cv=none; b=oFT31iKxV9fHPGON3Atb9B5R3ctJH7ArXtbaW5HSJGgcJUxQOvjtMZJSfRRGVemntgAFY8JqiKIITSgFdfANj458+wUXLSohAIIYhVieoAKAgop88rZO71OacCCNBYa6bfYJT8sNWufFwzotKPDLqwKN/Z42VCVWpOhnVV9qOVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769216553; c=relaxed/simple;
	bh=zfNT0GmmT3uIR4tY1l6mlxkkGP0oUU+HlcnPktMcexQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YSBq5y0OzHt/HmsJfxJJu10IadqDU054ebGJ+OygWbu50L5AiGyTatq6zKlUCsSGFO7uknRIlOQm8+ay4gUaepYpPOhZmuOm3xA93iyPvaPDDXsnpq2hyAj4BpS1rQmgyHsSVbzKU9Rh0Rf0zP11V6Eph6l+5CSyZjzswqZJwh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=asVP7KzH; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="asVP7KzH"
Received: from [172.27.2.41] (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 60O11eYG1211899
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 23 Jan 2026 17:01:50 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 60O11eYG1211899
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025122301; t=1769216510;
	bh=lu3mgV5ty1Zv0VmuX2IQ5z0rOK/9ys0SYP2Xdf3bET8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=asVP7KzHj0i4USGwkVWsBQBgDXhZJERHFBl7eWa2GHuQwXD21OwXejbyJeeHw+gYt
	 LOtL71TfzDfKewp+VnVG7uqo8gWLLhgeDASvmQ5XRSpDyhtlzK48svUt3fJig/51Dz
	 9ZGhKFviggx05ubvFWmiRtTRK3vE6UXXRvXXFVHuAZxkrRrrYgnTxGYnDIYF6ZJuO/
	 T8krwRoJ3EZTNsrJMjAQhrZ0D3yXCoFhJtNpzhelnByNbzd6N3N1usXWVgSAAPrR64
	 GJx8/h2miYd/sYX9+oEsrEA9q1ihyV4E8HLMF3zqZqC6OVYoTfIdu4Z/INjExvxGK3
	 +R8jJ5QQt3/7w==
Message-ID: <3e36b3d2-ab20-482e-b35d-0540f950eb72@zytor.com>
Date: Fri, 23 Jan 2026 17:01:35 -0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] selftests/x86/ldt_gdt: Skip int80 if not supported
To: Borislav Petkov <bp@alien8.de>, Slawomir Rosek <srosek@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Shuah Khan <shuah@kernel.org>, Betty Zhou <bettyzhou@google.com>,
        Wake Liu <wakel@google.com>, Kazuhiro Inaba <kinaba@google.com>,
        Jeff Xu <jeffxu@google.com>, Alistair Delva <adelva@google.com>,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20251217135932.3153847-1-srosek@google.com>
 <20251217135932.3153847-2-srosek@google.com>
 <20260123165411.GBaXOns6lupfE0pxX-@fat_crate.local>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20260123165411.GBaXOns6lupfE0pxX-@fat_crate.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026-01-23 08:54, Borislav Petkov wrote:
> 
> Hmmm, so, my gut feeling tells me that we need a proper ia32 emu support
> detection in the running kernel. I can't find one after a short grep, maybe it
> should be in /proc/cpuinfo, maybe it should be a syscall which fails when
> IA32_EMULATION is off or maybe ptrace(2) says somewhere in the depths of its
> countless ops that it does support IA32 emulation.
> 
> And then you could put that in that helper and then put that helper in
> a header and not copy it in every test...
> 

You can probe for it by trapping SIGSEGV and calling int $0x80. Not exactly
pretty, but...

Making it a sysfs entry would allow dynamically control it, too...

	-hpa

