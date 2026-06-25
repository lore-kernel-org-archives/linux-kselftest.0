Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AC935AC00
	for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 09:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782378554; cv=pass; b=NW1b+XMoOCwXZBSVwsaI4+IClKGBLwP0KJQKbw59CYddOGH1ZmxlEgvLsT95K9rfdtwQG8AqutpzAvjH8WpwKFFKnBjtX1oXMjW9og77nvqm/zcPdVcOTpT1QkwY9A6T5ohEY5dAYctPt49iyRjDL6CS0QECiQy9kRuYSxc0xqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782378554; c=relaxed/simple;
	bh=9leBl/vLIM3qHmEH/Edw801DRnY2C/1n405lmvRfXQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tEwqRN3t746NYvWE2h/mesd9dzYpEYg5hlsBUHa5YcQQehLRPLTiCRFKJGVHjUeJevjqnOD22DaJfV+jQpq3EqrSWX33s/aUgQr9DtPxcrmhuXYRJC5suiidnwOw/38sC2HpXQOAJ4PSHOp6i74jfS1vqGR8M09ayv47UUg/QYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Jns7aV1x; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Jns7aV1x"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51765331535so160061cf.1
        for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 02:09:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782378552; cv=none;
        d=google.com; s=arc-20260327;
        b=s3G+Srha7948MMivmTA7RrX01vW/CVRz30itBbBPHC5SAFoQMPrrXZHvvsR3lVXBt2
         gzvsZS+ypnhJUY7Rn2eQTOJ9A/UWdhxcuEBzKLKxFXwfsd92jN2RDwduz9dpdAXguKyX
         /n53dGjtamsM1x0dQfkQafQAqL46e+bD0pJa1l25IYFSz+7PEo9dS7RsWrvGbPkLW4la
         1R2/1TFuMES9GRq+q/ta90KNEtuo89ex2oP2vqfkhXrzDSXte/TVKWoT74jcSvKMvJKQ
         447yOkJnhUoAxhMExZl0zOUw265OszbgLlEkkkhQA7jwIc3qPvU6/X/rwao/ryUl/2WP
         ejQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=R9slP6pRfRJTNIoqGcM2r5fRlSRzSJ4pkgblOXA4Ai4=;
        fh=qQn5HbZdsHs9lHFpXcfeGAe3GGA29xlLm1tkMMMpFRk=;
        b=UIpJRGoIv9WU7MHaeM+GvqeybRWeYji2bqF5a2Qc9QX39qjoxv7sKn3J7myCYVI146
         9LkaVakbVOmRXR5uJ6bIYeVzIom66ajrAwlgwMQUub5bIl80Sz04toRuMM6go6Jj4FqK
         OlTKgkH0o/0WXBV7ZcqaJ+1mZbPdfxieKzYEzDLo1C1dXEcI4704f1Zi8iT7fIMMivI+
         8RnlXncjgWTNjStmM9mMtiEePM6BG4lSUWEXA+jbNmjs6Yjvvtq5OigrKecNaU92fxVZ
         8824NUUB+0AO7ClATY/AJh+zOG/ySv7CieHQcLK7foLUA2JG5DcTq82K1c7B7WXxrpRl
         RlfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782378552; x=1782983352; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R9slP6pRfRJTNIoqGcM2r5fRlSRzSJ4pkgblOXA4Ai4=;
        b=Jns7aV1xdMJ0wBIgduyQPFR0i/K2Wph7bvTFq94JApIKkbLwjHjiWDFQ58cCcIsZHf
         XZ31fGTuuQMlpRgpEEqaJd1dY4NTe99sSITIrcC/QdBf6HApy3aSQp2UeEoc+SaaxTjd
         0nO3WRMR+xSeZ7s5VfRIjXflhEtnedgpuDeQsgKPY1RpwvYotgIcvJHKUpZPBj401Tpy
         g/WX2JLzw0068RgvKmCx7uZZtGnJNBdveIVRyu1QCbJpvjlqgpWDeZ6VXjMLx/n+2fyd
         8sQaqlrBb5aP3SnLO79/W+LlUQ4DQMFK6cUcMf2A0JGyzo7AiYDQa7lBQJUSKLoyTc39
         GDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782378552; x=1782983352;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R9slP6pRfRJTNIoqGcM2r5fRlSRzSJ4pkgblOXA4Ai4=;
        b=Io7qPh5jF+v9eDlNpggmsV2DWFwEP7tHGORoi8v8hO7GSQhKOKk1T3SQp7AjFF65Ot
         XI2LXWK1ttt4yMLz7jEzS0ZHrBpUFsvM6H5Aet3zxvFiZOLUuFRG38TDMKiTIghonAwD
         B6hX3wB1VT8el6P5daa4rxx87dh9mQiwmBqH29IpPOywjckvzi4PonuJy5+pbYSNI5s0
         uenbufo57CTiTmvnu2KeJ8sbsHVFclgpv1dXEcWI/ir1HUgm7+Dox+m92z+VX1YAnMNO
         JQ7xCVgAv2UBcNAHvkIqEPbGe94fftt8Csnu6R7dnOHjd9qgw1Ru/TrvCpqimqMHfZ1u
         dRAQ==
