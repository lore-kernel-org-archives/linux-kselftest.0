Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365C03E2765
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Apr 2026 18:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775844434; cv=pass; b=D+R4Nzxs5HUDMRLZutBAubZIEoOEq6Y2rkQsr7SZNYWZRWALqMXKbgzEoLrOTAUxypHho02AOv4BSX5T1V9218CGKkDWOJ65Cu1ou4S9oI8YOnVzM5TKEf55pdmhXnJlexxxSquzMJi/dTgtYaziBp8KOhcR3gHYjNT5ao2rPQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775844434; c=relaxed/simple;
	bh=m0SqRtjpc8fweCPgbIsrD2d0z6GAWlzdIRiS41O4cxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DFR6r7v3cc+0Qw5SRqrW+bAz8JC8eb/Lk7eHCobaeeiQ64XkuPkjRlhfnK6WvhwIj2+9m4G8Sbm/TBUrtkA1BB6+apIKgwjQiLEdHDEAQ5DxIz+cF25iVl2uEjVjf8NAhi7rVF+/Uud952pjlBTHEa0Xrx4uP+1+MzZGbNO5GGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQfCHLOo; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQfCHLOo"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b9bfcbaa81eso387487166b.1
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Apr 2026 11:07:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775844431; cv=none;
        d=google.com; s=arc-20240605;
        b=BgiuTtCSpJ4ty38qy9XBRAb9gDpKc0PRrUvNzmTUUNVeO3yN45PKiu8YTWnb3xhT1F
         oyhbtIq14LC6NxPs5lZqpj30SewvGrTSPFLv3kX6iamOj2yjsID7Rbw7vTtE5fzKUQp7
         cwgwUHEa05xv2NSN9qg84KrV8FZvWgdghAFfZJk6bZDyX/y8hJGhVXqHXiJCk9vzXRRU
         os9oDZm06iVHxpIG5yhbiKPcbnUTKUY2hJFA8H36OhvV4DKfTaun2XjC8G99MH3tQbO7
         /iyZXH6+fdkoTNZR3uD0Ia8VSxsVZQEK6wXAWvWr/p3hUBJHw1crofYUvY+xfNzYhTV8
         SOMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mGufM7na8wMpN8zx+blIkzaxv+HrthUqBNiPXsfFPcU=;
        fh=m3TV/qzWH+Ro4BigLQuIAE8c7xq0HtucYqN5mKyFwdg=;
        b=aNd4KGSYeZChwQnCwGOcr1S0/XpxxbM9iC+FOIlOlX7pBq43OKyjKGFPiI15xz6QLL
         rIL0og3tm6FZ33HcIwv+esuvOXqc++0b0QuN1J3g2jnKL2+PVkRHu/rwr/B+4FCFkFFO
         cJ+W458ke2SoG/Smw+6eQS6hFCQgb3JsuutsngOg2vvMc1xhy8JHLk16r4YK06KjT4BP
         BexWACGpZxlT7xqUw/foP+s/MZmV6Ae/rHgwCBR5xZm1Q/UecUHOJxMezknFy+JMGDKZ
         V9AmGXasgE9QuPyyuxg+wOnaIRAwIDonK7UtPv2EOOxt8JFj7noF7YQ7+WmTosv+j0hm
         Coag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775844431; x=1776449231; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGufM7na8wMpN8zx+blIkzaxv+HrthUqBNiPXsfFPcU=;
        b=MQfCHLOo+qYEVvGmLEQmTa5Ni3SM5nsNXEX0fpNlC1dVrMvE9BEDj1b+6eYfLMx4CS
         rZZuSg+ayDrdOXtIUGmhCzWY5wsjWVdPjBrzXRo1oUniFnOL9+rwWWC1ab0/ljBGCdOj
         ytYxAYMLnRTKptcWh8YVOKldvNQokwbRfyGDcwF0bb9/sVp7YxJBl3uV6uni8Ms+iB+D
         rRuEXhG06pO0VtZgURzb/P+5DA+exXexKxWLJrDhMZa/R6t7XuIU9UztZEWIXh74NFpb
         GqCPc6PtwFFD7hqHuoudnKtL9zt3dSHZhQl9j287LFwDNHWAypuYb78jzgV2DSsd5Ekr
         +xSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775844431; x=1776449231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mGufM7na8wMpN8zx+blIkzaxv+HrthUqBNiPXsfFPcU=;
        b=NX4FCFr2GkNHx65J6lZyaFqR/SS+AZXFd3hp/b8rFXnyEDP1eDc6qcWFdfyAXj0qP2
         hj2DFpgO4jCjTZ+wWx4O+HLWtF0bRU2KGB/yBUZ4PA19YsCRLJo/sKDuWmezYaU0SyD7
         /qRaC1BzWe/a+EHBxdPlqhPiBmSF/QFvWIRpnl8j5SndMGj4xySRQCc6N1RiqBWk5/jv
         Ti5V3XiUbW1bdsTjC/LC3iwCGrtncQLuUdtylDaexbOsDXyuXE5hmPcTKx2RY1SwKkLH
         joI1iA6AsHvCObbwShP6b4/MmQP3ahU8ndBLto4UQ/I8EHkieSYGujVm6+5Kxm3vw4cm
         BjOA==
