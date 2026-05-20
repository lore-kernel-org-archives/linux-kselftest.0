Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF6E3DCD8E
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 12:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278941; cv=pass; b=GhqkKVEi1BlmLPrmUSv3U9VRdE91CrB6ZFtDvUCN0WdWUk+G9KjlqCEtnrIXHQQMkfO+pEfYSWXE2jN6tlDXXbfpMQRVKltch3fgJ4304a5hcw8zxDZFFXH1M9A2/Uys/XEPboBihlSky142fjbeI1g2w+e+xBic8BTX89maKZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278941; c=relaxed/simple;
	bh=UL5TH54YsejC0jorgc7QDDO4B8HZpwF6Hf/qda5tNFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tiUuF9VrPSbByAB9HOkeLwHbSP/4scy/3A7IpSfENWUygnAh7o4/ivduL0wDiOPwtVPCWCChu4U9fxxbSy8nUcTpqzy7qO/hqbOk9JXxI2HOVWYaM2IjcP3PMtK6vCDnbs8NI0tKCJs1UZFVYPvA4qwKow3ltxUBvXW8MAsvnt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vA79okPr; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vA79okPr"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-50d6b393d60so7941cf.0
        for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 05:08:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779278939; cv=none;
        d=google.com; s=arc-20240605;
        b=fYJ9gbpBr5seMMMIVavFrfPt+7jnxZCYqPZpsmHAQqxgzoH6lpsAUnoHtKZhxGHf1U
         TAnRIEPR29ZN1jbjsU4gm8Sp5NeIcaTiTov2ATyTPxQZ2fO9pWbVHP5X8DsZhpnHMxBS
         GvXXkceM1oyb1NB1pRnsdnfFV+5eEbuJLiXAtXDAzcYilNe71ulPER7W0xX3ocM4PgBm
         ZkBkLKuF/Oqa+UIyZvoLOKLS7Q4hUJ/kj18TcaztStLiwb8tRNJPODigs5iWFJA1vPgK
         /OXH4QwIerBcQKAro8P6/qx1xxEa+RS1nC8BCNHljxGhQsUDr/F3TQhuY9lz5htdy/PF
         JJbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+Px9FMSWQfRWBgPBzexC/j5D1iZQd5J23JXma/NqqOY=;
        fh=ItfjxlOVkZwIc+rAmSWSuGHNB+6o0Os8f3DvMSSzt6Y=;
        b=MIFVOu7Ny1L5i05AB0O60XL96GtuLdBUI/BlnyrmzzvBmjWwy1JhXjYQvrKr1m72Ze
         Ok2k2+baLmjBcEzl2vwFWjcP9SGBk4DHXowD/xvAJUqwft2bS3FqUea5FRRo2BCM6CeU
         v30MNzrwPWqY1Wfp7+qeqDWPKSz2cPp74vemSixXv7pzlbdCPm0Ch9Eqz27mIjkGlm8c
         KBI3UD30PyTu36j1KnSNX5WOSq2NjisKjF07FFGgnuKnpnil45j7btuNEJkkSenl7QF8
         dJoBhF2RIVbEdvxRcDuiibhUIUEg1hBN0fTySAuUnPu+h9fgk1pm5Bs3JsZ5kyjSYg3a
         Cphw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779278939; x=1779883739; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+Px9FMSWQfRWBgPBzexC/j5D1iZQd5J23JXma/NqqOY=;
        b=vA79okPrNl8/E58Oe6hC/PSwspCkodR6V4uLDnXuTL3mnZoq3pmr18UxTKlKQ0eF0l
         IOfCrnoq40V02E5ZNp+YB/CzGeDrIB4Uz6unz5fiOM5s2U0qHlU5TgPWy5MowFFrbNL2
         +iM0MFIOBnUyu2ci+T068ws8WkUGQf12du21hRH/KNK62CDlYF4J5Y3knhbN7bHiNtCA
         RFyq3AB+CKHw51QBseuCJj4rrLckY9nkZXOvQhh/CLjs2UJxlWKzAVPz0x/33Cqdk6AX
         bx+oRfwCxHpmDSXbC2LMr8W1T4id0XNp0Vjp6JrAjHMwWBervvGZhWxdQwjH6EynjVTY
         uqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779278939; x=1779883739;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Px9FMSWQfRWBgPBzexC/j5D1iZQd5J23JXma/NqqOY=;
        b=IsayU6p4XFYs6UufXnyNDh1aDHkU2RMXvfEh6f1md0TYMH8uxK9dDp7ltLL4iiom6v
         7tQqTrJ0gs1WLBCg7/Pv3Zv2jmCYsc+E0tsRYVrsTsH9hBToyUcBJO6qfIpYsOWMsK2L
         LWtTpnV0kXxtrmr0aTh1du04QFtLn4/3EYQFQyNldGnK0YZTLWVE7YauRhhCXOjg+98s
         EQGkBupmxYTYELZkW4bJL221HKH4Ucn8Tg+ewe0ZXJMuftC0AvFMV9Cmnw/i5E+AfsYO
         548jk7TnR63VoRHRo/CibffJ0FyG2DTmswzB94VSgFrE78WSsD8x6HsfEC2PJm01BRGV
         HATg==
