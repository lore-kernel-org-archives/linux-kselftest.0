Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001DB2F6596
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Apr 2026 07:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775720139; cv=pass; b=P61T1mjd+Zia4TRyFVNIx2gUZJ6gRB2zqDm5HHr0vAFbopQDyacAKSgDQwOdgdetNDeKdHUGfEfZN97eRM4i8FHCq8fw0Exanj4AwloS7Hk0SJQ4SMGiWXeQkfEGXc1P4UPnXzxP3cz+jlGSkPNx5RNzLcMQkJNyaJ0NO/1S5VY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775720139; c=relaxed/simple;
	bh=3bKzmQkJyzTKRjTvOy7kcrmqjRaQYYlocQzym2zd+o0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fTzV1DdanfppOiOn//gygHK7FUoZou49SqTFETrhrFElfdY8NqW1S7Jkp2UX2t2NWAwzf9ij5KyFJ6x33t3M72LAma6UBIIE98aOlTTerz8yY0rVF+EMmroLycCaCfknyfRNiFtaPDk58QH8nIBX+i9AQO3M/Y4l8ZfRBQEDtxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W6h5G+iw; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UVMLO6RZ; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W6h5G+iw";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UVMLO6RZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775720137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NxtWQLaJiuu9KyqZaZcyJ40xxhis3WZ4fBy4ddMBb0c=;
	b=W6h5G+iwFbVZGa8sngnB6fzE3kyPnOXF/lOOCHLe8fcDzMprKf50lEnHwaY/z0nbpNpwK4
	Is07DahaTS34YXQpISbUyF5I3GdV9j0BwCK1kC3tZrt7Qt3QPw0rMxwcrnvXTl61fjaomu
	aUX8SEjyuOzfjW8iBWUqQtU5kI/XXbI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-Q3-y3jNnNJWSh87TKld1FQ-1; Thu, 09 Apr 2026 03:35:35 -0400
