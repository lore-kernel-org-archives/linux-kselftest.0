Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FED40DFCF
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 00:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775520469; cv=none; b=b7e+9Rq+jegD0HmLz/lZ0LPtKO69zFxyxEkCbLF9W9EYlzSxGfSzXBB2YrG4xv51iHULe1lfJ9g3HjRZd0VRiixY8Ok3hUANOu+W2LR7Nwf6oDmkYxRPd4jO9gPGBsFlj0iNbib/JwkXbIdPF0qiQvwM9wfNRyveksBjqzT3kQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775520469; c=relaxed/simple;
	bh=809RIiG+Jp1NRmRL/hbEdVrCwlECLKkXhLo/V6OrSlk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KhgYKtCIrwxFa+tsVbIWpqZtUWj6wcNjFXNcwk/Bnq5YeQO0wA49fa7E7qm2AGeGi2zFX8qIBzryFg9LyfncBo0g8/Y/mc55zarWf/jUj3icooBrCwIs4gwCq8/youtRncM2mv4pnwScYRaSdSNRtsUzKNOdDraf74YqANrZ7/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aDtFuT4q; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aDtFuT4q"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c7423ba5342so6942703a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 17:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775520468; x=1776125268; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CVmJV5bEdLCvGMFJH8cmPdTc292jFDXXIClpGMN6ALE=;
        b=aDtFuT4qPROfAgyM9nEYMaCQUxt9OKP+bQmEHZpMf1LBSEANEbt70r0XqWPGV3U+3H
         EeWT/d4Lcqo9vYR1mJpgS12DZBP8qYFJ18CDWzs+hBMDvYrP4gwWsn2dnbVP4+pcaaZT
         ZnBv/pVjyxUNUYiJ9GGWfzeKKhxBrTxAAY3AVN6A2ykWyA9NO902g/+NB9EN1jHhUb1m
         /yh6um8uHe/bSsJN2SeWqDtSzzHmdffxGAvEqkhB6+4hlCMHJFpg0VSm+i0qOHDJkrPY
         8h9BqnIDjHcj9R2MxFhM3h+rlVPhGPQ1JapQWOYrhlnn3Pz5mxpFkk/5t9U2TetgPvIP
         i34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775520468; x=1776125268;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CVmJV5bEdLCvGMFJH8cmPdTc292jFDXXIClpGMN6ALE=;
        b=WbZT7vQ/D3cg7QWLyK3ELLrRAwFf+uvLvvEC0+071UhYNVqRBH7jIWfyDdMSXc/yLS
         bHSdZa4zAWJay4NS3GrGQkKI3AXnxvfTFyCFj6cDgbmnMGQfpJ2Xuq9xETlNe5I4Ujkc
         hS+9lkyd70mA6lNNyx5PlzgL+Xo+tNN76tdR7HpGEvlOv4Opj9E/DmCo63KkoaQRok8o
         SxUhuEPz7+cGyEfElhAtBFO4jC8rWKlLo7ciQp8asz6SS67WJEQb0Y4oGz0TBDwJIkAq
         vjMszk6pZa9LNXq7lVb9D5EPtrrZdxA7u3sA9mC1nAvX0qVM+F48Oq8JMyDZbXkDW9Ut
         5DJA==
X-Forwarded-Encrypted: i=1; AJvYcCW63uEFQSUVIWFFPge8tqJneUkH5YZmPrFr1atWAo7TPN8JNU+cm4Ui9I/aiws6cZDgAILhkptAD0uUuaaWIkw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWo2DU/SUDZGPR2mTdlVAkSQ/84FUBezz7bCX8q7fPyefxzBMs
	/GzkvoFENulwZ7CPa27xHtYZ0a5cJIdxt7leX92QfebiPRD3u5mBWVxvHABpw7ILV69rXuM9h/J
	jnesYnA==
X-Received: from pfjf14.prod.google.com ([2002:a05:6a00:22ce:b0:82a:6d96:5a09])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:845:b0:827:370b:2695
 with SMTP id d2e1a72fcca58-82d0db7d9famr12902671b3a.29.1775520467378; Mon, 06
 Apr 2026 17:07:47 -0700 (PDT)
