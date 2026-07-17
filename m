Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333DF3ED5BE
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 10:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784284947; cv=pass; b=raVfxf745PcDIlqf3kCnLAlclznG/acOy8uLXXPYrAI2FYBewlShONOZ3IDs7nPtFthyIP/4CRJNXiUmQTROtR3bstJYD6HTb30qsGcL2R7TbJntQ7RuOEyjT2xWAdm6IRn4F+g3lklFETemn1FNREdF4njuk3f0aOupyPB9dBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784284947; c=relaxed/simple;
	bh=0R8llm0EFrqZ2IbxbCOlkG+jKbWRlRuWRiKKZa1D7l8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VzPMBGNTWZ3cCKqMWvqSnlE1fTI++NoSHDkJIKuRbpR5FJopyM4g7iuHmW8oyORt8WwnpzitWygCXHqhxWZy1gaJuM2HQbjcnxy7Y+WsI0C3dxixVhrkvHKT4mvDhlrRBiGzCmRGGeIgRgkLC/tS5gsoA5RYZrPwUoz1h1PTLVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nUG2sDLg; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nUG2sDLg"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c15e592da74so942944866b.1
        for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 03:42:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784284943; cv=none;
        d=google.com; s=arc-20260327;
        b=h6oFXKxnxzmweEiYHbPur3ZpL7Ob9AVxnqOdBfmsSoOCI3aJbZeqcYMVSJd9QSpTca
         lZMIgBx/iYnf6rJv3qv3kfW8pz0TZvA2PEjf/xOKc+m38RSNPUB9E+qebz4ZwMFLM10r
         dzsp6QYXWj9qrkbOTuKiAPsC78gG5JXpFX1amtQdJv9NtbaCkTcWZnx3KHneW2JcB8Hv
         +hli1OuPeN4RiQGoZRMKp2Cq4Rd1fgaEzkIH2zTM0j+rXYQb3JUxMX9vZ6bA19Jtlxma
         pVL/IEHRGsn8Eu2o/UTeFQtZ0MbhKfOP2KzFiAiYGjxtRh8Nn4YlLUN5QG4Qy19KZOg+
         j3qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7CDNeDBUT2qdP6O3Gq1ihGrb8xj5GO5o5nq7iOfnSkY=;
        fh=FGq4zuvlwF6sWnLNYOu8XBr+im+bpeG4LP/mGbOVN80=;
        b=HjwY1ByfuOMI2VRR/zhBA8yTO/xbWN0Sp05Efgwa9GGz298gB+rnqMJy3w0qG5hE5+
         7jcVZf7DT9F+3ZsnuYptMS1D4nkKWtSQwgqNtl4FA8v7S+xM/NwSeP9s6hc9oTbng4IQ
         9FvfYS5mWDaHCkuGOrucqKMW1ThMYiQFEntH9eMgqa8b49FENef5Oc4IFnWtoVtwVyRA
         EBSDGIXaKe7+mQCyLex45oJa384wYLYHHXBbVN6IVp8yuyp0xoXecokkz3er3TrQWL08
         BzEgq9OXaY0nDvAnT6orhMbpkywVZvE2DUPI9sosiWf01EMYcrxtoTmf5ZzIEdCNCGX2
         WiAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784284943; x=1784889743; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7CDNeDBUT2qdP6O3Gq1ihGrb8xj5GO5o5nq7iOfnSkY=;
        b=nUG2sDLg/vTGqGSqzl+Pj/t2uyyoF8LbAtu2Hlo72e4UAjFEG7I0B0PWPWk4VvQU0q
         OLjYiu+PLQkfjItnO32+DXUceU8qVH9JiQwu2zVSiTNTSj1fmAbpB41J27ptXEx5I4KQ
         5nXUXbRe5TXBpDWMMfGN5gZF8p2etq0VeKV7LQPubWcbGPb6wijajz8kClSbxuV15l90
         uyC36fbrTc6ey0n9x99A5GjfMw2ppvQ0CJ4x8k5FGdajiodU3w3AQ9a5I21Qf1oBB8Sn
         F90NB+99gHDCJwTTrBwMYCmLc14Qlc7Qp3n2S5dcx0We6KAL0ti380i1lflIfO9Df/15
         3YbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784284943; x=1784889743;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7CDNeDBUT2qdP6O3Gq1ihGrb8xj5GO5o5nq7iOfnSkY=;
        b=cl6HZ2qCJYc4aVnKJ9ScXRnpWOo04VkgXs+HDLEv9xxiM1Ugn20ONed5xhpNw5YOE4
         gtbGik/3MotgMlrVTbWTZKRu3QlpdHTOG+7vcu+XDgaEBfbY1UxfdM/HvuYr74dndFEE
         iz4I4Cc7UKWCxnytYOCxQtBSV98sD1FNKE+dizneIlIIgfu55nBJp9OTwDMZZXfQjiOu
         mdDMCa57w5hrDjLGYUF2OgZyH7pwCeB2Vr+4JKbhg/lCKayYUMCSwkTmpG8RwU8MiOx8
         xSvjgZuE54wOTM2gHvFypnFVtf2WMM9RI9dfXA2UUzK1kOpK1U8sE6pg0adolFu4DJ1e
         Yqew==
