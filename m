Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1622DC789
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 23:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782345018; cv=none; b=LN3yQtQ5upX2gTE38CvwESIra+56Ib8WBE+8dKiQgV4HZXleq5fZ2pUXIqL5n8bIoAWJ5Q7NO3ij+bH9GhTIylT6K7at92DeRbSRURJ6M3FHrtpdDD6YIw4hFWAxsXmuoxcgUrJL5lrwZDpVqTKfULX9BnaZRUMg+uwM2OJBB6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782345018; c=relaxed/simple;
	bh=jFwTgMVyvPSe2l2h8xYHy/RhaF5bRwpBGbC2LGmMwX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FcGBRAd2U7KyyMN24JNgl4ireMGBAtD6cNM21O47Vfoz3AxIwzAvebc6vmVJjWdtnIIqrhqCTFgLNjL0jxPMZRbT9KOaSCwcQnQL9KVdXvqWEVYxvmt9Grj6H3y28yqes+qOwV30hodVrlNOQEML7cwDfmllMtjU6bqfvSRTlhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T+e+0WEb; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T+e+0WEb"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c6b7bd4e8dso21345ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 16:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782345015; x=1782949815; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=re80BiDMtfSQEgMKbr3zmDreG+eTyRX3VIJM0LJKtgI=;
        b=T+e+0WEbglhMLvcp1R3B6LVjYkz65SF5Zzgyfqo7Uj2JJAXsd17y5vlkoZJSaRk/bj
         vpX7kGr8yDyGH9CqeJ9G++WLVSDut4VmfbH85Zkyo4aa3OVo6ggKrNc3Hbbs3vEDd/BJ
         ncotSJ3kS2ltCsy0AzFrQSjZ07z1tcfPlkcJH1bDveSibn58QApgSJ7CUdOI5Sis+Dsl
         apDwoUHMPqhLSi6NBlhB9iGm2wsTmyrWKdSS+9aWvcfT/4S9NUrqpQyeIhx+ihGQDZC9
         3RrflyKZx90q4iNGb3Ym9Z15425ITP96GOPdi2UHp1RY0cNcyPvo5qsbOJRURU23on+7
         3Y0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782345015; x=1782949815;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=re80BiDMtfSQEgMKbr3zmDreG+eTyRX3VIJM0LJKtgI=;
        b=gHfGGBaJPm6hr1NNhW0tjxfyLILQ3BE/w7PsGrng57LLfwMLFdI0fITLLWC40AF7SJ
         wcl2Es+OKAYVOKWGsCzbJz01XUfL+fNig2154EqRS3tHxDz7nTus+l6w2QcP37OYpNgu
         s0DN3sTLNlr6YJkkYnlZJPwmcIP9E8ctFJeEFbUZlo00kR6eGtQGiM+E28o0fGMV/VAG
         VmfkHEgABCi2KsUNftibxkLJUU/7W4UMUw15qc8W6Wlpjyc2l4oU2fKIqvSlFVSO3nXD
         ZKhQV0Q8SjvKiJKHsft4tPc1sNBjydimHMKLGg/rUSNfRZQZ2RUV8noecOLsUky78Bis
         3i2g==
X-Forwarded-Encrypted: i=1; AHgh+RqGIpjlX88XCBHrIk5KWVmDAxSxQMOGOIdtES3yFvgDOf8ixT/aqQzuTxOhR+prI7y8eGWV8gTafB8oNIlupt0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yysnf1WOzPHKtwC4NdrijDg19E6KockJMm6CJ86+MoORwox4g1W
	LCh09xuOLYL7znXSu2PbNNQdSDxjVqieYN2nW5Zgk5HX0rLRXrDxBNSn8yNx0oBklA==
X-Gm-Gg: AfdE7cl4BwkmFFBhm8YqD3Yn1Z1ysT4WIUqQRRiFsi8kdoj+L+NGS4Gw8u19DKz2nvu
	h+6EotCjX8rl8KOlB5cJhSwt6jThHBplhQl5O0t+y5cIOCDdSrgFyKKJdYhGLAboYs6/hOgjNFM
	HF+HpC2aqu2jBhUDfbZ+6BHU4bOhu/NONONaXcsrPnPSUSs0v0TaNcV8Uty/JfagrNajlq0wfz+
	9sriwFYWCzkO1ZL5JNKik+vmhQtH0c0MkjExUPtEP8TVxuVBOumZdK+kZKjgf3zKHKOLQk8jVLC
	7LWJ3RsxGsKiBdkjpVX1kL4Ev48S3D3+A/34Bhm1+t3NpaUFzdVPfU9PQLOz52me9kp0m1UIns1
	l3mNAr4OyqL4I+U35dJPlFhJfsvt1efF/P5FZmdFpudK24/HbiMcE3p9x8yRVqIWeCP5oenNsd2
	L39rYZ4L/Xm5UYcV13HIxbNH3Ee2fv1AJAWc6QoFKxN7w=
