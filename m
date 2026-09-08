Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21570599A26
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 18:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788890923; cv=pass; b=amdl3FwsVGQJlnEM04oAY7WLyGd5DjKQ2kBV2qMRt2F1PU0wEPfQ6ZNqreRLIB8dipFBorj2dT17Y+3WdZxxWrbGbho2YFrXFixzMUiLmW+V67Wz71v5IiXAGb3FszaxWysSknEbbLvU7/5V9dCHmuWGAhp9FC1jxWA1GWnRtCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788890923; c=relaxed/simple;
	bh=ctxwmMZG56iPJS4J71g6McGGkHju65sE/xDpcDOUvZM=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AM8m2wtCNy+9u1VoIHI8JHquHTS+nJdMP3lAYB17Y4QTQMV8qaHY2Pewlhptxq7odzRKXusM8sLohuT0AbbhQmYxidhxZquXC7dRFKmeTf3RKxBJLvRCEVH7NseWOlzJ8DoVYNDPVntLlCCrtcWMyrpiOOhrWZSCCkIrcv6w8xQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NtvV63uS; arc=pass smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NtvV63uS"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-90e7fd978beso85287446d6.1
        for <linux-kselftest@vger.kernel.org>; Tue, 08 Sep 2026 11:08:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788890920; cv=none;
        d=google.com; s=arc-20260327;
        b=ET8moep10N/LuBkbY2Z2VmPh8H7qSlwcJRvVRG63njc1b22728TCm2tW7T75uhEfFX
         Lhp29cOibFeuwcm6r+9CeKMYmZ6+pc5bNYxQ8lHzRY6bNOiurVcfAdtlvrEZH/Ayf3ne
         0Y91vCPkrbcL2AhuJA3MUXE+HzXYLlaVQe5biy+TLDxwRYWI9T91YkS+osWAr4Zg/Q+f
         1YezU13ZBT1j5ajmvR+mn6BAgG4+2UQcR5fSf8DFgKX/jAp6ILR3bKhQCB0v25amYYGu
         W7twlsTn5TlmO78teyMUDs/UhZh1SCu7khROXmjYr68WNfVzCqq6CRlUHduv9eB7D6eG
         +jrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=XkkCs0H0gi8/nvDnbQ0GVT3d+JJdjCr4VH0ja1Y149M=;
        fh=sE7Bgtuyp1mFP+MpkYF1bPK6vrcK+poCtiOcyDQFQgc=;
        b=cQk7xGOYoJhn0cS/9jEsCmutlA7R/LLNGj1fhkV0IW8ie61qQFNpNVYhqggmB1lP2v
         R4rKYbGeyBNHIk8Q24GLQ5m/+3UA0eQEF1WGGiMy67LmYnxHhmWvGZ09OnCJlZT63RN5
         6IVwi45V+hO3lXgJI6Iwtl/ld2R++gYOFIxR7Kcnc/xniJkBAtg/+CM6aQG9dAO3Jt3l
         JYepgnFH3vy02nec1AA6n1SDKvm1vvqY7SWxaWHT9q2PLcYaRgxvcF5lXYSXaNnhpnjX
         xzs9/NlQyfKRoRlFm0IaXvca0AJXYpqcslUQSpJ2kxmKRUonqWPb32Z+SBPXdWC9Xn2r
         KXKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788890920; x=1789495720; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XkkCs0H0gi8/nvDnbQ0GVT3d+JJdjCr4VH0ja1Y149M=;
        b=NtvV63uSxZbTe4MqYVxBGvDmGALPFsg4KI0EezFDE/xSmB7PKgJZdDzHTroZ25dMd0
         r8j9rikrAtywianuNUdNCozi4b4L5KDAQlHJ0yC1jXlUaQJ2HLEXVPLzQ9/tmyyw8/sK
         MQcKXTYgdmnn5Syts0/YkphryNVpGtoAqelPGl0nauMVB2HwScbht2lD5YV378y6DDZm
         bJ4bKIoswOpjKci+hw19nKfodHfweLVdrWM42lPaLL9vAyjBm72baTiqy9DDwxoC6Fxw
         u8eSeeWeCI99Od4tyKcphZ4QH7YLrbv42J4oNf4RW0jymm9gJKwVLrrNipVOZeyc4f2B
         pFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788890920; x=1789495720;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XkkCs0H0gi8/nvDnbQ0GVT3d+JJdjCr4VH0ja1Y149M=;
        b=fgwrhV6tkz7ln+Cclg/re4t8VsjmWnCluiBURy6CC/+82kpXb1dzaFIMQWz5hRGx/8
         F0Gn5UbgBrE/X1zuC+kjCGy01HaueNMQjp6ADJ032WNRfNMCH6LeX4peQg8+IGkNuRi8
         uZuzZh6nyRKouw2nbTyk0bCZOb+nK7nPGOKERMUdhU1KN2KEM941InuXYlI6/un5s22K
         rubHivnovKBmPspCEoFbCSEcFiOx8OlOdWWYKGN4cL2LCB+WOHjrHBixOqdjlwJFBTxo
         zNAtL0AnKZfEQDWhK2B/BHUG1QFKgFybs4Qgta+SY6ELgcNlxPxsxr4wYDincag79Uin
         gC1w==
