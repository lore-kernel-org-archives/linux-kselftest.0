Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB9D47F2E7
	for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 16:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787070805; cv=none; b=Lhg0Rkoza1Hv6DtTyBz62z+Fz6XE3ZkKLF0NnMFD06IsF9rtf1twPwa8d5mn5ixeFci6+cS1nn0WwNpJasPT9xwehnyKqvNLpEKwtzlK2aqRGXZ3u2baZweqYRfq7vk/i7Dx6MaG3QgDjROEZqAMT7gjLFm7AVBaO6RN68evKdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787070805; c=relaxed/simple;
	bh=0igr8Zes/VrYG9fBE3Cru4sD9Bym8t8t+dDC8+h+gAE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sPep6ohgEeLbX2/Me8fICg/58bgGYVeNDV/SR3ZuOBrbZIB0m/sCPF6WOkWYAN4Sik5o4EMLBfGKSCNaYnl9Yb+fG4egyZ0Hg5uazj/Ud5Mge8bisHuygdxOjHgXfYFrRG7FYYjQSMMsrpP2CT/ISv/JHXuFr4ZRZmczo7xOhzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y2CmzhOQ; arc=none smtp.client-ip=209.85.218.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y2CmzhOQ"
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c1686e23b9cso57183066b.0
        for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 09:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787070802; x=1787675602; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NYCxMBx4BOPF4yBl5aKpfQIqd2cMC8x5BNz4F0URw58=;
        b=Y2CmzhOQUiBpcQdqp7SRGIDAIpVBtJP7x53ivlFZPPvsipZCsIiKakPMi5TtmYUbWB
         W5dbbG/qcSqKmAewTxQua3qwspuJOOlM34loyMPQAB8YpHdgQh+Fo3Rq4+8tWYti1N+/
         m0+SSoP6tsy8kpMREm+5HVJ5uYLbMgtX9BKEn9WhzKCs2fEjoQK69q/GACruN2sSdqj0
         4PLBqlcyC2CtT5XMwPGS3jJ4HdNbwiEp3jT/QLAL6qg5exaRx5rDaIF5wYJRCe2bT+Zx
         aT/3v4VX657/Cvcr7CHOfi58xcJ9Dw5r2UK1MQF5yqYaDbzJrFylXOp8JLkflQxHm8DE
         d63A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787070802; x=1787675602;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NYCxMBx4BOPF4yBl5aKpfQIqd2cMC8x5BNz4F0URw58=;
        b=ipNXgMDauMKyfW2Ss7l8s0VRibfmgqvQ+duLrguMSbe9cN3+HtuN5HOOqWlRKsLUoR
         aLwaQJchWsVn1ZYtPZg7JIRhSkT3SaJb/X14ZjP9i4jyy3hMafdhE9RSuX88pFneJsPt
         mhA4FDN6J/B0D1lTawJxFADOspcYcUkh2adc3907u4jRz6rsMW2Ko6+1sZKwpnTaaG5n
         9qm+nr+OFG2I3gkugntoiMuXZOwwsVK1G/NNYZggGAF6b6i1FnGfC2N95vRSBc7zXn95
         mOP5AmFBmvkzjWtFXg2WWsQt3+KTb7EWegYV7mauxh8Y66lcBlPpjNah0iiIwv4UrnLS
         GINQ==
X-Forwarded-Encrypted: i=1; AHgh+RqBZDKQrY68Pqy/YQNVKoXxVzeZ1HNkRYx+tEMkCUNH8itjdmB/lkzs+xcHmDwwfawH0dlbksJ8+UgfpO2go2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhp22yBkQKvRE8316f3ms00tS0Q67BqotKkJPc0xzdMuFinyB4
	qfbUxmNT143NM5jQHAvwzuudb+c3ejxFx9EuIn0dxVfNqFx062w72OjZ2mjj6U1+aXZu6v+BHCS
	8YPxx4aU4j5fEPcWBsQ==
X-Received: from edea16.prod.google.com ([2002:a05:6402:a190:b0:697:8356:d9d6])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6938:a091:10b0:c15:a487:3482 with SMTP id a640c23a62f3a-c2188a9df89mr438613166b.21.1787070802257;
 Tue, 18 Aug 2026 09:33:22 -0700 (PDT)
Date: Tue, 18 Aug 2026 16:33:21 +0000
In-Reply-To: <anpieno-RyRl54fp@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260728121138.1103610-1-tarunsahu@google.com>
 <20260728121138.1103610-8-tarunsahu@google.com> <anpieno-RyRl54fp@google.com>
Message-ID: <9huzfr0bv166.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH v4 07/11] KVM: guest_memfd: Add support for freezing mappings
From: tarunsahu@google.com
To: Sean Christopherson <seanjc@google.com>
Cc: ackerleytng@google.com, fuad.tabba@linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, dmatlack@google.com, 
	Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, david@redhat.com, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, sagis@google.com, 
	Paolo Bonzini <pbonzini@redhat.com>, Mike Rapoport <rppt@kernel.org>, Alexander Graf <graf@amazon.com>, 
	linux-kselftest@vger.kernel.org, andre.przywara@arm.com, michael.roth@amd.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, will@kernel.org, 
	vannapurve@google.com, maz@kernel.org, fvdl@google.com, kvm@vger.kernel.org, 
	oliver.upton@linux.dev, kvmarm@lists.linux.dev, alexandru.elisei@arm.com, 
	skhawaja@google.com, aneesh.kumar@kernel.org, linux-doc@vger.kernel.org, 
	David Hildenbrand <david@kernel.org>, yan.y.zhao@intel.com, kexec@lists.infradead.org, 
	suzuki.poulose@arm.com
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Tue, Jul 28, 2026, Tarun Sahu wrote:
>> +/**
>> + * kvm_gmem_freeze - Freeze or unfreeze a guest_memfd inode mapping.
>> + * @inode: The guest_memfd inode.
>> + * @freeze: True to freeze, false to unfreeze.
>> + *
>> + * This API is used strictly during the live update / preservation transition
>> + * window to prevent host userspace and guest-side faults from making any
>> + * mapping modifications (such as fallocate or page fault allocation)
>> + * to the guest_memfd page cache.
>> + *
>> + * Synchronization Strategy (Sleepable RCU):
>> + * To avoid high-contention VFS locks (like inode_lock or
>> + * filemap_invalidate_lock) on the vCPU page fault hot paths, this subsystem
>> + * implements a lightweight, system-wide Sleepable RCU (SRCU) mechanism
>> + * (`kvm_gmem_freeze_srcu`):
>> + *
>> + * Global vs. Per-Inode SRCU
>> + * ======================
>> + * A single system-wide global static `srcu_struct` is used instead of a
>> + * per-inode SRCU structure to completely prevent unprivileged users from
>> + * exhausting the host's per-CPU memory allocator. 
>
> This argument doesn't hold up given that each kvm structure has two SRCU structs.

Ohh okay. I was very skeptic that per-cpu structure are not counted in
cgroups and liveupdate is once in a while usecase So avoided making it
per-cpu. But otherwise I am fine with going with per-cpu. Will take care
of it in next revision.

Thanks
~Tarun

