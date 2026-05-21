Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D6134A3C4
	for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 12:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779365640; cv=pass; b=f22BDZu04rfYDXrWUeQwUCgeereRcpwfBOg3/c9ZMAYgQEE1exXk+GcfcwBLQlwQZZWh1z2jA9PpwsOgtP89L4YaB0V5PFf8eN0ytIj1ipXbT41jWrI6RlO6SSw2Swdhd3jsJ6KRenhrbRXy7r5NCikVm40DowLTVRoSJoHx8lA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779365640; c=relaxed/simple;
	bh=LYJgALBMb92rrgNb+Wzk0+WAd9qpquSCRXx7gbDTCrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pjb52SwC1HJkvP8tTiTzLOF+txxgyvJd9uBbyBNNdlxd8H4dZj7fYcJdhMDeGen0WkxbQzy5i7JD80WoAqcP98KN4dBCfbM1JiI6iYxsi0ifzT/BH2K7zgOIm25OYiNetca2VhF6imCvQNBtRSIZXae0kpFT+a6IKI4JI7Iz6OM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ai2mvyeS; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ai2mvyeS"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-515548f390fso5871cf.0
        for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 05:13:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779365638; cv=none;
        d=google.com; s=arc-20240605;
        b=lO73AjreewJtElipGOZrY3IY3MG2ZLcTNMPQlNbCR3EIDGiAb81iBzbbp33MACjPyR
         d5aukfhE0nKaiqHwILui+F8/2pW4Cp2ywQp6YicUSpwgkqNelqfNsIDextgMXmkA5I7F
         j1ctrTkcgo0E0Zd0H+9/hMl2Jds4m+6yik2ILxbfH16UUuFonh0fJBNafY0uTPp7F1md
         m21+bYTey4s6PjZsxUJq1idCdDfUbZr47f/3fzL1IuRLjyeMwoFpbp4AX9qoXxnXRz/6
         zS7i8PGcuCYXWSO8gPl8mgOoBUAr12/pm+SPkU2YAJnmiY0wq/IQrmVdISw6cZ5/6HB+
         /jAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GJBi6kqgS/T+2nzhRr9ooN0dsVaPQuEMdq7fBLHxWNg=;
        fh=tBdsPKYJLbQU9sZJY4XodjvcYD1D0EAHmgBHVrOrxnU=;
        b=ANJS/19VnqjH31GM4MaJvTnxV9xQUSygSCcDZh9gG5mvzYLzoHgj60A5mCxXH92B4h
         +ZCfmSgOuauHO3iLUuMdBFb7W5YZ9Degqw+hquhDuf1BBr69gr/1KoqNYG0GHly2unwX
         NIu/7nQpmOi6ryHFas8i38Ve1CUqcYCROBP/tjTpgOLSMhJpJR71GjLm24wtAsiqJ9K0
         tQqlP8HiyFDz/9L9ic8LSMGE9CezHHGFlAdee3RrsxslmtN7G8yZ32N57tz68uqLXQtr
         2MrD4Ad2iTm1XW0CimKWeBUmF4iyli3caLLY/rWepacxtlAYoKr/BmcaYpdb7Bwj+lgo
         58WQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779365638; x=1779970438; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GJBi6kqgS/T+2nzhRr9ooN0dsVaPQuEMdq7fBLHxWNg=;
        b=ai2mvyeSqWfWYz+Q7nLQxEDw82SQKcefiFjkOFabOHaNT+f6TCUGYxXfomzgDp+JNu
         ohkpNy3Fy/WFE7DL7qvCx2z3H1jAdqxSaEMmQ8Ykl4qZ13yKFlk64YeYaVx7Kw3j1nkL
         DZ5uw2U9mhZEMC758YycLMhPvjypav/ZxLgy3MoW4C++5YdcGYNw8Jr9yxZ393pHpUYS
         6HRtHVsnHFo6VxTVZ2NRbpOsdgeRv1LSVYP9EJzG9olzg7w45wS34vkddA/l/ON5Ae45
         E2F17SHzigYMl40bTRjcpdggWbs/BBCwj2eFlRtW0eYSofuwzNEK9ZpIMpCXwjLSqIST
         5MeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779365638; x=1779970438;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJBi6kqgS/T+2nzhRr9ooN0dsVaPQuEMdq7fBLHxWNg=;
        b=BWiruiXK0xn5QcbcOqLAI9/Bv5I9C711/y05svJGLLjVchfZSmwnVoqAjCHuTEiBqF
         b0/W/7QwwjvUPU70Q4riJA1zbUHFpK5DJp6KIZduN2EdwI34Cr9vHIpoapU6vvwF7jAD
         dQMu3GOwGsiv11+c0p5v6HOT8u4oEf4t2xPMIacmVY0JXc1KiQo6aiOEBQHi81BQiqFn
         HrV6LBg4gbF8yJ06IahT72HYya/t3Qdn+7LoG30hXMc9VXyXVN7QL2xmW0pCz8/5PBSr
         FwVwkj9KNJ+X8ckOBQ9zmEZknVRd1B7l+b2Bejejf44cIvu2+F95x4IDq5j1qilx6cr+
         tG6w==
