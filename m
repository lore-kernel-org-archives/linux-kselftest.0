Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680542FCC04
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 23:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771631995; cv=pass; b=p3/HBGcoun90fNTx6Z0kVRxeeLMWeqioiNw3DhjtDCjSxyIjIyjrdWLXt/4EYYyTyv+dvbIifMgguwEdO5VNvL6oleklooVsG08sO/Koyj/fPqh2yJGqnSRJeanWV5wCf4lMMEf8W8+miI01SEKu8OThRQcSUcqTuS+YDg6fMkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771631995; c=relaxed/simple;
	bh=VyJ51nvldcOjba54gfvYaCWLkwe2rVqmswtI06TBvPs=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oshl7AN+E81k1VF2GO4gR7ZWQgGq1zq01aIfF5juWtzE23s6rAuUvVyfo/DzbGrLmZ3TuRAEUk8YwJzkyJTxToJl4yltgebtKez03T0NzRZX0/aMJSuUI9NPsvV5Fp11DdCcy7ncVSwrN0+8ThWn3eeGYrdFsU6tcqcRGMVoUvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XR4LKg6D; arc=pass smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XR4LKg6D"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56753dc51baso1160218e0c.1
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 15:59:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771631993; cv=none;
        d=google.com; s=arc-20240605;
        b=Kp0r0Qp24f9xCAGgMUmp9AGpLD5Hi00CUy5tqwixJIee5Mv56AuR0ahCavF9Ck8XYJ
         25A3n15RcqKyfSQQLVAU9ONF1HsoTMjW11tpjsCGC6B2HsXVJ3LqgPZ7OUhcUOT3KJUW
         Bxm8yGYTsvEnYsY44iaFAmM6LZwlhg8hxZMpT0d3D0D9XyFL+5f/WRQ7fgBF1tslOZBC
         hdZ/rDhRzhBnyz0V66B3xG+Z6bmTrGFc8VDR9D61oQNO82Hlsbg5kpYghioWCjk/jE6g
         S7Cc7xLG4YmBz8z6SCgrOhrn2ySyY5F00XmEr0YzJTuySg/XaaLGpiIJNkv7G4U9Bx1e
         S4lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=+f0CcQxmI0koMDUEbyqFOb1QILsoY/SYqmL6D7Q+4cE=;
        fh=Z9k7RRoGNoqNzYkWgsCFTp4jGquhOaD9XURX2bjHckA=;
        b=K98uO2sOaoMW0+tnoa7jalHIi4eF19FgM5k3ydaxGqZUB9tsk9l0cv0pyDeo4PitH/
         m/zOOwoayJ3URJMi1GQZP8h7wL93PH8+mxFDdgHndmqBFLjN3HnKoh/VVZDzzKKaBSxm
         rSUwxAagwZBv9aDWWX5GhnTLDtWHwNDu40ddRBWZmdJiE02UScXV4K1Y8rlLDNcED6on
         V/F3ae56x14VZdmSHYER9G/+DST0YomZrjQwSha9R1a4u9dbuSeZ9HxJZTzSdAKSAEan
         oGv82tcO+dsHyCrTVE3uFN+eFwUL7PFXq0BmtC8XHIFplXtsWyJdnn4BBU0yOKF3H/37
         v9cw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771631993; x=1772236793; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+f0CcQxmI0koMDUEbyqFOb1QILsoY/SYqmL6D7Q+4cE=;
        b=XR4LKg6D/gGGvzXgOsfsIBAJrDcsMcXhjNtNNwfnEr6i9g0J1AyDZn6AVkqSvxQXhS
         fJAOqO3YTEXr4q9yR1463W4EfqKu3j5WDxPGhQ9ICKL/tKbWXWpea3htap0LOBnXvz1N
         Mz9PsmXPPIzL2iTCAGXb4v4zl/WTMnbg8l+RQzmrbzQLeNsCGxGWSWlqhkSckiBIHS43
         NGNWbAuPfgb/e5NspKFzZZCh8sF2hopWh+ygjitdJ9YRGBdJEjrvdgwpweg4rvFDHm3R
         X2gSmBBllt4lRx2cuLyEQZDKXGUzTG9sV+nWu1mc43p2XKGi1jyd3LbrQCEsEQ9Gsxno
         YyqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771631993; x=1772236793;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+f0CcQxmI0koMDUEbyqFOb1QILsoY/SYqmL6D7Q+4cE=;
        b=V9Vq20nwzfBay6fcZKo/sGaORjk3MkonjHVKF5jiNP5XQFSTB+u27YJ2IhXoigzMpe
         bZAFs0WvaGIPY6MkxaTmEdJlS9XkO+rXPLQ/mZVY/zA4tIRg9wMgODXvAHPsRWDy5YHf
         dqjRDouCcfaxqghxe7GpMBUeYeEd0LcbgmNjK9uKQcN9g1ACAS8tmlotMFd/bj424EEB
         81+9hlU74eMmcbVYuuMR8uHeeI/dRiaEsSh1xqry8ndm3ak37Fc4lGLxBU5Gnm1QeLzB
         7tDMx5bO6ttYhAolzLcFDpgDwxCcfhgzLK0KQRSRd5/1xud2PM/5oUsB5rbsmS902E+3
         DbvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLQCLm35lQZ9i1I0C3Mb5ppHjusEUtqxWLp4rpZ8Lotgptbc8o+zSnOz+ioY74vuLI3mLtoAzmPzv8LudMz88=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUzA/nH8EBHUBCQobNPWWMZzpB0NBzqX7G89vopG9yAtCio6er
	Xlb4bcpzOJrhjzOdrz/8iduplml7eF7S2jWQ96Tf6vjZubBI7P25WkfAqSeuwSzHJwtVOWyirm0
	227MuTpOdGhMfRvpg3i0WBcv7pH/4FPPp4vW96SHn
