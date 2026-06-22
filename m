Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABD8372685
	for <linux-kselftest@vger.kernel.org>; Mon, 22 Jun 2026 23:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782172797; cv=pass; b=gBON67gLHGinoSaCidcxZdwCeIppJnfjY8nMKiTRsFOKEpUY+4OA2wB2jbu5yjvDE7X016JbNSz6+NkyTe3Ng38VMiiCBWq89mIaG7Li6+gWlZx1iauGgFgPW5yg5aUzupEjH4QJ/utKSXEAF/4dJMWvSTox4oO11d8VGYjtyws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782172797; c=relaxed/simple;
	bh=0MG0edPxtYzBs/kIxVhCRo1M3OKACtf5qAqQlOliLq4=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CBJM5Z2wWsjAF+JUI+2QIiAfXQmdFBAxSbnHjntx2G1k4U2uTgNz3xrYawzmGgvZfwq7O07ueNB010zw8D+LqBgYMbeyThlyPfcPOA0Z1U+n3OEJvsxVch0GGbSYZR9v/e4Jv3b4Tr0uU23kZTnj2YIalBwe2qR12GYlWIoE+p4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mPc4hWBi; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mPc4hWBi"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1390f75d8bbso4626777c88.0
        for <linux-kselftest@vger.kernel.org>; Mon, 22 Jun 2026 16:59:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782172795; cv=none;
        d=google.com; s=arc-20240605;
        b=lGkWKNHyWAJJlYPCMFEDgSCujZU+CYhTcab4rQCGzkO5GVfNEAzOiOufDPcsm7yuC0
         UGw6oJvkz8jlTAU9lf5Ij4q3k0wxkLmufNbvEr+nP68iZKVAUWxstCR9mPsi+/cHug1a
         0LSznRx1oaygS5xukiSglY3Ojm+xyFgXWaaXChWP93CCgT1h1LnqKoukedXw/yZHvjI+
         Ju49QFul4lblLceSVWra0i7Scmwn6lvu+IwW7d+1JpRxpYQZT/y2OAlXwMPHmK9VD5hh
         ylPDQtZ2JPbiumk2dHfQ2jo6QYPLMt66RmxbuRbp3Bi/xde0f+5SP7h/zhlBqqiRXpxj
         CIyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=izUkSbDfmlQNOHn67gDt4QYFdqixnFjivdkPID2enxk=;
        fh=Sq8drxi6ePseYBTmYCiDCc31SlG1i1N+NppbTalTgHQ=;
        b=S9CB3onVac1/vF0cRv7e1y3Q7SfyTP+/Y9oaUCf/RZZdWcT+L2ufr1o69HVK7hJywT
         cA8OJaEZ7kXyRDjXXfZXiNtIvTHCrSllx0q4TEBlmvIDVQ7hU59u75IOn+gYLrSj2A4b
         U8nYwBmPfUp3iH9G29URHtlhqL6JK0qzkoT08BYKALwvrNj29Njnvp6vbMvYF3fC5hDC
         9lZbOyxoOz+kDVaMQrtvEAhJvXAB033xDuYZFyrS858R09LlYijTUNIK1cL8D0TwOJgi
         LjyJk4YtwPDIIDaixQPWDfC8GiingxjCB018TVZuvCWTK2Y7Hky34PEZuGBND1xMWpnZ
         E/4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782172794; x=1782777594; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=izUkSbDfmlQNOHn67gDt4QYFdqixnFjivdkPID2enxk=;
        b=mPc4hWBiOlDb1BkgHKfUV7xNE0MiVJbDwwaVrdP1iClyMi3Ir3U2qBYSPz0gn3O8TY
         m+YYT1bYbPjfyJfbakVD1S8BhFioE/FySlDpMk28JYDL4jjH8gyysCNLiNan9jsOBWoe
         VoRZgfr9JzNtmXxUjgSAt8h+c2I/AJMiDTMKGBIQ1tJzDXbWO97jDe9pcKnGh++jGImN
         6aaKFmIavx5S47Hy6xnElibeLJOIoXbUN166x60MxHQeEVI4T6X4Q6vmPqtofB1zEoFs
         r/HAzcT0APBzCm7QtuerSICpb/gVT2qLWgcPk/HndwdGUCF1h8rPMjOf+LsdkHhiXgF6
         CZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782172794; x=1782777594;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=izUkSbDfmlQNOHn67gDt4QYFdqixnFjivdkPID2enxk=;
        b=SVeoiqgIuTPRXUq5YhnvAkmGwahvdpaY1o+zipHPg2jU+uUd33Zgg/OOQ/1BQNJJvV
         uX8u4mmvTkO8QnO6DIYQ4RoAa+D9ZL6C0w2eGzjmXWwBx6ukmOUP1fVLyNcFCxHjX3ea
         WIt206CMqKaO6nmlKTzGVOJu2U5cd4eoFt5HivHq+i2MTVD2nRCluPdgiIjL0KiXg/Ka
         fHS2jipeBy18qa08ZxPyElQbYjMUOhUwe7CHrFz22sX0hPq8evdnKNrVoNGKHB2gzUJ1
         He86zBMN9pJHMo1hLT6Cp0pqbaTgWJjbnEI+G8/n6K83yBIFH6ncVVSz9tYmZwynbpNg
         JU7A==
