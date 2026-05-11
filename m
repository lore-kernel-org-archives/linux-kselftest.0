Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A909D2F7AC1
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 15:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778512837; cv=pass; b=KccsBqWwIGOpDUXV699ymfF1PlFm93EyXRf/YWXtnbKtTCpPYOgrjv3JCQGZr7zczvlaT8uv1PStO17PmwnH8BhjgEbEEVHwHu7ARXrBqk3osJDis1LS6R+niNgdNqMzRNzoeLmw3mgyvrwYXoa89dyq9dPHkJTetVsC2eqEO1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778512837; c=relaxed/simple;
	bh=Xz4fYGbS7i/Q6Qi38Fw9U1gRgtcym24JZtgZTH7Ivpg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=InaJKWyBOENAz3iDzObWz1HKAuckCq+RKs8yd8wXSLUn4hkYiTCL043yS04PLUa5+XelyaLj2l56QS9bn5ZwCvGdxIW6m6RdxMfohkrtbL1BMXYXUZKIcl2c/2H6Y5KcwOa+9ChqG+4RP7RwAIL1xWLCSOjKWe7/2il6T6z6gzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oIYYIH/0; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oIYYIH/0"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-50e61648f10so8031cf.1
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 08:20:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778512834; cv=none;
        d=google.com; s=arc-20240605;
        b=CsoiKlASCU62f/Ly2RKACvpG7+EbENGXmuKluD1InEFMyylWeeAB0CLfhj4PkNq6G/
         F3RTUm5e0qZBUVz0btOdqgn0x0hVoO2wpIXA0oVTnfbj016G1bppJi8MeZqglWkYrDiT
         qUlvNQ4WlXN/aAs5zlMB7dYc449QTyt9aM7kqEfWqVpRfCaYgaOMDrytJYepBgDl3lOM
         EjA7r/yE/crbTcSCUbb4xzGZdDqnaOs2LxP9CVezATJzWeQ426gxMqTLtqLWbrD1+ac8
         BYW9vbYifjxtFTexfR6GlOsKWKPqV/EH3HpNirc8NZ/xF0amVNu3wV0ok5N0+GbE+DYs
         UOtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=y5WEI3bc+jKa5pFUDTyUeMXlg9f3nphKAR2eDCdRxOs=;
        fh=CflVhOHcmFw7guUFuEl0Vn9r941i49N8TV7cRLnnFyw=;
        b=Ij3dILTKx0+mpa/Pjeko9KjK32DIKYjX07wAqlwBl+vdom78zV3LIa79wmh0GuAMJ2
         ji3k1wA9znjoh9nKJUKo/bSVPTfrsXgtY+9QnJFe5vGTKz2yxF1zrupdxFk6BeXnt5HS
         Vz0g3Wf4oy0lV0nnAYWC3QQ45x2xB0Qlhy0D00oaMVyY0dJ16rmxHdQUuH2H25lbkBCA
         0dPL9zjFyfnjnYb1eNoXuPs2Nzvyt7tFmT5ER2MyrnL1TuE8vKREBuKFEOrEQO5IGWTr
         mbwwy8jbSdfkhRaTv1k51RxcM7TIFozGf3zRR/3g7itkCu/LHcnuDlVoJsmK8UNCPly9
         T5GQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778512834; x=1779117634; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y5WEI3bc+jKa5pFUDTyUeMXlg9f3nphKAR2eDCdRxOs=;
        b=oIYYIH/0AlhWSmOV/8humSiDKOr8H3eHmdiCR7ChUQzr4Iz5n9vPUjeK+im49G9Ya3
         /ZuS5nPJgLMd4dH+OPN0YoAY8+gvgN++3NbJPW/Qsr7pOfSbNzCRNzU0shuwc/44KIHq
         Kt12VmdJ/3gB4qQKAfU29sbAUgVvE+N9l5EE5/ffKICMrxzsfAwCjkSRT5F4qaX0vYnh
         2Us8kfCXC7/vT/W5My4j3VoQqhB3Bp673t6mA0pkpblkjAuzwzIq2ZSn9pB79SnJNo3t
         9PhDvsIGVe26arsIaumzFFNea5SSWm71zb54yMr5Mn9Ik5SvQelHq7YZNx0dN2qo9wDH
         lBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778512834; x=1779117634;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5WEI3bc+jKa5pFUDTyUeMXlg9f3nphKAR2eDCdRxOs=;
        b=AI6jyMrrE2dJ9QmUdjukUEmHJT5fAn9k/l/ooMa5W1T9ltwGtROI0e66Qw2X+Zw+XM
         5oy88xlvjol9PiOy2LBk27OIgPjQKO7IDwt2BNa81EBNYvVwU03W/ARROedr2YmSyuH2
         aIHxv10uFtUC1oDVzwpdwfa3NHhJxwfbysYvdyFAyKupJarkNFMWvH0fmSKXRhZE5Ky9
         WshMMxj3qARz1jbzoI3IlruhpLGqP1LHP5XnGm4q86r43z3598rBI3GBfoFk8UfeRO2q
         xN4aZ55aK4wjjARBWj2SFRjG9ekXtrstjwdsRcT4tqYtWMrBHj0czhigzadoverL4uF0
         KOEg==
