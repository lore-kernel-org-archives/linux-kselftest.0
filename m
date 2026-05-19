Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F593403F3
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 16:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779207124; cv=none; b=l8jDUhn+SThD7Hqzq02xLz3vOlB9WqIJbaISEK/s77IjXm3vc8Gd7sC/XWd4WqmB+caMMlj2kbNzCFqsiTzhTnAcgaCE/Csjm+CPMeMfZLCvqwOGl/ajMcO0upMRHIeBseKe4aADok3ebBEDYoxpnSKEMUqTL6FyhELGOnjXz4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779207124; c=relaxed/simple;
	bh=SwzAi8yu+S27YTGxUjbg4ldoUdfcQI/sTtyl9yh74QM=;
	h=From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Type:Date; b=hitW4qTWvHIUAdb/0WmxoZvH8e1ijeMsaSZX9qmBI3muSUe9kSoE9PbLIejCGjWR4KSAIuQAauJPEh1Un60+HtkiprqXJ6XdcrNd8ojESuYssgjFg1YP2V80XY8Mw+yJuONLTCBGWmf1iifWgQ+DI4tvenCpoJB93kB/it8U5S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f0pWrbLA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=JKylge7r; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f0pWrbLA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="JKylge7r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779207122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2gnLrrn+7nX3fa4iayPCgEsGwtcjXldmlIY1Tbv8prs=;
	b=f0pWrbLAkAueWhf8OV9c5iycT2coyzvQVjGPom/K4M7EZRPj6NEBswPwK6ikVhSzlv9y8V
	r2c6chl2GYCRSTCHXsLTb8iZQSQl0SuaRd4GxPDXdBm/7GoqrzEnVbVm2ulURMrFVyW5fV
	oyPF5ht8OG/RWjUkPIe+0CaA7jH1W64=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-2zjzahokPr6dP8c-CziJhQ-1; Tue, 19 May 2026 12:12:01 -0400
X-MC-Unique: 2zjzahokPr6dP8c-CziJhQ-1
X-Mimecast-MFC-AGG-ID: 2zjzahokPr6dP8c-CziJhQ_1779207120
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-44d83e45febso3297906f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 09:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779207120; x=1779811920; darn=vger.kernel.org;
        h=date:content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2gnLrrn+7nX3fa4iayPCgEsGwtcjXldmlIY1Tbv8prs=;
        b=JKylge7rFHoQ3gkFotnEjqSETpuDTcpRY7i9Ot+2m29Nhc8y02LaHgBGKLrXVersh6
         t15jJvGYgi/GA1+dh3ZpwAa58sKAOGIH668BccSIefMnjakZ3N3V2nOQKr3+CG2r5Awh
         PNvRdrOcMyd1CiFjp/CfNQivjSZEYgtmyRFbsh/8tuN+kyxJCavF5cJWrXwFwUj/iDZG
         S0+IPgzOj0IuuHyU+SIOdX4F2SqmtAZo02gzRqxWjX1pmko8645hYHBYT6HdCYt2iMBT
         lMm98zewE99TlhTBEFizBQwrdpRhTgwTUOx8khHlnwyrbzqCdZQOMNc+JiLRGceEu4jn
         XWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779207120; x=1779811920;
        h=date:content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2gnLrrn+7nX3fa4iayPCgEsGwtcjXldmlIY1Tbv8prs=;
        b=PYn4oiv/hBI2ltrCOYynPOhtjJdwdz0Y+Zz/FH1ZaXc2XHq5+75Q7aDkZQYYF2tFjq
         YrI1UdEpfzpp0vS2zBks9HFGTWWKKw3IRSv/Uabtut/4539hyp9IUohLw6QlBPNaLgMz
         pBrSYYHK+gvuHFs69d/k+U0u5HMv2HMnrRd0ayv5va+vbBtRIOUsA4I5LBh4i403X/ip
         MgDNq3KuH5GxCRYDB9r31i44qtR4CcusVexfybXyTcqlWpUClPFvkkyXpfLeGwmsrGv2
         V4pOZ70oI5KKfNbwl8VDBQNxJI57GQhgMcppS3K/LN8BmLX4P7OmSRoTKXg3qxXkyeCf
         x+CQ==