X-Gm-Message-State: AOJu0YweF4gQ6VUdk8efkwUab2lDroe06Hb9YBwRXnxmJAYyZwEoz0f1
	3/2fwu/PO1oLkHCVSSonjJohVQg6WnSUOZirNNTR4cufKjpT6l7a7DfaYmi1CVxyRmswj6Ufhn1
	ck3+otd8QGHZCAfi5fQy9v5is/C2FO1dna2uvYh9I
X-Gm-Gg: AfdE7ck0yZP1o5Gpr77S6STzeQVUsVLQinTlmSGUFtXAD3iTODYdhnH6G9k1dRFTqag
	oaIDrYWxcukFQxSK5bG02yEEu1NzwsYa5ya6cO2xKOLIFtoWESSKYgTUazlBOsH1fOMBBIM1Yao
	pVE2Pwr4x0gaZSc3/J5xsCY/oqXomTd608JdBneoe1HL/p/tsiYpV/8p4/IFovKoeU5a6xR9ksf
	Rwfxy8H3YsfSgfaBM3OggPrnyaiwR/FVkljbRnLnxVYWP2lhwfhEWHOgGODIe0tPoeIlW//sv9/
	EV66IuQNux5gVwYoFhwmFVhfycx8FEWhjEEwuOOwh4YS6Pbo0kt4rxefeNY=
X-Received: by 2002:a05:7022:239f:b0:12d:de3e:52c1 with SMTP id
 a92af1059eb24-139c5e2d27fmr426595c88.37.1782172793679; Mon, 22 Jun 2026
 16:59:53 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Jun 2026 16:59:52 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Jun 2026 16:59:52 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20ae20f9d1a198b289444ebb4c824314cbba1bcf.1780676742.git.tarunsahu@google.com>
References: <cover.1780676742.git.tarunsahu@google.com> <20ae20f9d1a198b289444ebb4c824314cbba1bcf.1780676742.git.tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 22 Jun 2026 16:59:52 -0700
X-Gm-Features: AVVi8CfrDtA5h9OoS52m-5SKtGCl3rj7KRQFOYRYPcz5rppoei0C-yt2tsDCGII
Message-ID: <CAEvNRgGharGxs9s_ow0Z4iiQ9PCzdghch-4Fk6UMjiPP9tX-5g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 03/10] kvm: Prepare core VM structs and helpers for
 LUO support
To: Tarun Sahu <tarunsahu@google.com>, Jonathan Corbet <corbet@lwn.net>, vannapurve@google.com, 
	fvdl@google.com, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, sagis@google.com, aneesh.kumar@kernel.org, 
	skhawaja@google.com, vipinsh@google.com, Pratyush Yadav <pratyush@kernel.org>, 
	david@redhat.com, dmatlack@google.com, mark.rutland@arm.com, 
	Paolo Bonzini <pbonzini@redhat.com>, Mike Rapoport <rppt@kernel.org>, Alexander Graf <graf@amazon.com>, 
	seanjc@google.com, axelrasmussen@google.com
Cc: linux-kselftest@vger.kernel.org, kexec@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Tarun Sahu <tarunsahu@google.com> writes:

> Introduce core infrastructure to support VM preservation with LUO.
>
> First two changes are just refactoring, no functional change, third
> change introduces a new member in struct kvm.
> - Move ITOA_MAX_LEN to kvm_mm.h for reuse by upcoming kvm_luo code.
> - Add a public kvm_create_vm_file() helper wrapping kvm_create_vm()
>   and anon_inode_getfile() to provide a unified VM file creation API.
> - Track a weak reference to the backing file in struct kvm under
>   CONFIG_LIVEUPDATE_GUEST_MEMFD to enable reverse file resolution
>   without circular lifetime dependencies.
>

Given the above, I think this should be separate patches.

> Signed-off-by: Tarun Sahu <tarunsahu@google.com>
> ---
>  include/linux/kvm_host.h | 14 +++++++
>  virt/kvm/kvm_main.c      | 79 +++++++++++++++++++++++++++++-----------
>  virt/kvm/kvm_mm.h        |  3 ++
>  3 files changed, 75 insertions(+), 21 deletions(-)
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 4c14aee1fb06..9111a28637af 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -874,6 +874,18 @@ struct kvm {
>  #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
>  	/* Protected by slots_lock (for writes) and RCU (for reads) */
>  	struct xarray mem_attr_array;
> +#endif
> +#ifdef CONFIG_LIVEUPDATE_GUEST_MEMFD
> +	/*
> +	 * Weak reference to the VFS file backing this KVM instance. Stored
> +	 * without incrementing the file refcount to prevent a circular lifetime
> +	 * dependency (since file->private_data already pins this struct kvm).
> +	 * Used exclusively to resolve the file pointer back from struct kvm.
> +	 *
> +	 * Written/cleared via rcu_assign_pointer() and read locklessly under
> +	 * RCU (e.g. via get_file_active() to prevent ABA races).
> +	 */
> +	struct file *vm_file;
>  #endif

We didn't really talk about this during the calls, but it seems weird to
preserve a vm_file with pretty much nothing other than the vm type. The
entire VM is re-created, which means it could potentially be a
completely different VM?

In some sense it's more flexible since the guest_memfd can be restored
with some completely different VM, but it seems like it could introduce
other issues.

I think other KVM folks would probably have more thoughts here.

>  	char stats_id[KVM_STATS_NAME_SIZE];
>  };
> @@ -1074,7 +1086,9 @@ void kvm_get_kvm(struct kvm *kvm);
>  bool kvm_get_kvm_safe(struct kvm *kvm);
>  void kvm_put_kvm(struct kvm *kvm);
>  bool file_is_kvm(struct file *file);
> +struct file *kvm_create_vm_file(unsigned long type, const char *fdname);
>  void kvm_put_kvm_no_destroy(struct kvm *kvm);
> +void kvm_uevent_notify_vm_create(struct kvm *kvm);
>
>  static inline struct kvm_memslots *__kvm_memslots(struct kvm *kvm, int as_id)
>  {
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 89489996fbc1..65f0c5fb353e 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -67,9 +67,6 @@
>  #include <linux/kvm_dirty_ring.h>
>
>
> -/* Worst case buffer size needed for holding an integer. */
> -#define ITOA_MAX_LEN 12
> -
>  MODULE_AUTHOR("Qumranet");
>  MODULE_DESCRIPTION("Kernel-based Virtual Machine (KVM) Hypervisor");
>  MODULE_LICENSE("GPL");
> @@ -1349,6 +1346,19 @@ static int kvm_vm_release(struct inode *inode, struct file *filp)
>  {
>  	struct kvm *kvm = filp->private_data;
>
> +#ifdef CONFIG_LIVEUPDATE_GUEST_MEMFD
> +	/*
> +	 * Clear the weak reference of the vm file.
> +	 * In case vm file is closed by userspace, but kvm still has
> +	 * other users like vCPUs, clearing this pointer ensures
> +	 * that we don't have a dangling pointer to a closed file.
> +	 *
> +	 * Cleared via rcu_assign_pointer() to ensure proper memory visibility
> +	 * for concurrent lockless readers under RCU.
> +	 */
> +	rcu_assign_pointer(kvm->vm_file, NULL);
> +#endif
> +
>  	kvm_irqfd_release(kvm);
>
>  	kvm_put_kvm(kvm);
> @@ -5476,11 +5486,47 @@ bool file_is_kvm(struct file *file)
>  }
>  EXPORT_SYMBOL_FOR_KVM_INTERNAL(file_is_kvm);
>
> +struct file *kvm_create_vm_file(unsigned long type, const char *fdname)
> +{
> +	struct kvm *kvm = kvm_create_vm(type, fdname);
> +	struct file *file;
> +
> +	if (IS_ERR(kvm))
> +		return ERR_CAST(kvm);
> +
> +	file = anon_inode_getfile("kvm-vm", &kvm_vm_fops, kvm, O_RDWR);
> +	if (IS_ERR(file)) {
> +		kvm_put_kvm(kvm);
> +		return file;
> +	}
> +
> +#ifdef CONFIG_LIVEUPDATE_GUEST_MEMFD
> +	/*
> +	 * Weak reference to the file (without get_file()) to prevent a circular
> +	 * dependency. Safe because the file's release path clears this pointer
> +	 * and drops its reference to the VM.
> +	 *
> +	 * Written via rcu_assign_pointer() because the pointer can be read
> +	 * locklessly under RCU (e.g., in kvm_gmem_luo_preserve() via
> +	 * get_file_active() to prevent lockless ABA races).
> +	 */
> +	rcu_assign_pointer(kvm->vm_file, file);
> +#endif
> +
> +	/*
> +	 * Don't call kvm_put_kvm anymore at this point; file->f_op is
> +	 * already set, with ->release() being kvm_vm_release().  In error
> +	 * cases it will be called by the final fput(file) and will take
> +	 * care of doing kvm_put_kvm(kvm).
> +	 */
> +
> +	return file;
> +}
> +
>  static int kvm_dev_ioctl_create_vm(unsigned long type)
>  {
>  	char fdname[ITOA_MAX_LEN + 1];
>  	int r, fd;
> -	struct kvm *kvm;
>  	struct file *file;
>
>  	fd = get_unused_fd_flags(O_CLOEXEC);
> @@ -5489,31 +5535,17 @@ static int kvm_dev_ioctl_create_vm(unsigned long type)
>
>  	snprintf(fdname, sizeof(fdname), "%d", fd);
>
> -	kvm = kvm_create_vm(type, fdname);
> -	if (IS_ERR(kvm)) {
> -		r = PTR_ERR(kvm);
> -		goto put_fd;
> -	}
> -
> -	file = anon_inode_getfile("kvm-vm", &kvm_vm_fops, kvm, O_RDWR);
> +	file = kvm_create_vm_file(type, fdname);
>  	if (IS_ERR(file)) {
>  		r = PTR_ERR(file);
> -		goto put_kvm;
> +		goto put_fd;
>  	}
>
> -	/*
> -	 * Don't call kvm_put_kvm anymore at this point; file->f_op is
> -	 * already set, with ->release() being kvm_vm_release().  In error
> -	 * cases it will be called by the final fput(file) and will take
> -	 * care of doing kvm_put_kvm(kvm).
> -	 */
> -	kvm_uevent_notify_change(KVM_EVENT_CREATE_VM, kvm);
> +	kvm_uevent_notify_change(KVM_EVENT_CREATE_VM, file->private_data);

Notifying with file->private_data threw me off... I would rather inline
the rcu_assign_pointer() in this function and have this line read
notify(..., kvm) like before.

>
>  	fd_install(fd, file);
>  	return fd;
>
> -put_kvm:
> -	kvm_put_kvm(kvm);
>  put_fd:
>  	put_unused_fd(fd);
>  	return r;
> @@ -6341,6 +6373,11 @@ static void kvm_uevent_notify_change(unsigned int type, struct kvm *kvm)
>  	kfree(env);
>  }
>
> +void kvm_uevent_notify_vm_create(struct kvm *kvm)
> +{
> +	kvm_uevent_notify_change(KVM_EVENT_CREATE_VM, kvm);
> +}
> +
>  static void kvm_init_debug(void)
>  {
>  	const struct file_operations *fops;
> diff --git a/virt/kvm/kvm_mm.h b/virt/kvm/kvm_mm.h
> index 9fcc5d5b7f8d..7aa1d65c3d46 100644
> --- a/virt/kvm/kvm_mm.h
> +++ b/virt/kvm/kvm_mm.h
> @@ -3,6 +3,9 @@
>  #ifndef __KVM_MM_H__
>  #define __KVM_MM_H__ 1
>
> +/* Worst case buffer size needed for holding an integer as a string. */
> +#define ITOA_MAX_LEN 12
> +
>  /*
>   * Architectures can choose whether to use an rwlock or spinlock
>   * for the mmu_lock.  These macros, for use in common code
> --
> 2.54.0.1032.g2f8565e1d1-goog
