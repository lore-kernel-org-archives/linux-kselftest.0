Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF9C388E76
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Apr 2026 09:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775207145; cv=pass; b=RVrPx5J+NYSmqxsl8SmGGVsWE5mmVbHzTR7UFtmIYS78Ik/tSEKyWsUmLIqs9YtzAh/g2kYmtyUR+9/DfTTur/M6bH5V2QZG7NdAiUfyvMrjzEH+CsaJsza1xv8/1OAcFvRhdkR8KybcT7WJZNcsrFHwLK7p2UdfBXCl5bU0xcg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775207145; c=relaxed/simple;
	bh=3+E5CeFt5DfngY9jyCj6sN+5947QN8ZJ0RESVzhTnAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i3SbYy7lilhjSZw+nQQGjzxrMDkO4LHEMRfpCsOLJnxuLPzTjFubBbPxuFZSCllr0OIvHhUI1YHuzclxgkf59GOujoiU7C1io9yeGZc3e3ax3i4rctdZCkGDzLpmdiPgTG8ABbc98T9BwvRbShQ2g2OP2Ii6S6JgF2m3dRXitOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b=Gu9rbtMD; arc=pass smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b="Gu9rbtMD"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-67bb3fe55a5so584910eaf.2
        for <linux-kselftest@vger.kernel.org>; Fri, 03 Apr 2026 02:05:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775207142; cv=none;
        d=google.com; s=arc-20240605;
        b=NDEl/ncZtgyY8ddYVs3O5ItWC9gPKmP7yQxLR1O32Drx6EYf2ZZEc/aueYMN/3Ekeb
         FD5iVQR4ou0oa0/19AHYxGIglHRKpszQOhwysznGGSwivsIcuF0jsRW+MxcMRCvNLwpo
         g26AdlYGhLBKIeU5lIWb/Bi61I/HqnFjjGEzbtkQNnHlwYj/zpcXGrsOP/tvhY6yvOcm
         4H/Spac8tMjZypNg1ObcsoauTaeY+TdTZvqWj2r4Fn/8+h89stdxOLupW8hnZGdRPeNU
         B9YDdWRa8oi5/zKsc56puyrtsZyef1L1yI2FNnFUvRRyWB81e421KTwcH8YtQrSaJpmg
         V9oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CCm4AYakB9dKG7bybl0vV8lp+2k4EkmvPsl1dYhbfsg=;
        fh=AxEPSoVWT64wKQ3OM9SbwvkGj12bXbF9zw0IekQnOgA=;
        b=OxZH52uU8iWdwRUQzG0ZpAGOYLuxExr50ojZTCztyg2DDVP1RiNfQqo4yTafdLgDfl
         BsLCYCxaGbAVgQb5rGwPO/OHhgFDBHm4gkatbT4cnT5vnNzIg3c2EAMcQy5nndECtzsZ
         QH5qU0PArhDtes98sO2pecpuCY6uBC5M7oUppAOjYIxVqQixa6/llJWZDgN9DwiGzFid
         CwDKM1U8bUZxEptNoOBufg/um2CxBV20WP98vfOPnQFhAQdg3FlZgOdrmdtfZDt9lgKE
         MKyg+YObH4qf5wOTbALssNORr+5eIo8JXoBfvzfPEd7VpwbK1WnG8bW0w5HXLYr87W02
         4Etw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1775207142; x=1775811942; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCm4AYakB9dKG7bybl0vV8lp+2k4EkmvPsl1dYhbfsg=;
        b=Gu9rbtMDwsCe8l0Nmn03iwDdOFnpsEnBlHe6jZK34by9N/z2+aY+oUiS5d1ISeKfPR
         ZtvA2HDlCjyMdGbLEbQVMg+5Fw8rGNvDHuLL8uuvmyuE2a7J3ag73ea9/xFOjKvNHohr
         fyzQXn2BJ17yTLpI9yC1ACGVwqAlA+pKVSMshiBa3bNdPzRyH+wXM83Qx4pgXXt1cdjC
         wsCFGeZ7nJ2lZOuNJpecjO4WUZy4Byyz512YlTKvJaclb1/sVc/v4OXzC+IAqG1mwV4X
         EcG5atcKMYdM2QNJSxtnVPA/YG2bLxAUj9pUOPsnERr8lNqJIhFb1v4bACJ6krRk3OB9
         zAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775207142; x=1775811942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CCm4AYakB9dKG7bybl0vV8lp+2k4EkmvPsl1dYhbfsg=;
        b=spaxNRW22YNzdeFut5b43hjB0a6kXiJezRBJg05/YG+0oC44Fj+CLwkarJB9+3Gm1t
         GI/LSxXRL3NoMuhDjRHyHXke3raBxHFl1rjXLfLY9YAT/yBl34ll0fqkOpk9CLF+B8Bj
         0aWbwvqtN8l8zMileZlvDckm0Ak6+03nuiBD3/+zVNhA5wplxXBi0+QcEtKtfk6L++MP
         L94lWrCET/B4bNiAv9dCjiOu4i1tRrw5ZBdrwZKHirjjtcbc2Y2DgCKRHAT2s+BmbMbC
         GZ+sFKlKmNWADy/+BCLV2nPSoydk3zN5XiwRdrl+7Ubf8wnV40X2wvAiSMNAOqVt8qXM
         1yFw==
