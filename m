Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D5656C634
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 19:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788895129; cv=pass; b=i4j+xMO9p1Yk6mmNvUIUieeBV+qsgRVpUEOwyYrrvPCbmxdkKMCqBo9lJrwrzuiRxV2Bf1ku0qMqrEWD8FuOj/K9TaaW+BYZEb+khz0iTMh91nX/p7ImjpIhv0a4wPu4xY+tzepvjdSPkw9xM7i1fW2ptwikVnEpyjKqkG+OuTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788895129; c=relaxed/simple;
	bh=iF8wAwPOdw5l+3Cf+6kzkcaY9d4H9emgCFQIITZ4gH8=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bqLjOpDSYdYh4Q6SbrIP3bbycG3otwwnwMWmfVQUQkrh47zcvaGfnYwaw8uQNEFjlHMNHd4p0dE3ePSsnFmeYC45lSA1D9m5v2aKdRk+sYm5xt7P0NJefEoKDsRIlZBGRnWtlJJ6ytjXTzHgwpHfH59B1hxJ7x7IH5u5Ak5VW7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jU3BKaz6; arc=pass smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jU3BKaz6"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-90cc0ebbf4bso43885966d6.3
        for <linux-kselftest@vger.kernel.org>; Tue, 08 Sep 2026 12:18:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788895121; cv=none;
        d=google.com; s=arc-20260327;
        b=CK517o9swEZsjREgraCYn5/olejuN60WAFPUssgt5hYrn/cPZu01RBpYc0h77JlE+S
         Z2oWf9gVL9xhshsMHoJPljp5DZf/6XNvXjrk5z4IHnSSoe4y6+Fjs4WLQygbAb3LTi/z
         XRJyi1f6nhPJgKpO2h7VupW5DPXLsiXjJoquGIZKCka0TZtDj+csfzJzVpYfYmdRO5A0
         wDhnqXeXpVLX+vO0QmWlbSRn76Mzdbc+JYTjiDg5/Swxdy4Rb+sjgc2EsVUMYf9t/Z27
         WpM/kvqbNVphZa/1xSqR97tSYJXtvjZYWfjUVBs7monXu8sFDruiLGiNL3xDG5UZeUcN
         HAgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=X8Qt7g6L7Ojilnm+sGhiq7WuzC+eIMrDfW/7+fmIyko=;
        fh=EdpZUXZNTgyXU/WMXKVPBSKDxB7OAQlgee5UfyjVbj8=;
        b=hltpVJeKbUESCkCEPlTO5iEe9s/btvlywDNAGD2Ch01vEwhd+c+n/31kx77SaUuNUr
         f+EauBXP+VHRUl3fRke5wqM0pKspwBfJt1hUueZq1Ft/rkNzyQ4nloNFQ+mNF05Nocd/
         ITK9G+Wzzb2PoH+NkEDY+HFIQyIK3WOF3iS86ZcsWLWFzaQUNDzkJLBEIaqEKgebXO/R
         LVdJQF9OHngwHU6y2BHRR+iNhQTLyuG5gZUhdpig/t8YtCsz6oY/RQqIs1dF6qZg4KYk
         siPuI9VKcVtWrcYC2iH7l9hcDrArof94Uf2MXU8LemL+N/ftHdh05HkPc2Y48GO6UELt
         gqug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788895121; x=1789499921; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X8Qt7g6L7Ojilnm+sGhiq7WuzC+eIMrDfW/7+fmIyko=;
        b=jU3BKaz6tK34z124OveImkUQ+Mt+/YIIjfsIdW7cIVq9OQ1BvMRQsv5r1uDdElC/oM
         byOYvzELiLygiX66M4jnIR6qqMPjbdTz1vc/3x9tGoanK7OAMsLLLc6cczC7CukCwT58
         GKf8MbTh9KUVSTtRfTdlE/bgtYKsSOoV0YoBQcPQdDHvMS2zWL7iKrzH13cAeWoJb+CZ
         AW4D9jLaH7OLMymuYOXSQC9WzVTHVnbcpV5XcWpLZv658BnyKqthzP5qVu9FkBh3DKg/
         T541cmfGTAFdyHZiNzgawLs3cfz1ojuQjXEg2qNEwO6l8ksrg0P75ApLIG6jzvGKFGHR
         Mheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788895121; x=1789499921;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X8Qt7g6L7Ojilnm+sGhiq7WuzC+eIMrDfW/7+fmIyko=;
        b=B4Ps0NjLg0h9BPOgY5PbuttMpmHD76GrjCMmNhiUybY/ljz2Z/tHpdUUc1EOTT38eI
         idhnyvr/NTu6BO5MiqbQP1mq9EmKSXGh5pwzpFh7CeGtf6eYQEOPqS/ntj4C0H11HUA2
         NsO930hOp0jbN9s09dCkht4d/AdPwle9SmBFegudBALbiILa6x7zXcZmQCJ2vWrSxPHp
         UkvbktRfj0x9kbfMuaQumWPzICmjP4emjSLsmPP02vUJzqrr4NyNAvlAaJexbq24E6Wj
         OQnBZa9hv9flNTcp6mAl5q1HrICKVnlkf4/hNMZLvjkjzmPEQkQVD1D7tORz4XtqT8TR
         gy9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzDiPmk8ptjECXec8/Out/7NLY3QdSlWcVuyJnJTyJnoOIOM9Gz6K8igfzGCK3Yn1K7/DFJ8phNRXguf51lo70=@vger.kernel.org
