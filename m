Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794346785;
	b=MsuqnwiwZmjSPNOM0ibEe3pBeY1+6kCGpoOXO9C7jiS9iXoGkxddh925XQu/F4IHy5NM
	 8HF5hkJEtBvVhofUQ9T4kDQWzJFJ94fm+Cw5B0LLQ8oTMlffB7ICArfFEmvclSBPv7m5a
	 fEikHRJApfldElyNTJ7FAVgq1vNVQf+tjNBwTpSmX1fKYT5/y83PMJVlSQIRuc7PZkMaP
	 he1BHdAd44usN1yI5AW0BlV/LcdosmCKWp1Q5Wl7nRC7BSYDNQpafziVQT8nm2vwzfPN9
	 mlIQ1kXsvi6uRBvxNlP3A/rmmJAGgl/ojgsCcsG3FjBxoQbgWS/Qhdd/Z2En80Ti+bw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794346785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=iE/aw4N49+XkvXz5BpRtqkYQEcfxLRfryXdyEysnhdM=;
	b=2PdU2MbTsEiXt0decFz1Ex1NfBJu7LlIQBOZ6fGviGK7VmZxmBxK9/wfRFfNLM24O5Jo
	 H7TBDEYA03p6lJiV3m20Hz7BipcwOko/2Fg24igkbxvP468CRxEOv/cOlXgYGzVCdGNXt
	 G8z82Bo6GCQhc9fgkOH42Bpa4IrZTsxXHU7N4A8QWhxK1xcoV/oEwREpftPt2npEudkXU
	 DyFnZe7pDtWKWtrVNxqV2k8HoD+uyojnsyTli1/QQaM7ZSLbb66ewC+826Ir6N4MaqGyx
	 1YWpQO+/AVy7Qxm3TcqtosCZBQ7CQmKYHPB174iiSKCWZpZznEUOdlgGrHnwnKv1NBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=H+ckaDOt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2289606A320
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 21:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2289606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=H+ckaDOt
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93a40a9a01aso321214885a.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 13:39:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794346784; cv=none;
        d=google.com; s=arc-20260327;
        b=aAVtc2ZthKPFr5gjB8//ZMo8hvEan5a8NBoqlo/0kjJPtnyJwo8smbMYLyRmIArRX9
         9dQ81aPXsKK/EEauduYPjfGsaAOKIZKwnYZZZXGJj8HV2SWNnq3I6WpMTbpZGyf0JbSl
         2ce9LBTFgoLAGiUyTrSzuirdSRCFf4MVPHgdDq29Hq5UO4Dq8zcIfb32bjxhN4tasEkg
         2tJc62AxqK8MllRRbFbTF8qfZtNpZuP6BGUpwxj7ja1/r7RmB3MLdq0iryyZJAtSd5tR
         vKsNl+FGviJpysbRlPCC3dUi1a4Z/6k4JEt4T/jridsNmAWGIxPhfUrolKAgtdUtaS6j
         Tjhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=iE/aw4N49+XkvXz5BpRtqkYQEcfxLRfryXdyEysnhdM=;
        fh=s3sP17zoww2m8vM1E6YLcMbzpzgFQpX/FqU/UYoq/5s=;
        b=YUnF9ldlDvjEyCQEw2+izHwSsIlZkoLVofA/JU7SjvhCOPzblr2bH6szjdfdD5r5Qa
         OPPOoU/rvrI6dOxcjptyjLGbnCXuimaKX9lJVHOiiXqVGhsah0sejpwbJL0NwSCjdTvk
         xYCt85p0xTWpT/uPFo+TlPCna+Au8qPpAJZ+ppsXI7HKemYLPWYPtyGHt9NOKCQPp5Zw
         fj6ijZZte6HjqKNXA/436Vc6mi/sHdmEQWFwlkkJCTdxqELJPSf5GfZ1WMzExIYv/f71
         UBFM29Nzpa7AdZ4WhcNfKS40tgiEmBM9bvQWql08pst5UnPp/eVLvgACDi8RDw8JV4r7
         9w5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794346784; x=1794951584; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iE/aw4N49+XkvXz5BpRtqkYQEcfxLRfryXdyEysnhdM=;
        b=H+ckaDOtIOCnhx/jrqwxkuv0aBI9KiHdzFKcnxZzU+YavdoHOOF9T5gZQo/BKGIJd6
         vCJnxtEyU1t8zXCF3zy+dayh8XujIc/IDqGWgWoCnFXN+9nfBJKvyCxGiciUfGkS2rp5
         GkwFHqpBAqPv88LVBaKM29pKQ2NHdr7fWYPMlYuj9M9RjNd1yT7GkteG0UXzt0nebfjV
         AH03p3zKot1FGaLx5ZPgGcPWpjOhVvnAgyO0lQNfm8L++CW2G81vD9mpYU9EgA2nEkbU
         OoZe9O/RcFH4+xgWiH4r4R6urcB+QQiMnBrRLf8CLR6hcUkikZCiBALj+XhMgQsgGAvY
         a6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794346784; x=1794951584;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iE/aw4N49+XkvXz5BpRtqkYQEcfxLRfryXdyEysnhdM=;
        b=ZkjKNFVmTD2XBUPGMkR2xkZU9LpFwYR5ZHXKYseF3ZIL4fAe/QO9nifdgYofopmRgr
         wGjdAj/SxY8opyKOPSYAOsAsPjjoBXKj0RndLRfifwR1M1pYD4hA8Z8VcArZvlrxWVx3
         aNnM72nRXwmSgSqDb+qK7suacpyfP+cQ46pHxCbssi1FblSUPWbtqirZHJVOt2Ee4KJB
         MVDXrsd+igYoLQcmh4CHFu1+z7WwGhxCzpPEHqYx5AbKOhbtwsSJ7s3PkqHL0Q2QuNmK
         qweQRuTngt52e7e0kdxcJBTzNGtQHms3XvInD+MNnp7gpiLtVXSZAmqIi+r29j+VFo6P
         hIvQ==
