Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FF64503FF
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 18:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785435182; cv=pass; b=fgX2zEhCcVGIdpLul4qpxkQBNCaW5wqU5Wcv2TCBV3oLDrdALo46mfGeMRwBlAqS2YdlkFxhYyDCcI3iDLVz9uxqWCBqlUjWknsas8cNI+pw2FICHVYzRRhx7QWELSXSXpM8oaQLcZHgCCG0f6+sGiP2iAKZxa+gVfR2c9+AcFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785435182; c=relaxed/simple;
	bh=vP4SBAjY5cYxaFndxMG2sjpjVkz2m/5BGIn+iBJhang=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gIpo2Ax2EcbQWRAL8Vxjm4GA9b0IV3Iixmg9QedSoCaMEjbzkPo8pTtz+pUOH1dGe0HLnEOGEdI7aaNbHgRmtpi2SBx+1J0lv/tyOySvkLyCTwGGbf7RKT5+j7A3e1iEE8GXuaS3NcG6m/RLVkRhqoUImFaIEs/46hpShzuFvfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e/TJTNzJ; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e/TJTNzJ"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso196424a91.3
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 11:12:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785435176; cv=none;
        d=google.com; s=arc-20260327;
        b=boPCR8qILoRLUoQDLOqtFvGOcjwfhjftyV0e7kwrzjlFqt6cUlNAx85t6UGOY9cue4
         okZBb3m/O39rRJ4aSS1WjcLpSNDdIHWPR/qO0EROK/v2A8ODC+f4sZfuGfEJWdxT8lXF
         oK+stFO4ms6ubrrqFHNZpKW4o1NIQVevZn9Sdv9FMH9OnrV4LF/LyGPcS1Zj36tT72uY
         CDZqKS2XUsg6FQFHk4mx4hJSozo06XH4tKpT6Yew8JE1d2bp99lZylgQuMME7wExiFzm
         waB5vDZ7KaOVNF5VEmQfasZ6ViPz4+30YBu7VRkIYQUUyguBvzWT58hN81PF5Vek9V/m
         gpKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=YghvBOxKZj6r8MAI+WUSEYlYQEu1XclpHCz2MD6Rx8I=;
        fh=k2M5+le0vr3qB4AfMXUEMpfaL7Ua8Ow45VRBol8cKiE=;
        b=UGpxzNm9Va4h/OfGOzdwIF0iNgoeggZcxd+l6yGvgYuqd3el/5TvI6dIkvUtYpUpvQ
         Tr4IdNJLxTCXRcfilQTutBMLiVjR77XszkX+e/5lPIRrQp6DAg1MCiuSPo20PJ3/5ST9
         sMrOKkKmBGT9xS1MPpC28ZFESYbPfyCJ4/Ub5kpDGop/dqpNvKZwzUptDDCgbebsjoOf
         2V9Luz+DcCQb7fxXbAFOoYtCY5Sa+T4bg0Uo/f98L5zipoIMuTnAO1hDAhau3ES9hXrO
         F2Nl1d6hGoquFOxthenJ2hb7RKPRGz5ORyJl/vz69anw0ukHgKBW5nceQm3/OHCdZKD1
         VMlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785435176; x=1786039976; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YghvBOxKZj6r8MAI+WUSEYlYQEu1XclpHCz2MD6Rx8I=;
        b=e/TJTNzJ0zlJVWarGwUr0khRWwRm7ROnzAr9WnxSYAKypmHcbAXRLrcJa2cNeEHpuJ
         Pi0Nyl/L88CxIdojNYITM65XdE/xcUr8mWKuGp6OH0JHWHAoPovJcP8P3Bi2o43HLBlg
         DOW5jcLcuGm2gCZWmiRLRTQuX1a14Ahum0Gm5v+sgNe1dk2zf8ei/eRA1BzhTdjEIw9F
         K50ki8+isWotkmS3vyJ2WDV4a7OGFJRiLgNca78/62lNJKGKP8L+OU+H3+66eSG+IoUH
         zr4ROhy8A9FH25kiC1XHNrMoPQEvDu/6MGwOBu08v1TsOFvsQ56o3J2jw9tU4J5BAcXk
         D4mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785435176; x=1786039976;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YghvBOxKZj6r8MAI+WUSEYlYQEu1XclpHCz2MD6Rx8I=;
        b=EOBCJhkjvsseeoz2Kprjt9WG037Ig3Hwzpvb8NDmvZVJ7uAD0D4F3uKlK4WMg+jejS
         5NCrfRSYoDcDxbrAWzGy2RmATX7JQZkgS6/AcsrMHTsq4FKHXtehFiYLGk8+k7fWa5sA
         aT8dKv7EDrEiMgx6rp3LcQZTyqVF1C8briAZkyJAPNqBLKa9ajZ04ab/tHptnUVtp91f
         PeQrhFyccLufnf2ff3/lBLrwYMjlWdLBFt7mqTib+CA14sjck45GJlVp/cocqVsPTxhc
         3RfkSSZZAsQXEhpzd5E0uFBCuVlYJfWlWgeG9iU+nRhk3aSJR1N/vVbafX2QbDmm4yGl
         3MPA==
