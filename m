Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA5B4028D6
	for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 14:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779374415; cv=pass; b=m74bgvb4p7ssiCQI+np2GQvrEDd4SZNjVUZunNMvnAuRJqn6/RPKIQHDudvTHZc5bFA0tAZeM+cqk/BMZIz24YGRRFJQs05nkFace7dVyZXMHPl7dUHPpQhZce/+ayXS60aWmOFaar6/g9RkQ3vqzquMcmA+J31EYjQxny1i2C4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779374415; c=relaxed/simple;
	bh=RPARozcT6UfC6sMpVhy6r4Aiv8XaW0DBJyjeK/ufCb4=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TpH5eG+gCcMJ9hilPohU2DtqlkxMWL8VxL3EmhXAKXECl6UHUNzL9tXSAOB3aUzIgNCRoKhjO5hyOiFt3zjPrzgLqxmmyKk3KFrdVb8LcPqmt4G3JCpviCelyoBxLJdpMhbeIywEBs8IrZxLPCMAlWnfJR7isVrsMQVSV4zO7KY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V9p0GPMM; arc=pass smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V9p0GPMM"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-631ca15d35aso5560592137.1
        for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 07:40:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779374412; cv=none;
        d=google.com; s=arc-20240605;
        b=PImCbBssxNlAGx7aXyDHmuBs75kro9jV1EALrYnTi/iynxdNobGoMol2dtW4nxc9l3
         eAnx/afkcYwRp0XVXciaTYFHOeLJu5qJTJQc9edQW+wNMcT4noC9WSrP+S+yVyDu3hBN
         9yUlfu12B1wWZjSv+4nakIyFpTi7si09k610+Xbx41ny5nocbB94rzAW6dW3xzUOYydN
         DgzFMB1+2PW+HqbPffkWU4X0x5PJImm+7L9V0EQU6m5sw/gLSHBL6dycANTFHnLVlb4m
         lEnQe8qJcKPqjSSu/Ndg4qQX/8RtlxDVrrffNTlhAJwdQYIZCMAr/ZNJ+q9ZjBsNFJB0
         +5Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=pETZ8fM2HZBGp3r6phdANPEwcKJJ9mevi9pfUImaGvM=;
        fh=Pf4LyNmmFSQDiVdkboACHs3vYwvU2VndR/+GOk+34Ac=;
        b=CHNGeIjXCQDwbGl+9Uls+bh1PfsVRXI30wntZcPmgbPBfREWRRbWzkN1uxlLhMJwRb
         K0tZiGKTj5IXr98IkkF+eh5I5oFsogvE+YppCB2BXtHe4LaTvahniKR8vxjqW9b94w0R
         T8454LQ04XjA9VcLw+kMkbe92jMa4rSyoekhynwuxIOrNn4lbPRL+TZhEAk36B/woFfB
         L7/n4Ws/e2ppOdLkyMcgRMn0+07nkgcYVOZ4MjV4lhukPAzxsZnt9Xg553Ei4/BoKvFm
         KN7+oeGuKQdCI1LDJe2TDh/yFtBdH6idl4UI4m9k6gTsXHsDYiC6j2eWp0UywS60XUZk
         H2Cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779374412; x=1779979212; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pETZ8fM2HZBGp3r6phdANPEwcKJJ9mevi9pfUImaGvM=;
        b=V9p0GPMM4JoAoxY0vDgPfychMd8I2dNla96qYqWgPvlZ0DjapntWlKuDNmOjfW+/XW
         +IMGiGnTtURerCqRqPJQrpRxyxBf/qdaQIONZqce1kHnH+9efXUw0bi5zweZjavzLg53
         DLSTVoI/XsPLkgdTjBzww57u0BKReUP3QNqC6y9NxCJ4uigCAAqF1xD1Ckt2XEbuX4lO
         i9MRjTpHgb+xv7cdKHe9yZJ8ko17HPICKtxup56MY8yixmjhhW5iItr94mePc3x+Dpm1
         KM2Z+jwV41cHy6IulePecYceVwzzuxIUO1BCOuDRt+se4qKkmsh/i9pwQ0urySguHFzV
         GvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779374412; x=1779979212;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pETZ8fM2HZBGp3r6phdANPEwcKJJ9mevi9pfUImaGvM=;
        b=pzY2jpZuJ5Canv5VVlN1zb0KZLBCQt8+8gJ9aVrcRweaRoAdlFyqfNsQVwjgHE11wO
         upnptXWYD1ap3t15/i9DH6DNWOMnL+HJoMgcBqC9C81e1+kbVVlvA2ceEt4BrUt6Zsfj
         xX6adhKhl/KAMk5/2ZuTOhWQU1mW0XOwoqDsqQ0JY4vnsXfQ0xcu5st+sGdwvbBiUR/R
         61n6Uvvkx07PxBQNgyZmNzjkpLJvwBiYi2KoJlMlxkzndHYtpEqw1E18qX0B/PZeFiHI
         4AfpQu0n2dfSqEMo3GKDf487+pYFRqG7Qxqqcx2Ws9rkHHzrveZaBtt7qZmY0PTxJw4H
         mxmg==
