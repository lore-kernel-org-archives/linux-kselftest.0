Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792553633;
	b=sebgHD0DQC2lyhNW2/GYv3ofSCA79GARAEqUP7mHZDq+eUQN0uZBX3jcL98C6GOsXecn
	 VA6uvtkg+wJiLj5iM/ToQsuGiL8iDsvyYgPIVA7781/NPxDOM+/pqGzw/AbtXgeXdTrOC
	 iBJkBwPKUcrYRA2MB6u760PyKTtOODaSDpi4zDwJLJNYzsjW+HlEJ64TMDnVvRLlpoWy8
	 mlg3/6RAGlzHqPq+sZT9JVWuziprECdOXzd3mJHF5BODbFAhR059EOzysTMZjzDAP9egd
	 ueUD5DiSohafOYdLaPE4jX9YxzvtvyA2dg8T7xkc4uN77OAT06cNxGFg7ewwGSrEtvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792553633;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RbLlIDBzxSpd5cJfPOd2N3zvhSlGP9L2jcWxKocz/10=;
	b=r5agOVPSFAy1eVfSve5ey/VjQCzwmKwJKj/T3MsL9B1L83fHCnX2EVyjhytUbHJ0QiBT
	 6TLx8F54N+q/HslGujNQ8qDR8lFNzPajqzmp1HyBacD6vFsxEoQtIGxNXs4h+PkJ40uNC
	 ZavNTcYI8f8pAxt0Hybg/YJiphpVWaYmY7l/wqeBRCdTQgbiPIHQJWRcthfd80T7olw2v
	 kh8PXfUdORI6LVZL02Q63nL9pPQ3zoIJLFRTEMr7YgPFB/WpwyRXtqNJoKZbWt4fcwMPx
	 Nw0lcbyoTUbKWLIc3zhir5jBiAY4AEgJNCMCDb7M2Tx5tPyUHQegl70+Q7g5m10yIqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HuUipxgR;
	arc=none smtp.remote-ip=91.218.175.76
Received: from mta0.migadu.com (out-76.mta0.migadu.com [91.218.175.76])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50991606A331
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 03:33:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50991606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HuUipxgR
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=y927hDeFwTRi1uuF8AFccBXiuWM2sJNn4YnO+caicLI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792553630; v=1; x=1793158430;
 b=HuUipxgRWS3e7sDvPB7ilyEUPgRtTmYZ+Pmv+0G7aSfoBB64N9Ezdvggr7cyCJYhNYRoNABQ
 1NIALLv0lL+pT7s1Ta2HlXtIcSDzHQRv1LjU8Bz41eNK1xug9eM3nBz5/ICuWBm7aW60JdMJAdN
 h6MPK5xaXrRLUQqt3HGTojB0=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 071bc8b21379f3c8;
	Wed, 21 Oct 2026 03:33:50 +0000
X-Mizu-Trace-ID: 071bc8b21379f3c8
X-Migadu-Flow: FLOW_OUT
From: George Guo <dongtai.guo@linux.dev>
To: pratyush@kernel.org
Cc: rppt@kernel.org,
	pasha.tatashin@soleen.com,
	chenhuacai@kernel.org,
	ardb@kernel.org,
	shuah@kernel.org,
	ilias.apalodimas@linaro.org,
	akpm@linux-foundation.org,
	baoquan.he@linux.dev,
	ruirui.yang@linux.dev,
	guodongtai@kylinos.cn,
	kernel@xen0n.name,
	graf@amazon.com,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-efi@vger.kernel.org
Subject: Re: [PATCH v5 1/5] efi: add a KHO configuration table channel
Date: Wed, 21 Oct 2026 11:33:42 +0800
Message-ID: <20261021033342.3110-1-dongtai.guo@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2vxza4p95v6e.fsf@kernel.org>
References: <2vxza4p95v6e.fsf@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Pratyush,

