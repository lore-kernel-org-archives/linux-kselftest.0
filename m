Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3299DDC5
	for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 00:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782345949; cv=pass; b=G7nu4ig9mkew6com9OPmQrEQOJVfAeoeDHAWOmN16y78SA80fBi1+B5fR/LvXvgw2ijks4QFkDMeOhxVfK2KoQiunoT/wmyQlC5rABFU2csNEwl1lbkesoJjS0PiRyfjzX9VHd9m0zC1/I+k7CdSZxpTweuIWb+6gA+VL+bdLp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782345949; c=relaxed/simple;
	bh=Vhp59FnIevSXEEdWsugGzaR2Idu0ffRc20bSQFGQLZc=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bhsp5U/5bZjdWrsdhzBo7N6+uTy09WRpAC2HTgmUGwNjTN6BPD4+PUT4m4FUl1/t5blsZtBElTy5iHHkwAw0YPlWnAKNecX4yd10exP51u7mC9skwkv6xaypTJksT8hZvegimEZCL177nFBt2YWavwfyMZ8Hj0u4WdZu5VTCTSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hOKPGFlt; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hOKPGFlt"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1397e093f90so4576649c88.1
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 17:05:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782345947; cv=none;
        d=google.com; s=arc-20260327;
        b=ff8zO3PWIrGjMHpf3X3RARYLNd7KdTfm1bBGi/wOggJLagJfXF7UJAtCg816a0LkSD
         Op4PDOFQc7r//wJ86NuquJ7f6sXEqQ2Pqbd4TeKblEuDI5eSPnvaQtJRN82mKNb7dQXy
         GKviZBH8I6z0nbZ1phhtSNdAuYcMW1cDGfGyFzxNiLJ2HF4KAPnduOQlnEmRTz/aeHbq
         EbeUvz4ONGznAbCaaGZ7O6zz9gVYpa6h92SC4F/4cHlXzRCIErKemC5ioWILmujZWiYG
         +uBnMmECnVQ53UIdlBwTFB45Gctabn2f8bnTKV+MyNGYNvSNQfH4eYWzcDeQwwjdBkT+
         tclg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=FpepC4xFaJGVnjf18g1C8zYeq9gRMdq/7IlUInDggZs=;
        fh=4xBTDYnnzKSNaJr9mDKMxqFRsMAqTXl3Sc9+T2JDz5I=;
        b=q0U58ndjQnBRtzCO8sWO8AQsNG6UUDQx9Jlkr6pSDgk1p/pefZ0yiLnhWWQeffYBmx
         qfd51fjOqqtW6a7gds2Feq025kM/3NoLzfh5lVXVZNrNel7QBIKx0Zl08dqW/aSK1bvX
         /ZnC7iFKe9jSgQzzYyEFs9EqjWxX4IndAqblueYaSKRAopRM4Za0omsEwhk4tmWTEBTE
         BrdtBnyHfwuZNl4xhKKLTWaTEoseg7+cJ8je4Cxo1VSlYk45Ol0idTeyqQTSXf4pp+rd
         f0x9QT+C4l0qZtDuyr6hXqC95jQLemN9AtTV601yXFHb/VFfXelnOj1Z3VTpyw/BdBYL
         9bjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782345947; x=1782950747; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FpepC4xFaJGVnjf18g1C8zYeq9gRMdq/7IlUInDggZs=;
        b=hOKPGFltRjIywh7NhJRbZLBxvpHmMPXFX5eXQxaEfRzMWfErqyPd5s76gliKoS+W2u
         O3edmbj7F1czDUHL9ObJdwL5DZ7Vm1lZZCMNG/qS4W7Kf14GLsWwtqeTmMHOkvT992zJ
         xWUxeJnJucTrrPj1WyX4RzFEx9J/uEVVFgDdTtuXo2AvrwN+fdn8Ajc7UkY7Ij0HwsL9
         b4CL1PDru8CIWOKFYjHR7w/asYibNAC9KTKgzRur6huZI7woizeUynaI/lKndRtz2xqR
         DDIS+rY4ueUtvNycgls1qPcJr2czRm9E3TnO05FgOziI3P0aFubRHKdrD9CPQqkeUS7M
         EOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782345947; x=1782950747;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FpepC4xFaJGVnjf18g1C8zYeq9gRMdq/7IlUInDggZs=;
        b=oiRF20j3G292SAd7f5HY7pKFYjGxsT/li8AVQD7cdnVHC+r5bFVX4ZxY0+l9eP3+ug
         xprAJ3XpVfzNvk4LD0sAVcjaKC0mfEHiv38jJRyVLihDE8QFPcL9adCxirnJtqBM1xDd
         QGQE8PtVo5nmY8ipRKZpGlyOKw7yX78BUtXu8g6f+5CrKjmRTuVVo9woHWFjxROYho3U
         /gqCKusPuDn0zuxXKh6R/TvDuaLkIk/rk7KU2dksQvAVTHIgPGnAMt5n2U5tL5znOZxG
         Dm0L0wTZAGI7Q2uvn4Mzo29uSPgcvFDZWqaSYwWgf4rVFKUHPBlMUPNVKSeDbaLrqGWi
         YRsg==
