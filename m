Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB20633C191
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 21:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769032071; cv=pass; b=Lv3pjeRUhp9xQdZu3mfHhoWuKInkj8ZB3EJw6ozWRhBlEMlJ2rHoMPc9miC43diInyovWicabchq6scZkDzJbqmOPwWNKXcSrwF4fTgeZoi87Wlx1F+ux3HZ9UYYz9m/TjFMsZhmU3eFjRhnYi5tEqX0Bx7H7IMjuqZSjkwt4JU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769032071; c=relaxed/simple;
	bh=+SC1X+8LyP+plIAUHfI8oq5N+IITqjciS/3RpSDL8rg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ioneK4A96ca36/GTchYpFhAa9V0PRs0QBOrcNbFSkPrDpkZCYbCVatIcOYp4oGlaJ0dHHoewz7jEVri7T4kFpc7S2Y45YeQKl2Xxop/Sjgm80DZ09b9VGyz5QSpUkea7ubRmwhuV7pMOT1ZuyeSxGzxyVXuWRorAtx+hoMVMTJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxhXmvQh; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxhXmvQh"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b87f00ec06aso49463366b.1
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 13:47:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769032067; cv=none;
        d=google.com; s=arc-20240605;
        b=A/r+Kb5b9YN/TaRZ0o9SF+lDI+qc9AwzuFMIJYBEQzR3ZDalbXXh56juxo9r0uxXn2
         ssUyTtcLvz+Cp2C6h9wXHP0F6w6H4LT4Uq6FiyGZSiNw56/t2LHSt5l6g5MC9pMfD5ol
         2LOu8GtvTzOXKZoAOWSyBWDpY0MCGYIjO5deHc4+o7YUrMMQ+0vu/gQA2TJx+XIf8Me1
         4cxANyC/b7yfHna5LSYLAyZftA8THtHcywwdJv79bEQ1DZYxKYbdPiKG0JDKj/sEQIg7
         FUK2TSU35UbPWE9xdC60T1lpUfT9MhuLPhvveRlzbcnoABUQGYxer8HcMjwQrOJ/qnoa
         Ct+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TFgFOXxHcqqk/Chd6m6zZHG2pY2sV3c/ZZN0cSg34hA=;
        fh=3tEnbeBodev5DnM19CKzAGVkGRnanwkKQ5me73E+IYw=;
        b=eCOMXzlSx41FXpX2pHKnAdgNJKJF1DPa1fHWtfN4RkLay37Aw+qQRcUn2jaLA+sCH9
         jWVeIfW4aAT+URw6mZHCxveviwNSrr62aDWQFgWlKt3FF9FJJMm3qwvPTwIFSVqf21Gl
         fsQPU1d6WHXmOqhKbVW+d2hei8N5qQsXOaM4j6gpxsoaWW3vlDWwgmAkrOgENXdfoodH
         jD5kIiOmBR/svivrr18Sv9tLiqcucSwy3/Ny94/FFc6snebVQZrQIb8oy6B42uErgmPk
         0SFP2BKzhggpsC0Zat4npdFlAqsiI3FWtrxAd2vaKGz+Q6PH06RNtkRS1KIH+qssE3I6
         qhSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769032067; x=1769636867; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFgFOXxHcqqk/Chd6m6zZHG2pY2sV3c/ZZN0cSg34hA=;
        b=cxhXmvQhPHLjCNssRJ7waivUU+aF4+AErTZH/kRTvCZn34vk6xdc8wJYN1NhK3yi0f
         VNdcCecl4KujATWph+yJpvdDqJFPZlojh6jleEft+cAsyUGQM+dyaQJh7RLH1fpAdsNg
         BWEsBa2oyNwZ3fB8vGEuXL9HkOiGpJi2hUzbeOJAp1yztt4CdnEyHiaq8BD3NpKi1sBP
         v3y8pYwOFiu0AO7YZPeI4RCm+bRGyLM0thK8WzzZGUc1Y+RYzPe3HtHGQ4Cq0Cy5tTo8
         bP2CURfe9OEHEIsDIcIyAyMKkRxW8xcdImCbpJVj7TTPiCvMZ0dgzas9l7ipHY8Ebwqg
         jB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769032067; x=1769636867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TFgFOXxHcqqk/Chd6m6zZHG2pY2sV3c/ZZN0cSg34hA=;
        b=USqyyCGOLTXFiXRHbkN0L/1sfG+oOtK2OVtGi4hiUNavvn4per2UmA3srmadQK+zVj
         VgCBV+CdXT9G4ElIxzwVV2HeXGsq+APKVMTCC4a6GL+tR+wLo1xbqFlIQ7KWkGRbycyL
         j0Jc7n5nD8SValKJV6ahuk/hjaL+M9z5qRKFoIMAdmHVTuTjbkYFNA2dA/36OHTXKKdG
         WZxvQvvci2RVcFG+Z1bjfKinLeG/eLJ5RLy71acumWguU1+2f9ejBtjCp2KnQQhi0AEY
         V+ZJT8gRqs0MxHDS8apZoZn/R0XvcTWsyChe78yE9QI+8zvGcJbhjJmlrPNQVAYaBIxi
         XVnA==
