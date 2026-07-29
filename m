Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8801B3D9678
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 12:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785329107; cv=pass; b=m7Mr5quC+y5ugg6fgE2Nkv9PYhOVRMm8nthE5WPpPW6fpFlDKmjPG+W+335oJb9/qQYvA2XkQ6Clg+4RUWlL4R0I3uoeAvwRGtCbmERHn4lcWqiIe3ptyMa/epbrcf9j77Fi8w8J5E3v3oLgKbzp3HbUTkDK4b/PXyMooJIFOdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785329107; c=relaxed/simple;
	bh=IcXINUZJryrsa4j+h81xUNPst6VWPwwEMFLIqHPQgjo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GkwF/JMxhzEFcPfBgDn0jvzB7eAoKBiatXV7GPWq+T4cAEuC3doXYCE6+qD0pFpwmTETmthrmVGNFhWxQC6nbixYF1312xWynZCl9lC80BASDLov0VCswHo8ddXKnP1JeY3zFbuXdpcRkPzg+44pUzMGg8wfNNojB8HTkVhF0P0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b=OnSS1ZsR; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b="OnSS1ZsR"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47de008b020so580985f8f.1
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 05:45:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785329101; cv=none;
        d=google.com; s=arc-20260327;
        b=Mr1GMtvWtSR9dnz+66eE4VFVNPji8jgyx47T81439vssFCo20LcJF6wYZ/YeOMVQDT
         YEXWUybuVDT9MGHAsU8v5brgXRhn+/hMYalkiiiByhlDuNPhYs5HzRfbV8JMcd4KZ52c
         xnGilVTYUqbm+P4YRVfrdfKO1yiFAGSERJq9dLv1HwPO//6ij37KNGdFBW9xM70crg4F
         Ewjs71TEkp5iIU75G0cSpR8Uf5x5LygfACozz0qhFMbY0K+cfZrWGe8hZiKw+sf31ZcC
         KRYGAhDF7upOCx8plI2hjXWuG41vtrsZxPWJTcYro/MdZ3/hB2qUBz1LarEJ6w25HiHy
         jYCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iMeNu4+os+LxYP0wqrGsNdF408ZfmMDEahTjLviYQ3s=;
        fh=ljsqDW3RRVzSFOavJ02WYQWJrBoJXdwntLC9UPNzkwU=;
        b=G7ZDXeiI6mBcAg+wYbCXnVhR+664ql5RHC2sY02SI/J+1k36jtrvyqhmBYxX2g9iJC
         QX4QMal30Up9ZiMzUNTQmdUeffvoiDaZ+GMDk5MShB/+UQBwTf6v7NDhhRaCcGslam6Y
         UXY5cVYNFpqd5BaMtCtnTWNeQZLOWloDMWq8F9ywaghZOKGUROe6bPViGx7afaj0YNEu
         mZET0KAoTERqmiV4jdcTZntuZl0FnZI9OT9aNPZHcz/ciXjbXt+6S8urhhGW4gMAAIw6
         BEYVX73tGM1b4EeOLDCpFBBGqwRRmps8Er3an55Rdrok6U3U8LZviD+rCgzD5t+sMZL2
         Ce0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785329101; x=1785933901; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iMeNu4+os+LxYP0wqrGsNdF408ZfmMDEahTjLviYQ3s=;
        b=OnSS1ZsR2MhHXiAieSXsZTBp+T/WucpSi/BqUfrCpFmdcjYFSDIUEkGSr8WdEOcFXD
         U2Azdlk4RHdVimItI4xrxZo59Z1AcEKRaZ/+N71NgYg0NGhuvCBPRHVGtGprabhNX3TI
         lv/oI3MC2JoHfV3xxDpI5LcNbbOFLZDwIwDAUxKRIe0+j0FF2jktxvxP3aOtglN4u4mz
         CDc27HrdlVHv29uJ5ARPsXRjmYeQUqiTa8wRsXzF1quUuLx+HLjoyHbg2O0JKqxKXeGl
         +BTkDjNBTIMJSNtkkivCepE0XReRScq4yPVoZGIlrFZ0SYmcYmyWsafW2ri792x/bSUO
         GY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785329101; x=1785933901;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iMeNu4+os+LxYP0wqrGsNdF408ZfmMDEahTjLviYQ3s=;
        b=bODUJ3tBW/UKhZK3fo+D+jXKf5NoNmsXA26m434gvpsto1XgvaKh74RAD99FTey8pe
         ZLmntYuaSGuUPhBD8igJPJ29WAzkhzIKZzrGLDH8IYavPN4TzdJpqFG+M4+TabHL10CV
         o5uJfU0IMOrdmxinmW/QycBoXmEgIS1ykJ3G9gJYZxyJe9mfsZK8LpsNfNXor5t+4OPA
         f2qDC26iNbQM4YnwushB5FCemTORLsX5bZUzqqyUtmj1q0YlG7k0pTKLJ7jg+srn6RAY
         noGUTW4K+5xNhUOpNDE2+x1YG1zkRnr05DRESzNQXmTZR9e8GDgNN1NUMopkRZigCxCu
         qV4A==
X-Forwarded-Encrypted: i=1; AHgh+RqSItG4JfJqnDBzK/06efKKf/EYFzoTqJOIASVXq1rW1JZKTKNFuR/U4by7uzJPTKDPYKB6waF9Y9c6iqv+m4c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxgal+i403715vJYkgpSKIxcrciZvmsRwa6qlR+roZNsBoW5DK
	/FltalTnnRZ2naSOK3X8HCxhB+6Lg3RQ98roI+MBmzOdc0foRyT5fXPvZ85VkJ5/ZE9lSFdgBJU
	KLbpesYl9rdiE1fQpTGdSGxrSmiX1y2Qgg8reGKxQGg==
