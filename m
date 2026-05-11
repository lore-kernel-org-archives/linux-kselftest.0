Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DC834E75C
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 23:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778540921; cv=none; b=Px2Nguo03Y7weK9rQAOtiStEt2LazBZzKdLjr4xcj4qG4n9nctCRu1CQCdiVd0zwTcFzm7tAQi5dRH6QKRY0TrZuKAZMz2dvLtSX6B4fODRv9W7Uw/ePFzJ1ptVXfLNgEM+Dld9oV9rwVuh5n2PlYHE3JGMgU6FcGQEu9wA6Ihw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778540921; c=relaxed/simple;
	bh=G1mQvkoxnhBMAelHXekybPuseqqwEwf6vkZtOwuclyY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pzCjrQuLeMW38in8rjVYLk6uSWk2e5NlaxvA1t5ctDQ+4eDlqiPp8p+jrBjA5bgYdiEuqVk7MAQg8BUB1Kcoh8rv8F6DL3jm/O6vkYG0qkI/1t50vwm/TKXLBkYX9mxOnJ23six3W6LL7utsJALKjbD1ju9USMXZeODOkM/NacE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t8j++DFk; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t8j++DFk"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c827bda2e60so1231671a12.3
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 16:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778540919; x=1779145719; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=d6F91VktWIrzJzxcoSjKYEjnbKw+CYYK81uTkWYDis4=;
        b=t8j++DFkGKLez3CNhettP5dOv+ASQMIilqtUDHor1UiRXmj6c8b3hvhnF8YRUSBXBl
         2oPZSh3dDj4W61XHg3f7jFckGwOmOFbAsYNblqVOHEk2fTbyduXkQyv4rNz1abGXM0zg
         3EgQFf3z9ia5XQA8daGMup0iXYHvSsn3Ge9cfltEIY8+V9Cjq1Nc82uPOCAXZKLuXkfk
         5VG3S3Ibh09c6d3v8H7Un7V59SqqaWFQ9IyMIjIUC3SF9tzv6FLs6g0b6u5azSy6IIZK
         duuWQxpbnKIpoOG0nkfkQ4i8VWR3316MEsyWHFEBWpxEVZqu6YIbh9QupYtGLRrPOWEv
         /PQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778540919; x=1779145719;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d6F91VktWIrzJzxcoSjKYEjnbKw+CYYK81uTkWYDis4=;
        b=fKeKa+xF7fRMQWsgMkgDfsPSa74jeIWQH7T/mFtIXrTK4GMyZiYvP6CDwUm4kPNWO7
         8lR8CS1WrIQ/Ni1qA9EVJFZGEZU6cm1vDairR+imRwiV8WXHSG9boiqfR/YAGhB5Uhip
         nZUjqZ6oXVNihPTddgbyOkSKSnBPYYTMBbdiu/dgHHn/7uMO7JnCxiltqmNzik3N0u7u
         pIKWsokWoObeZ4nwXhDLyLUYFiGf9psR26TdxoyM9ASFODDdQShUzHynTn8xPoOOMGRh
         9OQt5eTrqBZBUpTHRtZfeU+/TYAyXHqxZc5LEHXZew195iUqySD652C1mG6kiwLhyGS9
         /rVA==
X-Forwarded-Encrypted: i=1; AFNElJ98fePATqS7JGmPgjVbt9/RHCoDFJtsMw1Uc6R3w7BwxcjeSq3LhvGG/p6T6IV5ETC3PItiJAkY0sVeP+RARnc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwveYhTY5TdjVf52EbeBZDvfivnUlJk5vYvPGe/7qLaEslUtMz+
	1tBP5Pfb5vG5OGr3LYUxW2fEd309Dt7/6NnL3Rr93DfUzmflI/v6OojJbTWIBnP0VBVmE0bbhCY
	AY1r2KA==
X-Received: from pfgs5.prod.google.com ([2002:a05:6a00:1785:b0:835:4c30:5576])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:aa7:9312:0:b0:82f:4191:da10
 with SMTP id d2e1a72fcca58-83e39550346mr11144361b3a.6.1778540919246; Mon, 11
 May 2026 16:08:39 -0700 (PDT)
Date: Mon, 11 May 2026 16:08:38 -0700
In-Reply-To: <20260102142429.896101-2-griffoul@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260102142429.896101-1-griffoul@gmail.com> <20260102142429.896101-2-griffoul@gmail.com>
Message-ID: <agJhdkVOPcGVvfjP@google.com>
Subject: Re: [PATCH v4 01/10] KVM: nVMX: Implement cache for L1 MSR bitmap
From: Sean Christopherson <seanjc@google.com>
To: Fred Griffoul <griffoul@gmail.com>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, vkuznets@redhat.com, 
	shuah@kernel.org, dwmw@amazon.co.uk, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Fred Griffoul <fgriffo@amazon.co.uk>
Content-Type: text/plain; charset="us-ascii"

