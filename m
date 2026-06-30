Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F31326D65
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 20:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782849804; cv=pass; b=HNuVTbfXoVoixa6h0XY3WeOsGc+8Ul2ntyOktx/JBLDHzADuJHgwGdxzFdfocNxd7X2aufO+R7VWdEHFrJnpyAShkeVH4EGDxuLGNfPh05I+CJeHWT1oc+EWAlhFXpVBNo7nVx2JfVTNQAxtwp1izW6E0mPMyCXCiOa7x8Vleas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782849804; c=relaxed/simple;
	bh=6pZkn8yd0tBw8pUiMXIn3KvoMZ8dCgnbtEbHZJLb0y4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j1UmARmu0wMMu79I+jeQNkF9OOarQscmdDVXOU+d2b3xrStUKivXpd3BNaSppnBRIMfqxK6mMQ8xc04TUYLF0Ridz5+4iQreUle4kyESnuMfelF/mlBGXKoYAtfYohqyEI2VJaSXDai7NpxFpvuf3fbOsSr3h8E4W91paMk3/dA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AbFdP2Tz; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AbFdP2Tz"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-69531108f25so9662476a12.2
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 13:03:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782849802; cv=none;
        d=google.com; s=arc-20260327;
        b=W2C/G0udxYK5LeT/OB2dy6+df+3a6eRp4HfNo1z0LhbdO+FzBL9SHWKs3EPPFNGor6
         02r6cPcI/vLQ8n5fKob9EsymwCsmuoKIlMo5Q8hrLkfqKmgnr2G12DoD9LynWrme5NE8
         NNO4r9snZ0l/rASNru/8ZlFQJp+G4PLdmZTDtspKWWj+0ZXjQ95HXF5j4AIqD16U88FT
         2sNxDHpyvUXXfH0lHi2/31sC+VwIZivWwktG3BQVeYp61Y8aOK5IYr51GbTnt9vxQNJt
         pWB4zJ/hndhDSSQQjFa2BYWQxI7xQAlgjnvLHntdpsxR/UWwsf3LSiE+ndv2iPc7cyE2
         eI1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6pZkn8yd0tBw8pUiMXIn3KvoMZ8dCgnbtEbHZJLb0y4=;
        fh=q/4/lrZUdUOtc2i4jMS5rhYLth0+5Ny0Dk4q1wBrI0k=;
        b=syiA0HLBpq17CvLenbj1gb1nwEyWNnnaTczED9Gx0WwO7tiKaBJQvVtW8r52qOdMUE
         AKFNukjh5WC509hHRjXHszw0KxLlzbdageZCY4XnvqxkEvP2Fv7C7TY9djKbxOXUOkrY
         b5nk3A9jyz+hkdv0mPwsvajYauyr1DIRnaKkvL57v/B4hkEllph3QaFGLAJYu8Mp4mUA
         alu+z1FmgXDcwJg0Q2ISPEAFajh6deH+A4GP3d+An7KzjKwzeQBptB2uoLU8x1LbDC7+
         qU6mQ2vi4x2US+uL/8MGHpQzYlVBEPp4DZyPmIocwZ7E95gGRT49P0frbL2KhyMxaHLO
         MEGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782849802; x=1783454602; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6pZkn8yd0tBw8pUiMXIn3KvoMZ8dCgnbtEbHZJLb0y4=;
        b=AbFdP2TzeJDu6cHqaS9LfUCIwUEOUv3qAoQthciUEyzNb8YVH6B3NR1rGiq8FMsNtn
         OBEBbjLRZ6imyi3BHK+fIHFY+M2epyNLx7p37C2CrqETNpVwxcyWuz9y8AOsV1cLAJic
         pf/ctRjvC3FkKF1BTYxVSAvdhrc0VlGK2pU6BYkTzMvgLwfFXPEVhSRN7wcU9ORNvy5z
         /fnIqzDTrbKYSCfeXhcuIVX0UshrNwefvBu/pje6wRplZP7ChF+Aai11zfxvhy0on2Kn
         9DoC22i+hu7JPnOWrs7JndHP3T847qdjRoHFKFEg3LHKOUFAYUPsfl8Q2SqDmaGbIfvo
         Tl8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782849802; x=1783454602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6pZkn8yd0tBw8pUiMXIn3KvoMZ8dCgnbtEbHZJLb0y4=;
        b=rg1oeJuX1nqbNbdufkmW4lcniDFB6MDr3pdmq+BBAWE0a/n7PCAFd0JctN3LGKyXpL
         /LtQhAIR6M80ctRxYjSSjsIzxjaeuMFt2I3RqeFi+68ndUNwyy61/+Z9EZsanwIgXr6q
         krpD9hJur/Zqs+CgQLk8T6leIJI3dFkiMdSdhB5wI3it03ARkIGXesylFlEjuFHruHiP
         x8iORdDXjfmA1xs2nAQtCs6YD3AzXKe2OErk9FCRuumjmZ3sCz4sW/grrec8Fj8aUIz/
         eaHSkxAgD1PHMVhaiZ/ywh9HRIT518du5HFRe1lBJNDPs+8NrEZ6wAqfq5wmVkEHi+SU
         gidA==
