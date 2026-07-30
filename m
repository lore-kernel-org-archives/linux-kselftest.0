Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332EE3DC4C9
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 22:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785450154; cv=pass; b=RdRzP+Rs9NcqqNQOj94PerrodcT6WIvrC9iqonjXgBwzMpImrTeFjqZ4kE3qrj7LOGPyVAo9p4aQCCnf4DupFt2dwr8TdOoNAFQ357DZh6CPTTu8SaWJGZmWjAObtaVUPBJofM8uK3ipX3toWuofUXtbwifoDWy8mYUvqqzC+D8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785450154; c=relaxed/simple;
	bh=TwuTFoIIkzmwmA8oaGhsoy6UeQB2MH+oAc9PwYUacYQ=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N7MTFMmB1vUTkqB/57E0BhtZAUyVq3QkeWme0mDcxKnFOAndS2yMxcdtXTnV1swu1qXeunNgZqM/Drcb9Hp0rx0uvwbGcb/wn0gM3aXurvbNxFLVC6daVqFIvgezZ1kAADh+R5lLl7p9FfMwEyREPiwJc18aaHVq7F2x0I2WEvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WDWBZ4VI; arc=pass smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WDWBZ4VI"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c9c26a5fb98so130802a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 15:22:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785450151; cv=none;
        d=google.com; s=arc-20260327;
        b=VFEjlaNxXrpbsRNsIct3CNZlobLrmALAMZnwoWt3rFJs2ke5hznrMIsyi5e+n/wEQr
         X72YBpZIecKTBN+N+951WtvJFzCTqbTQZIQSTDIDr05ITsg2QxNNaSwoITO0EQvG9Wsd
         sHhV+E21NE4lFWBYXs1Ar0TEzuFWV4RSFsK2R3wNEp/Snw93pfqh+ggMHFW+GcpTMi/Y
         SmKzjyU3bCM34+CmBEmiZxPqjA0jLHXYEnlhPL4XXICJR0PvH0PiXxFuLb1iFareCxXw
         NXj2LUxTOMpPe8UtdxzBms9WYIGRvXfZgd3aFq7MBFFf/xgJVqlMqq5Kcy0H+SayJNIy
         jGAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=KKK3RxskpKfni5OmmKwhdX+l3ihKYPthumPMEB1IvdA=;
        fh=hIsQFxE/m7jeU2kAJC1r1M6etiHwUYc7Hm9vaJ5YaMk=;
        b=qP0OMDOPas8u7kK06QQqO1rjbG79sdVGqe+vHlEDpPQiuCdjL8jjFs8IgDY0UHbFAo
         hDsGN/w/nJ5N3kQwdhRd8EeIrfKeWrE+JVWiBsiQkvAIw3p4cbGleh6JTFWz0ToMtoYk
         1qIKobaVJX3km9J6ILrc9R3iGpgGWVabCiFMSxcaF3dRxCrTJTl49ZTo2vkB/SBkL2FU
         eWoLHkDIKR7vsfNtTaEp5Ta5jwOCI0CvTiabauJTR+E6eq9xACbrV5jVFSufAuGfq8TJ
         x87KX5MfU1HH08vex8HiUcISVbgrVkYFLK9iplY04Xw/kf7eBuHmT65/UV3qzX/gEkcU
         s2aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785450151; x=1786054951; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KKK3RxskpKfni5OmmKwhdX+l3ihKYPthumPMEB1IvdA=;
        b=WDWBZ4VIMh3Ow1a+yhceUSQeY6vEwLZw5Nn3JutScqAqRVRkWEYlR5Mig1nBYs5XUe
         haQprMxiqiWLa1R7jmCp/NuQNkkFttPOiZLYHfutYjO5WtH7Vd4YCvpUBu/EhTFrGOIR
         cs/yztxzs9ycy+0j7EJQUnZvLHubkaJPy4MO3ub0tIIY8ESyV7024gxXzXwvfutuHTyJ
         L6v02gDP4SoWQ0FVLbGxKZxcR+qHOk8QXYnIa8tEgkylWDwMS6kZWho0yFJKDrWHLKvh
         maO0lL5rLij6qN76vyTFzf3CkR37gJR5/8JgKeL7opDcBpMGnfl6RheIjlvq0JJYKaEd
         IkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785450151; x=1786054951;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KKK3RxskpKfni5OmmKwhdX+l3ihKYPthumPMEB1IvdA=;
        b=T97u3oJRkvaRnJnJGMednV1qoCKHF1EpTHi+QHmKvzCcyrHK6ybmeuB4aEBuDXzu+K
         CvYSq8KR6SifMDDTgpK5+rnGFehim3IxzOjqTPqh7NN7p32nMaqhTksiHKLgHDcIW4dp
         H0PpPzaFEm1tpThuvPqbYxFY/RYbE3gnVbEolWiJO+P/JxYFaOI6NyDHxXjDXv0M4oL6
         QaWfeioMop8RPXzMZ8DuO2uwaRwgm1YUlwV1BbmWNTFpEGBNaUMyKOUmLNFUMdIqV4tE
         xRofz8y83+9YrL8wrnIp5IwSa32lBHqdsYMoD2efimdyVMEubMBNpIVUc4xleQi55ZMM
         Cbew==