X-Forwarded-Encrypted: i=1; AJvYcCWXqRJu2pe3HKMRc3m2z2xqXzh0GU3vRvaocJ2fNKI5bGuAo7favZ+uPejt59RE6iTsGnsNFzlVN75Z2PWPv8s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG0XXdQ5ovuzSNH3gXK0JWRKAch/JAPBDLq6IiAcmftDzjKm2N
	VRDZExwPlCqamSoURxozkXR2QsiJjmofyUrL4KeCWzxtW6F2hpu+c7Ap7Jcusc0MCH77DKOo4Rb
	vzjHySNl/E8HIpXNSaovAKMH9mmk4R4E=
X-Gm-Gg: AZuq6aJwHDAbVVv/US382idFJv/xk9bF60x7ajsPvYddzShz3EK2p3skPCRBLQAmCHU
	Z4CNQwI6q9YMmZdbX2Yu9waxqzVCUhKpfAbc7RHo04f6bsmUK61oVRqJuveV0ty4Ek1S1t9prph
	SesdcaMwZqFZTomg/aUCr8GAZSxWFpWxJAt56Nag0I4+CkEhS9Xf5UGCieCfpNP+M5sjUbKj0zd
	WC+l85OYCXpz7Hu8/d2C7bRfWl9zPwIjDrYhyd0q7Eb2s88H303rhkrqEMLG0Q+x4XCLPptpaWG
	/Zk=
X-Received: by 2002:a17:906:6a02:b0:b87:b22:f5eb with SMTP id
 a640c23a62f3a-b8800342ae8mr545654366b.31.1769032066854; Wed, 21 Jan 2026
 13:47:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251214163537.1054292-1-geomatsi@gmail.com>
In-Reply-To: <20251214163537.1054292-1-geomatsi@gmail.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Wed, 21 Jan 2026 15:47:35 -0600
X-Gm-Features: AZwV_QjJhTPkHayAMroLRdbBvhR_NU59Z2RYcU1vUqt_PNTli71R5oGHYfWVW-U
Message-ID: <CAFTtA3PDoysu+RyvH+a_ZZ4xCbGrgeYY8Xu=zFqQ__grhWGCtQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] riscv: vector: misc ptrace fixes for debug use-cases
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Oleg Nesterov <oleg@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Thomas Huth <thuth@redhat.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Joel Granados <joel.granados@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>, Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sergey,