X-MC-Unique: Q3-y3jNnNJWSh87TKld1FQ-1
X-Mimecast-MFC-AGG-ID: Q3-y3jNnNJWSh87TKld1FQ_1775720134
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-66dd1d75657so650901a12.3
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Apr 2026 00:35:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775720134; cv=none;
        d=google.com; s=arc-20240605;
        b=MJi2UMC8StfPRXif10n+047AUF83Jh1ectrGhQ1EPBsNlej4Bc9M2oGDWvEcLOfqES
         BHEzbCL3q+ruSoqAAz/njTMbFKUFKrjR00XBfXmc/qfQe1hdH/DBTK1YDLYmLJfMy6fP
         XEBT0ILM61J3oO9bJqIqaBtx4skMKaumu8kyTjNGkubn2cKoe0QpBTPQI3/Ow2xnr/kx
         Pr6f6rT7lozjAgHoBqbfzNJzDAO7QZ9XRqTf93WvXiMTa4HfuwIF7eo2a5Q4jxcJ1IyH
         GELo4Fqy0aArFcDvPSUXD2WFspEyoJ5wzvC2juECR4oC6WE2udWy/YEA48qoybSqmmJp
         TbEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NxtWQLaJiuu9KyqZaZcyJ40xxhis3WZ4fBy4ddMBb0c=;
        fh=iYqrJ0Fa5/9zwvthIYl5TcG1E36AzDc8kspg1g2hBJ0=;
        b=X7AFtgeahy61UqEUirLK12FsHnr4zkeYTSedxvfiA2ttp58+5BzbF+gwgHyTBWcUqi
         PYaUQoO2Pilc6ivPro1AWQXrk8SlBpGbnBtnpIKPcdRCc018raAatguh+8HPDPpO6qGa
         y5htp0SfnAbU5W2B7LxShwPvmws3wBg30nRNODKgGm9fU3zJLEw0Z1bHX0WRsr1Jrx3w
         ANaTlSw6SkE+UxDfjlxmJGj4PBuEB1j870xwBEzIjTfq7f5Qae1r/v9Gt7kZ3UyP1dpe
         rzISGSSpNfPn5+WU29me8BDo82zodF9d0iUQqXPDuJkyeHTGLCXCfBwDeS72ZBol2XjY
         ltZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775720134; x=1776324934; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NxtWQLaJiuu9KyqZaZcyJ40xxhis3WZ4fBy4ddMBb0c=;
        b=UVMLO6RZ7AeSFRtb+JXO9dysuvsD7uxN+nM88UbMMa0UrIp8NqmjB0jNCbujaDN90F
         46XU2nkV38mYZD7pOH1POirbt+HJUQCySSKA40ZDVAoq3m9+fEWuD84uxaq6tspPzvKV
         DjNiK686rH2q1h2fMd2d9ksFNZiXuaicCrWIyFuuaTPulPhml/6iUB1hLisNoxdTAUkw
         Psd7H2g6FhkX7ot944sGgQ8bqIWLagOEMxvl3n7xfikkoWNBgc6EXQ6Rs1Sl7qHsKtU1
         E6Eufh3MPCCM8FdUbuNiUvUx+pE3hRRT67cfmUEr3xcPQrg7m6u3N29QKBns5gsn+tr7
         lkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775720134; x=1776324934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NxtWQLaJiuu9KyqZaZcyJ40xxhis3WZ4fBy4ddMBb0c=;
        b=o/15eoYRX9BiyhkrnSvOhdabd5pPBIUgdVwi017oRloKLfIBEWNIaDmqT6QBxSUYi2
         liLeAalNaiXrCUCU1FQX0sEVpomii4TQS9L79gOrUftax7++q4tg56/11094j1Vlnlqa
         hQF0PiwzwmYM9TjB/pKZEsmSYcMmmnr/PraboExIvx/fJoME9pZY8BTyacGR7zDmf96R
         9H5BHVjbdPVKwfM3wtYv62Rhr2UVsB9yWagg+ANwKh8HnIynFNteG5+TZ20g4bgba9r5
         cdcsstIdjXYn0a8DzlUnZ48454FvFB1fRUNr3fa5N0AP/pmyPkSLUTzxEp6dF6RlkwuM
         GjPg==
X-Forwarded-Encrypted: i=1; AJvYcCWsquvSxHDe2rp5h+xFf1SJ9YBKLC/XdqAavhABMjMJk037Kt4xlLjuG7umVMqyExH1vO9j3pEqotrMvuYDTMw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ51TAc5Zo6ZqezhSHULjn4z0/Pl7FHR/WLoPy/2+W9MwmxKuG
	2V6wh5XNVYAPPgaLgpoey13S3bF3yEPB5AJ3DPfhnF2zdkspvdgfJXXOT1tmu2/VlxbKpHjtk8J
	OcHSqQ1x+Kx1X9P7fnjCTcddlR8bQBdA4nBl64nGHB+B3BqYRNfjlucenskDzUHxmmzOxh7RHI8
	OZIp7gSfTlXF1/Gvorh155zdMtFzo4srsuFYVDnbKCa1JP
X-Gm-Gg: AeBDieslYrdcwczK0rl751kTLuMWwqJthdIKAs+1WgpWF1PqEm8sRe1EEDv4fiOXsix
	dXZEnt8L3a6L37UiQ/JbZX6IUglv7O24+VO1viAXG+58G9xJzLFeXJL8fwAH971tTLFV8MGUNNo
	A2FTGYDgdJa8ICj5RHWdAu9XPAlRFkoDWM0Mk8I7MGFhvJRjaPUjhK3k7EkRhAFYONvdPunRyRP
	9d6SJE=
X-Received: by 2002:a05:6402:1d49:b0:66f:b3cb:502b with SMTP id 4fb4d7f45d1cf-66fb3cb5118mr2434360a12.23.1775720134343;
        Thu, 09 Apr 2026 00:35:34 -0700 (PDT)
