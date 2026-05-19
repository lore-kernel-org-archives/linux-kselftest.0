Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7F3246774
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 15:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779205002; cv=pass; b=LmyfBKDJlYE5HvXtUD+odtw4zkpxkWrBJTIsIR071YPQJan0+fgO2V8FPKtA3pVBHdt9in2Po1GnaRB8Tu574WRedZrsGtlgUqb/ZD2cGicJj7Mo77JUDMJdNvKqwLNS1NqnSIEs8xg1+MEpKF/WoYnsyT27RAJrjynTi27ryHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779205002; c=relaxed/simple;
	bh=RoW8xxcrfyxhHsHHJIqD8wSLm9cOVJUPT5gDCA0UmJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=orHff6lhQg5hFeobNoDC0YqEFNXuMOmKACn8fKkE4idSJZJLta3SoS/YALZk4Pg/YEJywi3CmD+hvoBzWrElJaQZIGfgrdtt9TmKUviw++ObRQ3O3mmNvJ0pXnSvgFLaqApon9ch/YoeFFpAMaLSrSLg82kT/T10drDbu925d8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PZLPTfrM; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PZLPTfrM"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-50d864c23bdso6441cf.1
        for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 08:36:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779205000; cv=none;
        d=google.com; s=arc-20240605;
        b=IPUuaVWR8v+okylIRS7c4ibN7gPTziFte3y5vcotHKdYIuG62YNxpRGx54z5CuraSB
         mcEEjG1+pJx2Qu+I195Z/OiUT1JoFIRX6g3H8rxECrxS39M/xXtj+s5WzDv5WOBHIz6e
         tmiJ3XEYVCzk+Z/AWdYAOIbhES918OSEL7vh7LXR5VFaZ7sE47F/E+l5j0IXXI4dx1jU
         OHHNT0ZP3zUoH5ci3Ahr8scZQm+Rq3Ts0Bpmp9JaixoqFUXYdMyhsLQoQrReHyOSPnYi
         u0W9F8M85M9W35IjgccYexoaxt5cJpproF9SHJCdY2ke/rcOKHLhOP/dNuzyoiAiQoa6
         pYBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kXd7Cus2AptV/QFC/1RRoAa92etv3I4OaJuLWjjIUAQ=;
        fh=Hwt7EBokJm4c+DrK/SvcJcXE1/GZeUNRu6XCtuQYjoo=;
        b=hp8StnPH8+GSYhfJ0/v5IuDRPJChzIhiccBUh05k8N6/3Rd+AZfJoFnMZ3B+55WHXU
         nixTcziRTvrY3cmMwUYHHl4N27eYNZ/KDqhfhlQaFw3gWSPXkaGnRrFOGHblJHk+MLhP
         eqhjL8v3gqG2JtZIZ0axBpCdUwQJQmGxTmXsnRixGA/trEdbG/36YI60rJ2rMekFYiJq
         Mu+wmz9Fer9E/PkNpnoW+eVJ1rYHJotg3ovUFoDo7jPTkOX+KCsXakA17ITUyNhN+KLa
         p2TKqh3HTStGC4PsaVLkIITEB/hEBP1DC1cr83hnWz93WKyhulkiWzhaZLQwgHKs0MTP
         2yyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779205000; x=1779809800; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXd7Cus2AptV/QFC/1RRoAa92etv3I4OaJuLWjjIUAQ=;
        b=PZLPTfrM1ri2z3z6fZAScCpCQGMhbaX6m5PNkWD82MeQmM++JYgnmu9qKt/bKUYdYS
         wFjttEz7HVni+/0mK8D35ScXk9xSCcFs5Qw7zHoji0v1DZL5tHbJmS3FOLWb7CvGKFlX
         qi4IarWYhL222QBCoS2q6cudD9msiglNJIk0JgHPgFCsxaLhJCNhL4yyaZrl8snu4ATH
         hLBJO/z3QhspwmFTnho0TU4S7MOPVsFJlOylF65gCHV4rfEJqBcyztCxXQnurqWsDoKg
         MtVgezVBGyXMSAfrz5xu092/6LJey5ECT0M8Ke3zpyVgNsLV0lgVm3i4QNXqxrwQ7qGL
         HKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779205000; x=1779809800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kXd7Cus2AptV/QFC/1RRoAa92etv3I4OaJuLWjjIUAQ=;
        b=XII0Ny1YYtjjpUKY1aX0vN1YrcBd1XUNarRoNOD7RUFyKiVkh98ZC8wqHPBCkR5pql
         Sj2qa99y72UPDdw90VUqCZoKG6yJ+nZ375RKm81HhsRd5QdvfwiX9nPYNCZTlAVFnWnC
         GByVLoYBO0VVf6z2RTj68EEPhJR721+trYBSjfh9W3fEPwzkqvKRz6lzLng2mRAHT6dE
         zhWqPKFs3TBMl/oQ2wGVAx5zrYbhxByuklIDDawO2jrkA9VQQT0wBuWKp4kimXG6YeQ3
         W1eV+jEeLLR7CpGpJ0Ww3utaJ9oGTVFwroReiQtrVQI+sZvEuZ6f62dLesGn9i7XJwyd
         0Wqw==