X-Forwarded-Encrypted: i=1; AHgh+Rp6nLi1SGYaa6nMfDCPoUibUOEnrAJxmYWNFbgxpS/Tq97bvXLmgQlaIGscQN2Xs1X4ElVU5Dw6mAi5vyejsnk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOlf6wPj0EkueWYb8JnOqaHa9/2W7mnVnYwrJIvJxhIlyLUsRm
	yIi4KQHYP80i79x/T0CviKjuRhHz6eqgLW6cmdzIHYkcMHJuSmusXyY1o4DHLbGmkGbn+qfuXyX
	LqLQf80vwttPi7V2kKv30qy8IC60olhg=
X-Gm-Gg: AfdE7cnFJTFgbi36k26o6Fu47cjF5qcv0SGSvG61xkFIdbtvFSY8/9IC3we762izPof
	2yuKgw0MFnHbEx9dHLqC2TqyzpLIl/KWF2tK1focEY9BXDPWa5lQffnW8Vo0RuVQKgrMYqqo5pu
	ABWrGoJkPlWHq2MYeGZba2bsKvTYvQWAyIR58+21yAszI+FyzTTt2RRz61KOOBCw0EHAz4Otiv3
	Se+wsNoIzx4RUTqgBUxXhtJ33pA2UxjcPhtltp8MvkhhrnrRl40EIwccFH2Y5kujtsKlbI=
X-Received: by 2002:a17:907:720f:b0:c12:3219:ba1e with SMTP id
 a640c23a62f3a-c1297f04180mr105626766b.42.1782849801564; Tue, 30 Jun 2026
 13:03:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAE2MWknz4X_gcNo6jkR87Lg8F0zfubkOc4Ujr57CS3aBMWrjEA@mail.gmail.com>
 <20260625054005.0016.bridge-mcast@kernel.org> <CAE2MWkn=azz3gUKGBYc1jjvVnLxDHuHk9M7wAJHdAW8v=dP5GA@mail.gmail.com>
In-Reply-To: <CAE2MWkn=azz3gUKGBYc1jjvVnLxDHuHk9M7wAJHdAW8v=dP5GA@mail.gmail.com>
From: Ujjal Roy <royujjal@gmail.com>
Date: Wed, 1 Jul 2026 01:33:07 +0530
X-Gm-Features: AVVi8CfDECdiCgzhQlx3_wZFTGHCy6ydmcO-9SWK6-jb6Fc7WwdQO42bD5DVouM
Message-ID: <CAE2MWkkON7HuB+Szc1VhaPL8ZTYMAyfzmPM_7FkXvOPnjnF5rQ@mail.gmail.com>
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

On Thu, Jun 25, 2026 at 8:20=E2=80=AFPM Ujjal Roy <royujjal@gmail.com> wrot=
e:
>
> On Thu, Jun 25, 2026 at 4:12=E2=80=AFPM Sasha Levin <sashal@kernel.org> w=
rote:
> >
> > > Please backport the 5-patch bridge multicast exponential field
> > > encoding series (726fa7da2d8c, 12cfb4ecc471, 95bfd196f0dc,
> > > e51560f4220a, 529dbe762de0) to the stable kernels.
> >
> > I tried, but it doesn't apply to 7.1. Could you provide a backport plea=
se?
> >
> > --
> > Thanks,
> > Sasha
>
> I will create patches on top of 7.1. But tell me what about all other
> stable releases? I have to create patches to all stables and how to
> share the patches to you? Via this email or any other process? I am a
> fresh on backporting my changes to all stables.

I have prepared the patches for stable releases mentioned in kernel.org.

And I am waiting for your response so that I can send you the patchset.
