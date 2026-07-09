Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9C842314D
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Jul 2026 12:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600978; cv=pass; b=r12FGtjpWz19DkoJvUFaaMpZ+/VbVT+DBkBWwSIwM/KAWQlLDr+IegAWPcjPHzB1qdEPy+7smPvNQSAExhvzWcP9pDhNlMi2iZU5g3y+t4Qf7vfiqZ2gsLGUzgG58jaEY1c6ct2rL/J0Pz4BXE8eNvGOLmS3VTH3j0tKD0tqF0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600978; c=relaxed/simple;
	bh=lGxuTmJonByeoKZLNGDqsTWGMGeNSB8gf+bZY9/34MI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OAAgqbVECdqo3LtHWFmTuDhObsOsREdtWDI1s6SUG0uZsIAIH1HAbYILW59bOjvFBgPdn9yFmNYAtM94r5RvbJlVwPF0+oj23sNw1nJSWhSGhg0c5B9kN6KUBX/T0BwJ5vTSt1DQLkkVBVRvPaLWN/Xs9FzOZbZGXe2+feA5EFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OOpesoQk; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OOpesoQk"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-698acd36d67so3668519a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Jul 2026 05:42:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783600974; cv=none;
        d=google.com; s=arc-20260327;
        b=kI72PfFpFxBL4qMsJ02A6by4GYzZSW9uVknBTQBPyNA4NG81NggShip2fx8N7H8vdf
         yzK3jxdJPTXO3QYfP9IuwJzwQnN1u4SN6EbesgZk2DZe/bOsgQqw6lM4d9I0CKL1DacY
         xmIoWT1HTKqoATIby1YClA5d42OM1lqcJb3Hu/YmlJ0ypQlyZits+kbw9oIGxeSBskPx
         vdGi8LNp0O4D62JA0Ka/FlhF4gWLwF3dlmoZUUriOyd7D6VZkWZNFwdDVswx0G8lr7tT
         UUHZcIkdYZH6u6kXwif9E4alm/Ybb7Wp3OhsBsqmnb84AnN6HtoouGCoSkAMCfS40XeN
         m7vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lGxuTmJonByeoKZLNGDqsTWGMGeNSB8gf+bZY9/34MI=;
        fh=R1gfgGTIy1HnWKO2NSyOwatMrR5two5pSGtYS/k7Xvw=;
        b=ObLHRue8y9EosOc+/DCxVYC4gty7AYHFCAlfbLPKJanjA9zayVHqWeESMq2daVtgBL
         H7q+B2ty4UnXLmE+nss/gzCdPXtNgoxTbz40qZbkewlas6AVwq34xHTVaaqfS+3SzcKN
         2HIkW4hlTConR1ssNEdr3uMeU6KCi0jNKXmU+RH/jdRzNDbT2pfMULGTUAD0J18xRydN
         Vk6ioiDsqVP4FkkPlA6WJqO6zqhliLZIueSqwseGG3BK9FTVH8ie2X7x1z/kIEyhKWp3
         DSjdIXp9onn6yvtVgvnBg/ketGjjY7vbgqyhJDhOKW+7vG755P6VcbNiZJodaoBqGm16
         z/Jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783600974; x=1784205774; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lGxuTmJonByeoKZLNGDqsTWGMGeNSB8gf+bZY9/34MI=;
        b=OOpesoQkL9ODcjf8lsUxf2MPbMrsTNKyPDubu/sUok1vmvHEX5ssLfKeZRgtG/9h+E
         V6At1tPK6vV9ampmZy38/HwsMCAOVec/B+rrVruZLguWfnBAnYEdeFdYlUtQPFvuOxc1
         jAXhP6jUrfG7GBWnNElrOgEFA00mQGTNzZRKhia/FnNle6ndvgFeel9NAmMsaY+9JmTQ
         Iq8CRPA3inpi/2Axou/c4/m6UaRU5Ed4xpztgNH7iuy6kgixq9jbQ9iHIiy45bJUzf5F
         NF6e+mH8Yg57lwJjLSqCYPIdqVYzbU7O1Lvl0iFBmh5ne/J6MoBuqmAYsqrh+ZwSsxmn
         RDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783600974; x=1784205774;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lGxuTmJonByeoKZLNGDqsTWGMGeNSB8gf+bZY9/34MI=;
        b=TpgMfuoozEuBgU/LcB0HmFVuLbcTe2gXUgkEx455UCt/bqYHnBDcjU9ZPwtJkHbPJq
         a8kG67qTKB5y0YTxGB8xF7V5u12pDKxqqssHzfqTLNqLrn2qAbScytn6YTrRW7ELmScu
         G9t66JcyGHyK4ujLtS1gFXZuwNfQFFAbjea9SDpMECCrz7OWgIXPK/mV4fUzVm1rX+km
         MjzP607y7pIo+wnoK10k2Au1BtC0s2fjMcKHaYDG4kdOxX7TbyPVnXioCnsciksYiDwu
         Bv4rrAZ8wDdLu869sWpIPEJPVIOBbhzN84PWZZ9UYT2lY8pgSn4h9JxFbDi3Ulh0uuD+
         3+qg==
