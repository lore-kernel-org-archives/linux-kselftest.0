Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093E43803D3
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Apr 2026 12:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775219779; cv=pass; b=a+nxHSTGHSXBbVWLNEf9Ub8aaTRUjETEa7/JapaLs5sHyllsDKCcJJuby2/q0fgYOjyTrSgqOpoKzqCtuJU17uC45cEI8EHpr8FC6rYsrgK6MWzvsWatwG/MfBlZI28ULT1ZQkPmSHAml3XpopD8QG2ZTs9Ph2Imbg0PfrjZ6Gg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775219779; c=relaxed/simple;
	bh=u8cJQTyOXgXzVAjhcRMpeP0M/QKFpl9SwZeWX3+nqRU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IXeAQZBqg/7tzF8avFzxkgREpN7GJBrIAq4NOQVNay4O40BABEi+ZBFID/n+ZrkTMuKLx4iW3WDK/9pQAPNiIUK09/aN7I9wbyh82PF6ryWi3/98Gu5LJBmvYdVgNVZVG0RTX4ky6Zivli+9X3ja9CVhYorzyjs88zYbfZ6zkMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b=FY6136lj; arc=pass smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b="FY6136lj"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7d7d4ebccf7so1719678a34.0
        for <linux-kselftest@vger.kernel.org>; Fri, 03 Apr 2026 05:36:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775219777; cv=none;
        d=google.com; s=arc-20240605;
        b=NefD73uFovhK/7XUmY8CXyfimqDV8wK5TmL6TmSGsNCkGycvzjGnNMrUEP9SH13U2O
         7PtHZs2LrR/PVm13C5jA7+oimvHLjdNZKFPWr9ysJmdpd902ICCh86gtUp7jOHrOF9ih
         77jKg4vv8zUcVVPdaBvU8pjeFWDP1XYdsufYGOR2a8JigzCS1N6gZP9M72SrIj8CEcj7
         3AFsqy2+4O46xOZTcQMvdhTxt6hZQgfSgmCdZqiGDZdYc1mqWrAMLAEnfr6yBBN9dGdz
         lVLjOP1b2PSH3Iqy2mXxhq5M/4sgG7mT1sTCgX8J1rZN6NdrdRmwtNG97L4abjoZkTpq
         bS9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f489z9Q14+/QBLo/ZJR97CzCHDWPhtl1lFkJsX7ZtzE=;
        fh=xl9O2rygO/RrFDFVNZZIKfpliuUV8c2MlJBfxjte02I=;
        b=JDRN0tl0ozknVBvw0rxXlEsW7MzkvqG/za8yvZVpMhHiuyv7+BygIBRxusnl6rpamZ
         meP+wzPDXK9YbfTjQ5ICqzV1jebh4zcIKznhI6S5t7kth6r5sByUETuDiL4KeLTGt8Qm
         nkVls5M8xth5gd6UURAFAjXyN88DXoRr+W7c7hWEr/d6SfRehOzpMDfsvVPNc6y+thqj
         VOrL3Xw1WC9+9VCbVwCS8Hs8HfcrDlsCuTqoHb4aG6KZSg7szBTAnDun2l7ULZUWXzR/
         /w2BB7EUrMIr5yALtkaY/wZigAp4g9LkaIxjfvLYyZSTzyVwuoPDXLSnSL7uHDmPwhsm
         0wMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1775219777; x=1775824577; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f489z9Q14+/QBLo/ZJR97CzCHDWPhtl1lFkJsX7ZtzE=;
        b=FY6136ljR/kVvLi79Ko0SPAa46k/apW4mY/feQCgmkkVwekzpfu8VsLR6FbwGtA0DS
         55VD0EUmUQPr3N/xtcUD00RUpzVUkz5f+6NzbVdulhiv2auTS1MseqO9Z4B4YnEFYXHk
         ur2B07lHjLLfhmY/YQhKJ/V9RJzlf0Nbjj/bjM0eDOKzRuwqesap8O4ftX5ejubOyb6Q
         OIO+nGjRgVT5oacbI9VO8Xb7hALKEHKYwCk44UuNfxL1rA+d5DqJmRsw86PF4emiyr4Z
         Z3aubbCTeUY2kcZRsyfK8IhL1ER1mCIU9yS7FeGESZCGjBI4jsNJmaDAolkx9mG/CT49
         60cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775219777; x=1775824577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f489z9Q14+/QBLo/ZJR97CzCHDWPhtl1lFkJsX7ZtzE=;
        b=ab5LpwC2ufhpnt6JqEamUeEum0yE88cqMTOKW7X4xGvTs5iRRgAPrW5WYbDLCXod4Q
         IqmMOUQ4T0pzWdF8MthTU/osWdAfjbq/JamtpLbGRO+7UwrUMsqEz3hGZMtV/Upz+ro2
         fItIA/1c8Y0fIO0sXgmETOHItvx/dgTtkziMJrLuYualx/iQNpAbAkXrptvk9bdB1+wi
         JB6mPDpoxQ2TkbrDa8tVd9RUX5ll0YJP7oUj7JjF/1/IzRTVA+un1gSMlZ2yVkcM/NMr
         amd7zNBcuvQfaAtTvdSTMxyh0UnBhlWmOQACyrrj+frW3VeZcwQbGT2sXLcMov65CRpo
         9Tfw==