X-Forwarded-Encrypted: i=1; AHgh+Rq/+Ht5cym+CBMfhZSEfKh/N11VxQ9P8y7WOdKden8NMoa94ikXd+hw0TZdWJgeg4tzZ9up94fXHJ2uBlIdOJc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDMHSe0ighCHWCuwaFXQJvFfhbOx6Q+O6qW3iGGUPbbVkyuEXv
	moMrQIYl6TaAsBEfGhdXCAtu8JnEVaAd+NsGqw6/1a5okkPk7ozsM8PT4ACOkiFafsrRSaUKEXX
	car2eXEUCfd96itgw052P2rhRxkbtMJE=
X-Gm-Gg: AfdE7cmonm6LzuPyXRwUBb6mNilMNgipK+1Hw0ohIbdEHbloPiDC/LMSQapKzHYRdeq
	JsGiwODG5H0vdnnf604EU8WaeXwLzXdyj3POOrC9IUq9qMLiazCIR3YrCiYAvMMIsElsYi8fyNz
	gThP+Iy5NGZugOl+8k83GbPoMq5Bc3aTHsGzr1REcHpxSItBW0TZZ+Ydi5r9AEkeeCBIJqeQwfW
	hCdu8ScmrH+8q6FPEDv8mcYSKv5pACNcpXWwTH7ZDB7M1P0SJ1nPB0JBcXf43ieVFRpSGI=
X-Received: by 2002:a17:907:c0b:b0:c12:6d25:2c7a with SMTP id
 a640c23a62f3a-c16b46e02camr92779066b.17.1784284942904; Fri, 17 Jul 2026
 03:42:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709101327.9508-1-royujjal@gmail.com> <2026070925-delay-gauntlet-bc7c@gregkh>
 <CAE2MWk=mm8_bkd54Gv1mdox6rfvx85Dd3AjOCxPz0fPAfyuWYA@mail.gmail.com>
 <2026070954-activist-left-8303@gregkh> <CAE2MWkmcQdhGp3LTMtpgAse3AFcfKcAcpQe89+iijfP5e0w_QQ@mail.gmail.com>
 <2026070948-lively-exchange-a458@gregkh> <CAE2MWkn3L7V3x8i0F-soGLxsBBo_Umgs1pJ3FwCw1OW7=U55zg@mail.gmail.com>
 <14350a31-ffc7-41fd-84d3-6cfb2cb96841@lunn.ch> <CAE2MWknt86W6yCtuS_RupiuwiDqXT8wZqENM2DjiW1R=eY8qdg@mail.gmail.com>
 <797773e2-b155-451b-ae97-e8a005fd2d86@lunn.ch>
In-Reply-To: <797773e2-b155-451b-ae97-e8a005fd2d86@lunn.ch>
From: Ujjal Roy <royujjal@gmail.com>
Date: Fri, 17 Jul 2026 16:12:09 +0530
X-Gm-Features: AUfX_my1PzHSS8WAMVOk58Ferv5AB7ZeFGvF439u5znvXo9fyXEAn2XHzEUmwqE
Message-ID: <CAE2MWkmbdDrCw1HUKm17QG7dyihuxg_1VGTUNeBq9v8NVwJV3Q@mail.gmail.com>
Subject: Re: Please backport bridge multicast exponential field encoding fix
 series to 6.1.y/6.6.y/6.12.y/6.18.y/7.0.y
To: Andrew Lunn <andrew@lunn.ch>
Cc: Greg KH <gregkh@linuxfoundation.org>, Linux Stable <stable@vger.kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Ido Schimmel <idosch@nvidia.com>, 
	David Ahern <dsahern@kernel.org>, Shuah Khan <shuah@kernel.org>, Andy Roulin <aroulin@nvidia.com>, 
	Yong Wang <yongwang@nvidia.com>, Petr Machata <petrm@nvidia.com>, Ujjal Roy <ujjal@alumnux.com>, 
	bridge@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> It does not force the users to use a value < 128. You would need to
> return EINVAL for that, which i'm not proposing. Returning an error
> could break user space.
>

While I understand that clamping avoids breaking user space, silently
modifying the value might lead to unexpected behavior that is
difficult for users to debug.
Because of these side effects, I am hesitant to proceed without the
Multicast maintainer's input. We should raise an open issue on this
topic to get their official decision, otherwise my preference is to
ignore patching this for the stable kernel versions entirely.

> By clamping to 127, we don't break user space, but we do avoid the
> kernel bug, and at least to my superficial reading of the RFC, we are
> "language lawyer" compliant with the RFC.
>
>         Andrew
