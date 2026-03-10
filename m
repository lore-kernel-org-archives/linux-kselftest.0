Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716163E8C7B
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 07:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773128475; cv=pass; b=nOuogbku/7POQ5/Q92KA1Gg54uqpaqz3uJIU0mJYUqpZxxQiN2MEj92yGeYCy4yqwqZObEbZyh7h8xvDaCyIdHg+RFpGrkpwHm23okHjxb6jjmngEOQagGCQXqCX+6SDdMW4oB7GIumnAp1dl6w8YSUql91SIiD36Y5tX+k2WSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773128475; c=relaxed/simple;
	bh=7cTgaURun945ZBxkV8bmKWLaXe5u+DBTf6pF7YLrF4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NL7lCthdJW0J9Yj0mqYIvV6svnds3Leb8gdCKHafYqlY1bqRI0rvpiYoFNnbVWKLmULoEuSe0zg/27HCdKY/HJIS+FsnbQmSrU1QStk8AvZh5SEccCN4coi4Hv1XUgcgfSiBAJdVWfU+0PJxoC/biuzNwmu+O7Sqz1A5m3tTNrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aXVrHKTx; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aXVrHKTx"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-509046c5c7fso32993511cf.1
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 00:41:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773128469; cv=none;
        d=google.com; s=arc-20240605;
        b=hHDIh9oBkBdw/LhxpxtxpVNHLzceJxJqGUGQ+vfn2BPq1PMV9mEd49/8IWSVB+UfId
         E8hCT1Kp/RiQE1CPN5l3k6ySfdumuuuUvsFv5hkI5uszzE/Jy2c2ic+80W9VD6X3+UWe
         /O+VYguSI1uaLyskmBN3SzY5Pa6dsippyaBdbx9NPjTGzc7zzkElXyMVLs+Y38gkexgt
         2NhTFZSd+eGk8xtDSNJOV2RNo+/eYVJrFQyxX5fhhCqtDAW2ntuPMB+bJnlg7OmBj4j9
         BV3r5vNOHmOD3ugeFOf1jOYNZK9NnTBdyGByB0o9Kvsbmyc5dzBHxtgxSlRH4P0+gDCA
         GDBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rcMzOrru+dNP0H3b9Nuh0ONkl84RLF9HUfefvP22L6g=;
        fh=osOBA9mSEw1RKg8VhgbNLFBjrngMZDOMWB63Qth1rz8=;
        b=i3H5YiGKKDqxMtLAhfFqstLwlpqv8ifEANs6gm979AxLeLIsZY1pdGvTyNzckJNwud
         PaklS3UqUS1t4j1BTucmrx+PBWPtXL09CtWwy81N2EaNN5HLv44bZ0CzL2XPFCKRjiZn
         Qzkf3HEXoMKD4lU5JZ7KOBbsV3PFK4G7plFQgV2weqeGWwidpOrPamCC+pUbmxdNfsV4
         zo9VhrXdf33WZMx+fIocPW1tvXMEpShxusdu4mKcH4ToZZ6PPXzhhKh5orA9koKFw9ni
         moHP8t2fZS6qaBb2xDHtidpprgjocjUOQ3VN1/0zmbwHKlYMoWJSuhPKSIji+/i1hjVb
         yRsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773128469; x=1773733269; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rcMzOrru+dNP0H3b9Nuh0ONkl84RLF9HUfefvP22L6g=;
        b=aXVrHKTxHQAxiU/zPZOLkC1z6p8cJocbwkVWQbLD6aegwfelc7y3aC+RRkXHga1Sie
         XCo3HdWFhKcXWrm1LIqa7cF35EwGqzbRq6neMd5gF8fCGZg9WEgfuYEbiviOPDj6oZ18
         aIgsniUYS25+4tBcFH4BilSRm72bCzdY0Y7JClg3yh3YudwyR/dsVWyssX/yVopGxAGV
         xNkahW+xAZ1ImQkuJn3O1GCcLA5V0WY4ced7lwzOF83Gza94gSykTR2rsbgT/NGlVk1K
         OWHRnNlj74CwW06+xvfUd/gfN+GHVQEaosZy49zX9VnwIZq9L0MRBp8yiUYqAX+vzXYb
         KFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773128469; x=1773733269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rcMzOrru+dNP0H3b9Nuh0ONkl84RLF9HUfefvP22L6g=;
        b=KoG52b2CMV/ypzmkcZqbXMp7HlwLoYMsVHiJOh2zKAN0XlwbzIsvL0loAP+mys4aEo
         3uY+RgYGYOB7fw3KPCs31D9C+0yRdJ745hnyAyazpXIp+mttzYGgj+Y3mBgsj4vSUJm4
         rZ/xgZueE2mF0HUH70QcVGFDuSEXp6fMLwnwksMaObdPHl/rGfIDfwpZalD/TJBx5NBp
         yLcnmbgMPjPRdLXV3ZVaSBlfoXwWDvgyf6h8NDBm4eLCO5Hb0TcweRywOvItGYoNX1Ql
         +wp7ZgaCVRVfSOcyfytitk/mihRetforv00ZLedl8CExT059wNFerP9fblr44vi0NdM3
         oLFw==