X-Forwarded-Encrypted: i=1; AHgh+Rr51py6sNCCS7GSWCyzPA1HtzSzVuxcQSb0TSVMgLaY79zpo9Z2KAyHBA4advK7pfhw6jNQySixHH6pvFeFpbU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+7RjjJH2Zr8zh21dtvbNKbxlmuqtTAED61BMmYPPfZCmfn2ZZ
	pgz1/wMbWATGcRHMWq+pdmUDsu6LXmoEkWo77Jznd+Gw0LX5GreC4rkVe6f/L2lStqskCRoNwqa
	HFkug8Pbq1ZM9FOx/w5rU27MbkvUb68qqjiIRAf3z
X-Gm-Gg: AR+sD11OH23z57CwlN8FksLMan0Y/MuBYSqiRkRfUDIyuduWsUIIuAirfjFdUhvCXAE
	Ass+JEaqkC0fZdJTNKxAWPcBvyfY3gsRsG8EmF/0rf/OH4XPBjU93Sd/nTIDvgKW19v9B3KqtaP
	0aM8bv9Wxesit2qDZ0QMtczZcZ0HjkHwXkNNIwk1H5P27MAG0TTJfR+xM/+HUYO7Pl6LZIdpMkG
	ogk9WyErUkfVSJl1Wt0WwkVE9pSOMjO0rpNOeKabis1Em2bygQPkRtYtv7h/exzZUj3mFIEO7N6
	6C/sZ2umdTa41Lp1pXC8w18INJuNh8LjOVvCf33fLkN/l5hPKFwzQCKXbaUBnQd7pMcFB9W/iBK
	/jUmv2Kit9+Gc0yGcp4r3OcXHtab4BP9tCLQ=
X-Received: by 2002:a05:6a21:6da8:b0:3bf:9e85:b423 with SMTP id
 adf61e73a8af0-3c90da9f0e9mr1921619637.34.1785450150418; Thu, 30 Jul 2026
 15:22:30 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 15:22:29 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 15:22:29 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260728-gmem-inplace-conversion-v9-10-35f9aec2aed2@google.com>
References: <20260728-gmem-inplace-conversion-v9-0-35f9aec2aed2@google.com> <20260728-gmem-inplace-conversion-v9-10-35f9aec2aed2@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 30 Jul 2026 15:22:29 -0700
X-Gm-Features: AUfX_mw9STeH1QmcRlHkiOeSUMR5OU477trBpGu6VFzJOghNh8UuiEXaLRojjC4
Message-ID: <CAEvNRgHEDMnz7Fc7iyegC9wrc1R_AMHiWUN_rx=3Ly67bg1dNQ@mail.gmail.com>
Subject: Re: [PATCH v9 10/41] KVM: guest_memfd: Add base support for KVM_SET_MEMORY_ATTRIBUTES2
To: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>, aik@amd.com, 
	andrew.jones@linux.dev, binbin.wu@linux.intel.com, brauner@kernel.org, 
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
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
writes:

> From: Ackerley Tng <ackerleytng@google.com>
>
> Add a new ioctl (and matching struct), KVM_SET_MEMORY_ATTRIBUTES2, using
> the same base ioctl number (0xd2), but with R/W semantics for the kernel
> instead of just read semantics.  "Officially" documenting that KVM writes
> to the payload will allow KVM to support partial/incremental conversions,
> instead of all-or-nothing updates (which requires complex unwinding), by
> recording the failing offset if an error occurs.
>
> Opportunistically add a new struct as well, even though KVM could squeeze
> the error offset into "struct kvm_memory_attributes", as there's no cost to
> doing so in practice.  Pad the struct with a pile of extra space to try and
> avoid ending up with "struct kvm_memory_attributes3" in the future.  Use
> the same layout for the fields that common to version 1 of the struct,
> e.g. to ease upgrading userspace, and to provide flexibility if KVM ever
> adds support for KVM_SET_MEMORY_ATTRIBUTES2 at VM scope.
>
> Introduce KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES to advertise the
> availability of the KVM_SET_MEMORY_ATTRIBUTES2 ioctl.
>
> Update the KVM API documentation to define the new ioctl and its behavior,
> and add the necessary UAPI definitions and capability checks.
>
> The process of setting memory attributes has a clear point of no return
> because, for CoCo VMs, zapping stage 2 page tables is a destructive
> operation. Unlike regular VMs, where re-faulting pages into the stage 2
> page tables merely incurs a performance penalty, CoCo guests must
> (re-):accept pages after every fault. To preserve CoCo security guarantees,
> guests will not accept pages they did not explicitly request faults
> for. Consequently, during memory conversions, any operation that could
> cause the process to abort must be completed before the stage 2 page tables
> are zapped.
>
> Zap only the ranges that are not already in the requested state to avoid
> inadvertently destroying (CoCo) data. ARM CCA guests will try to mark the
> entire DRAM as private at boot. If there are no shared pages at all, the
> to-private conversion can be skipped, but the existence of a single shared
> page would require the conversion process to proceed, and if it proceeds,
> zapping both shared and private pages would destroy data and break the
> guest.
>
> Co-developed-by: Vishal Annapurve <vannapurve@google.com>
> Signed-off-by: Vishal Annapurve <vannapurve@google.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Suggested-by: Michael Roth <michael.roth@amd.com>
> Tested-by: Shivank Garg <shivankg@amd.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>
> tmpo

tmpo is a stray addition from my rebasing/squashing.

> ---
>  Documentation/virt/kvm/api.rst |  63 +++++++++++++++++++++-
>  include/uapi/linux/kvm.h       |  15 ++++++
>  virt/kvm/guest_memfd.c         | 119 +++++++++++++++++++++++++++++++++++++++++
>  virt/kvm/kvm_main.c            |  23 +++++---
>  4 files changed, 212 insertions(+), 8 deletions(-)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
>
> [...snip...]
>
