Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9123921C6
	for <linux-kselftest@vger.kernel.org>; Thu, 27 Aug 2026 20:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787864045; cv=none; b=s0eSARY09Gq3CvvD5Q9zukWFPRD2d6PNni+MqoJoGo+jtXUduPDhUnsJhYnNhHz2l45zqXbMRajYrcroAcWdFnHl0iBo3wVhie/awLuZMw7Djf28zTsyY3WzDt2unkXp9wuf3tR3sSBDZwMPLd3dGD4a4jKJFd/fq2gt/x1oWV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787864045; c=relaxed/simple;
	bh=584T2Fi+jYdHnPMPryAzdeyBmBsauq81+2zQRXO51LQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ufhrbj9vvAITT7fv/zPQRn82RE4PVOCNZMgbVyxjpUCfd5WRCDCrQ4LnfkYCCD+y+Z/Sd2A3g/y4oq2EVsnPQlVfNAkzyHWskzZGIUw9C4iuhIJwDdZx2YBJNT9buBrNHzHjZbFnZGCOGHJD+QuPDahGEwEyu/oZqKDhvE1doWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NDhHjzQU; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NDhHjzQU"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-855f662439aso672671b3a.1
        for <linux-kselftest@vger.kernel.org>; Thu, 27 Aug 2026 13:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787864044; x=1788468844; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZEfQxTOKQyDG0uZqNyCVnRw0wmiuuoqTc9XyRDn+pn0=;
        b=NDhHjzQUvh3ExnAjwNkVIJFwsPZcmuA2IniGkFO/nza1s9PQ7UM+5SBSybByx8jfzC
         9H76VzzIzoNit3xu/+s7pMEmDNzD/0TaoOmS3lzHmaCl3jnT0cx350Cy2zY2AKZARIdx
         UuaaQUkt10uQ2St3MJ7eZcVmDbXDw+4NTJFh8pjHVBgXnTfepFdpYbWWoX0PWX9/asJN
         Fq+Bvtpe7qZpck9RIc+q76+2w3yqqe5rKZsboxBBolUEN2/nSmQjxLRV6Iv0be9wYMUH
         FAx9lcKQxR5EtlqPw+mnJ4X/uuVyLHwt7LvL7KWV7uzVe5Cu4MOsoGK6wumcbonDoEFQ
         Sq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787864044; x=1788468844;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZEfQxTOKQyDG0uZqNyCVnRw0wmiuuoqTc9XyRDn+pn0=;
        b=P/05+P+vH5K/booUUTJqT3/XaSi8rCE+/3m1lpTDNCWZdxsYjUOERQrHfcaVn/5geR
         4Rw3j2avibP+3SP5MZWVgOtZXhQ5cI7iqe+fnP6vTv+3lfCMsH95ikPEL8VnMGxqC7kl
         fq3bGe1UPNku8ugtDDIiH3U9MBUxe0qdcbDB/v2DJhJufbBEfrW8DIcGmPkNaDS3PPRM
         RjzqPUSOBLXyB4l663/RFCjgN/by1kt0BsH06oVrSfGAN7tqLAxSDRDhiPwYltPlukpS
         t9nEoemV4r4Dm+TWvv0FFGnYWZpGqNLcbDmKhxyE9Pi69TTceVo3QCG9ylPFMwXhWKfi
         UE8A==
X-Forwarded-Encrypted: i=1; AHgh+Rp0OptuhulePZubRIyC0nbLVj1hMksSnYH8qqiL/2sXbJcbklTHRHVJpPTMA4xwlM1UtkOnsjRPF3GVEaJz0Wk=@vger.kernel.org
X-Gm-Message-State: AFuF++mJDpPZ9HzUGvIs+Kq1DtaAl2PzjJjvCJnisPEGC1+e5Isv+DFO
	gO4tV0duXuTFZg0oB3BZsuEC427IyhPU3Qh8T2cO0YnqmzlnqF6C30pdV3bpjavpt+zM+/iZsal
	s20AyGg==
X-Received: from pfbkr16.prod.google.com ([2002:a05:6a00:4b50:b0:848:5480:9ac7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:e09:b0:851:fb36:a702
 with SMTP id d2e1a72fcca58-85629f09cc5mr4062708b3a.9.1787864043380; Thu, 27
 Aug 2026 13:54:03 -0700 (PDT)
Date: Thu, 27 Aug 2026 13:54:02 -0700
In-Reply-To: <ztufznh6v5md5cn56t7pvokubvbpc3yki6dhiilgebb5uq3ju3@aa4xc6wwte5r>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826-gmem-inplace-conversion-v11-0-0a15d8a799aa@google.com>
 <20260826-gmem-inplace-conversion-v11-15-0a15d8a799aa@google.com>
 <ao9CKMXAX-hScRSa@google.com> <mtbqvvvpwbzybgy6z47lwui6ag53kyubub3hkczui7u72zxesl@lnwsglrgwl5p>
 <ao9px1j7CLYXMiGP@google.com> <ztufznh6v5md5cn56t7pvokubvbpc3yki6dhiilgebb5uq3ju3@aa4xc6wwte5r>
Message-ID: <apCj6gz8x24Dkle8@google.com>
Subject: Re: [PATCH v11 15/46] KVM: guest_memfd: Call arch make_shared
 callback for to-shared conversion
From: Sean Christopherson <seanjc@google.com>
To: Michael Roth <michael.roth@amd.com>
Cc: Ackerley Tng <ackerleytng@google.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
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
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Fuad Tabba <fuad.tabba@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Wed, Aug 26, 2026, Michael Roth wrote:
> On Wed, Aug 26, 2026 at 03:33:43PM -0700, Sean Christopherson wrote:
> > > So there's real performance differences here but it's sort of been
> > > addressed through a solution that offers additional performance
> > > benefits on top so there's no longer as much to be gained here I think.
> > 
> > Or another way to look at it, eager conversion would allow QEMU to drop its
> > workaround.
> 
> True, for SNP at least, but pre-map is nice too, and not really gmem's
> place, so most likely KVM_PRE_FAULT_MEMORY would remain regardless.

Hmm, good point.  And as below, we can't sanely avoid the check in kvm_gmem_get_pfn()
without reintroducing the preparation tracking, so the lazy approach is probably
the best option at this point.

> > To be clear, I'm a-ok with the code as-is, I just want to make sure we document
> > exactly why we're choosing this implementation.
> 
> Agreed. My understanding of the current design choice is basically that
> it doesn't *need* to happen here, since kvm_gmem_get_pfn() will already
> trigger it on-demand when it is actually needed (or not), and that tends
> to happen at fault time when other platforms like TDX handle it. 

Oh, this jogged my memory.  For out-of-place conversion, waiting until
kvm_gmem_get_pfn() to update the RMP makes sense because KVM doesn't know whether
or not the SHARED backing as been allocated, and can't easily get at it in the
first place.

> To handle it differently would be to go out of our way to make SNP special in
> this flow in exchange for performance, 

Not really?  We'd still need kvm_gmem_get_pfn() to update the RMP to handle PFNs
that were never explicitly converted.  Either that or KVM would have to preallocate
everything (ewww).
