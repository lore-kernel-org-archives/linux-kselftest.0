Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F646485CD0
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 13:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785330830; cv=pass; b=dprCU6ZRFN56T5cPiV7ogA5DlNd2X+laJsFQcWcanTI49Uh8tyTyixdUUH86bgLRWFFtAXdjRqjNjfDEbkjSXLhP/TabDlH1TDpvlYzhXvTH9rh5OohFUgGUF2mY5lysiyoIXsSVZLGkDvMluWmjeBIifcTcNnJno8RdFugKYfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785330830; c=relaxed/simple;
	bh=vOSlCbn1ARVvnOxXCR1Rnvs8e9fHwYiJmpBx4fjfkrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oCrnUHt0YfkSxfL/ZG2jLHrqpQSLNfnkQKNtACM9fXALirv9Mt/xAEdMN8DDZIvCdwp7BvUxhacec/c6IV789LYWgwMsvVukSbeTNW9/ecUFF8Kt49qjof6tQKQ0+vFHEenGqnEknTkq6e01iemsP2wQHWzYGGXzX6WBTh22G6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b=VLvgQuFy; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b="VLvgQuFy"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b0115b9e17so880164e87.0
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 06:13:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785330827; cv=none;
        d=google.com; s=arc-20260327;
        b=RIgbKKJbfFqm+Y7C89IKfCkPyP4bmodgQQLpa9TYyZIcz73HgQ2w13LSvoSs2sjt8s
         qTuGNmAOf80wUele/D0DDnOQyhfH3uCJcvLVLib+3FPli1pQdVQUIiBrNcUNaR3V/5/3
         FgnEroQxZh4+eubAN+1+nxtio37e1RlSPpbHMZ/Xd8e5jGtneXFHQvDQe1BZ6Ps3J+oa
         yJX//bxClL99bAJrnRiT+PP+OES3+Xwa/KKEfJslpvdXZejHQQ7qUPOiIAr8u94Qi6rb
         qugflmqqsxOnCxwzTe0qESUBSi8AQsTW5dRyVWZAjWOOb6PhCJiJjJNieDRiEOCcdjWH
         QcFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ck+qFBZ5bja/QNpGjNYN6rc1bp/Rde29qHcl/VKhzes=;
        fh=cPVD61Al5cN24LlY2q8k1SapY6JF90fBd2sLVCT+tk4=;
        b=COUPPFhyqx+HkMikrVC1tppmQb2npVMTj03XvIZ0qs+VqstLuzTnyS2O3r+zkZ5Bp0
         kPeJydvYvHqRUbcrqugaTVCUy1L25+8RvQgbPYgl1CpWB5zqon8Vvgsb/fKSq1KO4qR1
         1rqtE2jOJ9aof+B267OhVh5C6p+E6wpQINOhcSVZ8PsvS6S9uA3aLS/GHijhCZikn0LL
         xQ7MMKjKDWjRngHfuYJG5gfh2T/3/7TSiTTdgpFjMhju3EHrplXu4ohfyhY3n2CAXjrN
         HJpR9U+oyrIabdthK5NUr9dBWshhQ+7g9fOQNEYNYRLI+20bnfFhMymkYrocaqTbizjz
         qCJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785330827; x=1785935627; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ck+qFBZ5bja/QNpGjNYN6rc1bp/Rde29qHcl/VKhzes=;
        b=VLvgQuFy0speqmDBicP3tvaNscsQxvj4nb6f4F14kOqjNwtqpomvCIGQ6X24Me3LQi
         EpipxAMliUG0b7mxfA9I9JgMgZy+bfv64faFdo0Q3mdEkv8VHRCFzNlwfWd/axzXYHWW
         UqsZ+BPPld4Dml1oKykqad4KoBLTyy6A33WXG3mavwHYwphtbBikk4X30I+V+98I3z01
         BiU4A2RXipAr3sn3JiqmyS5DdCfvlTlwHNKBKMO/YHRnvah4ZKn3nQjyA8vg9jrqwwcL
         iVxtsA4nVkHWYPWDfwxJZKlt7PSRuN7v3kkhxgFZbR5NeKTxt53Gk1FkGUIl6AOEaQnK
         01vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785330827; x=1785935627;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ck+qFBZ5bja/QNpGjNYN6rc1bp/Rde29qHcl/VKhzes=;
        b=NZZJ4z9sScA9AtvvMNhXQUkgfow2PM059Et0NvHGf3qPeV2FFMmXhAQJtCeINgSna5
         AZzfY79jbS1DDJ9n1PsVsW6IV4i1d0gJ/Tgid+dlB7cFGJZVFJFILFDrV25IWzYQ8P7k
         asOFeQKFRuAyBjOBFgBSvKhsSLWe7l0yAgzYLXrqEQ5bzYGrif4IAoRD8H/SfdKRncBh
         obxT2p0Rz0uILAFIyh9WLaVrAR4Ho9KKE2FfPR81C6eIGYBG8beQg5E0f1M0J4xRhqJt
         sbSirq6Jz9FiGvEGIsfb2JKx9Nc2K/FPe1vCHO3i84KWIcddpvL06n2pDyoFWnqHLp0d
         VOBw==