X-Forwarded-Encrypted: i=1; AFNElJ+EiwWooUc3ZeBPW+357PTRDLgXLZZozIebVPAJ0EabpHPEfBZ2JKRK0HGvwNxiImSIFn5EgpcarevNw9MW8FY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmB54Z9uhwWPHqz2q57cttBJFE55ZIwXOSr35oj4q3ebP3dy5k
	FpXQwrjCmNsklo43YqoF+a0wgEZTEQL9nnGFIpFMQaJOKo4mOGBlq6s7t7IxXqUsVQ+TE2/nLNw
	vabQZeLSXHLjKHW0E37OT8REKEeAhbtJtg6o23lFD
X-Gm-Gg: AfdE7ckDH6Bv3IRtQMM5x0c1K0abTS94CYvaahiUudes9pmgZPGjIL44+DZNZWdkFAD
	RJI7IvGtOTtSTF2llFeJAVnWPbY4ySXl46WdMGXsjZd8B0UwbHVD7Fb/X0BHlle0mghYraouNYv
	BCfLamB10SIrSRkVr7eth1TqttwPckigNKEweq3IA4fuBsurCBlRVHNmgrTWkL2/vZNgbl+4GmL
	6QQqq8ioJQIZBd7t+U9bgmu/GOrKI0WJmgow4gx7OJICKuSRbyEqqmLi2uC3CyZv+0CR5IefQ==
X-Received: by 2002:a05:622a:681b:10b0:51a:713c:7444 with SMTP id
 d75a77b69052e-51a713c7d5emr4672591cf.18.1782378551258; Thu, 25 Jun 2026
 02:09:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-42-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-42-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 25 Jun 2026 10:09:00 +0100
X-Gm-Features: AVVi8CetvJC1Xv6WjNcu210fkMycJkdRkSQWNh7yK6lGtnxBBkgdQs08aLwNOyo
Message-ID: <CA+EHjTyHQa2Pmgc=0zf6emtALxAN5f8gUXoV11mShz2qdrqjTw@mail.gmail.com>
Subject: Re: [PATCH v8 42/46] KVM: selftests: Provide common function to set
 memory attributes
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
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

On Fri, 19 Jun 2026 at 01:32, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Sean Christopherson <seanjc@google.com>
>
> Introduce vm_mem_set_memory_attributes(), which handles setting of memory
> attributes for a range of guest physical addresses, regardless of whether
> the attributes should be set via guest_memfd or via the memory attributes
> at the VM level.
>
> Refactor existing vm_mem_set_{shared,private} functions to use the new
> function. Opportunistically update the size parameter to use size_t instead
> of u64.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Co-developed-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  tools/testing/selftests/kvm/include/kvm_util.h | 46 +++++++++++++++++++-------
>  1 file changed, 34 insertions(+), 12 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
> index 3a6b1fa7f26ef..db1442da21bb1 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util.h
> @@ -454,18 +454,6 @@ static inline void vm_set_memory_attributes(struct kvm_vm *vm, gpa_t gpa,
>         vm_ioctl(vm, KVM_SET_MEMORY_ATTRIBUTES, &attr);
>  }
>
> -static inline void vm_mem_set_private(struct kvm_vm *vm, gpa_t gpa,
> -                                     u64 size)
> -{
> -       vm_set_memory_attributes(vm, gpa, size, KVM_MEMORY_ATTRIBUTE_PRIVATE);
> -}
> -
> -static inline void vm_mem_set_shared(struct kvm_vm *vm, gpa_t gpa,
> -                                    u64 size)
> -{
> -       vm_set_memory_attributes(vm, gpa, size, 0);
> -}
> -
>  static inline int __gmem_set_memory_attributes(int fd, u64 offset,
>                                                size_t size, u64 attributes,
>                                                u64 *error_offset)
> @@ -532,6 +520,40 @@ static inline void gmem_set_shared(int fd, u64 offset, size_t size)
>         gmem_set_memory_attributes(fd, offset, size, 0);
>  }
>
> +static inline void vm_mem_set_memory_attributes(struct kvm_vm *vm, gpa_t gpa,
> +                                               size_t size, u64 attrs)
> +{
> +       if (kvm_has_gmem_attributes) {
> +               gpa_t end = gpa + size;
> +               off_t fd_offset;
> +               gpa_t addr;
> +               size_t len;
> +               int fd;
> +
> +               for (addr = gpa; addr < end; addr += len) {
> +                       fd = kvm_gpa_to_guest_memfd(vm, addr, &fd_offset, &len);
> +                       len = min(end - addr, len);
> +
> +                       gmem_set_memory_attributes(fd, fd_offset, len, attrs);
> +               }
> +       } else {
> +               vm_set_memory_attributes(vm, gpa, size, attrs);
> +       }
> +}
> +
> +static inline void vm_mem_set_private(struct kvm_vm *vm, gpa_t gpa,
> +                                     size_t size)
> +{
> +       vm_mem_set_memory_attributes(vm, gpa, size,
> +                                    KVM_MEMORY_ATTRIBUTE_PRIVATE);
> +}
> +
> +static inline void vm_mem_set_shared(struct kvm_vm *vm, gpa_t gpa,
> +                                    size_t size)
> +{
> +       vm_mem_set_memory_attributes(vm, gpa, size, 0);
> +}
> +
>  void vm_guest_mem_fallocate(struct kvm_vm *vm, gpa_t gpa, u64 size,
>                             bool punch_hole);
>
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