X-Forwarded-Encrypted: i=1; AFNElJ+MpUVW1B9vdlx4/CL1wBYyNi1CNqRb7v2BUmZHqTnG4pQ9YFPl3s03YlILGAXmNWs3Q9Rjx5l3kRmR+Qpx9iM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/yKEEjAUuI9R1XepM9i+wwbOCIDBuNTjsVViNn0lkcabHlqlv
	MSEoqsnQhbyCa+Pxyq4zLrfRCIZNZ6rzgzYmZfuNn7UZHGUbnPvoQCcpfFk5wUzyPP7sCIvlh4z
	5hUORfuf6xXdt+DUdf03ra6EECzIgru65t6xbL8/8
X-Gm-Gg: Acq92OEjhV+mbcNcuMvFPOj5RITFVKEXmEAHWenDrcjcrWG9VffK/gkxmxcdDBrvQPw
	npsW0Ub3lQSOc1XlQ2MrVbPI8K5w6ZOysoTy+/IXtiJi/S24pjAnsDKNFQE4Oes81LGnVqXiTsb
	NqZmMcIqJQX5i7wXI2L+JPgfC0/SpWArLdsJn0DMUR/zUj+NAisLYeAtmek9IAPnWzey4obYNnM
	YN4brDv2YVPyIYVVMDqZg5YfDcEi1XBRIw82WmkMGyYFLYcqnKcJ0+tRskENNMo2e5LMqyHQDuK
	jsBeVR2pp/E2ls2W9u0=
X-Received: by 2002:a05:622a:a94e:b0:516:4f62:85f1 with SMTP id
 d75a77b69052e-516c552fa38mr6885881cf.22.1779365636942; Thu, 21 May 2026
 05:13:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-24-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-24-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 21 May 2026 13:13:19 +0100