X-Forwarded-Encrypted: i=1; AJvYcCUYokwGs9pGymJtk1wAZ0bewNRPA5OOS5Vao+FmKmV6jsGfk2Sh8Xqiqc5jM/MzuU+inonCROajFmfl2Wn04Kg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh0MWcVs1B7ovtS9WdFhTB6eEda+DbWujU6qTlZOd5L5gBNkVK
	5w6AWGnGpZECOe3L0xJfRLJjdcTWn0Y+TUPv4r5U8SYcL/omgIV2o9Ta9dVXgF+RPre7Pe5dA78
	8HEPjRiLOpgEYpRDM94EPQwp1xETT+luJiOJ45xET
X-Gm-Gg: ATEYQzwgDEtQANp50eYmOkbOnZBcDTrv31POeNP2cVjTAA+E5rGaRMW1GMBECU+r9y0
	r6Z0MW75VaHuOA2c/BvWP/R74X++Hqojen17xZ4ORIhCblt8Rqq0eOhjUP1yIZlvLjd87hSnxKw
	6CYigUMM0kVf4vm1SgVYWCrPwmqIEIjr3mi5q8KbDWOhcSSta+VmlnSIfEQVRptk3Uf9uArabYx
	mwgkzlGg3vTRyqM9mCFuoLGXJqbdpfgH/kiyw0WvmCuEg64A+DjJf+GgAtBMjTLijIKplJZrzmE
	FbNlMxg=
X-Received: by 2002:a05:622a:144c:b0:509:1d55:6368 with SMTP id
 d75a77b69052e-5091d556a83mr65534491cf.39.1773128468646; Tue, 10 Mar 2026
 00:41:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-tcp_rfc7323_retract_wnd_rfc-v3-0-4c7f96b1ec69@gmail.com>
 <20260309-tcp_rfc7323_retract_wnd_rfc-v3-1-4c7f96b1ec69@gmail.com>
 <CANn89i+38t+PpB5duS_-FX_=PwyCQaN2HYohocJBAvZ7Cd8-KQ@mail.gmail.com> <aa8S5pEbxXIG5oZQ@gandalf.schnuecks.de>
In-Reply-To: <aa8S5pEbxXIG5oZQ@gandalf.schnuecks.de>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 10 Mar 2026 08:40:57 +0100
X-Gm-Features: AaiRm51UmLT8Xio3yOAS3_qG-3b3ZlXXtISzZ5JqQOuDaTGLlV85GE2K7N5HJFc
Message-ID: <CANn89iJeVSfU3_Ub023j5mo5g=bTxTw_A+5-dPw59DaXFrLmDA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 1/6] tcp: implement RFC 7323 window retraction
 receiver requirements
To: Simon Baatz <gmbnomis@gmail.com>
Cc: Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, David Ahern <dsahern@kernel.org>, 
	Jon Maloy <jmaloy@redhat.com>, Jason Xing <kerneljasonxing@gmail.com>, mfreemon@cloudflare.com, 
	Shuah Khan <shuah@kernel.org>, Stefano Brivio <sbrivio@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, Mat Martineau <martineau@kernel.org>, 
	Geliang Tang <geliang@kernel.org>, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	mptcp@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2026 at 7:35=E2=80=AFPM Simon Baatz <gmbnomis@gmail.com> wro=