X-Gm-Message-State: AFuF++lTcjUOSc+QaQIq3511QwebbLOWuNgEA+N2uN0OJa2oUaLL5L/Y
	Q4BNZNHxC2odGK3rFVi9r0U/rN1C0iqpRarl7hinNbvPl5+wFIvynTHAVjChSWj6o8+CoXpK4+q
	CAia/G+NgjPCyzQfA2X5bB+X2RMILSKD/TZeze0rD
X-Gm-Gg: AYBFou2zQb1WGuUcxyfjnkQ4EwKSmYfSwaIYytpVJEaMXjCB5Axc2OjGPhYK9PzHdDz
	53ABCxqV4CCSqHF4REAg44xwWW+rV0+K3NOLWuz/mOpSYE63SlIqIoQFV4Cl8XHV6DcUXgmUP0c
	2n+MxQyhoMWtHVwTZ+DVqA68ZepA11FqiM7+7JoN/bb0tAetlKLdkJH7E7hxi67zq+DfaeAZ7PZ
	5667XDPHwW4Qc3A0ci6T7aGz1jLAOBuxyAtSPhOA7XBkq5tCby2wItF3Q4acJQdLkA9N1E0E4v7
	WllcvUErqOJnXKo0ME3qnhubAzymg1FTUPG87FPl858iW1+xRjKj5z4ezZP1HGp7zUafNvBMaCq
	0CDyfKKiev0KkA2rbHs2lmfLITbFLVg8=
X-Received: by 2002:a05:6214:8110:b0:90e:8d49:1ca2 with SMTP id
 6a1803df08f44-9103ef006e4mr328434076d6.2.1788895119795; Tue, 08 Sep 2026
 12:18:39 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 12:18:39 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 12:18:38 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260825081448.GB3694338@pedri>
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
 <20260722-tdx-selftests-v14-11-15ad654a50db@google.com> <20260825081448.GB3694338@pedri>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 8 Sep 2026 12:18:38 -0700
X-Gm-Features: AcwNN1X5p6qITiCXmMYSZPSPB-N20ut6cFscoALs2WRbCQrztSKzH7k_if4I128
Message-ID: <CAEvNRgHiQ5g94SQ8S6CTyTmEOguQqY9GmQUu1K8ff9L1pALpQA@mail.gmail.com>
Subject: Re: [PATCH v14 11/22] KVM: selftests: Set up TDX boot parameters region
To: Peter Fang <peter.fang@intel.com>, Lisa Wang <wyihan@google.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Chao Gao <chao.gao@intel.com>, Chenyi Qiang <chenyi.qiang@intel.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Erdem Aktas <erdemaktas@google.com>, 
	Ira Weiny <ira.weiny@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Kiryl Shutsemau <kas@kernel.org>, linux-kselftest@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, "Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Roger Wang <runanwang@google.com>, Ryan Afranji <afranji@google.com>, 
	Sagi Shahar <sagis@google.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Oliver Upton <oupton@kernel.org>, 
	Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Peter Fang <peter.fang@intel.com> writes:

