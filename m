Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A1C375F8E
	for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 14:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782399015; cv=pass; b=pl8xgxkZ8HLyNiMCJq8BqukstpZDProLVDYUt62Ezt7WXlsy0lM0yMkS0Ct2/YWIm5aGuUhvyJ2dQeyOfDgnGpJ+jodu8bskFrJ6rZrXUIHStMlwD3EO7BtVD4nH1en6Kd0m96XCk1ZrpYHM43n56QEIWwhOYszhle845U6gNYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782399015; c=relaxed/simple;
	bh=GI5tVeQv87M6l+52amLkQdtG+5A4bT1WM7+cRRv8Tow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cCxOtyJgpSU+6NLI/AgVMEMGgobopJHPQSOibo7RN7PTj3LDaNb9uRjtU1ECndT6ngi4JJIab9BOlQx+/eoJL4+u/mzdv2MB2UyGWznza1hxLp6Dkdp+L8HSdRyBWSKd1aIf8/ba/4lfxmBWgKhddxxzt8a+mdo+LsUmt5pAVc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=drDESDEZ; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="drDESDEZ"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c07c67ad9f2so256347666b.0
        for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 07:50:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782399013; cv=none;
        d=google.com; s=arc-20260327;
        b=XLtwIov5Eej2swmuGShUw1yrEfmjraSfkqgsY0Mbu5dr7xQ1vCNQSoHuv315L6aiei
         NBzKa00yP1PojsegMenAP5kau6RWewMVzON872GeQYsa4XqwkkHCZGg4i0VhspyOG654
         Au3J/nsm9QtElr5OBNaqdMSAc4Omaf67baJepzdv8v8avWT0hRntv2EIJbgvj+4j1xWp
         00NOETHhxJMuvfuz1QSUWK60MvHiefoIUzXHj9jeBcQopY+n9MzGT0SNEgw//HjUvj78
         iigLifTP3kwBrTbspFtH0GsL4py/A8a8je1D1O6MCbUCLrRe4Sf5NP1naiNxMOoCDqVk
         aVDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GI5tVeQv87M6l+52amLkQdtG+5A4bT1WM7+cRRv8Tow=;
        fh=aYtFExJrdvl24ba/mXGehZKqhPge7o/8AiYWog6ytWQ=;
        b=d9GDps0o91bgZGlCIYaAppHF06Fat+uXUblp39cp9VR5PuToEYR8ZnsBQ2MCwsVxnR
         Z7BeJbSdaPcCFm0SqxXTH/9k6Lnww4ZdgHUVLaCKZeHnjwJgf0upPcbjgu3qR8xEFFz/
         8S90A8WU7owxEO+d859irtzJMXOS8q36z69uOcHa0l6Pz3WCmmK2qBU79Sk8KUQqOk3t
         hitdGeiWXVACI9KqGiI1/YUmgEk+VDIjxZSosy85CeJavVA5MJzXodviMrNrmLJ8UA9F
         1AuX1Age1T6LGDsU5khjKAyoNiTgJKXB+FLLlPbzkeRvembqESJE/Ut6Go4a9oTLwH1c
         o/zA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782399013; x=1783003813; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GI5tVeQv87M6l+52amLkQdtG+5A4bT1WM7+cRRv8Tow=;
        b=drDESDEZDGVECP69GsOf/aVzERtoJmC7Tgz+HZodsdcOLiLLIUOr2C81KDvVEXCg2e
         07k8cVx9aCR0ZrZsl6Zky4Tm1zANQxx4OB2jrptqkb+LJxMS5naBrJ4dDaASKAyWnq/S
         NTrsNWFHEntqm1Xlqnb4ea7pkhAOs4/PMklJ1cFWJiKjBGqar4BfoaYgHRg1I/9OtRmB
         D1wtz2+LvGGhg7+iS+cC1CcwHb+ocPVysR4HYG6lEy5MuMYD9AWHFwP8GZyLPnLu2sxK
         rfl/ye4MuxMvLZ6dKhkThQf4ad9ArxqtillOVDtjvPW1FaxlPyYhtQcmhuGZjiL/uTKF
         tXfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782399013; x=1783003813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GI5tVeQv87M6l+52amLkQdtG+5A4bT1WM7+cRRv8Tow=;
        b=Tri0J7pSmW+cyEinx1TsCTcRF2JZm5AJfCqmfcquxySwy+40xU9FPgKW5eG7o7Gpyh
         n7ZRqiT9WSoXGZ+F3no8bWyTEagrdjKptStVrQI7Lq+MrGKnBNnpgiKk0E+dvZhJl+U5
         h+TZJbY5KJaaFZ3PHr5cPVW2AWV7UJD0Pen+EBZ/GWCvk8ws0ggOusz9GxALKq9RatZ3
         lqDM9n2hcVXw7s6gqGO7UZHk9s48msw+JdJgujeHhaX/hAwMhLxiSHeLU9+8WTuvS9nR
         L+TczA8B7RJP4WZMSTI1mpHu7aUNX1sS6eZfMn2PIguBblqAry5hVM2yefUoRi4s7Bqw
         35vg==
