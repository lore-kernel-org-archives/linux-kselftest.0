Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7360B35CB66
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 23:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777419658; cv=pass; b=D3KeyfnucbDmSCFExxA4uzag3xgaj/z2xTT+TjH2oeqPqVHBbU+3cPyXaa0ctdoGCN6SlG0V8wqIskhaMBKxQhNlVTTH4O35Szeh6w1xKWKw/OCxjzqwoPOEmW86kQiIwYsMaNQbhv16b1NrFjJahIbUHRlJG2vbdA1wzjJlMY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777419658; c=relaxed/simple;
	bh=U3ahQduobNenu2MyiCXv14Q8IImIIVCNH9OIRKPH1FY=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ivzIPXsQd+v782qsHUF738B9oF+2MB+h9MhPFFM3gf58l1zjszKCLfq66u9eYrbY6Uod9H/X6U27N0KQg1ryfZnsQ5vOiXOXH3eP4d7bQ2pb7RocewfDOSx8lei4kyLPtvxWeejhkSljzzfxn2Fue6Zk6oxodbAEmDM4ezQQHeY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hsmFq7DF; arc=pass smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hsmFq7DF"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-6121f20650dso4098538137.1
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 16:40:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777419655; cv=none;
        d=google.com; s=arc-20240605;
        b=Rqhj5K8QtsqrOAyAC+xZxbYOLGZE0MMiJdmV2QufyQ64Pa69G/BnCQLSDCxTi3G8AW
         CgPd5OwR2kvJNm9HhmuaTmB5nNBUvL33vE+Lx+TjRdGdej+WrERUK/fNiqoFw/kUc/iB
         1hZUXT44QIJjRiVWvJ+u5tsCZJUMKZSjE7a1+pNt//ciRzmATmIVRA5YM1YdLeYNngEx
         yZP/IVt1N6pZ5Aa9YTwBfK8RQJXfjsiYrz8OMXq1vR2cAzBBOdrO8mJpUhC0jy+Z/lvd
         hsBRrniIR1rxGdWlSdltGSmqIX2WEZAtJpcpW1v2JOQ+3LqkoYQgTJ9INVyCFtAFzil2
         QYuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=fSQsiZsSkLpyfyftl7NX7sITr7YX8npk81aNrWQuVW0=;
        fh=iwHl0NOnVauTsGDsL/VOnACt5jyhEUiyzK4c3kzp1f8=;
        b=XaV6hjGwQzqlg1t5JOhWHIrErczjqQyejBtJPF5vj/lzfHK32FX39Oyex/3cUKVgS3
         1SUBjULb/9VNPaWsb1nWEIV+Lct1Oh4Q1g6izPaleRrghCUuRy8XeDSZc5MymOjeYQPn
         5lhvMQ8mX0czjhiZlDqB7cMUAh+1NHPFqgXhQh60cOJMJXxRgs0Eousv18tAy2K+yGoh
         rONEnhwhpmj0dgyOQBs3eZ4JNn7e1dmRRpXhoma2DCA8pulqZeiI/u5OnSsTc1Wre4D+
         JIc5FFGiYV7ChJV2QITyXbNDA264poT4JIpPY5EYmvvBtK4t+I622p/3mxm+5hLSW5gH
         c0Cw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777419655; x=1778024455; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fSQsiZsSkLpyfyftl7NX7sITr7YX8npk81aNrWQuVW0=;
        b=hsmFq7DFMBfAwtb1IZ6VAuUFHbYwGJe7T0YGoC2CKhGIdjx03B6Mtva/uC62TfY3WS
         MmLL3e6YwiFrJZCe2ef7t+xrcR2XxghUK1J9+MA+2/7GY0Kv6SiMlyXY3elQUFAQeYwh
         +TT3HVmfTWZ8OgqvASfAFZ5JbpMU+zuyrahpa3beA3dcT/5NtNlmlhNTUvuQRi2tPGGt
         m0X9RTmx7ze8yVGzOECOZQOaP+HaBZpOrTA9MBKHH7H7dIwkWZ9xYfeHKrj2OLaQm6sH
         177ukz6mlxPHpdy9ilHl6aV/WYum4uGcKUbdHIrqTCVwaxU0rQX9FIolN1xsa3CdA7+E
         PeRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777419655; x=1778024455;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fSQsiZsSkLpyfyftl7NX7sITr7YX8npk81aNrWQuVW0=;
        b=VX3qfY9YAtUP9++8CvsO43pyuIaCyR2cv+D7Ny2cmyQaz/XDMCQ7rOsMVYxB20e5gi
         a+C8Op+GN6mchPioQUR+qQBOskQ39EYQzjAceQZcTsREkGlPcRNGKqRfujgGPUR26hDP
         3+6aHWWx4HuBR6HC5tvoaobCPdOGRTWh7Wjtr6O6xhOaxnEjl7pOR3zWfh0nLrjZ218E
         VDMW1EHmeoiI5QYauo1OqCu0Bhjm+Eirb+V8vCNfLhHgc3EcVxR13iFhm25G8SatDquH
         X/Dt8nnKH+sR98mDcbRfVJGlya+sNYmKu5Yn/GREGE5qYdC0H6gRGM8IU9WlMZwOr+Om
         R3hQ==
