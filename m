Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9755530C60D
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 00:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782260018; cv=pass; b=WgZ1Vl0PnPuS1skwt/QblKX4GzVSMqRMfTIvhKnhwlAosi3qEftZ28g8shnWJqXJTy487far05PmrH5DhIVqrDQX5Pg+Prq1Qkn/cZ0hacuOZj7OQhRJRWIVtQBiEXUStkdfaLUVfaArduxWA5jbcX0HpgXUpoCWKwUgRZI2Xlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782260018; c=relaxed/simple;
	bh=RYAvvdGH//Kw5GkREKpzN/KALBoM5gNnUxyEPrhaWUg=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XkyfUB7IfMypbak1Ep6S2ypzivHGPWmM6q2WQQCG3f/2KwzoiwEl+aULTpk1wnd6HAs2mvmSn5X0cGt/IZAzNEHldQr820/T1UTyocz/trfP49nC39BLAKD3UHo+wuLNrijNXmVKe4/Vlc5ic19ymF7rrgLwqkT/OAzDbgBUVaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GfRD9DKj; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GfRD9DKj"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-137dd4cc208so678577c88.1
        for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 17:13:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782260016; cv=none;
        d=google.com; s=arc-20260327;
        b=ZhBZSVCAb59OkVQHGH4zwOpyN1gk4l8kKHTdODGEqoroNpuyyIXhj747iRFY18V3zj
         SQMHOKic0Gt5HnGAzeWPxlGCBADZ4DmdueajKNn1siqSUuRMCZ+lR7R7N9Nro4ig2JvT
         lsAlBL7TJE2qwNK8wiI1Z1CxyZqF1qvvTJ2N6f8WxAnCy4Txm4vDDkqTku/6bpYPUV/U
         d47wzIoU1QgOtUUoEi7K/+d22t4uMlCIc31986tEg5HaP7juZxfy4Jm/2lBhWxrb2L4s
         xSnL9ACG0CDl3ZymfR0y552c3grlw0WMbwU2CSmrkUBoewBjBojtkc2lSp7sDSWiHhVh
         SBhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=AXfKSlAh1VQG+yH3bfeaIisPmAkRsyj1F3ZP6iafDhc=;
        fh=QzBotTFxPfz7K17R5dFYSQBFi9SlOKL1wnSmYY/A9qA=;
        b=ddbj/xmUBlUapDKT9b0XW86sXvsPO/akYOlISmlYzWzNJ1AxxMdZAcYR5inC0FushO
         KyEo5+8NGFkXd1lmQHghc3sJBJxyhNY9WjgA5+dkLUDAru1ytxbsCatQ7zL0BYSh3bwL
         F2YiPVBX4dz9oqTsTljMgr7BX1vg+RNF9HiwaNaMVkulKlcTV1rgHDdb3wLCykanxudD
         tq7tVZdsgFmQZZ2ZzHGxchnJiODGiVdl2nHy+9BaAYSKliJh9ntkP5GJaVYFySlYhRN9
         On7LhpilUkeJre9QtvDE9N0MOWBrX87Ybl3JwQIKaebpRAYh3qu9W3SZVTBZLzSwNlPa
         tt8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782260016; x=1782864816; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AXfKSlAh1VQG+yH3bfeaIisPmAkRsyj1F3ZP6iafDhc=;
        b=GfRD9DKjO6m4etzUk23FUdNdZ3CSHx3IZQLR8z1RuC4yFdMZFOSvO7wGWuFO9Pz6of
         jT+8BdagviOTg+P0UeM8nDK4Epu4DE5TP0SF38dSlppFLVd3SPW3VhaB7YlkhLZXYCNl
         fSxXWnKMDhQeQprUfMAE+XDAx6oF1ysjXhc/2tKw6aq3111tun4ezu9+5ax+D00pec5B
         Q+qppo1NWHKgnbyqMG6M7HRL7gcjBZbl0kIHA2zEmBK62djTrJVYWBpSaQvCutelBG+r
         7jOGVfjeVx8YuUk5wztCZOQZD9S7Xs3SZzTjThhoG0uLs8q7D/7CLT+pRt7lAIPJu0F1
         DGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782260016; x=1782864816;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AXfKSlAh1VQG+yH3bfeaIisPmAkRsyj1F3ZP6iafDhc=;
        b=J97wOLYpKnyEZecKyQUjrgYK9uRZqn/vVFfJjokqiiRvarkrib53kV6zpHBIVJdbXO
         w/2dnL/zf50KC3CFvwwOrPsEYb5hVG1hUSS9XGmFpuIb4ijouPzfy2A98Uo0y2RxB2Bi
         km7/lOTQdUu8rZ7n6DaB4lwaiLYJLeVseDaWkV36lUUqkyOVFuvZ8wIIO8RTc0/010hi
         MEbsOqkvCfz1o6uDs8RKtyMUBziR7Gw8+ZGHBq3DN4Qz/b06me5tcIrehdEFei3CE8sX
         N5WNZMXHV5uUImPIl+YYCS+PBDY0QCs6wpqkU5LqjalBRfkrUS8SPd6DOj1ZVqOGSpPc
         L4Dw==