te:
>
> Hi Eric,
>
> thank you for the quick review.
>
> On Mon, Mar 09, 2026 at 10:22:39AM +0100, Eric Dumazet wrote:
> > On Mon, Mar 9, 2026 at 9:03???AM Simon Baatz via B4 Relay
> > <devnull+gmbnomis.gmail.com@kernel.org> wrote:
> > >
> > > From: Simon Baatz <gmbnomis@gmail.com>
> > >
> > > By default, the Linux TCP implementation does not shrink the
> > > advertised window (RFC 7323 calls this "window retraction") with the
> > > following exceptions:
> > >
> > > - When an incoming segment cannot be added due to the receive buffer
> > >   running out of memory. Since commit 8c670bdfa58e ("tcp: correct
> > >   handling of extreme memory squeeze") a zero window will be
> > >   advertised in this case. It turns out that reaching the required
> > >   memory pressure is easy when window scaling is in use. In the
> > >   simplest case, sending a sufficient number of segments smaller than
> > >   the scale factor to a receiver that does not read data is enough.
> > >
> > > - Commit b650d953cd39 ("tcp: enforce receive buffer memory limits by
> > >   allowing the tcp window to shrink") addressed the "eating memory"
> > >   problem by introducing a sysctl knob that allows shrinking the
> > >   window before running out of memory.
> > >
> > > However, RFC 7323 does not only state that shrinking the window is
> > > necessary in some cases, it also formulates requirements for TCP
> > > implementations when doing so (Section 2.4).
> > >
> > > This commit addresses the receiver-side requirements: After retractin=
g
> > > the window, the peer may have a snd_nxt that lies within a previously
> > > advertised window but is now beyond the retracted window. This means
> > > that all incoming segments (including pure ACKs) will be rejected
> > > until the application happens to read enough data to let the peer's
> > > snd_nxt be in window again (which may be never).
> > >
> > > To comply with RFC 7323, the receiver MUST honor any segment that
> > > would have been in window for any ACK sent by the receiver and, when
> > > window scaling is in effect, SHOULD track the maximum window sequence
> > > number it has advertised. This patch tracks that maximum window
> > > sequence number rcv_mwnd_seq throughout the connection and uses it in
> > > tcp_sequence() when deciding whether a segment is acceptable.
> > >
> > > rcv_mwnd_seq is updated together with rcv_wup and rcv_wnd in
> > > tcp_select_window(). If we count tcp_sequence() as fast path, it is
> > > read in the fast path. Therefore, rcv_mwnd_seq is put into rcv_wnd's
> > > cacheline group.
> > >
> > > The logic for handling received data in tcp_data_queue() is already
> > > sufficient and does not need to be updated.
> > >
> > > Signed-off-by: Simon Baatz <gmbnomis@gmail.com>
> >
> > ...
> >
> > > diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
> > > index f0ebcc7e287173be6198fd100130e7ba1a1dbf03..c86910d147f2394bf414d=
7691d8f90ed41c1b0e3 100644
> > > --- a/net/ipv4/tcp_output.c
> > > +++ b/net/ipv4/tcp_output.c
> > > @@ -293,6 +293,7 @@ static u16 tcp_select_window(struct sock *sk)
> > >                 tp->pred_flags =3D 0;
> > >                 tp->rcv_wnd =3D 0;
> > >                 tp->rcv_wup =3D tp->rcv_nxt;
> > > +               tcp_update_max_rcv_wnd_seq(tp);
> >
> > Presumably we do not need  tcp_update_max_rcv_wnd_seq() here ?
>
> When we don't update here and are forced to accept a beyond-window
> packet because the receive queue is empty, we can reach a state where
>
>  rcv_mwnd_seq < rcv_wup + rcv_wnd =3D=3D rcv_nxt
>
> I noticed this case when instrumenting the kernel and got violations
> of the invariant rcv_wup + rcv_wnd <=3D rcv_mwnd_seq.
>
> So, while not strictly needed (tcp_max_receive_window() would still
> be 0 as rcv_nxt > rcv_mwnd_seq), I opted to include the call here to
> keep rcv_mwnd_seq the actual maximum sequence number at all times.

Fair enough, thanks !

Reviewed-by: Eric Dumazet <edumazet@google.com>
