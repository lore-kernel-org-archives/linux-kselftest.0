Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E24F49363D
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 17:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790097826; cv=none; b=Oix8pTXht/XMuTUdCcLDGZRgJZ0Vc5SYMouMxyZl65HTVJQskkQmPD0g0ZCoQZJjnMecMkHe0pyzrucepj4o9NbbQTXS9WDjOicNDWIU8U/4TCDjXctJHc+7B1vHUFQ68uD6VU6JRnLJvFCxiW0VUtc3cVBxhunlaUk7ACmMF6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790097826; c=relaxed/simple;
	bh=YagJ7G/Lr2bkyPLb96nex2Ieu1fELferKNmlqik77Pg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YogpRZdfb05huRCU38pSI9RwqNNKquEgzbo9jhPOJ4qJJCu8T8br3nifrhTvbzKRHCpF5PKCATxTmCqEVu8zski4WACjd3Wgjyyui03MXxfVJ1lYwR8GTwGb3T+/vHucLEakyuWFJ7YSgqwphVffU9naOzAwIwTglyqS3d/X58Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dxRdjVco; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dxRdjVco"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6df0a1e18so868565ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 10:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790097825; x=1790702625; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ql6e6uyZc8xZzxZ3KoRlBfpeEOGwWkJ5hNC8a9M29d8=;
        b=dxRdjVcoLsnFcCZhSW7boiZa9GWAyA9oTvoHs3GxJSiw+lm0gVHBSZpJFnOSOJaD0s
         NgeHv4VUPkENZPxLcU90YFpkfTGPZqlOoySmejuRj+TVuID6Aq35g8g/x9FiEnnO/Cn6
         ojebIkvtr083C+t0fZSS0oFJ3c09BBVH2C5tVe06Ewgxd4e/3y+Ms6wR+zTIIKlBd2gI
         QFCH36SibkjBuclExMD6fhGVYo1vJczPVTTOk3eEQIiCyj1e/lWrNDbiappama75zVQq
         gUEzxrclcY+iy80WgXqNMm9HIRlEdqFmLYAznae7+oqPeW+rt5qUIIYf9opBKN7KEamE
         tdbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790097825; x=1790702625;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ql6e6uyZc8xZzxZ3KoRlBfpeEOGwWkJ5hNC8a9M29d8=;
        b=GezDL155n7+VKBa64A/GB1L7CU503dxS4pt/N6troZiH6mJhk8HzIj4XWrngPlhA0k
         jV43agAeZ0ptPHqYrsWFJMUryOvU897bLbx+GCgN5aaQpLYWlEfaysYpOKBljrkdaZx6
         q8qu3xBXRFU923mwqiUmdBzDB85S6MaAE6TQhfpZC5dQ1EcjpBPPK0LPmCWS0ZBODako
         nr/VKJUsSzn3N+TGeiU2bc3dZf3+pV4OjccSTpvocue+qmVjqJLEs2YHQWNlUwhAKDy7
         AHq8DBhpVVlAUcjCzh9fLAYrOovVIjbQBHhcy7qgwUICmuy2DGIiSuwV8oBbNE+gcBkU
         yuWg==
X-Forwarded-Encrypted: i=1; AKwUvBwZ/jxkqpYOT7or4c+TzK2ABF4baoxnxf+H1LSCtEffdSLeFWszVaCux9SYLIvx4T6mXEQjhVHlogHjqLhmzfE=@vger.kernel.org
X-Gm-Message-State: AFuF++kYu6GCWh2Zif1THSjJVu9p/CISDWT4xevJjgQ+2BGYjyOJfMxf
	9Affy50ke10Qzs0OyBzBoBEv4RU7p4B6u08dnyTBM9wDHgNwVoj8f0nyTgao7DEorx6ccY3RX/F
	6fI/L+A==
X-Received: from pgdg5.prod.google.com ([2002:a05:6a02:51c5:b0:cc5:111b:b53f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1848:b0:2dd:c100:7cb7
 with SMTP id d9443c01a7336-2df69de9aaamr563645ad.51.1790097824659; Tue, 22
 Sep 2026 10:23:44 -0700 (PDT)
Date: Tue, 22 Sep 2026 10:23:43 -0700
In-Reply-To: <arKxjsxuO1F5ExrY@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org>
 <20260922-kvm-arm-prefault-v3-1-787bd3bc7e3f@kernel.org> <arKxjsxuO1F5ExrY@kernel.org>
Message-ID: <arK5n9HrbZMCOHOt@google.com>
Subject: Re: [PATCH v3 01/14] KVM: Allow architectures to disallow pre-fault
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oupton@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jack Thomson <jackabt@amazon.com>, Jack Thomson <jackabt.amazon@gmail.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Leo Soares Passos <Leo.Bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Sep 22, 2026, Oliver Upton wrote:
> Hi Lorenzo,
> 
> On Tue, Sep 22, 2026 at 03:17:55PM +0100, Lorenzo Stoakes (ARM) wrote:
> > +bool __weak kvm_arch_vcpu_allow_pre_fault_memory(struct kvm_vcpu *vcpu)
> > +{
> > +	return true;
> > +}
> > +
> >  void kvm_vcpu_on_spin(struct kvm_vcpu *me, bool yield_to_kernel_mode)
> >  {
> >  	int nr_vcpus, start, i, idx, yielded;
> > @@ -4365,6 +4370,9 @@ static int kvm_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
> >  	    range->gpa + range->size <= range->gpa)
> >  		return -EINVAL;
> >  
> > +	if (!kvm_arch_vcpu_allow_pre_fault_memory(vcpu))
> > +		return -ENOEXEC;
> > +
> 
> nit: it'd be better to let the arch hook return an error of its choosing
> but in reality this is only going to be used by arm64.

Heh, except x86 already has something similar.

	if (!vcpu->kvm->arch.pre_fault_allowed)
		return -EOPNOTSUPP;

As does s390:
	
	if (kvm_is_ucontrol(vcpu->kvm))
		return -EINVAL;

I also don't like that this is subtly about avoiding vcpu_load(); it will be all
too easy to overlook that detail in the future.

Rather than have kvm_arch_vcpu_allow_pre_fault_memory(), what if we add a more
generic kvm_is_vcpu_loadable()?  That way we don't need to worry as much about
the return value, the connection to vcpu_load() is obvious, and we don't need to
add another pre-check if future (or cleaned-up existing?) ioctls want to do
vcpu_load() in common code.

I'd also be tempted to say it can be a macro, not a __weak function.  E.g.

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 27fe0cd5b2d7..99613df254cf 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1533,6 +1533,7 @@ static inline bool __vcpu_has_feature(const struct kvm_arch *ka, int feature)
 #define vcpu_has_feature(v, f)	__vcpu_has_feature(&(v)->kvm->arch, (f))
 
 #define kvm_vcpu_initialized(v) vcpu_get_flag(v, VCPU_INITIALIZED)
+#define kvm_is_vcpu_loadable kvm_vcpu_initialized
 
 int kvm_trng_call(struct kvm_vcpu *vcpu);
 #ifdef CONFIG_KVM
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3dd04605f2e5..02401b080507 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1053,6 +1053,9 @@ int kvm_trylock_all_vcpus(struct kvm *kvm);
 int kvm_lock_all_vcpus(struct kvm *kvm);
 void kvm_unlock_all_vcpus(struct kvm *kvm);
 
+#ifndef kvm_is_vcpu_loadable
+#define kvm_is_vcpu_loadable(v) true
+#endif
 void vcpu_load(struct kvm_vcpu *vcpu);
 void vcpu_put(struct kvm_vcpu *vcpu);