On Fri, Jan 02, 2026, Fred Griffoul wrote:
> From: Fred Griffoul <fgriffo@amazon.co.uk>
> 
> Introduce a gfn_to_pfn_cache to optimize L1 MSR bitmap access by
> replacing map/unmap operations. This optimization reduces overhead
> during L2 VM-entry where nested_vmx_prepare_msr_bitmap() merges L1's MSR
> intercepts with L0's requirements.
> 
> Current implementation using kvm_vcpu_map_readonly() and
> kvm_vcpu_unmap() creates significant performance impact, mostly with
> unmanaged guest memory.
> 
> The cache is initialized when entering VMX operation and deactivated
> when VMX operation ends.
> 
> Signed-off-by: Fred Griffoul <fgriffo@amazon.co.uk>
> ---
>  arch/x86/kvm/vmx/nested.c | 42 +++++++++++++++++++++++++++++++++++----
>  arch/x86/kvm/vmx/vmx.h    |  2 ++
>  2 files changed, 40 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
> index 6137e5307d0f..f05828aca7e5 100644
> --- a/arch/x86/kvm/vmx/nested.c
> +++ b/arch/x86/kvm/vmx/nested.c
> @@ -316,6 +316,34 @@ static void vmx_switch_vmcs(struct kvm_vcpu *vcpu, struct loaded_vmcs *vmcs)
>  	vcpu->arch.regs_dirty = 0;
>  }
>  
> +/*
> + * Maps a single guest page starting at @gpa and lock the cache for access.
> + */
> +static int nested_gpc_lock(struct gfn_to_pfn_cache *gpc, gpa_t gpa)

These helpers belong in virt/kvm/pfncache.c, not in vmx/nested.c.  The names also
need to be changed (which is super obvious when they land in pfncache.c).  Nested
locks are very much a thing in the kernel; even with the nVXM context, these read
as "lock a GPC within another GPC critical section".

And this does waaaay more than just "lock" the gpc.  E.g. by the end of the series
this picks up:

		err = kvm_gpc_activate(gpc, gpa, PAGE_SIZE);
		if (err) {
			/*
			 * Deactivate nested state caches to prevent
			 * kvm_gpc_invalid() from returning true in subsequent
			 * is_nested_state_invalid() calls. This prevents an
			 * infinite loop while entering guest mode.
			 */
			if (gpc->vcpu)
				kvm_gpc_deactivate(gpc);

			return err;
		}

That's a pretty gross hack, as is the addition and use of kvm_gpc_invalid() to
detect that a vmcs12 page has been invalidated (though that may just be a naming
issue).

The use of nested_gpc_lock() in nested_vmx_prepare_msr_bitmap() and
nested_vmx_handle_enlightened_vmptrld() also feels forced.  The usage there is
_much_ more aligned with nested_gpc_lock_if_active(), in the sense that it's a
temporary establishing a host mapping versus grabbing a pfn that gets shoved into
a non-MMU structure.

> +{
> +	int err;
> +
> +	if (!PAGE_ALIGNED(gpa))
> +		return -EINVAL;
> +retry:
> +	read_lock(&gpc->lock);
> +	if (!kvm_gpc_check(gpc, PAGE_SIZE) || (gpc->gpa != gpa)) {

This order of thsese checks is bizarre.  It's not problematic per se, but it's
jarring to read.


> +		read_unlock(&gpc->lock);
> +		err = kvm_gpc_activate(gpc, gpa, PAGE_SIZE);

And the use of kvm_gpc_activate() in the retry loop is also bizarre.  It's "fine",
but it makes the lifecycle of the code hard to follow.

The other thing that stands out in later patches is the error handling.  I really
dislike the number of unlock() calls that are being added.

The good news is, I think pretty much all of my complaints are symptoms of major
gaps in the core gpc APIs.  E.g. you're smushing largely unrelated things into
nested_gpc_lock() because the retry loop is fugly.  If we add better APIs, then
the nVMX code shouldn't need to combine different concepts in weird ways, just
to avoid copy+pasting an ugly loop.

Happily, the majority of that can be sorted out in advance of converting nVMX.
E.g. instead of the stealtime conversion looking like so:

	if (!read_trylock(&gpc->lock))
		return;

	if (!kvm_gpc_check(gpc, sizeof(*st)))
		goto out_unlock_gpc;

	st = (struct kvm_steal_time *)gpc->khva;
	WRITE_ONCE(st->preempted, preempted);
	vcpu->arch.st.preempted = KVM_VCPU_PREEMPTED;

	kvm_gpc_mark_dirty_in_slot(gpc);

  out_unlock_gpc:
	read_unlock(&gpc->lock);


it can instead be something like:

	CLASS(gpc_try_map_local, st_map)(gpc, sizeof(st->preempted));
	if (IS_ERR(st_map))
		return;

	st = *st_map;
	WRITE_ONCE(st->preempted, KVM_VCPU_PREEMPTED);
	vcpu->arch.st.preempted = KVM_VCPU_PREEMPTED;


I have patches that appear to work.  I'll post a new version of David's series[*]
with the new APIs, and we can go from there (dropping the IRQ interactions makes
adding the CLASS() stuff easier, and you'll have to rebase regardless).

[*] https://lore.kernel.org/all/20260508181717.3230988-1-dwmw2@infradead.org

> +		if (err)
> +			return err;
> +
> +		goto retry;
> +	}
> +
> +	return 0;
> +}
> +
> +static void nested_gpc_unlock(struct gfn_to_pfn_cache *gpc)

This is a completely superfluous helper.  Looking ahead, many of the wrappers are
similarly useless, and IMO do more harm than good.  E.g. having bounce through
multiple implementations for something like this:

	if (!pi_test_and_clear_on(pi_desc)) {
		nested_unlock_pi_desc(vmx);
		return 0;
	}

is *really* frustrating when it's nothing more than:

	if (!pi_test_and_clear_on(pi_desc)) {
		read_unlock(&vmx->nested.pi_desc_cache->lock);
		return 0;
	}

All of that should be a moot point with better APIs, so this really "in the
future..." type of feedback.
