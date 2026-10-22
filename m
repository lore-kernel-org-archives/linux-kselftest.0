Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792650470;
	b=dclGlbqfd1A6k3/WEHHoktgdM3yZRfzhVdIKhDVH8WUpVyvaoSLFpjrBhiBQM1DMGYdC
	 X5llVe2koGM1aZLkm1xVJqT8Kl2FPJdOOWdINdoOx/YtMe6io0CdWKNx7gmrxmG7TzmZ9
	 NLozTYvPeSe6hM0B2bjPKW9W5/VE5Sn0T3x1R//g0CXgfKq/WafuPc+JOOf9RMzPrVh+F
	 e76tW6+Rl79/ty2W8vlHtNPFyyJyTHHdHwjyxhMUTo/AKd2I99Stz+EAksCa8dnP8lI8T
	 cskHgxP1Kk3gJBRHIIXfFZM+vfyiC21Oc9zLcUhC/EBgPbUwjDNxTwkKiN2CqEOQW5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792650470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=c8KWIoZNW6/QAD3FZ28O4CFbS3YPAHolywa/ZQAktrE=;
	b=vQAO+/O8ufb4jXgcHiMFwNhH0O/J7RK8Ze1U5Psl4QdD9UjZKFFAkCrBCDHjeUR2OqjB
	 8BHIcflE8dozFHFDTHDu4jFfkF7Gk1lfOq42TlIjNYOp41IwENAaYPpmKh+IXyQRqRRVp
	 L0Paqesw3pvSHE/6tGOqUFzowsZ+enHXNRFymZXZerRV2vczy5c7DRZ40PmEtkP1cVdCm
	 C+WXGeDLk7sb4FHu0IbtMiw2xmF483Ndyw/Xgxn/PZz6wfQ4+Qh/SwiNLPtbDGq4TKoJ3
	 KNS3mOMnGBpz0FqRl8GvDXUZM86uVJLZTEU9X9J9rB/A/fDzqcZiidHSqOrzUGcfV5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=I6BJalyR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C60606A31A
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 06:27:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53C60606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=I6BJalyR
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ab27b4924aso11104371fa.2
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 23:27:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792650468; cv=none;
        d=google.com; s=arc-20260327;
        b=dUDp0z5Ka/t4Dhe3lFy6Cj69Wb/Jnshpdqpi1eElORme0tyNJu8LfoasOwMVA2ATM3
         Ejrlw2gKXDpqdzqYbgJOYbghtwetxNpY/xkxLXTjJ5jiY5jFwDHAn+00x9vKZvInhvk4
         /HYlwV4E8ex4TmjKPSNv357mV2Sgl6d+XnXkJ8mYRp0PI7qY/yJzeWvvRVHuM9vnIJA9
         6f4dxNZnPLENS/tQIWcVo7STc1yldi+BcvZLH9MShFOXz3Ddabs2DD9f/NepZEdH/xwG
         sj8K91UKzz90xeIXBdHV5qiaRgHRAeCW/gjERgwcsTQ0AEAHM1tMGG5QKWu5+36PkedM
         GtoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c8KWIoZNW6/QAD3FZ28O4CFbS3YPAHolywa/ZQAktrE=;
        fh=c9qcGXvcEcUeFJW2ZTCeXYi2+iSQhXddhvFPmQJlQRg=;
        b=CqjH9j8Gy8qkiOOpmjr2I3I613joJroJZz7VCKG4OHKSdUVWJggBYTOT6kF2m4H5rT
         YJUTy25XtNBETQsZ3SyjVEZMrr85KzhQUxTTKRSApK8NwQjgJb4J3z6IYZ/6rax8eBSZ
         AotqP0GA+JY/UXNxkZp9Fxa/mycCYCbupUnZQtPgebYGSDCFgGCTqMIvTL6bYBpuTd4w
         t1rIsNGm47KSId5sRGBfYKSKfG5UtB/dhcsjEKwkeVhyFqAThodMUWQvZj5ggWJCrakt
         d/fjXLPaEd068F6zHJdGvQqSgfKGdVmrakg7Lpr8pAJclC7NUaVX80o5bLYfO9EeIsUt
         Me5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792650468; x=1793255268; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c8KWIoZNW6/QAD3FZ28O4CFbS3YPAHolywa/ZQAktrE=;
        b=I6BJalyRUjlXbBnTqLj/Hw9e0stD1hDGncpWi81zlLKHhhX9z55e2piXfBA2ShEicd
         js+eeYjcAscnQ1MR2guAhdfiIgd97VwaWxDn+3saZwZwoqyxwsmPxQwCBReVsef3fi4p
         HEicD/7M6zZU/EAZiEqlwV94O9rbzRJkdL83ScTGERS/129XNqV2yh/Hh2s/GU/rg9ge
         DoqCjcnoMxuiGu6E6gcAmJyT4Y2sR4GGSTnfKptQqRlRKYVm+KrnjwXvBBM+fKAI1zlB
         K5EAwtzHBKSotwtsXA1CbDDeNN0sAqJ8tryxfVR/RMqCO3lBl3delvIcRWlgb+9Kj9+j
         eUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792650468; x=1793255268;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c8KWIoZNW6/QAD3FZ28O4CFbS3YPAHolywa/ZQAktrE=;
        b=kvgV7gMgnvc5y0l3567ZdV6eAzxfJGBg7x1qfLQqLElgb3vcE8S+sm109QLRxsuhVV
         ZsaOhLWC1FgO8DBBIYdHfX2kjC4S+jAC7nzpp65FnSNPDusP0gqAelwDwUi6EXi1LYIH
         EkRDjk/U0vaRMlkdPNLeTdyRyTvQR9wKpdxOCrgCD7rglKdijJTZmthB7cG1JuPpSF0n
         0ShZgLlIBiTwcGRRyoGci4bnH0xSllnWLuU0zDQeqNexwAlpZfwvJ6VvpSCkte8P2gpz
         XsuzGPLZAyZAcXT4lFHY5raoYU0JGv9SphkzgIbwRq95a221yvBkMnrT1xbbUS8RUZpv
         IjxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwuE0/ykygHaxWU9CZhZ70jNHvYwXN2SjC5m8AssDaahKbstM9zQT3J/0Unr0MzpFq1jQ/Uq9TIzWOgi2TtGjY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4A8SZF+OU1E1bJonwhd0WfFxIxcRSLXWrD00rPu36OFVQu47V
	Nd4bIxiwpY5K8WBT4xKU/GshiHGyihn8jxfX+fMfarz8mcxDES6eaYSzHA2GQCW+T1dIoIrG5KX
	DVsUdtsPvNQrWHZEANtWqYrVjGblyU4wBDcWG3ITTJw==