> On Wed, Jul 22, 2026 at 11:13:16PM +0000, Lisa Wang wrote:
>> From: Sagi Shahar <sagis@google.com>
>>
>> Allocate memory for TDX boot parameters and define the utility functions
>> necessary to fill this memory with the boot parameters.
>>
>> Co-developed-by: Ackerley Tng <ackerleytng@google.com>
>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>> Signed-off-by: Sagi Shahar <sagis@google.com>
>> Signed-off-by: Lisa Wang <wyihan@google.com>
>> ---
>>  .../selftests/kvm/include/x86/tdx/tdx_util.h       |  2 +
>>  tools/testing/selftests/kvm/lib/x86/processor.c    |  2 +
>>  tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c | 51 ++++++++++++++++++++++
>>  3 files changed, 55 insertions(+)
>>
>
> [ ... ]
>
>> +
>> +void tdx_vm_load_common_boot_parameters(struct kvm_vm *vm)
>> +{
>> +	struct td_boot_parameters *params =
>> +		addr_gpa2hva(vm, TD_BOOT_PARAMETERS_GPA);
>> +	u32 cr4;
>> +
>> +	cr4 = kvm_get_default_cr4(vm->mmu.pgtable_levels);
>> +
>> +	/* TDX spec 11.6.2: CR4 bit MCE is fixed to 1 */
>> +	cr4 |= X86_CR4_MCE;
>> +
>> +	/* TDX spec 11.6.2: CR4 bit VMXE and SMXE are fixed to 0 */
>
>         This is now out of date (11.9.2 as of today)...
>         I wonder if it's better to just say something like: "Per the TDX
>         spec, ..."
>

Makes sense, thanks!

>> +	cr4 &= ~(X86_CR4_VMXE | X86_CR4_SMXE);
>> +
>> +	/* Set parameters! */
>> +	params->cr0 = kvm_get_default_cr0();
>> +	TEST_ASSERT(vm->mmu.pgd < (1ULL << 32),
>> +		    "PGD must be within 32-bit address space for 32-bit boot code");
>> +	params->cr3 = vm->mmu.pgd;
>> +	params->cr4 = cr4;
>> +	params->idtr.base = vm->arch.idt;
>> +	params->idtr.limit = kvm_get_default_idt_limit();
>> +	params->gdtr.base = vm->arch.gdt;
>
>         vm->arch.{idt,gdt} must also be 32-bit addressable here, just
>         like vm->mmu.pgd.
>

Something like this?

    TEST_ASSERT(params->gdtr.base < (1ULL << 32),
            "gdt must be within 32-bit address space for 32-bit boot code");


>> +	params->gdtr.limit = kvm_get_default_gdt_limit();
>> +
>> +	TEST_ASSERT(params->cr0 != 0, "cr0 should not be 0");
>> +	TEST_ASSERT(params->cr3 != 0, "cr3 should not be 0");
>> +	TEST_ASSERT(params->cr4 != 0, "cr4 should not be 0");
>> +	TEST_ASSERT(params->gdtr.base != 0, "gdt base address should not be 0");
>> +	TEST_ASSERT(params->idtr.base != 0, "idt base address should not be 0");
>
>         Making sure that cr0/cr4 are simply non-zero feels kind of odd
>         to me. And cr3/gdtr/idtr all came from memory allocators with
>         non-zero minimum addresses.
>

I guess I intended these to be sanity checks that the caller didn't
leave these unset (defaulting to 0), for an early warning to the
selftest writer if something went wrong. I'd prefer to keep something
that would retain this early warning for the writer.

What would you replace this with, to provide the early warning, or would
you rather just remove it?

>> +}
>> +
>>  static struct kvm_tdx_capabilities *tdx_read_capabilities(struct kvm_vm *vm)
>>  {
>>  	static struct kvm_tdx_capabilities *tdx_cap;
>>
>> --
>> 2.55.0.229.g6434b31f56-goog
>>
>>
