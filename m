Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9AB384235
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Jul 2026 06:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783061565; cv=pass; b=IuPh3lxo/0yb09gqp5nOJlTgk/E/xF4Ax0cfw5+0wMP85KL9WSImMv52oXRVKA5z+8GiA0YjWMPhzm7XaYjx/l4SCAp6gQzSm4qjE9yjgm728x0k5A5GIQWjPZv1gXnS0CztIrQ8nGeVo+vugrg9XchQhzcPMiYtRIqSsDvryuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783061565; c=relaxed/simple;
	bh=6rmH7nFZ3g1kVeBhLP7Bf7XYtTGA2NkjIVGswHHX8A4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FsfqubOPgr+yejAfnDgiRSDM1Zx0qJ7iw17PYv9uQL+NYGrSjefFwVrLohZmos65DCSQEo0wQ1cOnw/Cq3hx59mFQXzROEVQm+iVw05RJpMA0fd0x914N9Suq5JARV55t4V3y4v8eQJVEquooaQUA0yRKs555RalMK1IfYk6Oic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lNeRAGEq; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lNeRAGEq"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39b315585a4so1443171fa.0
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Jul 2026 23:52:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783061562; cv=none;
        d=google.com; s=arc-20260327;
        b=qZj86g6iXNSgALvTKCvd5rdt/2ntYjLTeBU2g6Ahcr3nnrRjqCrlAWYvhSTpUia/bs
         RAQ9KGwONiVmuyp6WlmUKtpfS17WA/i46KcJz5IK+/tCZ7NCwWFQx6qO1aXKCl8PiDkM
         0oMndlR/zEQ07CRpodiKn2lvd9RVQQH3IflpWikN7LSlsl/P23PO8j88DT6yjc//k+r2
         J++0gpr/3fgbigxzaZ17mm3oIhqZMoejaK/T5O8GDU0hluSB2+d1esunK01phwEHYHKL
         LItj2oXd3amgZH4lrwJbe9+jRNR9d2LXKcl2Jn9TRxybN+Qc2KdUU1RhGjY/GhaPt3UB
         EIkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6rmH7nFZ3g1kVeBhLP7Bf7XYtTGA2NkjIVGswHHX8A4=;
        fh=CkwkURD8qp5GL/jNX7mpVFlCZxvzKIiAHRyX+r/XE6A=;
        b=sGAIfh45E93E41Dq4LmY5Doywu288o1oSW5uxgFRh3KyVsw2wotkdT+AKRDki23c+a
         sLcODm7lGmviWd4G2c5gWwRqR8CqGIm/igffIIm64rUeCUP/43ByoMn1xGNUiK60u9eW
         XAQDLJK6nxg6SwAlPOm4oyCTJbdR7nTI4Umn6FSAlU7MVkpQ1SEWpN5UBoj2ZYGVgj4n
         hYmQxCfe1K9eOJQDIeMbiv2bMwXFRyKyBIHDv7M3ec5fuq9ZPf1U26rjkyGVubQtnkgm
         wwF+MX2+zR2OJlt4bY7PFbzomNdflDWipl9bSBhikkxEB6Bo+jRvShkNLGYRcGbyzBvP
         MHmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783061562; x=1783666362; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6rmH7nFZ3g1kVeBhLP7Bf7XYtTGA2NkjIVGswHHX8A4=;
        b=lNeRAGEq8KkMb2LBZG50tYY1a1dIgu3GLbwkXgfaKFg4AkYvYTP1GSyQZiIZFtABuR
         XLG2caobbnKDvUWhvm1CVV8yu9iHLkt+uJYaUnkE64xjwEDIXrbRsgipIkTfSjv554f+
         vdFzGfIutiTINhUcZioP+uWYOjMSankJC8ARxrYphNJLjJytA5lqSMLlkSQSSQ1lNW2C
         2GhVzaGvNYlhvg8FtSo0K9X3AnvU1cgU2XkadFxV8j22mM/iEq8Ry3Ngz4t6D4FawCSo
         Hkn8gInWgRrFoYBOSQg5ryXbhT/zRStYq8vHsq0PhvNZyS44xC84F9zPlp4T5INkn9Sr
         IdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783061562; x=1783666362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6rmH7nFZ3g1kVeBhLP7Bf7XYtTGA2NkjIVGswHHX8A4=;
        b=ggcBsxFIcrx0bQtmx0RWKtpj3o5CCvFAEF2cqA+ICLmEPCqTB7E0Z/z4GXQBRMCM68
         CLoQN8wp4wU1vlNA/tK1Iig8v7/BhQpoDXe9zoeueZBOCKafswfd1aGN12m8qUow/hHJ
         BCVb+UP5pdWsoF5Zw8Ngu+fxpqTN0abGvjruwV39BK0uWX4Wco/J5gBbhTWojJAKOzpd
         AZA9jbWV0KF3RvHKc4aL3tugrgwCkOhEGsWJPHPkguOqqXYYxyKiYl6rvYgUW8eOnKoD
         ln6RJKsLx5cp2Eix8YCa9j1SILql4FV0tWxFb2VGJBsGPoSY3BcfkVEQCDyNbjdYDwos
         hQCA==