X-Forwarded-Encrypted: i=1; AJvYcCU7gA1yflnAambmx2wogIdcwMCL9vLaLYNUHRlMlLsHrguQIUXY/k5fujXbrb7t5qVnIQb8p29Y5JtwhjluPhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhL7iW0bw6vQ0594TLI3rctptOfLWX1re/roU09/PEAvRJUJjE
	bIo07wNl1QqCQQ/jlFOsTw+160USid3hxiSJheM/zRiKiG8EEjgpaZEF2kOItsiwQSsF3R+VRty
	yDz99l/CVAf+3X2n/2xH4wbfIXxfHm+ioddolHeRxZA==
X-Gm-Gg: ATEYQzzBDXKDIFKSZn+efVNGYBOg8/fbffOyLS+BPoymb4VDPbovUAvfYrTk7rjDl7j
	phU5qUTTcbTUlpXe5bUnnSb5bc6JuLOxpibC/+9DxgUy5/eCj3HMd+ayst85vS1CKq7KPJnAiLj
	EaiXyAFZ21JvzZneqoj7nzdEu9jrKIFO6C5MVgPRMqFpQJVV/HWXeG3irAcZoGqA7+gw13mPRAl
	My2k1D6/wdhQhipz7C9F4V2gBWhjjLMs08z3miRbNIeZjiVdJxcy51o2xpN1XaKedXfhUWZsZC/
	HMBWheUB1jv8DOtC4Ei1p0AwpoZOoh/KDWtDszaVvIfuuznp6ws6rwqUuEIJ++tzzC5F4neRw4O
	8iOLGCfs00DAKMLeJ1RwRCgzPoQ==
X-Received: by 2002:a05:6820:81d4:b0:67e:cf9:ea19 with SMTP id
 006d021491bc7-68221fffcb0mr1063073eaf.59.1775207141789; Fri, 03 Apr 2026
 02:05:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402101818.2982071-1-mayuresh.chitale@oss.qualcomm.com>
In-Reply-To: <20260402101818.2982071-1-mayuresh.chitale@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 3 Apr 2026 14:35:29 +0530
X-Gm-Features: AQROBzB9KrI_BrZ8TmyJzBaJ6ObiJnp2kmnWownjmY2mr4UtyY1LfTWXeuUiIwY
Message-ID: <CAAhSdy3dqmamQX6dtxhXasFmYhS=j3YheSLnBv_sh7A3FZJLVw@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: selftests: Implement kvm_arch_has_default_irqchip
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 3:53=E2=80=AFPM Mayuresh Chitale
<mayuresh.chitale@oss.qualcomm.com> wrote:
>
> kvm_arch_has_default_irqchip is required for irqfd_test and returns
> true if an in-kernel interrupt controller is supported.
>
> Fixes: a133052666bed ("KVM: selftests: Fix irqfd_test for non-x86 archite=
ctures")
> Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>

Queued this patch for Linux-7.1

Thanks,
Anup

> ---
>  tools/testing/selftests/kvm/lib/riscv/processor.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/te=
sting/selftests/kvm/lib/riscv/processor.c
> index 51dd455ff52c..067c6b2c15b0 100644
> --- a/tools/testing/selftests/kvm/lib/riscv/processor.c
> +++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
> @@ -566,3 +566,8 @@ unsigned long riscv64_get_satp_mode(void)
>
>         return val;
>  }
> +
> +bool kvm_arch_has_default_irqchip(void)
> +{
> +       return kvm_check_cap(KVM_CAP_IRQCHIP);
> +}
> --
> 2.43.0
>
