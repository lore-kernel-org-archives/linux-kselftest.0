Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB5F3B9D84
	for <linux-kselftest@vger.kernel.org>; Tue,  2 Jun 2026 08:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387249; cv=pass; b=Xjh8FJriwp+4bJem+YoCC24Ldq3KuEEoRJjs/93pl5yE1uOOU/NO29OWN3MlcRxSroV+qkLktztZ113UsgqSpDB1aLHwLdV4aBGiXHq+YHsblmdJHWH5qlXM/5dNB+H9GOye3HoYRkztuAEfKTofSpX34rt8Is9YhVPH9iW/r2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387249; c=relaxed/simple;
	bh=0QwXYwBvg675psDiJIcuodozupH0wLewizlDulSLAJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pgf5fPUcGnzWGVaYARo2T/Udui+U4FywhMdu1Sbn4Eg0Wl35hTKIKJ46h78Rnl14HDug3dVUtjbk4HaIGvlffZQdXyr/f/iqjP+TPtENgmYLNqQGD7H1kPfO4dlGCb8W0N2UkHYK3WZrOkFQHXDEqjjhFQLAWdHVXvdLgKgNBJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b=ORxXpxaz; arc=pass smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b="ORxXpxaz"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7e6a306fec0so1665981a34.0
        for <linux-kselftest@vger.kernel.org>; Tue, 02 Jun 2026 01:00:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780387247; cv=none;
        d=google.com; s=arc-20240605;
        b=KNjJlN/N9aIhKqsTNuh3dE+KqRYM9u5g00Z6O7p+fHPWkOjxRTjE+FMxHxEizUp1bV
         rtjTg54rCzPcwNT1+7hIEnRs0on6R+ovoO2pQ2513yy/4+5EhdQReA8Q98jjRDfPhwds
         2yhiKLlq12Tqd1yaGE4voyjLFcjULxevJUs0opz00AaVAGcPBtJvX5/dFGCS5JObt3/j
         5wDNL4Va/t9RfCjyCsgRz4pXY/I80am9rmW4I0ytUVi1EEPPISlb3RyQS/6M6BD3QEwk
         MUIHUsGvrTTUaX3hqZphA72ibzyD8eQxzbje2mGatonje2UaDqCHre8hro5hfXGoUBS0
         J9Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IgrLvh/X4k97Px4HlbHkqTDpeesPxMpXfPyUt4B4fe8=;
        fh=BDoC7uZHtKJ9oe/xxs69Om25PeW0h3FCuz5MgpM2fpc=;
        b=KXw3vvRx8dzb2AI/y/mU9QokbC3icixTFWJO4bReNA8W5C3u+mPxL7VNMvQGhMCPWr
         rg5w+n/KCnMMjGj4rFEmstbOOCZhXOm98YNQC65H9Ye9iuVM79pXbOiVOo8OnK+S7JLs
         FzKDMzzYKskfYPSSZU1NGoAJfDeUl/K4UVTM1p2HOFd4ysJjRuhsulV5LyMPVu2MVoLZ
         d81tJqiKfBy4WACRGjvGTym+VdDhAAWTT5Tqpl1Q8YfBs3tHqpp2McddojIME0tgjr9n
         LHiHRsvYPTg1ZS9B36l+z2glcz32r5u0FCAKqw6b4HmBt+vEARGRJkn+HkxaofPo5VNy
         3mHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780387247; x=1780992047; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IgrLvh/X4k97Px4HlbHkqTDpeesPxMpXfPyUt4B4fe8=;
        b=ORxXpxazX1GZW/gAMGVnTDgkK2Z0euMod3awh8yJ5XkSzKJg/fUeKn0RUUr+ygvOCo
         tQKvVNhPPwm+0mq/zlz9odjTYlH+VV+DoJ4c3S8yFFb4rSmR6HU2mHQvBd9O//w0agLv
         ISmGobt4FHytmbOEG/QtlkIlvvi20AZEJ3PlkyCpW2HslL8/5SUupCO1qgHHYpnr6lSc
         JxAeEpN40ckMUWEhCnDdzcet02AzPqlszoe144LsmxbWL2tVrXV0Z1Qf8pncxKLIKvZd
         +9evwLe4FBEz+7NgrWbZSFdQ7RuhXKA9ffQaGqxQaZu529oz3CHU6WMTzQO9K6PP82QK
         EszA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780387247; x=1780992047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IgrLvh/X4k97Px4HlbHkqTDpeesPxMpXfPyUt4B4fe8=;
        b=gS+mrunOUPl1e0AGmXygrcWM+Uk9D8/RB32XBq8f8YEcYi67M9MXAITa9bNH4iMvgK
         Xx5+P5p2locmcHMIk+rRuHo+Cmbvi4iQAicX3ASnQDq/N5fg2hasDq+Pn68ilnTpBj1C
         vSLXJn5Vy5sci4EQ/nDbpxy9GzxDOEiJ1xw5O3+OBH/xbf2aTmXwIbxKeZZpS1hQ0HT7
         NxQf8FT4mQABmWrwi/zPU6YFd0c41yl9qA7hnKQTfgBTBgoHpdAWc2OK/PXdiR24Vw6N
         gX6+MIaKgaVLmp1xSAOXlAVpWxMAhVkCHykN/WxmOOlkrXcdeQ+qXr9MDYKyod5iKnIE
         TaeA==