Thanks for the detailed review. I've rewriten the comments and commit messages
myself for v6. Replies inline.

On Tue, Sep 22 2026, Pratyush Yadav wrote:
> > +config EFI_KHO
> > +	bool
> > +	depends on EFI_STUB && EFI_GENERIC_STUB && KEXEC_HANDOVER
> > +	help
[...]
> I don't like adding a config for this sort of thing. Do we really need
> this? Why not just have the code always compiled and only used by
> loongarch? I don't really see we need a user decision for this sort of
> thing.

Agreed, v6 drops it.

> > +		/*
> > +		 * Reserve the stub-allocated table so it is neither handed
> > +		 * out by the buddy allocator nor placed on by kexec
> > +		 * segments, mirroring the memreserve handling above.  This
> > +		 * runs on every boot, so it also protects the table in the
> > +		 * next kernel until it reads it.
> > +		 */
>
> Nit: this comment is too wordy. Can you please make it more concise and
> to the point?

v6:

	/* Keep the buddy allocator and kexec segments off the table. */

> > +			if (kho->fdt_addr)
>
> When can kho->fdt_addr be NULL? Also, perhaps print a warning if
> early_memremap() fails?

It is 0 when there is nothing to restore:

  - on a cold boot, because the stub installs the table zeroed;
  - after a kexec into an image without KHO state, such as a crash
    kernel, because the table is zeroed just before that kexec.

v6 says this in the struct documentation, and adds a pr_warn() when
early_memremap() fails.

> > +	/*
> > +	 * Keep a persistent mapping of the table, the same way
> > +	 * efi_memreserve_root_init() keeps the memreserve root mapped:
> > +	 * efi_kho_update() is also called on the crash kexec path, where
> > +	 * memremap() is no longer an option.
> > +	 */
>
> No need to mention memreserve. Just explain the reason here. And keep it
> as short and to the point as possible.

v6:

	/* Map it now: the table is also written at panic time. */

> This is unreadable. Please add a human touch to this.
>
> And once again, the fact that it mirrors efi_mem_reserve_persistent()
> isn't important.

v6:

	/*
	 * Write the KHO addresses the next kernel should use, or zeroes
	 * if it should boot without KHO.
	 */

> Why ENODEV? Wouldn't ENOENT be a tiny bit better?

Neither, in v6. No table is the normal case outside LoongArch, so
efi_kho_update() now returns 0. The only error left is a table that
could not be mapped at boot, which returns -ENOMEM.

> This has too much information. You need to make it more to the point.
> For example, "without a device tree" already implies there is no /chosen
> property in the first place. No need to mention the function either.
>
> The lifetime of the table is certainly useful information but again,
> should be much more clear and to the point.
>
> Also, you should document what each of the members of the struct mean.

Agreed. v6:

	/**
	 * struct linux_efi_kho_data - KHO state passed to the next kernel
	 * @fdt_addr: physical address of the KHO FDT, 0 if there is none
	 * @fdt_size: size of the KHO FDT
	 * @bootmem_addr: physical address of the bootmem area list
	 * @bootmem_size: size of the bootmem area list
	 *
	 * Pointed to by the LINUX_EFI_KEXEC_HANDOVER_GUID configuration table.
	 *
	 * The EFI stub installs this table zeroed on a cold boot. It stays
	 * in place across kexec; the running kernel rewrites it just before
	 * each kexec, and the next kernel reads it during early boot.
	 *
	 * The layout is fixed. Changing it requires a new GUID.
	 */

> Note: I recently sent a series that renames scratch to bootmem [0]. It
> looks close to landing. So you likely need to rename this to
> bootmem_{addr,size}.

Thanks for the heads-up. It is in liveupdate/next now, so v6 is based
on it and uses bootmem_{addr,size}.

> Why __packed?

No good reason. All four members are u64, so there is no padding
and __packed changes nothing. Dropped.

Thanks,
George
