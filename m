Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38B33FBEDB
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 16:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774628633; cv=pass; b=rUryg0890hWvA7BMJbCjcjc/TUDcopPsKPlPqnlT/Om3g8d+pGZxYnNAgSPztDD1548KMEEeKgQ2+zkieGAeUWTjVq8Z0j4jQFy45bHm+NA13CgNf+58720HE8AOIXKPoN9LeW2cnKNaOz3GN5AZyAOA4LOl/dNJbmFW1rycVeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774628633; c=relaxed/simple;
	bh=N6rST9ZopQWUhJaBvDdEgyYVzdRlMkjbdWYlBGwnupg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oVR7vGzVmnb0XcZ8+VBcW/rr+a/6uhFxW+TyDajxkvlQtrwZN2RaUMPp4vPGEcIO9L2JXtvBym3hLTd1RQp68GusRXgqQiG+Nz7Njdm8TIKdNGdvGvWxOcDALZ0y698acljMAg+HiWZ5+YRo+YRfjO4Nz9wJS1UBP3+OIRm97W0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=bg8yWW6F; arc=pass smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="bg8yWW6F"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7d751ef36ccso1245969a34.0
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 09:23:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774628631; cv=none;
        d=google.com; s=arc-20240605;
        b=Jpigm92HG868twoQwmORpIo0UlK1ZR1KnZBNmcps11N8eBWhJ+5eKBvkK8ZR5pBJH1
         YKyqltgG2Ec2yhQXLWF0Yka1GOE9LTh4zskp6aH9EO8s2/MAj6TY88wGBhXL4WwrBaxm
         /LFvUED47fS4AnqKlCxZ1Cj+jm4WgO91lZ4duhArRnqpYMiAtHBC/mgQJg/IpAJjp3wg
         P90amaeRCeGffiFLkRuD12ct8tCSOLr1MJPQcUccfNpv2+FzDwRvO3Yy+5M8YkSNaMoL
         cVN0L9f+EaxY95N1Q7QepwVbhfYVTb5E/Z8FPoef2eRJ6jwLVWOp06ubxkPU0T8BJDt/
         b6Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5i7AMnECXeGliuvzkSngvQOxbDfImYVhWzHk0/VD+K8=;
        fh=+lZhHlkGGBqFcvB3n3tdvyNPxtw97AhlacTgC4i2EPA=;
        b=fppuY70IgT4VD9tGFw6m8fIumcQnYgWMWDclY5qPMqnkKCVSSIvrrXiQoPjgBCMEgV
         pNkY1+GAA3dyptVTnslY9+h7M9ol4ShcsPfC1rHAfGBWSuZU70kQSR6BuMpLCyo465GA
         ircg7JAczg8eTFbMerOBxvoDDOMl6OK0UI+gxuTE+eeHZYL8LiXLVLhX3VmT4PHmbShV
         niDIcL8nOGoh3LPGYPmG5cFPtEN2uJIaPWagvkX4qbhb6d+ZmUxSxv6LSGIqLIPdPIyF
         abBmCUOeUnI+/akCasehTlAHO70EhJGk3Wg9mRwgwDmahEvce1CyoVYimTj4ofBHhFp1
         W5IQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1774628631; x=1775233431; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5i7AMnECXeGliuvzkSngvQOxbDfImYVhWzHk0/VD+K8=;
        b=bg8yWW6F0FlZMyZab8kY1wR3Qvk9S53JW4fQa70IrTsRCKln9fhMNk29oEldXnK+Vd
         Jebliy51yFF1lrKDctJP0jPX99HXxV/+bcmUgqrwE3+AJ6IO3Ol8KpAOCqzdKFGGUlIl
         2dkALgQNaB3kCIeS2wY3i9fdqcEOQ4PIUY90Jh3cI12ZNLood9QD3ktAouaPGnUXRTUd
         kmRf+enY0HyniD2RMJOyOTCTS2xF1lxs/Y6Ky0zHudHZ0iRIIIYvmMnbiIGbGhtsW06B
         BRGPz3OKDWJ+q6X0vonX4m36EodecYblRJte634CBBN7UhTbX7V00ZNmokN5TPPzctlb
         Y+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774628631; x=1775233431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5i7AMnECXeGliuvzkSngvQOxbDfImYVhWzHk0/VD+K8=;
        b=QfQcAOPZ48Hgq5RujyrwgubwgcB2/SKrbfmc6GosiaFFLhUe3kxxHIkKzsHmo1Hkyo
         EH302IbqZttKtMElWxjKPhe5kWVPKcJTbDfdmgou3HkP2VW0lKz1rccKVMcDX9wCwlwp
         4uql8WHRSQitTBPse8mUuTwlHrbOlNvMTjiaGmOVFo36bMVVPxtG22g+mdMyQcgyAx4j
         MZhvhraO/TzG4o3OafBgHUfQJZns2tuyTQdpXFxsJwik5kKJGaOz8wgUuXu+gYNzz8yQ
         UVZ7UjJbgwn7j8fMEPS689MgiMbA+UO/T+1Bus/+FbUUScBPUVZ/aMX/4vbdCeMwGPCO
         YiKA==
