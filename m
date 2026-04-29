Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F903E277D
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 10:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777459017; cv=none; b=Cudyo3TQGhVJ7zAKu2p8EtDLNqP45r/pxJU2mrFbx++P+LDACZfgj2t8jroyo5I6eo1gjv3zoFZOJZfgilvtrqmLa+u/wyWHVZnon9ExfYO9RvS290a34PhuIhGR665TDKqxRGtCgQiG+ZyKPJdeg3UPP4lQMcGEoxWpVPvSQ68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777459017; c=relaxed/simple;
	bh=/oOkSzD6qmVsvpsVH9AtHt7dJBZc2mXnlIq7kZZektI=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:References:
	 In-Reply-To:Content-Type; b=P1j6XkspXmkrs6bbrZnZCR7QaUaaUay2ivaNoCdlpxat9eEuwPFPzf0t4Lv7y888L8bnBfX65INY5JkvlEDmr+5qMPVOaKJRmGqfUosJwEe/uvrER0C44dbCrQPGGq3wFruFi0nKPi8+qAu1xmRVgf8F2HgkeEH304oyWqjyhMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T9ZAIYPq; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T9ZAIYPq"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43d7badbd7dso6102681f8f.2
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 03:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777459015; x=1778063815; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:user-agent:mime-version:date:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a88lVFGd0bTcNDpi0vvKuLvilGml+v2O2rcvl8VmwI0=;
        b=T9ZAIYPqkBrI8o4vQs7lkXaGcAZZ/KN6BWBrATmeNr6SSDOC7owEXslRXlb8PL0O30
         KJoQrtC+/DjmFwWmRVIwNwgOI+N8RtCYhcmSsSA5b+YJyGC8aUt+svYSB93VUyj/CqBe
         vNinq6lDEU8XDXnqBJGccuAD4m4oTynYNDWVDGtZ3kRFBRz8I7VoXX1zZy6na+9P7vzV
         bTKg5Wlj25+mJyYhGA0bARJ2ecS6vICa6incCd2bNw8hZ0LvoZYPJJW3xp3FFmIQ1qHY
         O+0pQklqKVKW8a/rW/szcnKAS2CbMt4mIXSBPofoHuX17igNW/9xmI8hp2HeI1UrhHDI
         FI0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777459015; x=1778063815;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a88lVFGd0bTcNDpi0vvKuLvilGml+v2O2rcvl8VmwI0=;
        b=Ban1KuWu3Xh4uD45B5kyeHR9t5oC9aT/VuJZY3iFqwtCc6fAOUEU/+OCUWwL6KDfXo
         9xPC1HLhCGCqa7q5nXHltAgUySC0+cp/n3AiwXpTOREUz9EDLTT+ko1lJvxK0fYPNF7B
         W0Yr1n93RuUDQcDJcxxOw0DTU9955Jyu3yOJUrdcYukvkHzFBnDmoUAi90q7eO1O/8Qr
         jyg+9eoL6IS11Tcm48KOTtZgDQJbBBdfzTD+gY8cLSggcf0yzIRU4mc3WxTzA91I5cVq
         DqrXHinsezs4mLLHHbRIi11HAdLV4Grtv49eDwcqih93zYvOCpvFi56BBF220jvFj8rQ
         IazQ==
X-Forwarded-Encrypted: i=1; AFNElJ9lJomOHywrpoD9lfkSjCcVozbK58dlB36/a4FGbp4V2a4GAls4HiZ8wH22q/hNkndm5oJ/AH11uVgT9FiPF40=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7Ma3XDZyxSYGyRUr7mQmRGLEQDuIwE4pDaJUR/VvcNCKxkp3o
	KR06RhpiYyH5tSWyqbRvkjqskrKfeCxxaWyVLXpp/fprvZ7vZAp4mVgM
X-Gm-Gg: AeBDievhPR15DveNTeiyjVepAHkdBsidDGE5M0xHJSGQBIWB7ZrT5YTtoypCKy2rbJ+
	9C83zzFM4D3DuSirJkONdcrb2BtVHkuC1PWCewAUR0m+A2J1DfSZ/bw6r5MnM/orG5G6b3T8LEr
	hScRR5SqtspY2Bt0Rajx53Z+g1GHfMpWM3pbPWMkwFISiMmaVeGU18xMAGVZf+XajWufm919j7u
	rFBgP7ibg9pz1Ez9jOZSAgouWWxCQ0A74iIy2Uqz/hWOeqJv9ntCYMOkAzeBChRRZ9VuJbtwHQc
	Bj1rz7pnf92qfXWeCx0ulMbqKAAqpiCdRSHy33RC/q4X9NufTJExOyX1p8i0x4xLgAh5eAAm2de
	+AfqSNRVfCryfVvUe49bxeciJyAEGzrad7EP5E48CEZVJVE0DMwNLT5cqwzlo8Lb5/+D3bEESGy
	g1YsZceOQ/d4TEHEsJplF0s5rCJkn4u11orwTTUgs=
X-Received: by 2002:a05:6000:1884:b0:43e:b0dd:396b with SMTP id ffacd0b85a97d-4464a4470aemr12037851f8f.25.1777459014631;
        Wed, 29 Apr 2026 03:36:54 -0700 (PDT)
Received: from [10.4.211.108] ([15.248.2.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7217c2asm4556829f8f.19.2026.04.29.03.36.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 03:36:54 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <d56d47ab-1306-4b33-9120-8849a7b33928@xen.org>
Date: Wed, 29 Apr 2026 12:36:52 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: x86/xen: Add
 KVM_XEN_VCPU_ATTR_TYPE_WRITE_HYPERCALL_PAGE
To: David Woodhouse <dwmw2@infradead.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <c855535b4262ecd41f67734d19e8f48a7f014c2a.camel@infradead.org>
Content-Language: en-US
In-Reply-To: <c855535b4262ecd41f67734d19e8f48a7f014c2a.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/04/2026 21:12, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Commit 3617c0ee7decb ("KVM: x86/xen: Only write Xen hypercall page for
> guest writes to MSR") blocked host-initiated writes from triggering the
> Xen hypercall page setup, to fix an SRCU usage violation when the
> hypercall MSR index collides with a real MSR written during vCPU reset.
> 
> However, some VMMs legitimately need to trigger hypercall page setup
> from host context. For example, a VMM may intercept the guest's MSR
> write to track an epoch (for kexec/crash recovery), and then replay the
> write as a host-initiated KVM_SET_MSRS to populate the hypercall page.
> The host_initiated check breaks this use case.
> 
> Add KVM_XEN_VCPU_ATTR_TYPE_WRITE_HYPERCALL_PAGE as a new vcpu attribute
> that explicitly invokes kvm_xen_write_hypercall_page() under proper
> locking. This gives userspace a safe interface to trigger hypercall page
> setup without going through the MSR write path, preserving the
> host_initiated defence in depth while restoring the lost functionality.
> 
> Fixes: 3617c0ee7dec ("KVM: x86/xen: Only write Xen hypercall page for guest writes to MSR")
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   Documentation/virt/kvm/api.rst                | 11 +++
>   arch/x86/include/uapi/asm/kvm.h               |  3 +
>   arch/x86/kvm/x86.c                            |  3 +-
>   arch/x86/kvm/xen.c                            |  7 ++
>   .../selftests/kvm/x86/xen_vmcall_test.c       | 96 +++++++++++++++++++
>   5 files changed, 119 insertions(+), 1 deletion(-)
> 
Reviewed-by: Paul Durrant <paul@xen.org>