X-Forwarded-Encrypted: i=1; AJvYcCVOROzPu2i6oc+H6Cxo+wp/qRGStoJjk+j8AkDTwNgnAWI3V5m1MymKyfWSapnE+emedei+4iIVzAHPLcNwdlc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQjkn+i3qNTgO0wOmOgXT26xvsBHnPRgN9nU9lKdwzsn3MfDYM
	ktgePgxuDC13xgC90H4EWRtjSPdteVHMsvIaTOfoSoLrqdiJFrHnsPzSlAPV4x6jSZ+Sda/zmlG
	gGeG5ALwmui6uPhn0oWJlmgMQl/AldYV37GIHvjWvjw==
X-Gm-Gg: ATEYQzw7RroRJ+0HHqT5xudj7Vds3N1TGfO4PQZzFbNzYMH9e7m3aE+uv0E89xnQi6/
	N0QqoHncgKWC2rWbl+pxaezYhHPMY9rEOuc7pMvl6EJPP7rLT3GXpgPbqvikrcdaOMLJN7k6NbP
	wppdTsKSgCCuyua0ob+A6RteDFp+2nSDf56IrgGAsS9DjOJP2kHKaRPk/mkH2t/ZR9rQ3eby2Kv
	YbAaj9wJJJyKSYx69aiLGNhxWSPVtJhojN7S9201J7eWoE5yE4OPKxSJHZ8izqx82fJfUH3M2Jd
	0Pf8cTXeIndqLTa4LtK4enQjbByEExn07cShouiMOJK9N4Zz4XPyilOmGXZ3CO0y5KUJiwdqzYw
	D2uSrRrjtYO4LGRzwU/tAoxwCKvA=
X-Received: by 2002:a05:6820:f024:b0:67d:f56f:fe00 with SMTP id
 006d021491bc7-6822064c872mr1411396eaf.49.1775219776853; Fri, 03 Apr 2026
 05:36:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 3 Apr 2026 18:06:05 +0530
X-Gm-Features: AQROBzCZaj5NdnrddgbMifGi2nGpuLv9sXk2KqbS9U2BYMG_GPqE8MDkvi1tBQM
Message-ID: <CAAhSdy3EDro0fOTh+Hi6s6DUU6ENg+ufuUQqTG70g8xpSy7Keg@mail.gmail.com>
Subject: Re: [PATCH 00/27] Nested virtualization for KVM RISC-V
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atish.patra@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	Shuah Khan <shuah@kernel.org>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 1:30=E2=80=AFPM Anup Patel <anup.patel@oss.qualcomm=
.com> wrote:
>
> Initial nested virtualization support for KVM RISC-V. Using
> this series, we can boot Xvisor inside KVM guest and KVM RISC-V
> insmod also works inside KVM guest but we can't run nested guest
> at the moment due to work-in-progress G-stage emulation (or
> G-stage page table walker).
>
> Patch01-to-Patch09: Fixes and preparatory changes
> Patch10-to-Patch23: Actual nested virtualization support
> Patch24-to-Patch27: ONE_REG interface and get-reg-list selftest
>
> Upcoming work on-top-of this series include:
>  * Software MMU emulation for nested guest (aka swtlb)
>  * HLV/HSV emulation
>  * Sstc emulation for nested guest
>  * SBI NACL for guest hypervisor
>  * ... and more ...
>
> These patches can also be found in the riscv_kvm_nested_v1
> branch at: https://github.com/avpatel/linux.git
>
> Anup Patel (27):
>   RISC-V: KVM: Fix error code returned for Smstateen ONE_REG
>   RISC-V: KVM: Fix error code returned for Ssaia ONE_REG
>   RISC-V: KVM: Check host Ssaia extension when creating AIA irqchip
>   RISC-V: KVM: Introduce common kvm_riscv_isa_check_host()
>   RISC-V: KVM: Factor-out ISA checks into separate sources
>   RISC-V: KVM: Move timer state defines closer to struct in UAPI header
>   RISC-V: KVM: Add hideleg to struct kvm_vcpu_config
>   RISC-V: KVM: Factor-out VCPU config into separate sources
>   RISC-V: KVM: Don't check hstateen0 when updating sstateen0 CSR
>   RISC-V: KVM: Initial skeletal nested virtualization support
>   RISC-V: KVM: Use half VMID space for nested guest
>   RISC-V: KVM: Extend kvm_riscv_mmu_update_hgatp() for nested
>     virtualization
>   RISC-V: KVM: Extend kvm_riscv_vcpu_config_load() for nested
>     virtualization
>   RISC-V: KVM: Extend kvm_riscv_vcpu_update_timedelta() for nested virt
>   RISC-V: KVM: Extend trap redirection for nested virtualization
>   RISC-V: KVM: Check and inject nested virtual interrupts
>   RISC-V: KVM: Extend kvm_riscv_isa_check_host() for nested virt
>   RISC-V: KVM: Trap-n-emulate SRET for Guest HS-mode
>   RISC-V: KVM: Redirect nested supervisor ecall and breakpoint traps
>   RISC-V: KVM: Redirect nested WFI and WRS traps
>   RISC-V: KVM: Implement remote HFENCE SBI calls for guest
>   RISC-V: KVM: Add CSR emulation for nested virtualization
>   RISC-V: KVM: Add HFENCE emulation for nested virtualization
>   RISC-V: KVM: Add ONE_REG interface for nested virtualization state
>   RISC-V: KVM: selftests: Add nested virt state to get-reg-list test
>   RISC-V: KVM: Add ONE_REG interface for nested virtualization CSRs
>   RISC-V: KVM: selftests: Add nested virt CSRs to get-reg-list test