X-Forwarded-Encrypted: i=1; AFNElJ8fq1C98XyQGl00RHYcr4/bpJInsWyTAjKslFhvLwVc8q+3v4DmFpjqvk2+KMleOcTYLwO9BxyD0Gi1zqUnmSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzI8EXY7n8bqnxLek1knzzgjtW56G029Xxolaf4iNFrUzrqdCs
	uuRr4++bS0NQCObnHptmus1rjrjqDLqMeorRSU1jAUgFo7ZtcRs0rIRZrHdOHp2Oc21Ei1lICRw
	E/rM4gFhzDRv/vFAh8dJpAVfmGjFFUSHJ/qg9FENz+3r0KKyjp35OFsyeUNknNwa/HuMXIQ==
X-Gm-Gg: Acq92OGnMJbcTaCnvFNi7D3SuQ2F3iGZcsgXoEKvrfc+RIiqCtU/deaFLe2iq0NNKQ7
	s8w6zLNP0BxFzt19uyFTh3cbPsXEPbJOu/mEVpu0/85N8G4w50VRkZQSFdJCu/URH+kNVSZMwdO
	qxib1JYdERwVv3uZ1sK6ljkakUZs/NJHqB8Xi7Q/Opo7QcW++WIB2XQzAgilgc7tZ4E4vc/9bEt
	ZXObHqgztq2N8/r4+iTIP8dva0Xx2XQVQSodMPg3yo4KeVvluqldc2lvFamgiHFkZRyjFsA/IjI
	0GZwKFV1mexcDmkVnuum4tflBHLGyHH58eivfjblnxTeP8fZZ/HUAs5Lg3rK9Wz9U4mOVZoTaFA
	pQEVIRvfF2gltWXFzles9fjKcy9Xd11yj
X-Received: by 2002:a05:600c:46d0:b0:489:1abb:5559 with SMTP id 5b1f17b1804b1-48fe4dad784mr281584845e9.5.1779207119748;
        Tue, 19 May 2026 09:11:59 -0700 (PDT)
X-Received: by 2002:a05:600c:46d0:b0:489:1abb:5559 with SMTP id 5b1f17b1804b1-48fe4dad784mr281584365e9.5.1779207119186;
        Tue, 19 May 2026 09:11:59 -0700 (PDT)