X-Forwarded-Encrypted: i=1; AHgh+RqbTCRIb377r5JgfNPC8DqJ2asr8SnKTL4QoNkbSuMCUZjsVRINnOvjbnLsO5MuJcSHLqO9ui+gpRDiTy6lfLE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMUWGzPqImGTjhwZbRv2J0SLQgHOtFbPd6ASAvMXXg/WNEgAEx
	0VifiMuRhUS4e1mRxbhbOcs/wERu5CI9B591d2rIs77R/cBcZZzRxsGAdW3gK60goqMNL9WYgfF
	KsBILiAkii9TBRoCz8VK8tcei/apaNHo=
X-Gm-Gg: AfdE7cllLxdHV07xMxRPGL3RVQk9G7K6lnlXQ6BSvIr8/55veTNSk9WvJArOF0EaNME
	BM09zdEKOCS7R6SGLeV7T/SPFFyqkPwWrM/dKZvIJCOHSGhRntiaDtgI4Rn6SqGu3wl56MfwGgg
	ZZVNLhd2AlfBTpBuoayMllQUPvpHk7EnOeDRU8vDAin+8g+/XRoZTW3OFDr+bQTmjId+bwhnLhA
	S4/O2JjjoxGR8c6xHoj4ptj8KdVA4X9Qt61zbuLFNNGfGALloRlAtZ286GFrwjceSGGkqoCZySk
	lPeC45bxLRsfg+DUL5IbSNJg4uNIqg2lTmAJp/k=
X-Received: by 2002:a05:651c:210d:b0:39b:3adc:70f9 with SMTP id
 38308e7fff4ca-39b3adc734dmr12890031fa.1.1783061561803; Thu, 02 Jul 2026
 23:52:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630110207.37841-1-sigefriedhyy@gmail.com> <2a0033b6-9a54-4de3-b1a8-78d4bc815f56@redhat.com>
In-Reply-To: <2a0033b6-9a54-4de3-b1a8-78d4bc815f56@redhat.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Fri, 3 Jul 2026 15:52:29 +0900
X-Gm-Features: AVVi8CfsyLmFI4V2Oiy4mfdVVgBC3R6h0Y84VuRNikPC2-9P90u6qAFqpBXQOJo
Message-ID: <CA+7S2vLf55AxPzu47MYisFqeb-0JJtzd96VSHEfgrqaH==93-A@mail.gmail.com>
Subject: Re: [PATCH net-next 0/3] net: report multicast group user count
To: Paolo Abeni <pabeni@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	David Ahern <dsahern@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Ido Schimmel <idosch@nvidia.com>, 
	Jakub Kicinski <kuba@kernel.org>, Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 3, 2026 at 3:50=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 6/30/26 1:02 PM, Yuyang Huang wrote:
> > RTM_GETMULTICAST reports IPv4 and IPv6 multicast group membership, but
> > does not include the per-group user count. Userspace therefore still ha=
s
> > to parse /proc/net/igmp and /proc/net/igmp6 to obtain the Users column.
> > In particular, this prevents iproute2 from moving "ip maddr show"
> > entirely from procfs to rtnetlink.
> >
> > Add IFA_MC_USERS to carry the user count in RTM_GETMULTICAST dumps and
> > RTM_NEWMULTICAST / RTM_DELMULTICAST notifications for both address
> > families. Update the rt-addr YNL specification and extend the rtnetlink
> > selftest to verify that two joins increase the reported count by two.
>
> Will you take care of implementing the iproute2 bits, too?

Yes, I actually have something WIP for iproute2 and realized it cannot
be done due to the missing fields. That's why I sent out this patch
series first.
