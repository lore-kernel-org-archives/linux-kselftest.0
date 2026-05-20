Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F1A3A5423
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 08:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779264574; cv=none; b=kyQeRcz5QbeolmmTwyogTGelrfanUyZCbAS1YFDAIG75z1txxvF082H/NwYGihC/ervk64y7PPV093Y0COcTPchFkCdJ5L/Tve7+4YV1Brqts2P9VlYuVNOWIH63w20Y+1x1qkaaU3d9sBR9RP7m72yOqOUcBskO3tsKA79PwnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779264574; c=relaxed/simple;
	bh=RnG5prUIJT1Dj9rQ3R5lbPac7MSi8iKFz1jOlZorcXQ=;
	h=From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Type:Date; b=pMd6cJsljLH0ChRp4QhWNBpocBsglxwj52Sl5joYyRJQY6M8OgMZCBjciR9/t9MTF9OHzU/I0zY3MobJ65N+lfOZ2lVDenufDywSseKup27ZHc13i/mIuSByqRDG1AF6GpZkBkZ4cYLqEqW7nz6Y6eGH+pSJMgCEOWVknW6OZSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FqZAV8Tt; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SnOMDSG2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FqZAV8Tt";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SnOMDSG2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779264570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iBnVKAjLxgMRqfF5bVPbwYrGCk/Jc+4whb6fkWm+2WM=;
	b=FqZAV8Ttp2v/B6A3EJAvVLz8w4f+wYCOFwvnMFA8kidsGIp7ELZjaF3pvH0BOcQfTBSW2v
	eTjhNXz72iAqys1bbtBxn27iXXO6a9dye5ur+gtioi0BXylYjdIQCQLsQ13JKSVQskRlT3
	xv7/JcXwdzaLb+/ZdHjhJYU7wwyoCEM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-BQWN7DsHMEuMoUQLYclNhQ-1; Wed, 20 May 2026 04:09:29 -0400
X-MC-Unique: BQWN7DsHMEuMoUQLYclNhQ-1
X-Mimecast-MFC-AGG-ID: BQWN7DsHMEuMoUQLYclNhQ_1779264568
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-48fd396daedso28491565e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 01:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779264568; x=1779869368; darn=vger.kernel.org;
        h=date:content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBnVKAjLxgMRqfF5bVPbwYrGCk/Jc+4whb6fkWm+2WM=;
        b=SnOMDSG2d4KmXhUGlJ3LVWAy7NkPMrz+N82nkxahRcidA2bFGLCg2ZETfCmgc/+KXW
         ef3cJYeI6b8AvB/MrdZz7x9Q8znE6gUA6E4vWJjyv7fN4Hh0ZOxCJhZ84ggUDse8RiDu
         u20vR38/Alzo1d5cCj3fNljlzDJaP+YSHhvW5IhkI1RFQdUkgDEjKBLPV+v506fMx3rU
         0zaQgQ/Io9DIEoy8xT7ZeiNzREnkGrsRu6XdLqTHRlRK4R6UxArqRAQnYdfr7Yw9OMeW
         rRsskCwKqWEECeQRSVYsHiYmgxBGMWJ/mKDpajwRqeRlKuTbF/QVNf+bsOFAwHLrIq3Z
         1POQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779264568; x=1779869368;
        h=date:content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iBnVKAjLxgMRqfF5bVPbwYrGCk/Jc+4whb6fkWm+2WM=;
        b=SnwR9bvDagZ58Uz1KzBbFaJ7HVKQeilkpIZ/qGpZEBE56sylGrMtjbz5N9BR9t+94C
         jgJSAb7Wx5yG+9SsNoIKQH7BgsVswn+Jq+pMVlu3FN8gPXuGxvlyy4N7QpKZHFxOW+oq
         Mq1meCS67gtw6A3euhTy6hgA3TER5yuuZkQRT7L80kJ2JzbGJMVUXKfTuSMDeS0JDXCu
         lamZyg0cYutc7JeRltvqN60kEJDeFuoYnq4Ktvlom5DqKvduk+A8rk0u9IXpkuB9LZN/
         kVz/KGCXbftatqIMPcl5466322MhRKK4Sy08a17kZJQRIXFgSj3n4x6CmXQNZTOf3GtA
         +KXA==