X-Forwarded-Encrypted: i=1; AL+hErGt4vJBI6UxRLd2tNXasOLt9KZpDkEKklSVJsAK4YntKbSYUPSIx9ySivW9UT5RgpHYu5DkNmDydRwpA8PQWn0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3bUaGtN0GI92gpSzZkX66bAeBXPr8Fek+1UfH6ANsf2wHHnqh
	opH6HoaihoU23X2tQ+GryJWXEHvhFtuJZLsWoM5wR1aMrQpuLBvxBvYEO8Dspy2iq6w2m0OqQq3
	Q2/KBMFa3LmcKasoRMAH1ddW+CMxKzEiHBPtDhzZz
X-Gm-Gg: AYBFou0PldtwOQ7PPaTG7/PLUtOWbxCNwySqbK1rc3sAbqkwPLIrk1r8zHDMldvkTb7
	i6aE8x4i141Vt8cHPTrJM78PEQnal+++vu52gCmWN9oOg9DOYRFTaPbMLc1+WNX/iSZ7Isp/+uF
	AoCiH3e5i1sUACkDWYp+xzL8Uzu76oC2lPe+7kfevAllToKwnVXiY9QV1TkaKBih2ea4bMe6P2F
	hHmV/1F6YFVi8bnTBanNurcEpEjjinnt5ahv7BfN20qUT8ihEzIqw/NVXpjC11kaV2xqnrzoxRg
	I9VYGesw4+m0W0T/hC9o7dEMLRX3gmkf2nC2s/j9d5RvKqV5lRsbLFKf6rT/FFTf5uBRQFNKL97
	nxF02pDiqXWGpmKeEH1U9GaEf/lGgRXjJyZAVwS+VGzGXNlTv/GAnUuqdcy4YCCXbGC6gth+KCx
	hYxpFjR4TRVy8wWwarHcI1SAw=
