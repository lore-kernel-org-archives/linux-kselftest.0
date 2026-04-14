Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A539034D3BE
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 20:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776199479; cv=pass; b=oDrIMlcuemg26qdmM0xm8EDQnWf/7rffBa3t2kXNcS3Xm8ItS19GiHEgJLzplV5TIJOWoBvh9xdurWYkrF0ha9TFFZmyf1cMosTXKZWUg4V2iq9TcH1gt8S46YtohUsv1ddf1Deaa6wgkwy24cCotPwxdZAALnLaJS7PmkIHMcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776199479; c=relaxed/simple;
	bh=aQ0aNEU1NKIVhrIy+q01cYGQ+H3qfAr9fLe4K4e+a7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TSD2V1u7WkCGD3TGVb368F0S+78ihPIjQsktqL60M3INUK9gZY+V/ZPw8OsVgImF+LhzREQBLAcuiwL7B8SKRTtdtbJd2aiMoAuqCHCt84hRAnqT7VQrmN1tg0YfUiaSBPhPgYJtVjF7H3gONEyx247r7lacL+1mRnCN1TWqJlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=O/eR1d9y; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="O/eR1d9y"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35da8d037a5so2866452a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 13:44:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776199475; cv=none;
        d=google.com; s=arc-20240605;
        b=g9oPeARbbqyq6qeB3lQE7WlFFfV8mPZSOSvbMFLMDCO+kSn2LqUDQHPb2cGcuc9yO+
         GLADl2D0odoXaod11lw1Qh6cPyT4ZYXAM5Cxfm65sg1aBtqQFBlL8rPVVs8T7AA9tQLx
         kR8zKJXGpucDo2OEVjAwJ4pnVqmawvnXGtS1mILPjlPUflbdtePL/s1SO/QY4ruuRHbs
         K6zfHk29Mq2vWkbEXztiDalTTpLF26nZqMcSfBrn+ZSux7szAsK6AcvalvavpxUtfsOK
         ERYLaJDGPnr7rvEZwozveRwdsieFrLNz8uu2Idf9hWmfBHlGywkFxqSQNPetjvFZ1+4p
         SWJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NK52TA8NFT/IbeGeLW1RBad6qmXIJT5VQoTcm/weixc=;
        fh=0FIx7l+yfSTdoiT41zE641GG7ZZEC1E7DVNnhKKRUMs=;
        b=Cw4PncXI+YHLoVFyCYxUiScLRtofZCiBgG9rPuDvC0scuMQFTdAN/xA5Hz+rtZwIHf
         0bz3hWp2YoM10O0JLqnimQt4PXZvnZTxxcIuUTm0Zv2Nu4O8nS7zlOhZaByNM3OJi1xh
         Q1WWJ5IqTP+/O5TkWDcjhq3+27nKeIcHZj/1aRgzd2/hVYZQJmI3fR+fr0MsPNBV+Lnl
         8ToNYrIeJ1rL/tkdHlBxf6ZxdhlFWL+xDv6ZZmHguY9ejxQY+ML9YKE50rVT1VipXoRc
         NA1SFdfobvqMXBVbpT1O/RA9alyHtZ4FT3WrU6w7n5IpEmisIrqa1MYpeaHi6EnPwHd0
         mm3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1776199475; x=1776804275; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NK52TA8NFT/IbeGeLW1RBad6qmXIJT5VQoTcm/weixc=;
        b=O/eR1d9yYlTxvBoT1+rq7WJnN4HX/n7HxLeILegg9T5XeVRR96UCuNN5qGnx2kvMp7
         xPIbJYo5d0uwV5s6omvfY+q6rANalea04XwYybcSXIzLpPvOVs5eghlINNCMaNgUg7h1
         O5kGWz1fvyfsTN6C7YB1NyG+QidigObjVetPYMh/eIb2V2mxuEUlQ4u6tL9yEV6Wuj7n
         X8LLCKsrNzuBFAa9NQ2/5SLrYOeOxtlWSKIiRBt3m62rU9khSwnqQwI5IAqMphEUkAz/
         vSzhn1t/htZGAe3Qsa+h1sXV89rpKs9/F/utq9+EVcOcSg/FNSrmlcRz6lQZoj3wkB8C
         AX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776199475; x=1776804275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NK52TA8NFT/IbeGeLW1RBad6qmXIJT5VQoTcm/weixc=;
        b=mxdsPy20wGSX5Ca/mYyKovhBpRUEZPT62FqgCzrcpQJetEaY0IGY17vBohkWarB1qb
         nk3y9xPjzlfL4RLm/2tIIj3Paaub9veQqP99qTdnuYz75GME9LB6ndU094zNU4mSLRj/
         gWiv5pi1k+yi+1itSrWEFS0Ln+cVwIW5ULFUIKMYD0u7WqxEbsCoF0AutlUaFx4Ak/07
         gutbB1LqcbTgRHo5jjwliu3iaN0vFygVXosdqoYdkcVazxr/Gq+gs2ivxbGwgOWxZyFv
         ChkpIZBII9fIhJLhV0nuO2lkW7O6t77nD6cU87ZOdu96N/1uo0KnIdrVmrpzQIbfPPyT
         TQEA==