X-Forwarded-Encrypted: i=1; AHgh+Rpb5qPooZCgAyp9qCceMVx6EiCUD5PoCK0Xx8oMOggFPoMBaGMFWGDcJZk6tEAhDO5Isvq80tohALfNs39bFyw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmVxetiA2DYrWUSCbx2JwSMTe+27LomlDFg7fIbYlIx4+P9SgQ
	I8WX0Eb/a7sgMcJ1apdQ6F5HyMOG02ZyApApjEMgovW2VDThyADoV3Sn08xM35j8g0hJuSCOr+s
	yEFR841LuJLIm/y8qLvNMqJpgfK10fnQB4FVi8RNa3g==
X-Gm-Gg: AR+sD11wlTJYqiLM7uUgKi40UY17QZcobYtNaB7KdYJGrd7jvjUGrvg5Gvj2RX0jf7W
	jyrOOZI1AVlzOT8Bcg/Y/fzICg8VebHDrj/YC9yp+FZEgOc8TjaWNkchJuXxwJIVTsjztxsT1dD
	tpgGoJw19v/h1ZT8YTRErNoGZZtLk9jowNrrH6uvxx6P0jKwox+dVX0KElYsdo0l/7rJup59xvK
	YSiX8Y46NZ9ATZhhJBmHRthlx2jIg9knHY5YtXqKDL1bpZ0vXQ8GOtu1TBx0ZWS1UJJ6cn1+/tR
	wogt6hoYCd9rlXjWmsoBeVfgTkY9MBv6A5AWFfvHSXioCFfV58xC94r87OfAUxVtRrxGgyp+6aD
	tAxBv//JBVeGKr6xrh90epI9rs4D19w1Yh2/VSvQrzjqK5ocJA4uq0mkS9WhdN1k=
X-Received: by 2002:a05:6512:33d0:b0:5b0:17e7:67d0 with SMTP id
 2adb3069b0e04-5b2d0273f52mr1467052e87.62.1785330825942; Wed, 29 Jul 2026
 06:13:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713010302.303278-1-inochiama@gmail.com>
In-Reply-To: <20260713010302.303278-1-inochiama@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 29 Jul 2026 18:43:34 +0530
X-Gm-Features: AUfX_mzwiKmlKO80-pqUmoHMTv5ug9FlT2fXdp3Y-lXiosKZnx_1i72rsYg5LV4
Message-ID: <CAAhSdy0yDoSAh_tcrjNzfbJnLAUAvWEGUGUQcX2fd89naDcq=Q@mail.gmail.com>
Subject: Re: [PATCH v6 0/8] RISC-V: KVM: Add Svadu/Zicfiss/Zicfilp FWFT support
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Andy Chiu <andybnac@gmail.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Deepak Gupta <debug@rivosinc.com>, 
	Thomas Huth <thuth@redhat.com>, Sergey Matyukevich <geomatsi@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2026 at 6:33=E2=80=AFAM Inochi Amaoto <inochiama@gmail.com>=
 wrote:
>
> This patchset based on the patchset "RISC-V: KVM: Add Zicfiss/Zicfilp
> support".
>
> The patch includes all the function of original patchset from Quan:
> adding the Svadu/Zicfiss/Zicfilp FWFT for the RISC-V KVM. And this
> patchset already passes the KVM unit test.
>
> Test with the patch applied
> https://lore.kernel.org/all/20260618064406.14508-1-cuiyunhui@bytedance.co=
m/
>
> Changed from v5:
> - https://lore.kernel.org/kvm/20260706022046.214956-1-inochiama@gmail.com=
/
> patch 1, 5:
> 1. Switch to csr_read()/csr_write() to update csr
> patch 8:
> 1. Fix the macro name.
>
> Changed from v4:
> - https://lore.kernel.org/kvm/20260701020746.170157-1-inochiama@gmail.com=
/
> patch 1:
> 1. Use NACL for csr update
> 2. Check ISA mapping before cleaning the ADUE bit
> patch 4:
> 1. Clear the zicfiss csr during a VCPU reset
> 2. Add zicfiss csr to num_csr_regs()
> patch 6:
> 1. Cleanup SPELP after redirecting the trap
> patch 7:
> 1. Use interrupt bit instead of number for masking/unmasking
> patch 8:
> 1. Add missing entry for the test
> 2. Fix the wrong comment.
>
> Changed from v3:
> - https://lore.kernel.org/kvm/20260607081105.993908-1-inochiama@gmail.com=
/
> 1. rebase to the v7.2-rc1
> 2. Tested with the updated Svadu patch
> 3. Remove the dependency as it is already merged.
>
> Changed from v2:
> - https://lore.kernel.org/kvm/20260601084336.2601675-1-inochiama@gmail.co=
m/
> 1. rebase with Yong-Xuan's patch set
> 2. Add SSP CSR context switch/set/get
> 3. Move the software-check exception set/unset into FWFT
> 4. Only delegate software-check exception when Zicfiss/Zicfilp is enabled=
.
> 5. Make KVM SBI_FWFT_PTE_AD_HW_UPDATING depends on both Svadu and Svade
>    enabled.
>
> Changed from Quan's v1:
> - https://lore.kernel.org/kvm/cover.1764509485.git.zhouquan@iscas.ac.cn/
> 1. rebase to the latest master.
> 2. Split Svadu change as separate patch
> 3. Fix all build error from the original series
> 4. Remove the Svadu check in kvm_riscv_vcpu_config_ran_once() and in
>    favor of the FWFT.
> 5. Remove the LPE/SSE setting bit in kvm_riscv_vcpu_config_ran_once()
>    (kvm_riscv_vcpu_setup_config() in original patchset)
>
> Inochi Amaoto (8):
>   RISC-V: KVM: Add support for Svadu FWFT features
>   KVM: riscv: selftests: add Svadu FWFT extension to get-reg-list test
>   RISC-V: KVM: Allow Zicfiss/Zicfilp extensions for Guest/VM
>   RISC-V: KVM: Add ssp context save/restore
>   RISC-V: KVM: Handle software-check exits for VCPU
>   RISC-V: KVM: Delegate SPELP bit to VS/VU mode if landing pad is
>     enabled.
>   RISC-V: KVM: Add support for control-flow integrity FWFT features
>   KVM: riscv: selftests: add Zicfiss/Zicfilp extension to get-reg-list
>     test
>
>  arch/riscv/include/asm/csr.h                  |   1 +
>  arch/riscv/include/asm/kvm_host.h             |   7 +
>  arch/riscv/include/uapi/asm/kvm.h             |  13 ++
>  arch/riscv/kvm/isa.c                          |   2 +
>  arch/riscv/kvm/vcpu.c                         |   7 +
>  arch/riscv/kvm/vcpu_exit.c                    |  11 ++
>  arch/riscv/kvm/vcpu_onereg.c                  |  68 ++++++-
>  arch/riscv/kvm/vcpu_sbi_fwft.c                | 183 ++++++++++++++++++
>  .../selftests/kvm/riscv/get-reg-list.c        |  90 +++++++++
>  9 files changed, 380 insertions(+), 2 deletions(-)
>
> --
> 2.55.0
>

I have taken care of my comments in PATCH1 and PATCH5
at the time of merging this series.

Queued this series for Linux-7.3

Thanks,
Anup
