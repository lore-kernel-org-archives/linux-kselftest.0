Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875EA331A7A
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 17:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771868325; cv=pass; b=mrke0efqHjUf52ivS115a2t6p853xgYd3Se7S4W/vFl3Fa7AneqtDr6IReHqVq2yzGX6rUDaUBYVR6K5WbPHi/C5j7kowXzGsRvxYAkCThZYt0nc2HVx33H3LpVGEv1sF2FwFaCEhoiTHOc28nZD9z35sqG5Jj4/T7wlaYJ5CCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771868325; c=relaxed/simple;
	bh=FXB8L6N1RShhllJFsmyh8MvpwbOyuUzjP20hAMAjN/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RBua49+hLUacpFhVCVnFg7cQCWkeuo3F+REOXNySAltRSxfATPZQMuB9PuAT2zpUoEPjQa9nluxFeasrEoBXHHTR51+pgbaHy0Qsv7sKxRjN4Q2T2ml/6VvCgSDym46DOW+djBABoREl/H0mECY7UAOQ2xdpSMHcMw71Dnme5es=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gnvvzwdN; arc=pass smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gnvvzwdN"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8cb3fd71badso435943085a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 09:38:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771868323; cv=none;
        d=google.com; s=arc-20240605;
        b=IrnYTFnZ3A8cOVMpWIypF/cuEsKnZT2IrN6jWLVl3ckrQ9/PKtPPeghJpeFiin4LDe
         y/SejqbCAkqPgCvaza+38z57ea2zIulFUrXUw4FA7VaFcFeQur6dU4bgat4vE8rqojBT
         9BnbGxGNybgKXw+c7sn6tPfAJhA8YY98Bw4G65aMldNykiHfzDmmRZeTPm+oMeRU60KY
         p2jSN/l8ADdox3+qiVyz5mCyGwYLqaNh+8tXyJ+5iEKaQtPRbvKVhZBJgmCjqQ3yvCY0
         Elam1U7aQ08VnxBrfheLlc2yCmX4f1QQetPhbz9qQP5+wrD3yUoUZnYGNlBHhNQUZ9J5
         owow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lxV8mPIjjwPE+1KEA8wKGyGIPdfmeyRv/k8v0nQQx+U=;
        fh=gvM4XiHMcS4eEXY46rNlhSCZNQ4xcXoJtZSRVAfhBjk=;
        b=jKQb2+sB3ohq9bkkHooyOVTWzH7cFJcnukvdmvq8jrojyOmsoQ/3wYbkdQLtAYXL+M
         kemTdFKrL5WQO019E7korg1E+NCssY0ZP+LUnvJs3CMAqYRRzzj5ihKw+8DxTkHYGvrB
         NNtxvjz1QsvWhxLE+9NnoeLlTjjxHIRgoT2df80lyPnAqCXr3RgtpO2KdjY2TmxeYuvp
         RHd3wPr8ZzSq4OI7sSXWrEQ6VbqxYYjllcjXRhJh3dpIPflIBCUrhACqppWMHheqTBN5
         oOPyi5RpHH84VRFQqZExts2jinONZ+ho3GOSPZMvxSrpo/sa9UyLiZdvzW52RuuqU0rS
         b4Mg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771868323; x=1772473123; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lxV8mPIjjwPE+1KEA8wKGyGIPdfmeyRv/k8v0nQQx+U=;
        b=gnvvzwdNkmSa6r7WiSAhCB9VwNjeztRKEITPu7QClwmCbjGm0YEsIMLVOikE5xHU5p
         X7fZA3TsI2BCtzKYoZtGD9CxdbpXsd/PN6rLhkYDYae0FWz0fKc72O+7syaIF/LWejcK
         4cgY8Kn2kRAfwSf2gevOnH//DdIj+2z3t1pSv2h/uwTP0tJGTbGw0FI+0bIEapYV5VX4
         TP/F69pcEQHADHXua2grLRQXj3191+kov99rejObWDfb9V3e7uriTn/mHfv9XpHRYGRx
         +92niAWfii03coDneSw4iEs0zFZRnKPdTk3Ed+2mLRHgCxWPttYS1anB8hQJoswRDH3L
         Frvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771868323; x=1772473123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lxV8mPIjjwPE+1KEA8wKGyGIPdfmeyRv/k8v0nQQx+U=;
        b=tLZynL45jXq17JWj304SC+s8kiS4sgGaakUnGOSsIF+erSd4+HM7OaMnpyWf3fh6Qe
         uNhnB8/0qAOBWBof8Pdl08vGt+Noh1v1xxLJ33iHhnuLdc67lcH53bQudOoLQpaL4YXl
         CZTtHXaAyLP0M9+G02/k8PckwJmctBs9DsWfo8BSZCqNxp9ByLIVgcZ/hpytyEC69p36
         YiXVzr7MY6Ioua7K0DCT00adDxlXUEzr19hV6ggAqCACKNqti3Y6Ux1JoV8lchDS+Nss
         6F/6G9JYUYHel6J9crbgkxFfUXw6MvjtNftYz8FCZFdP61El6ypbWbwEpI4bed0gV62q
         A3ng==
