Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFF32F99B8;
	Fri, 23 Jan 2026 16:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769187283; cv=none; b=OQdMyxT/uk4S+NpRriK+6oNQMKCzdNRxQ8BmdDW7KYd03LTu89B6A8sBMwApjQaEPEjoZ3/0bnQa8KbMU9SWLtqYiLaw1Tbnkem0SFsfg0Jqa/SlTzLt7RSff58fp5WTb/5hHp49E/BMvf0LKyqJqF6fyxokv+7AHUQ5bfewbaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769187283; c=relaxed/simple;
	bh=dcdgcvzksyA44DPfdDiLmioNEBzmmaG06TpaVrqCbys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YLZm4ArXhBsvJl8+BudhGMP9yNbVsTns2n2r8YuVDsKLxLtzyxXTkPUBekTdKHlo1Yrq9A/U6yOVSURVT005x1rmInq+ydYqHrqwnsSvc2IDM841vD+3k45N+cnZAFN8LulxkvYCnxH2qbx9EAala8309vJXHjuyXzUxG/QG9+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=KKYZi+me; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="KKYZi+me"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 63AB040E02D3;
	Fri, 23 Jan 2026 16:54:35 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 5Fu2ronh7MNX; Fri, 23 Jan 2026 16:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1769187271; bh=Bv2ma5KBq4bspQWSpDa02s9evegzO+cxPphWiYG8BfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KKYZi+mecsWR2hycSSywji/RAqqdo3n/dLo1SZmbpBPD8DU8Xz8Tuj0arTLbj9JRj
	 ms5GsnAhCWa3s2vhEF3Zll4/j3tG8YlyhzZy5e94AAdR3K9Hl35VEreLngkmRr0zpD
	 blKTqa24GIFWaxqleU+5TiWhu5jQEcanI1djAazeSkRChTerOxjlXvmDBPq6efGaZD
	 +MA5zHAnVhHdbFuzd4iWLMcCOc72PL2GtMa0ZVWVER7A4bjiBPbqINTuVeJt5vR/sK
	 JT0/DkdXuUCXFaDuObJjR6plGjs42C6IrknMWhTadL9AR/EkNhF22CTGRk1DqZcUTJ
	 zqAJ0tbzrxJGxKjDAcmvHyN3r35r4vOE4ne14WapgkKpm1J/wFlKXeNCB0UoB6z2co
	 qwna2rVQOAZu9QE15UjAfX24HcHorj1s0qSPSDS2b/WdHgdH7j59ULuvrFVGGxIWHw
	 8JEbVcNsRoa1UTcDrYO3u4C0+wtXTNJYD36SnKBVFZYgZ4k0TS3XHkCV3CS1OSxEUz
	 k5dSn9b5F59FtM2CVhrWob3vzHNuUFby8dy/38Zu1ZXerVG12V2CP1f4Pr+H/ANqd5
	 IZCASrnPSYsR1bQclW4UgLiRhtxXlqc+akHDFDSvs00Qhe5bxxaLJik76AjNKrZ6xf
	 R2CAneR8+rmBywWwM+qkrFwo=
Received: from zn.tnic (pd953023b.dip0.t-ipconnect.de [217.83.2.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 4C15140E0028;
	Fri, 23 Jan 2026 16:54:17 +0000 (UTC)
Date: Fri, 23 Jan 2026 17:54:11 +0100
From: Borislav Petkov <bp@alien8.de>
To: Slawomir Rosek <srosek@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>,
	Betty Zhou <bettyzhou@google.com>, Wake Liu <wakel@google.com>,
	Kazuhiro Inaba <kinaba@google.com>, Jeff Xu <jeffxu@google.com>,
	Alistair Delva <adelva@google.com>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v1 1/2] selftests/x86/ldt_gdt: Skip int80 if not supported
Message-ID: <20260123165411.GBaXOns6lupfE0pxX-@fat_crate.local>
References: <20251217135932.3153847-1-srosek@google.com>
 <20251217135932.3153847-2-srosek@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251217135932.3153847-2-srosek@google.com>

On Wed, Dec 17, 2025 at 01:59:31PM +0000, Slawomir Rosek wrote:
> The IA32 Emulation support can be either removed from the kernel,
> disabled by default or disabled at runtime. The x86/ldt_gdt selftest
> crashes for all of above thus is_32bit_syscall_supported() helper
> is added to skip int80 syscalls if they are not supported.
> 
> Signed-off-by: Slawomir Rosek <srosek@google.com>
> ---
>  tools/testing/selftests/x86/ldt_gdt.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/x86/ldt_gdt.c b/tools/testing/selftests/x86/ldt_gdt.c
> index bb99a71380a5..b178392e50c0 100644
> --- a/tools/testing/selftests/x86/ldt_gdt.c
> +++ b/tools/testing/selftests/x86/ldt_gdt.c
> @@ -62,6 +62,18 @@ static struct user_desc *low_user_desc;
>  static struct user_desc *low_user_desc_clear;  /* Use to delete GDT entry */
>  static int gdt_entry_num;
>  
> +static bool is_32bit_syscall_supported(void)
> +{
> +#ifdef __x86_64__
> +	return system("((zcat /proc/config.gz | grep CONFIG_IA32_EMULATION=y) &&"
> +		"((test -z $(zcat /proc/config.gz | grep CONFIG_IA32_EMULATION_DEFAULT_DISABLED=y)) || (grep ia32_emulation=true /proc/cmdline)) &&"
> +		"(test -z $(grep ia32_emulation=false /proc/cmdline))) >/dev/null 2>&1"
> +	) == 0;
> +#else
> +	return true;
> +#endif
> +}

Hmmm, so, my gut feeling tells me that we need a proper ia32 emu support
detection in the running kernel. I can't find one after a short grep, maybe it
should be in /proc/cpuinfo, maybe it should be a syscall which fails when
IA32_EMULATION is off or maybe ptrace(2) says somewhere in the depths of its
countless ops that it does support IA32 emulation.

And then you could put that in that helper and then put that helper in
a header and not copy it in every test...

I'd say.

Thx.


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
