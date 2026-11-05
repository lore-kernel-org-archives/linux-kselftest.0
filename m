Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884027;
	b=3zUANucqoZ7m3LIRF3aV/X+lHs7WHb1Swgzn8jkrw1dcLa4l/2x+wQ8JMsum91ECJ+e5
	 vpgB/ULCwkzzOaaZUds+za38KnLwRMorIdkzgb4x93Fvl5qxZbPK+2FLBqhuNRmEW0dYB
	 VsRilCwaD0zdGTmURYkGKmXZbq8WBd/j1GldCaG1hlK/2owD7V4GGX10BYS7ZFgOMMv5W
	 IjPp033K3ZKP6Hh1wrHJKJ5tDRw8iSh8XtTH4QCcFAFcGwRGBQoZMR/VUj3vu7bbdg70S
	 cuOt2u77GeeKzr0VqDWmuAP1pKcYGuBV2/55AnTY1HdNPmAP568fnxn/bxjvMUShYjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884027;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=1jOK42kEV/R7k8n51sIGLXDORmkNj62Y+kfJMXSo5Mc=;
	b=NLq/773ctLnGZrxinzXZ1zM2DVSCONdcJIAiNVYvTwzC8RGgLF2MbW6ZO8WbUziQDjVV
	 L3On/++q2c24d45gCUYQvG6Sy4qX2mORRGxlcawh/ggq799nXRzlegNu7f7ANrTLjwGDL
	 YQTLMIIFlyaWvnZAcoaPpgKRB53valGN5IuOWbExUrsoHqdd8udo0yV+Qvz80mdiTsLqu
	 DnvuPzi8wFAuPWSaZEOQ6OuxB9sHOVyxbtakvzPyZh18zacT/orcKu3oqnlIjVmWasxxn
	 /rXPITIEE+bozo3w6YEtbaEDFTU3bHY4I9DMK7fH4++Q9a40wUF7FhxMJcfaBd1dyzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XFuaSYbA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDD0606A328;
	Thu,  5 Nov 2026 13:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XFuaSYbA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805411F000C1;
	Thu,  5 Nov 2026 13:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793884027;
	bh=1jOK42kEV/R7k8n51sIGLXDORmkNj62Y+kfJMXSo5Mc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XFuaSYbAn6Wzfg2xYzR2T2rOKC0XDbDYhBWedM5J/RUQvjbBWRjzNw4K4Dn/iQ0pF
	 dSQ+7RvtRYpBTa099A8orQ6Eoq0V5fe9WiOoUXLjtRgOgAQfU0xXOlZ0vTQXkEkXgu
	 KhEdHwOq6KB2VVmaJviQHb2UVnhjNnwRasKvHuuLi/RCLBovWXTXG2Kzg30H2E/hBR
	 jaktqUPHCfXxQqnxAnd3VasCNIvl5thBnv+GSakC2ip8kbNsnxNBgqP9PzvcDFP+aR
	 ocLUpRelVHZhyx0N/goW4szRfWco2GGXiVwl+gLHV7g/U/TuyWb0AGwAN3fy0m7uJe
	 vaUjtb8+88F9Q==
Date: Thu, 5 Nov 2026 15:07:00 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, alex@ghiti.fr,
	pasha.tatashin@soleen.com, pratyush@kernel.org, graf@amazon.com,
	shuah@kernel.org, guoren@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	kexec@lists.infradead.org
Subject: Re: [PATCH v2 1/5] kho: Do not translate the handover FDT address in
 is_kho_boot()
Message-ID: <aux_dPnvXk3LYDxs@kernel.org>
References: <20261103080926.2079-1-cp0613@linux.alibaba.com>
 <20261103080926.2079-2-cp0613@linux.alibaba.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103080926.2079-2-cp0613@linux.alibaba.com>

Hi Chen,

On Tue, Nov 03, 2026 at 04:09:22PM +0800, Chen Pei wrote:
> is_kho_boot() only has to say whether a handover FDT was recorded, but
> it asks kho_get_fdt() for one and so converts kho_in.fdt_phys with
> phys_to_virt() just to throw the pointer away. Both callers use it as a
> boolean and never dereference the result.
> 
> On riscv64 that conversion is not valid yet when efi_init() reaches it:
> setup_vm() leaves kernel_map.va_pa_offset at 0 and setup_bootmem()
> assigns it later, so a handover boot that came through UEFI panics in
> linear_mapping_pa_to_va(). Only debug builds fail -- without
> CONFIG_DEBUG_VIRTUAL __va() degenerates to "phys + 0" and the boolean
> stays correct -- but the panic also goes unnoticed without an earlycon.
> 
> Check the physical address instead. Nothing needs the translation, and
> architectures stay free to bring their linear mapping up whenever they
> like.
> 
> Fixes: d6d511639185 ("kexec: introduce is_kho_boot()")
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> ---

There was very similar patch: 

https://lore.kernel.org/all/20261023054518.3258350-1-gthelen@google.com

and while both Greg's and your patch are correct they both have that wall
of text with too many details commit messages that I don't like.
 
> Tested on qemu-system-riscv64 (virt, -cpu max, TCG): edk2
> RISCV_VIRT_CODE.fd/VARS.fd on pflash with OpenSBI fw_dynamic.bin below
> it, and a GPT disk holding an ESP with grub plus the kernel and an ext4
> partition as rootfs.  Kernel config is riscv defconfig plus
> DEBUG_KERNEL, DEBUG_VIRTUAL, KEXEC_FILE, KEXEC_HANDOVER and the kho
> selftest fragment; the outgoing kernel gets "kho=on" and the kho
> selftest init does kexec_file_load() followed by reboot(RB_KEXEC).
> 
> Before, the first handover panics.  earlycon= is needed to see it: the
> BUG precedes console registration, so without an earlycon the machine
> goes silent right after kexec.
> 
>   KHO: found kexec handover data.
>   efi: EFI v2.7 by EDK II
>   kernel BUG at arch/riscv/mm/physaddr.c:47!
>   epc : linear_mapping_pa_to_va+0x1c/0x1e
>    ra : is_kho_boot+0x18/0x28
> 
> After, the same setup keeps handing over until the window closes, 29
> consecutive boots and no BUG.
> 
>   KHO: found kexec handover data.
>   KHO: exec from: 7.4.0-rc1-next-20261102-00005-gfca49e548231 (count 29)
> 
>  kernel/liveupdate/kexec_handover.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
> index 6f1f55fe3181..6ab181de345c 100644
> --- a/kernel/liveupdate/kexec_handover.c
> +++ b/kernel/liveupdate/kexec_handover.c
> @@ -1643,7 +1643,7 @@ EXPORT_SYMBOL_GPL(kho_restore_free);
>   */
>  bool is_kho_boot(void)
>  {
> -	return !!kho_get_fdt();
> +	return kho_in.fdt_phys != 0;
>  }
>  EXPORT_SYMBOL_GPL(is_kho_boot);
>  
> -- 
> 2.50.1
> 

-- 
Sincerely yours,
Mike.