X-Gm-Gg: AYBFou1dlCpTGBIol0OeqRwKNMQNLA9Lvbj/lDxrpBtKShKrt/rZj++dlabK3urQDXQ
	goiiolKz0CZwJ7o36YbEhe1ny8Pa0ZC+dOoTGhYqr3SD/5AQIcP+bXn1tZ1t4KBOc1mjKNeUEpz
	n99cFjgtSGcMrwEv96HF6Y+6pVjmuweK0xljagRNt3W0V8MUTSLXdhEfV6k3vN73ReZHzVRaOX4
	yacYn6SHyL0F6TBzYuM0RvPbB6CjFXQk4J4pt79O/1PKOIhqposBEj5uPErri1aD0hsGHvSVTKr
	kVCUEMC4YSATIOrViVHtlpsQE9reVpfS0KXU+uyykAu6igbBOgZcNRwc7xUyf6Dkx5Sb0L1/fwJ
	9xG33VkzFB73SLvddb+85/FM0V+Abg4ZAnUsaF5Okx3D+iv7VdOGhNsO+Hue5QH6S7f8FFsM9eK
	tcGq2zFp5IN4Fm2meY3P0S0jLZ0vZuU8HluvPc3xzJWHFNF/Pt1CmNuwR7J9OBm4XoX0yjpPXhW
	xyaQw==
X-Received: by 2002:a05:651c:3134:b0:3a9:9a3b:6036 with SMTP id
 38308e7fff4ca-3ac440b53c8mr12628651fa.2.1792650468375; Wed, 21 Oct 2026
 23:27:48 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014224239.963635-1-heinrich.schuchardt@canonical.com>
In-Reply-To: <20261014224239.963635-1-heinrich.schuchardt@canonical.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 22 Oct 2026 11:57:36 +0530
X-Gm-Features: AclHuK-9TFsRegjYZcIPEHWDYDOWlB5NKzsnn-yH7Qq40hb2qm3j1NzJo9FfRwI
Message-ID: <CAAhSdy39UtV0sUqL0=FX+HWa7oAH0fkei1cFKiF6OBSSFT=gdQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] RISC-V: KVM: Allow Zicclsm, Ziccamoa, Ziccif, Za64rs
 in guest
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Sarah Emery <sarah.emery@canonical.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 4:12=E2=80=AFAM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> Extend the KVM ISA extension array to allow KVM userspace to
> detect Zicclsm, Ziccamoa, Ziccif, Za64rs.
>
> This is just notifying of hardware provided capabilities.
> No KVM specific support is needed.
>
> Add the extensions to the get-reg-list test.
>
> Heinrich Schuchardt (2):
>   RISC-V: KVM: Allow Zicclsm, Ziccamoa, Ziccif, Za64rs in guest
>   KVM: riscv: selftest: add Zicclsm, Ziccamoa, Ziccif, Za64rs

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Queued this series for Linux-7.4

Thanks,
Anup

>
>  arch/riscv/include/uapi/asm/kvm.h                |  4 ++++
>  arch/riscv/kvm/isa.c                             |  8 ++++++++
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 16 ++++++++++++++++
>  3 files changed, 28 insertions(+)
>
> --
> 2.55.0
>