X-Forwarded-Encrypted: i=1; AFNElJ9/XuXNwa2tFdd4q8YhzSt89LNFjb2TSDA2TETxlEYGllrNKP0hh/9hArOCq6NBUDoP0UjvCxbrQ4i4bi6SK7g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXUejZNKkqyPQh712REV/8Oznz5WctKfiGBZcDVnN88m0r++rM
	phnAL9dTlqmQtAhCOLCh/8VXhNlP56YXWfpl7wOSR76jVawQ1w3NBOQEjYXKI1IZ3cudQl5XbnP
	AefiAnPAxbFLVGK3/bDn+BWlVOHr8dOtWgPWbBZQ+
X-Gm-Gg: AeBDiesQ3L8gnSd++5yaQTTcC3hvyhJ43Rq0nTO+0Bq4rojdoTtvD+3ChvicAgFZasA
	YcWSeXVNBm0xtOWzyEwEZntccdYo95BT3lDPbt4DWJq6CiFUTNncSfOjz4mzdj9tLVmmENM9WL1
	NbnO34yTEFWbkg0VKKivro5N+SyytdisDc95UeDFsp7FDmPzB3LgHLZjTb+fO9IDeuxjeWWRAah
	8oUF6G+0pb5NhiU5AspzqkMrjSmwGuAdfNLQqa1EwrnqChHmCWiJIJLNvjAfhzTVu/wVMu7koRE
	74fnktc=
X-Received: by 2002:a17:90b:4d0e:b0:35c:b02:b5c1 with SMTP id
 98e67ed59e1d1-35e4254fa24mr18173516a91.2.1776199475615; Tue, 14 Apr 2026
 13:44:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331-fw-lsm-hook-v2-0-78504703df1f@nvidia.com>
 <20260409121230.GA720371@unreal> <2dd138a2ae87f90c55dbc3178d9c798294fd4450.camel@huaweicloud.com>
 <20260409124553.GB720371@unreal> <CAHC9VhT1X4HX4bGrK=mEzu=g=mZ-Wg-LDXVgZVe-e6oM+W9aHg@mail.gmail.com>
 <20260412090006.GA21470@unreal> <CAHC9VhRnYXjg+vE9a8PeykbXk91is12zYLaO7EFdfZPKMxDfPA@mail.gmail.com>
 <20260413164220.GP3694781@ziepe.ca> <CAHC9VhR1Uke9P==CELKavBcogHoNCtMZFfNWUbgm5HYUfomhtw@mail.gmail.com>
 <20260413231920.GS3694781@ziepe.ca> <4cf6b20b-f53b-4b5e-ba03-c7ac01bec0c2@schaufler-ca.com>
 <CAHC9VhTm9MG-NzdwxtqJA6LZeTEsmUjyy8da2=8KOVxgDtEqWQ@mail.gmail.com> <53a532e8-5981-49b4-896e-0bf5021ff78b@schaufler-ca.com>
