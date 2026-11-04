Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804103;
	b=m+gwRgnl2UtoD3snI2LYcvkmE7pFdkgZ/Y+xp29dzJmPrnbb7JxNmB3HGdt4yYgt4ALw
	 M20e8ert8S8c2bCDsEpVSpcmrUgcrKTXCp10BVObnRbkq+xDk5sLZpFDijlDAkFqglsv4
	 8VBQKmq2mW5z0LV3feNKb4EmEVmEd3AMTXNPJTkIeHtYx5JJfzmWzEUiPl6YSypZlqibB
	 FRUnOYXcP3zIqO1hFueey9vR2+ka+hwymq/RhJ483ef5hN+nh6rX/Pghjuhh0xZmR2ktP
	 8VxFGarqW3sIpQjcHPPL84Xxgszq+jJLxceA1ko3xD62XM+3Qin2BaxCGoh+RQOufUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804103;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=T/LFH12Z4WZEglTbKhXQW4K9eV4VYPQ2vTkGE/YeZdw=;
	b=vLAJhkhrXtOhSiXWqkXSGlCnUV609ig8iiEuAW+bp+DeW/aPZFjmjS1L+8TuZASPgdPB
	 BWHyHb7FpaW+F7imrNBWupYWFfv6ltGgdOnyJSxvE5oiAQFpz2vV5XCB6Y9kuDN657vvK
	 9rjEVJ2vCBflExXqA5A5Hbpc4ebsvBweRS+lSYcDUn4LxxlmtGORCzyVIPWoFJ4qS2suu
	 cfWVDC/ZhtXmA85LQAEBlasknooskAmzK/Qg1CTLFEig2aiE5DDoijGA+JgeIhtD4RbR6
	 E90WhOEQHmX4OREh2rpG217kmNb2sRRnCszVsHbzusAzMZkPip6ASOTB2UsuBdNmWDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FlOHlGR4;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=CRZvQnFt;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15778606A32C
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 14:55:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15778606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FlOHlGR4;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=CRZvQnFt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793804102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T/LFH12Z4WZEglTbKhXQW4K9eV4VYPQ2vTkGE/YeZdw=;
	b=FlOHlGR4xd7W1JkPJl7746kpqWEdXIC8Inm652tHW/mGPnOQzUx2vl8K0FZbYi+A9RWyX/
	L7PwEXJzFxiSApejiCOOWxpUNrTrtdTpOeuTQuMpY17jC6zTRA3TdBkMl87YyXOLQQUhwR
	v3QrrsNlpbROzT/3ItmxWVX/MLmaHdM=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-bQ9LSeBLMBCHOW2pEFZlCA-1; Wed, 04 Nov 2026 09:54:59 -0500
X-MC-Unique: bQ9LSeBLMBCHOW2pEFZlCA-1
X-Mimecast-MFC-AGG-ID: bQ9LSeBLMBCHOW2pEFZlCA_1793804099
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae73921fd1so854228a91.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 06:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793804099; x=1794408899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T/LFH12Z4WZEglTbKhXQW4K9eV4VYPQ2vTkGE/YeZdw=;
        b=CRZvQnFtt5RL2jN+WGIqCWR5UoUZ94miOysWGxXcQyigJhhW5/fCZjde7BwdDj0T8D
         RIwwb2Ow37CcUItTA//Qwr4jJV9RSpQWD+weWQwIxoGAj4xg5Ozi6CtDb4fX0gT70TGj
         d31u+InWoE11UB4mbEkHvfD5ZjG3UQfv2LFIz1qr8FT0gSqHUROqllfIcfwtLGcV1+Dj
         7tb1E951U0RFn7pz2S0+KuRfbOiW0gmkukOnGPSoe4I92akJZYe5zUt5k2aM8c4ASw1Y
         FPKNO0lMyBo1MlnUuonxBIwS8o71IgnUp+Zqgmq+5mYJnAI7kJFmwaOj0oSuA/jfTEJC
         O+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793804099; x=1794408899;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T/LFH12Z4WZEglTbKhXQW4K9eV4VYPQ2vTkGE/YeZdw=;
        b=XXGlffDM8UdCBQLkKre1hxa7K2cdwSdHN6gxvdu8oaIYfup+0prNTfAy3w0YdzR5vf
         G4raL0EcUEzsFoTn565wklKruIJvuQo7lzNKrLikSNBF/AJxvoqc6GKoox29a/0+6Vqp
         BMgCqEZfaQp9cjT+iomRQEfZyEsukxo11jPC3KWhFd6iQkRlxMHKmPHuDw6jqqBhxpp8
         NiEhhwTtkH1WW9yUjDcgU66SClSpYCj814CPv0G9EgC6eG95qnVqBted3/eRwEWwRJvy
         ijekX9OyOrf6IU0KVypU+3ofmhAHlGS0pIu13vBeqdmIz0Tvyva2GEbwn9Kd8+ZpeLrM
         Gg5Q==