X-Forwarded-Encrypted: i=1; AJvYcCV3LrSiPLiD2Qa9gwddHQsqZFnnNoLZV8YOyDcSQhgYXBCI4K0zIoilJJ1UWSCvAwz5S/TnqriWOuxOscxDUXk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvk1LspDDM7xySpwaAzPbayA01Msjq/8/7epjuBuuOmid/yGl1
	sN/oZDwPzQ16ALtRFDomPXngCGOcxys1PCshbMkhrxBy+FdsvAkrBRADVxsRVj6v/fOUu8bgxVi
	i7g35CqC/jzCz3hQ5wz7S7ZD7QLmFMX3VnN1q2S2l
X-Gm-Gg: AZuq6aKqIbkaQ4d0KEtUS9fXPqlpKqJmsRkhmgAjV8I6EkfTYOAYLU3XXo5m0rHWwXf
	JZtD4VuY+8d76Vjeg1fnCN+lMTgUwcHzUWl7/CwBo7Ngb3CX/SgTuiU156dBofF7mRgPjVBs7vJ
	iLmKtUcr6G1ySoiyecrxm4dxZYrl+BfHetySqZYTb1AJOUoiDd0lyTLvWiV4td0z27TyeihIflY
	rVV2dplanJmiw0vSO7R3w5E5u//veDXUgBJqqHRFso++R8xV3HcE20UhMsLcVA6gpg98xBcQC1h
	FBq5jhA=
X-Received: by 2002:ac8:7d8e:0:b0:506:a320:e45b with SMTP id
 d75a77b69052e-5070bc6c30fmr130357461cf.39.1771868322989; Mon, 23 Feb 2026
 09:38:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260222-fix_zero_wnd_fin-v1-0-5f4034952f3c@gmail.com>
 <20260222-fix_zero_wnd_fin-v1-1-5f4034952f3c@gmail.com> <CANn89iK5Kk2D-zMiw_2syb9OdmkKdgAA7aGfi8QNZ9XR4=CfvA@mail.gmail.com>
 <CANn89iKBjfaoWaUh6Ar2Lj-MJODywLpHzbQif=aa8q387qutZA@mail.gmail.com> <aZyLdQCaib1d4qDU@gandalf.schnuecks.de>
In-Reply-To: <aZyLdQCaib1d4qDU@gandalf.schnuecks.de>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 23 Feb 2026 18:38:31 +0100
X-Gm-Features: AaiRm52lmkQo_VYru9RAU9egFIOLOWNaqq_JEsXTUaSy5ElTYgirkWmuRPCRpgc
Message-ID: <CANn89i+Em+e8Fb_QHwoRdOc6bYGNOsJqVby3jG+bO+672hDfxg@mail.gmail.com>
Subject: Re: [PATCH net 1/2] tcp: re-enable acceptance of FIN packets when
 RWIN is 0
To: Simon Baatz <gmbnomis@gmail.com>
Cc: Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 6:16=E2=80=AFPM Simon Baatz <gmbnomis@gmail.com> wr=
ote:
>
> Hi Eric,
>
> On Mon, Feb 23, 2026 at 09:36:38AM +0100, Eric Dumazet wrote:
> > On Mon, Feb 23, 2026 at 9:01???AM Eric Dumazet <edumazet@google.com> wr=
ote:
> > ...
> > > >
> > > > Fixes: 9ca48d616ed7 ("tcp: do not accept packets beyond window")
> > >
> > > OK, but this commit is fine ? It seems the issue is coming from buggy=
 peers ?
