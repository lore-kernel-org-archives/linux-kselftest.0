Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBC3371076
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 07:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772780692; cv=pass; b=gZahk39BKtnRKYcuWSavapFrYTAvNaY6TLde6m5USSXge6hBzq4Xydc5mSv2/knRWZM3Ta3Woy17zkmZLb+eLjyD+QKbejBX7qbY9bNO0oeEnNpRTdtijsaX5D7NDnmI7Fl0mZ58+k+C0AM6Py1Co1A0DbCaRK0sMj41R6DSCgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772780692; c=relaxed/simple;
	bh=+nlpLSj6Acf1T5Fy14+xUwvr2HwA2i3QvZ87SqnoJ6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PhguC2EobqAzxCf+oTbAadshWfq0EyBylSmZ/RR6kCmnfqPo7hWv9jacpdBWaCgMFsWykv+WuzAABJxD8q6QbFQAjMezo8dbLOZn+oF5IjQftko9WR0NERfe7v78a/u46kbduzeJv5pJh2PCB0tho9fpkWyDCkUtDiZOmhKz820=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=wVJ31CiO; arc=pass smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="wVJ31CiO"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-679efb9eb0dso6728359eaf.2
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Mar 2026 23:04:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772780688; cv=none;
        d=google.com; s=arc-20240605;
        b=WnAuTXj7X+CAsJF5FYGEIi9vvqgmYrRRbQ6mBr1XtLp+F/L3L199BeBpRTkjHkVMfO
         YH2XCGQGNAXejW47IweQi/O6+FMXpIf/EhYV3ov+6ByzYHcoIiSWQXIrWcjx5u2OWHs5
         VzFtjlN8w1cPB6Qey/uZoxD+19w9/VE3EXqbroYwhLZ28TiLTTaK2qTUj5GQ5Y4461q9
         4pB8bntGHrx4YXXKtG4N8nwzuHyXYqBrVokt1amsGXpSoauW6zIGvZv9/JIErCIEK2xa
         /TO6OBUyZGTRv07KiOJ0og06GBYBnlorm18O6Ef0+Sh8BwZTuPPm05CFc0RbxbLVUC5E
         X7gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HVySQsieckJFK9NwiXNz9/fIecprCPpUdU69L33AQGM=;
        fh=tzeig9dFP+LJPTN7e5nMUBhHviMr8A8WIogfL+e9t80=;
        b=fw9UfQ1FRfC8M3f/HNq67aP6wGladpurTK7SYqj4rTut+01rq2Fj7n0JurOsy6rUzR
         HLRjXXEVRpJbtxOqnasK6iX7p4di/ELK2SHufClEg9bnUAMHHy8AzSKDgfExf8LFVrJ+
         jgp4hrW5zpdxt3nSMCYP49Qfc5SQVBd7JbfIpDSsxWgIhSzvbAmEkC0EUnWN5P7ot5b/
         h8sfzLyF2kmm01ouTu277SheQl65oXDjuJlPZd6MiHW9hvkDolNnn1V+XRGbgd1ApRMu
         Ha87PPaQ2QGXmzDmTRBE7Yq7sNM60xDd1hG1DL/kccb19a71P6ApXkVQ6Okv1iH+BF7z
         lHYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1772780688; x=1773385488; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVySQsieckJFK9NwiXNz9/fIecprCPpUdU69L33AQGM=;
        b=wVJ31CiOIRxdh8damH5PXG8QZ1Cr7wuq16FajrZ7UqLseitFXtou+nXkK9xL9A0hN2
         jYPhNxgdL8RPkWlFJTuA5cASfi4J/yZPfnLu1YC4kisvcnvS1LRXR/0BYglZWWrRikvS
         Rie+jrJX3QV91eu4Ra4+H0UT+rCb/jqgWHOn/QxK7QmgmqyTKDT9NORZA09a9lK3jAEJ
         kg5dawT9fojV0KGRILyVvKEqvE8Pe4WDwxLjc4UYtkhgAS6WXIvmMY7DeiQXdt0NqHcq
         3Zx6ffO52qFPIt4lwXYb1C0CA3TeGoxqbe0mb3TE0L9WQaHNqjuJqeUB/6ZJxQPynJZE
         /waQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772780688; x=1773385488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HVySQsieckJFK9NwiXNz9/fIecprCPpUdU69L33AQGM=;
        b=oLOwqqApwXq9BUvy4WhPUUv0GuLD8n6ikFABFP/t4rhR4AnqMP5/w8VEnlvg9nZvRj
         F5GQbMiNQIpaH+k9N8eJOeuSgeyOiT2wOEFoX6zoQgH+Ix0wLicMM6SGoecVESWGJFU3
         6lTKx88LC10m1tKhxz7GDMZRRRYL1mX/6H4frcLW90Csw/DILHVKS7SN11zG7aQgHVYl
         VYzjk+7pWr3Ul7GRIe5qSfuRRt19jzEf5o3CrDb1fyKzK3bO82ajMx7eUs7jt3xveBXE
         IWJ1bAW6hWlpzJ0EcLThNyXXSRojaJ3R6mPoEREuHniGt1JOqBto1k3RJmyyaPWkZtAX
         1b8w==
