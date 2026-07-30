Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F1031D372
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 18:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785435367; cv=pass; b=pfoauAen8hhfpq/3W+kxs5KrCm/u4EGvomXxRgymuMArHnNuuQNoPpMooFIEiSiDFN5VXXSF5VeTE1IG8AB7sNUfkyZvo5jaum0Go4EazS3biklC27dEwzRNFgXNmryrBEKj7yHLXEhofex1Se1MGIAKfYYiLyhwmcnEQ8x1w+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785435367; c=relaxed/simple;
	bh=ACnSUSFGOHB+6aR5J0+hOwYkWmGuBgWWNFIJt2FZc6E=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PUhyU4fik8TqAiDpaj4aWXwifidB2zVmM9Ju77EmkxSz/xatBT5AQjCEPrg2GOes7CD3x1iIvBXQLYCqmyyTrnTdWyzPY1eCWzoLwwBuR9B2OwDxPOrJQasiu6dxL8uqwMtbsqpQsSGSAQ+T3DLA82vWn5/LPo7NYPrE6GMBMJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uUevmtbg; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uUevmtbg"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ca12086c06eso89832a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 11:16:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785435365; cv=none;
        d=google.com; s=arc-20260327;
        b=T4oAXL9VCHlRIIRksDFq8iMyhzgHiFwClYkrTqqXv4vl6QN9norHHpAPcjfqIvxsRi
         mzSKrrUYdrnDOHGYQEJhOWzzdgc0dBL68Kf/cBVMrNqBxPwGAn6+IwgFZJH9z8eGg+bI
         +l3PugsWO5NrXsb2K1nCuBDpdMA4okA+qm+i92rJLGzoz4xI3mI71ZRgKhu04SEA4igm
         H35nuron7nM7npb1FzNgbQyYkjUU5chIXWRHJEukowJkkEdq0jhYwrWJMXjcdy3qnTtY
         VIIKl+LPn+67CrZuEzympEPPbfz66cHfyp8Ym88IOtiESNixM9qcpiIZaXZX90Ibb83z
         liMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=jeT5JD84OLDwdMghWHFJO3a32W5zB/0PvPjAX4B/43g=;
        fh=k2M5+le0vr3qB4AfMXUEMpfaL7Ua8Ow45VRBol8cKiE=;
        b=rcDeUmCZY1EGGHPgizIC1JccURLoqSmNbBpEZ1sD1YHyPQd7F71ICvaFJbFDrCfuJG
         SSYTL1BlYNiHE2g6g7KfRe9bda5HP0saI1I2VcrWzRd7ImF0IA8qVDdI8vFm5eT+ckcy
         HLbi5oDR+TMwV0ZP6ObIvi1aWqVikPOV74NPt9ZspRlKgKRGg+WereyMManp3nMhN8M2
         ijshIxuLrfdNBga3FWwnUCt6OFRdJ4ya6GN7FPUCrHEckXTAiS2kDgQFzm5xYtmHzyEb
         N9OMAMLA9e7RE2CjIXELBr8fPayzEkanYpjVUvSpgX+sg28NTFRZVq0pEqh9FI/UVCjC
         +cVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785435365; x=1786040165; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jeT5JD84OLDwdMghWHFJO3a32W5zB/0PvPjAX4B/43g=;
        b=uUevmtbgrq6eb0PEmcfnczE2DsVt2FPLYYzJ6NrvCPQxcRUYMxfi12hjvgEDZ8Z42s
         /Dzi2a6LOW8zOgMaST4PiiSGpn0aP7SUomK4TkBKYyZR3/YRHXYfJns4FFXFnOuqYXYq
         iHxDHCjgAjIzimzymxzjeWT9/rt6t3baHpwqXglQwCJp3lMIMuQZcnUsGC77+NbQQA+N
         6jjaRTvra/0Z/7oJy2Etk+dkG0cYf3rbNlx5QQj3brNkJFXX+XgxO+mD+0bc4ODG21NX
         X4YbqMgGDDYdWevEaeJfBCrPWnsFQ7besi5JdnZFSESUgT7YKHRV13DUcBnEBec8nCFm
         QElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785435365; x=1786040165;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jeT5JD84OLDwdMghWHFJO3a32W5zB/0PvPjAX4B/43g=;
        b=JreVBWoaWcgNebMXfr6exNUfgzbCKnhB6FCLSzsX+oEDaIMJ/TyE6Zhvp86VL3k04Q
         rPB6emdVleqzLsGD0PwsruGCQkZoyBXNUHDJsYH7KHtKR1rVgk2U64wDV89F1h2XbeRo
         113VCT/7KZkBUPF39xUIXN/goLrKenn74Fq9LVu84cWJOZcNZ1/sVTTK7KhQUtMB9J/f
         bnzrSzDhYsbgiBIxLG+6D87y57SHccU8+zDhbbVTU59YNOX2IbBJu8xSJlBB1aj0f9x3
         hZ5YskW1lTb+mfdjpxhR1igcpqlPqeEM436sb/egzCLtOdCa99Km4reNq8QyKYadiCIB
         30uQ==