X-Forwarded-Encrypted: i=1; AKwUvBw9NIekdnFw1k6W0hiF5vyuLXi0CBC6w7buGy+p0kufztcoIq9CO3nz6J6b4+Rb0tjDeeMNohXleE9+4dkEYoE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fzXNvUXky32gRySd/WI6/LyJUVxtLtJ9wI/dh2rNX3uFPL3IG
	JErmQDn7v6AuMs3HtqWww4MbLBUhqp1m25mOw3sAhyhT6qnHvp/6mhisUPg0j2DyvqeS2NaqHLJ
	HFYYlHMorV4hv/HdQUYs//WUy/n0q3fdnBf1S3AMU0lguM+6WxU57aHT9lt0ijsWn5Bw/Tw==
X-Gm-Gg: AYBFou0nE1OZFDkcRFRbeR/j+S43WPpWGBsLTrKH+9ipP8afDe3YiF1lUXhHW9ODfmq
	iKYcRPOCLrqHpV81HdCfeXqtjsLuxfDuB6HjIbD1CBzwLXcJpE7P+vzj+ioaASl01aowyabOgnJ
	xWnWPAxF8Hjigw6JjUbH8G+oI4ji8rRAF2Yp6au1LfOAOduR9ebMCVuSUcZEr4JugHDIQqgVXNi
	UHuWkEI5kfgA1Dw2vXyTXxTAAhz42Vd2GBUmFeEzoeuRKElUucmAwuEudWDjS2uaRAAiOJZB6uV
	zKxxErfOT50SzhdT0jJFcFxopZPv3+dbgROxCU1kIuRUE3tikeutCsAnAPDrYsMGNCA6W9XGj9G
	b3zGsyK22AQGu2cgZggG86CE/BdSGnJzFQ6HW6LrgDAbLm8axwXYr7o+OZRs9XWV+/UtzmQJmdC
	kwVWHscZqbwRL8yGwdv+bElgLRqolUkP4QYjRNgHNSQqE=
X-Received: by 2002:a17:90b:48cd:b0:3b0:a970:caad with SMTP id 98e67ed59e1d1-3b0a970ce14mr563075a91.28.1793804098468;
        Wed, 04 Nov 2026 06:54:58 -0800 (PST)
X-Received: by 2002:a17:90b:48cd:b0:3b0:a970:caad with SMTP id 98e67ed59e1d1-3b0a970ce14mr563055a91.28.1793804097848;
        Wed, 04 Nov 2026 06:54:57 -0800 (PST)
Received: from ?IPV6:2401:4900:1f28:63e0:edae:927e:c670:b679? ([2401:4900:1f28:63e0:edae:927e:c670:b679])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b096994650sm2176379a91.2.2026.11.04.06.54.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 06:54:57 -0800 (PST)
Message-ID: <99670aa8-a33c-4a36-b8dd-66b02c6b6159@redhat.com>
Date: Wed, 4 Nov 2026 20:24:47 +0530
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/8] efi: Pass KHO state to the next kernel in a
 configuration table
To: George Guo <dongtai.guo@linux.dev>, rppt@kernel.org,
 pasha.tatashin@soleen.com, pratyush@kernel.org, chenhuacai@kernel.org,
 ardb@kernel.org, shuah@kernel.org
Cc: ilias.apalodimas@linaro.org, akpm@linux-foundation.org,
 baoquan.he@linux.dev, ruirui.yang@linux.dev, guodongtai@kylinos.cn,
 kernel@xen0n.name, graf@amazon.com, liukexin@kylinos.cn,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 kexec@lists.infradead.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-efi@vger.kernel.org
References: <20261029172956.20791-1-dongtai.guo@linux.dev>
 <20261029172956.20791-2-dongtai.guo@linux.dev>
Content-Language: en-US
From: Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <20261029172956.20791-2-dongtai.guo@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi George,