X-Received: by 2002:a05:620a:6cc8:b0:93e:c12d:4ec7 with SMTP id
 af79cd13be357-947ae8caf53mr124925085a.39.1794346783277; Tue, 10 Nov 2026
 13:39:43 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Nov 2026 13:39:41 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <avNpDjWxrgThIUXE@seanjc-mac.roam.internal>
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
 <20261105-tdx-selftests-v16-3-2024e8fa517a@google.com> <CAEvNRgHKQVLVza1dw9-OrDAt4-b6zbhx4T64D421sqb2MPWs0w@mail.gmail.com>
 <avNpDjWxrgThIUXE@seanjc-mac.roam.internal>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 10 Nov 2026 13:39:41 -0800
X-Gm-Features: AclHuK_rifyMl6fGwEhJizkpiNdLB8JMLlwRf05wofhoaOCF7vOAUu20dn_gm7k
Message-ID: <CAEvNRgF+-12qeZQyrHb4Z8MWOjOGEYQj1hebnxs2gC9nY+M5RA@mail.gmail.com>
Subject: Re: [PATCH v16 03/20] KVM: selftests: Initialize the TDX VM
To: Sean Christopherson <seanjc@google.com>
Cc: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, Shuah Khan <shuah@kernel.org>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Oliver Upton <oupton@kernel.org>, 
	Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Mon, Nov 09, 2026, Ackerley Tng wrote:
>> Lisa Wang <wyihan@google.com> writes:
>> > +static const struct kvm_tdx_capabilities *tdx_read_capabilities(struct kvm_vm *vm)
>> > +{
>> > +	static struct kvm_tdx_capabilities *tdx_cap;
>> > +	int nr_cpuid_configs = 4;
>> > +	int rc = -1;
>> > +	int i;
>> > +
>> > +	if (tdx_cap)
>> > +		return tdx_cap;
>> > +
>> > +	do {
>> > +		nr_cpuid_configs *= 2;
>> > +
>> > +		tdx_cap = realloc(tdx_cap, sizeof(*tdx_cap) +
>> > +					   (sizeof(struct kvm_cpuid_entry2) * nr_cpuid_configs));
>>
>> Would be nice if struct_size() could be used here instead of manual
>> calculation of the size. Same below.
>
> ...
>
>> > +void tdx_init_vm(struct kvm_vm *vm)
>> > +{
>> > +	struct kvm_tdx_init_vm *init_vm;
>> > +	const struct kvm_cpuid2 *tmp;
>> > +
>> > +	tmp = kvm_get_supported_cpuid();
>> > +
>> > +	init_vm = calloc(1, sizeof(*init_vm) +
>> > +			 sizeof(init_vm->cpuid.entries[0]) * tmp->nent);
>>
>> Would it be possible to use struct_size() here?
>> Or perhaps kvm_cpuid2_size(tmp->nent)?
>>
>> > +	TEST_ASSERT(init_vm, "init_vm allocation failed");
>> > +
>> > +	memcpy(&init_vm->cpuid, tmp, kvm_cpuid2_size(tmp->nent));
>> > +	init_vm->cpuid.padding = 0;
>> > +	tdx_filter_cpuid(vm, &init_vm->cpuid);
>>
>> How about something like this?
>>
>> 1. Query TDX capabilities first to get tdx_cap->cpuid.nent (let's say N).
>> 2. Allocate init_vm sized for at most N entries, since the filtered
>>    result can never exceed TDX's supported CPUID set.
>> 3. Iterate over the TDX CPUID capabilities, look each one up in
>>    kvm_get_supported_cpuid(), and append matching, masked entries
>>    directly into init_vm->cpuid.entries.
>>
>> This would avoid the memcpy and all the memmoves, though this works
>> as-is. Just an optimization/different perspective.
>
> At this point, I'll do minimial fixup when applying, e.g. if switching to
> struct_size() Just Works.  But I don't want to do anything more invasive at this
> point so that we can get TDX selftests landed asap.  To be clear, I'm not opposed
> to more cleanups, I just want to do them on top.

Good to know that this series is ready for Sean's apply + small
fixes. Don't worry about my suggestions on refactoring.

Sean, for this series, is the next step to wait for the merge to
kvm-x86/coco? Do you need anything else from us?