X-Forwarded-Encrypted: i=1; AFNElJ/70+5rjkO+VIoX7z+fjAgDH4PTxY7638DhLk4mt27TinVKm4ZrOBqOLlNsED9SGGS838AQkRp2fH4I5Ph4wt0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhDPJ9Cscxw/KBKjr8gg0C+ubyAjcvZL7a3scOtakA8t7sxcx2
	5MsLRBXi0ife0TQWchIszSv8scw0D7Mxw2BH1ePwCLywkJMRzOar4wIBRZqUNB9LQVkC31dYOQH
	c8iGUcyPNQ8gvYMLtw1qd3Hb58SaSVasYP485Xn3irMGQzl8NlC6EQeDl1e83IaDUHxlckQ==
X-Gm-Gg: Acq92OGIM4tEcyY3h77DZ5dDH/1S5iIe7T7cqKhSnpODscKYCAOg7+k9sTFFd17kiIY
	NRIadBQNPDwHLji1HREo9MiU69DSkpHEOdm065mOW6aIOVj83iJa+yrpnDIp/hy6gYnSivRlsVj
	h+4bLiAc+ZpgWZsJnk6HaNaiY/a4VUTfsI1qacg8dHVJmxBlpSR9K0by894AOmSNfla2P61gVru
	Q4IFgX/2giiJKZbDVpF4dONzrPH3C74vJM3WFM03XlDOQmgg8sy8IQsH2aboAZPWpg9cnjdCWrS
	d5EtRUyWGu0DFkefLvxfNiXLzYV0Cb/0M5An4IzSwieN+BDTR2FcoK5G2ciEW9alrul9oIcXwF5
	61e8UrVyFXq9mG/oZvP9SiVBf8muQYwMfiDJcGF3C93O96txn+LZyL3VuC70Z
X-Received: by 2002:a05:600c:37ca:b0:489:1b10:d896 with SMTP id 5b1f17b1804b1-48fe59af198mr357923705e9.0.1779264567777;
        Wed, 20 May 2026 01:09:27 -0700 (PDT)
X-Received: by 2002:a05:600c:37ca:b0:489:1b10:d896 with SMTP id 5b1f17b1804b1-48fe59af198mr357923215e9.0.1779264567287;
        Wed, 20 May 2026 01:09:27 -0700 (PDT)
