Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74416488D92
	for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 22:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787695991; cv=none; b=hZQeV/ie1DJx1z6DOW1GjdXTEKFBEV/6tP8ShVSJxsOYxVTEXNo5iKdynKtPtdI3uEXCSJd6juTOCYyEN76ejWHIICbmuyflbm8UdBDPhtYb9dWwPhTgkAz9BUWDA4tYq81WX5P3QkKF1RqYBOTpc6vu33ALwD1S0pbJbsPfXhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787695991; c=relaxed/simple;
	bh=4gX13P6rOHlbRV77QvmADLNi7m+mjHLtTEm72VAoxOE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=im245lsxZmnDsYqrtCyGAIB38S51CkCIcQTQVSjze8+yttiichUJ5IviVvfIXI3U4TwgujyAUFrA/QbbE0WuoAZPASMfWxaWcVR8Z2utqIIQzlyWhDLJbDxIoHXe82EiaUVEAStKNBr4IBoBIpn2nAp8C9i2qS41EEWEw5h0xdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uZSN8+tq; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uZSN8+tq"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1b8088203so301123a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 15:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787695989; x=1788300789; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oWkBM8JaYN+rQedunFdRX30Ylx+h1V3OtzkLPDSIjo8=;
        b=uZSN8+tqlpbd64JDWk//n4pLdYT8zx4vXWBvzEk2QxMGtgkEWveOZXqpmyTG3Dyzzc
         IAAnkYuslBAFNtYHDP3P4+9HmSa6qSR7UPIjtyibQB6ObBs1BXKa1txLK6yLfk/M9jt8
         S5XSH8aALduGV7or1FE8bj6xeTRGJaPHCYhQkDMA5mGERnT3QTbSNMfxc6k3Zpl6753q
         dqa0AxEjSzPmmPpXkCLVp1wFYo+/DfCCfje7OB4OLHaDj1zrpk7EVfiViLziz3dVSArs
         uoK0bBnrd3ZLYobg6jarfnfpv2pI3pgh4x641H8QLNGLBuS+EZPihP8llaadfIetvXIx
         uQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787695989; x=1788300789;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oWkBM8JaYN+rQedunFdRX30Ylx+h1V3OtzkLPDSIjo8=;
        b=W7wm1yFfVLAH6hTNdCE4jeJlzOe+Gos5S/nI214au//3DWWegBkUgVwiWBFA8Hx4yU
         G+P0kZORVRNLLBqXyPxZ0fT4ZUMW2RKWS8I41N5Yj+DPWp/5PbD+YZ1E+e8S0hHkFFfQ
         aOq+4jqcgPC8fdKwpk/R5MFo53kKOX9aCH+Tp4O73aNsI+RMXE94mdiH1tZcFsF9Mvjg
         v4IIrL3EoPEYmRl43RUCJVtxgqd2KjYwSUazGxwwKqWq12YtO9EaJFfPI9BkJTHj3yNF
         u4PaFLw8OZ5lHwOxed1/o4gRr+no4i2ODoZCHyGeJ8u6Sk8ggfA4BtHDZ7i2ridZZa+4
         kZWQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr3e7tEv53jAZlNRnEUEJEJLEKFw5j2uLbaa8QDAXOvMZrQqalpgf0Aitr1qrfWoSDqKXmhYyQjuyWfXmHQB9Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kP6lNjs00vyfljxECr4lYcBJ1DQvughfr9bG4NNXywGhDDr9jn
	zluPHzy6eyauMiviF8ZrV2Cb9trvRr0QO3srBmK9ZFV+gcFDHuNDkRZQlkpqIrITufCGjgqrU1h
	AvQTAvw==
X-Received: from pfbic21.prod.google.com ([2002:a05:6a00:8a15:b0:845:e683:1287])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2386:b0:84c:4b58:2cec
 with SMTP id d2e1a72fcca58-85375ca7086mr2634506b3a.15.1787695988314; Tue, 25
 Aug 2026 15:13:08 -0700 (PDT)
