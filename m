Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4953C28726E;
	Mon, 25 May 2026 17:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779730458; cv=none; b=VMm/lHyhFT4lEsDyQ3hkgjGpI5r0GgnuS950IGTCCmC85irCLeIDDkACmGCCovTTV1UX0PethDAZKt7IJN3Cc/SMAs6QqRKAqfpRLoehvUHbrtQou1oB+efa3DZOmMG145fHU4/5UuoGttgUqYKkzAX5WJCrzhczl6e+p10lHvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779730458; c=relaxed/simple;
	bh=sKl3qZJ6GX3XQjTIHccmP5Sdkb4JM31VmCxrSx/UGHw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VgomgY13WuFEIBk3pJehy6JOKu4T33pBTSoHv+oSb6o36UZBqdVyONFTO9aIzXadiUAxXhnvVK2Kq+SQ6zlcMm1esMcQ066QFnAHeGHjn8v+0gjELM5WY5uD+alPoOBePcfGeJnXU1X7R+pbUFc+kXBSNMGEtSKErIIY6WKm7og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BLRQc51x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BLRQc51x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 793A91F000E9;
	Mon, 25 May 2026 17:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779730456;
	bh=C+TFxqIXPU3VCPLnw7RW5OtUkFdNMFAF+NsqUfzupL4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=BLRQc51xnmjpgz7uLm3xMNEwcc1GYJVNNP7dDwDxorp/cxpwTcS5L9pSBA/55VMS2
	 n7FFwqL0UekJmAS3JpvGt7HRhu0m1d/50P0JAx5ozgQx5rgfmmsAuQPHAlr20cQEee
	 umscdxKjF/t31OQDGxK+wHqCFnZwvRueEx2gU01rnZo2wIgo+KqiVA7Vm4ywE+6yOy
	 QhpULFvc7mtx7R/IOyoYCej9/9eZRaJVrRPB1KOZ/XBbpwuOCbbToRWNWR7DWhqaWc
	 TGv6trHHWpX3PrJHUhdg+ObhA8ZLpHkZbwzc0quM8Mbb41lRlRhXX+iGNAGDathkVt
	 Dww60ge05YMjw==
From: Pratyush Yadav <pratyush@kernel.org>
To: George Guo <dongtai.guo@linux.dev>
Cc: chenhuacai@kernel.org,  rppt@kernel.org,  pasha.tatashin@soleen.com,
  pratyush@kernel.org,  kernel@xen0n.name,  graf@amazon.com,
  shuah@kernel.org,  loongarch@lists.linux.dev,  kexec@lists.infradead.org,
  linux-mm@kvack.org,  linux-kselftest@vger.kernel.org,
  linux-kernel@vger.kernel.org,  George Guo <guodongtai@kylinos.cn>,  Kexin
 Liu <liukexin@kylinos.cn>
Subject: Re: [PATCH 1/7] LoongArch: Add KHO basic support
In-Reply-To: <20260525062810.103367-2-dongtai.guo@linux.dev> (George Guo's
	message of "Mon, 25 May 2026 14:28:04 +0800")
References: <20260525062810.103367-1-dongtai.guo@linux.dev>
	<20260525062810.103367-2-dongtai.guo@linux.dev>
Date: Mon, 25 May 2026 19:34:13 +0200
Message-ID: <2vxztsrv5r6y.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, May 25 2026, George Guo wrote:

> From: George Guo <guodongtai@kylinos.cn>
>
> Enable Kexec Handover on LoongArch64:
>
> - Kconfig: select ARCH_SUPPORTS_KEXEC_HANDOVER for 64BIT
> - machine_kexec_file: add cmdline_add_kho() to pass the KHO FDT and
>   scratch buffer addresses to the next kernel via the "kho_handover="
>   command-line parameter
> - setup: parse "kho_handover=" early and call kho_populate() to hand
>   memory regions to the KHO core
>
> Co-developed-by: Kexin Liu <liukexin@kylinos.cn>
> Signed-off-by: Kexin Liu <liukexin@kylinos.cn>
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> ---
>  arch/loongarch/Kconfig                     |  3 +++
>  arch/loongarch/kernel/machine_kexec_file.c | 22 ++++++++++++++++++
>  arch/loongarch/kernel/setup.c              | 27 ++++++++++++++++++++++
>  3 files changed, 52 insertions(+)
>
[...]
> diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
> index 5584b798ba46..ddf4d0e0e7fd 100644
> --- a/arch/loongarch/kernel/machine_kexec_file.c
> +++ b/arch/loongarch/kernel/machine_kexec_file.c
> @@ -55,6 +55,24 @@ static void cmdline_add_initrd(struct kimage *image, unsigned long *cmdline_tmpl
>  	*cmdline_tmplen += initrd_strlen;
>  }
>  
> +#ifdef CONFIG_KEXEC_HANDOVER
> +/* Add "kho_handover=<fdt_size>@<fdt_addr>,<scratch_size>@<scratch_addr>" to cmdline. */
> +static void cmdline_add_kho(struct kimage *image, unsigned long *cmdline_tmplen,
> +			    char *modified_cmdline)
> +{
> +	int n;
> +
> +	if (!image->kho.fdt || !image->kho.scratch)
> +		return;
> +
> +	n = sprintf(modified_cmdline + *cmdline_tmplen,
> +	    "kho_handover=0x%llx@0x%llx,0x%lx@0x%llx ",
> +	    (u64)PAGE_SIZE,               image->kho.fdt,
> +	    image->kho.scratch->bufsz,    (u64)image->kho.scratch->mem);
> +	*cmdline_tmplen += n;

Do you have nothing else for a bootloader to pass data to the kernel?
Passing this via the command line seems crazy... All these addresses are
now available directly to unprivileged userspace. Can't you use the
device tree like we do on ARM64?

Also, this commandline parameter isn't documented anywhere.

> +}
> +#endif
> +
>  #ifdef CONFIG_CRASH_DUMP
>  
>  static int prepare_elf_headers(void **addr, unsigned long *sz)
> @@ -220,6 +238,10 @@ int load_other_segments(struct kimage *image,
>  		cmdline_add_initrd(image, &cmdline_tmplen, modified_cmdline, initrd_load_addr);
>  	}
>  
> +#ifdef CONFIG_KEXEC_HANDOVER
> +	cmdline_add_kho(image, &cmdline_tmplen, modified_cmdline);
> +#endif
> +
>  	if (cmdline_len + cmdline_tmplen > COMMAND_LINE_SIZE) {
>  		pr_err("Appending command line exceeds COMMAND_LINE_SIZE\n");
>  		ret = -EINVAL;
> diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
> index 839b23edee87..5934ba6f13e3 100644
> --- a/arch/loongarch/kernel/setup.c
> +++ b/arch/loongarch/kernel/setup.c
> @@ -48,6 +48,7 @@
>  #include <asm/setup.h>
>  #include <asm/time.h>
>  #include <asm/unwind.h>
> +#include <linux/kexec_handover.h>
>  
>  #define SMBIOS_BIOSSIZE_OFFSET		0x09
>  #define SMBIOS_BIOSEXTERN_OFFSET	0x13
> @@ -227,6 +228,32 @@ static int __init early_parse_mem(char *p)
>  }
>  early_param("mem", early_parse_mem);
>  
> +#ifdef CONFIG_KEXEC_HANDOVER
> +static int __init early_parse_kho(char *p)
> +{
> +	phys_addr_t fdt_addr, scratch_addr;
> +	u64 fdt_size, scratch_size;
> +
> +	if (!p)
> +		return -EINVAL;
> +
> +	fdt_size = memparse(p, &p);
> +	if (*p++ != '@')

Can you please wrap these in parenthesis? I am too dumb to remember all
the precedence rules and this immediately makes me question whether we
are doing (*p)++ or *(p++).

> +		return -EINVAL;
> +	fdt_addr = memparse(p, &p);
> +	if (*p++ != ',')
> +		return -EINVAL;
> +	scratch_size = memparse(p, &p);
> +	if (*p++ != '@')
> +		return -EINVAL;
> +	scratch_addr = memparse(p, &p);
> +
> +	kho_populate(fdt_addr, fdt_size, scratch_addr, scratch_size);
> +	return 0;
> +}
> +early_param("kho_handover", early_parse_kho);
> +#endif
> +
>  static void __init arch_reserve_vmcore(void)
>  {
>  #ifdef CONFIG_PROC_VMCORE

-- 
Regards,
Pratyush Yadav