X-Forwarded-Encrypted: i=1; AHgh+RqyOtRAAXMoJCKyJnopk2dxq8P6sMd1gu1pSGHtG02YEgY0S1K1uB+rtvvNhHHqicprui7VLFHYrgj+d+9EXHo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLdksJJKlYQEJJEfl9hR8Pd13DZx2dQHn8cgWGq4DTNHCi47P7
	HjWSQLqFlE2AvbEocAj86Gw6gOYuNjOh5D9nKbuXDZ1cbTm23QrTmz/5rwae8QC7tbgzh/+u1jo
	vo+HEx4bphKCL/ohsAtfS7sbFN4qRdts=
X-Gm-Gg: AfdE7ckxaCajoPdDc6ZGIsQeYDrb9kAg6OO0PdqGfBEd3coT0JNYTMSl5a6TNVbEsyu
	JM0TS9wKpzsfjPf8t6rG/tcMl4bcfqTsMJ66fyUEgzyUigPofnDsRgBt+XfBqBs3lUrUhe+72bw
	ma76fQAYaZKDYSCzyJi+DG0DqIsSNgG0lRYLC8yQt4lBlh3wtr5ooYZFBSVYuQkU3f6IFEAF5vM
	3/SoTJfkqlK/a7N/eHbzvS6FjVbNc2NNMHemtFX55DMMoCxuhKssuDBW/52Ype5qJdH2WtunZcL
	ZmhtVg==
X-Received: by 2002:a17:907:782:b0:c15:b368:28ba with SMTP id
 a640c23a62f3a-c15ce1dc0f9mr300135666b.56.1783600973674; Thu, 09 Jul 2026
 05:42:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709101327.9508-1-royujjal@gmail.com> <2026070925-delay-gauntlet-bc7c@gregkh>
In-Reply-To: <2026070925-delay-gauntlet-bc7c@gregkh>
From: Ujjal Roy <royujjal@gmail.com>
Date: Thu, 9 Jul 2026 18:12:40 +0530
X-Gm-Features: AVVi8Cf_qxhMx1ZeQ3oKQ5Ke958RTxWs-_NyJm9hkmAWt83JY7oFCTeQuoLyaug
Message-ID: <CAE2MWk=mm8_bkd54Gv1mdox6rfvx85Dd3AjOCxPz0fPAfyuWYA@mail.gmail.com>
Subject: Re: Please backport bridge multicast exponential field encoding fix
 series to 6.1.y/6.6.y/6.12.y/6.18.y/7.0.y
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linux Stable <stable@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Nikolay Aleksandrov <razor@blackwall.org>, Ido Schimmel <idosch@nvidia.com>, 
	David Ahern <dsahern@kernel.org>, Shuah Khan <shuah@kernel.org>, Andy Roulin <aroulin@nvidia.com>, 
	Yong Wang <yongwang@nvidia.com>, Petr Machata <petrm@nvidia.com>, Ujjal Roy <ujjal@alumnux.com>, 
	bridge@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 4:34=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Thu, Jul 09, 2026 at 10:13:27AM +0000, Ujjal Roy wrote:
> > Hi Greg,
> >
> > Please consider backporting the following bridge multicast fix series t=
o 6.1.y, 6.6.y, 6.12.y, 6.18.y and 7.0.y.
> >
> > 726fa7da2d8c ("ipv4: igmp: get rid of IGMPV3_{QQIC,MRC} and simplify ca=
lculation")
> > 12cfb4ecc471 ("ipv6: mld: rename mldv2_mrc() and add mldv2_qqi()")
> > 95bfd196f0dc ("ipv4: igmp: encode multicast exponential fields")
> > e51560f4220a ("ipv6: mld: encode multicast exponential fields")
> > 529dbe762de0 ("selftests: net: bridge: add MRC and QQIC field encoding =
tests")
>
> Why is any of this needed in older kernels?
>
> And 7.0.y is long end-of-life.
>
> And why, if this does fix issues, was it not tagged for stable to start
> with?
>
> thanks,
>
> greg k-h

I already explained this in the email thread, "Please backport bridge
multicast exponential field encoding fix series to stable kernels".
