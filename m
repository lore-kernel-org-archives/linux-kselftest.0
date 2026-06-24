Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FA03B6C0E
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 13:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782308680; cv=pass; b=ilLi/eEKEQLmi53CS9qneenfzmrJdZWcdnDJt/QmqPvt0YQ1/0AdUAS9VaWw0q3q9GiW0FCTSra1U+q7+/aC0uji38hbTkHJ9iLVfkHXyfEG1dX3ASkTzRB1sPifGKomjgvtywBUhTQO+8mJR9QcXB8iLJidtcVC6p7Wu/ld9q8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782308680; c=relaxed/simple;
	bh=qwRcQ/ClJ9JG4ryGwIJuvq/o3tliB127/9EJbI1JGOU=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GK5Sf33WDdXMvUmJIT8axJvMoO+2o+Yka33Jdi61HqpkS84eR6KVxtEOB9jRlJbKCXGussMCvsWF+cQLkRtiakPcZSqyYTyRhuUa9/UNGJbQU90WLrXT+o0Qr1QWDrp04L88c8sgXw54SPUwWS08Kn3W12YD697j/vzro80Yzhs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=arPYaw0m; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="arPYaw0m"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-139b5e604b9so1224482c88.0
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 06:44:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782308678; cv=none;
        d=google.com; s=arc-20240605;
        b=ba4a/hWfe6+FraEGWpO+meRcNcOo5p7xXsSWn0i6GDCnORZu0cmKQhfm0wv64KN/UV
         bHJ/5bt00UXJRlg2gAm88nla8qE4jVi/T2Emt2SFUxUioq1t5Kby71O6uiZkKDw4fZfi
         r6VBF/AlndPhfRTRCTbGNLV4AFvs5NuW1sDirWZa6ypm5QEBf8psXBOyuWNYEH8jgmCA
         dMPotYGO4n48/ogeSRM+4QHMXoqq40PPYodxW45oISTMnjfphii2o0km0Zx1WNpTUYA4
         cpKGqO6xi2xln4VD4E6tmhkxN3sy9QxYw3Li5IuO1Jl0DcyAWKuXrHzkw9bPRQxOHIOO
         9MRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=OMYX25sMe8BokvDqBMKpyH1gjAy6dHukDWPb7UeMT1Q=;
        fh=n9ox88EZxSyooANreBsSQRjfvT5zYHBTwIg97ByehKc=;
        b=IFVa5CLVaAJxRihbCave7HNl1FGr3qdmMjfZLk+kAFHUDSJVThhBjkHflnZ26OpSwK
         WeDy4UZNGMS1CLSTctN0/GTlxXpYMSiwAnoOvi7pGDnJxtB/xoA5RHXgv+Xzge5H/Y6B
         a8KmOTcAkum7GyOOMAexaGjVftKcB+ZwiuuFuNAGN3xFXXhjgbesxOGtggJsqOiDHIgE
         FajILhfhNbmSRVWQk0Ox+7NsybQTus2bHGNqWBKMRQotdlLUYHt+bp4rKrCQ8Eq91p02
         5OUkM2r6j+1rTnIwOPU6SZb3A0WLIFLPwSRoT4xrzQk3imUlSa0Sjl8niVmxkPLLQ4oJ
         TX2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782308678; x=1782913478; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OMYX25sMe8BokvDqBMKpyH1gjAy6dHukDWPb7UeMT1Q=;
        b=arPYaw0meVRjPYrgms4OkOLXFt/8P2iuU67wri+g544HgClaDMzfIAQhy6BtPLeVh4
         2nSTG1S1xNZsTnS+t2dJfwbJ/WtjWp5jPYDuti7YH+wZSG1d0uJTdBdqVugF0F1GJqlm
         mz+2HQHL4z1TPCf9je/KZBzz5f+CiZiX0tyQKqwTjW/ln09HIuiZ6YRJDPKI20kCZR91
         3HAt6Csj4wOcpZv/Cji3sdK5CsaAUxp9ekhKCOUF/PICHIw1Igqy4Ciu3GdgYIPHK4QH
         H/WjUDgtm4HpMCfS4bUR0sZrBlSONDoE9rG/SPXL+VDaKdXX8ycoZFH0P8eihDqUY/Hr
         qBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782308678; x=1782913478;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OMYX25sMe8BokvDqBMKpyH1gjAy6dHukDWPb7UeMT1Q=;
        b=JcKR9pAfnEUWEVpaHTEfDichR4LKXIWwf+2wMF6v/gxuUONO9L4LgeG66784V3hUIF
         +/HO7VlBnAODWoP+meofj0PEuozFwVs9Qn0PrYQZjsiqVTLmqKFUSORbMNNlwWn352Hy
         5Rm8k35hk3BkpQD69XebYJq1mNYdKxoJXttNOhLry5JBRGlXsMz3P80WjuiVlbWe3+A2
         phz8Qnc26nwcOwd00uLjjdG0EGhU8GysJ/pH/+ataOFcZYyLiaUN9/cPsqF+JqhciTU+
         d7Gh9N/uvXZdG525Ta1obFUCIeLK0qHnCAFLJE7NbtYx0vhtCg761HJ0ze89PkCwqTWC
         f2mg==
