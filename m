Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E2619D89E
	for <linux-kselftest@vger.kernel.org>; Sat, 22 Aug 2026 03:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787370837; cv=pass; b=NVkqbRQNMxPC+X+UBXZ4mO/Xppx7/ug+Ij3HvL3B01rM2VD5VjsA1XOZQtb8xy/iE3iCZf3Ls39VinKt8yZoPChXmvKlpNRVJlGyTH0ZKWoaozlt0ScMeDKHz0zmQnrbz/4BSawhJANkqYrbZrkjBk9Lty72FeCk0K/7YhdqWqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787370837; c=relaxed/simple;
	bh=FBLlXD3nW2JnUX368mUZaO+/9xbIDSHvG6hWmeMOSIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i84TsbENiPxOGbTmcgedgx40fBAN42K6zZ7Ft4f0G+OPTOeBwSoX1AoyQ2MhSVCoK6GXxpxM70mT/6j8xsGc3bEEa7gypKRGsx1zYBhk7wrhxOQ+mgdy4DRj54bFmrG8CfqOxfJ1H+Uqngwh/egB9LwtWRCPMUzp6No03vcchsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4i7LYqJ; arc=pass smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4i7LYqJ"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so1232931a91.0
        for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 20:53:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787370835; cv=none;
        d=google.com; s=arc-20260327;
        b=I5IYP3EXm5ndDQTFy3WBvZ6dCn+Qoy4kgVaJaVvR31820C9zjsdsJ9qIHqW/Oh8hlJ
         GebJJKK341YRLmx50A2zsnVzHCE6mUtcxy1sFvoXoaFP3ZRHfFRE4zmmxtjKYTB+yzpE
         c49m8GOJ8xdJnZzLrOX9g3lIlwbu+Ahkxyou1aNIlH2dYpn3ChwFVpV17V8yHMvzOZk8
         3yTzSoAC9liuhrvikdlVGxCa3N+eZ8ECLDDtsI/mQPIiEzfkObISxGWGmMAwG+tgjEQv
         +9+O7/efRTc0ze06wILZ4d6it4ou/IwGE1qBbzeWFHjngpktXpySwKcfJx/3fsqzKvsF
         38rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kG+MMYz+aA1z8JSTD2QnV706OsWOXs65jjB0XOhH9kw=;
        fh=/VuT7iSkE5nE0iAVJ0f747BY9kNz6tTwzImm1kbDYac=;
        b=StHAK4r4Mz/k8DpjHrAwFMPj3Qa4A8RkvttDMUB9yEPqI4PXda+GD8+4d0vU7/aUmi
         IK/3rXGOcDeIyf619ZF3I0SHCav1s6l51rEhKx3Kn4e2+dRrcNfrcK0IUM1+A5smVpHU
         Tk1EasBixqhO92p8zAVBtDClBoonffdDKWVtM1wgXiK7RoxpchSZBvjzYZLwQDqcU1tP
         Q0GC0UdMjiI52FxQ1t6w//TH5P0xbgdWbPrnoC8ld0dksTE/Xg7ujwbHCndJ8rA/eyEN
         rGPsifv8QzhqsMlDYpWefKTMkgKiwxjyg2K1GIWkbFdXv1hr3sUoCVUrDsO9PcEeAM4v
         y2+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787370835; x=1787975635; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kG+MMYz+aA1z8JSTD2QnV706OsWOXs65jjB0XOhH9kw=;
        b=e4i7LYqJ6v4sP1QiqCWyq/bI785E2ChslQ7U0a2Eeigsv3Rm3V7TqG4waG/0fJceRv
         Repd6kzS+GYiFVO7JCKkf64QDcNpoHbH3H/8NEAXuPJoQxb3oreD4exM4/5AvMqGWue/
         z/uPm2hp3uKu9EfxxzkMVhHv99j0aALIcjQc8lE2HXKhNRqMIAoJLzw5080hz01IoDG9
         eJqt5AnR0nHkOKtkLdEqmd6PKry7oC1kFJr5EssvUuE2ut9qu6pi+rKLUW4oY1wmX480
         yUkP+XId6P1QqbLaUIo2lrtxs+lera94VXnsLFkGosY4Cz9glp7z93/OP81Nnlzu+SjN
         CuDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787370835; x=1787975635;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kG+MMYz+aA1z8JSTD2QnV706OsWOXs65jjB0XOhH9kw=;
        b=M7ia5BNvt9zl2pC/18kDTPRoXV4ufzkftKR1kxGK1WyLw/wLuSbPd8Igcn1ap46Zyp
         brImBI8/hTavnJ0CX6JsusYRr2CnSQtrJ8YrAkXKGG/3JfUDlDli9BrOBKe/bpRwgfn1
         mSN2Slhd//hGL0BoRNbR8hWAq0EicciEPUxLPhn8QIpUFXfpOr5GJqjgvL8HBKPBpj81
         3eFUTvUVn7KDWdCHkCnvv0La/DlhCCI8ONoTztDqOgXnx07/UNTjycP/0E2w/P98RBFP
         cLDkuyuaRtxpEDNhuTk5Qs/nUvsJBmlpat7t+jxTdN12IReerkPkxy0BdcKMivIAaBvp
         NuOQ==
