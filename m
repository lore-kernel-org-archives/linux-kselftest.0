Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B4F37E2E6
	for <linux-kselftest@vger.kernel.org>; Fri, 22 May 2026 23:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779490961; cv=pass; b=H/2+VIrnup4jaOeGzUpoWQtU4RE+DUiRROZra1DvdSbsF4r/JVfJkcXonVbplbthcwc5xRj7vCGQHZ0YrvGYJ6GAF9fVJM4UYNEgl2YRtbiqy9/loxy71k9HFBy/BxbJxRS5mRHQAtvkVH1PQKAuyqYwGhHU9hA5VNNqGZHG/lM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779490961; c=relaxed/simple;
	bh=ibZMSZEwhsHjGnLBrHCL/QtGJncXCz0nJYgEJjvO8KA=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e/VY7NyyQ1PoZGqbxs/Ows7AcHtKO+iUE+sUkKBHt910xlR6Zxhh6jeedMFLeC8+BCTVRtAFZZnvP1nuSLrexqiGXTC61YmbGmmAJYxC+sTf7Xq400jpaCjkNz4+vBlRrE1t+GawlQMkh9UUdKSu4ARLYBqSACCMktzMH5pMOFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YQgAgxjd; arc=pass smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YQgAgxjd"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-575171b1ce7so2575652e0c.1
        for <linux-kselftest@vger.kernel.org>; Fri, 22 May 2026 16:02:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779490959; cv=none;
        d=google.com; s=arc-20240605;
        b=E8bQHXQ98FpLxraPLtExsjK6WJvIY0qxgIp2WkOTadJXcRl8GsF9InCK1RsQWkspk+
         D5o3aGU3qyxa99V0eSRYsqFFkXxx6eKmZx9O0wCXFwE9V6zGFVLAvkao+z0ZXN3qRiBK
         jT7+7nzmWB2wPJBe5Vb2bhbyRoo3ObrYoZwvzNewmstzY5c+POCA8y6dBO4BMaYnzAyK
         wtEUvo/SQ+RNsemFQ/Zouad3b8TFW6j3tVi2jjgL62riptFtM8kOBb6SqoZhv5WeoiKm
         Y8Rq07LI6biqA/PTDdemuSU66OGUARTuDbqPTevGg+FyR5ZFnAWdJp+A7mGjEZEmsmgU
         eb0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=+lqWW5xTN76UwAfrRbxGlO2NBxcf8RIbZZTDif3+3JY=;
        fh=iG3C+F5M+u0/G051tesoA14nXlaUSCrQZcT8FpmtshY=;
        b=YOyAF62GDuEdqODS1c1z01C6gfnKvCZWyqS9ycM5vfGokMie2/fkiTVF/e1EYVK1an
         n7khrGQTmLKlmLCjzLiShpIP7c7C4pdQBeyeA+eDE6EGPwloZn1wV6sOXu8EQtHzNdSk
         uzYrOSi2cy9H5pISs0XJwD9NbqIOA5Ue20ab25If86dhdai/ZY5sRTrD0e5gCJ6QyJZ2
         95QU+V9hOMmTJ1S2aRynYmwKWElSXwhDG4pM3OjroP5x3Sph3ZQ+FcvwEBmaA/kx2WfR
         dhuI9IyB0cvIZkh1waVePBnzzPt6uH+We5NhlmKtY2FODyq0R8nLxobxwFKRIrAeCzk8
         yIFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779490959; x=1780095759; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+lqWW5xTN76UwAfrRbxGlO2NBxcf8RIbZZTDif3+3JY=;
        b=YQgAgxjdzx/T0WCj/Bi/gjx8L4ZI2/BWximtpzkBrT5ik/C70mWPd2OkJgjGGvhPdH
         zmxB5xtR6GHvDmU+EHbkRJNBh6TLKkNVzDeX+d29UjiSbIK3QGcFPNXW/GVTho3tFmhF
         ZTbgBSEyC1XQIo05GzG2xYS58Su6qOFsJQGaW9a+IQZhPSpOMkeCqH1uViErKDZBd2SU
         H7KcDoFVM0GQagKSWqtwDaXMefIeyNl6ugj6siiOKuIFhaTWenYXrnQrDOkvisFzc/ab
         mGL7evVPn00TMqeLeJyZtuGamzUUGWNLGtJhV6HlOGJen2br9ouv7p3beAG0xX6ph38p
         ymRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779490959; x=1780095759;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+lqWW5xTN76UwAfrRbxGlO2NBxcf8RIbZZTDif3+3JY=;
        b=MVLbK0I9MaRd7LoaKLaU7ZOnqGOLw/hTLMnIRPVgsLTXP1yNrHzaZtCFOUXXrRFsW0
         jHbhuNdDd9K9+3iN9WgHz1ApfVllNmTIHIxFMORCZOgOStGuHHh4UuuoghxImT/xxFVQ
         mOf6yy5Bmi9Fn9u80TScy3wYy4Harr8vJQF9rtOIWYYArlk1eaPfrPKncTA/2dD8cmlW
         83AfwPeNscIOcSiUDJe8T3Sq72y7wDuhULT6uS6lTtp7huP8jtJBBjzFFhJ6THWda6Mm
         G5nv3rjbLjpw54N4ZPa6nCEGBAkuWhu3j+zzJfg3gpXHflrsMBqTRxSmiqZlsVvsvFyS
         B3iw==