X-Forwarded-Encrypted: i=1; AFNElJ9rKGLafS9zfOXe+8q2MbIZby3Jvvva2nBXtIq4qzF75m7pi4TDhlqMFjysZPhURPZgOHmjR3Bx7RXLdtYfP+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiEELnpY5Eeo3+Fc/MANN8gyrEHbsspxCuPXqibDdtFeRqBMhl
	1mhELYs3gYF1o0Fwy+zXloKDvspJSAdckD27CeFfGnmx85g76pMzglUO6mMeN6x52XWv0f9WRDD
	eCY6QQaG/e1y5Im/CQki+ny5VGxQFY23yITBkUp/l
X-Gm-Gg: Acq92OGCwbYkSnXoojxy9UV9wg/7pLEoOupceiOA9UIGFpRLJmvBru2ajwP86SOm4jz
	VbGwcmVpnFHj2b4w8hJequL0KEQZFqbpQyBsJgWfTCRM5Hqt7Zu5Mes9AzI8GyOyCXz53zLp2Qm
	djKuoANmhM9741uALhvDaM+/mRpmmAh9yKWLeVDL1qBLMAW+DDBB7Hl3oQMaHSRb9g830jY2PTP
	zsywZic65O3oPvf4W4UiqalSsD494w0YkUoli2/vXbA76sMXNEjnbj28J2G9hldX02N4X/N0Sni
	gXuwBZtHqXhuyRP7GL0=
X-Received: by 2002:ac8:7d11:0:b0:4ff:cb75:2a22 with SMTP id
 d75a77b69052e-5167b58811dmr18170691cf.3.1779278937787; Wed, 20 May 2026
 05:08:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-3-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-3-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 20 May 2026 13:08:19 +0100
X-Gm-Features: AVHnY4LfQbiWdiGwXSEhGQDtGx7oiVEOShaBU1_EGdecpQaasdwwwCwSujlZjbQ
Message-ID: <CA+EHjTzvkF93kznZ6e5SBu-w9Gc_Z4ryDwg7qnjzWSPt4KfNCQ@mail.gmail.com>
Subject: Re: [PATCH v6 03/43] KVM: Enumerate support for PRIVATE memory iff
 kvm_arch_has_private_mem is defined
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 May 2026 at 21:22, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Sean Christopherson <seanjc@google.com>
>
> Explicitly guard reporting support for KVM_MEMORY_ATTRIBUTE_PRIVATE based
> on kvm_arch_has_private_mem being #defined in anticipation of decoupling
> kvm_supported_mem_attributes() from CONFIG_KVM_VM_MEMORY_ATTRIBUTES.
> guest_memfd support for memory attributes will be unconditional to avoid
> yet more macros (all architectures that support guest_memfd are expected to
> use per-gmem attributes at some point), at which point enumerating support
> KVM_MEMORY_ATTRIBUTE_PRIVATE based solely on memory attributes being
> supported _somewhere_ would result in KVM over-reporting support on arm64.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  include/linux/kvm_host.h | 2 +-
>  virt/kvm/kvm_main.c      | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 7b9faa3545300..7d079f9701346 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -722,7 +722,7 @@ static inline int kvm_arch_vcpu_memslots_id(struct kvm_vcpu *vcpu)
>  }
>  #endif
>
> -#ifndef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
> +#ifndef kvm_arch_has_private_mem
>  static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
>  {
>         return false;
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 306153abbafa5..abb9cfa3eb04d 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -2421,8 +2421,10 @@ static int kvm_vm_ioctl_clear_dirty_log(struct kvm *kvm,
>  #ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>  static u64 kvm_supported_mem_attributes(struct kvm *kvm)
>  {
> +#ifdef kvm_arch_has_private_mem
>         if (!kvm || kvm_arch_has_private_mem(kvm))
>                 return KVM_MEMORY_ATTRIBUTE_PRIVATE;
> +#endif
>
>         return 0;
>  }
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>