X-Gm-Message-State: AOJu0Yz4AskE/qdTC5HwakPBo/ubQaW5EQwGe+Ah7iV9SEjy+Dr6zlZd
	f0mv469iyPOH6pWIFj3GUh4kx4XY/V8nxHDUr6/L8NKjaM+Q8g6AtqzDOvMRKPGU1zEfNCIOC5w
	Te5sztsN4S04jt0wAEcQPK325r+r4Eu029uqdBCtY
X-Gm-Gg: AR+sD11nJbeAd+Ve+3r5LsDFfthRO6dGKqN/NQa4JUNRdrzDUMtUvAGS8ddsY6fNXyV
	QZGJDi0mmew/sDyF2s+T7cH+zPR0fxV/boBGjRA7wbmre4QAqpuCIJtkxNe0Flcy6UgyW68AKjf
	z7MhXz011kCrL9k4+HK0Pm4x0WBRNgnWZ9RX56lW+RQjWaZekfcSgiw6VgcUbmIYFmyrSnynaRb
	UYPNSVxqYqXYaUTy6P1GCIzvz3um/RBW73daNeMyFhZHfZf8V9y/PzNsqKlWcyeterqmkd0Dupu
	g21cyL3tRTf67hgrKhntl8dJo2WIJ8cp2gMyF3l2ONb9bGbl6xRv2X79295mSRWq+1Ue7vcVLTa
	F4esYUUpG+CVPAqXwzKLF3YSxxKXcWovflA==
X-Received: by 2002:a17:90b:582c:b0:380:fead:448d with SMTP id
 98e67ed59e1d1-38f9bdaf33amr3348945a91.13.1785435175540; Thu, 30 Jul 2026
 11:12:55 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 11:12:54 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 11:12:54 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260728121138.1103610-7-tarunsahu@google.com>
References: <20260728121138.1103610-1-tarunsahu@google.com> <20260728121138.1103610-7-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 30 Jul 2026 11:12:54 -0700
X-Gm-Features: AUfX_myTOZtTYgrc2JARzoakReAlBZfwUvudyD8fyzAtRRNHq5OayI8CE2nMNDE
Message-ID: <CAEvNRgEVxQS2r0_iPHciV=NEKFzwnrfitp-QdP1keAg5Ud7-TQ@mail.gmail.com>
Subject: Re: [PATCH v4 06/11] KVM: guest_memfd: Move internal definitions to
 internal header
To: Tarun Sahu <tarunsahu@google.com>, fuad.tabba@linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, seanjc@google.com, dmatlack@google.com, 
	Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, david@redhat.com, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, sagis@google.com, 
	Paolo Bonzini <pbonzini@redhat.com>, Mike Rapoport <rppt@kernel.org>, Alexander Graf <graf@amazon.com>
Cc: linux-kselftest@vger.kernel.org, andre.przywara@arm.com, 
	michael.roth@amd.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	will@kernel.org, vannapurve@google.com, maz@kernel.org, fvdl@google.com, 
	kvm@vger.kernel.org, oliver.upton@linux.dev, kvmarm@lists.linux.dev, 
	alexandru.elisei@arm.com, skhawaja@google.com, aneesh.kumar@kernel.org, 
	linux-doc@vger.kernel.org, David Hildenbrand <david@kernel.org>, yan.y.zhao@intel.com, 
	kexec@lists.infradead.org, suzuki.poulose@arm.com
Content-Type: text/plain; charset="UTF-8"

Tarun Sahu <tarunsahu@google.com> writes:

> Extract 'struct gmem_file', 'struct gmem_inode', and GMEM_I() from
> virt/kvm/guest_memfd.c into a new internal header virt/kvm/guest_memfd.h.
> Also split __kvm_gmem_create() to expose a non-static
> __kvm_gmem_create_file() helper that returns a 'struct file *' instead of
> an fd.
>

This is done basically to support a new virt/kvm/guest_memfd_luo.c
file.

Would like to know what Sean thinks of this! I'd like to know for future
guest_memfd work too.

