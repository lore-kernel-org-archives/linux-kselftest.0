Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798CA3CBE97
	for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 12:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779365550; cv=pass; b=CKxYWX+dqZpj0F7Du1Id0ovpU7xmrXwju4bb+LtovgSvUD1/X1LSq/z44FTSwbPAsOjwRYzrcoi1Tj1w9Vd94gcZhB1val5BOJIq+czQisa2+ewE9QveG/YVSSCSDxAsKTYDfHUa2krXf1MBmN7xOfBs8+uGWWLnIBjdjcHepLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779365550; c=relaxed/simple;
	bh=mUWTvSyqIoqkETcgZuIds2FYkJwuokmb9q2VYy+exYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hzu6NFgBMTMAI6/+POrPOUByNUzEh8+TkeYp4N5/e9RsTHQ7giqLfV+tNJLG9bgIHzR4RD2xvHeRy4UacN8ZdftXI97DdtK31f2HYVEBoh4PDAiCMENCFLVlcmcruPyaVjWD/nTKpTbqRRAEiXfIlwHgeDIZ1uBOtKCRYONW8Bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eSxUwN2U; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eSxUwN2U"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-515548f390fso5061cf.0
        for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 05:12:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779365547; cv=none;
        d=google.com; s=arc-20240605;
        b=KJdMd+nVlGky+8oLKbTMNfevbc/pO1aDzqchaEHaJMNWtb2R26eN/7N5o1t1PSVFcV
         UPQOHGd6YT9oh3G17byhwyEntm4KFEmk2+Kia9Ote7o13YUZFt5/c440wxrF/j5Gv4ht
         Ex3Uz1/HFTq89tkpr3HFfOvP8VOFeUif/vD/E7amBdlVVVySE7etFg6SEjafGw8VyTbP
         wt1fYTd0a5K/68WoWdoskr20D3Isqe16mAFR/6oRPx/ZgGaZ2BRKOg75jEPw78jY50sR
         AlncaU2d53c0WVbP+Y7tg0sHjNvNY7NqewDSDnPqx0CadL98zLBHCqdeugD3ne8tZuTi
         kYHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=F1wmmG0cNegB4E+dlRzmEOWoIo3QXb0mRCuTWAZdGJs=;
        fh=AtXWE8K7n0d4SBEX86Yol7S2/nu3GMbcO+MMf/NXYvo=;
        b=VoHShoynDa+N6Gp1BMLrFR6yXw9HaWAWOiss+MEch74PPw3dU+7RKbL9FLOnuc90vB
         YXxi2aQdMamt87GVldlUA3LcY/cWY0RASNzNqW1ESNIDFg5gfXQh33Z6Xyjrj6edWPVL
         OlPYJNtyd0Fjl9JAPS0eLYKzp5JOxhhs4uFyT3I3D71HKzg8zVt0a1w/9R/FFMuPz9HM
         fIrmwRdDgcufxB+vw6WOjYZExk302RFcA8KcdfVb3DLj9ntftF4q1MJwz7bnIB6bnw1e
         FyokIJTIW9psy5xgerzLHGlAEN7pGtp31OXPU+gEfT7vLBUexh01WQbTaUKk2nzmdVGN
         Q9zg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779365547; x=1779970347; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F1wmmG0cNegB4E+dlRzmEOWoIo3QXb0mRCuTWAZdGJs=;
        b=eSxUwN2UUN0gARyiwlHRhjFeTgTwoYSX6HnwV3HJBMWWPGKbRBBm8GoVr5jIuqOxxT
         KLvP6ZUdR4xTql4y8w669ChBS76GV5GjN6JhPBx4/0Y/Gm4pdN64oH5Nbk5V3iAqmZ26
         CSmQP/S/dnUovh/Mt3TredUArYrIjoVsofJhWHXfP9ECgMjtCvUNRAN+aaLzfWVFk19I
         ObfdSkGwq5zPKDUOlnkfNi5cyGa5akLiCDtta8BKEhh0SCgkqPMvDL5EcjZBkjetHE/x
         iWvwetxUqdI8bYADuRlHhVdXqTAXPP5D4yZ0BPu3qE/FWSAdee6DWPWbrnSXdnJEWZoO
         kOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779365547; x=1779970347;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1wmmG0cNegB4E+dlRzmEOWoIo3QXb0mRCuTWAZdGJs=;
        b=sfJ7gaJtTwHTqYy/m+zw4bXI7SJFipS401R03pP6TGbPltdKjJPTvTNUOW2uXwkLxR
         +5rJOr6gbuo27VzjIM160ofPwCsBghkAneVBFPOw4L4fF2T9FHLSlnSi+zSxQfNvqPNa
         YZ/CxfYam9TKy7llTv4TN1Xj/RdXHvFcXNlwI13hVCZ7xfTcBLAl1wlSV72vRVRMlZrp
         P+Yb4yCXYEZ7wL5R0BDDhniM5m7dYxIkloOcxEnu0eIRHWE4770Xgjr2ybWwsdq3gH01
         cZNwEUqWCkfvlt3qqpiFNvaapxzr+58E883gT+mxRPbdvYGfoiqj+0bRnWTmGt4OoSCA
         zmsQ==