X-Forwarded-Encrypted: i=1; AFNElJ9sFfMrwd6OclJ3RDfPwBcK9/0Xj3cSJUEUUOZUGp4cZbIyq+MNh4OMcvaIXvwZZ0AnPP/RGSgMzXG3l25UT/8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKXS0rRfhya9W57YhGQlrkMev9FyLtde8YgqKbYrp9KYtVvNuC
	I8S2SAzdiFJYEoO5iRP40aKl4vHsVQAmYxn79d/BOTnwG1ww2kRWTkDF+TgshwnEsEUxKVctrNs
	yMuNBG0stdaQ7SnUM3xlnAPO4r4sWQMySU6og3Oah
X-Gm-Gg: Acq92OEcXCzlBVjlpwK0mhWbtqAEZ3YyMB1121jXXPvyCORVE1pdc86pfhOkYVz3C7Q
	Bkfvx82jtsEpNG3ycjC3bfiDrJzUXjOZvPI0PQER5fvk72K6eOELjmcLrOl9GrRzBM8QUE4zhZA
	E2hDGOBXsmN0GN7kSgRN55obkbLFr8DL+um6eOOtq1EyacAHpkv6lcoZuYG6LrbdL75GpLuw4cz
	UM89nDMV/0c+PPfXNTHF98TvUmr1FCcTpEqeMG/6Eye/r7Ex2w1B4++/A+axerneG0433K1Zdxe
	PPE4sUZ9L59jY1whK8k=
X-Received: by 2002:a05:622a:152:b0:50d:edb1:6bd1 with SMTP id
 d75a77b69052e-514a04b4d5emr2366971cf.13.1778512832483; Mon, 11 May 2026
 08:20:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511113759.610924-1-tabba@google.com> <20260511113759.610924-3-tabba@google.com>
 <agHugdIrptaXZW-2@google.com>
In-Reply-To: <agHugdIrptaXZW-2@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 11 May 2026 16:19:55 +0100
X-Gm-Features: AVHnY4K0xwc8Hb8-5C7f-YejfzbLAhjXF8he_JFEhS_49b6vZjQIeDztW1ArGj4
Message-ID: <CA+EHjTw1z7ROF7u0fKqxDGao7S1kELxNWtyWhLoPQx5uwVfuWQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] KVM: selftests: Fix FD double-close in kvm_vm_release()
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, 
	Ackerley Tng <ackerleytng@google.com>, David Matlack <dmatlack@google.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 May 2026 at 15:58, Sean Christopherson <seanjc@google.com> wrote:
>
> On Mon, May 11, 2026, Fuad Tabba wrote:
> > kvm_vm_release() closes vmp->fd and vmp->kvm_fd unconditionally, and
> > kvm_vm_free() calls kvm_vm_release() at teardown.  A test that calls
> > kvm_vm_release() and then kvm_vm_free() without a
> > vm_recreate_with_one_vcpu() in between double-closes both FDs.
>
> That's a test bug, no?

Fair point.  Let me describe the actual use case and then I'd like
your guidance on which way to fix it.

The pKVM selftests I'm preparing need to verify that protected guest
memory is zeroed when the VM is destroyed before the host regains
visibility of those pages.  The test pattern is:

  vm_userspace_mem_region_add(vm, ..., GPA_BASE, 1, GPA_PAGES, 0);
  /* run protected guest, which writes/shares/unshares its memory */
  ...
  TEST_ASSERT(get_proc_locked_vm_size() > GPA_SIZE);   /* still pinned */

  kvm_vm_release(vm);                                  /* trigger destroy */

  /* host_mem is still mmap'd in the test process; pKVM should have
   * zeroed it before unpinning */
  TEST_ASSERT(is_zero(region->host_mem, GPA_PAGES * PAGE_SIZE));

  kvm_vm_free(vm);                                     /* tidy up */
  TEST_ASSERT(get_proc_locked_vm_size() == 0);

I used kvm_vm_release() because it's the only public API that closes
vm->fd to trigger kernel-side destruction.  But the existing callers
follow it with vm_recreate_with_one_vcpu(), so the "release + later
kvm_vm_free()" path isn't exercised today.

I see three ways to make this clean:
  a) This patch: kvm_vm_release() becomes idempotent for its three
     FDs, matching the kvm_stats_release() idiom it already invokes.
  b) Leave kvm_vm_release() as-is and add a dedicated helper, e.g.
     kvm_vm_destroy_kernel(), that closes vm->fd to trigger kernel
     destruction while leaving the kvm_vm struct intact for
     post-destruction inspection.  kvm_vm_free() learns to handle the
     half-released state.
  c) Something else entirely, e.g., the test should manage vm->fd
     directly and not rely on library helpers for this pattern.

I lean (a). (b) doesn't really avoid the change, as kvm_vm_free()
still calls kvm_vm_release() internally, so either kvm_vm_release()
gains these guards, or kvm_vm_free() grows new "already half-released"
state, or kvm_vm_destroy_kernel() open-codes the same guarded closes
on every FD it touches.  (a) is the minimal form, and it lines up
vmp->fd / vmp->kvm_fd with vmp->stats.fd, which kvm_vm_release()
already handles this way via kvm_stats_release().  But happy to take
(b) or (c) if you'd rather not broaden kvm_vm_release()'s contract.

Cheers,
/fuad
