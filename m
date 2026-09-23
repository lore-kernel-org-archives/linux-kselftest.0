Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704CE3DE426
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 17:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790184604; cv=none; b=V8epdsZT4H7g6zBfquuNWWth5a39f3cQncOvlR6DXrXiJr1Reh9S/O1q2BMv4+CLiigAJR8Z9uJVKidClT/k5A1FMZzVYM4NQwKzHq/3Hz8VJiPdG7NC1WseX33xIRp4o2YsoVTwsbHjMuW5YDbCiMOLQZp6v/LhUf/fcZqD4Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790184604; c=relaxed/simple;
	bh=Xb+U6YJSUeoOboOu794hniiPkJcsrI7/3PRgA18qQs4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sreIRh2dq2+SeP/nmrFeQ+g9Rz41GCyKr/B3BKIzF/HhHil1pkjo59/5YoWz50gFzG4JHVvepl/wAzStWty06Vo0+oQh+3sY8/y5myr1wdftZY7ihxPpWnk4zOhoAICXVQ6XMVqB/OV570fdl7sfYap21HAfoRCVdESI24kS5dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EIXIe88j; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EIXIe88j"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so2236470a91.1
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 10:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790184598; x=1790789398; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lEgwGyblZ3NAaQJFmRUZMB/ng9M+MOX69eMi4kIb+DU=;
        b=EIXIe88jIsLgAZhjerE3Yy+cw2VllddHf/OXckJ3ncc5nwM6ZkSOQ9o72EtuNMIQtr
         FNDANsKM+iAaCAQai8JaRTYl6zNjKYGZK1e7kSJJVKpvN19V541DKcnQvYYsXG00TV+j
         rR0qeFcwVtj7e/64hJmYXdAmbXowoNmc01+XVvQULMyIB0LBQCjjGT6f4hLe02JgDqVK
         blRT4V5KWek6tlfxVQIwl88JXAiW6Dy49CMLucM/zg1O/VIIGuGy50KzxoGIvQ7tnNvr
         ddihixzKJKUPYiLqZBHZz3c5ipEWsLbZjXN8dIWZCG24R05D+hsF4EIi61LxXIB6VeFW
         wiNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790184598; x=1790789398;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lEgwGyblZ3NAaQJFmRUZMB/ng9M+MOX69eMi4kIb+DU=;
        b=RGh1tzQZdL3eQaG/yd0zu8b9QJP3eFgeb3BuUQbS+ZaQeRTVesNM8BTDjNBYdWhK/D
         3LgsRGHuefAXsZHuqG+BavwSOePLNAZSahwP0JRReJjGP++nAuQEh0Z/odVHkXy1W2J7
         81NikqD2BadZCQptYz9EZj0q03zwh4spNKAHraxBkVD3LOCHlOYtdpisaWFUOWmu4RPc
         Ck1K7JmDb8ucSn876xUAq4KuaQJQO/wU6+MUI9J7Ak42m2QKn0vae/v1uO00Ie0EkSsi
         M2oY2vcPDJXDBagYeiKEH9svIVY4sP9Sv9igiastRnL1Ys+S1bCKHeVcf6IGlyqiUrLp
         fCxg==
X-Forwarded-Encrypted: i=1; AKwUvBw5oVi975qsDo9hW4JXqJxExZH+QeZwDyxkbhD9W4a0dAY8AZziv49XDrY3syh6+sTSNPZLMKJdTX0NPYtk9K0=@vger.kernel.org
X-Gm-Message-State: AFuF++kBfY5mubFEbtSdnT6l8KSrEOWVJ64FGf979dMIJKvRxFOnkQG2
	3X9OmXSJ1V2rqxxUQo7RHCC7blhuSk+UQM+mVK6fzvpZbt55EBtKF7boL1pdDwm3h2je26gvF06
	L5p6uDw==
X-Received: from pjbmr22.prod.google.com ([2002:a17:90b:2396:b0:3a0:3f81:b5c1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:dfcb:b0:39e:b15:7950
 with SMTP id 98e67ed59e1d1-3a07e4f7befmr2966146a91.23.1790184597504; Wed, 23
 Sep 2026 10:29:57 -0700 (PDT)
Date: Wed, 23 Sep 2026 10:29:56 -0700
In-Reply-To: <20260923-kvm-arm-prefault-v4-1-d4b0b4dfa8c3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260923-kvm-arm-prefault-v4-0-d4b0b4dfa8c3@kernel.org> <20260923-kvm-arm-prefault-v4-1-d4b0b4dfa8c3@kernel.org>
Message-ID: <arQMlH-LWyRGJWt2@google.com>
Subject: Re: [PATCH v4 01/14] KVM: Allow architectures to disallow pre-fault
From: Sean Christopherson <seanjc@google.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Randy Dunlap <rdunlap@infradead.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Jack Thomson <jackabt@amazon.com>, 
	Jack Thomson <jackabt.amazon@gmail.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Vincent Donnefort <vdonnefort@google.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Leo Soares Passos <Leo.Bras@arm.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Sep 23, 2026, Lorenzo Stoakes (ARM) wrote:
> All existing architectures which implement KVM pre-fault (x86, s390) have
> mechanisms for disallowing pre-faulting.
> 
> Currently these are open coded as part of kvm_arch_vcpu_pre_fault_memory().
> 
> Formalise this by moving them into a new kvm_arch_pre_fault_allowed() hook,
> which every architecture selecting CONFIG_KVM_GENERIC_PRE_FAULT_MEMORY must
> implement, returning an error code if the operation is disallowed or 0
> otherwise.
> 
> The hook is called early in the generic code, allowing architectures to
> disallow the operation prior to vCPU load.
> 
> This is important, as kvm_vcpu_pre_fault_memory() is the only place where
> generic code can call vcpu_load() on a vCPU that has not yet been
> initialised.
> 
> This lays the foundation for a future change which implements pre-faulting
> for arm64 which needs to disallow the mechanism for uninitialised vCPUs.
> 
> Suggested-by: Oliver Upton <oupton@kernel.org>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---

Acked-by: Sean Christopherson <seanjc@google.com>