X-Gm-Gg: AZuq6aLO1hcaYSLqfykNb7LGL8Og3+J0cKMxBN53P31bQPWocaG8gbcHJP/CwqjNiNa
	HiVttQvAQeKw467zJRpGrvMHr0K46Zzlv2CwK/N6a0ypV5O3qC+oKQOlES3VAs2BHvePo+I49/X
	jgYe2Ju3NRiiWVjB5jJ6cDfUc151VB7YN56GMi/34dFpD8DIfgslffMYBed5EMaZo/bQTy9DviY
	kC7O3XV5DPyNgjOTnqjhwEoT+DSX0x2yncKqklKrSg9I+4Umxdz3da9tPBifAUOi417Wr1XChJ8
	iGOLfNvZVlQWHqQNzXubyz/PBcWY1gXj5hWtSaA/zA==
X-Received: by 2002:a05:6102:358d:b0:5db:3bbf:8e62 with SMTP id
 ada2fe7eead31-5feb2e60d7dmr725313137.1.1771631992819; Fri, 20 Feb 2026
 15:59:52 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 Feb 2026 15:59:51 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 Feb 2026 15:59:51 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <aZSGD-EGSR3Z5Qyi@google.com>
References: <20260214001535.435626-1-kartikey406@gmail.com>
 <20260217014402.2554832-1-ackerleytng@google.com> <aZSGD-EGSR3Z5Qyi@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 20 Feb 2026 15:59:51 -0800
X-Gm-Features: AaiRm50KSzR4QWeR2pY6q56NWZqd8e8f9tXSjFga3oRJAj_7AZ0rMRT-3FKVTjc
Message-ID: <CAEvNRgHQZzdy8+rbsH2EibpCo8ddinXMSSef5h1_r3mK74q-xg@mail.gmail.com>
Subject: Re: [PATCH] KVM: selftests: Test MADV_COLLAPSE on GUEST_MEMFD
To: Sean Christopherson <seanjc@google.com>
Cc: kartikey406@gmail.com, pbonzini@redhat.com, shuah@kernel.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, vannapurve@google.com, 
	Liam.Howlett@oracle.com, akpm@linux-foundation.org, baohua@kernel.org, 
	baolin.wang@linux.alibaba.com, david@kernel.org, dev.jain@arm.com, 
	i@maskray.me, lance.yang@linux.dev, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, lorenzo.stoakes@oracle.com, npache@redhat.com, 
	ryan.roberts@arm.com, shy828301@gmail.com, stable@vger.kernel.org, 
	syzbot+33a04338019ac7e43a44@syzkaller.appspotmail.com, ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Tue, Feb 17, 2026, Ackerley Tng wrote:
>>
>> [...snip...]
>>
>> +
>> +	/*
>> +	 * Use aligned address so that MADV_COLLAPSE will not be
>> +	 * filtered out early in the collapsing routine.
>
> Please elaborate, the value below is way more magical than just being aligned.
>
>> +	 */
>> +#define ALIGNED_ADDRESS ((void *)0x4000000000UL)
>
> Use a "const void *" instead of #define inside a function.  And use one of the
> appropriate size macros, e.g.
>
> 	const void *ALIGNED_ADDRESS = (void *)(SZ_1G * <some magic value>);
>
> But why hardcode a virtual address in the first place?  If you a specific
> alignment, just allocate enough virtual memory to be able to meet those alignment
> requirements.
>
>> +	mem = mmap(ALIGNED_ADDRESS, pmd_size, PROT_READ | PROT_WRITE,
>> +		   MAP_FIXED | MAP_SHARED, fd, 0);
>>
>> [...snip...]
>>
>> @@ -370,6 +441,7 @@ static void __test_guest_memfd(struct kvm_vm *vm, uint64_t flags)
>>  			gmem_test(mmap_supported, vm, flags);
>>  			gmem_test(fault_overflow, vm, flags);
>>  			gmem_test(numa_allocation, vm, flags);
>> +			test_collapse(vm, flags);
>
> Why diverge from everything else?  Yeah, the size is different, but that's easy
> enough to handle.  And presumably the THP query needs to be able to fail gracefully,
> so something like this?
>
>
> [...snip...]
>

Addressed your comments in a v2 [*], thanks for reviewing!

[*] https://lore.kernel.org/all/cover.1771630983.git.ackerleytng@google.com/T/