X-Forwarded-Encrypted: i=1; AFNElJ9JGvf7/ks2F+dycebQ7G330MDWbREiPI3VmsCMEkVp3QjVIdohVI4y/a7KvRGzAxF+BxC6/GcFgSlcefF3BL4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCdIFO0EpO+tBDFo0lIY8thltOuiZhYPjiXzZ22kXzM1D8Uay1
	8IbI9jLKNr3nZ7TPYoNuFf/JKwG7fGdFUDJ7tJcLhzf5mABazCSJL6QJL4FaTdcdZ9m1nfxx4pl
	fSEEUGmHwftdouWp+I0wgsDbS4jT6aeYl3zFbRFWR
X-Gm-Gg: Acq92OFsmBhsWQUFTGYakrtKsp12+VyRhENtPwwnJIQxJDbmZGJtkwWf1Iw3e4Ms+QH
	x3JjUTDyYdXr5qw6tRd6ioeOum0hotkppwI6psLT/ZBozrA/n+2XXebVIKuauLJ6XzfmLV1mIdy
	EobkDQoz/GlPxIKhha3hGohWxA6itIF1athUnGGCFgIKg9fTnZ4x1d83AowQUDl05T0y91vOIAS
	kNSPGizlS/JIB4lMRn0sD/jnYZVhS+HvWnk/s8II3SDp5dfzlQ13IhEwboOfHMl3WwSCgfBcSw5
	5hY+RFfpj2bnhzve0ymPaEj7hiMgCZ5ePmdG7Jrqqcx0Jfg25w==
X-Received: by 2002:a05:6102:52f:b0:634:248f:bc04 with SMTP id
 ada2fe7eead31-673cbd0ce21mr1147276137.10.1779374411627; Thu, 21 May 2026
 07:40:11 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 07:40:10 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 07:40:10 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ag8BmtzxTlcuA_zy@google.com>
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com>
 <20260507-gmem-inplace-conversion-v6-16-91ab5a8b19a4@google.com>
 <CA+EHjTxcadguOfOo7RpJVtAzcY5JAFZTbrAT_wcN6akMi8gCUg@mail.gmail.com> <ag8BmtzxTlcuA_zy@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 21 May 2026 07:40:10 -0700
X-Gm-Features: AVHnY4KEEzPCaNbBUek3sDUc3FN_Enrlvw5CRgr6BoNKh9-pt1QUYC334HSuCXU
Message-ID: <CAEvNRgGDL=_XO3z=h2RLqb_gZFe9QtxwiMFJHCzQY3HEoaUfHg@mail.gmail.com>
Subject: Re: [PATCH v6 16/43] KVM: guest_memfd: Use actual size for
 invalidation in kvm_gmem_release()
To: Sean Christopherson <seanjc@google.com>, Fuad Tabba <tabba@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
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
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

>
> [...snip...]
>
> --- virt/kvm/guest_memfd.c
> +++ virt/kvm/guest_memfd.c
> @@ -640,9 +640,9 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
>  }
>
>  int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
> -                 unsigned int fd, loff_t offset)
> +                 unsigned int fd, u64 offset)
>  {
> -       loff_t size = slot->npages << PAGE_SHIFT;
> +       u64 size = slot->npages << PAGE_SHIFT;
>         unsigned long start, end;
>         struct gmem_file *f;
>         struct inode *inode;
>

My mental model was:

+ offsets => loff_t
+ indices => pgoff_t
+ sizes => size_t

But looks like loff_t is more suitable for places where return values
(possibly negative) matter.

Good to go with u64!

> [...snip...]
>