X-Forwarded-Encrypted: i=1; AFNElJ84SP+RRuLPxb+gW0bs8hyIFTIjfY29Hj6eiCG2VG/Rc9EyygsKGGqhRL5q5cxmqIYtYlw7FKXqHrydTwxQivE=@vger.kernel.org
X-Gm-Message-State: AOJu0YznDB7t878YMwmk2gURURnfRkIrzEawAxvo+PjhXiTpVwLpRtzo
	XeM0fIYjqB4IhdwNOSEjk2xxpI9B+hjUaX/Sc3dSMZTPSzhuBH0BL60s6TT0lXnwWn2iXWMztMy
	2HzLVRyob3K+cFe7GzhOLF5ptA3AgAphVP25rSTjI
X-Gm-Gg: Acq92OFvDP0c1hv49sXszn+J2YoHrQhXsjjw7cCZHRO576KKDVFfBvcrlhRU9Feoa69
	b8WQRpGYkb5uc/tLBIO61mdkiQpbEluMEtxydjYah/RwkmD1fo9Q2OdYmlFVIgigGEmM7Zqq6xl
	p+S4QnDQKdHDQaPfik/9NpQG91JPsmVSH8skIyRiWvSYqYkwzs00npvyTjY3b7sLzItDvUsRjQP
	IjBQ8xi7q7k9WWhoWlUuxN9QV/AJc4cB7nYebEYLm+bKo61qleO7b/aYFvbV5XUIOafJ+Pp3Lde
	PGB1iYBSCBP/7rN5hA==
X-Received: by 2002:a05:622a:8414:20b0:516:8fad:8fd3 with SMTP id
 d75a77b69052e-516a76459bbmr5688511cf.11.1779204999660; Tue, 19 May 2026
 08:36:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517184158.2757505-1-sbrivio@redhat.com> <20260517184158.2757505-2-sbrivio@redhat.com>
 <CAAVpQUCiHA=z62udnWLVyv0LeGsAHr+A=_o-8fomHZfJZJO2aQ@mail.gmail.com>
 <20260517215307.13cda56a@elisabeth> <CANn89iKLfBmh3_t4xJz3dDJ8VkMsEtHRifg0mRV1PPAryNY1-g@mail.gmail.com>
 <20260518132831.5b9eb0a8@elisabeth>
In-Reply-To: <20260518132831.5b9eb0a8@elisabeth>
From: Andrei Vagin <avagin@google.com>
Date: Tue, 19 May 2026 08:36:27 -0700
X-Gm-Features: AVHnY4ILS8hWfz3SbwmbnPQHxpGxsdBLLlSMDwr6KPiAlNuv_xnow8izWMPaQeI
Message-ID: <CAEWA0a5AG6JmeybHcxU+EL_Ohi0uVnSaVCiz7Bp_oDVuEdtO=g@mail.gmail.com>
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

