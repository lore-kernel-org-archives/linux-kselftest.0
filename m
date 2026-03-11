Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD74C32AAAB
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 20:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773259882; cv=pass; b=LvWaEDjtNya1hSg/wlOWAQWPfxzqGApI5LwSIr0CveUxbnXq516UOfBznlnH9sD77CykSjImuYjoirwPRMcA3bTJYysmCvJSbhiuKUTIRLLWDa1AA4QY9/MtVmT8KX3bsTAoZDWbAin5OTQq2acz81Os18wHXg+AXqYJbVdjaf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773259882; c=relaxed/simple;
	bh=JBLO345+S9XrXFNW2YoDPZsRBR3hdD4cmIiYnWNmANk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QGAKduX4d3/syVsFaAMsovAuCwDRfAmuwcRFyL68kRxM0eDJx//Uz5ifCEy3rK3drnJh3cseZc9aVIGT9Qx89Hw15MGSZX74FRnWD6H+EptsrlCW/wQacvd5oAcbg5vJx6YEBobiwuQMSIn7qO8bQqseiZFdcthYA9qRnAtQjOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nt0+G4tw; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nt0+G4tw"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439b6d9c981so218042f8f.1
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 13:11:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773259879; cv=none;
        d=google.com; s=arc-20240605;
        b=h/vYn1eJIPMuctgkzj8j6X8bTcU/wwUym1NNCymNEm/5psE0kXDHwiaOIS87EHCU7E
         8NJbc+cqytEi4q/lUUqJsBOwesrpXU326bVmoJbmOw9/QwWaH6jzZiCGtD1X8VgJutaC
         8H8J8hh1IHyLAq7Lro/ZV8tAEcL4SHHfYJYJqKw4yM2bcIUyxZ6ZRlTOXEiczBRdCopN
         eVQjR4jP6IDIhAwwVm4T7bb6BIvNX9Ag6+RNop+ogC75v6EZQWf461qADyexusyzfu6T
         wS/ANYV8uS9f5Xm86HufgLlrC2yZsfuxHUB+MCj7Ow6XW8kkLi4U+gNQxN7HI7edsev8
         NtqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EseT1hnQ62+LvGjpt3g7L4awuAgBAfDddMzVDpsX9lo=;
        fh=aWuKK/st+N2RcMqCzCtJjCVaSU+fG5CCx7+5wBFdVFE=;
        b=NJlo2migFD4hhaSsD4qJ7iXMk0NzkcrHLkwf630p/LPYwQzjCJ8oiKS+1rz1ZfIkmw
         0SXtWa6Kf7S3aYx7u4UjdSDxmZOWA404hTnmUdjywdwKB/2I0kWElwqifqUQnjPhmYKW
         FG/SuCVza/tOinKZ+0nsGTgMKPV2IbRqRVzYaXJrp7mmMCpZtPwkTwJ7ETHYzK2minsZ
         3PdeqRf2sMEwwxS92u/+8KVHjVl7bpWvt2cLmMSSgORQm4SucEsAfZEHu2R0uDnOteAv
         DbqUe7bY5bZsBsym5JRtNuk4qsD2GARlsgNapF58jZhEiiuKvy2lRHLTHXlv40gNYrmL
         eY0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773259879; x=1773864679; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EseT1hnQ62+LvGjpt3g7L4awuAgBAfDddMzVDpsX9lo=;
        b=Nt0+G4twsD60K87Qbd/OmOwsbaIoIcK9pHaarrOkAiDAbpD0Tkoox8ooSJ2usjPvg+
         Pc2zy/QLm7T5+WShEg0IS5MIiKKBHhdcUCrPhOged6m1fyoUCY1KLGaAZRzzX3Lqn3pj
         LPYWJ+MUEhI/4e/ICJVREzwYq6NH2NDMzH9Ls4Ac8ndiyTNKpPX8ojparDyPCJbMrTDQ
         6l+uWcsUUJqrppr831fwxWrsjplKmXo9Sm1POlcIW9Kc6VcyhrB3T+jcmNp3wrQZHJLN
         GSBqzwlgjGa/0DKobEzhwsPr3uhBnJf6Y7YmSLB1W+wpJn7rAMW8K/ZpRhfyg4RU+pD8
         rY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773259879; x=1773864679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EseT1hnQ62+LvGjpt3g7L4awuAgBAfDddMzVDpsX9lo=;
        b=YaAHd5nH2PfZpZcOAc/xVQRT39oBHKBAfEzwGqBipuOhG9jxhGgTBtQ36YBQVEK5rK
         wkqYG4dWgzZfoFmZLg7Kjgcpdn9qHIDe2GoFXnDGvEgY8iVIF/dKVDeS4tp00g6Z+4Vu
         ntwopafWcKsl9ZIeCjqCuFf7g7hmGWbjJKRa/1fFq6I1M1EPmOFlI8Fnn2gyjlOJwa/5
         rIzo1qrX2Fjv+5jSPLu6izKFw8TegPbs5afz5xGBrBMEnNdfs5XiAXvTprbynAJdcbiv
         rzqK2BEUomW4i5sErbW9gxK8Pdu28OOKzQg7LUDGc1vF86byL5F8rIr1fhyIcU8o/3WM
         rBew==
X-Forwarded-Encrypted: i=1; AJvYcCVcK+MK7fdxLbGORiTnIZSxjObziUGSzrLG887CG2jIhWa9iTbdy0bRB3dU61vtDGWK2zUdsU27rGAkJgHqjy8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBfovmbCBL75Xf/e01ntmauXwd6VtBzeUDxES3ykvHZ/UxK0Ir
	KuskTZ4eUl1Q4tZrleP1dkm+LCPk9pBwFhQzhbH46UAULxPigzQRK8BArO4zG1jMK6mrW/UQy+R
	U8a+nqToQ6Dcm6+wvKaNuWrk8uks0FI0=
