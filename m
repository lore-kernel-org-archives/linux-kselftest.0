Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE73F328243
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 18:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779215706; cv=pass; b=j+eoVKxwGFmCNFTKnvWhC/wElKbl92Y7Avxa6TQ7Qf3rN83aVQO3c9vXhjmYDwjfpednlrlDzq2jx5G9Mkks1Q3uC58TTT4cSjsM9vYCKvXpENR8KgkaduEnqMmAaH/aoGI7fds8Y65lCYlL+wRBMGsXPm1mjtLx9m/heTCr4oA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779215706; c=relaxed/simple;
	bh=KGwOof5+ZrWk7fQk8HZziiUwEIlVuaXd+B/75nP5r7o=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RSzRkekzSWQvg7mQfbVCFv665xCD3O3YIwJhDLrKvy9evUdVapxrwJhwOWxoiU4t0sDfFUKhhJ/IJB/DIjaalMXYCP2MqxIMV1BpRRvAyHDwwp0DhQsXf/E7yVkjmqdWgzB5nNpO+7xJqZ2pgGTjSPQz+L8vjqPaGwkrPsW3gNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gGAELiIj; arc=pass smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gGAELiIj"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-575267e3398so3216159e0c.1
        for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 11:35:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779215703; cv=none;
        d=google.com; s=arc-20240605;
        b=Aaxm1ob8FQN6kO5hbwYHtnSSSEJA3qafuOqzNRbyd0V43LkrONTplhrrcZf5Bo8HF2
         FAM8x6Vq04JUfaz82qCWDu2kMWQ55MhskmMFJJW5w4DjNWjKBMb4Y4Kndtuz9Py1/j76
         AIoY8KoNircJlns35UBsaSa3jD9LXY6c3cl8vMX9RFyrQi5sCA2OWFdOsChNJ1UC/KGs
         7Tc6QcqsMecL4uMYEWmy3oLpEVyepusFQNwGZTDX9niTTneIHenvhwXYmYkNFUcZjC4L
         eMCYzNfnSpDCfgSBz/CPOGh2m00tZH+cF6qg6Hea8mtAu24aB1jtyIVz+4AZ3a9F7FLq
         TFWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=g5YZm4UgAbGxYabjQSgq96Npr2NETq5PmOxXIUp4roA=;
        fh=bCvO+R6eXkc4CafKz4kb4nD3IqleYE1u/zZCG+vWw1M=;
        b=dYK6ld059WoV7ZE82pSQ/L3lsxrz8gYgASJGl77wSWtq899QH4pSpEln+ZDqVPSvzr
         aTCGfv1OZHm3rFKMqdYuBcvxg8w3RLfUv2unbPHb/QU97Br1guhjypzDU85Q3rUziXZr
         2daN6i3KLICTbYte54OkXb12ARrBprkS7nl9TAfEr62aFpRB8VlDRih569C4uRjYSW2o
         OrpnU7WOE+BNhzcJU85bqSMQl6NQt9Cb6fj9vkQMb/ugldzcGqDVq8Ja4DLk1XjwtBUl
         L/iQcudTNjBLvWkkckF/CDJRZvom6H+QnJHmy13AEiAJosfhN2pM1UTXOzDWalfSQPfi
         Iq9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779215703; x=1779820503; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=g5YZm4UgAbGxYabjQSgq96Npr2NETq5PmOxXIUp4roA=;
        b=gGAELiIjllEN2fO5gAg1oWXeDYJshtsvffzgK1Px5SGpE9SJIt5ufCwK3CHTtdnF8D
         wCyP2UeuOnlJu5f5bNS6wCYxJDbuAg6Dl0Z+3chkVT9KJvQJ1bCF+ikRTxM7lUwobhd/
         pMjtf8aGrSTwmfUOzZXrDxvIlA4ZMZQfgqtsarl7w9uciW6OmIBP6nM0Ovsng6okSutE
         3iuKJSZnSerFt9wqKESxm2LjUbNW5maq/Q5JgXw6Z67HWocs6pNxCdkhfzzmPUu3HLKj
         xDnEbIQTOG4uNqmn2+giEzxWysm0hE53qjRGxSH3Y6u6OIB0wNCwiT70YqUOAL37BMwK
         qyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779215703; x=1779820503;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g5YZm4UgAbGxYabjQSgq96Npr2NETq5PmOxXIUp4roA=;
        b=DQSLDh4jUGKud7a7X6NOQhWViKF4ZRkf38JfYZVNA70+2ksU3FUxcwdcFtxKiUbGqq
         fwpt90VUcdqvGaROjHTdzV2CbP/DbRR0NVTBFftRQAKen+zhoqgpP9tA6LqVyrh5L0wG
         suwi66hzdXzvM9C7D4QvodEi6oahLcQ+PHOpLzxbTNVjJby/bP8bxVNXA/h36jJCIiHk
         6uY5KDECmYHRhq1hORzG9BGX74U1W9QUqLUyw/1Kbkcl+BPYkaFu9fLmTWFfSsn7dwpy
         Qwxu0OxgkSr00lRnAdw9VnDIy8VmTEA3hrgx/QxHoEyLbYTcMHq/eCtyy7CkBXeBJ4RV
         ahQQ==
