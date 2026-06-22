Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D00836A377
	for <linux-kselftest@vger.kernel.org>; Mon, 22 Jun 2026 23:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782172462; cv=pass; b=vCci9D1rpyGjtBYFF/lDV2K5L65cLYBq1pawr8ryAJdvfqinAWfFOViOzH4A5fgHLWlxcmYIPSsoFDb2vE5EezHRz98V0g5gv9kgJkm2Bl8YKB+ncK0z/Ui/r0172uhldPveC6H3Rsnw2tOJBvkq/6vVLnniyz6QmOsCYeQLFIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782172462; c=relaxed/simple;
	bh=I1YUlMWYpoFKoByVcCt8Rqs1cgeontbmcE6KLy6U/tc=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o+F8v1pf7itIcmEZDzN8zUaQ9VJlbgwcVFjr6AuYuwzONkw/R6ulzN/i/WnabxwS3gJA0plXhNEaLuiBTtj+tWvtcsBcMQ9c9QxuMzyiiOu72jX+ttrNtGxRgnvhd54xteth8amAtFXocXtBoYwevqARtw6SLjKM44eAze79KDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jPsTpHfr; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jPsTpHfr"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c08922c23ebso602460166b.0
        for <linux-kselftest@vger.kernel.org>; Mon, 22 Jun 2026 16:54:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782172459; cv=none;
        d=google.com; s=arc-20240605;
        b=f5Xf546fPIKD4m5DPxOh8K0k2bFv0vkyJPRkBmuIpaf4CS3oU1ppXcZ62xEiMk1duX
         UVrVaaFYKzvZZw1GBDEiQXqEoDlnADplw2ZRCtJWC8i+5Gd5qSuSf8Lp5OEbeppEOJk4
         LI+uFLycStGFMKppQde7yl//z5MmTGAGZEN1iyvnaDO5lgJ8g2+jT59QX7wg1hWXCztZ
         dTxVVrag2AxQ0h2OwUhBxtclvbqFR7frqjIaL3yrtKuJjyd9IrCQBgMvKWwwuUxrAm/q
         Yt6pYnL24gbcvORqaPGmiVB2aXy99BF5wed8+s8hBMcJZxotIr7rY+RGkyPsTRz1rZfj
         +FnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=mnhxRL5NSWx2qm5cF+jOJULziDkVFS523GcKtm3BW0s=;
        fh=Sq8drxi6ePseYBTmYCiDCc31SlG1i1N+NppbTalTgHQ=;
        b=gAkppvKea4uuYXB+bkIOemcppEFoZy93ieFjntuzqGkx7VNr0cVZ+kUx92t3SqJMeu
         9il4hKTQbeWB5j3wcCYTGA6KCBvFsp62alGbkbT6UCFdUfm5UFwLzaFOh5yD+8NTF7cU
         +FpX3MMWTiskln+TsfCwnU0N4vVksYZP7uqbx5u2Pnk1eb9xP8hNfw62m/tOqBacNKdg
         i6emx1YMJOvBrrBm+7grvlWvHtTT/DnApikxnwKoioq5czLedvVcU9o2RIMWSVLM1MKw
         5pSVtOEbk+UdVC9/OvvnIwTaHtuzZjAy/hBBUC42eGR/3F/iy8LTGaj28m7ZJEZrBaxJ
         p4lQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782172459; x=1782777259; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mnhxRL5NSWx2qm5cF+jOJULziDkVFS523GcKtm3BW0s=;
        b=jPsTpHfrfh5ppMR+gyIUraMIwJm/OYLJsOd3N6OB9vvTjThH38ksYWY8D2FkYROTyT
         ZgSscTWoUdDnsJQqcFcC/PUIqjc+4bmZymQRLfc0ygApUzPtlp0kouCgEcRg7wTXtuov
         ubH5HACVSgpKbL6ZBAosYe5cg3G+ndkWDi0S5sNXeff0DrhdbBd5SnvLvSCP1ix0N8Bp
         7v2sUOKQ7v9//5QbDiEfzd8xgU7FGkmplZdLsYMwI7oEvh2uz/O0tI6/btHYt+nyrl38
         9Vxnt0A9w3JRt6Yr2k/5pM4l8AqrMV4PPjvsAi7U01/bXYcy4/tk6rrgZfHbYlJV1cQ1
         v2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782172459; x=1782777259;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mnhxRL5NSWx2qm5cF+jOJULziDkVFS523GcKtm3BW0s=;
        b=JYDnEOsSiT8OKVyaVgUST/XesMfL9fX4SmJUa6j79L0Y2c3RT9mhSLN/lzZuEDm00O
         8aY8xvV4B146xVe6shH8LDJbxNdxga8YC555oKXA9rK20Gy3lzvkopbWkp9VTZrK5VyO
         u+v/DaqwGYyKeLKTCKjMfTWC/GgmY3vtRpHqz3BcX+wliqhgqFiIbKvhh9G98dsA8Z1e
         nGa8LCeQvJ/wXxe5HXLEMZMv82lbU2ce0zEbp5olG/Y6Fp6cJ5xl0Eqdt7aciIpc3mTP
         Dc2uhhcdIuZaVsstyqGHUsDlU1FU6pgKwTztDvXCFT0R+LUNtPQBlxjK10LjXS4Z46ga
         HoXw==