On Mon, May 18, 2026 at 4:34=E2=80=AFAM Stefano Brivio <sbrivio@redhat.com>=
 wrote:
>
> On Mon, 18 May 2026 00:57:16 -0700
> Eric Dumazet <edumazet@google.com> wrote:
>
> > On Sun, May 17, 2026 at 12:53=E2=80=AFPM Stefano Brivio <sbrivio@redhat=
.com> wrote:
> > >
> > > On Sun, 17 May 2026 12:05:45 -0700
> > > Kuniyuki Iwashima <kuniyu@google.com> wrote:
> > >
> > > > On Sun, May 17, 2026 at 11:41=E2=80=AFAM Stefano Brivio <sbrivio@re=
dhat.com> wrote:
> > > > >
> > > > > Once a socket enters repair mode (TCP_REPAIR socket option with
> > > > > TCP_REPAIR_ON value), it's possible to dump the receive sequence
> > > > > number (TCP_QUEUE_SEQ) and the contents of the receive queue itse=
lf
> > > > > (using TCP_REPAIR_QUEUE to select it).
> > > > >
> > > > > If we receive data after the application fetched the sequence num=
ber
> > > > > or saved the contents of the queue, though, the application will =
now
> > > > > have outdated information, which defeats the whole functionality,
> > > > > because this leads to gaps in sequence and data once they're rest=
ored
> > > > > by the target instance of the application, resulting in a hanging=
 or
> > > > > otherwise non-functional TCP connection.
> > > > >
> > > > > This type of race condition was discovered in the KubeVirt integr=
ation
> > > > > of passt(1), using a remote iperf3 client connected to an iperf3
> > > > > server running in the guest which is being migrated. The setup al=
lows
> > > > > traffic to reach the origin node hosting the guest during the
> > > > > migration.
> > > > >
> > > > > If passt dumps sequence number and contents of the queue *before*
> > > > > further data is received and acknowledged to the peer by the kern=
el,
> > > > > once the TCP data connection is migrated to the target node, the
> > > > > remote client becomes unable to continue sending, because a porti=
on
> > > > > of the data it sent *and received an acknowledgement for* is now =
lost.
> > > > >
> > > > > Schematically:
> > > > >
> > > > > 1. client --seq 1:100--> origin host --> passt --> guest --> serv=
er
> > > > >
> > > > > 2. client <--ACK: 100-- origin host
> > > > >
> > > > > 3. migration starts,
> > > >
> > > > Here, a netfilter rule or bpf prog must be installed to
> > > > drop packets temporarily until migration completes.
> > >
> > > Thanks for the review.
> > >
> > > I have to say it's rather unexpected to have to work around obvious
> > > kernel issues in userspace: TCP_REPAIR implies that queues are frozen=
,
> > > and this is handled correctly on the sending side (see
> > > tcp_write_xmit()), but was clearly forgotten on the receiving side.
> >
> > Have you contacted TCP repair authors for best practices?
>
> I Cc'ed them here, Pavel is the author (but as far as I understand not
> active in kernel development anymore), and I know that Andrei did some
> substantial work on it in the past, so he's Cc'ed here as well.
>
> But we are following what CRIU (the userspace reference implementation)
> does, and CRIU would be affected by this issue as well (depending on
> usage).

Before extracting the socket state, CRIU uses netfilter (iptables or
nftables) to block all traffic associated with the specific TCP
connection or, in the case of a container, the entire network namespace.

This approach provides two main benefits:

During the dump, we don't need to leave all sockets in repair mode for
the entire duration of the dump.  We enable and disable repair mode just
to grab the state. It's simplify a roll back if something goes wrong.

During restoration, it ensures that the destination kernel will not
process any packets until the socket is fully reconstructed. This
prevents the kernel from sending a Reset (RST) or getting out of sync
before the connection is ready to be resumed.

I haven't looked at the patch yet, but I have no objections to the idea
itself.

Thanks,
Andrei
