Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A7D36B042
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 18:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779216184; cv=pass; b=nhkryEfGsLAUSRul89cvrUWjFo0KRER3v2f8jCD83fHkqHPOSomLrpdtW5qZI4cJWHDc2h42KauURUysBEgFzBnKhj3kHf8nIqJDRsQh+uIHjh4eCv4ysKQrULRhOf8KFJN7hSvFrstmTOKeD44AfmPn6w/ovC10Ockutr1vK3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779216184; c=relaxed/simple;
	bh=jyHZ/08tvcyFQsPqYGKjfC/6QDyS1u1QbpIxGFQeg9g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nv+alVJ43EB6CmPlRY8dFvjyH6zpfD9toUxW3P9p+0r6xMYXyYT7DJv74Y2hGBfr7uabLVdB0p+fGavd5sbSSlZuEyQVc+75Qq6+djyywKfKEQy8ayHcjxsXhPj9fWoyKenr52yAcnSqvNC03dZyMvD7xd8m0+oROBLo0Bkh1+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TrQlHwVs; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TrQlHwVs"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-50e61648f10so10681cf.1
        for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 11:43:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779216182; cv=none;
        d=google.com; s=arc-20240605;
        b=droHPQTg9zqR22ptLXTfZNGjKFxL5GKx3eZCc5IZ2mOM7dGBvj1z2cuME/GiTkH9Nh
         4V+WzsyfVyFsqxMldNnLNUylN7RXxB68ugG2y3/LDv0KI/9krIQCn0mMvQK6YM3c2b2Z
         Pl9dcv/SGh7W2hd811XTykhooTY6hKNd6XqgQy0+PjmJUnrJy3aln56hnswgEoEI1DmB
         xDrxkRXS/e6Hw8mNR+Z1kjBaotLyWTa/Jt7gxtbD89tLxDTUlnR6oB9g+xp8ZzDPjHt3
         2KzeJJ4vGF8g7cKo38fDMgoRenmziZhvoAeiglQ3J0629fhYUvSryy/ug6xIgtHwSjce
         r3Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i16+FFvfRzBkoRR3FfnvsjYKLz//qSHJsdGGTw8nQ+c=;
        fh=CIfhPUVnDKwT/DDwZr9A2Fwy3xyKgrLW78c0n1J5Pv8=;
        b=YZK0M1sTTpEyuW15T/i6yGzqmHYHbApYCJ9YdCXVGk3MPZ83SeTN0PSK/LYDhSYAzu
         KUaCS2XeqTYLDq+KCivC9FP3kanhaELwkLAF2dkrFxl5tECHCK/L94OAfnEzih0Ix8pU
         /piYaa8qaNYyen2pEMRpWrVg7TBXrf63waGwM7Y4z1PpRk2HV+U5hxmzmi6VQuiJP5Bq
         wzCVGC6KPjM04WOttdN9l+desD+RzSmr9uRJS49eR11Yc+s0ExqNWNtIPtycEekxy+oP
         AS7LrYbIgSYYhZnDTPCDhPkEItf2x3J03KyZD59rSBPCefOw33sZI6V0grPITho90xeM
         bePA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779216182; x=1779820982; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i16+FFvfRzBkoRR3FfnvsjYKLz//qSHJsdGGTw8nQ+c=;
        b=TrQlHwVstY6h/+9d08qDcMlrUXqpD/dz/oBE7sDTDTWycWY3h7XePO3FbNKSZYlYZg
         lKvt4j81W6ydM7fr12MVwWXWk9qA+buG0Scoj2vcLQmUCFNM2BcAk2vc4q4bysl6re+N
         PFKvU/AQRcXqos1FReFeDz10uTjOeNwd/Rpmi0oanLoM+0AQr4BoYPHLG7tplOkzSiez
         1AHjPzUDaJ/ruiDAeQSEq8WNA9IrU/UOI319EPlYw29zARWWVFrltsNEaNhMukVAn/Hp
         CuL3KTzfxOav0D59YK0qOj7NS8AtxT8Id+hiZconZ6ryUWe02CeXfTFoN3bVjmJVLDBD
         7nnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779216182; x=1779820982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i16+FFvfRzBkoRR3FfnvsjYKLz//qSHJsdGGTw8nQ+c=;
        b=R3bfiBU2c5WOKaY8QAP8x7RNFGTPWvL+5Cxc2/WommqhIIjDpFre0VcWmkL5O6Cq5y
         V8lzWKd6XBs8lF+pkdRxGJ7oSb8AZpsYvTX0byeuR/bFIrLpDlfI4fvMOHtrxnZI/CXZ
         +usToQ5ama915YBKXwCnPlkBhhgfkoTOMr/8oDlKjtVls8iTLU83wzILnTYfoEKoRNwI
         fAP3h0tHSL9r9UHBNdgQ7ODtH0XpPHRXl+LumaL5hPylbYFzl13Z12yl1dEPObshOG07
         1DAxqCH7Lf80t3tvP7VDa3FrMSML0/mKmWgQ7B7NZeVH8Iz//oPomvbZ7Qq5uIPwbDGu
         nBuA==