X-Forwarded-Encrypted: i=1; AHgh+RqX4l1y9XxtUjDQqQe/Lmuqj8fWquraPHtLjQHmM5sVKKVaKNjOT5NCM6A9BKLFtze9Zr2QPBKM05aw+UGXpPE=@vger.kernel.org
X-Gm-Message-State: AFuF++mKxLi7n9dsYQzW/QLYL6Bmr1RBK0taz6dDrjNInpbgyMcWUm3W
	SyyWEEfEphDvfNPxUJ5T1vJi6MAPQD+FLcSLHTaHesGMCMHNAPeuq23dtrH10famwHUBBIcnH2y
	/0kLBChTkiU971paOuy0EHv9S6UbO7h0=
X-Gm-Gg: AR+sD12De95vdJqJeUe0kqnqdFXKMQiFBdJorYdqoe+imn5cVj6xiv4cSudl7mi8r0L
	vA/zrB4RdbvBeSNFgcSfWQ64glVsD9qZWfCpede/loaBDgu66Xaa1vMLeM9D+HV8PUyAraJW2CY
	qNo42I3VvHvpEL6yYPpcRDqp023Uhxxhy4g6Eq3R5w6GiB06hwAXtHJJj5pRYQT68r76gSsX1pH
	/3XC7Fj3YD+v3tj6njivnTbHf4PeJSfgwhiW61BdLuBCMHNqFonSkuzHv6uRGFEUneEzl5gAzv2
	czAoBXuCupUcTC4vcE2IXyVdcob1YeKP1CQNnDc2/7UAfxBuZp0UfCC63NySlvPs5ub7eLBsdYZ
	vpiX4Nk+QJdZsPG8RieybK2m15dLd1xHnLY3DFOaCIactWpJcKXhs5khR6XC/D7EGfnEK4mUDyy
	k1ZZF3Qe9QHQ==
X-Received: by 2002:a17:90b:268b:b0:38e:42f5:d096 with SMTP id
 98e67ed59e1d1-395c4528324mr9786023a91.0.1787370835140; Fri, 21 Aug 2026
 20:53:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821153823.266343-1-rastislav.szabo@isovalent.com> <17fac875-ce43-43ec-9e9d-329a09d4f3eb@kernel.org>
In-Reply-To: <17fac875-ce43-43ec-9e9d-329a09d4f3eb@kernel.org>
From: Dmitry Safonov <0x7f454c46@gmail.com>
Date: Sat, 22 Aug 2026 04:53:43 +0100
X-Gm-Features: AcwNN1WLQWXrst0z8n6URjzDOc7pdhpqlp4tZ_xrj6_SYGttebBw04BtAfWe5IE
Message-ID: <CAJwJo6ZBA5heLxJu_xsYFU8Vm-2SY8ONV3AZgDJse9oXAfqB=A@mail.gmail.com>
Subject: Re: [PATCH net 1/2] net/tcp: fix TCP-AO key deletion in VRFs
To: David Ahern <dsahern@kernel.org>
Cc: Rastislav Szabo <rastislav.szabo@isovalent.com>, netdev@vger.kernel.org, 
	edumazet@google.com, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
	shuah@kernel.org, dima@arista.com, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Aug 2026 at 19:34, David Ahern <dsahern@kernel.org> wrote:
>
> On 8/21/26 9:38 AM, Rastislav Szabo wrote:
> > TCP-AO keys with TCP_AO_KEYF_IFINDEX store the VRF L3 interface index in
> > l3index. tcp_ao_del_cmd() validates the supplied ifindex, but does not
> > assign it to its local l3index before matching keys.
> >
> > As a result, deleting a key scoped to a non-default VRF always fails with
> > ENOENT because it is matched against l3index 0.
> >
> > Fixes: 248411b8cb89 ("net/tcp: Wire up l3index to TCP-AO")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Rastislav Szabo <rastislav.szabo@isovalent.com>
> > ---
> >  net/ipv4/tcp_ao.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/net/ipv4/tcp_ao.c b/net/ipv4/tcp_ao.c
> > index 5094267447ae..26864621e6de 100644
> > --- a/net/ipv4/tcp_ao.c
> > +++ b/net/ipv4/tcp_ao.c
> > @@ -1834,6 +1834,9 @@ static int tcp_ao_del_cmd(struct sock *sk, unsigned short int family,
> >       if (cmd.ifindex && !(cmd.keyflags & TCP_AO_KEYF_IFINDEX))
> >               return -EINVAL;
> >
> > +     if (cmd.keyflags & TCP_AO_KEYF_IFINDEX)
> > +             l3index = cmd.ifindex;
> > +
> >       ao_info = setsockopt_ao_info(sk);
> >       if (IS_ERR(ao_info))
> >               return PTR_ERR(ao_info);
> >
> > base-commit: 746fc0787f616da418ffc04a110296fe95d53491
>
> Looks correct to me. Dmitry?
>
> Reviewed-by: David Ahern <dsahern@kernel.org>
>

Thanks, David,

This is embarrassingly correct!

Acked-by: Dmitry Safonov <0x7f454c46@gmail.com>

Thanks for the fix,
             Dmitry
