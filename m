Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E567402426
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 15:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778514305; cv=none; b=LPmZJLFQ5NH5ARIAzSOA07c/cG5eRcLkcpN6AEgq70qejS6y6L43NBjtWeUuk+YJCYxxhKvmpKT4TNM9XzTsL6TAt6SBGs1Lo5tgFdnsg9Qji9TCdG5u3EaMUMJ2sZksabwpDOHzEVYHoSMzr9XbiO0YMTaxroT8uEcwMdbbIow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778514305; c=relaxed/simple;
	bh=iU2gjtj7qbeTkgu4CbWGG/n6OHB2sDsVv1qEvA+SQj8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iRqFhSw5Mi/M8debvOC+N8tCcKN6dwxK6+lR7tHzHjYSOCHdSHS5hJL3f+Gyex8ZEuVIpfLhPnrgO/FSEKgycHeZ1ZZdTvcjPvS2S9tfXHt6aQPJw0H6SrMTFsutNNIw+5/zgSK/c1m17LVxmqPMBaVK3/FFF4h2mdDNAh1oqOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Mx96AbU4; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Mx96AbU4"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c709551ec08so5393500a12.3
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 08:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778514304; x=1779119104; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=quGxZdDzePyFN1sqDarFe9CnYNHrO/hP4QASdHelPT4=;
        b=Mx96AbU42KfmXQwcoagbaf/NvWrVoJQR4YbzP8yRJ07a9bv0GaGbcRMq3ZC6QWcQyb
         HHwnWb2rtFlrh2mrHj3akAantQQGiTbxyQvtigszO6QpdUsmm7D+S6KDlncKBymsI/Rq
         AOA9IpXf0pP+kmcNRpyIfSMFcp+2HwF/b9cr2Q5SnFLvZ7im7hWrNpSoxreGSVroo/Z3
         EoSDxurluc0RULGXe9NEezVNicx+BeRNN2ogAxCiU4omxy2eV9EYD7jHY+hxHZWUQB3h
         bO87r3f4G5TmzxjiLq1kvskoRBEExWo4sWKRn8V3kUyGogDYNWUQT3bgPrYubdyl/+Rb
         dwMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778514304; x=1779119104;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=quGxZdDzePyFN1sqDarFe9CnYNHrO/hP4QASdHelPT4=;
        b=JCyz9fpoJtghDzEpUpHx0SoXPnQX6AKE0zh77LfH0JHfoVImdK63PnzSISkpS67SHX
         pht8LhmG4wZFWHBGm1I46S3SDgwN4jIwIH2vW34jVHEM6yQOtFdNi6rZTq0V6n0EgOTL
         SidivumqPUIX81Bw7svJeeKYMcoFxH5AtaWZn9RRV87GkOnivfrw4HkVJqixZ2vjhzxz
         BidcteJ4pojnLN1SQVYzzgoS6jI3LK6zZre9Ycn+8y+dbXLvYE/jMdaE3fSeT/yS5Bbx
         5moa+r5YV1U4MbqDOwp+yGLdtrp2fIFH+ASnROoEwEoSZ+h7N0lnGLdbbLjuemKPkCDw
         gJew==
X-Forwarded-Encrypted: i=1; AFNElJ/vAS7R5xhr78b2KxUjIJdq1V6BpCGFup9n9M4A276Ao5/ulMBHFx7bCaXg/M8X/8rZzp6nYA7wfix7Hf8hrDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLPZrZUxmiWyxVtyDW2YN7K1xxdvP0A0r+Xe7uVG3t2XjmhwtN
	lx8fziwfnGBRSx0n8XJT05RWv1/+1i7tXnHj6Gg2Cp5e9MaXcSWjEOOB2Pf3N3ZFBrl7r1Lc86a
	CN1JTrw==
X-Received: from pfbg8.prod.google.com ([2002:a05:6a00:ae08:b0:83e:b5cc:11c3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:729a:b0:3a3:a55f:407c
 with SMTP id adf61e73a8af0-3aa5a911f3cmr27765927637.16.1778514303443; Mon, 11
 May 2026 08:45:03 -0700 (PDT)
Date: Mon, 11 May 2026 08:45:02 -0700
In-Reply-To: <cover.1766066076.git.houwenlong.hwl@antgroup.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1766066076.git.houwenlong.hwl@antgroup.com>
Message-ID: <agH5fjWOfWO1L8u1@google.com>
Subject: Re: [PATCH v2 0/9] KVM: x86: Improve the handling of debug exceptions
 during instruction emulation
From: Sean Christopherson <seanjc@google.com>
To: Hou Wenlong <houwenlong.hwl@antgroup.com>
Cc: kvm@vger.kernel.org, Lai Jiangshan <jiangshan.ljs@antgroup.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Dec 18, 2025, Hou Wenlong wrote:
> Hou Wenlong (9):
>   KVM: x86: Capture "struct x86_exception" in
>     inject_emulated_exception()
>   KVM: x86: Set guest DR6 by kvm_queue_exception_p() in instruction
>     emulation
>   KVM: x86: Check guest debug in DR access instruction emulation
>   KVM: x86: Only check effective code breakpoint in emulation
>   KVM: x86: Consolidate KVM_GUESTDBG_SINGLESTEP check into the
>     kvm_inject_emulated_db()
>   KVM: x86: Move kvm_set_rflags() up before kvm_vcpu_do_singlestep()
>   KVM: VMX: Refresh 'PENDING_DBG_EXCEPTIONS.BS' bit during instruction
>     emulation
>   KVM: selftests: Verify guest debug DR7.GD checking during instruction
>     emulation
>   KVM: selftests: Verify 'BS' bit checking in pending debug exception
>     during VM entry
> 
>  arch/x86/include/asm/kvm-x86-ops.h            |   1 +
>  arch/x86/include/asm/kvm_host.h               |   1 +
>  arch/x86/kvm/emulate.c                        |  14 +--
>  arch/x86/kvm/kvm_emulate.h                    |   7 +-
>  arch/x86/kvm/vmx/main.c                       |   9 ++
>  arch/x86/kvm/vmx/vmx.c                        |  15 ++-
>  arch/x86/kvm/vmx/x86_ops.h                    |   1 +
>  arch/x86/kvm/x86.c                            | 116 ++++++++++--------
>  arch/x86/kvm/x86.h                            |   7 ++
>  .../selftests/kvm/include/x86/processor.h     |   3 +-
>  tools/testing/selftests/kvm/x86/debug_regs.c  |  72 ++++++++++-
>  11 files changed, 178 insertions(+), 68 deletions(-)

One goof and some nits on patch 3, but I'll fix them up when applying, i.e. no
need for a v3.  I'll probably also add some comments and elaborate on some of
the changelogs.