X-Gm-Message-State: AOJu0YyLxWfoz3jCbBbLy+oLxpRfC2zGkTQ1F+K3fQAxs9yuJZ1WApxf
	HL9UxffC61NSZ+cgvv+RGns39c/52aL+4Kapvn83JsmPXjEDQpQ3H4wyDi8z94Rj5Z0DbYOZtQu
	Q0PiIXrmOmcU72ZfsKVILieCi7Pf3FRatyi6+sbSo
X-Gm-Gg: AfdE7cnQQNcqrVsw7ThD5dJaPdXV+FzdyzQG6R8rEp/daJw6eUoeROKRIMvYZv/FO/t
	j6Y9LFHu6elU9sEhQ17T3YKLOMctzptTz5Ofs1+kShX1VIWtC+aa2iUtKt5bFV2YK03C14litU8
	ElSra4mBzTe3pKf2nHpBRpeGdUkhc1FdyCA8p+7KpouUaH/LnB4dcxMkwoPLorE/Z9HNUHn9DPp
	Ngn2ikf+e2cyFxGxZxXeb/duZAF1bULrMhzomH7gv/5p/EyyHfms0HUaxhZ1Qh9heB+60Eu0lNP
	SXHeGkwRdn6ZbHy4hFCxxRET+xST+Hk2ACDwmihh4zLGcv2zTV+/zta9MQQ=
X-Received: by 2002:a17:907:a394:b0:c10:1041:65a4 with SMTP id
 a640c23a62f3a-c1080b8e977mr13124066b.42.1782172458193; Mon, 22 Jun 2026
 16:54:18 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Jun 2026 16:54:15 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Jun 2026 16:54:15 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <48777f4749fa43d5648085dbb2037aa99c144a88.1780676742.git.tarunsahu@google.com>
References: <cover.1780676742.git.tarunsahu@google.com> <48777f4749fa43d5648085dbb2037aa99c144a88.1780676742.git.tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 22 Jun 2026 16:54:15 -0700
X-Gm-Features: AVVi8Cc74PEpV2YXCZJIskraOwZy9-czhUt_HBd1DYeN4YnAJwWFzkRCg6GbGig
Message-ID: <CAEvNRgFEHciT3T9y+qEYRvXhDwfrggoU7Rm=f9hT3OrV+wgpNQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 06/10] kvm: guest_memfd: Add support for freezing
 and unfreezing mappings
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

> This patch introduces the freeze on gmem_inode which prevents

Can't find the reference now, but commit messages should take the
imperative mood and avoid "this patch" [*]

[*] https://lore.kernel.org/all/YKRWNaqzo4GVDxHP@google.com/