X-Forwarded-Encrypted: i=1; AFNElJ9bqIrkSy3wFu9NYq2rD6jKyovDfx5jorYL67he1hUZoHhOGxdJFA3OJzlvW7lQTgIuUKNzIDqbpmcuvIIHMGM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2fcvIE1C/B7WA74uFqIQ6ZF+nDMK9TJqkpAVFBCxMA/LAvO/5
	Y0+pSvQLnw2RT8V4O1kMAlvTh/AvjwLnAy++nL1kBF5ToVTxf1PeTcdZvd0W/q2sXywz1GJ68oH
	C3zUQGZYVtt5VM+tWvI/C1XwukOoQGNxX/TVdyhqq
X-Gm-Gg: Acq92OH4oqVICQbsIj8GHSEwVjtUMqtt+DYcV33FAVLDuYeAYYW8Ordrf94lXFzX7m5
	5KC/XyNM8swCgaGQrAX94Pnw2iAFQlH4dze8QpiHSGL4k2yRlIPp8XFOcrRn0LTUvk0gP39x9Fb
	2s+UTgTyilCHKhCNpMs2OHiz7xTLl2i1wqyQVlvOXurr8MIodX2B7fc0d91sx6k7n+wBjg6cJMV
	9wBfGwgmGfZd5meGeS4FNsFz0M02ZdADjOJfY409U1FsXVC67cSFrSRyBuP4Vl4+WNoZyudNmzS
	HtkqjupCwELeawr/e/72YenOAmD5CDtZ3y7+nTyJuMwYV/DsK/ESG7ipSG4VVJEAnj1DBcYYqA8
	guo/v
X-Received: by 2002:a05:6122:1796:b0:56c:db8b:504e with SMTP id
 71dfb90a1353d-58663966692mr3461861e0c.13.1779490953839; Fri, 22 May 2026
 16:02:33 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 22 May 2026 16:02:33 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 22 May 2026 16:02:33 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-25-91ab5a8b19a4@google.com>
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-25-91ab5a8b19a4@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 22 May 2026 16:02:33 -0700
X-Gm-Features: AVHnY4KLpjLWXQlawB-gZxOwicuZUmspmndJ5b1mQf8zRUUhG2Ao-NrVmxpOgcg
Message-ID: <CAEvNRgEHf67kpLtNyET7cvE5hWfXHqNrwv9cP9bRUgk_NKb+0A@mail.gmail.com>
Subject: Re: [PATCH v6 25/43] KVM: selftests: Add support for mmap() on
 guest_memfd in core library
To: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>, aik@amd.com, 
	andrew.jones@linux.dev, binbin.wu@linux.intel.com, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, ira.weiny@intel.com, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
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
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
writes:

>
> [...snip...]
>
> @@ -1078,13 +1077,17 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>  	}
>
>  	region->fd = -1;
> -	if (backing_src_is_shared(src_type))
> +	if (flags & KVM_MEM_GUEST_MEMFD && gmem_flags & GUEST_MEMFD_FLAG_MMAP) {
> +		region->fd = kvm_dup(gmem_fd);
> +		mmap_offset = gmem_offset;
> +	} else if (backing_src_is_shared(src_type)) {
>  		region->fd = kvm_memfd_alloc(region->mmap_size,
>  					     src_type == VM_MEM_SRC_SHARED_HUGETLB);
> +	}
>
> -	region->mmap_start = kvm_mmap(region->mmap_size, PROT_READ | PROT_WRITE,
> -				      vm_mem_backing_src_alias(src_type)->flag,
> -				      region->fd);
> +	region->mmap_start = __kvm_mmap(region->mmap_size, PROT_READ | PROT_WRITE,
> +					vm_mem_backing_src_alias(src_type)->flag,
> +					region->fd, mmap_offset);

Sashiko pointed out these:

1. When mmap() is done for region->mmap_alias, it doesn't use
   mmap_offset. I'll fix that in the next revision.

2. mmap() may map past the end of the guest_memfd if, due to alignment,
   the mmap_size is increased. That is true, but I feel that that fix
   should go with a bigger clean up for vm_mem_add().

3. vm_mem_backing_src_alias(src_type)->flag may contain incompatible
   mmap flags. This is true. For now, when guest_memfd is used with
   vm_mem_add, the src_type passed has to be VM_MEM_SRC_SHMEM. I think
   this also falls in the category of doing a bigger clean up for
   vm_mem_add().

>
> [...snip...]
>
