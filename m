Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A1F3F5BF3
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Jul 2026 12:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600754; cv=pass; b=pfCbETQq1/Ea+i8jK25JXSNNtlupsVuJZd1gO83NRVgwO6PPwymQlA7TNC9SD6Df+3nYH5A1EHUz6Ocvt4uz6Gg+9O/bK6u4H0gnwUA9HEascNUAHVxS0BKycxUAX7f1YNTYTFybyNFb0FgBB69KxMf9S0LxgW87hBMl2Udshqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600754; c=relaxed/simple;
	bh=Xl9PbSXbschCuJYzks46Urc8XGsA9GGrNgmJ8oWnohY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jMIsa13tes3dUIl2LdBk4eAptjsOkhwHUvtiOm9F4+LlSdopNxWYsEAeUvPuS2ryXAgCf9oivVnlf7yamYibD6NJenFLFURzSZv74XUWm2hd95k14hsXszcRyOx0p59RiVfbjoFoos0JkvTn7Gp9lN65A3uW1IAleJ3LngGvhhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJnm6eQH; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJnm6eQH"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c15ee037bc0so70523266b.3
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Jul 2026 05:39:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783600751; cv=none;
        d=google.com; s=arc-20260327;
        b=Ra/wwCCj5VVoJc2Eex1OT4+tubK2l6Ggf334D8g478ypjJmvqbdjFk/5a4S0mREUHN
         prY6kYnjQmcQLZqu0Mhx2eDrL7mt2rZO/5YWVjaV+7mPTqfzLZaY23NH3ypXBZVCxnes
         JDbYKcUzSrnvL/gSRos9jVs1P9yW4Tlm5Oryk73KcAv+WJDKla+BDJ4cwiMth2Ztdl0B
         /ZnpQyfYUhJIZsWNY0r+z4bEPqWEmWYH2l1O87Yprght4KPsaS1smrA9mKxPzTmdkE0G
         /8B/ZHoQ24WSFL2+BkjzXzfqfZz2hGKi+wAgBDKmGW5eB4unRVsHPMhv05ljMmLpcxhe
         is4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xl9PbSXbschCuJYzks46Urc8XGsA9GGrNgmJ8oWnohY=;
        fh=HP8gazBY3DxlHji1DWC8cIQZBMuiNZNvefP32I0Sgso=;
        b=X26x1G6TvpT7YpnpmqBG1lcuW+5FECkhSIWGmMC4LioCY7KDJKUdTAmSA2aieS4gjJ
         rZyFEiHDP94d7/1eAFTdSvcwB5+pXJPlGKh85sZCEGfPm+ivRDCJ6ScaXH7zb9fN1Rl5
         pf6DMM/ot14psP0UuGQXz4wolcS9evD0JTyHD/v0yT0BwTC2aC1xC9uIfhzf3qcm8gXm
         yRxzidXFZQt/HJT3nXM6kkChWnY+IUWU6fuEo/xA7Cj9ZT1QvncuznxoKCVQ8Ztq6fMf
         9wztVnzZnmXa64u6mjauq0ClO3sgPq8WNVJUN4mHo/5aLtY/GkTb4l0qTC6fJaPJlYjW
         AXjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783600751; x=1784205551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xl9PbSXbschCuJYzks46Urc8XGsA9GGrNgmJ8oWnohY=;
        b=eJnm6eQHfFlt2rdQI3xo7xAzeOmjFTHpkVA17rMwzRJ6hkNiY5c3x/I/8zDX4auA/d
         nkSpdIF+qbWFUcX1ip3R/Vy+33sJREkKUhjrl//5QDgO7rOInoo6OT1dp+UgkOOu7DwS
         TClCCZpva3RRp4EiPcKt8tvCezP7NNnsR87liioMsSVHQjVTl4LPJVPUZdGh9ZjN5P0G
         ykA9wl6tWzZ4FFtJ9BRLa7jKTSsbBbeAqKa7m8di6ORGrY3p8OINcshy6XJQHp3le0jH
         dkisisnnwihkjr1vqytCFc8XGtbKSi0/1AhDEPPlh2U06mAe/W92EXj4UnfLIUE1V1Bg
         CA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783600751; x=1784205551;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xl9PbSXbschCuJYzks46Urc8XGsA9GGrNgmJ8oWnohY=;
        b=jmD8AppYn5DMdjLSPv9jmLaCTSEa13Fck1fA382HLi364PXpKnobkoAs26gwe+s13w
         7Go4bIPVdq+VItCuXselZK/EyknKUhYDt5jNmAXIsPDxoYfJiktGgurQ3UPWNNI3+HYl
         hQUOwOMvVYuQs3zHSfpHJmtkqov+t0+lxutDamoEI2mRR3TFiyTBnpb4r19D59AJkL0F
         PodiM/NG1ZiXPICL+vqy8Z8wLqHgupe+NG7n30XPp6xsdYeqgQVrNWnDQ59hQ0nbBVAC
         SEoQN/yABpEHh1WInSTBWikHEDRcj7HOX2qCbvb3Dpu3TiOkdg0jmQI93PZPCm/g84Yj
         2Edg==