Patches 1-to-3 are already merged as fixes.

Queued patches 4-to-9 for Linux-7.1

Thanks,
Anup

>
>  arch/riscv/include/asm/csr.h                  |  17 +
>  arch/riscv/include/asm/insn.h                 |   9 +
>  arch/riscv/include/asm/kvm_gstage.h           |   2 +
>  arch/riscv/include/asm/kvm_host.h             |  29 +-
>  arch/riscv/include/asm/kvm_isa.h              |  20 +
>  arch/riscv/include/asm/kvm_mmu.h              |   2 +-
>  arch/riscv/include/asm/kvm_tlb.h              |  37 +-
>  arch/riscv/include/asm/kvm_vcpu_config.h      |  25 ++
>  arch/riscv/include/asm/kvm_vcpu_nested.h      | 163 ++++++++
>  arch/riscv/include/asm/kvm_vcpu_timer.h       |   1 +
>  arch/riscv/include/asm/kvm_vmid.h             |   1 +
>  arch/riscv/include/uapi/asm/kvm.h             |  36 +-
>  arch/riscv/kvm/Makefile                       |   6 +
>  arch/riscv/kvm/aia.c                          |   4 +
>  arch/riscv/kvm/aia_device.c                   |   5 +
>  arch/riscv/kvm/gstage.c                       |  14 +
>  arch/riscv/kvm/isa.c                          | 259 ++++++++++++
>  arch/riscv/kvm/main.c                         |  13 +-
>  arch/riscv/kvm/mmu.c                          |  18 +-
>  arch/riscv/kvm/tlb.c                          | 135 +++++-
>  arch/riscv/kvm/vcpu.c                         | 117 ++----
>  arch/riscv/kvm/vcpu_config.c                  | 130 ++++++
>  arch/riscv/kvm/vcpu_exit.c                    |  62 ++-
>  arch/riscv/kvm/vcpu_fp.c                      |   9 +-
>  arch/riscv/kvm/vcpu_insn.c                    |  46 +++
>  arch/riscv/kvm/vcpu_nested.c                  | 258 ++++++++++++
>  arch/riscv/kvm/vcpu_nested_csr.c              | 389 ++++++++++++++++++
>  arch/riscv/kvm/vcpu_nested_insn.c             | 140 +++++++
>  arch/riscv/kvm/vcpu_nested_swtlb.c            | 146 +++++++
>  arch/riscv/kvm/vcpu_onereg.c                  | 334 +++------------
>  arch/riscv/kvm/vcpu_pmu.c                     |   5 +-
>  arch/riscv/kvm/vcpu_sbi_replace.c             |  63 ++-
>  arch/riscv/kvm/vcpu_timer.c                   |  24 +-
>  arch/riscv/kvm/vcpu_vector.c                  |   5 +-
>  arch/riscv/kvm/vmid.c                         |  33 +-
>  .../selftests/kvm/riscv/get-reg-list.c        | 106 ++++-
>  36 files changed, 2244 insertions(+), 419 deletions(-)
>  create mode 100644 arch/riscv/include/asm/kvm_isa.h
>  create mode 100644 arch/riscv/include/asm/kvm_vcpu_config.h
>  create mode 100644 arch/riscv/include/asm/kvm_vcpu_nested.h
>  create mode 100644 arch/riscv/kvm/isa.c
>  create mode 100644 arch/riscv/kvm/vcpu_config.c
>  create mode 100644 arch/riscv/kvm/vcpu_nested.c
>  create mode 100644 arch/riscv/kvm/vcpu_nested_csr.c
>  create mode 100644 arch/riscv/kvm/vcpu_nested_insn.c
>  create mode 100644 arch/riscv/kvm/vcpu_nested_swtlb.c
>
> --
> 2.43.0
>