X-Forwarded-Encrypted: i=1; AFNElJ/mBGL2eB7Zpil/uNBS/6j1UELm1S0S1iPl+td1YDvqDfjVYFumFC1TkclhNdmO9IrmJSHDTreG3nx78qzE/lo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRfRsxbfbNV6VsJ46ZFNhDHCu+aVMct5JeiN3seGcrp553el8s
	+PfBMgO/5cScRB47nZwbfUieXMnpBGK0WzKTCs6t3dG5ePsK6EbPQizcVkq+EqRCqTKZn18TCwC
	aG9h07nmeCKLLVfhDx9WPaQtcs45gbfZuhXSY/rSI
X-Gm-Gg: AfdE7clVYQyQDOu6AiVQmKA48cIlLNvtrmvum8XvrOz0tKVlfk0NFbndSFuuTiiL63N
	EL9v4qFFpCXRkntgGhP43YnbuFU8N0Wyacv9R9bVpOSUuGEZ5KtVWxwJW/Embo8CQ6tOFg3KKzq
	oqYxBM1NePCzV9i0x/k9uf5/+MDGtn+EuCGBCZ1t3SDK6xt6dfpuJEewPgt2csX0GxjbT0fjpl+
	T9mATEeRSSWPN5Ef/IBFR4qXKCBWuJPnzulvMMiY0J/ob8t4H2Ru7Q3DC8tvD47unTaBTZ5Y4in
	d3Jlz3e50BG5FHt7bZJnY7wbMMQTHMiPqECrtyqGfU5l/h3BDsi99Z22xM4=
X-Received: by 2002:a05:7022:e01:b0:138:49ea:f463 with SMTP id
 a92af1059eb24-139dba54880mr251235c88.16.1782345945708; Wed, 24 Jun 2026
 17:05:45 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 17:05:44 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 17:05:44 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <aji/2svhcc84rn5w@yzhao56-desk.sh.intel.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-24-9d2959357853@google.com> <aji/2svhcc84rn5w@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 24 Jun 2026 17:05:44 -0700
X-Gm-Features: AVVi8CctoVihMuJ7SOXsg73Uq4ZLzDcGYZqps3qpfVHZ_IQN9jIN9AXdoFf5CH4
Message-ID: <CAEvNRgHYTFnHbsLLgMTCSitmnp1_j9Pomikm9qmpGTh1w8YE5Q@mail.gmail.com>
Subject: Re: [PATCH v8 24/46] KVM: guest_memfd: Make in-place conversion the default
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
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

Yan Zhao <yan.y.zhao@intel.com> writes:

>
> [...snip...]
>
>>
>>  #ifdef kvm_arch_has_private_mem
>> -bool __ro_after_init gmem_in_place_conversion = false;
>> +bool __ro_after_init gmem_in_place_conversion = !IS_ENABLED(CONFIG_KVM_VM_MEMORY_ATTRIBUTES);
>> +module_param(gmem_in_place_conversion, bool, 0444);
>
> With gmem_in_place_conversion=true, userspace can create guest_memfd without the
> MMAP flag. In such cases, shared memory is allocated from different backends.
> This means this module parameter only enables per-gmem memory attribute and does
> not guarantee that gmem in-place conversion will actually occur.
>
> To avoid confusion, could we rename this module parameter to something more
> accurate, such as gmem_memory_attribute?
>

I asked Sean about this after getting some fixes off list. Sean said
gmem_in_place_conversion is named for a host admin to use, and something
like gmem_memory_attributes is too much implementation details for the
admin.

Sean, would you reconsider since Yan also asked? If the admin compiled
the kernel knowing what CONFIG_KVM_VM_MEMORY_ATTRIBUTES means, then the
admin would also be able to use a param like gmem_memory_attributes?

There's the additional benefit that the similar naming aids in
understanding for both the admin and software engineers.

Either way, in the next revision, I'll also add this documentation for
this module_param:

  Setting the module parameter gmem_in_place_conversion to true will
  enable the KVM_SET_MEMORY_ATTRIBUTES2 guest_memfd ioctl and disables
  the KVM_SET_MEMORY_ATTRIBUTES VM ioctl. If gmem_in_place_conversion is
  true, the private/shared attribute will be tracked per-guest_memfd
  instead of per-VM.

Let me know what y'all think of the wording!

>>
>> [...snip...]
>>