X-Gm-Message-State: AOJu0Yy9BWvKdQrrk50zK5iiJnOwYrPgDHJXzL4WEDmr4RSTm0gPjK0Y
	Ub9tUUhnZcMeamUSdTt9Zf7oEnNZAzJoidb8tZVV5j1yh4Z3/lxqNAL/RQzyBaD7CAhBD7+UlYD
	ZZeKN7UNE7vlzqY0o+OtIxZjGx6FsmH2tBJGvEPcy
X-Gm-Gg: AR+sD128uKFio+8emU1rpQ96nGPMsluwekNA7n7CC5UhvFJI/fbN6xy3vCL50DWb0yd
	ontzdOJ0Ekm6KlB3aGD4zFg8CrQzZ57GqjUScY7GcL9W4Mq8+8ZD2u5ZXAWvUI2esk4owdxNhcZ
	nWny6/6OtzB3Ey4O0xbrsnV9wjVwWiSSAApKBDJVG3ZdJ8Vj/K1IihxNVfehiale6pCpwPt43jx
	2pVqcs4xA88stEVh9agTOOUQpzM2ufIxRGJPvYEpYOq3PBu9JYwhKH9nvTgl8D/Xt8VI6AHn6+P
	4YZ/bkEJOuaLmTe/vjeN4yRGbGs+PGroIXKWhJA+cuNDwg7VEH6kTw9OPn1FgPf/2NdNY2/WeXK
	rcnmpJi25v5D9+iFqO8yGQ/UrMOqTHdnBZA==
X-Received: by 2002:a05:6a21:699:b0:3c3:a948:e2dc with SMTP id
 adf61e73a8af0-3c900759828mr3817647637.27.1785435364789; Thu, 30 Jul 2026
 11:16:04 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 11:16:03 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 11:16:03 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260728121138.1103610-9-tarunsahu@google.com>
References: <20260728121138.1103610-1-tarunsahu@google.com> <20260728121138.1103610-9-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 30 Jul 2026 11:16:03 -0700
X-Gm-Features: AUfX_mwuYQlBmJdhbZSf7MRgmwyNG_KfxbR45Duou2tcQqjIodL3cnnQ31aoSzA
Message-ID: <CAEvNRgGJ0s5Vu8xRvfPmA39p2Bmkr-U7JFFkshM9Dyk9j+t-YA@mail.gmail.com>
Subject: Re: [PATCH v4 08/11] KVM: guest_memfd: Add support for preservation
 via LUO
To: Tarun Sahu <tarunsahu@google.com>, fuad.tabba@linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, seanjc@google.com, dmatlack@google.com, 
	Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, david@redhat.com, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, sagis@google.com, 
	Paolo Bonzini <pbonzini@redhat.com>, Mike Rapoport <rppt@kernel.org>, Alexander Graf <graf@amazon.com>
Cc: linux-kselftest@vger.kernel.org, andre.przywara@arm.com, 
	michael.roth@amd.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	will@kernel.org, vannapurve@google.com, maz@kernel.org, fvdl@google.com, 
	kvm@vger.kernel.org, oliver.upton@linux.dev, kvmarm@lists.linux.dev, 
	alexandru.elisei@arm.com, skhawaja@google.com, aneesh.kumar@kernel.org, 
	linux-doc@vger.kernel.org, David Hildenbrand <david@kernel.org>, yan.y.zhao@intel.com, 
	kexec@lists.infradead.org, suzuki.poulose@arm.com
Content-Type: text/plain; charset="UTF-8"

Tarun Sahu <tarunsahu@google.com> writes:

>
> [...snip...]
>
> +static bool kvm_gmem_luo_can_preserve(struct liveupdate_file_handler *handler, struct file *file)
> +{
> +	struct inode *inode = file_inode(file);
> +	struct gmem_file *gmem_file;
> +	struct kvm *kvm;
> +
> +	if (inode->i_sb->s_magic != GUEST_MEMFD_MAGIC)
> +		return false;
> +
> +	gmem_file = file->private_data;
> +	if (!gmem_file)
> +		return false;
> +
> +	/*
> +	 * Only Fully-shared guest_memfd preservation is supported
> +	 */
> +	if (!(GMEM_I(inode)->flags & GUEST_MEMFD_FLAG_INIT_SHARED))
> +		return false;
> +

The above check can probably be removed. I think the core thing about
this series is "we can preserve any memory that doesn't have any
encryption state that goes along with it", and so the check for
kvm_arch_has_private_mem() below would be sufficient to gate that.

> +	/*
> +	 * It makes sure that no memory can be converted to private
> +	 * even if it was initially fully shared (in-place conversions are
> +	 * prevented).
> +	 */
> +	kvm = gmem_file->kvm;
> +	if (kvm_arch_has_private_mem(kvm))
> +		return false;
> +

For now, has_private_mem == has some encryption state that we can't
preserve yet.

This also gates off KVM_X86_SW_PROTECTED_VM, but I guess that is
intended, since when work is done for preserving encryption state, we
can then test using KVM_X86_SW_PROTECTED_VM, and only then, remove this
check?

> +	if (mapping_large_folio_support(inode->i_mapping))
> +		return false;
> +
> +	return true;
> +}
> +
>
> [...snip...]
>