X-Forwarded-Encrypted: i=1; AHgh+Rp8WQOlxQuTCT8xml/Fil+1bvFiKf9UVdtGXKatBk0i4/NVMWR46I9sx4DkttMmP0wLq19+LHfDpJUyNj/zVGI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6lItBb+GE/YAM50elTM8fga1lSIyGRwAsoMMkwALvURpIzTue
	lmzRSc6r1+B6gDge/b+xNf6c7cXTe/A5G7FKi/3EZ6FNsLG33fGOzJxdn7iGAYo4/rHIgeOf8y9
	v+myiCrJUDuwA+XACeVcMKHkNUSNJW2E=
X-Gm-Gg: AfdE7ckhw03U+M9R4dw44aVWNufEbxYE+4DXLU10Nqe8KWQrER9Z0JFB4L2sOAlocq1
	MSEodgFUv7N7E1sz2s3xkpabMozSQYQ2M236ybO6E7aDH97VyKuVa6GILecT8i5xcLWKzHJSeS/
	vNFSfVLN+XNWJtJd6fX6/wwfOwVTFZt9pMtaOlfRY3A4L8yIyHFjL988eMsKMxD1cr6LCLgOVX6
	m51DcOwhT3+jEcJEZ3aOCXFxd997nAHt7BU8fJUhyVwYd8r82sxvNipCrjh+KDkjKSHiY8=
X-Received: by 2002:a17:907:e153:b0:c12:6ed1:a7bc with SMTP id
 a640c23a62f3a-c15cdfe9b54mr217106766b.7.1783600750745; Thu, 09 Jul 2026
 05:39:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAE2MWknz4X_gcNo6jkR87Lg8F0zfubkOc4Ujr57CS3aBMWrjEA@mail.gmail.com>
 <20260625054005.0016.bridge-mcast@kernel.org> <CAE2MWkn=azz3gUKGBYc1jjvVnLxDHuHk9M7wAJHdAW8v=dP5GA@mail.gmail.com>
 <CAE2MWkkON7HuB+Szc1VhaPL8ZTYMAyfzmPM_7FkXvOPnjnF5rQ@mail.gmail.com> <2026063019-crummy-mosaic-d9bb@gregkh>
In-Reply-To: <2026063019-crummy-mosaic-d9bb@gregkh>
From: Ujjal Roy <royujjal@gmail.com>
Date: Thu, 9 Jul 2026 18:08:58 +0530
X-Gm-Features: AVVi8CeeSy9sOe-nDvJ2FgnZIaGmm16MJR8SeE21mrKCu6quf0TcNIj4Rs8oCSQ
Message-ID: <CAE2MWk=SXVZRmOnnWs0AYWLWqLipo0PTND9UCQw6noDBoJ5CdA@mail.gmail.com>
Subject: Re: Please backport bridge multicast exponential field encoding fix
 series to stable kernels
To: Greg KH <greg@kroah.com>
Cc: Sasha Levin <sashal@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Nikolay Aleksandrov <razor@blackwall.org>, Ido Schimmel <idosch@nvidia.com>, 
	David Ahern <dsahern@kernel.org>, Shuah Khan <shuah@kernel.org>, Andy Roulin <aroulin@nvidia.com>, 
	Yong Wang <yongwang@nvidia.com>, Petr Machata <petrm@nvidia.com>, stable@vger.kernel.org, 
	Ujjal Roy <ujjal@alumnux.com>, bridge@lists.linux.dev, Kernel <netdev@vger.kernel.org>, 
	Kernel <linux-kernel@vger.kernel.org>, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 2:00=E2=80=AFAM Greg KH <greg@kroah.com> wrote:
>
> On Wed, Jul 01, 2026 at 01:33:07AM +0530, Ujjal Roy wrote:
> > On Thu, Jun 25, 2026 at 8:20=E2=80=AFPM Ujjal Roy <royujjal@gmail.com> =
wrote:
> > >
> > > On Thu, Jun 25, 2026 at 4:12=E2=80=AFPM Sasha Levin <sashal@kernel.or=
g> wrote:
> > > >
> > > > > Please backport the 5-patch bridge multicast exponential field
> > > > > encoding series (726fa7da2d8c, 12cfb4ecc471, 95bfd196f0dc,
> > > > > e51560f4220a, 529dbe762de0) to the stable kernels.
> > > >
> > > > I tried, but it doesn't apply to 7.1. Could you provide a backport =
please?
> > > >
> > > > --
> > > > Thanks,
> > > > Sasha
> > >
> > > I will create patches on top of 7.1. But tell me what about all other
> > > stable releases? I have to create patches to all stables and how to
> > > share the patches to you? Via this email or any other process? I am a
> > > fresh on backporting my changes to all stables.
> >
> > I have prepared the patches for stable releases mentioned in kernel.org=
.
> >
> > And I am waiting for your response so that I can send you the patchset.
>
> Please just send the patches :)

I just sent another email with the subject "Please backport bridge
multicast exponential field encoding fix series to
6.1.y/6.6.y/6.12.y/6.18.y/7.0.y", please accept that for direct
cherry-picking. Infact 5.15.y also cherry-picked cleanly, except for
the selftest commit which is not needed here, will send another email
regarding this.

I will send a separate patchset after resolving conflicts on 5.10.y and 7.1=
.y
