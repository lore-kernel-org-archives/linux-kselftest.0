Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE09C37756B
	for <linux-kselftest@vger.kernel.org>; Fri,  1 May 2026 22:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777674116; cv=pass; b=FET3a5tJD/Fg0NevUgMaKi59jYbBZKYmUy2/vlz4fl3DGXSxbvDlb19TLgq59X9Y7GNCmFJTySOuCtcpQ5ft6I718vhyKz/0tDms1PJrAhfuD8CnJ89thjJKLZaNGhO3h/ynnKrMfj5ltYHxXosVf5PmawaajPVkebmG5sI1CFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777674116; c=relaxed/simple;
	bh=jLrfkaOhEb3MmFwOmWCGQPBbw6a6kIN8jleBSy0FvN0=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u/gqGr/zroXhcCuuCLhKqsn0YXwVI8/oBPedlOnKcZGlE83RlTyd5nZbnOI3seOGlhUzVdJ49Y6ddPpye98Ei3cDp+sKGcIdI3S33y92Py9qPzGckhCPwlUkX2I4Z/Y8oaSlPR1hXWMcPzeyBqJ5bATBQ4yOxqLee1gh2P+vOZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZHd7Xygz; arc=pass smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZHd7Xygz"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56d958880ecso776970e0c.2
        for <linux-kselftest@vger.kernel.org>; Fri, 01 May 2026 15:21:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777674114; cv=none;
        d=google.com; s=arc-20240605;
        b=P1OEuhx5UkfqUofyVmFwcLX6U8buqKDkBqMQpAxYzu+HtaBVlnla/sUegUDZ0T2+DR
         WaDtPoUohS2TuSJ5PH2LUDJIdGnYdrKaxerVOh6OYrE2sUwokVzJ232DIc2s5EhSpKTD
         4pwGy/cMuGTMGDC6gbKF5mwvPEgrSmdANIsGkYG2qg/sOJ1qf7NSmCNoRcbqq0IU5k1K
         foZAQ5kSSMHe1DLmjx5nb6GsyTrUvAgrjwzwnyDsy8nZU0owQprwO3Y0GIaroW7y0MdL
         kO2P7MKPofk4JTHgF2Bg2HLIgyvdfa68GnSUctp5Ybtx6j7CcDPBeda1/uZlGu5Zk12E
         qNYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=dtXXiVGCKhisCk8aLdkBNg++qq/ezEnbK3PGbPzPAeg=;
        fh=NAlP8GMgWk48WX3Z+Ag5dc4DbVMJ1fMxCp/OT3JDEEQ=;
        b=Z0IpUduMAIkKqxV8qm2okPemPg1KicGJ+nN+q+CUJbaHOrokH195otRTzP0RM+xf47
         zaE3m2dFnViV032r3J7pXVoMc58RB5qIviNVGD35c050L8cYwQ4apSVj3ud3rfLkZc8E
         rrirBtMd0a3WEMYgprx/Va1TDFWyNV9gUgArseMpww8EPcRiFO8d7mLd1lVl+zelHJMi
         vo9Il6Gf5R8BLCHDpcgY7WJKyrc59IpoHK0trFXutMmasY3UIO3T1gkkQ173ApyIPUCy
         OXDAWU2lUUplAFYBG8brsJTbBPtL5SfB9jE3RMqHAIU3vvfOFOBsB0Z/02kEKeZAJPlh
         wf8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777674114; x=1778278914; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dtXXiVGCKhisCk8aLdkBNg++qq/ezEnbK3PGbPzPAeg=;
        b=ZHd7XygzDp1+bgpyWWstsNSnzgN6A1YDrvqFBMoy6WgTGyMnmYazVRVPJtbxC8vn9T
         5rNBfMGbYsd/9p9gqxkzT5iL82Nhaoou/IOl/YSZVZbM4Qy1Ler2R4MyufI/9osHe2By
         IIj9OcO2N70WgtpGUepjHj55uy67gMHUQY8Qxloi1RGDC1mn9WhCaAbtpcbgYudS+sGI
         hqC38rJ/ghaVd6FJu4ZPxxi7iIhwbXfvh+virH1w65yL36SdYPKAlViRgChAwMHQCH83
         mwh5sQq56kIFmFVqTGgYM4KOW4sjrHgjvmx5wn0AlDvo9tji4+Hqz6fYBGO/n7ZSjQY0
         NxLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777674114; x=1778278914;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dtXXiVGCKhisCk8aLdkBNg++qq/ezEnbK3PGbPzPAeg=;
        b=RSNwuKEwgi2xT4YAAbdZQmqpMI4w0ISFlQvCZ0QEIXeK7h2s3Ns4gADwd6ANRjOPBZ
         HbgBIKOSJXzsNCeIH2LLVtwpHFTCOnBUx6T9bwt8wA7Z7S9bQ/1WOIXz69rvJ4qcC4fp
         CS8QpH7DS9UF4muO9wfU7rrQcbav8uY493CShnONftFMRBCg+kiK0urbvorbPYLdDNeA
         ErmXifebMI6t7FUypm7/stEFx4s4vKhgDJ7PglKmusUtC/eqzTJqVKD+Av94DnFQsL0p
         r6yRI5NBhZmoOfstJfix/oCxp8QymHnZO5opWcN43JMjtEw0C7oaxLVhws6BdgW5d/t5
         rokg==
