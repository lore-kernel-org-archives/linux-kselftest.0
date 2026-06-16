Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39CE23ED6F
	for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 00:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781569573; cv=pass; b=npOIjn7nzw4cCZR9bhph2mS7N9WszwS23f73BTWNDuC0U77j0ighilAcaQHoGF/seuQTjgq+ajnRmRa4mirIOfXsOpk2VY1zztSuKg5e7SAIJOWe3++K/QPmqt/iPYPKO9Qwqn3A+ZEmtZxXAxlsH3SwLPH35Wx1fe3q5P/aEmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781569573; c=relaxed/simple;
	bh=Koo/Jz4gLUExZ40dyzu72YS8cluJLIEkZVQM02WKK6Y=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ha1mTaFNzUyxhzjH3ITocBh+GMboZKx2UIYeopZ7WZ6ugrWlYNxx5J0qWzYRR4c48f44z36lXJtGhZMdXLv5OLqNbukitNngHjtrsdNm+L2hQyk1Ycd4OL+G7A26Dap5TV5I9KexUsYxseawfAU4jbzTipuynBfV0qzvdto9L2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ArxYcBE4; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ArxYcBE4"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-13986d61b4fso186154c88.0
        for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 17:26:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781569571; cv=none;
        d=google.com; s=arc-20240605;
        b=XbgxEjl4u9zjNbi4pCurw4jzOwdsWU1y7oHpLyAoCLAOeVLwzTD4gqp71iJ/WFNbjG
         9U4bjqAu2O6/ShKVF+X9pP8hKjWbViGFdW8viCsWeJi7zDwdoMnoQd/eidPMkFiQF/e3
         Wm8OEF7cqgIlPxM1yEUnknkGln3msbG+TddkSKFhuOFkQP9Tm4n7wCSywzscbN5izLui
         12GO2e8NuD6QEtK+ecoCBW6g/wjs0lV3TMVHY2owFADscV4L7YvHI+TR6cNveoScg0GZ
         OLch04inyyufbuWAD2Pu9VXukGLnsgkOYt8YGcnBkE/u2vrLjBSlhsixnBTQL52hzHVW
         UBqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=tE+C1LABhu/HpTkLPZGmRp5SO8S6COXMT4jaz0dQqLY=;
        fh=EgrcxjWHuh5cDarQeZBEibyqRNJrB4eAzo63TIUOv4M=;
        b=A9HO8kTlNQ6FUqhMbE8NXpSWmysH6waItBl2MIU9SV7pWDTAhoFJqFgwfSYt0IHm1z
         pAX9l0gnEd9NQzb7b0AddhU77CLi3hIqrKUCtYt1ZgVzZgqM4/aWPVUlCuOaaMnk7Q++
         BxVs2MVSpuEfNenUnX3vV5/H3Qjr9xlmIwbZrH615HB630pFq2hw0pgJGrWP/v12S3qc
         VOqUFwgcmoDHoFjyhJK5x7XYnhiTF3If/iIfz07my/II3nIiaIV8JLf1czJgNzWnVLCO
         0EenLVK/AZW/+NlQhKB/P5OPaffogOqRs6qGN2jscZGcgJDry/ux+tpCbWPQPYF+vXGH
         xl+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781569571; x=1782174371; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tE+C1LABhu/HpTkLPZGmRp5SO8S6COXMT4jaz0dQqLY=;
        b=ArxYcBE4vDTUIJR4q48gNmk9WOq8zo7GAdcoxEnbJCxlPgNgkfm7y2xSu9AndEpO8h
         rkF4NLVjQG5RlClUzwz/F8C4ypfHIhiB3eZYX+Afo4W5g1g8yBHve4U8Xr3h5dY0WIOm
         VVylNAiCDZ330Z35iL1stNvhHhqlCUgPUp7dZF4TlkB/douCGyeePQ7OXW+d7YbqfYuA
         i0tdQTm7NvDkv1TCBHvCLkcP++tIqQQZBBJI+UF6AhfgNW3z2uu2iVEnr6Z35Edn/x20
         GvaelLOm21qcgfaYsexYiM76LajyTZEEwZlWSQEpzUeVO3Vscyl7RkLbGQnvGn9uedv0
         KZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781569571; x=1782174371;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tE+C1LABhu/HpTkLPZGmRp5SO8S6COXMT4jaz0dQqLY=;
        b=WHz2DmZV2ykj2O9kyUBFBZkkegw4/+zzarE47o+kgDrYnOXxxMZi57+oOXHnw003hz
         A7wAooqSIoWruEbtLaw/e0soRLIrKDbnzqxwvJK0WvffaYmdWlAhByjEwqQK3L906uYN
         b5J60RJ3kUYLAcdiRCHfnWwza8PH17Lmc0K7pvrkRS7kJjOyrYi0o/TEN4ufyeVu/Hjo
         JPxhvLJZYJXJemB5R0lDsHVVktjFIC6K5DapP9i0mnlBVjKocBNK9pELbCKg0izhKziG
         EivdD4s3BJ/bBzLGeaI8kpXNJ1YKyLulc6I4VSYvEj8B1Yp7DsyEEAYlzyv95wu3SOmo
         Sk0Q==