X-Forwarded-Encrypted: i=1; AKwUvBxe4ZJkUOcIA2bbCvsxUYPNpSu44yqLCY6APEY8YYDr5LKHU33ipIsBviTcMyftm+hIM62dMujyHD6J3e1YUI0=@vger.kernel.org
X-Gm-Message-State: AFuF++mP2AN195KdUV1rlUzHPiY55Sk8SKuFDZTQYHG3CZxUkHGqClR8
	gvULlupW9zQGclX1Isy/4AfBKIt4LKAF/k4quHYu/o4Ph+AwXfDZ5XX7Z+39T5uzSZp/QGvolXM
	Jt+HwbjvCgMHYFmYk58mmKhbAJwQUj3nvTVrqq20U
X-Gm-Gg: AYBFou1nW/nteXaKv52x8NZImMZahiQpr6tL85XvR9f/lermAf+cNMM6msu3zKCYoqO
	pkY06jUY5WoI1lBfgk4IyjyMbHU9h6dB+lca/KXIZf/9jtoyg8wxqVZfY6vyGTi5bcj3lBkFqT0
	RKt1Vc4mOBMwNeaEKOdG3bWVizB9qQ/qio1sSdncT2jW152+bhRQC3hkBblTlDxGWuBSIb+s9G0
	UunuRT8rfXSZ3OMp6fvS7nHdBJGtXkSh825+MkRp5FeZawdU4HhsD3fbHQcWDFFxASvDdePiSre
	3n9RCL6lhpFn7q+NDa8BmSBe+6oYWdYqwARi+7mGFJX3/uV8+1G9w24ezxdNj0pnIqLCxfXTHT0
	DJUnga0vrd5IWdtwkamiNZSKYutLCtmjv
X-Received: by 2002:a05:6214:c26:b0:910:5235:14f9 with SMTP id
 6a1803df08f44-91052351570mr213426586d6.21.1788890918818; Tue, 08 Sep 2026
 11:08:38 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 11:08:37 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 11:08:36 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ap_Bpe7dZm_eWsJ2@google.com>
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
 <20260722-tdx-selftests-v14-3-15ad654a50db@google.com> <c8b7a800-58ed-4ef7-91bd-31da77763717@intel.com>
 <ap_Bpe7dZm_eWsJ2@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 8 Sep 2026 11:08:36 -0700
X-Gm-Features: AcwNN1VP_qB0f4TJcoKYWPiMzrCml_G_3zCXJ48132tpYvgvUSaM73PgQ25Ao6s
Message-ID: <CAEvNRgFHTAPYTVQ8a_PVdFLqQ8z07Uep2XhA9r_Ypw+D0WAC8w@mail.gmail.com>
Subject: Re: [PATCH v14 03/22] KVM: selftests: Initialize the TDX VM
To: Lisa Wang <wyihan@google.com>, Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Chao Gao <chao.gao@intel.com>, Chenyi Qiang <chenyi.qiang@intel.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Erdem Aktas <erdemaktas@google.com>, 
	Kiryl Shutsemau <kas@kernel.org>, linux-kselftest@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, "Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Roger Wang <runanwang@google.com>, Ryan Afranji <afranji@google.com>, 
	Sagi Shahar <sagis@google.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Lisa Wang <wyihan@google.com> writes:

> On Thu, Jul 23, 2026 at 04:44:08PM +0800, Xiaoyao Li wrote:
>> > + */
>> > +#define __tdx_vm_ioctl(vm, cmd, _flags, arg)				\
>>
>> sev uses the name __vm_sev_ioctl, I think we need to keep them consistent.
>
> While __vm_tdx_ioctl matches SEV, the TDX selftest follows a tdx_<scope>_*
> naming convention (1. TDX prefix, 2. Scope: VM or vCPU). I named it
> __tdx_vm_ioctl to keep the TDX codebase internally consistent.[1]
>
> Do you think we should align with SEV's naming convention instead of
> sticking with the internal TDX pattern?
>
> [1]: https://lore.kernel.org/kvm/489f3c7b-db03-43dc-bb64-910a0fcba31e@intel.com/
>

Given that __vm_sev_ioctl and __tdx_vm_ioctl aren't likely to appear
next to each other, I think it's better to have the tdx prefix earlier
to keep the TDX code consistent. To move things along, I think we could
continue as-is and not swap to align with sev.