X-Forwarded-Encrypted: i=1; AFNElJ9Lij1jTz9tHaAPIkpFvgDvJ+qlSMR/NsHVb5DR7N45xS4YTnMunnH8E0cRfgBKTdnTZPNWNrmHC1y4Csd1Q+g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCoBmbso+3B6ATeQ3BtEOqS5nH68oCPykMW4MMBTRgbkfjnjP9
	rb1/zS8mKxWv2gf+edsguUzkucmALltBwM8h5kN3cmNCbIf3raR6DayQAXuJiJGio3KU7B7VUOe
	rVfMLF1JAPvGQ5ghgQvurqdlerEls2kwQYCpSo4dW
X-Gm-Gg: AfdE7clgpCwgHugGw0vehl+Nauwm1ibSDP0sO9/YwTDrH1wU742jWWXJTBGg8QJo77n
	GMVHr/hbdD0dUym/TDglkK5KTf6ew4lQ1FASuFa0+TmKBO+vmOgpx2T7bsOzdJqgZHws48KCR1H
	GhFLY/hrwxVqYujhpKbuX8TkcXzmFAPfHipsp0fOrXga6XoO43HaKC7mcOcLxTF8F05BlYt9+h6
	jlNmZQ6+rmEgVHSPfQkB0RrgQIph4lfXThMfRqCn14FbQ1l8jHGZRMS2fnQVMIvDsuQbvd6Fu9U
	5usg9fdphWptctSVdaM991kkvwi5QDGhjZyVA2xZ1uUpC5YuFr9VKo4GpI8=
X-Received: by 2002:a05:7022:fe05:b0:12d:c3d8:1f95 with SMTP id
 a92af1059eb24-139c3c12ca8mr4394599c88.4.1782260014848; Tue, 23 Jun 2026
 17:13:34 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 17:13:34 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 17:13:33 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <a21bfc05-787e-4cd8-89af-8579357e6a12@linux.intel.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-4-9d2959357853@google.com> <a21bfc05-787e-4cd8-89af-8579357e6a12@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 23 Jun 2026 17:13:33 -0700
X-Gm-Features: AVVi8Cdxrjo0g3tR27IbX_VUitZ5rT0F_mHH6JHHegralypGAFX77zV4x7wFDNs
Message-ID: <CAEvNRgGF+O7r-YHqcLp-ZgoXTCbqjuUhpOdD5eE5w2wu3YYYpw@mail.gmail.com>
Subject: Re: [PATCH v8 04/46] KVM: Decouple kvm_has_arch_private_mem from CONFIG_KVM_VM_MEMORY_ATTRIBUTES
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: aik@amd.com, andrew.jones@linux.dev, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Binbin Wu <binbin.wu@linux.intel.com> writes:

> On 6/19/2026 8:31 AM, Ackerley Tng via B4 Relay wrote:
>> From: Sean Christopherson <seanjc@google.com>
>>
>> When memory attributes become trackable in guest_memfd, the concept of
>> having private memory is no longer dependent on
>> CONFIG_KVM_VM_MEMORY_ATTRIBUTES.
>>
>> With this, on x86, kvm_arch_has_private_mem() is defined if some CoCo
>> platform support (or the testing CONFIG_KVM_SW_PROTECTED_VM) is compiled
>> in.
>>
>> Signed-off-by: Sean Christopherson <seanjc@google.com>
>> Co-developed-by: Ackerley Tng <ackerleytng@google.com>
>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
>
> One nit below.
>
>> ---
>>  arch/x86/include/asm/kvm_host.h | 4 +++-
>>  include/linux/kvm_host.h        | 2 +-
>>  2 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
>> index 8e8eb8a5e8a6b..1bde67cf6eb0e 100644
>> --- a/arch/x86/include/asm/kvm_host.h
>> +++ b/arch/x86/include/asm/kvm_host.h
>> @@ -2394,7 +2394,9 @@ void kvm_configure_mmu(bool enable_tdp, int tdp_forced_root_level,
>>  		       int tdp_max_root_level, int tdp_huge_page_level);
>>
>>
>> -#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>> +#if defined(CONFIG_KVM_SW_PROTECTED_VM) ||	\
>> +	defined(CONFIG_KVM_INTEL_TDX) ||	\
>> +	defined(CONFIG_KVM_AMD_SEV)
>
> Nit:
> Vertically align the defined(XXX) statements for better readability?
>

Sean had this aligned with spaces, and checkpatch complained about
having no spaces before tabs, so I switched it to tabs instead since I
don't think alignment like that is officially documented either way.

Either way is fine :)

>>  #define kvm_arch_has_private_mem(kvm) ((kvm)->arch.has_private_mem)
>>  #endif
>>
>> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
>> index 201d0f2143976..d370e834d619e 100644
>> --- a/include/linux/kvm_host.h
>> +++ b/include/linux/kvm_host.h
>> @@ -722,7 +722,7 @@ static inline int kvm_arch_vcpu_memslots_id(struct kvm_vcpu *vcpu)
>>  }
>>  #endif
>>
>> -#ifndef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>> +#ifndef kvm_arch_has_private_mem
>>  static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
>>  {
>>  	return false;
>>