X-Received: by 2002:a17:902:f687:b0:2bf:193b:a195 with SMTP id d9443c01a7336-2c7fae6b840mr507585ad.11.1782345014009;
        Wed, 24 Jun 2026 16:50:14 -0700 (PDT)
Received: from google.com (74.67.83.34.bc.googleusercontent.com. [34.83.67.74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bc1df037sm546294a12.17.2026.06.24.16.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 16:50:13 -0700 (PDT)
Date: Wed, 24 Jun 2026 23:50:09 +0000
From: Lisa Wang <wyihan@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Binbin Wu <binbin.wu@linux.intel.com>,
	Chao Gao <chao.gao@intel.com>,
	Chenyi Qiang <chenyi.qiang@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Erdem Aktas <erdemaktas@google.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	Kiryl Shutsemau <kas@kernel.org>, linux-kselftest@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Roger Wang <runanwang@google.com>,
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v13 03/22] KVM: selftests: Initialize the TDX VM
Message-ID: <ajxtMdOFCPiMU0Pw@google.com>
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
 <20260521-tdx-selftests-v13-v13-3-6983ae4c3a4d@google.com>
 <d27cce6a-da0b-46dc-96b3-5f2f699907eb@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d27cce6a-da0b-46dc-96b3-5f2f699907eb@intel.com>

On Wed, Jun 17, 2026 at 11:21:49AM +0800, Xiaoyao Li wrote:
> > +++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
> > @@ -11,4 +11,34 @@ static inline bool is_tdx_vm(struct kvm_vm *vm)
> >   	return vm->type == KVM_X86_TDX_VM;
> >   }

Thanks for the review. I will change all comments for this patch I did
not reply here in the next version.

> > +/*
> > + * TDX ioctls
> > + * Use underscores to avoid collisions with struct member names.
> > + */
> > +#define __tdx_vm_ioctl(vm, cmd, _flags, arg)				\
> > +({									\
> > +	int r;								\
> > +									\
> > +	union {								\
> > +		struct kvm_tdx_cmd c;					\
> > +		unsigned long raw;					\
> > +	} tdx_cmd = { .c = {						\
> > +		.id = (cmd),						\
> > +		.flags = (u32)(_flags),				\
> > +		.data = (u64)(arg),				\
> > +	} };								\
> > +									\
> > +	r = __vm_ioctl(vm, KVM_MEMORY_ENCRYPT_OP, &tdx_cmd.raw);	\
> > +	r ?: tdx_cmd.c.hw_error;					\
> > +})
> 
> It looks __tdx_vm_ioctl() can be implemented as the static inline function.
> 
> Given all the existing xxx_ioctl() are implmeneted as MACRO, I'm OK with it.

Most vm_ioctl() and vcpu_ioctl() used MACRO.
I prefer to use MACRO for `tdx_vm_ioctl()` for the `#cmd`, but I am ok
to change `__tdx_vm_ioctl()` to static inline function.
If we can only change part of it, do you think it is better to change it
as the static inline fucntion ?

> > +}
> > +
> > +static struct kvm_cpuid_entry2 *tdx_find_cpuid_config(struct kvm_tdx_capabilities *cap,
> > +						      u32 leaf, u32 sub_leaf)
> > +{
> > +	struct kvm_cpuid_entry2 *config;
> > +	u32 i;
> > +
> > +	for (i = 0; i < cap->cpuid.nent; i++) {
> > +		config = &cap->cpuid.entries[i];
> > +
> > +		if (config->function == leaf && config->index == sub_leaf)
> > +			return config;
> > +	}
> > +
> > +	return NULL;
> > +}
> 
> No need to introduce a new fucntin. We can use get_cpuid_entry().

I think we cannot use `get_cpuid_entry()` directly here.
This function is called by `tdx_filter_cpuid()` to check if KVM's
supported CPUID entries are present in the TDX capabilities list. Since
the TDX list only contains a subset of CPUID leaves, some queries will
naturally return NULL (which we want to gracefully filter out) However,
`get_cpuid_entry()` has an embedded TEST_FAIL(), which would abort for
any missing leaf.
How about I add a `__get_cpuid_entry()` to share the same part of them?

Lisa
