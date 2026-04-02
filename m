Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21CA259CB2
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 16:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775145630; cv=pass; b=mssZEkjF9dYjnVLmIJ9dyKpNpIP18AKJybPymXeO67VZPEz2Ds37hVBhbwfQ2DhBiKgQj1qCJ9rlv9lmhkeogybexteYLzX37Vw4B9w3VgNEQd4WR90Bmaome+e7spPnGdMr1wx/7lVW2wN7s8e5aSO0Z0g7B/rMY9vE/JS1qdQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775145630; c=relaxed/simple;
	bh=7YkuxUFn56TUXJI7/gBIV/bBF80lP9EXTcMtIG8OsN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q2FR98IPOMiFgZ+/QNztER3p8WoXASdNdnDz86Uq1hpw3gIotqlCqdTtxTY/bXzgm3tQvbst5Rv6ktt1HenJNJL3z1pH8s1J7Lny0DXeDg6DmD1i07E4LPyDoN3s5KOZGkjPkTLI8hkR5BBbLtqmsuX06Dmf0TRttwIEGEwCLy8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=kZWqPCKK; arc=pass smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="kZWqPCKK"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-67c1b8b1f96so603223eaf.2
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Apr 2026 09:00:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775145627; cv=none;
        d=google.com; s=arc-20240605;
        b=NC/CCcBSCjM/3PhT8xjRXkRunKHPCcqi+h4ffA7PXI+hxlwG0rTme2RGx9Lj3rGjEe
         MekqbeKddVjK0ZOTBgMGlt4hib78SSC242WZr0jfjmVxsVcIik0DW4FB8BcgxmzvyEOf
         MsDBaRQ3eYSgCPtQS+MqxrgHlrR8P3TGAR3SqcVzjj0MYT7maDF7XPKUxzPCvY+FKika
         FCoegEwOuivKUNPDSQBDQ24w2qLnjwQAoM3cRV8TPNDeQjfh/3+LfIxLCttAqWbFXhpu
         58MPQ2zGXnvCEoeS9MCZ7Gi6VcPSM/8yz0RdUGkg41azZVJsynqyC4wdNTe3klzEssYB
         +bLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WtM2gelQtlkDLtUyeOY/RQAEzxS8kBtRhg00qUrjMDQ=;
        fh=0rew5S8fGHezXGzK/L8sjUlFY3fRNOcHniVCVncKoP8=;
        b=Zu9lYGQC2oVcU258ChERh+sU7wokM6DrBAiN6O6vcwPLhqbwZyIb8fK1Usty/C344t
         R6kkRBti/GODlZ7BAKvZXy+gZvK89pLHd4+Im7WITKGODxj++be+HF7wmtAHqcLhS52M
         1lKXki2ibnhGAmn2pjmha/1+eoD58qA907/4/UC/8Ptvquh7k1HVZMp5foGRyD+nnYjE
         xkzzm15z0ZOF0GxUvg5POnUyhBK98EDc+0ly5MXUzaO/wVUVSdSNVSpOLdZ3279ZnmVZ
         CJX1wrbzb6HD03qSatUCyEWnbJxBxJeUub3kJyowBF+W2jHhTrbCxvZWx7zsT8CtseOQ
         1h5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1775145627; x=1775750427; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtM2gelQtlkDLtUyeOY/RQAEzxS8kBtRhg00qUrjMDQ=;
        b=kZWqPCKK+rSvS0PU3djNTzI5Un6IliGJD2h3RwVVYHa9o43/OuOWGvh4kxlWHcLq72
         AAykxcYCTxYDzHitQysXNXtnQYiEcdubIw/Pos94tBK3B2gdpJ/K9IQzf4yWAtz1RCdt
         ErR+gQuXytJ2UyBA1e4EvXTDT1hlhe7Sz7CLwqD9EL/uRZfsG5Sh6nE2Tc+whD0jOYvs
         ZE6nbm6iMqyE34dwjkfTTKNIVCPIFC5FW0r4EGZ7BVRtQVAs0KviCTqhdlnK+LIzVafW
         WV0SsvSYE3LsJUbk7kYwyftDJazBWulpLrCLB8F68QxqUEcHLDi7fxK7QoWT/c1HR9yq
         C33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775145627; x=1775750427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WtM2gelQtlkDLtUyeOY/RQAEzxS8kBtRhg00qUrjMDQ=;
        b=D1N/G35rJYu/XV/ZoN9rkrdqRX3/kLIKELkXh3o4nS5Wjuo7jQNv3Uac8/QWLFeOJJ
         KQR2GGk8s8QqBZns5S3WJqdidBqplVUBE/pE389CjClIqTZYnPnHLUwrM+dPVYYBWaeO
         9SkKU91ZsGdI67eV4YVfTxl1SP9ZDXqPJAM2KvHkrKO2DW3j5q8oN32o+4KmqumlE0Iw
         VDdWA0sW1lKTV3UNCDZWh3kkZwQULr885x+PByEGO6gp8WCfWsgJby6+DsTnnTcZwXF9
         aHsy4YpJGYzSIPjURbkCAOdGE8pDpzAbimgQu0QnG3M9XJzQiHuzzYPiLJlrUKP1cbF8
         fltw==
X-Forwarded-Encrypted: i=1; AJvYcCW+KqYtgZzgoM89T6Dh8O7LxSC87de1KcKOSxjasSH/3sqeuPTOYuRjkD6QyVIyJ3rvG4P1XPISJZAX7d4xzGY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yycy8/XVIza612kwEwEw/rczHvrSgzP7aFqAV5NRMl6QrXoQcCf
	PbriZuPYgfeKAHHjA0Njycz9fQ+FvAlZaeVa6yDD/nlRQvyfNT2gcCAkSsf9dhrpfxtyXmMu3eG
	0CDgyLkrWK4J8vODOpXFrhb7zkAP+609k5OvodZyPfA==
X-Gm-Gg: ATEYQzxcfV3IowIq2GwwPRQAHp955DveDI9sTVK7aA4VKxBF6WHA1OWcaIM67zqeqdr
	k0xpTFstIcOnpIIi5ewTE3qde6Oa2j4T9f8BgTPPMw/a3LseAal5zOylk4TnQCgwW2wUZpz3v11
	+yZxnasUYucYhlfRONaZ9yayMSKoHIFJMDTixHpLJ6IxCg81EGBOx8VnILYClXFnHXSIebCDnuK
	lGlauUtyVaMMpD07iHTWLem3zoZL0e3Z1HLfLIHpPjH+VM20SLROHnbCEmERPdrIyBVY1ThFD7/
	Kpm/GiSVkRcp97zYYdeEpXCJgzPyhvk5YQkFFqexQmGEzznjt+xdQ6ROmTICJ8JGv6ibmQpOPr/
	g5LbvUkHHrn46aeyF5UpDrFfIIQ==
X-Received: by 2002:a05:6820:1992:b0:67e:16b4:aa07 with SMTP id
 006d021491bc7-67fabd02b7emr4353699eaf.61.1775145627522; Thu, 02 Apr 2026
 09:00:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402101818.2982071-1-mayuresh.chitale@oss.qualcomm.com>
In-Reply-To: <20260402101818.2982071-1-mayuresh.chitale@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 2 Apr 2026 21:30:15 +0530
X-Gm-Features: AQROBzAd1C5PJZt0gGUQZy-ZILEi3rG_cTSfqG4yBNpRYZjiqBUpj0qc4P6OGJA
Message-ID: <CAAhSdy0FP=-KQV_QaMVWJz9gwEzm2BdVH857MWx28Jej+S+vMw@mail.gmail.com>
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

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

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