X-Forwarded-Encrypted: i=1; AJvYcCWoes6K263b4H3D/HxUvNTD7DeZQ00oAY6zaSXIVHg1xLuiFh5zhIrr8GxzNCjLlVn1uXte0yvUKFhXSZKwG7c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+viKqPwUNXSrCLLeNmp2tSFl+lk3zR2t0zDJuOjHPHHT1Rs84
	b8siDMQ1NWas2Bzl6eB210wgNCCS6cXxcQItuPLjSPNJr7PuswLFCP60PQ1pNFxcVUrG46UlKYP
	pmwBMhu/RvrmfIVqZpAcwtU+QmILfW1lEbW/SUeUBHw==
X-Gm-Gg: ATEYQzxJP5FOevmdL7PY8dSl0kNg3bolUsLQW//SV/rVbsT5CF4leMBtjKvNtvcfIQ5
	J5CeE6jJyNKZeb1IoPAHXiJR3QM4GVgZkq86LT/+cH18rmoq8Js4WVIoQ3Y2kB4A3jOCRpq9qHl
	wb8R8C5viM5AHDvge9IGBZ11qXp2SM8X6SjTnM1amaUEGJ7JdS0R+vvionAEzMYVQTFa+vgxeYT
	0v484qxd7yqon04GXiQJv6VRo2j/+Jow8r9SBHmV54I3yTpidbDIYCJi4qL7xHK7OEmsNwVQ7w2
	tdRXIPQHjG5o3aFnLJu2IyWdVK/CD8/rN6KbudyW+Y73Z2OkHlPnUz+yDJ8eWKWleQ5Y98scEyF
	BE2uKF8Uc0r9wb3aRFhr0tryQ8v8=
X-Received: by 2002:a05:6820:2916:b0:67d:2cb:2079 with SMTP id
 006d021491bc7-67e1875bd34mr1529379eaf.58.1774628630795; Fri, 27 Mar 2026
 09:23:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316014533.2312254-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260316014533.2312254-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 27 Mar 2026 21:53:38 +0530
X-Gm-Features: AQROBzA9STNkwcnpYQkGGVqwDqCIWR_7nCDRTW55e5KIm3IP1CNA2fjdu_Yz16A
Message-ID: <CAAhSdy0CeQOnLdsCqXVxZcP-mxMDqjSMhEnLVVYTr46jbj7iWQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] RISC-V: KVM: Fix array out-of-bounds in firmware
 counter reads
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <pjw@kernel.org>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 7:15=E2=80=AFAM Jiakai Xu <xujiakai2025@iscas.ac.cn=
> wrote:
>
> When a guest reads a firmware PMU counter via
> SBI_EXT_PMU_COUNTER_FW_READ or SBI_EXT_PMU_COUNTER_FW_READ_HI without
> first configuring it with SBI_EXT_PMU_COUNTER_CFG_MATCH, the counter's
> event_idx remains SBI_PMU_EVENT_IDX_INVALID (0xFFFFFFFF).
>
> get_event_code() extracts the lower 16 bits from event_idx, yielding
> 0xFFFF, which is then used to index into kvpmu->fw_event[]. Since the
> fw_event array only contains RISCV_KVM_MAX_FW_CTRS entries, this results
> in an out-of-bounds access that can be detected by UBSAN.
>
> Patch 1 fixes the issue by validating the firmware event code before
> accessing the fw_event array and returning -EINVAL for invalid values.
>
> After fixing the kernel behavior, the existing KVM selftest
> (sbi_pmu_test) fails because it attempts to read firmware counters
> without configuring them first. Patch 2 updates the selftest to
> configure a firmware event before reading the counter and adds a
> negative test to ensure that reading an unconfigured firmware counter
> fails gracefully.
>
> Jiakai Xu (2):
>   RISC-V: KVM: Fix array out-of-bounds in pmu_ctr_read() and
>     pmu_fw_ctr_read_hi()
>   RISC-V: KVM: selftests: Fix firmware counter read in sbi_pmu_test
>
>  arch/riscv/kvm/vcpu_pmu.c                     | 14 +++++++
>  .../testing/selftests/kvm/include/riscv/sbi.h | 37 +++++++++++++++++++
>  .../selftests/kvm/riscv/sbi_pmu_test.c        | 20 +++++++++-
>  3 files changed, 70 insertions(+), 1 deletion(-)
>
> --
> 2.34.1
>

Queued this series for Linux-7.1

Thanks,
Anup