On Sun, Dec 14, 2025 at 10:35=E2=80=AFAM Sergey Matyukevich <geomatsi@gmail=
.com> wrote:
>
> This patch series suggests fixes for several corner cases in the RISC-V
> vector ptrace implementation:
>
> - init vector context with proper vlenb, to avoid reading zero vlenb
>   by an early attached debugger
>
> - follow gdbserver expectations and return ENODATA instead of EINVAL
>   if vector extension is supported but not yet activated for the
>   traced process
>
> - validate input vector csr registers in ptrace, to maintain an accurate
>   view of the tracee's vector context across multiple halt/resume
>   debug cycles
>
> For detailed description see the appropriate commit messages. A new test
> suite validate_v_ptrace is added to the tools/testing/selftests/riscv/vec=
tor
> to verify some of the vector ptrace functionality and corner cases.
>
> So far tested on the following platforms:
> - test in QEMU rv32/rv64
> - test on c908 (BananaPi CanMV K230D Zero)
> - test on c906 (MangoPi MQ Pro)
>
> Previous versions:
> - v4: https://lore.kernel.org/linux-riscv/20251108194207.1257866-1-geomat=
si@gmail.com/T/#u
> - v3: https://lore.kernel.org/linux-riscv/20251025210655.43099-1-geomatsi=
@gmail.com/T/#u
> - v2: https://lore.kernel.org/linux-riscv/20250821173957.563472-1-geomats=
i@gmail.com/T/#u
> - v1: https://lore.kernel.org/linux-riscv/20251007115840.2320557-1-geomat=
si@gmail.com/T/#u
>
> Changes in v5:
> - add support and minimal set of tests for XTheadVector
>
> Changes in v4:
> The form 'vsetvli x0, x0, ...' can only be used if VLMAX remains
> unchanged, see spec 6.2. This condition was not met by the initial
> values in the selftests w.r.t. the initial zeroed context. QEMU accepted
> such values, but actual hardware (c908, BananaPi CanMV Zero board) did
> not, setting vill. So fix the selftests after testing on hardware:
> - replace 'vsetvli x0, x0, ...' by 'vsetvli rd, x0, ...'
> - fixed instruction returns VLMAX, so use it in checks as well
> - replace fixed vlenb =3D=3D 16 in the syscall test
>
> Changes in v3:
> Address the review comments by Andy Chiu and rework the approach:
> - drop forced vector context save entirely
> - perform strict validation of vector csr regs in ptrace
>
> Changes in v2:
> - add thread_info flag to allow to force vector context save
> - force vector context save after vector ptrace to ensure valid vector
>   context in the next ptrace operations
> - force vector context save on the first context switch after vector
>   context init to get proper vlenb
>
> ---
>
> Ilya Mamay (1):
>   riscv: ptrace: return ENODATA for inactive vector extension
>
> Sergey Matyukevich (8):
>   riscv: vector: init vector context with proper vlenb
>   riscv: csr: define vtype register elements
>   riscv: ptrace: validate input vector csr registers
>   selftests: riscv: test ptrace vector interface
>   selftests: riscv: verify initial vector state with ptrace
>   selftests: riscv: verify syscalls discard vector context
>   selftests: riscv: verify ptrace rejects invalid vector csr inputs
>   selftests: riscv: verify ptrace accepts valid vector csr values
>
>  arch/riscv/include/asm/csr.h                  |  17 +
>  arch/riscv/kernel/ptrace.c                    |  98 +-
>  arch/riscv/kernel/vector.c                    |  12 +-
>  .../testing/selftests/riscv/vector/.gitignore |   2 +
>  tools/testing/selftests/riscv/vector/Makefile |  10 +-
>  .../selftests/riscv/vector/v_helpers.c        |  23 +
>  .../selftests/riscv/vector/v_helpers.h        |   2 +
>  .../riscv/vector/validate_v_ptrace.c          | 919 ++++++++++++++++++
>  8 files changed, 1075 insertions(+), 8 deletions(-)
>  create mode 100644 tools/testing/selftests/riscv/vector/validate_v_ptrac=
e.c
>
>
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> --
> 2.52.0
>

For the series:

Tested-by: Andy Chiu <andybnac@gmail.com>
(on qemu rv64gcv)

Thanks,
Andy