X-Forwarded-Encrypted: i=1; AFNElJ+MTDOr78SKj/WYtNAkpbqWqN2OEB90rwAuUexPRasK8TSkvhRPJe5HPyRvk1Fqef818kEPuQdl02KSjKBDjn0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx59nJVHigC2ENmZeJH6gBh+B3rvQHVi9Tv0E+miEi511h/SqXg
	mpRw9SQg28ISjR+u/Awho2IksvchyfGnEKIHGvdlI1TEEaG0rzEVZYfMF2ScwjZPOgyjeZNviFP
	KPkm7dan6v73vvvUseVqZZiWF2HeHdbbZtXng/5TH
X-Gm-Gg: Acq92OEpPbFF4LD0K9IC+Mnyn85N7d7RPYxJG1M+wp+NDsNt38OJ3nDEzWFkEcR/uPL
	CDpidBYAmU6vgKeLc7j1uoy5FuIMpGQB3qDZb/0eV6iQkbY4bVxSkHJ7HKrzHog2JDK4LfW2XYC
	s9ViFlVuTHJabosDYkmjUStuM0rOKCWraSaIEgrBMBplOutS1qPpBMDIEQm3UuvP+eE88O7od5M
	7cZmq+CnkCF4e5VDHHCMEd2ykkMX/qK5vb2xN9ooyC+EloXbJvE9gbO7cFtR2Ie8ugNAJmHZoWc
	UiHxsFlDi56DXw98GYNEN0el6JeVqZZ0jeMxHgdYMg752QMjLTE1G64mXwDRgNcVMxcdh+0y+GM
	tKM0X
X-Received: by 2002:a67:e70b:0:b0:62f:46be:8318 with SMTP id
 ada2fe7eead31-63a3cc0e937mr11563105137.6.1779215702359; Tue, 19 May 2026
 11:35:02 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 19 May 2026 11:35:01 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 19 May 2026 11:35:01 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <agt5A90k9lS9JPWp@google.com>
References: <20260518070943.2091287-1-ZongYao.Chen@linux.alibaba.com>
 <20260518070943.2091287-3-ZongYao.Chen@linux.alibaba.com> <CAEvNRgFgobnW+O=t32gu-0YDy0n7ZqvmdCtg+DzLT3uf0+BDeg@mail.gmail.com>
 <agt5A90k9lS9JPWp@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 19 May 2026 11:35:01 -0700