X-Forwarded-Encrypted: i=1; AJvYcCXZsGweDnFvLsgr0lz9tCBQSWsBxXvos4mGI2SRCz5cfdhV3Z/c80NpINEPbZP45FoHDCJeTlFAm0W2bOCng88=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd9qW590DiC9bI6IT+lJj/U+CMg/mla2O9wBJbL68udq8yNMZK
	uPbl5rEGfBGN/nij/N92v3WoAN+eFlD72taiWISPhrDon7gfMwp61K/AoL9522H9n/dtFzP3ocy
	ZVVXY185+QvQO8ZnozBrq/7WZDaGha0fF0zZLTd6O5w==
X-Gm-Gg: ATEYQzwL5wEY+I/ryz++HEuHdC0qxGasOnc+dxDOV7HCefduL149/mh33q2OxuFBFPD
	Ci04d//so7z+glNjrmKwF0fntVSR1P0hDDeAPljhwGngCHSqD/PU2op8MvNn0AWz7G2fMgoavvT
	aRDF9HPxdnzyGRRjFvxsb2rvIjPSMPgK3/n3kIO0A27H2hwEu4zuO9o7CobwREOHMUT68IqrFNp
	26dcrJpRL0IRWKwFpN6zCfhvWSIv4mzxqnAzW4wYE6jyGMm2uWOh2dLtXMLIyrkbCB6XAiy7r61
	AIDXpM+1Gng6kj24tqMYRXRDd9StprryoWSyKovZl4W2T3QV/ptO/nxXWO+gXUCFySwMdBUfQjy
	Qf/MIhNzpJG3QXx6JhbzpILHHvg==
X-Received: by 2002:a05:6820:1ca3:b0:67a:3dd:3fe7 with SMTP id
 006d021491bc7-67b9bd2ef0fmr746008eaf.47.1772780688470; Thu, 05 Mar 2026
 23:04:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com> <20260120080013.2153519-4-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260120080013.2153519-4-anup.patel@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 6 Mar 2026 12:34:37 +0530
X-Gm-Features: AaiRm52vplQjZIJ_yYHgtG1kWnM8unoFggovyMF3JIYyAr9uZDY-IpREqe4Zs_A
Message-ID: <CAAhSdy1jeJVHgABQxEzKCqYKLQteVkzM6p5mz2vJBY5A0gmFkg@mail.gmail.com>
Subject: Re: [PATCH 03/27] RISC-V: KVM: Check host Ssaia extension when
 creating AIA irqchip
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
> The KVM user-space may create KVM AIA irqchip before checking
> VCPU Ssaia extension availability so KVM AIA irqchip must fail
> when host does not have Ssaia extension.
>
> Fixes: 89d01306e34d ("RISC-V: KVM: Implement device interface for AIA irq=
chip")
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>

Queued this as fix for Linux-7.0-rcX

Regards,
Anup

> ---
>  arch/riscv/kvm/aia_device.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
> index b195a93add1c..bed4d2c8c44c 100644
> --- a/arch/riscv/kvm/aia_device.c
> +++ b/arch/riscv/kvm/aia_device.c
> @@ -11,6 +11,7 @@
>  #include <linux/irqchip/riscv-imsic.h>
>  #include <linux/kvm_host.h>
>  #include <linux/uaccess.h>
> +#include <linux/cpufeature.h>
>
>  static int aia_create(struct kvm_device *dev, u32 type)
>  {
> @@ -22,6 +23,9 @@ static int aia_create(struct kvm_device *dev, u32 type)
>         if (irqchip_in_kernel(kvm))
>                 return -EEXIST;
>
> +       if (!riscv_isa_extension_available(NULL, SSAIA))
> +               return -ENODEV;
> +
>         ret =3D -EBUSY;
>         if (kvm_trylock_all_vcpus(kvm))
>                 return ret;
> --
> 2.43.0
>