Date: Tue, 25 Aug 2026 15:13:07 -0700
In-Reply-To: <20260823-shivank-gmem-fix-split-v1-1-512a29fb8e86@amd.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260823-shivank-gmem-fix-split-v1-0-512a29fb8e86@amd.com> <20260823-shivank-gmem-fix-split-v1-1-512a29fb8e86@amd.com>
Message-ID: <ao4Tc7L0JIi9Ff9M@google.com>
Subject: Re: [PATCH 1/5] KVM: guest_memfd: take the invalidate lock when
 unbinding a dying file
From: Sean Christopherson <seanjc@google.com>
To: Shivank Garg <shivankg@amd.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Jim Mattson <jmattson@google.com>, Peter Shier <pshier@google.com>, 
	Ricardo Koller <ricarkol@google.com>, David Hildenbrand <david@kernel.org>, 
	Ackerley Tng <ackerleytng@google.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Sun, Aug 23, 2026, Shivank Garg wrote:
> kvm_gmem_unbind() skips mapping->invalidate_lock when the guest_memfd
> file is already dying. All other paths that modify f->bindings hold
> that lock.
> 
> kvm_gmem_invalidate_{start,end}() checks f->bindings independently to
> decide whether to begin or end KVM MMU invalidations. So, the bindings
> must remain stable between the two calls. If a binding is removed in that
> window, start increments mmu_invalidate_in_progress but end does not
> decrement it. Example, unbind race with memory failure:
> 
>   CPU 0: memory failure               CPU 1: memslot delete
>   ----------------------------------  ---------------------------
>                                       (guest_memfd file is dying)
>   kvm_gmem_error_folio()
>     kvm_gmem_invalidate_start()
>       finds binding
>       mmu_invalidate_in_progress++
>                                       kvm_gmem_unbind()
>                                         get_file_active() fails
>                                         store NULL in bindings
>     kvm_gmem_invalidate_end()
>       no binding found
>       counter stays elevated
> 
> mmu_invalidate_retry() then returns 1 forever, so guest page faults
> retry without ever installing a mapping and the guest hangs.
> 
> Take the invalidate lock in the dying-file path too. This prevents unbind
> from removing a binding and leaking mmu_invalidate_in_progress. This is
> safe because any caller that reaches this path holds slots_lock, so
> kvm_gmem_release() cannot nullify the slot->gmem.file, until
> kvm_gmem_unbind() finishes.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/20260728092027.225CF1F000E9@smtp.kernel.org
> Fixes: ae431059e75d ("KVM: guest_memfd: Remove bindings on memslot deletion when gmem is dying")
> Signed-off-by: Shivank Garg <shivankg@amd.com>
> ---
>  virt/kvm/guest_memfd.c | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index f0e5da490866..f848120af84b 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -721,6 +721,8 @@ static void __kvm_gmem_unbind(struct kvm_memory_slot *slot, struct gmem_file *f)
>  
>  void kvm_gmem_unbind(struct kvm_memory_slot *slot)
>  {
> +	struct file *gmem_file;
> +
>  	/*
>  	 * Nothing to do if the underlying file was _already_ closed, as
>  	 * kvm_gmem_release() invalidates and nullifies all bindings.
> @@ -733,21 +735,24 @@ void kvm_gmem_unbind(struct kvm_memory_slot *slot)
>  	/*
>  	 * However, if the file is _being_ closed, then the bindings need to be
>  	 * removed as kvm_gmem_release() might not run until after the memslot
> -	 * is freed.  Note, modifying the bindings is safe even though the file
> -	 * is dying as kvm_gmem_release() nullifies slot->gmem.file under
> +	 * is freed.  Note, dereferencing the dying file is safe as
> +	 * kvm_gmem_release() nullifies slot->gmem.file under
>  	 * slots_lock, and only puts its reference to KVM after destroying all
>  	 * bindings.  I.e. reaching this point means kvm_gmem_release() hasn't
>  	 * yet destroyed the bindings or freed the gmem_file, and can't do so
>  	 * until the caller drops slots_lock.
>  	 */
> -	if (!file) {
> -		__kvm_gmem_unbind(slot, slot->gmem.file->private_data);
> -		return;
> -	}
> +	gmem_file = file ?: slot->gmem.file;
>  
> -	filemap_invalidate_lock(file->f_mapping);
> -	__kvm_gmem_unbind(slot, file->private_data);
> -	filemap_invalidate_unlock(file->f_mapping);
> +	/*
> +	 * Take the invalidate lock even for a dying file.  Otherwise,
> +	 * kvm_gmem_invalidate_start() can find the binding and increment
> +	 * mmu_invalidate_in_progress while kvm_gmem_invalidate_end() misses
> +	 * the removed binding and skips decrement.

Hmm, so as called out in commit ae431059e75d ("KVM: guest_memfd: Remove bindings
on memslot deletion when gmem is dying"), this assumes that file->f_mapping and
everything "underneath" remains valid for dying files, which makes me a bit
uncomfortable.

    Deliberately don't acquire filemap invalid lock when the file is dying as
    the lifecycle of f_mapping is outside the purview of KVM.  Dereferencing
    the mapping is *probably* fine, but there's no need to invalidate anything
    as memslot deletion is responsible for zapping SPTEs, and the only code
    that can access the dying file is kvm_gmem_release(), whose core code is
    mutually exclusive with unbinding.

Oh, but kvm_gmem_release() takes the same filemap_invalidate_unlock() and
holding slots_lock guarantees that this code would run before release() if it
sees a non-null slot->gmem.file, i.e. past me's concern is completely unfounded.

Rather than make this seem like something special, IMO we should treat this as
a more normal thing.  kvm->slots_lock is already load bearing, might as well
double down on that.  I.e. the exceptional part is doing all the work even though
the file is dying, but the flows themselves should be identical.

E.g.

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index b596486d184c..5cc043466c89 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -668,48 +668,40 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
 	return r;
 }
 
-static void __kvm_gmem_unbind(struct kvm_memory_slot *slot, struct gmem_file *f)
+void kvm_gmem_unbind(struct kvm_memory_slot *slot)
 {
+	struct file *file = slot->gmem.file;
 	unsigned long start = slot->gmem.pgoff;
 	unsigned long end = start + slot->npages;
+	struct gmem_file *f;
 
-	xa_store_range(&f->bindings, start, end - 1, NULL, GFP_KERNEL);
-
-	/*
-	 * synchronize_srcu(&kvm->srcu) ensured that kvm_gmem_get_pfn()
-	 * cannot see this memslot.
-	 */
-	WRITE_ONCE(slot->gmem.file, NULL);
-}
-
-void kvm_gmem_unbind(struct kvm_memory_slot *slot)
-{
 	/*
 	 * Nothing to do if the underlying file was _already_ closed, as
 	 * kvm_gmem_release() invalidates and nullifies all bindings.
 	 */
-	if (!slot->gmem.file)
+	if (!file)
 		return;
 
-	CLASS(gmem_get_file, file)(slot);
-
 	/*
 	 * However, if the file is _being_ closed, then the bindings need to be
 	 * removed as kvm_gmem_release() might not run until after the memslot
-	 * is freed.  Note, modifying the bindings is safe even though the file
-	 * is dying as kvm_gmem_release() nullifies slot->gmem.file under
-	 * slots_lock, and only puts its reference to KVM after destroying all
-	 * bindings.  I.e. reaching this point means kvm_gmem_release() hasn't
-	 * yet destroyed the bindings or freed the gmem_file, and can't do so
-	 * until the caller drops slots_lock.
+	 * is freed.  Modifying the bindings is safe even if the file is dying
+	 * as kvm_gmem_release() nullifies slot->gmem.file under slots_lock,
+	 * and only puts its reference to KVM after destroying all bindings.
+	 * I.e. reaching this point means kvm_gmem_release() hasn't destroyed
+	 * the bindings or freed the gmem_file and can't do so until the caller
+	 * drops slots_lock, so there's no need to verify the file is live.
 	 */
-	if (!file) {
-		__kvm_gmem_unbind(slot, slot->gmem.file->private_data);
-		return;
-	}
+	f = file->private_data;
 
 	filemap_invalidate_lock(file->f_mapping);
-	__kvm_gmem_unbind(slot, file->private_data);
+	xa_store_range(&f->bindings, start, end - 1, NULL, GFP_KERNEL);
+
+	/*
+	 * synchronize_srcu(&kvm->srcu) ensured that kvm_gmem_get_pfn()
+	 * cannot see this memslot.
+	 */
+	WRITE_ONCE(slot->gmem.file, NULL);
 	filemap_invalidate_unlock(file->f_mapping);
 }