Received: from maya.myfinge.rs (ifcgrfdd.trafficplex.cloud. [2a10:fc81:a806:d6a9::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48ff43f213esm160227335e9.1.2026.05.19.09.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 09:11:58 -0700 (PDT)
From: Stefano Brivio <sbrivio@redhat.com>
To: Andrei Vagin <avagin@google.com>
Cc: Eric Dumazet <edumazet@google.com>, Kuniyuki Iwashima
 <kuniyu@google.com>, "David S. Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Pavel
 Emelyanov <xemul@scylladb.com>, Laurent Vivier <lvivier@redhat.com>, Jon
 Maloy <jmaloy@redhat.com>, Dmitry Safonov <dima@arista.com>,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neal Cardwell <ncardwell@google.com>, Simon
 Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: Re: [PATCH net 1/2] tcp: Don't accept data when socket is in repair
 mode
Message-ID: <20260519181157.1b0605f8@elisabeth>
In-Reply-To: <CAEWA0a5AG6JmeybHcxU+EL_Ohi0uVnSaVCiz7Bp_oDVuEdtO=g@mail.gmail.com>
References: <20260517184158.2757505-1-sbrivio@redhat.com>
	<20260517184158.2757505-2-sbrivio@redhat.com>
	<CAAVpQUCiHA=z62udnWLVyv0LeGsAHr+A=_o-8fomHZfJZJO2aQ@mail.gmail.com>
	<20260517215307.13cda56a@elisabeth>
	<CANn89iKLfBmh3_t4xJz3dDJ8VkMsEtHRifg0mRV1PPAryNY1-g@mail.gmail.com>
	<20260518132831.5b9eb0a8@elisabeth>
	<CAEWA0a5AG6JmeybHcxU+EL_Ohi0uVnSaVCiz7Bp_oDVuEdtO=g@mail.gmail.com>
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
Date: Tue, 19 May 2026 18:11:58 +0200 (CEST)

On Tue, 19 May 2026 08:36:27 -0700
Andrei Vagin <avagin@google.com> wrote:

> On Mon, May 18, 2026 at 4:34=E2=80=AFAM Stefano Brivio <sbrivio@redhat.co=
m> wrote:
> >
> > On Mon, 18 May 2026 00:57:16 -0700
> > Eric Dumazet <edumazet@google.com> wrote:
> > =20
> > > On Sun, May 17, 2026 at 12:53=E2=80=AFPM Stefano Brivio <sbrivio@redh=
at.com> wrote: =20
> > > >
> > > > On Sun, 17 May 2026 12:05:45 -0700
> > > > Kuniyuki Iwashima <kuniyu@google.com> wrote:
> > > > =20
> > > > > On Sun, May 17, 2026 at 11:41=E2=80=AFAM Stefano Brivio <sbrivio@=
redhat.com> wrote: =20
> > > > > >
> > > > > > Once a socket enters repair mode (TCP_REPAIR socket option with
> > > > > > TCP_REPAIR_ON value), it's possible to dump the receive sequence
> > > > > > number (TCP_QUEUE_SEQ) and the contents of the receive queue it=
self
> > > > > > (using TCP_REPAIR_QUEUE to select it).
> > > > > >
> > > > > > If we receive data after the application fetched the sequence n=
umber
> > > > > > or saved the contents of the queue, though, the application wil=
l now
> > > > > > have outdated information, which defeats the whole functionalit=
y,
> > > > > > because this leads to gaps in sequence and data once they're re=
stored
> > > > > > by the target instance of the application, resulting in a hangi=
ng or
> > > > > > otherwise non-functional TCP connection.
> > > > > >
> > > > > > This type of race condition was discovered in the KubeVirt inte=
gration
> > > > > > of passt(1), using a remote iperf3 client connected to an iperf3
> > > > > > server running in the guest which is being migrated. The setup =
allows
> > > > > > traffic to reach the origin node hosting the guest during the
> > > > > > migration.
> > > > > >
> > > > > > If passt dumps sequence number and contents of the queue *befor=
e*
> > > > > > further data is received and acknowledged to the peer by the ke=
rnel,
> > > > > > once the TCP data connection is migrated to the target node, the
> > > > > > remote client becomes unable to continue sending, because a por=
tion
> > > > > > of the data it sent *and received an acknowledgement for* is no=
w lost.
> > > > > >
> > > > > > Schematically:
> > > > > >
> > > > > > 1. client --seq 1:100--> origin host --> passt --> guest --> se=
rver
> > > > > >
> > > > > > 2. client <--ACK: 100-- origin host
> > > > > >
> > > > > > 3. migration starts, =20
> > > > >
> > > > > Here, a netfilter rule or bpf prog must be installed to
> > > > > drop packets temporarily until migration completes. =20
> > > >
> > > > Thanks for the review.
> > > >
> > > > I have to say it's rather unexpected to have to work around obvious
> > > > kernel issues in userspace: TCP_REPAIR implies that queues are froz=
en,
> > > > and this is handled correctly on the sending side (see
> > > > tcp_write_xmit()), but was clearly forgotten on the receiving side.=
 =20
> > >
> > > Have you contacted TCP repair authors for best practices? =20
> >
> > I Cc'ed them here, Pavel is the author (but as far as I understand not
> > active in kernel development anymore), and I know that Andrei did some
> > substantial work on it in the past, so he's Cc'ed here as well.
> >
> > But we are following what CRIU (the userspace reference implementation)
> > does, and CRIU would be affected by this issue as well (depending on
> > usage). =20
>=20
> Before extracting the socket state, CRIU uses netfilter (iptables or
> nftables) to block all traffic associated with the specific TCP
> connection or, in the case of a container, the entire network namespace.

...by default, yes, by "depending on usage" I actually meant
'--network-lock skip', but I have to admit I'm not sure how commonly
that is used.

> This approach provides two main benefits:
>=20
> During the dump, we don't need to leave all sockets in repair mode for
> the entire duration of the dump.  We enable and disable repair mode just
> to grab the state. It's simplify a roll back if something goes wrong.

Thanks for clarifying this aspect, I wasn't sure whether it was done to
make rollback easier.

That wouldn't really simplify things with passt in case of rollback
because, as we anyway keep track of flows internally (we implement
them, after all), we want to keep those sockets (frozen) in repair mode
until we're able to process traffic again (something CRIU doesn't need
to do), and explicitly take them out of repair mode at a rather precise
point in time.

> During restoration, it ensures that the destination kernel will not
> process any packets until the socket is fully reconstructed. This
> prevents the kernel from sending a Reset (RST) or getting out of sync
> before the connection is ready to be resumed.

Right, we don't have that issue in passt (anymore) because we keep
sockets open on the origin node anyway, and we block migration until
we're done restoring connection sockets and listening sockets on the
target.

> I haven't looked at the patch yet, but I have no objections to the idea
> itself.

Thanks for the explanation and for having a look! For passt (and
KubeVirt) that would save a lot of complexity, plus the security
aspects myself and David raised.

And, besides that and the usage CRIU and passt make of it, I still think
that allowing data to be queued while somebody can dump the queue is a
fundamental race condition.

--=20
Stefano

