Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764888462;
	Mon, 25 May 2026 17:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779731373; cv=none; b=dVvjptoGxTWvlhRIyuHfgQ7E7QNSziH3Y0Bi8ZeAqopw+szLK5g4DdXWfp8fY5L+v+9toZKGQhJHx4SwDY0Fm+WZDhNyngl2MB+/7HSWthPtPxBxYzy7UH/fiof5fnkwDKmQGKZKwtF7gqmyjr3gxx6mVx8ns2QuJE3TBS9pSVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779731373; c=relaxed/simple;
	bh=gEsP+Gq6XxxpksEZqjc5xlVOq8ChQc72ScHgpfpQRH8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QfouOQE744OUKVrBcvj5aUzhilJaGvuI5saNTx1Xp71oAX+WsZn3YMYX3PXJ79d0FMCLq4gSj67tZ/XM/pS82E0xZWPcMEGgGkhbXWxj16AmfakGTFw1dZ9cvyI9TmZ+Vm6/Tk21P2s2QLOirswx2s7YZUL0trTXhHXReesJyu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=itXByRbw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="itXByRbw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D24B01F000E9;
	Mon, 25 May 2026 17:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779731372;
	bh=34eaHJRXGUxn6aCaWNiWQiEzep2YC7iFCHhas4g5QaM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=itXByRbw+mP3n0WYUFSgOvuNWwiQkJMyZndGej1Q+qst31PJZbH6hK5bKQPa8pye+
	 8z8HSlCAtj0uObcAzFM41I0i1eME3B6Bi8ajwvxrJYfYLrghnHBDvJdiJzElpB6dgx
	 6udxDWvfBe/N7Wnl4Rg3vu7KbiWdMEYlpoOK3B2DJ+t01suWb5DaAsMMK3B1krviAH
	 GxhO/AdojFJgoYBSOPNzAhbQgIYy8pkvAB/sTodPhcLgM7fa7Xy/FT1idtC3pqgPAF
	 zAo5rkvorkJD1JryB7ndb0kXfNlZDrLT21DM1MHfbYKs+V+EtGAisgsYyQwcWj+KKU
	 ozSnoW+MLfQsA==
From: Pratyush Yadav <pratyush@kernel.org>
To: George Guo <dongtai.guo@linux.dev>
Cc: chenhuacai@kernel.org,  rppt@kernel.org,  pasha.tatashin@soleen.com,
  pratyush@kernel.org,  kernel@xen0n.name,  graf@amazon.com,
  shuah@kernel.org,  loongarch@lists.linux.dev,  kexec@lists.infradead.org,
  linux-mm@kvack.org,  linux-kselftest@vger.kernel.org,
  linux-kernel@vger.kernel.org,  George Guo <guodongtai@kylinos.cn>
Subject: Re: [PATCH 2/7] LoongArch: kho: strip stale kho_handover= from
 reused cmdline
In-Reply-To: <20260525062810.103367-3-dongtai.guo@linux.dev> (George Guo's
	message of "Mon, 25 May 2026 14:28:05 +0800")
References: <20260525062810.103367-1-dongtai.guo@linux.dev>
	<20260525062810.103367-3-dongtai.guo@linux.dev>
Date: Mon, 25 May 2026 19:49:28 +0200
Message-ID: <2vxzpl2j5qhj.fsf@kernel.org>
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
> When kexec is invoked with --reuse-cmdline after a liveupdate boot, the
> running kernel's command line already contains a kho_handover= parameter
> from the previous kexec load.  load_other_segments() prepends a fresh
> kho_handover= for the new handover FDT but then appends the original
> cmdline verbatim, resulting in two kho_handover= entries:
>
>   kho_handover=0x4000@<new_fdt>,... kho_handover=0x4000@<stale_fdt>,...
>
> early_param() calls early_parse_kho() for each occurrence in order, so
> kho_populate() is invoked twice and the second call overwrites the first
> with the stale FDT address.  The stale address no longer holds a valid
> KHO FDT, causing __kho_radix_walk_tree() to dereference a garbage
> pointer and panic early in mm_core_init().
>
> Fix this by adding the new kho_handover= to the cmdline prefix first,
> then stripping any stale kho_handover= tokens from the appended original
> cmdline portion, so only the freshly generated entry survives.
>
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> ---
>  arch/loongarch/kernel/machine_kexec_file.c | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>
> diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
> index ddf4d0e0e7fd..ffaedd055e62 100644
> --- a/arch/loongarch/kernel/machine_kexec_file.c
> +++ b/arch/loongarch/kernel/machine_kexec_file.c
> @@ -71,6 +71,37 @@ static void cmdline_add_kho(struct kimage *image, unsigned long *cmdline_tmplen,
>  	    image->kho.scratch->bufsz,    (u64)image->kho.scratch->mem);
>  	*cmdline_tmplen += n;
>  }
> +
> +/*
> + * Remove all "kho_handover=..." tokens from cmdline.  Needed when
> + * --reuse-cmdline is used: the running kernel's cmdline already carries a
> + * stale kho_handover= from the previous kexec load; without removal the new
> + * kernel sees two entries and kho_populate() ends up using the wrong (stale)
> + * FDT address.
> + */
> +static void cmdline_remove_kho(char *cmdline)
> +{
> +	const char *key = "kho_handover=";
> +	size_t key_len = strlen(key);
> +	char *p = cmdline;
> +
> +	while ((p = strstr(p, key)) != NULL) {
> +		char *start = p;
> +		char *end;
> +
> +		/* Only match at a token boundary */
> +		if (start != cmdline && *(start - 1) != ' ') {
> +			p += key_len;
> +			continue;
> +		}
> +		end = start + key_len;
> +		while (*end && *end != ' ')
> +			end++;
> +		while (*end == ' ')
> +			end++;
> +		memmove(start, end, strlen(end) + 1);
> +	}
> +}

Ugh, modifying the commandline supplied by userspace feels odd... Can
you at all do this via device tree?

If not, would it make more sense to reject kexec_load if command line
has kho_handover= and teach kexec-tools to strip it on its side?

>  #endif
>  
>  #ifdef CONFIG_CRASH_DUMP
> @@ -249,6 +280,10 @@ int load_other_segments(struct kimage *image,
>  	}
>  
>  	memcpy(modified_cmdline + cmdline_tmplen, cmdline, cmdline_len);
> +#ifdef CONFIG_KEXEC_HANDOVER
> +	/* Strip stale kho_handover= that --reuse-cmdline may have carried over */
> +	cmdline_remove_kho(modified_cmdline + cmdline_tmplen);
> +#endif
>  	cmdline = modified_cmdline;
>  	image->arch.cmdline_ptr = (unsigned long)cmdline;

-- 
Regards,
Pratyush Yadav
