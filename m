Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0712F1FC7
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 00:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790124589; cv=pass; b=hJXEV615deV6Qg+sDiworzwPyYMWXLkbsRpiktglTPsY2gLLmEL2FBeCWRDFtO1NAQ6yA3JPU0FG5+SJpl7s5IM0KuxVdW3i3uLkbAdllYMI9PP+639jTQOA8wM9OI8ga2oYSTDzLHSQpp180mr6uZ9jB2+pZTCQOJ3tm5FSTfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790124589; c=relaxed/simple;
	bh=z4nEtmW/B7eogzGruiprSjDTAnPPo0KNEGcrLZetKgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JdtgzDdhtBbJ2CUC4uRUUvn1fpWwXw27ixU8OdPzTPPY5W+KHgl3tDgRmDmcvj3DPolFWCahBt+YNu1TuUzU6d5Q1vz6i/1NY8KwpmgYePjEXKTMIppfGjozmBTW5j1Eprpfu+KLhjWZYxNX1t5fJH6cUsTQoGajXUhDwiVfk4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kPmhPf6G; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPmhPf6G"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a20f06cce6so4415101fa.1
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 17:49:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790124586; cv=none;
        d=google.com; s=arc-20260327;
        b=lO0rpfLhaBM3r2orTOZY6ozCgvKyjxNBQdS1Y/+48RSex93N3+UPYhJWOWuf8QLl0m
         DQ5HTILHflmcESkTZGipTv1x42UOMeafIBfEfGpElcVc5kwd6Zb3XUi4JPr3FA6Wk4SN
         eHBfG3wM7Mx0i+VpLmpEHhvXYUyukVsqH+8CH3T8dsn6lMwliWFlLhtQHl/kWW9YFV/b
         DjTzU2+SE9TF0Rb4Hwy0CF+fsiLlZSZNIiY+zy9ofqTFHWFpCsBISDNRD0WVEYmEbQP3
         28sCKOVHb7vXhgssX1EcaI6RXyq4xJw3QGZ38kolu6oaL+uewLTPfDr4e5yDNgOrW+I/
         upVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L/jUfJT4ttFuk5nJaSR/zxk67u0WSF3uD0qyCWP34DU=;
        fh=EOZtzzsbbh5in8YNwapdi3w5slmm4KTpsGvT3CpDsuo=;
        b=eazTZWeXnCtfWdhxphth2u33ZvI8/OhxUcHQElCRru68IMSDU2VzcfFvI1Dssy/WGR
         ibEcOOx7j1EtV11Z10hciNMLekYTUYCkhIWB1jl4F4Y/MspdBgZofSV2yhGeymgM7SJ4
         SAWCBjzwIXgVrm6m92rPCO893tP1HpDc6mHNVYweFg0xBLNnf/MXwlB2e9kFtnlUtrLE
         Sb97GQ96RRex4wou34eUvpxjVXj6YiWho4PqKh7kEvL+KqbcLtu3ho837RDmdhI4tGyP
         etUT1/omJwRNCmKBhilzeBq3JSbdShJsiqISQMXJJd1YiiIyJ0y/zltHKhhHjZ4LOqcG
         FVxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790124586; x=1790729386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L/jUfJT4ttFuk5nJaSR/zxk67u0WSF3uD0qyCWP34DU=;
        b=kPmhPf6GKAPw3LS7y85s3PjBNg3bk61omaCv6WTEwcjvDNy9YxJhCPIUaWNV2jBJho
         F6YH+aTw47peFBTEkDE5L6r777tVK6YHwSC5eUC2zwDvRegrhrecbsOHUNEsVooVScY/
         aEhPC734NOpIAn3lthxA679K/o8az2HWx94umWqHXiC6AEsQFTaGlcUaF96r2Xa8dhkR
         UDfgDVjp+83EcLBOGAS8PuDY+4tocoD4G9WJ3w5eGZ0OcOVvwxxVW+AqIYgY1SRJoxHI
         /E2O6wI/9Y4hewo8yTZ9iNgQDdidffqsp7SwXR5godqEWQHM/01S7wgxKJHncQJxk1Cc
         EmGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790124586; x=1790729386;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L/jUfJT4ttFuk5nJaSR/zxk67u0WSF3uD0qyCWP34DU=;
        b=Yg+kFFlqQ1WvTuFHD4WgjvnedlA6oAZj2AU4r6LLaY8FrNFJDEWK4UKIihSVZlgPru
         3ajLgbUZArQJNmXs1rn8pQGAbD93+Thns/50JLPtsHVoHaOYUUcWd3WXRBYoaRzOhzTN
         WlJBXmSrMM/3orKpx4d3XyPeGmc17Ba8Wn5BopB1ALe1UZ/ggilS+k32ZrrGamt6dFnR
         3GdwhjsUFY/LHEGmQBIT1nYCPB2umyEuwXSRYi+eTQ3a3u+Ybu86TpucPTjLpqOupspD
         NyW7Kb0lFbwvWLhU35DpP6ZFt6WtxEbvj2amvhEC2pJVISLxdQM1grMMoM/6BKs+/aWU
         om3Q==