Received: from maya.myfinge.rs (ifcgrfdd.trafficplex.cloud. [176.103.220.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5ab527asm425824815e9.11.2026.05.20.01.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:09:26 -0700 (PDT)
From: Stefano Brivio <sbrivio@redhat.com>
To: Eric Dumazet <edumazet@google.com>
Cc: Laurent Vivier <lvivier@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 Pavel Emelyanov <xemul@scylladb.com>, David Gibson
 <david@gibson.dropbear.id.au>, Jon Maloy <jmaloy@redhat.com>, Dmitry
 Safonov <dima@arista.com>, Andrei Vagin <avagin@google.com>,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neal Cardwell <ncardwell@google.com>,
 Kuniyuki Iwashima <kuniyu@google.com>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>
Subject: Re: [PATCH net v2 0/2] Fix race condition between TCP_REPAIR dump
 and data receive
Message-ID: <20260520100925.1c5e385a@elisabeth>
In-Reply-To: <CANn89i+RqFMt8X48V1xkk8mveLvcBORBb5crDKhSAGAvipxNRw@mail.gmail.com>
References: <20260518183424.3144867-1-sbrivio@redhat.com>
	<20260519190352.45c8478e@kernel.org>
	<CANn89i+DknqarcKuZxku-XvoioqkXrd3sQd3PXW5fdFZBpPxjg@mail.gmail.com>
	<5c1de7cb-42c2-473f-8d67-0523a3c86464@redhat.com>
	<CANn89i+RqFMt8X48V1xkk8mveLvcBORBb5crDKhSAGAvipxNRw@mail.gmail.com>
Organization: Red Hat
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 10:09:26 +0200 (CEST)

On Wed, 20 May 2026 00:27:38 -0700
Eric Dumazet <edumazet@google.com> wrote:

> On Wed, May 20, 2026 at 12:24=E2=80=AFAM Laurent Vivier <lvivier@redhat.c=
om> wrote:
> >
> > On 5/20/26 06:39, Eric Dumazet wrote: =20
> > > On Tue, May 19, 2026 at 7:03=E2=80=AFPM Jakub Kicinski <kuba@kernel.o=
rg> wrote: =20
> > >>
> > >> On Mon, 18 May 2026 20:34:22 +0200 Stefano Brivio wrote: =20
> > >>> Stefano Brivio (2):
> > >>>    tcp: Don't accept data when socket is in repair mode =20
> > >>
> > >> Not sure Eric is on board with this patch in the first place.
> > >> Sound like it's not the intended use case for REPAIR so IMO
> > >> it's up to TCP maintainers whether we want to support this.
> > >> And it's definitely not a Fix. =20
> > >
> > > I am not on board. Only net-next material for sure.

I wasn't quite sure, I'll re-target it for net-next.

> > > While v2 is slightly better, we have the fundamental problem of adding
> > > stuff to TCP receive path for features that almost nobody use.
> > > (It took more than 13 years to finally complain about the race)
> > >
> > > This consumes Gigawats of power on our planet (and tons of CO2), given
> > > the trillions of packets processed every second.

Absolutely not what I want, I didn't consider that.

> > > Please at least add a static key as we did in:
> > >
> > > commit 020e71a3cf7f50c0f2c54cf2444067b76fe6d785
> > > Author: Eric Dumazet <edumazet@google.com>
> > > Date:   Mon Oct 25 09:48:24 2021 -0700
> > >
> > >      ipv4: guard IP_MINTTL with a static key
> > >
> > >      RFC 5082 IP_MINTTL option is rarely used on hosts.

I will, indeed, thanks for providing the reference.

> > > But in my original feedback I pointed that we TCP_REPAIR should
> > > probably only insert a TCP socket into TPC established hash table
> > > only when it is ready to process incoming packets.

I looked into your original feedback, and replied, because I couldn't
understand how adding sockets to the hash table (they are already
there) would help fixing this.

Now I understand the confusion:

> > The problem is on the source side of the migration and I think removing=
 the socket from
> > the ehash table would trigger RSTs, closing the connection on the remot=
e side. =20
>=20
> RST is triggered anyway if TCP_REPAIR did not occur yet.

It's different than the problem Kuniyuki pointed to (with the link to
that proposed hack from January): there, you have a situation where the
socket doesn't exist yet because it hasn't been restored yet.

That's livepatching, on the same host / node, a different (new) usage.

But here (regardless of whether it's CRIU or passt) we're talking about
*migration* (CRIU: container, passt: VM) to a different host.

In this case, migration will be considered done / ready only after the
sockets on the *target node* are up and running. No traffic will be
routed to the target node before that point.

As long as we don't prematurely close the sockets on the source node,
there's no issue with RSTs anywhere (and we can also roll things back
on a failed migration). That's something we fixed in userspace without
bothering the kernel at all.

> This is why a netfilter solution is generally used to make sure no
> incoming packet is received until the whole state has been repaired.

See comment from Andrei here: the _main_ reason why CRIU (only by
default, though) sets up netfilter rules seems to be that it makes
things simpler *while dumping connections* in that specific case. A
separate namespace makes it straightforward.

That's not the case for passt: it doesn't need to touch netfilter at
all, and I think it's a very useful thing in terms of complexity,
security, and keeping the downtime to a minimum (other than, as Andrei
mentioned, making things generally safer).

--=20
Stefano