X-Forwarded-Encrypted: i=1; AFNElJ+/biOVrmtQe/xX0Y++z/ix6NpuQe8twcInFYkN5QbjXjl90aCPGay12Q2oke4of81k0o38PL0KSi9PCKIavJc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI6yyYJLt2IEpuJJErPG84cMBLmVQOy31mlZh8caABQ3pMnPG9
	jDlUdWJzQhEFm9SS3l7ZBr6GdhirFq0EvL1rQaiTyQ4+NOS3ASHaOVSlQSw1zEhPIu/DnP5dE4C
	ghRMCnDgs1iECoDM+CyCWlzDwaO4gmEIwf0V3DF4U
X-Gm-Gg: Acq92OG80YWNWoRcbFifxcwRYl2oFxaPv1FMa/28HxexzQuwauPMm86ozEd+UAZJfz0
	lA/jlEz0ffodmscBkCUwd27e3xh/suzS3ZPH4s+XAgaND94AlbI1wT79G6/abv2vgIe1RSevqiL
	oKMTymQbGeISHV1VmNWEKchngYbzw6oXieNH0FoK/ZOBDIhXU+y21RKPEDT2yIyr+aU317lJmKm
	3QAQGZd7cz+pVsWKBMWojJT6UOT0ur60jIsAr0a1qdqqlcb7lvx7NZT/lfQEPN0BgdxcjQws9D2
	DIC5C2VW3P/SPkulhw==
X-Received: by 2002:ac8:5f91:0:b0:50e:41f3:6467 with SMTP id
 d75a77b69052e-5167943f41fmr9837631cf.12.1779216181555; Tue, 19 May 2026
 11:43:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517184158.2757505-1-sbrivio@redhat.com> <20260517184158.2757505-2-sbrivio@redhat.com>
 <CAAVpQUCiHA=z62udnWLVyv0LeGsAHr+A=_o-8fomHZfJZJO2aQ@mail.gmail.com>
 <20260517215307.13cda56a@elisabeth> <CANn89iKLfBmh3_t4xJz3dDJ8VkMsEtHRifg0mRV1PPAryNY1-g@mail.gmail.com>
 <20260518132831.5b9eb0a8@elisabeth> <CAEWA0a5AG6JmeybHcxU+EL_Ohi0uVnSaVCiz7Bp_oDVuEdtO=g@mail.gmail.com>
 <20260519181157.1b0605f8@elisabeth>
In-Reply-To: <20260519181157.1b0605f8@elisabeth>
From: Andrei Vagin <avagin@google.com>
Date: Tue, 19 May 2026 11:42:50 -0700
X-Gm-Features: AVHnY4IEKu_LjVK5cbfuKENBvnGAkj0ktHC3a1qrMUHOlR6-1UX7It_8tvvetmA
Message-ID: <CAEWA0a4d-PpWpVexYGP5SLRuzj8hs1W1_Ww6qA4BBrkzSs4umQ@mail.gmail.com>
Subject: Re: [PATCH net 1/2] tcp: Don't accept data when socket is in repair mode
To: Stefano Brivio <sbrivio@redhat.com>
Cc: Eric Dumazet <edumazet@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Pavel Emelyanov <xemul@scylladb.com>, Laurent Vivier <lvivier@redhat.com>, Jon Maloy <jmaloy@redhat.com>, 
	Dmitry Safonov <dima@arista.com>, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Neal Cardwell <ncardwell@google.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 9:12=E2=80=AFAM Stefano Brivio <sbrivio@redhat.com>=
 wrote:
>
> On Tue, 19 May 2026 08:36:27 -0700
> Andrei Vagin <avagin@google.com> wrote:
>
> > On Mon, May 18, 2026 at 4:34=E2=80=AFAM Stefano Brivio <sbrivio@redhat.=
com> wrote:
> > >
> > > On Mon, 18 May 2026 00:57:16 -0700
> > > Eric Dumazet <edumazet@google.com> wrote:
> > >
> > > > On Sun, May 17, 2026 at 12:53=E2=80=AFPM Stefano Brivio <sbrivio@re=
dhat.com> wrote:
> > > > >
> > > > > On Sun, 17 May 2026 12:05:45 -0700
> > > > > Kuniyuki Iwashima <kuniyu@google.com> wrote:
> > > > >
> > > > > > On Sun, May 17, 2026 at 11:41=E2=80=AFAM Stefano Brivio <sbrivi=
o@redhat.com> wrote:
> > > > > > >
> > > > > > > Once a socket enters repair mode (TCP_REPAIR socket option wi=
th
> > > > > > > TCP_REPAIR_ON value), it's possible to dump the receive seque=
nce
> > > > > > > number (TCP_QUEUE_SEQ) and the contents of the receive queue =
itself
> > > > > > > (using TCP_REPAIR_QUEUE to select it).
> > > > > > >
> > > > > > > If we receive data after the application fetched the sequence=
 number
> > > > > > > or saved the contents of the queue, though, the application w=
ill now
> > > > > > > have outdated information, which defeats the whole functional=
ity,
> > > > > > > because this leads to gaps in sequence and data once they're =
restored
> > > > > > > by the target instance of the application, resulting in a han=
ging or
> > > > > > > otherwise non-functional TCP connection.
> > > > > > >
> > > > > > > This type of race condition was discovered in the KubeVirt in=
tegration
> > > > > > > of passt(1), using a remote iperf3 client connected to an ipe=
rf3
> > > > > > > server running in the guest which is being migrated. The setu=
p allows
> > > > > > > traffic to reach the origin node hosting the guest during the
> > > > > > > migration.
> > > > > > >
> > > > > > > If passt dumps sequence number and contents of the queue *bef=
ore*
> > > > > > > further data is received and acknowledged to the peer by the =
kernel,
> > > > > > > once the TCP data connection is migrated to the target node, =
the
> > > > > > > remote client becomes unable to continue sending, because a p=
ortion
> > > > > > > of the data it sent *and received an acknowledgement for* is =
now lost.
> > > > > > >
> > > > > > > Schematically:
> > > > > > >
> > > > > > > 1. client --seq 1:100--> origin host --> passt --> guest --> =
server
> > > > > > >
> > > > > > > 2. client <--ACK: 100-- origin host
> > > > > > >
> > > > > > > 3. migration starts,
> > > > > >
> > > > > > Here, a netfilter rule or bpf prog must be installed to
> > > > > > drop packets temporarily until migration completes.
> > > > >
> > > > > Thanks for the review.
> > > > >
> > > > > I have to say it's rather unexpected to have to work around obvio=
us
> > > > > kernel issues in userspace: TCP_REPAIR implies that queues are fr=
ozen,
> > > > > and this is handled correctly on the sending side (see
> > > > > tcp_write_xmit()), but was clearly forgotten on the receiving sid=
e.
> > > >
> > > > Have you contacted TCP repair authors for best practices?
> > >
> > > I Cc'ed them here, Pavel is the author (but as far as I understand no=
t
> > > active in kernel development anymore), and I know that Andrei did som=
e
> > > substantial work on it in the past, so he's Cc'ed here as well.
> > >
> > > But we are following what CRIU (the userspace reference implementatio=
n)
> > > does, and CRIU would be affected by this issue as well (depending on
> > > usage).
> >
> > Before extracting the socket state, CRIU uses netfilter (iptables or
> > nftables) to block all traffic associated with the specific TCP
> > connection or, in the case of a container, the entire network namespace=
.
>
> ...by default, yes, by "depending on usage" I actually meant
> '--network-lock skip', but I have to admit I'm not sure how commonly
> that is used.
>
> > This approach provides two main benefits:
> >
> > During the dump, we don't need to leave all sockets in repair mode for
> > the entire duration of the dump.  We enable and disable repair mode jus=
t
> > to grab the state. It's simplify a roll back if something goes wrong.
>
> Thanks for clarifying this aspect, I wasn't sure whether it was done to
> make rollback easier.

I would rephrase that: it likely wasn't implemented originally because
Pavel may not have considered it necessary. When checkpointing a
container with a separate network namespace, blocking all traffic within
that namespace is straightforward. If CRIU crashes or is killed during a
dump, we simply unblock the traffic, and everything continues to
function without needing to manage individual connections.

As I mentioned before, I have no objections to the idea itself, moreover
it looks quite rational and will make the code safer regarding undesired
side effects/race conditions. Thanks for working on that.

Thanks,
Andrei