X-Forwarded-Encrypted: i=1; AJvYcCVvsYrSi32ExVsYLsoM1CcugW+asqy/T726/2QN+DAo5gBefnnUXUqmsp9njQB10+Y+9bcxgy4tOqyTaTSHX2c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFZiAxl8r5KCOJr5XzTupI6d+E1Hg16gF2W6hGTQGnzQ8RnME7
	vVbif9dz/WPIwC51WMA/LJH0unshaOWNTUGKBib1mHHQ+ZuUqB8l2Wc7t2bJp7GXIcQiTHwX5VE
	tWNkS3q08xXDqLx3y8tSooHLjPfMKsvQ=
X-Gm-Gg: AeBDieuBZiuUfqzUsjBZwEo8pNISN4Ivx+o0n24q7P5LQi6gcYd+SJisQcjDlGjAD1F
	uXX9LzY/+5+IRS6PVVa83Gi3HKy8mf5TCs2iNteEFCW1hEHbjaU7gsys0TCcm404zmgLLCAHIjL
	AKtA1iB/fUqzBVdVimYGZZ8qUR3fLj0ThaLIZpkWetRgcA0RLc2WRlr98Rj4hg8EKkCe9Fg9+ql
	L64UcXlD/JSFbpFsg+cjpaj4V6uiadv39zdPxAi2lRcmsL4SJE0rAPK/8PIr57RDQ/JpBeCVsKa
	Fkq7dGo=
X-Received: by 2002:a17:907:a1a0:b0:b9c:55e8:fba1 with SMTP id
 a640c23a62f3a-b9d72980914mr205690366b.26.1775844431242; Fri, 10 Apr 2026
 11:07:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403150050.1235-1-royujjal@gmail.com> <20260403150050.1235-5-royujjal@gmail.com>
 <20260407134502.GD849209@shredder>
In-Reply-To: <20260407134502.GD849209@shredder>
From: Ujjal Roy <royujjal@gmail.com>
Date: Fri, 10 Apr 2026 23:36:59 +0530
X-Gm-Features: AQROBzA5y--UIRYT_Yu32kHeVQkZCbum9kUmK0fpAAGLhqzgcbax6qOFdWZqhBQ
Message-ID: <CAE2MWknjWczxM3WrKkQ0eHV7PdNxMQ62GnTAp6tCPToumZnE=Q@mail.gmail.com>
Subject: Re: [PATCH net-next v3 4/5] ipv6: mld: encode multicast exponential fields
To: Ido Schimmel <idosch@nvidia.com>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Ahern <dsahern@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Andy Roulin <aroulin@nvidia.com>, Yong Wang <yongwang@nvidia.com>, 
	Petr Machata <petrm@nvidia.com>, Ujjal Roy <ujjal@alumnux.com>, bridge@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 7, 2026 at 7:15=E2=80=AFPM Ido Schimmel <idosch@nvidia.com> wro=
te:
>
> On Fri, Apr 03, 2026 at 03:00:49PM +0000, Ujjal Roy wrote:
> > In MLD, QQIC and MRC fields are not correctly encoded when
> > generating query packets. Since the receiver of the query
> > interprets these fields using the MLDv2 floating-point
> > decoding logic, any value that exceeds the linear threshold
> > is incorrectly parsed as an exponential value, leading to
> > an incorrect interval calculation.
> >
> > Encode and assign the corresponding protocol fields during
> > query generation. Introduce the logic to dynamically
> > calculate the exponent and mantissa using bit-scan (fls).
> > This ensures QQIC (8-bit) and MRC (16-bit) fields are
> > properly encoded when transmitting query packets with
> > intervals that exceed their respective linear thresholds
> > (128 for QQI; 32768 for MRD).
> >
> > RFC3810: If QQIC >=3D 128, the QQIC field represents a
> > floating-point value as follows:
> >      0 1 2 3 4 5 6 7
> >     +-+-+-+-+-+-+-+-+
> >     |1| exp | mant  |
> >     +-+-+-+-+-+-+-+-+
> >
> > RFC3810: If Maximum Response Code >=3D 32768, the Maximum
> > Response Code field represents a floating-point value as
> > follows:
> >      0 1 2 3 4 5 6 7 8 9 A B C D E F
> >     +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
> >     |1| exp |          mant         |
> >     +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
> >
> > Signed-off-by: Ujjal Roy <royujjal@gmail.com>
>
> Reviewed-by: Ido Schimmel <idosch@nvidia.com>

Do you mean to include "Reviewed-by:" tag into this commit message or
the entire patchset? I will modify and send v4 once I get the reply.