X-Forwarded-Encrypted: i=1; AFNElJ87NP6YVvqsOe+qvDdx4KiMlJ1JtITGtc321MRfcF8riCqgOvX/yQwJqpZU3pbvreQrqRfLCoD9WJ9zk38Qa/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKWFLzxaJD+xRLlFpBFxoBSIm0YyauDfCAR60hAFe7dnoMxOOa
	uS18cEVDcKqaoHmd4MMgKEiYpaM80zgUu7Bm4bgvNxAvj5r50KFu+oa7wtC9l4VKTuIZ31b7zXs
	acY6gidogaX30oSnkNdEqOdslLH7DHK8xbUHqAXZl
X-Gm-Gg: Acq92OFApdJi9ZJ27ZwsBHZvEyHDi8+zOiQf+5rAr6fFDGtSpDvkh9Hphil/NeRx0cd
	mqTbv1E5cIrGBMNC9eBJ9pilZefPyubaO0SxkY6GaaErS48SeYSZa1VcN1PMjoWtbBNmhjCW5uh
	D/z/Gs/+rOEAnsYk1HiHTpOcDJ3uwbvtlld3cbEAYJEHo9xBw3DRVRiHUYaPGttzkrhBhSKFIef
	nXeNP+H3ZxkICK80e/WT61tjvrX7gHgsrdu9O6cyFqcio9X7wT8wMIwoRillXCeB8y7a7C5EipR
	zg78qsj+DpihzDO0MIuSwXLL1sltoEht6Le3d8bTGgswqebSDIE/Tr8Kk54BCU0XN5Z5
X-Received: by 2002:a05:7022:baa:b0:138:407c:1d17 with SMTP id
 a92af1059eb24-1387901cbb8mr5193106c88.33.1781569569627; Mon, 15 Jun 2026
 17:26:09 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 15 Jun 2026 17:26:08 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 15 Jun 2026 17:26:08 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <aiM2Nm9Eh68mIVX3@google.com>
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
 <20260521-tdx-selftests-v13-v13-19-6983ae4c3a4d@google.com>
 <CAEvNRgHEq-hHcTivUw8TYBeMu-RpS=Ho4DXaNXKQKLPL_biTgg@mail.gmail.com>
 <aiMOWkiVBqoQDAPd@google.com> <CAEvNRgF09SfDm=OgbrS8-wpfxbNecQkqAQwf1ELq1jWu7NjbUA@mail.gmail.com>
 <aiM2Nm9Eh68mIVX3@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 15 Jun 2026 17:26:08 -0700