X-Gm-Gg: ATEYQzzIkGe6KdbNtSXhOTifCL5TYv8Ve6jbolS7ph5zj7ILOUBrDbfe8oWDgvmLpVN
	f/SS2/E0mla6LrkUCIu3OuogqSpi10nG3p3KwIm0qipKjai8VTTPp2Xf1uarZtpSw96az+Icfwk
	0P/M7QakK19sA3j4akjfUsA2vFNC9L+PcTX8JBAQT+bbvEp25s0d5w+yIJSp7e0hpfYj45y4+Jx
	DD7xxPet6ePwp7ZaU21n1yAuXloF/WaKlVzpRowiPwjxA1oBXo44hO+WEp0Bk5cdPaC6zLyQ16e
	oNOwhNCVvYamHKmfJd/yWhev6C072WMofzDjZAi5rNpE6n+DO24yUoRc+pmIoLCGMdCRODawWW3
	gRY/+6p2MWkBv6q/owFKc2fOpjw==
X-Received: by 2002:a05:6000:1886:b0:436:1597:7c7c with SMTP id
 ffacd0b85a97d-439fdf64e97mr1872250f8f.13.1773259878935; Wed, 11 Mar 2026
 13:11:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303131453.328674-1-hbathini@linux.ibm.com>
 <CAADnVQKuARvSirPjnTcSifLPunCiKC4Nenq0Mr61GpzbW5WxWg@mail.gmail.com>
 <bbf6a46c-37e9-4d8d-968e-a99bb12dcc14@linux.ibm.com> <CAADnVQ+4N4WWLxan_qibZ7HmONJyMZaP=RF+a9tMSPoz=0LqkQ@mail.gmail.com>
 <09b101af-9722-4c45-bda0-c8a3dd417c03@linux.ibm.com>
In-Reply-To: <09b101af-9722-4c45-bda0-c8a3dd417c03@linux.ibm.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 11 Mar 2026 13:11:07 -0700
X-Gm-Features: AaiRm52MBkV8zoxY8Kd4D7gtJGs6xSsnBy7_9iwlYcaSkrmO1185Sd5jCetVIec
Message-ID: <CAADnVQKXN9dABYf=T+rfgP2ngDRYC8+-rS8G-881EiEXdVQW-Q@mail.gmail.com>
Subject: Re: [PATCH] selftests/bpf: improve test coverage for kfunc call
To: Hari Bathini <hbathini@linux.ibm.com>
Cc: Eduard <eddyz87@gmail.com>, Vineet Gupta <vineet.gupta@linux.dev>, 
	"Jose E. Marchesi" <jemarch@gnu.org>, bpf <bpf@vger.kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 11:03=E2=80=AFAM Hari Bathini <hbathini@linux.ibm.c=
om> wrote:
>
>
>
> On 11/03/26 9:32 pm, Alexei Starovoitov wrote:
> > On Wed, Mar 11, 2026 at 8:10=E2=80=AFAM Hari Bathini <hbathini@linux.ib=
m.com> wrote:
> >>
> >>>
> >>>> +
> >>>> +       /* Check zero-extension */
> >>>> +       if (val !=3D (unsigned long)a)
> >>>> +               return 1;
> >>>> +       /* Check no sign-extension */
> >>>> +       if (val < 0)
> >>>> +               return 2;
> >>>> +
> >>>> +       val =3D b;
> >>>> +       if (val !=3D (unsigned long)b)
> >>>> +               return 3;
> >>>> +       if (val < 0)
> >>>> +               return 4;
> >>>> +
> >>>> +       val =3D c;
> >>>> +       if (val !=3D (unsigned long)c)
> >>>> +               return 5;
> >>>> +       if (val < 0)
> >>>> +               return 6;
> >>>> +
> >>>> +       return 0;
> >>>> +}
> >>>
> >>> Overall this looks very useful.
> >>> I would expand with another test where a,b,c are s8,s16,s32.
> >>
> >> Slightly different approach but kfunc_call_test4/bpf_kfunc_call_test4
> >> cover signed arguments already?
> >
> > Ahh. Then may be tweak it to adopt similar fine grained
> > error reporting as your bpf_kfunc_call_test5()
>
> I Prefer this.
>
> Does the below change to bpf_kfunc_call_test4 look fine:
>
> diff --git a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> index 48dcaf93bb9f..6237c2222633 100644
> --- a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> +++ b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> @@ -760,8 +760,30 @@ __bpf_kfunc struct sock
> *bpf_kfunc_call_test3(struct sock *sk)
>
>   __bpf_kfunc long noinline bpf_kfunc_call_test4(signed char a, short b,
> int c, long d)
>   {
> +       /*
> +        * Make val as volatile to avoid compiler optimizations.
> +        * Verify that negative signed values remain negative after
> +        * sign-extension (JIT must sign-extend, not zero-extend).
> +        */
> +       volatile long val;
> +
> +       /* val will be positive, if JIT does zero-extension instead of
> sign-extension */
> +       val =3D a;
> +       if (val >=3D 0)
> +               return 1;
> +
> +       val =3D b;
> +       if (val >=3D 0)
> +               return 2;
> +
> +       val =3D c;
> +       if (val >=3D 0)
> +               return 3;
> +
>          /* Provoke the compiler to assume that the caller has
> sign-extended a,
>           * b and c on platforms where this is required (e.g. s390x).

While at it reformat the comment to proper kernel style.

the rest lgtm.