> the fallocate call and any new page fault allocation. This will avoid
> gmem file modification when it is being preserved
>
> Used srcu lock to synchronise the freeze call, where write blocks
> until all the reads are free. And reads are re-entrant.
>
> Incase fault fails, It return -EPERM and VM_EXIT to userspace. userspace
> must handle this properly as every new fault will fail.
>
> Signed-off-by: Tarun Sahu <tarunsahu@google.com>
>
> [...snip...]
>
> @@ -105,12 +108,20 @@ static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
>  	if (!IS_ERR(folio))
>  		return folio;
>
> +	idx = srcu_read_lock(&kvm_gmem_freeze_srcu);
> +	if (kvm_gmem_is_frozen(inode)) {
> +		srcu_read_unlock(&kvm_gmem_freeze_srcu, idx);
> +		return ERR_PTR(-EPERM);
> +	}
> +
>  	policy = mpol_shared_policy_lookup(&GMEM_I(inode)->policy, index);
>  	folio = __filemap_get_folio_mpol(inode->i_mapping, index,
>  					 FGP_LOCK | FGP_CREAT,
>  					 mapping_gfp_mask(inode->i_mapping), policy);
>  	mpol_cond_put(policy);
>
> +	srcu_read_unlock(&kvm_gmem_freeze_srcu, idx);
> +
>  	/*
>  	 * External interfaces like kvm_gmem_get_pfn() support dealing
>  	 * with hugepages to a degree, but internally, guest_memfd currently
> @@ -273,16 +284,30 @@ static long kvm_gmem_allocate(struct inode *inode, loff_t offset, loff_t len)
>  static long kvm_gmem_fallocate(struct file *file, int mode, loff_t offset,
>  			       loff_t len)
>  {
> +	struct inode *inode = file_inode(file);
>  	int ret;
> +	int idx;
>
> -	if (!(mode & FALLOC_FL_KEEP_SIZE))
> -		return -EOPNOTSUPP;
> +	idx = srcu_read_lock(&kvm_gmem_freeze_srcu);
> +	if (kvm_gmem_is_frozen(inode)) {
> +		srcu_read_unlock(&kvm_gmem_freeze_srcu, idx);
> +		return -EPERM;
> +	}

fallocate may eventually go to kvm_gmem_get_folio(), so that would check
kvm_gmem_is_frozen() twice. Is this meant to catch the punch hole case?

>
> -	if (mode & ~(FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE))
> -		return -EOPNOTSUPP;
> +	if (!(mode & FALLOC_FL_KEEP_SIZE)) {
> +		ret = -EOPNOTSUPP;
> +		goto out;
> +	}
>
> -	if (!PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len))
> -		return -EINVAL;
> +	if (mode & ~(FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE)) {
> +		ret = -EOPNOTSUPP;
> +		goto out;
> +	}
> +
> +	if (!PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len)) {
> +		ret = -EINVAL;
> +		goto out;
> +	}

There's some reordering here. Why not let the validation happen like
before, then check kvm_gmem_is_frozen()?

>
>  	if (mode & FALLOC_FL_PUNCH_HOLE)
>  		ret = kvm_gmem_punch_hole(file_inode(file), offset, len);
>
> [...snip...]
>
> +
> +/**
> + * kvm_gmem_freeze - Freeze or unfreeze a guest_memfd inode mapping.
> + * @inode: The guest_memfd inode.
> + * @freeze: True to freeze, false to unfreeze.
> + *
> + * This API is used strictly during the live update / preservation transition
> + * window to prevent host userspace and guest-side faults from making any
> + * mapping modifications (such as fallocate or page fault allocation)
> + * to the guest_memfd page cache.
> + *
> + * Synchronization Strategy (Sleepable RCU):
> + * To avoid high-contention VFS locks (like inode_lock or
> + * filemap_invalidate_lock) on the vCPU page fault hot paths, this subsystem
> + * implements a lightweight, system-wide Sleepable RCU (SRCU) mechanism
> + * (`kvm_gmem_freeze_srcu`):
> + *
> + * Global vs. Per-Inode SRCU
> + * ======================
> + * A single system-wide global static `srcu_struct` is used instead of a
> + * per-inode SRCU structure to completely prevent unprivileged users from
> + * exhausting the host's per-CPU memory allocator. Because
> + * `init_srcu_struct()` allocates per-CPU memory via `alloc_percpu()`, which
> + * is not accounted by memory cgroups (memcg),
> + * a per-inode SRCU structure would allow a tenant to bypass cgroup limits and
> + * trigger a system-wide Out-of-Memory (OOM) crash simply by spawning a large
> + * number of guest_memfd file descriptors (bounded only by RLIMIT_NOFILE).
> + *
> + * Flag Modification Note:
> + * Since `GUEST_MEMFD_F_MAPPING_FROZEN` is the ONLY flag in
> + * `GMEM_I(inode)->flags` that is mutated dynamically at runtime (all other
> + * flags are creation-time flags which remain strictly read-only), there is
> + * no possibility of concurrent bit-modification races. Therefore, a standard
> + * `WRITE_ONCE` is fully safe and does not require complex `cmpxchg`
> + * synchronization loops.
> + */
> +void kvm_gmem_freeze(struct inode *inode, bool freeze)
> +{
> +	u64 flags = READ_ONCE(GMEM_I(inode)->flags);
> +
> +	if (freeze)
> +		flags |= GUEST_MEMFD_F_MAPPING_FROZEN;
> +	else
> +		flags &= ~GUEST_MEMFD_F_MAPPING_FROZEN;
> +
> +	WRITE_ONCE(GMEM_I(inode)->flags, flags);
> +
> +	if (freeze)
> +		synchronize_srcu(&kvm_gmem_freeze_srcu);

Why only synchronize on freeze but not unfreeze?

> +}
> +
>
> [...snip...]
>