X-Received: by 2002:a05:6402:1d49:b0:66f:b3cb:502b with SMTP id
 4fb4d7f45d1cf-66fb3cb5118mr2434344a12.23.1775720133842; Thu, 09 Apr 2026
 00:35:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1775527362.git.xudu@redhat.com> <b65f95793e03c1cb3ed3af4e1b2bee89fcf7e648.1775527362.git.xudu@redhat.com>
 <20260407080844.35368eaa@kernel.org> <CAA92KxmXOpH=CUqEdVV2948XhU1oFh8PBYLUt=ktSsK3sOh40g@mail.gmail.com>
 <20260408172741.39e65ab3@kernel.org>
In-Reply-To: <20260408172741.39e65ab3@kernel.org>
From: Xu Du <xudu@redhat.com>
Date: Thu, 9 Apr 2026 15:35:21 +0800
X-Gm-Features: AQROBzCSiYIn_6eIL4l8IyUTl83-XelT37kb_7xCVKSrMKxgPHpsrqohje2yz8Q
Message-ID: <CAA92Kxmka9=GEvNwxOy7pSEuudqsaF3WGJttyQpYEkTyyYhgLg@mail.gmail.com>
Subject: Re: [RFC net-next 2/4] selftests: drv-net: tso: add helpers for
 double tunneling GSO
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	horms@kernel.org, shuah@kernel.org, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 9, 2026 at 8:27=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Wed, 8 Apr 2026 10:04:09 +0800 Xu Du wrote:
> > On Tue, Apr 7, 2026 at 11:08=E2=80=AFPM Jakub Kicinski <kuba@kernel.org=
> wrote:
> > >
> > > On Tue,  7 Apr 2026 10:45:09 +0800 Xu Du wrote:
> > > > As the YNL Python module cannot be invoked across different devices=
 or
> > > > environments directly in its current form, the helper abstracts the
> > > > YNL CLI calls to ensure proper configuration of the tunneling devic=
e
> > > > features.
> > >
> > > Can you explain more? Why can't you use class RtnlFamily?
> >
> > I want to test the gro-hint parameter functionality of the GENEVE tunne=
l,
> > so I intend to use YNL for the testing. I am conducting the test betwee=
n
> > two machines using SSH type. I want to add the gro-hint parameter on
> > both the local and remote nodes; however, I am unable to invoke class
> > RtnlFamily on the remote node via SSH.
>
> Oh. But that's not really what you're doing:
>
> +def ynlcli(family, args, json=3DNone, ns=3DNone, host=3DNone):
> +    if (KSFT_DIR / "kselftest-list.txt").exists():
> +        cli =3D KSFT_DIR / "net/lib/ynl/pyynl/cli.py"
> +        spec =3D KSFT_DIR / f"net/lib/specs/{family}.yaml"
> +    else:
> +        cli =3D KSRC / "tools/net/ynl/pyynl/cli.py"
> +        spec =3D KSRC / f"Documentation/netlink/specs/{family}.yaml"
> +    if not cli.exists():
> +        raise FileNotFoundError(f"cli not found at {cli}")
> +    args =3D f"--spec {spec} --no-schema {args}"
> +    return tool(cli.as_posix(), args, json=3Djson, ns=3Dns, host=3Dhost,=
 shell=3DTrue)
>
> You're not deploying anything to the remote system.
> Are you assuming that the remote system magically has the same
> filesystem layout?
>
> You can use the ynl CLI but it has to be whatever version is on
> the remote system. Just call ynl --family rt-link, don't dig
> around for the spec paths etc.
>

In fact, I have tested this from two different locations. The first is in
tools/testing/selftests/drivers/net/hw/ using python3 tso.py,
which utilizes the specs located in Documentation/netlink/specs/.
The second follows the testing methodology described in the
README.rst of tools/testing/selftests/drivers/net/, which uses the specs
in net/lib/specs/. Based on this, I include that different processes utiliz=
e
different spec locations.
I also referred to the implementation in net/lib/py/ynl.py, which employs
a similar handling logic. Both using the source code repository and
installing the package can meet the requirements for remote testing.

--=20

Regards,

Xu