X-Forwarded-Encrypted: i=1; AKwUvByTmZeZllNOMyozox4dwIDzUUhMOgcGppYbV4l6m1/GdnZfq7/QXLsRh0KqdYZp0e3wlniUevJ7VJNTcDIY8Gw=@vger.kernel.org
X-Gm-Message-State: AFuF++kqQdjklIFivKIbwl1/AxEPPK7NgDUPxbcYs4jU57MiPpeUd31p
	BKZHrrr+AjfVLcJoNaiC3aaRDp22tfF6+A+k4Sz94udjdu0LozHTJNvVriWMtoP4GiVhV41GceR
	DuYasuN8vB4MXu4Ac1i2Bb8Izz0uwbxU=
X-Gm-Gg: AYBFou2EERg0Tqp8c2tKnJVAm2vFpyZZJ6xHbNKHWKx68IO0ud1i/BM2OgGL3hbmIqZ
	mJFzn7o2DimDyCZ5fMi02uOMWXW7YnHqNSU8ZTQMfKg/nn/AdNwCE7c+SLH0KcjcudHgqLEvla4
	pARl879evFjTZeWP+cAXd3igmIIv+DYVELMSk2Q+m2PwXozx79NG9kiutQuRXcUvfbv4YB1kt5f
	uF4e346tSFlWI5bBOH9rquDZua4C8h0kZSqLsFjTSks6Lf0QUeqY6omn24/wortSbQ1/1kWhOlK
	yUNzJhxkJRYEff9grN5Z0ODl2C/6DEznWzjoJO+EFDOV6nYIaligU1Y/nok4Ilz8+OeTRQW+bYy
	zjM3cYa3E2W/F/yR4ph4pDWGbO739vILOBIzdjVNa9OpYsLS7RbBf74I=
X-Received: by 2002:a05:651c:a189:b0:3a5:eacf:9811 with SMTP id
 38308e7fff4ca-3a624d70958mr9639501fa.14.1790124585416; Tue, 22 Sep 2026
 17:49:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921235951.3214-2-sigefriedhyy@gmail.com> <179012274833.2160803.6278526272510624940@kernel.org>
In-Reply-To: <179012274833.2160803.6278526272510624940@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Wed, 23 Sep 2026 09:49:34 +0900
X-Gm-Features: AcwNN1XrOYM44dDQqYS22hhW-LuVc39KJdo7O2ULglxGQeLxCAP5lFJTK_NObdY
Message-ID: <CA+7S2vJ_Wq+_BrZ31qWnDFMowZdo2wR0THrZ-qkgFD1dMQoH-g@mail.gmail.com>
Subject: Re: [PATCH net-next v6 1/4] netlink: specs: rt-addr: fix the type of target-netnsid
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, dsahern@kernel.org, 
	donald.hunter@gmail.com, edumazet@google.com, idosch@nvidia.com, 
	jacob.e.keller@intel.com, kuba@kernel.org, kuniyu@google.com, 
	nicolas.dichtel@6wind.com, nickgarlis@gmail.com, pabeni@redhat.com, 
	sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, sdf.kernel@gmail.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 9:19=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wro=
te:
> [Severity: Low]
> This isn't a bug in the change itself, but should this carry a Fixes: tag=
?
>
> The spec has been shipped with the wrong type, and the generated ynl code=
 and
> the Python decoder have been treating the netns ID as an opaque byte blob=
,
> with the request path rejecting an integer for a binary attribute.  The
> kernel side has always declared it signed 32-bit:
>
> net/ipv4/devinet.c:ifa_ipv4_policy:
>         [IFA_TARGET_NETNSID]    =3D { .type =3D NLA_S32 },
>
> with nla_put_s32() on the emit side and nla_get_s32() on the parse side i=
n
> net/ipv6/addrconf.c.
>
> git blame on the pre-patch tree attributes the type: binary line in
> Documentation/netlink/specs/rt-addr.yaml to:
>
>   dfb0f7d9d97956 ("doc/netlink: Add spec for rt addr messages")
>
> so would adding
>
>   Fixes: dfb0f7d9d979 ("doc/netlink: Add spec for rt addr messages")
>
> help backport tooling and users identify which releases carry the wrong
> type?
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20260921235951.3214-1-sigefriedhyy%40gmail.com

This issue has been discussed in a previous review comment before, we
want to keep this patch target net-next without the Fixes tag.