> These internal definitions and helpers allow upcoming guest_memfd Live
> Update Orchestrator (LUO) preservation code to access guest_memfd
> internals and reconstruct guest_memfd file instances from preserved state
> without installing them into a file descriptor table up front.
>
> Signed-off-by: Tarun Sahu <tarunsahu@google.com>
> ---
>  virt/kvm/guest_memfd.c | 68 +++++++++++++++++-------------------------
>  virt/kvm/guest_memfd.h | 39 ++++++++++++++++++++++++
>  2 files changed, 67 insertions(+), 40 deletions(-)
>  create mode 100644 virt/kvm/guest_memfd.h
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index db57c5766ab6..dd84bba8974b 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -7,38 +7,12 @@
>  #include <linux/mempolicy.h>
>  #include <linux/pseudo_fs.h>
>  #include <linux/pagemap.h>
> +#include "guest_memfd.h"
>
>  #include "kvm_mm.h"
>
>  static struct vfsmount *kvm_gmem_mnt;
>
> -/*
> - * A guest_memfd instance can be associated multiple VMs, each with its own
> - * "view" of the underlying physical memory.
> - *
> - * The gmem's inode is effectively the raw underlying physical storage, and is
> - * used to track properties of the physical memory, while each gmem file is
> - * effectively a single VM's view of that storage, and is used to track assets
> - * specific to its associated VM, e.g. memslots=>gmem bindings.
> - */
> -struct gmem_file {
> -	struct kvm *kvm;
> -	struct xarray bindings;
> -	struct list_head entry;
> -};
> -
> -struct gmem_inode {
> -	struct shared_policy policy;
> -	struct inode vfs_inode;
> -	struct list_head gmem_file_list;
> -
> -	u64 flags;
> -};
> -
> -static __always_inline struct gmem_inode *GMEM_I(struct inode *inode)
> -{
> -	return container_of(inode, struct gmem_inode, vfs_inode);
> -}
>
>  #define kvm_gmem_for_each_file(f, inode) \
>  	list_for_each_entry(f, &GMEM_I(inode)->gmem_file_list, entry)
> @@ -557,23 +531,17 @@ bool __weak kvm_arch_supports_gmem_init_shared(struct kvm *kvm)
>  	return true;
>  }
>
> -static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
> +struct file *__kvm_gmem_create_file(struct kvm *kvm, loff_t size, u64 flags)
>  {
>  	static const char *name = "[kvm-gmem]";
>  	struct gmem_file *f;
>  	struct inode *inode;
>  	struct file *file;
> -	int fd, err;
> -
> -	fd = get_unused_fd_flags(0);
> -	if (fd < 0)
> -		return fd;
> +	int err;
>
>  	f = kzalloc_obj(*f);
> -	if (!f) {
> -		err = -ENOMEM;
> -		goto err_fd;
> -	}
> +	if (!f)
> +		return ERR_PTR(-ENOMEM);
>
>  	/* __fput() will take care of fops_put(). */
>  	if (!fops_get(&kvm_gmem_fops)) {
> @@ -612,8 +580,7 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
>  	xa_init(&f->bindings);
>  	list_add(&f->entry, &GMEM_I(inode)->gmem_file_list);
>
> -	fd_install(fd, file);
> -	return fd;
> +	return file;
>
>  err_inode:
>  	iput(inode);
> @@ -621,7 +588,28 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
>  	fops_put(&kvm_gmem_fops);
>  err_gmem:
>  	kfree(f);
> -err_fd:
> +	return ERR_PTR(err);
> +}
> +
> +static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
> +{
> +	struct file *file;
> +	int fd, err;
> +
> +	fd = get_unused_fd_flags(0);
> +	if (fd < 0)
> +		return fd;
> +
> +	file = __kvm_gmem_create_file(kvm, size, flags);
> +	if (IS_ERR(file)) {
> +		err = PTR_ERR(file);
> +		goto err_put_fd;
> +	}
> +
> +	fd_install(fd, file);
> +	return fd;
> +
> +err_put_fd:
>  	put_unused_fd(fd);
>  	return err;
>  }
> diff --git a/virt/kvm/guest_memfd.h b/virt/kvm/guest_memfd.h
> new file mode 100644
> index 000000000000..c528b046dd69
> --- /dev/null
> +++ b/virt/kvm/guest_memfd.h
> @@ -0,0 +1,39 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __KVM_GUEST_MEMFD_H__
> +#define __KVM_GUEST_MEMFD_H__ 1
> +
> +#include <linux/kvm_host.h>
> +#include <linux/fs.h>
> +#include <linux/mempolicy.h>
> +
> +/*
> + * A guest_memfd instance can be associated multiple VMs, each with its own
> + * "view" of the underlying physical memory.
> + *
> + * The gmem's inode is effectively the raw underlying physical storage, and is
> + * used to track properties of the physical memory, while each gmem file is
> + * effectively a single VM's view of that storage, and is used to track assets
> + * specific to its associated VM, e.g. memslots=>gmem bindings.
> + */
> +struct gmem_file {
> +	struct kvm *kvm;
> +	struct xarray bindings;
> +	struct list_head entry;
> +};
> +
> +struct gmem_inode {
> +	struct shared_policy policy;
> +	struct inode vfs_inode;
> +	struct list_head gmem_file_list;
> +
> +	u64 flags;
> +};
> +
> +static inline struct gmem_inode *GMEM_I(struct inode *inode)
> +{
> +	return container_of(inode, struct gmem_inode, vfs_inode);
> +}
> +
> +struct file *__kvm_gmem_create_file(struct kvm *kvm, loff_t size, u64 flags);
> +
> +#endif /* __KVM_GUEST_MEMFD_H__ */
> --
> 2.55.0.229.g6434b31f56-goog