X-Forwarded-Encrypted: i=1; AFNElJ9HzESDeZNn+V6AILAzUhrIKrl3lg0Ud67ZspezwlVwwqNe/ezN3W4qEW3PJRqtrvt1+YbVd7mPqYvvQosLSl8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNckh5BTIu4cI+LsZy4fG+hnFdyYmHXYQbv6X8qgQnxL2JclqD
	l83qSiHqFSA1qbgfwVEV4DcmRwlpwjij4HW+FJkr3dDkG7KyISnDbQNWzrltY4uTu0iBfvRr06w
	LZV/KQoN2enrihTfIz3PjxBqQHNLWijFkuWOxlnKI
X-Gm-Gg: AeBDietVraJvs1dCrR1NYGZHnHme4zbvgmhqG7/hYxtVjVm//bBm5cek3JPaY+hNWhb
	yPJwC8NabEdBKJrzw1HTA5y6ygheAmNCYbGLS4R0Sl+v6+LXgf6MODeNT926G3OKn15Uw0aqvxG
	yOxGN+ZE7DnWijZDdjruN7ruzjhLdObigD6NUaeY5+bTsd+OxR11VUn2VikZouOMAoq08NaTIzu
	bza/8Tx4Qf5BJkKXt5P8BEdnGfz1db02QyTgXTnRa6qR5LuAyWV6R8/tiDGtio32NTXAVTFuoK8
	pZAUhf40krcL4jv8vwjVCZIIABpJ6LxIzi6i7vM0IjSHzu5hA6IOru9Qzc8idwffd9BVHW+xVga
	H1Y25RT+IY1+Sa1M=
X-Received: by 2002:a05:6102:809e:b0:606:49d:183f with SMTP id
 ada2fe7eead31-6280b1df187mr2828068137.26.1777419655062; Tue, 28 Apr 2026
 16:40:55 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 16:40:53 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 16:40:53 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260428-gmem-inplace-conversion-v5-24-d8608ccfca22@google.com>
References: <20260428-gmem-inplace-conversion-v5-0-d8608ccfca22@google.com> <20260428-gmem-inplace-conversion-v5-24-d8608ccfca22@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 28 Apr 2026 16:40:53 -0700
X-Gm-Features: AVHnY4K8zc89tOubY_FIZvJs5RqMpzsyiDSJNy3Ts6m6f6GRhz2hBKqCaZ_7fHQ
Message-ID: <CAEvNRgGv3RZipinpQLCGUfBCAfS0PRc1mCx2yc3JgjfEu=QhdQ@mail.gmail.com>
Subject: Re: [PATCH RFC v5 24/53] KVM: SEV: Make 'uaddr' parameter optional
 for KVM_SEV_SNP_LAUNCH_UPDATE
To: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>, aik@amd.com, 
	andrew.jones@linux.dev, binbin.wu@linux.intel.com, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, ira.weiny@intel.com, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
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
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
writes:

> From: Michael Roth <michael.roth@amd.com>
>

Thanks Michael!

>
> [...snip...]
>
>
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index c2126b3c30724..bf10d24907a00 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -2343,7 +2343,15 @@ static int sev_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
>  	int level;
>  	int ret;
>
> -	if (WARN_ON_ONCE(sev_populate_args->type != KVM_SEV_SNP_PAGE_TYPE_ZERO && !src_page))
> +	/*
> +	 * For vm_memory_attributes=1, in-place conversion/population is not
> +	 * supported, so the initial contents necessarily need to come from a
> +	 * separate src address. For vm_memory_attributes=0, this isn't
> +	 * necessarily the case, since the pages may have been populated
> +	 * directly from userspace before calling KVM_SEV_SNP_LAUNCH_UPDATE.
> +	 */

I dropped the #ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES from [1] since
vm_memory_attributes is #define-d as false when if
CONFIG_KVM_VM_MEMORY_ATTRIBUTES is not defined.

> +	if (vm_memory_attributes &&
> +	    sev_populate_args->type != KVM_SEV_SNP_PAGE_TYPE_ZERO && !src_page)
>  		return -EINVAL;
>
>  	ret = snp_lookup_rmpentry((u64)pfn, &assigned, &level);

[1] https://github.com/AMDESE/linux/commit/7e7c29afdf3763822ced0b7007fc0f93b8fb993d

>
> [...snip...]
>