X-Gm-Gg: AR+sD13NI214tiqkfdi+LP4CYDB40ifFweVlOe8JJaaCGlmx+uUhuSRvqBFCcjCz0LI
	wPLPOJcOW5MhkjQ/uUdJM5jcU4/EUU3e2N3hC9kvoPMzaaCT6Ji5+QUWPM9BPIjGyDdd/oI7PtG
	SH6Ds89jL8esc8JAooQ1o4lP5ZgkpxHvrqvd+Df6esz1qjC7/UIj/iTWgiaeCxnWE/bLQ43CAyW
	QyEWr3nY79dloK5AlsboUyYOFju/SM/XEjiM+Y6JO/hsWE5TkWgIac3glf75xPpsvcxTz4cbzRT
	SvRAcyArChtm0s8IQh1eQ4gPgDqLldFFK4xkQ8n7HFPe3F6FInfUCSQqm8XzuLiXj4bS1Ztr8Bu
	NW+07zLqoQVUH2XJ2K/MlOIjoFjh5cUgiLPeNOOEjfQY5gCviKKnE9cLg59WyKhg=
X-Received: by 2002:a05:6000:4b03:b0:47f:7ea0:6c20 with SMTP id
 ffacd0b85a97d-47fbabdeba5mr3222037f8f.15.1785329101087; Wed, 29 Jul 2026
 05:45:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713010302.303278-1-inochiama@gmail.com> <20260713010302.303278-3-inochiama@gmail.com>
In-Reply-To: <20260713010302.303278-3-inochiama@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 29 Jul 2026 18:14:49 +0530
X-Gm-Features: AUfX_mw9Geq8pnQB8DXZRWmbfgR1VWYBcvVSDUq0mH-M8_MwEEaJfPpEFqa2qBs
Message-ID: <CAAhSdy0nPJAkkZM07D0Xm0Sd6tB7D2MK1aYvWZk0Mn4MbnNKjQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/8] KVM: riscv: selftests: add Svadu FWFT extension to
 get-reg-list test
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Andy Chiu <andybnac@gmail.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Deepak Gupta <debug@rivosinc.com>, 
	Thomas Huth <thuth@redhat.com>, Sergey Matyukevich <geomatsi@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, Quan Zhou <zhouquan@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2026 at 6:33=E2=80=AFAM Inochi Amaoto <inochiama@gmail.com>=
 wrote:
>
> The KVM RISC-V allows Svadu FWFT for Guest/VM so add this extension
> to get-reg-list test.
>
> Assisted-by: YuanSheng:claude-4.7-opus
> Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
>  .../selftests/kvm/riscv/get-reg-list.c        | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/tes=
ting/selftests/kvm/riscv/get-reg-list.c
> index cb86cb6b3635..94e33b2ee796 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -745,6 +745,9 @@ static const char *sbi_fwft_id_to_str(__u64 reg_off)
>         case 3: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_R=
EG(pointer_masking.enable)";
>         case 4: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_R=
EG(pointer_masking.flags)";
>         case 5: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_R=
EG(pointer_masking.value)";
> +       case 6: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_R=
EG(pte_ad_hw_updating.enable)";
> +       case 7: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_R=
EG(pte_ad_hw_updating.flags)";
> +       case 8: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_R=
EG(pte_ad_hw_updating.value)";
>         }
>         return strdup_printf("KVM_REG_RISCV_SBI_FWFT | %lld /* UNKNOWN */=
", reg_off);
>  }
> @@ -944,6 +947,13 @@ static __u64 sbi_fwft_pointer_masking_regs[] =3D {
>         KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KV=
M_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.value),
>  };
>
> +static __u64 sbi_fwft_pte_ad_hw_updating_regs[] =3D {
> +       KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_=
REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_FWFT,
> +       KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KV=
M_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.enable=
),
> +       KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KV=
M_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.flags)=
,
> +       KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KV=
M_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.value)=
,
> +};
> +
>  static __u64 zicbom_regs[] =3D {
>         KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CONFIG | KVM_R=
EG_RISCV_CONFIG_REG(zicbom_block_size),
>         KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_=
REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOM,
> @@ -1259,6 +1269,16 @@ static struct vcpu_reg_list config_sbi_fwft_pointe=
r_masking =3D {
>         },
>  };
>
> +static struct vcpu_reg_list config_sbi_fwft_pte_ad_hw_updating =3D {
> +       .sublists =3D {
> +               SUBLIST_BASE,
> +               SUBLIST_ISA(svade, SVADE),
> +               SUBLIST_ISA(svadu, SVADU),
> +               SUBLIST_SBI(fwft_pte_ad_hw_updating, FWFT),
> +               {0},
> +       },
> +};
> +
>  struct vcpu_reg_list *vcpu_configs[] =3D {
>         &config_sbi_base,
>         &config_sbi_sta,
> @@ -1268,6 +1288,7 @@ struct vcpu_reg_list *vcpu_configs[] =3D {
>         &config_sbi_mpxy,
>         &config_sbi_fwft_misaligned_deleg,
>         &config_sbi_fwft_pointer_masking,
> +       &config_sbi_fwft_pte_ad_hw_updating,
>         &config_aia,
>         &config_fp_f,
>         &config_fp_d,
> --
> 2.55.0
>