In-Reply-To: <53a532e8-5981-49b4-896e-0bf5021ff78b@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 14 Apr 2026 16:44:23 -0400
X-Gm-Features: AQROBzCEfz_j_XIQqt_9SrRpougQ4lYANU563js1WLhMuxDlob1XiduX3tGAPf0
Message-ID: <CAHC9VhRoaECt03Rs-ZyoGhW2_qZkA_1weTYYjiXc41Yf5U8A_g@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Firmware LSM hook
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
	Roberto Sassu <roberto.sassu@huaweicloud.com>, KP Singh <kpsingh@kernel.org>, 
	Matt Bobrowski <mattbobrowski@google.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>, 
	Itay Avraham <itayavr@nvidia.com>, Dave Jiang <dave.jiang@intel.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-rdma@vger.kernel.org, Chiara Meiohas <cmeiohas@nvidia.com>, 
	Maher Sanalla <msanalla@nvidia.com>, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2026 at 4:10=E2=80=AFPM Casey Schaufler <casey@schaufler-ca=
.com> wrote:
> On 4/14/2026 12:09 PM, Paul Moore wrote:
> > On Tue, Apr 14, 2026 at 1:05=E2=80=AFPM Casey Schaufler <casey@schaufle=
r-ca.com> wrote:

...

> > For those of you who are interested in a more detailed explanation,
> > here ya go ...
> >
> > NetLabel passes security attributes between itself and various LSMs
> > through the netlbl_lsm_secattr struct.  The netlbl_lsm_secattr struct
> > is an abstraction not only for the underlying labeling protocols, e.g.
> > CIPSO and CALIPSO, but also for the LSMs.  Multiple LSMs call into
> > NetLabel for the same inbound packet using netlbl_skbuff_getattr() and
> > then translate the attributes into their own label representation.
> >
> > Outbound traffic is a bit more complicated as it involves changing the
> > state of either a sock, via netlbl_sock_setattr(), or a packet, via
> > netlbl_skbuff_setattr(), but in both cases we are once again dealing
> > with netlbl_lsm_secattr struct, not a LSM specific label.  Since the
> > underlying labeling protocol is configured within the NetLabel
> > subsystem and outside the individual LSMs, there is no worry about
> > different LSMs requesting different protocol configurations (that is a
> > separate system/network management issue). The only concern is that
> > the on-the-wire representation is the same for each LSM that is using
> > NetLabel based labeling.  While some additional work would be
> > required, it shouldn't be that hard to add NetLabel/protocol code to
> > ensure the protocol specific labels are the same, and reject/drop the
> > packet if not.
>
> Indeed, we've discussed this, and I had at one point implemented it.
> The problem is that for any meaningful access control policies you will
> never get the two LSMs to agree on a unified network representation.

That is also not correct.  In the early days when SELinux was first
being used to displace the old CMW/MLS UNIXes NetLabel/CIPSO was used
to interoperate between the systems and it did so quite well despite
the SELinux TE/MLS policy being quite different than the CMW MLS
policies.  Yes, there were aspects of the SELinux policy that made
this easier - it had a MLS component after all - but they were still
*very* different policies.

> SELinux transmits the MLS component of the security context. Smack passes
> the text of its context.

Arguably the NetLabel/CIPSO interoperability challenge between SELinux
and Smack is due more to differences in how Smack encodes its security
labels into MLS attributes than from any inherent interop limitation.
In fact, I thought the "cipso2" Smack interface was intended to
resolve this by allowing admins to control how a Smack/CIPSO
translation so that Smack could interop with MLS systems, is that not
the case?

> Unless the Smack label is completely in step with
> the MLS component of the SELinux context there is no hope of a common
> network representation. If a *very talented* sysadmin could create such a
> policy, you would have to wonder why, because Smack would be duplicating
> the SELinux MLS policy.

Interoperability wouldn't be a problem if everyone the "right" systems :D

> > Use of the NetLabel translation cache, e.g. netlbl_cache_add(), would
> > require some additional work to convert over to a lsm_prop instead of
> > a u32/secid, but if you look at the caching code that should be
> > trivial.  It might be as simple as adding a lsm_prop to the
> > netlbl_lsm_secattr::attr struct since the cache stores a full secattr
> > and not just a u32/secid.
>
> Indeed. But with no viable users it seems like a lower priority task.

You need to be very careful about those "viable users" claims ...

> And to be clear, I have no problem with netlabel as written. Multiple tag
> support isn't simple (we did it for Trusted IRIX) and the limited space
> available for IP options make it tricky.

That's an entirely different problem from the LSM and protocol
abstractions, but yeah.

--=20
paul-moore.com