X-Gm-Features: AVVi8Cc5zceSfwq1JSECSJwoz8IcfIBykP9G13fuyk-9uS8vJvNRi0GOVDWkEoY
Message-ID: <CAEvNRgHjno=XDnMpTvZcNCR6D5RAi1rbynrL4CnnEa7Y-M3VLg@mail.gmail.com>
Subject: Re: [PATCH v13 19/22] KVM: selftests: Finalize TD memory as part of kvm_arch_vm_finalize_vcpus
To: Sean Christopherson <seanjc@google.com>
Cc: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, Shuah Khan <shuah@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Fri, Jun 05, 2026, Ackerley Tng wrote:
>> Sean Christopherson <seanjc@google.com> writes:
>>
>> >
>> > [...snip...]
>> >
>> >> Was kvm_arch_vm_finalize_vcpus() supposed to be for finalizing vCPUs
>> >> instead?
>> >>
>> >> The awkward part is that kvm_arch_vm_finalize_vcpus() is called from
>> >> __vm_create_with_vcpus().
>> >>
>> >> While building this POC to test conversions [1] I only wanted to create
>> >> the vm and vcpus and didn't want to finalize yet, since I still needed
>> >> to do more mappings in the guest (and I needed the vm pointer to do
>> >> mappings in the guest).
>> >
>> > Hmm, I would argue this is a flaw in the selftests infrastructure.  IMO, as a
>> > developer, it's quite surprising that the current value of a global variable
>> > doesn't show up in the VM automagically.  I totally understand why selftests
>> > work that way, but it's certainly odd and annoying.  If _that_ were solved, then
>> > the kludginess of what you're doing goes away.
>> >
>> > The other way this could be solved is by adding support for annotating globals
>> > with a __shared flag, a la the kernel's __bss_decrypted, so that loading memory
>> > into the VM can automatically mark the associated globals' pages as shared.
>> >
>>
>> More generally, is your opinion that tests should not have to add extra
>> memslots?
>
> I don't care?  What I care about is making it as easy and intuitive as possible
> for people to write tests, and to minimize maintenance costs.
>
>> If I wanted a shared page, would I have to do
>>
>>   static __shared test_page[4096] = {0};
>>
>> and then rely on ELF loading to put that in the guest for me? Are there
>> some compiler flags/how will I require that test_page be page aligned?
>
> Compilere and linker shenanigans.
>
>> If I mark 10 globals as __shared, would the compiler automatically
>> consolidate the shared memory together?
>
> Yes, follow the __bss_decrypted breadcrumbs.
>
>   #define __bss_decrypted __section(".bss..decrypted")
>
>> I think it's a bit constraining to require that all guest memory be set
>> up statically. It's nice to have but I'd like another option...
>
> You do have options, they just require more work.
>
>> Many tests use vm_userspace_mem_region_add(), CoCo tests that require
>> finalizing shouldn't be disallowed that option.
>
> What does that have to do with finalizing the VM?
>

I could add more memslots after finalizing the VM, but then I'd have to
make the guest accept more memory. Hence, I'd rather set up all the
memslots and then finalize the VM.

sev_smoke_test currently has a separate vm_sev_launch(), which is the
equivalent of tdx_init_mem_region(), and that's called in the tests
themselves.

sev_smoke_test also uses vcpu_args_set() after creating the VM with
vm_create_shape_with_one_vcpu(). Would that work if vm_sev_launch() got
moved into kvm_arch_vm_finalize_vcpus()?

>> >> It's also possible to have some kvm_vm_finalize() call that can be
>> >> explicitly and manually invoked from selftests just for CoCo selftests.
>> >
>> > Why bother?  It's obviously possible to all kvm_arch_vm_finalize_vcpus() directly.
>>
>> Works for me to call directly. Do you mean kvm_arch_vm_finalize_vcpus()
>> is the right function where the TD is finalized?
>>
>> For tests that need to do more setup after creating a vm, is the only
>> way out to call __vm_create() then vm_vcpu_add() to avoid premature
>> finalization in __vm_create_with_vcpus() when
>> kvm_arch_vm_finalize_vcpus() is called?
>
> Depends on what you're doing.  Sometimes, the answer will be yes.  That's why
> there are "low level" APIs, so that some tests can do fancy things, while most
> tests can leave the details to the infrastructure.
>
> If there's a recurring problem, or we anticipate one, then we can and should
> figure out how to minimize the pain so that tests don't have to deal with the
> same boilerplate issues over and over.  Hence the __shared idea.

I still think kvm_arch_vm_finalize_vcpus() is an odd place to be
finalizing the VM.

I would prefer to not have to explicitly call some function like
kvm_arch_vm_finalize() (no vcpu in the name), but a common arch function
calling vm_sev_launch() and tdx_vm_finalize() is what I can think of
for test setup flexibility, without too much magic.

For now, I can't think of many uses of __shared. ucall shared memory is
allocated dynamically, and we can also make it shared cleanly within
ucall code.

The global variables (sync_global_to_guest()) will appear in the guest
as long as sync_global_to_guest() is called before
kvm_arch_vm_finalize(), which I think makes sense to people writing
tests for CoCo.


So 2 questions to push this along:

1. What do you think of a kvm_arch_vm_finalize() that calls
   vm_sev_launch() and tdx_vm_finalize()? My key issue is that
   kvm_arch_vm_finalize_*vcpus*() seems to be for finalizing vCPUs
   rather than the whole VM.

3. Would you like __shared implemented together with this series, as a
   prerequisite, or later?