X-Forwarded-Encrypted: i=1; AFNElJ/bAnf4D092iR0w+yj5vGBwP1zU0VxsKcFcwR9XCEvMj+8tpIb7qjhLYMHb9Z3GXmt95IDruwZYIZoReQSmSno=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUWrkqPCbp5sIgarpUAG8sBPE/v2lzwpQFq5cTy+b9xbmHv1Yn
	is4Cm2nZry1Wz/FqXGtQYgsHNluL2PzpjvveXG4cDjvvV/6EHEsISUa3k+oTCa4gBrTb11D7GJo
	t8zQqW067soTB+DghvcdzW/ExohePUtvdKZAkrugn
X-Gm-Gg: AeBDietUiXicpGRrRkT66F840B6+ZAdG47JkQDAEihm4DOHIWFHJMNsEmZQyI/vJyCA
	8JPGTiCDj02JCZwmVcXCoiCm1FDksaxRWEb7vcYsy3LX1YTqaDC/oyIlBfLwN+Qun9H7wX2C6wh
	LxOCkKWIm1dMCpNtewCX/Zn7iXrKEO9DvI2mk1DzMQgcXxdOxiR8KrSKBPhS1MjrsTL0sLBh6ra
	DAR4Fs56k8HkH59LT7Vg+7pYRiQaT11o33xQl8z6pcDaN/lvXn7A/9jYRbHIx4ybt0xCR1/K2fH
	K0xlcHlqqs5EaG5liMjEUYzLME/mA4UNo3EmU5xwErOie2nMR+9e+4AqEISrg7sJhRVHlOMR06R
	x4XTOdPsVWRkYRbY=
X-Received: by 2002:a05:6122:1789:b0:56f:1c32:bd07 with SMTP id
 71dfb90a1353d-5750c6b46damr742606e0c.2.1777674113098; Fri, 01 May 2026
 15:21:53 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 1 May 2026 15:21:52 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 1 May 2026 15:21:52 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <CAEvNRgHRpvsEjtr1A_Qz3d4oMEaffTxESavrZ73Jtt6OobCwhA@mail.gmail.com>
References: <20260428-gmem-inplace-conversion-v5-0-d8608ccfca22@google.com>
 <x7n77snnvvukofo3slopl74c5tmlb2t2un5qy5fq6eb3d2xt7e@6a6tixg5mdfc> <CAEvNRgHRpvsEjtr1A_Qz3d4oMEaffTxESavrZ73Jtt6OobCwhA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 1 May 2026 15:21:52 -0700
X-Gm-Features: AVHnY4I-FL7ow2VQuDyStuaACgF9aoh7fvjduqjprjOyhgxszANTKzDwmZOdoKM
Message-ID: <CAEvNRgHZJ3RONKBXqWWLu2f4G7FhAvsYY0iMowmHu7v-O+g=kA@mail.gmail.com>
Subject: Re: [PATCH RFC v5 00/53] guest_memfd: In-place conversion support
To: Michael Roth <michael.roth@amd.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev, 
	Jacob Xu <jacobhxu@google.com>, Darwin Guo <darwinguo@google.com>
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng <ackerleytng@google.com> writes:

>
> [...snip...]
>
>
> TLDR:
>
> + PRESERVE == guarantee that the process of setting memory attributes
>   doesn't change memory contents.
>     + implementation == do nothing in most cases, except -EOPNOTSUPP for
>       to-shared on TDX, since unmapping is a required part of setting
>       memory attributes to private, and a TDX side effect of unmapping
>       is zeroing memory,

-EOPNOTSUPP will only be for TDX, not SNP.

> + ZERO == guarantee that the process of setting memory attributes zeroes
>   memory contents.
>     + implementation == memset(zero) in most cases. For TDX, a future
>       optimization exists, where memset() can be skipped for pages that
>       were mapped in Secure EPTs before conversion
> + UNSPECIFIED == no guarantees
>     + implementation == guest_memfd does nothing explicitly about memory
>       contents. The implementation is pretty much the same as PRESERVE
>       except guest_memfd won't take into account vendor-specific side
>       effects of the process of conversion. Except for the test vehicle
>       KVM_X86_SW_PROTECTED_VMS, where memory is scrambled.
>

Found another use case internally for pre-finalize, SNP, to-shared,
PRESERVE, which works with the above smaller scope.

During SNP_LAUNCH_UPDATE, when inserting a CPUID page, the firmware will
check that the CPUID values would not lead to an insecure guest
state. SNP_LAUNCH_UPDATE will fail with an error and the page remains
shared in the RMP table.

Here's the proposed flow in the userspace VMM:

1. Load CPUID in shared guest_memfd memory
2. SET_MEMORY_ATTRIBUTES(PRIVATE, PRESERVE)
3. SNP_LAUNCH_UPDATE => get error since CPUID was insecure
4. SET_MEMORY_ATTRIBUTES(SHARED, PRESERVE)
5. Read shared guest_memfd memory, error if VMM disagrees
6. SET_MEMORY_ATTRIBUTES(PRIVATE, PRESERVE)
7. SNP_LAUNCH_UPDATE => successful, since CPUID is now corrected

Does that seem ok?

>>>
>>> [...snip...]
>>>