X-Gm-Message-State: AOJu0YxaMBgP7AE92jvP7lJoNO1OaMlcs0T3hB5d13/SqpSDB6T9pEds
	/ZymAmzj8i7WAP4jHqGKgJqBJSxN6S5B1WEYP1ECudatMq8oC8tqmOqjkXfubluyMKGqjj+MH7W
	/qpKsLnKz8/4kfZMrfmoLvfiVfyxP7tXFCo3t7I778w==
X-Gm-Gg: Acq92OGVXM/XgNx785P3KdRS1fNyyY4LQYAfQZ0gBaaOTE0jZZIJKfxDButRmKjMfZ2
	HDhazomgyV6/Qnx0fmpP1DMbjZpF+fXzqjxZpj9L2UfJm6nGIg1BJ/+R5LIsSO+7r5QYhfPam5R
	qBaqgF7qSL7wePJFjvae/4zl5XxM5kodpaDpKBH+tEDxXy6YzV6G7lL91slO1Yc98T5+4/ve5Xd
	sJ75ZilRSgaF5eY6BaSIgBoNHUYtO4U5pF7XHlKmQNRBPcFt+lO8LUSCknhjSFg6r/ZtgpLzSRX
	Ta+NQt/uLzZAhxqH9ddJSV/aY6xJK6CHDmhJV07mwjwf2OyGDs/pgwa68E4s1udFxW1/FlLMeTu
	/VFUCSpmzmXgImP53CeyVz2eIi9Lxi0zOnG09wx7yKyK06Fb0
X-Received: by 2002:a05:6820:4d06:b0:69d:5138:5540 with SMTP id
 006d021491bc7-69e368628ecmr1455529eaf.9.1780387246859; Tue, 02 Jun 2026
 01:00:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202605111849442561v1a0B_7W1L2Z-ENusLaP@zte.com.cn> <202605111130.64BBUjU6013213@mse-fl2.zte.com.cn>
In-Reply-To: <202605111130.64BBUjU6013213@mse-fl2.zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 2 Jun 2026 13:30:34 +0530
X-Gm-Features: AVHnY4Ly_ncquhNUG3b2y2WGAOsB8396bhb2a_G3mSJVFu24acqBWILI6kpavM8
Message-ID: <CAAhSdy25JUiM2QnJbvqsQBu5eaB4L2TdSNfkmaaqFMjNOk+Stg@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_2=2F3=5D_RISC=2DV=3A_KVM=3A_Fix_skip_of_valid_pages?=
	=?UTF-8?Q?_in=C2=A0kvm=5Friscv=5Fgstage=5Fwp=5Frange?=
To: wu.fei9@sanechips.com.cn
Cc: linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, pbonzini@redhat.com, 
	shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 5:00=E2=80=AFPM <wu.fei9@sanechips.com.cn> wrote:
>
> The current gstage range walker unconditionally advances by 'page_size'
> when a leaf PTE is not found, e.g. when the range to wp is
> [0xfffff01fc000, 0xfffff023c000) and page_size is 2MB, if found_leaf of
> 0xfffff01fc000 returns false, it skip the whole range, but it's possible
> to have valid entries in [0xfffff0200000, 0xfffff023c000).
>
> Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>

I see all tabs converted to spaces. Looks like this patch was
not send using git send-email.

Please rebase and send updated series using git send-email.

Regards,
Anup

> ---
>  arch/riscv/kvm/gstage.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
> index d9fe8be2a151..2b141a78ecac 100644
> --- a/arch/riscv/kvm/gstage.c
> +++ b/arch/riscv/kvm/gstage.c
> @@ -429,14 +429,14 @@ void kvm_riscv_gstage_wp_range(struct kvm_gstage *g=
stage, gpa_t start, gpa_t end
>                 if (ret)
>                         break;
>
> -               if (!found_leaf)
> -                       goto next;
> -
> -               addr =3D ALIGN_DOWN(addr, page_size);
> -               kvm_riscv_gstage_op_pte(gstage, addr, ptep,
> -                                       ptep_level, GSTAGE_OP_WP);
> -next:
> -               addr +=3D page_size;
> +               if (!found_leaf) {
> +                       addr =3D ALIGN(addr + 1, page_size);
> +               } else {
> +                       addr =3D ALIGN_DOWN(addr, page_size);
> +                       kvm_riscv_gstage_op_pte(gstage, addr, ptep,
> +                                               ptep_level, GSTAGE_OP_WP)=
;
> +                       addr +=3D page_size;
> +               }
>         }
>  }
>
> --
> 2.43.0