X-Gm-Features: AVHnY4KHC9HIiDmjKgEge5iH3VKNmS75Hv9JyZN2WMHPkcnLceuX40X-36gd_Tk
Message-ID: <CA+EHjTzfo0_uxHbrcntLdHLaLGB3uO41+JzcyW+vHr+u=VB5=g@mail.gmail.com>
Subject: Re: [PATCH v6 24/43] KVM: selftests: Rename guest_memfd{,_offset} to gmem_{fd,offset}
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
> Rename local variables and function parameters for the guest memory file
> descriptor and its offset to use a "gmem_" prefix instead of
> "guest_memfd_".
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  tools/testing/selftests/kvm/include/kvm_util.h |  6 +++---
>  tools/testing/selftests/kvm/lib/kvm_util.c     | 26 +++++++++++++-------------
>  2 files changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
> index 2ecaaa0e99654..f19383376ee8e 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util.h
> @@ -690,17 +690,17 @@ int __vm_set_user_memory_region(struct kvm_vm *vm, u32 slot, u32 flags,
>                                 gpa_t gpa, u64 size, void *hva);
>  void vm_set_user_memory_region2(struct kvm_vm *vm, u32 slot, u32 flags,
>                                 gpa_t gpa, u64 size, void *hva,
> -                               u32 guest_memfd, u64 guest_memfd_offset);
> +                               u32 gmem_fd, u64 gmem_offset);
>  int __vm_set_user_memory_region2(struct kvm_vm *vm, u32 slot, u32 flags,
>                                  gpa_t gpa, u64 size, void *hva,
> -                                u32 guest_memfd, u64 guest_memfd_offset);
> +                                u32 gmem_fd, u64 gmem_offset);
>
>  void vm_userspace_mem_region_add(struct kvm_vm *vm,
>                                  enum vm_mem_backing_src_type src_type,
>                                  gpa_t gpa, u32 slot, u64 npages, u32 flags);
>  void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>                 gpa_t gpa, u32 slot, u64 npages, u32 flags,
> -               int guest_memfd_fd, u64 guest_memfd_offset);
> +               int gmem_fd, u64 gmem_offset);
>
>  #ifndef vm_arch_has_protected_memory
>  static inline bool vm_arch_has_protected_memory(struct kvm_vm *vm)
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index df73b23a4c66a..11da9b7546d03 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -947,7 +947,7 @@ void vm_set_user_memory_region(struct kvm_vm *vm, u32 slot, u32 flags,
>
>  int __vm_set_user_memory_region2(struct kvm_vm *vm, u32 slot, u32 flags,
>                                  gpa_t gpa, u64 size, void *hva,
> -                                u32 guest_memfd, u64 guest_memfd_offset)
> +                                u32 gmem_fd, u64 gmem_offset)
>  {
>         struct kvm_userspace_memory_region2 region = {
>                 .slot = slot,
> @@ -955,8 +955,8 @@ int __vm_set_user_memory_region2(struct kvm_vm *vm, u32 slot, u32 flags,
>                 .guest_phys_addr = gpa,
>                 .memory_size = size,
>                 .userspace_addr = (uintptr_t)hva,
> -               .guest_memfd = guest_memfd,
> -               .guest_memfd_offset = guest_memfd_offset,
> +               .guest_memfd = gmem_fd,
> +               .guest_memfd_offset = gmem_offset,
>         };
>
>         TEST_REQUIRE_SET_USER_MEMORY_REGION2();
> @@ -966,10 +966,10 @@ int __vm_set_user_memory_region2(struct kvm_vm *vm, u32 slot, u32 flags,
>
>  void vm_set_user_memory_region2(struct kvm_vm *vm, u32 slot, u32 flags,
>                                 gpa_t gpa, u64 size, void *hva,
> -                               u32 guest_memfd, u64 guest_memfd_offset)
> +                               u32 gmem_fd, u64 gmem_offset)
>  {
>         int ret = __vm_set_user_memory_region2(vm, slot, flags, gpa, size, hva,
> -                                              guest_memfd, guest_memfd_offset);
> +                                              gmem_fd, gmem_offset);
>
>         TEST_ASSERT(!ret, "KVM_SET_USER_MEMORY_REGION2 failed, errno = %d (%s)",
>                     errno, strerror(errno));
> @@ -979,7 +979,7 @@ void vm_set_user_memory_region2(struct kvm_vm *vm, u32 slot, u32 flags,
>  /* FIXME: This thing needs to be ripped apart and rewritten. */
>  void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>                 gpa_t gpa, u32 slot, u64 npages, u32 flags,
> -               int guest_memfd, u64 guest_memfd_offset)
> +               int gmem_fd, u64 gmem_offset)
>  {
>         int ret;
>         struct userspace_mem_region *region;
> @@ -1055,12 +1055,12 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>                 region->mmap_size += alignment;
>
>         if (flags & KVM_MEM_GUEST_MEMFD) {
> -               if (guest_memfd < 0) {
> -                       u32 guest_memfd_flags = 0;
> +               if (gmem_fd < 0) {
> +                       u32 gmem_flags = 0;
>
> -                       TEST_ASSERT(!guest_memfd_offset,
> +                       TEST_ASSERT(!gmem_offset,
>                                     "Offset must be zero when creating new guest_memfd");
> -                       guest_memfd = vm_create_guest_memfd(vm, mem_size, guest_memfd_flags);
> +                       gmem_fd = vm_create_guest_memfd(vm, mem_size, gmem_flags);
>                 } else {
>                         /*
>                          * Install a unique fd for each memslot so that the fd
> @@ -1068,11 +1068,11 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>                          * needing to track if the fd is owned by the framework
>                          * or by the caller.
>                          */
> -                       guest_memfd = kvm_dup(guest_memfd);
> +                       gmem_fd = kvm_dup(gmem_fd);
>                 }
>
> -               region->region.guest_memfd = guest_memfd;
> -               region->region.guest_memfd_offset = guest_memfd_offset;
> +               region->region.guest_memfd = gmem_fd;
> +               region->region.guest_memfd_offset = gmem_offset;
>         } else {
>                 region->region.guest_memfd = -1;
>         }
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>