X-Gm-Features: AVHnY4JMb8xTVN3PiZl5iQlu_-bUy05sR1IlC9x-XipUxw6zHkFMz5hIRfmkZZo
Message-ID: <CAEvNRgE4o6C8P2jW_MGn=1BHxgmp183UTk_h5YkM+U_MCTMdzA@mail.gmail.com>
Subject: Re: [PATCH 2/2] KVM: selftests: Test guest_memfd binding overlap
 without GPA overlap
To: Sean Christopherson <seanjc@google.com>
Cc: ZongYao.Chen@linux.alibaba.com, Paolo Bonzini <pbonzini@redhat.com>, 
	kvm@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Tianjia Zhang <tianjia.zhang@linux.alibaba.com>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

>
> [...snip...]
>
>>
>> Since this test program is meant to test set_memory_region, should we be
>> retaining the original test? The original test is wrong in that it
>> doesn't test guest_memfd's binding, but it does test that
>> set_memory_region returns -EEXIST on overlapping GPAs.
>>
>> Perhaps to just test overlapping GPAs we can use anonymous memory
>> instead of guest_memfd.
>
> Eh, I see no harm in having both.  E.g. if we do this, then we don't have to
> explain why we're not testing the other case :-)
>

Makes sense to have both :)

> diff --git a/tools/testing/selftests/kvm/set_memory_region_test.c b/tools/testing/selftests/kvm/set_memory_region_test.c
> index 9b919a231c93..283392bcc3a0 100644
> --- a/tools/testing/selftests/kvm/set_memory_region_test.c
> +++ b/tools/testing/selftests/kvm/set_memory_region_test.c
> @@ -510,7 +510,7 @@ static void test_add_overlapping_private_memory_regions(void)
>
>         vm = vm_create_barebones_type(KVM_X86_SW_PROTECTED_VM);
>
> -       memfd = vm_create_guest_memfd(vm, MEM_REGION_SIZE * 4, 0);
> +       memfd = vm_create_guest_memfd(vm, MEM_REGION_SIZE * 5, 0);
>
>         vm_set_user_memory_region2(vm, MEM_REGION_SLOT, KVM_MEM_GUEST_MEMFD,
>                                    MEM_REGION_GPA, MEM_REGION_SIZE * 2, 0, memfd, 0);
> @@ -542,6 +542,26 @@ static void test_add_overlapping_private_memory_regions(void)
>         TEST_ASSERT(r == -1 && errno == EEXIST, "%s",
>                     "Overlapping guest_memfd() bindings should fail with EEXIST");
>
> +       /*
> +        * Repeat the overlap tests, but so that there is overlap in the
> +        * guest_memfd bindings (i.e. in guest_memfd file offsets), but _not_
> +        * in the GPA space.  Regardless of where there's overlap, KVM should
> +        * return -EEXIST.
> +        */
> +       r = __vm_set_user_memory_region2(vm, MEM_REGION_SLOT, KVM_MEM_GUEST_MEMFD,
> +                                        MEM_REGION_GPA,
> +                                        MEM_REGION_SIZE * 2,
> +                                        0, memfd, MEM_REGION_SIZE);
> +       TEST_ASSERT(r == -1 && errno == EEXIST, "%s",
> +                   "Overlapping guest_memfd() bindings should fail with EEXIST");
> +
> +       /* And now the back half of the other slot's guest_memfd binding. */
> +       r = __vm_set_user_memory_region2(vm, MEM_REGION_SLOT, KVM_MEM_GUEST_MEMFD,
> +                                        MEM_REGION_GPA,
> +                                        MEM_REGION_SIZE * 2,
> +                                        0, memfd, MEM_REGION_SIZE * 3);
> +       TEST_ASSERT(r == -1 && errno == EEXIST, "%s",
> +                   "Overlapping guest_memfd() bindings should fail with EEXIST");

I just noticed this is kind of odd, what is the purpose of "%s" and then
filling the string in with a hardcoded string?

>         close(memfd);
>         kvm_vm_free(vm);
>  }