(The sev functions actually look kind of inconsistent in sev.h, but
that's a discussion for another series.)

>> > +({									\
>> > +	u64 r;								\
>> > +									\
>> > +	union {								\
>> > +		struct kvm_tdx_cmd c;					\
>> > +		unsigned long raw;					\
>> > +	} tdx_cmd = { .c = {						\
>> > +		.id = (cmd),						\
>> > +		.flags = (u32)(_flags),					\
>> > +		.data = (u64)(arg),					\
>> > +	} };								\
>> > +									\
>> > +	r = __vm_ioctl(vm, KVM_MEMORY_ENCRYPT_OP, &tdx_cmd.raw);	\
>> > +	r ?: tdx_cmd.c.hw_error;					\
>>
>> I know it takes the same handling from __vm_sev_ioctl(). But I think the
>> handling for hw_error is not correct, at least for TDX (I didn't check for
>> SEV).
>>
>> the hw_error is the additional info, to tell the SEAMCALL return code, when
>> the IOCTL fails. KVM requires hw_error to be in the input, and KVM puts the
>> SEAMCALL return code into hw_error when the IOCTL fails due to SEAMCALL
>> failure. That means, when r == 0, the hw_error is always 0.
>>
>> I think we need to provide hw_error along with r to the caller so that
>> caller can print them together.
>
> I think the value of r is not important, because the ioctl failure
> is already captured in errno.
>
> We only need to fix the return values for SEV and TDX and have
> TEST_ASSERT_* print formatted error logs with errno and hw_error.
>
> - r ?: {tdx, sev}_cmd.c.hw_error;
> + r ? {tdx, sev}_cmd.c.hw_error : 0;
>

I didn't look in detail, perhaps Lisa could look into these:

+ What are the possible values of r? Is it always going to be 1 on
  error?
+ Is r always positive or negative?
+ Is tdx_cmd.c.hw_error always positive or negative? It's probably not
  one of the standard Linux errors, right?

Perhaps squashing hw_error together with a retval conflates the two.

In the lower-level __tdx_vm_ioctl() we could pass a hw_error and have
the macro set hw_error? That will allow the caller to print both.

>> > +})
>> > +
>> > +#define tdx_vm_ioctl(vm, cmd, flags, arg)				\
>> > +({									\
>> > +	u64 ret = __tdx_vm_ioctl(vm, cmd, flags, arg);			\
>> > +									\
>> > +	if (ret) {							\
>> > +		TEST_ASSERT(!ret,					\
>> > +			    "%s failed, rc: 0x%llx errno: %i (%s)",	\
>> > +			    #cmd, (unsigned long long)ret,		\
>> > +			    errno, strerror(errno));			\
>>
>> The if() looks silly. Why add it? And why change it from
>> __TEST_ASSERT_VM_VCPU_IOCTL() in the v13?
>>
>> Considering the suggestion of hw_error above, I think we need to introduce
>> the TEST_ASSERT_TDX_VM_VCPU_IOCTL() which accepts additional hw_error?
>
> The reason we could not use __TEST_ASSERT_VM_VCPU_IOCTL() directly[2] is
> because it formats ther return value as %i (32-bit), whereas
> __tdx_vm_ioctl might return a u64 hardware error code.
>
> I agree with your suggestion to introduce a new
> TEST_ASSERT_TDX_VM_VCPU_IOCTL() macro to print out u64 hardware error
> code properly.
>
> [2]: https://lore.kernel.org/all/a58e2941-77f9-43cf-a54d-023506dd7eb0@linux.intel.com/
>

Is tdx_vm_ioctl() the only place where TEST_ASSERT_TDX_VM_VCPU_IOCTL()
is going to be used though? If so, maybe we should defer introducing
TEST_ASSERT_TDX_VM_VCPU_IOCTL() till later.

I think the issue with if (ret) is just that TEST_ASSERT(!ret) already
does that same check, and so we can drop the if (ret) part.

>> <snip>
>> > diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
>> > new file mode 100644
>> > index 000000000000..e1ffb67a106c
>> > --- /dev/null
>> > +++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
>> > @@ -0,0 +1,120 @@
>> > +// SPDX-License-Identifier: GPL-2.0-only
>> > +
>> > +#include "processor.h"
>> > +#include "tdx/tdx_util.h"
>> > +
>> > +static struct kvm_tdx_capabilities *tdx_read_capabilities(struct kvm_vm *vm)
>>
>> make it const, is better.
>
> Thanks, noted.
>
>> > +	init_vm->attributes = attributes;
>>
>> Besides CPUID, it only allows attributes to be configure but leave XFAM as
>> 0. I think the changelog needs to explain why we need to configure
>> attributes.
>
> Thanks, noted.
>
>> The rest of the patch looks good to me.
>