>
> That "Fixes" tag is a technicality, I did not want to imply that the
> commit is broken: 9ca48d616ed7 (which is RFC compliant) turns the
> workaround (which isn't RFC compliant) 2bd99aef1b19 ("tcp:
> accept bare FIN packets under memory pressure") into dead code.
>
> If we still need that workaround, technically, this is a regression
> caused by 9ca48d616ed7.  If not, I am perfectly happy to propose a
> commit that removes the dead code.
>
> > > Eventually the receive queue would be drained by the application, the
> > > peer would retransmit
> > > this FIN, and it would be accepted.
>
> If I understand the problem correctly, the workaround was introduced
> to break a FIN/ACK loop because the broken peer (macOS) did not use
> exponential backoff in that scenario.  So yes, it would be accepted,
> but until then we and the peer would ping-pong FIN/ACKs.
>
> But as said, if we don't need the workaround I can submit a patch to
> remove it.
>
> > ...
> > > > +       reason =3D tcp_sequence(sk, TCP_SKB_CB(skb)->seq,
> > > > +                             TCP_SKB_CB(skb)->end_seq - th->fin);
> > >
> > > I don't think this is the right fix. Basically it says that FIN do no=
t
> > > count, but TCP RFC says otherwise.
>
> We can be more specific and only allow that if we have a zero window.
> (I thought I would not hurt much to accept that FIN which does not
> take up real space)
>
> > > It also adds code in TCP fast path.
>
> Hmm, the call site for tcp_validate_incoming() in
> tcp_rcv_established() is:
>
>         /*
>          *      Standard slow path.
>          */
> validate:
>         if (!tcp_validate_incoming(sk, skb, th, 1))
>                 return;
>
>
> Am I missing something?

The 'slow path' comment does not mean everything from this can be really sl=
ow.
'slow path' is quite often used, header prediction is less and less a thing=
.

>
>
> > We can keep fast path unchanged with this variant.
> >
> > diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> > index e7b41abb82aad33d8cab4fcfa989cc4771149b41..156c92450f3ed00357aff2e=
f3e586b83f3cecb5e
> > 100644
> > --- a/net/ipv4/tcp_input.c
> > +++ b/net/ipv4/tcp_input.c
> > @@ -4858,15 +4858,24 @@ static enum skb_drop_reason
> > tcp_disordered_ack_check(const struct sock *sk,
> >   */
> >
> >  static enum skb_drop_reason tcp_sequence(const struct sock *sk,
> > -                                        u32 seq, u32 end_seq)
> > +                                        u32 seq, u32 end_seq,
> > +                                        const struct tcphdr *th)
> >  {
> >         const struct tcp_sock *tp =3D tcp_sk(sk);
> > +       u32 seq_limit;
> >
> >         if (before(end_seq, tp->rcv_wup))
> >                 return SKB_DROP_REASON_TCP_OLD_SEQUENCE;
> >
> > -       if (after(end_seq, tp->rcv_nxt + tcp_receive_window(tp))) {
> > -               if (after(seq, tp->rcv_nxt + tcp_receive_window(tp)))
> > +       seq_limit =3D tp->rcv_nxt + tcp_receive_window(tp);
> > +       if (unlikely(after(end_seq, seq_limit))) {
> > +               /* Some stacks are known to handle FIN incorrectly;
> > allow the FIN
> > +                * to extend beyond the window and check it in detail l=
ater.
> > +                */
> > +               if (!after(end_seq - th->fin, seq_limit))
> > +                       return SKB_NOT_DROPPED_YET;
> > +
> > +               if (after(seq, seq_limit))
> >                         return SKB_DROP_REASON_TCP_INVALID_SEQUENCE;
> >
> >                 /* Only accept this packet if receive queue is empty. *=
/
> > @@ -6379,7 +6388,8 @@ static bool tcp_validate_incoming(struct sock
> > *sk, struct sk_buff *skb,
> >
> >  step1:
> >         /* Step 1: check sequence number */
> > -       reason =3D tcp_sequence(sk, TCP_SKB_CB(skb)->seq,
> > TCP_SKB_CB(skb)->end_seq);
> > +       reason =3D tcp_sequence(sk, TCP_SKB_CB(skb)->seq,
> > +                             TCP_SKB_CB(skb)->end_seq, th);
> >         if (reason) {
> >                 /* RFC793, page 37: "In all states except SYN-SENT, all=
 reset
> >                  * (RST) segments are validated by checking their SEQ-f=
ields."
>
> Sure, I can do that.  Do you want me to add the
> tcp_receive_window(tp) =3D=3D 0 check to narrow it down further?

Not sure what you mean.

>
> (And a dumb question: As you are the author of that code, how do I
> attribute that commit when submitting a v2?)

No worries, this is part of the review process, I give you permission to
be the author, even if this happens to be something I wrote.
