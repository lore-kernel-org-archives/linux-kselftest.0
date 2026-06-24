Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE7E3CC7D3
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 15:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782313955; cv=none; b=dLPi5Z+zhS82kVD2eHpRMFWruf/TslKuhzyKGETivl2KIW4w8Fqlcwk577aoF+Z37zJYAY5xNId6T9ynPFn0cFpNq61TgxPeijuPzG6RiOKRUHSHvy1GuCC/rjXcQo4AfKbYcv2/5FZmz6nUp0+F9nPA0ajhPxjU7y7uIH0+Vc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782313955; c=relaxed/simple;
	bh=YQ3/8MH+pHOzHZgS6t1eRUhjOfffeihprBIIfnMF1y0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NHEcnkSqTvutSSs6kib4rgRoS4u7ilJcBJ+1E+bL9ndx3RSvWes//FGMNue8oVv/ALSuelMwPobNuo7XGp0S2cVaIJ8RZ+bgaMCzNkYBGSvcDp0lr/dd88QwD5Ng2qUna0fpWS0YgWcF9eAj/66jBjY4Bf9Qpcc8trjEW2zkwyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YnGzROfu; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YnGzROfu"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-842211d6e48so1476306b3a.0
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 08:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782313952; x=1782918752; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=r4Rgqs0dmpAmBtoUIzRDi3XnAOaTZ7bU1jnGrXxRY7M=;
        b=YnGzROfu7qCNjuudkIxxEtTx9kMMyr44XBCg4CdBKKS0hpuBtFiSeYz9U9hn1L+lKN
         6NTTRIcAMHPZCRv8PJ8C0yFoWydFa7u2hQ6+g93kD6oJsWEGNDDlDLVFLSSYabsAjK7V
         bZsfO4vYk0POpljQRMg6WvYRuGFmJhmoD89sZK8IIPVq2XqlKX36B0VN4Sb+he2r/ge/
         VtXUFKS21QKEAsO5W/xX0gtWqUlc1x9JiDe55+6/hbmFLinGbe2a1t+Dp5/cZOLE84eO
         PSYjHe5kRLIbxtOcwTWbP2x/ITjOe2a/9T/rL3mc9gs1+RDU3oPRmshiXFsCrD6jki+s
         WkwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782313952; x=1782918752;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r4Rgqs0dmpAmBtoUIzRDi3XnAOaTZ7bU1jnGrXxRY7M=;
        b=tFMCzQIQlt0UmBvuEhANgwbF+mlXbe2Xhl2vFsTFGCH8WLd4reyG4dwd+LpNuBRdlm
         wYtpF0cyP66JLGDyRcVAMqykDwzRuDy0ppppGyG/2VID9WHf3HpFbaTjeeiCAiPXQX57
         XSOk9UbkhLheBC/TuOSQVOpiFMQdVkSGOAx9W/lb0n0jRfWnjggL/leCdBc7kHCNWrm0
         dIcpj0sv2nhoZsfomRuhvzbBnQgX5to7irnUj9LO1B2Wan/JANrlPb0nT5+sVAEFGIV7
         4RP9i1XNabD2CYtsX5PAnqiTxEo0IpX/v1WJmlAYl0YknEQo9GBe2uvlprnKenUzsC2/
         zfiQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Nejw9yOHc4WwYqh2uzM/jUr79iAOnsVB7iaBuoen/Zh84wAK+WOpot2Ujp8jEmDFAmXgJ28iLBevB2lKe/u4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBhO+8pLCSbUifvtsYzs7ai7kh3ZlKxBptrtcRk+KrjBWri8DB
	qWSwcKGJ30Ib/wcF/F3Z1xf/NApMGGwYyWuYBC/QqYKFmr8pruAcR0cqzUcAn4iLynqa0PWvBsq
	MQubOhw==