X-Forwarded-Encrypted: i=1; AFNElJ/XbxkK72Ql5TV/7NruWxTtsR1lkF58Gul/L33KtbhvURJfzB5WZ6MDnMG/CKV/fQlnKbAK26Lugpm2fbpR0cA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL7YI4HRVa1g7HelXlrXyBgfcMAPizTSZcF47EX18cZEIzZ/JC
	mECCXd3aUEl7LM72v0BbLQ0kETIJPK9h5x8ov4Fe6elA0kwXRic1rPvvQd/jaSe8DOCeFehbkm6
	dAsLFHE1oM+jvShMWHX8hZQoZvOdI+zJG+7MMHU7Y
X-Gm-Gg: Acq92OGn8XFRTBEuy9c7lAM4LRfNp9f8aOiYY1OIRRfEAl03XfcgoeYqbrlFlR02hh7
	NFueIPkE9ATSFLTb08ut8WHaqLlyD0vSkaaBf/MUelB8Oq1v58w8kWTr5bv9J1u2FFsqEZJvOds
	06CtrE0CfAu2KMtBUIKUsdLUv90ktHiI4gywzoeW6uBIfhAPggB/8tp/0f9/7ZYV/vWJUs9YPva
	+D0+HfZ2NZXm4ugIcQnla+xJcCHu7QEX92e9Q0kke3NOZ7nAhlghiQBFekKpDniqfva3jO2ZnQn
	/soZjNqdyT43YjkKb+1nRHDgDE854Q==
X-Received: by 2002:a05:622a:995:b0:514:c25e:c164 with SMTP id
 d75a77b69052e-516c545d403mr10074811cf.10.1779365546829; Thu, 21 May 2026
 05:12:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-23-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-23-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 21 May 2026 13:11:49 +0100
X-Gm-Features: AVHnY4I9MwIePcJowBi5yVnmSFDQMJen-Uv4dVyPJ1sLPspDsU0lqTAnhNGKza0
Message-ID: <CA+EHjTyftaGzz5-NgZGHZvgvuKDCBVSuhSsWSQ=niP_giotk7w@mail.gmail.com>
Subject: Re: [PATCH v6 23/43] KVM: selftests: Create gmem fd before "regular"
 fd when adding memslot
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

On Thu, 7 May 2026 at 21:23, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Sean Christopherson <seanjc@google.com>
>
> When adding a memslot associated a guest_memfd instance, create/dup the
> guest_memfd before creating the "normal" backing file.  This will allow
> dup'ing the gmem fd as the normal fd when guest_memfd supports mmap(),
> i.e. to make guest_memfd the _only_ backing source for the memslot.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  tools/testing/selftests/kvm/lib/kvm_util.c | 45 +++++++++++++++---------------
>  1 file changed, 23 insertions(+), 22 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index 2a76eca7029d3..df73b23a4c66a 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -1054,6 +1054,29 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>         if (alignment > 1)
>                 region->mmap_size += alignment;
>
> +       if (flags & KVM_MEM_GUEST_MEMFD) {
> +               if (guest_memfd < 0) {
> +                       u32 guest_memfd_flags = 0;
> +
> +                       TEST_ASSERT(!guest_memfd_offset,
> +                                   "Offset must be zero when creating new guest_memfd");
> +                       guest_memfd = vm_create_guest_memfd(vm, mem_size, guest_memfd_flags);
> +               } else {
> +                       /*
> +                        * Install a unique fd for each memslot so that the fd
> +                        * can be closed when the region is deleted without
> +                        * needing to track if the fd is owned by the framework
> +                        * or by the caller.
> +                        */
> +                       guest_memfd = kvm_dup(guest_memfd);
> +               }
> +
> +               region->region.guest_memfd = guest_memfd;
> +               region->region.guest_memfd_offset = guest_memfd_offset;
> +       } else {
> +               region->region.guest_memfd = -1;
> +       }
> +
>         region->fd = -1;
>         if (backing_src_is_shared(src_type))
>                 region->fd = kvm_memfd_alloc(region->mmap_size,
> @@ -1083,28 +1106,6 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>
>         region->backing_src_type = src_type;
>
> -       if (flags & KVM_MEM_GUEST_MEMFD) {
> -               if (guest_memfd < 0) {
> -                       u32 guest_memfd_flags = 0;
> -                       TEST_ASSERT(!guest_memfd_offset,
> -                                   "Offset must be zero when creating new guest_memfd");
> -                       guest_memfd = vm_create_guest_memfd(vm, mem_size, guest_memfd_flags);
> -               } else {
> -                       /*
> -                        * Install a unique fd for each memslot so that the fd
> -                        * can be closed when the region is deleted without
> -                        * needing to track if the fd is owned by the framework
> -                        * or by the caller.
> -                        */
> -                       guest_memfd = kvm_dup(guest_memfd);
> -               }
> -
> -               region->region.guest_memfd = guest_memfd;
> -               region->region.guest_memfd_offset = guest_memfd_offset;
> -       } else {
> -               region->region.guest_memfd = -1;
> -       }
> -
>         region->unused_phy_pages = sparsebit_alloc();
>         if (vm_arch_has_protected_memory(vm))
>                 region->protected_phy_pages = sparsebit_alloc();
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>