X-Forwarded-Encrypted: i=1; AFNElJ9+zvQSr7z91DdjzFS1/7HNSTa/tBuGibKfKHVlWOWySkgvG4Dzv5xEF0fSXnPkHDWjExJggAgUxTq2bgVk30Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBy63Ypb17cQgm1oyXNiqfhDU5gMKxZXF96s0GzgZe3ShwG7wm
	tFKePPosLO1rw4104Yw7BvPSDVBv8A4TLMwbXPZpFDGKXULA36k6w6mARNPCn1MBx5IU1qWlls5
	pL5HiWg2i4+lLpTtRbbZ1zuJ4C/zez7UoSYS35ecZ
X-Gm-Gg: AfdE7cm3F8E9+RXTAvdNxsJMpDNPy+AI7scFGCJQ3m76EhcxlGvbQ0WOECPgfQiT0WT
	iNFgTz6DRqcDn7XnhJJI0eJ5Jz3hMgiFFqadIuymAqpzDQfULcXRKjTH70wgJvKr+CxRerDgYwB
	tUGK/fAQV1uMk5BYkUm5htNjEp7IWfWlURYyUYoCnXDbs6PdnjI96vo6ThNSmxOxvSrJkJ+xRtB
	0pw2khrK8Bhwf0zkyaKrDk0OCft9x8ugzmb5btgBjckLufX8gukzFW/byHiPL6LhShi5dD5P4W1
	DuxpRk5SB4za/a9fKBqLDYkjYj5P
X-Received: by 2002:a05:7022:ec0e:b0:137:eb26:10d with SMTP id
 a92af1059eb24-139c5b99857mr4976083c88.0.1782308676421; Wed, 24 Jun 2026
 06:44:36 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 06:44:35 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 06:44:35 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <96fb369d-dbff-4ed6-b1f9-0ce63d7d4ed0@linux.intel.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-7-9d2959357853@google.com> <96fb369d-dbff-4ed6-b1f9-0ce63d7d4ed0@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 24 Jun 2026 06:44:35 -0700
X-Gm-Features: AVVi8Ce7qJauzHB_wQ4GZOmMbMs8hfgU2sTfkjTDTjUh6bKjOQAsxLqy1nK_op4
Message-ID: <CAEvNRgGbBcrX5Fw3vNTsTOBNC=Ypi=9-S07674yPxLU9i4akjA@mail.gmail.com>
Subject: Re: [PATCH v8 07/46] KVM: Rename memory attribute APIs to prepare for
 in-place gmem conversion
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

>
> [...snip...]
>
>> +static inline bool kvm_mem_range_is_private(struct kvm *kvm, gfn_t start,
>> +					    gfn_t end)
>> +{
>> +	return kvm_range_has_vm_memory_attributes(kvm, start, end,
>> +						  KVM_MEMORY_ATTRIBUTE_PRIVATE,
>> +						  KVM_MEMORY_ATTRIBUTE_PRIVATE);
>>  }
>
> This function is added, but never used in this patch series.
> Is it intended to be called only when CONFIG_KVM_VM_MEMORY_ATTRIBUTES is
> enabled?
>

Thank you for catching this! I think in some earlier revision this was
meant to be used from the guest_memfd populate flow.

I think the version of kvm_gmem_range_is_private in this revision is
good because it is symmetric. If conversion is enabled, call the gmem
range-has-attributes function, and if conversion is disabled, use the VM
range-has-attributes function.

Sean, if no new revision is needed would you be able to drop
kvm_mem_range_is_private() while you're pulling it in?

>>
>> [...snip...]
>>