Date: Mon, 6 Apr 2026 17:07:45 -0700
In-Reply-To: <20260327234023.2659476-10-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260327234023.2659476-1-jmattson@google.com> <20260327234023.2659476-10-jmattson@google.com>
Message-ID: <adRK0dyF9QAsZyVz@google.com>
Subject: Re: [PATCH v7 9/9] KVM: selftests: nSVM: Add svm_nested_pat test
From: Sean Christopherson <seanjc@google.com>
To: Jim Mattson <jmattson@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Fri, Mar 27, 2026, Jim Mattson wrote:
> When KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT is disabled, verify that KVM
> correctly virtualizes the host PAT MSR and the guest PAT register for
> nested SVM guests.
> 
> With nested NPT disabled:
>  * L1 and L2 share the same PAT
>  * The vmcb12.g_pat is ignored
> 
> With nested NPT enabled:
>  * An invalid g_pat in vmcb12 causes VMEXIT_INVALID
>  * RDMSR(IA32_PAT) from L2 returns the value of the guest PAT register
>  * WRMSR(IA32_PAT) from L2 is reflected in vmcb12's g_pat on VMEXIT
>  * RDMSR(IA32_PAT) from L1 returns the value of the host PAT MSR
>  * Save/restore with the vCPU in guest mode preserves both hPAT and gPAT
> 
> Signed-off-by: Jim Mattson <jmattson@google.com>
> ---
>  tools/arch/x86/include/uapi/asm/kvm.h         |   2 +

Don't update uAPI headers in tools/, they're not used by KVM selftests (perf
folks will sync them as needed).

> +#define PAT_DEFAULT		0x0007040600070406ULL
> +#define L1_PAT_VALUE		0x0007040600070404ULL  /* Change PA0 to WT */
> +#define L2_VMCB12_PAT		0x0606060606060606ULL  /* All WB */
> +#define L2_PAT_MODIFIED		0x0606060606060604ULL  /* Change PA0 to WT */
> +#define INVALID_PAT_VALUE	0x0808080808080808ULL  /* 8 is reserved */
> +
> +/*
> + * Shared state between L1 and L2 for verification.
> + */
> +struct pat_test_data {
> +	uint64_t l2_pat_read;
> +	uint64_t l2_pat_after_write;
> +	uint64_t l1_pat_after_vmexit;
> +	uint64_t vmcb12_gpat_after_exit;
> +	bool l2_done;
> +};
> +
> +static struct pat_test_data *pat_data;

This is ridiculous.  Whatever AI you're using is reinventing sync_global_to_guest()
in a very obfuscated way.  Drop the indirection along with the params and the
full page allocation, and just sync the damn struct.

Actually, this is even dumber than that.  The "data" is only ever accessed from
within the guest; it's used to pass info between L1 and L2.  Drop the struct
entirely and just write global variables.

In general, please clean this test up before submitting v8.  All of the L2 code
is basically copy+paste of itself.  This is the second vibe coded selftest (AFAIK)
you've posted, and it has many of the same flaws as the first one[*].   While I'm
not opposed to using fancy tools, and the bar is generally lower for selftests,
the code still needs to be readable and maintainable.  This ain't.

[*] https://lore.kernel.org/all/aXJal3srw2-3J5Dm@google.com

> +static void l2_guest_code(void)
> +{
> +	pat_data->l2_pat_read = rdmsr(MSR_IA32_CR_PAT);
> +	wrmsr(MSR_IA32_CR_PAT, L2_PAT_MODIFIED);
> +	pat_data->l2_pat_after_write = rdmsr(MSR_IA32_CR_PAT);
> +	pat_data->l2_done = true;
> +	vmmcall();
> +}

...

> +static void run_test(void *l1_code, const char *test_name, bool npt_enabled,
> +		     bool do_save_restore)
> +{
> +	struct pat_test_data *data_hva;
> +	vm_vaddr_t svm_gva, data_gva;
> +	struct kvm_x86_state *state;
> +	struct kvm_vcpu *vcpu;
> +	struct kvm_vm *vm;
> +	struct ucall uc;
> +
> +	pr_info("Testing: %s\n", test_name);
> +
> +	vm = vm_create_with_one_vcpu(&vcpu, l1_code);
> +	vm_enable_cap(vm, KVM_CAP_DISABLE_QUIRKS2,
> +		      KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT);
> +	if (npt_enabled)
> +		vm_enable_npt(vm);
> +
> +	vcpu_alloc_svm(vm, &svm_gva);
> +
> +	data_gva = vm_vaddr_alloc_page(vm);
> +	data_hva = addr_gva2hva(vm, data_gva);
> +	memset(data_hva, 0, sizeof(*data_hva));

Ugh.

> +
> +	if (npt_enabled)
> +		tdp_identity_map_default_memslots(vm);
> +
> +	vcpu_args_set(vcpu, 2, svm_gva, data_gva);