X-Forwarded-Encrypted: i=1; AHgh+RrbwVaVUm3mpbuhIWTDMHK1mJWweaMJnxs7a3LotzB5Mnlqorq1/0YuswPEXFf+aUEaP3etg/eBMx8eckbhyfc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywak9mLcj+iB8wn3peIdDCXVtQlGV8XsU2vN6JAEZJ5cRfYRiwB
	whIOKsaYVgFQADfFBHERP183q7U/7OQHJfoPBgs858ufmwvLwTBbKX81llCoZWyS6tzUTiUFQy3
	p/OHH1zVR3OgyWr+CTzupIo6tK/qDhQw=
X-Gm-Gg: AfdE7cnsHoE59UIDS3oGPv6ulXFHfQC9fzcUG+xmV90A820ZnY3+nOR0/YbdMaNFOPZ
	uJUSzJfrd0RW5f5rR5MWCKmVpKI0alPeDx1XSzwy8q5KVPSGAMOl4eWSXQlFOlOA5jhyan2fXQb
	2zYnyBd87BV8w+oDgf1KmmPkALt3pzO4PgdkFGUx+7h9MdymvISt152WeBTfoExW838mNBVQK/1
	MHnc7otZpjz8Awuw+zD7bin9ApmXZXpQU6L/FvxJOMzp8cAzwQMUyOKdHIUcxHx7wBW+VU=
X-Received: by 2002:a17:907:8b95:b0:c12:8a:7d7b with SMTP id
 a640c23a62f3a-c12008a8cc1mr211733066b.1.1782399012826; Thu, 25 Jun 2026
 07:50:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAE2MWknz4X_gcNo6jkR87Lg8F0zfubkOc4Ujr57CS3aBMWrjEA@mail.gmail.com>
 <20260625054005.0016.bridge-mcast@kernel.org>
In-Reply-To: <20260625054005.0016.bridge-mcast@kernel.org>
From: Ujjal Roy <royujjal@gmail.com>
Date: Thu, 25 Jun 2026 20:20:00 +0530
X-Gm-Features: AVVi8CcTT3l_BpCVPjAw-OuIdN6h756FNAzVYw4MZY-iVizeSs0vzY6v--L1Ouo
Message-ID: <CAE2MWkn=azz3gUKGBYc1jjvVnLxDHuHk9M7wAJHdAW8v=dP5GA@mail.gmail.com>
Subject: Re: Please backport bridge multicast exponential field encoding fix
 series to stable kernels
To: Sasha Levin <sashal@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Ido Schimmel <idosch@nvidia.com>, 
	David Ahern <dsahern@kernel.org>, Shuah Khan <shuah@kernel.org>, Andy Roulin <aroulin@nvidia.com>, 
	Yong Wang <yongwang@nvidia.com>, Petr Machata <petrm@nvidia.com>, stable@vger.kernel.org, 
	Greg KH <greg@kroah.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Ujjal Roy <ujjal@alumnux.com>, bridge@lists.linux.dev, Kernel <netdev@vger.kernel.org>, 
	Kernel <linux-kernel@vger.kernel.org>, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2026 at 4:12=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> > Please backport the 5-patch bridge multicast exponential field
> > encoding series (726fa7da2d8c, 12cfb4ecc471, 95bfd196f0dc,
> > e51560f4220a, 529dbe762de0) to the stable kernels.
>
> I tried, but it doesn't apply to 7.1. Could you provide a backport please=
?
>
> --
> Thanks,
> Sasha

I will create patches on top of 7.1. But tell me what about all other
stable releases? I have to create patches to all stables and how to
share the patches to you? Via this email or any other process? I am a
fresh on backporting my changes to all stables.