X-Received: from pfbjj5.prod.google.com ([2002:a05:6a00:93a5:b0:842:507a:6d57])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:b4a:b0:843:49f0:f5a0
 with SMTP id d2e1a72fcca58-845a2caa198mr4791522b3a.32.1782313951462; Wed, 24
 Jun 2026 08:12:31 -0700 (PDT)
Date: Wed, 24 Jun 2026 08:12:30 -0700
In-Reply-To: <CAEvNRgGF+O7r-YHqcLp-ZgoXTCbqjuUhpOdD5eE5w2wu3YYYpw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-4-9d2959357853@google.com>
 <a21bfc05-787e-4cd8-89af-8579357e6a12@linux.intel.com> <CAEvNRgGF+O7r-YHqcLp-ZgoXTCbqjuUhpOdD5eE5w2wu3YYYpw@mail.gmail.com>
Message-ID: <ajvz3uywXwa36FOp@google.com>
Subject: Re: [PATCH v8 04/46] KVM: Decouple kvm_has_arch_private_mem from CONFIG_KVM_VM_MEMORY_ATTRIBUTES
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Binbin Wu <binbin.wu@linux.intel.com>, aik@amd.com, andrew.jones@linux.dev, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
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
Content-Type: text/plain; charset="us-ascii"

On Tue, Jun 23, 2026, Ackerley Tng wrote:
> Binbin Wu <binbin.wu@linux.intel.com> writes:
> 
> > On 6/19/2026 8:31 AM, Ackerley Tng via B4 Relay wrote:
> >> From: Sean Christopherson <seanjc@google.com>
> >>
> >> When memory attributes become trackable in guest_memfd, the concept of
> >> having private memory is no longer dependent on
> >> CONFIG_KVM_VM_MEMORY_ATTRIBUTES.
> >>
> >> With this, on x86, kvm_arch_has_private_mem() is defined if some CoCo
> >> platform support (or the testing CONFIG_KVM_SW_PROTECTED_VM) is compiled
> >> in.
> >>
> >> Signed-off-by: Sean Christopherson <seanjc@google.com>
> >> Co-developed-by: Ackerley Tng <ackerleytng@google.com>
> >> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> >
> > Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> >
> > One nit below.
> >
> >> ---
> >>  arch/x86/include/asm/kvm_host.h | 4 +++-
> >>  include/linux/kvm_host.h        | 2 +-
> >>  2 files changed, 4 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> >> index 8e8eb8a5e8a6b..1bde67cf6eb0e 100644
> >> --- a/arch/x86/include/asm/kvm_host.h
> >> +++ b/arch/x86/include/asm/kvm_host.h
> >> @@ -2394,7 +2394,9 @@ void kvm_configure_mmu(bool enable_tdp, int tdp_forced_root_level,
> >>  		       int tdp_max_root_level, int tdp_huge_page_level);
> >>
> >>
> >> -#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
> >> +#if defined(CONFIG_KVM_SW_PROTECTED_VM) ||	\
> >> +	defined(CONFIG_KVM_INTEL_TDX) ||	\
> >> +	defined(CONFIG_KVM_AMD_SEV)
> >
> > Nit:
> > Vertically align the defined(XXX) statements for better readability?
> >
> 
> Sean had this aligned with spaces, and checkpatch complained about

checkpatch is a tool, it is neither omniscient nor authoritative.  And for things
like this, the *entire* purpose for rules/guildlines like "no tabs after spaces"
is to help ensure the code is easier to read, e.g. doesn't end up with wonky
formatting when viewed in certain editors or whatever.  So, ignore checkpatch if
it complains about formatting that is visually superior to what makes checkpatch
happy.

> having no spaces before tabs, so I switched it to tabs instead since I
> don't think alignment like that is officially documented either way.

This exact case may not be "officially" documented, but the general gist is in
Documentation/process/maintainer-tip.rst:

  When splitting function declarations or function calls, then please align
  the first argument in the second line with the first argument in the first
  line::

And there is lots and lots of prior art on-list (from me and others) that is more
or less as good as official documentation.

> Either way is fine :)

Please restore the alignment.