On 29/10/26 10:59 pm, George Guo wrote:
> From: George Guo <guodongtai@kylinos.cn>
> 
> KHO has to give the next kernel two addresses: the KHO FDT and the
> bootmem area list. arm64 and riscv put them under /chosen in the boot
> FDT. LoongArch systems booting with EFI and ACPI do not require a boot
> FDT, so KHO needs another way to pass this information.
> 
> Add a Linux EFI configuration table for them, under
> LINUX_EFI_KEXEC_HANDOVER_GUID. It points to a struct linux_efi_kho_data.
> 
>   - On a cold boot, the LoongArch EFI stub installs the table, zeroed.
>     Each kexec'd kernel is given the same EFI system table, so it finds
>     the same table.
> 
>   - In early boot, efi_config_parse_tables() reserves the table so
>     neither the page allocator nor kexec segments use it, and calls
>     kho_populate() if the table holds KHO state.
> 
>   - Provide efi_kho_update() to update the table before kexec. Map the
>     table during boot so updates do not require allocation or mapping
>     at panic time.
> 
>   - efi_kho_table_found() tells architecture code whether the table was
>     found at boot, so it can turn KHO off when the table is missing.
> 
> Only the LoongArch stub installs the table, and only with
> CONFIG_KEXEC_HANDOVER. Elsewhere there is no table and this code does
> nothing.
> 
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> ---
>  drivers/firmware/efi/efi.c               | 68 ++++++++++++++++++++++++
>  drivers/firmware/efi/libstub/efi-stub.c  | 22 ++++++++
>  drivers/firmware/efi/libstub/efistub.h   |  2 +
>  drivers/firmware/efi/libstub/loongarch.c |  2 +
>  include/linux/efi.h                      | 40 ++++++++++++++
>  5 files changed, 134 insertions(+)
> 
> diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
> index 0327a39d31fa..e409e4a57378 100644
> --- a/drivers/firmware/efi/efi.c
> +++ b/drivers/firmware/efi/efi.c
> @@ -24,6 +24,7 @@
>  #include <linux/initrd.h>
>  #include <linux/io.h>
>  #include <linux/kexec.h>
> +#include <linux/kexec_handover.h>
>  #include <linux/platform_device.h>
>  #include <linux/random.h>
>  #include <linux/reboot.h>
> @@ -62,6 +63,7 @@ unsigned long __ro_after_init efi_rng_seed = EFI_INVALID_TABLE_ADDR;
>  static unsigned long __initdata mem_reserve = EFI_INVALID_TABLE_ADDR;
>  static unsigned long __initdata rt_prop = EFI_INVALID_TABLE_ADDR;
>  static unsigned long __initdata initrd = EFI_INVALID_TABLE_ADDR;
> +static unsigned long efi_kho __initdata = EFI_INVALID_TABLE_ADDR;
>  
>  extern unsigned long primary_display_table;
>  
> @@ -629,6 +631,7 @@ static const efi_config_table_type_t common_tables[] __initconst = {
>  	{EFI_TCG2_FINAL_EVENTS_TABLE_GUID,	&efi.tpm_final_log,	"TPMFinalLog"	},
>  	{EFI_CC_FINAL_EVENTS_TABLE_GUID,	&efi.tpm_final_log,	"CCFinalLog"	},
>  	{LINUX_EFI_MEMRESERVE_TABLE_GUID,	&mem_reserve,		"MEMRESERVE"	},
> +	{LINUX_EFI_KEXEC_HANDOVER_GUID,		&efi_kho,		"KHO"		},
>  	{LINUX_EFI_INITRD_MEDIA_GUID,		&initrd,		"INITRD"	},
>  	{EFI_RT_PROPERTIES_TABLE_GUID,		&rt_prop,		"RTPROP"	},
>  #ifdef CONFIG_OVMF_DEBUG_LOG
> @@ -806,6 +809,23 @@ int __init efi_config_parse_tables(const efi_config_table_t *config_tables,
>  		}
>  	}
>  
> +	if (efi_kho != EFI_INVALID_TABLE_ADDR) {
> +		struct linux_efi_kho_data *kho;
> +
> +		/* Keep the buddy allocator and kexec segments off the table. */
> +		memblock_reserve(efi_kho, sizeof(*kho));
> +
> +		kho = early_memremap(efi_kho, sizeof(*kho));
> +		if (kho) {
> +			if (kho->fdt_addr)
> +				kho_populate((phys_addr_t)kho->fdt_addr, kho->fdt_size,
> +					     (phys_addr_t)kho->bootmem_addr, kho->bootmem_size);
> +			early_memunmap(kho, sizeof(*kho));
> +		} else {
> +			pr_warn("Could not map UEFI KHO table!\n");
This is a Linux EFI configuration table, not a __UEFI KHO table__, so
IMHO; UEFI wording is wrong here.

> +		}
> +	}
> +
>  	if (rt_prop != EFI_INVALID_TABLE_ADDR) {
>  		efi_rt_properties_table_t *tbl;
>  
> @@ -1171,6 +1191,54 @@ static int __init efi_memreserve_root_init(void)
>  }
>  early_initcall(efi_memreserve_root_init);
>  
> +static struct linux_efi_kho_data *efi_kho_table __ro_after_init;
> +
> +/* Did the previous kernel or the EFI stub pass a KHO table? */
> +bool __init efi_kho_table_found(void)
> +{
> +	return efi_kho != EFI_INVALID_TABLE_ADDR;
> +}
> +
> +static int __init efi_kho_table_init(void)
> +{
> +	if (efi_kho == EFI_INVALID_TABLE_ADDR)
> +		return 0;
> +
> +	/* Map it now: the table is also written at panic time. */
> +	efi_kho_table = memremap(efi_kho, sizeof(*efi_kho_table), MEMREMAP_WB);
> +	if (WARN_ON_ONCE(!efi_kho_table))
> +		efi_kho_table = ERR_PTR(-ENOMEM);
> +
> +	return 0;
> +}
> +early_initcall(efi_kho_table_init);
> +
> +/*
> + * Write the KHO addresses the next kernel should use, or zeroes
> + * if it should boot without KHO.
> + */
> +int efi_kho_update(phys_addr_t fdt_addr, u64 fdt_size,
> +		   phys_addr_t bootmem_addr, u64 bootmem_size)
> +{
> +	struct linux_efi_kho_data *kho = efi_kho_table;
> +
> +	/*
> +	 * No table: either the architecture passes the KHO state some other
> +	 * way, or it turned KHO off at boot because the table was missing.
> +	 */
> +	if (!kho)
> +		return 0;
> +	if (IS_ERR(kho))
> +		return PTR_ERR(kho);
> +
> +	kho->fdt_addr		= fdt_addr;
> +	kho->fdt_size		= fdt_size;
> +	kho->bootmem_addr	= bootmem_addr;
> +	kho->bootmem_size	= bootmem_size;
> +
> +	return 0;
> +}
> +
>  #ifdef CONFIG_KEXEC
>  static int update_efi_random_seed(struct notifier_block *nb,
>  				  unsigned long code, void *unused)
> diff --git a/drivers/firmware/efi/libstub/efi-stub.c b/drivers/firmware/efi/libstub/efi-stub.c
> index 42d6073bcd06..0fb0d4041d1c 100644
> --- a/drivers/firmware/efi/libstub/efi-stub.c
> +++ b/drivers/firmware/efi/libstub/efi-stub.c
> @@ -100,6 +100,28 @@ static void install_memreserve_table(void)
>  		efi_err("Failed to install memreserve config table!\n");
>  }
>  
> +void install_kho_table(void)
> +{
> +	struct linux_efi_kho_data *kho;
> +	efi_guid_t kho_table_guid = LINUX_EFI_KEXEC_HANDOVER_GUID;
> +	efi_status_t status;
> +
> +	if (!IS_ENABLED(CONFIG_KEXEC_HANDOVER))
> +		return;
> +
> +	status = efi_bs_call(allocate_pool, EFI_LOADER_DATA, sizeof(*kho), (void **)&kho);
> +	if (status != EFI_SUCCESS) {
> +		efi_err("Failed to allocate KHO config table!\n");
> +		return;
> +	}
> +
> +	*kho = (struct linux_efi_kho_data){};
> +
> +	status = efi_bs_call(install_configuration_table, &kho_table_guid, kho);

> +	if (status != EFI_SUCCESS)
> +		efi_err("Failed to install KHO config table!\n");
When install_configuration_table fails, the pool allocation made
just above using efi_bs_callis never freed, so a page of
EFI_LOADER_DATA is leaked until ExitBootServices, This is a minor leak
so mentioned here for review completeness.

> +}
> +
>  static u32 get_supported_rt_services(void)
>  {
>  	const efi_rt_properties_table_t *rt_prop_table;
> diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
> index fd91fc15ec81..9e0034c1260a 100644
> --- a/drivers/firmware/efi/libstub/efistub.h
> +++ b/drivers/firmware/efi/libstub/efistub.h
> @@ -1057,6 +1057,8 @@ efi_status_t efi_exit_boot_services(void *handle, void *priv,
>  efi_status_t efi_boot_kernel(void *handle, efi_loaded_image_t *image,
>  			     unsigned long kernel_addr, char *cmdline_ptr);
>  
> +void install_kho_table(void);
> +
>  void *get_fdt(unsigned long *fdt_size);
>  
>  efi_status_t efi_alloc_virtmap(efi_memory_desc_t **virtmap,
> diff --git a/drivers/firmware/efi/libstub/loongarch.c b/drivers/firmware/efi/libstub/loongarch.c
> index 2b0c87dc9908..c2df097771e4 100644
> --- a/drivers/firmware/efi/libstub/loongarch.c
> +++ b/drivers/firmware/efi/libstub/loongarch.c
> @@ -74,6 +74,8 @@ efi_status_t efi_boot_kernel(void *handle, efi_loaded_image_t *image,
>  	efi_status_t status;
>  	u32 desc_ver;
>  
> +	install_kho_table();
> +
>  	status = efi_alloc_virtmap(&priv.runtime_map, &desc_size, &desc_ver);
>  	if (status != EFI_SUCCESS) {
>  		efi_err("Unable to retrieve UEFI memory map.\n");
> diff --git a/include/linux/efi.h b/include/linux/efi.h
> index aa15ff88539b..253e98bf9922 100644
> --- a/include/linux/efi.h
> +++ b/include/linux/efi.h
> @@ -422,6 +422,7 @@ void efi_native_runtime_setup(void);
>  #define LINUX_EFI_COCO_SECRET_AREA_GUID		EFI_GUID(0xadf956ad, 0xe98c, 0x484c,  0xae, 0x11, 0xb5, 0x1c, 0x7d, 0x33, 0x64, 0x47)
>  #define LINUX_EFI_BOOT_MEMMAP_GUID		EFI_GUID(0x800f683f, 0xd08b, 0x423a,  0xa2, 0x93, 0x96, 0x5c, 0x3c, 0x6f, 0xe2, 0xb4)
>  #define LINUX_EFI_UNACCEPTED_MEM_TABLE_GUID	EFI_GUID(0xd5d1de3c, 0x105c, 0x44f9,  0x9e, 0xa9, 0xbc, 0xef, 0x98, 0x12, 0x00, 0x31)
> +#define LINUX_EFI_KEXEC_HANDOVER_GUID		EFI_GUID(0xc941b6c7, 0x7b3f, 0x4af6,  0x9e, 0x50, 0xfc, 0xb3, 0xa8, 0x86, 0x8a, 0x17)
>  
>  #define RISCV_EFI_BOOT_PROTOCOL_GUID		EFI_GUID(0xccd15fec, 0x6f73, 0x4eec,  0x83, 0x95, 0x3e, 0x69, 0xe4, 0xb9, 0x40, 0xbf)
>  
> @@ -1273,6 +1274,45 @@ struct linux_efi_memreserve {
>  
>  void __init efi_arch_mem_reserve(phys_addr_t addr, u64 size);
>  
> +/**
> + * struct linux_efi_kho_data - KHO state passed to the next kernel
> + * @fdt_addr: physical address of the KHO FDT, 0 if there is none
> + * @fdt_size: size of the KHO FDT
> + * @bootmem_addr: physical address of the bootmem area list
> + * @bootmem_size: size of the bootmem area list
> + *
> + * Pointed to by the LINUX_EFI_KEXEC_HANDOVER_GUID configuration table.
> + *
> + * The EFI stub installs this table zeroed on a cold boot. It stays
> + * in place across kexec; the running kernel rewrites it just before
> + * each kexec, and the next kernel reads it during early boot.
This statement is only true for the LoongArch and on arm64/riscv/x86 no
table exists, so the comment describes a kernel-wide invariant that does
not hold.

> + *
> + * The layout is fixed. Changing it requires a new GUID.
> + */
> +struct linux_efi_kho_data {
> +	u64 fdt_addr;
> +	u64 fdt_size;
> +	u64 bootmem_addr;
> +	u64 bootmem_size;
> +};
> +
> +#ifdef CONFIG_EFI
> +bool efi_kho_table_found(void);
> +int efi_kho_update(phys_addr_t fdt_addr, u64 fdt_size,
> +		   phys_addr_t bootmem_addr, u64 bootmem_size);
> +#else
> +static inline bool efi_kho_table_found(void)
> +{
> +	return false;
> +}
> +
> +static inline int efi_kho_update(phys_addr_t fdt_addr, u64 fdt_size,
> +				 phys_addr_t bootmem_addr, u64 bootmem_size)
> +{
> +	return 0;
> +}
> +#endif
> +
>  /*
>   * The LINUX_EFI_MOK_VARIABLE_TABLE_GUID config table can be provided
>   * to the kernel by an EFI boot loader. The table contains a packed

-- 
Regards,
Mukesh Pilaniya

