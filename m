Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C81031A542
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Mar 2026 03:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773460723; cv=pass; b=EMFSqYsjUkiZ/lpIWDWK5bA9UdmYQog5fa955TvczaGqoMHVVl5KvDYl/6/WuttOFxEbWENd00ZobQlTJg87uJJt+gTQAPA3s4Ph5SPOJEEFmCmNYJ5NZ12K91YEOQ37smH+Zsk6vgXO2Tx/kO+Oh/p1wp00pDaxwW84BG/rp0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773460723; c=relaxed/simple;
	bh=GcSrDIphKrI2//HgDsteTWBHlxHzmnPMjkm0w3xQYSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CeT56epdPdyvSgrbDhpydxLQ8Bi6t+HeRi8SU9ci0BYtLdqGhYsGlJgM4nmBdPOZD6VjVybTEWCwwab89UqM+ARblbvtmoUpfYN8PjDBFreCEZ6wZ9JyG8FYk5754wj4H//MrY9XH8GQEPeYrKvHSoePGHHN9DoBJU7Y+/H8a8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JTgqP31w; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JTgqP31w"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-50904a8f421so26231011cf.2
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 20:58:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773460720; cv=none;
        d=google.com; s=arc-20240605;
        b=Ktu4hEJpcts/UdTBLbN0TEFUPKfBfwZGpED6u007FgSutLbngtytkTVmX4y2cnMb6I
         VapwGjQOtLHHkCEGNR4zDsyr4CYqouzbree/zNSwcMgWzRFo53JTxQOYBwS+kzkM1GHu
         ONcTs0zpjJ+MHqe3fhaSKujlJ6w+0dcVzrRkEYSgu90sz+2zcUWa2NbSMvIGs1cIXOv8
         BZU3hmaGkHj8TWyI+DDrn321cyT78AG+RKxZbJBz3LCswEN9x82vypwZcdvP7OWYbLYu
         0l7lFnV24hbpAPUD5AGzRMjVQlAsVQl27jlMFpTjTalFNj+MLJG0YF7mpkA3eWZPTCKC
         TWWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OUQRi5vl7ger1FCyv6fx+Ok5M5QQpxd6KNaAJfpodDo=;
        fh=uouZR7xzMsXE08BNrXPEazI9b8DCg1lTHFCrUwTG/zg=;
        b=lrufr8deIIoTFQVArIIJG+PiDbztD9mRQdSMqw6iCiqnEGjp067VWf4g0tIojvAKhI
         JoiDQoDjGbBDXcS4erGzDbllYWsdaFwIA7voUmZ90eBU+v/noaR9KSjI/n2tuz0uvcOk
         VWz4QWSqQ6XqbqIsdVpk1OTpK82d38al7teEJRkGpEDk7W1EGDx4hIqQegUnGS991sTw
         DH0uexuvYMcDHPJK/CUmG2UZTOeZ/UTpbGZkRgIBlUF8Hkm/T/XBcFTuXrjK8wg7iuJ7
         JxRNu9U5X1olpfW4UIT0oT0krxy0DnjZ1gFD2w+7p54o6/8B27zjTJbb43CyHJcEHUz6
         F4wg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773460720; x=1774065520; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUQRi5vl7ger1FCyv6fx+Ok5M5QQpxd6KNaAJfpodDo=;
        b=JTgqP31wUjvJW6J0fs1XR8UDn/WHbk6yG/ugdEzIIaBtN6qVCOZt5ZlJkVL4ze4py7
         vdoUVii8IYXkGuHIJRJP3zprLeUjJom3ZiwoCW2qE9xAh1LW2zI4rLVFNYqFNONbCtm8
         Lbd1gzNK6JkyNFRW5BGgC5FaiCtCyGVmIGG5tayTBrZaFNcIj8sZsPza7i0ZUMTK1Oa5
         Wkn5cZWexZf2YXMryIyu+zoVJ99k/2oE4CGLyaHENCYN+3N1YOq+enZ830YT1Q5529dr
         UMCw/NccyvFo9IDZvLPNfrqa8UYIyd9T8DUfVWpPoYNSEH6GkaZdB0IvHOQjyKCxAWR+
         rxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773460720; x=1774065520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OUQRi5vl7ger1FCyv6fx+Ok5M5QQpxd6KNaAJfpodDo=;
        b=o5kqciPHve/xXzX1QoL4p5neOB27q2R59XcdOg/9J1sQ7IRh0eP2ilOUIUQo91V0+t
         +5jbMFpbDms6NynfjTCMZ1En9THggAbwuyKJbuH4pz/gyFrKAO7k4ku3r3UYMCfEm1EM
         7WAKwem039pSpdOWHKmBCcErmAaqr+XJrYB1j4Mcz6arbprBi5kc+jAK2zF9HXCkiGfE
         VCGci64bxeZgpUvUwGT0NASy9d/aRUbNbzvcdww8lja19o5fpzVEGWSVbYz9do/Rqr0j
         pmnB6K4ElzgOazhaSZzct4e4kialnP2vayLyVgVE0ymtDQAkQ7my9jFPrB2ThhgQJmXV
         Fb+w==
X-Forwarded-Encrypted: i=1; AJvYcCWyC/Vp1tt+O6dIKk0savv4P0MFaPU8WcPQ2pr4aIMPuGdqrwFqaoUqrRnALjuGedMNgq5fFOSiAXdWFaSJdLc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOFW/wCQswglK3vSeD23JR1RpmxPRBGuL9tVUVI/hGZvWpF+BR
	S+V2saS5xA+uOTAvxPIRoXQfYThlQ++aGU9cNnZEFxXzl4VqPW7yikq9BsgxEep/HtRs9idnrbH
	Ust5otzqrYta2ChvqWFhKOckPLVtRHKfsWgSIxfyy
X-Gm-Gg: ATEYQzwe5yfAkuAjzuZb27gzK513hYYPQ5xggkswFBtyhRtYcVu9PnPQ2wPobPbx9d4
	6AwIvktfgytXHykQWgoceNqCRl94A3Dyk3yL84cSrBxhlcrjW0htdd0R3z7uv1IF7xgBSzNQifk
	YRwtXLgLuTSg0sHCUfdgyRRt8rFPtU0QP6OeSDbEpqZ/OGKqp0jVrqfPjdxBGsN2u0VemWZ98v0
	G6QTclCrwombFUWSwRNi0xujz8twra1ulFE6Wa69CTYo2CgVviuaiktem3WRFJCGjnJyD7STGnu
	KS6UXg==
X-Received: by 2002:a05:622a:190c:b0:509:1a72:e332 with SMTP id
 d75a77b69052e-50957cb6dffmr75230961cf.16.1773460719740; Fri, 13 Mar 2026
 20:58:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-tcp_rfc7323_retract_wnd_rfc-v3-0-4c7f96b1ec69@gmail.com>
 <20260309-tcp_rfc7323_retract_wnd_rfc-v3-6-4c7f96b1ec69@gmail.com>
 <CANn89i+PypF1cK4mnp8L_eCG_z+3Aj6uxJoohm_=DwGfR1=4FA@mail.gmail.com> <abCkmiCSPkmxzECa@gandalf.schnuecks.de>
In-Reply-To: <abCkmiCSPkmxzECa@gandalf.schnuecks.de>
From: Eric Dumazet <edumazet@google.com>
Date: Sat, 14 Mar 2026 04:58:28 +0100
X-Gm-Features: AaiRm523CLjVQFOb0ZjB_qB2iBvlpRhw-o_SCZwCK7X6f1nBivXOPbA_-nmtd5w
Message-ID: <CANn89iKYxs644ardFFSKo8d0EXL_2A5eUQjWZ3yp9-Q4tVLKzQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 6/6] selftests/net: packetdrill: add tcp_rcv_neg_window.pkt
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

On Wed, Mar 11, 2026 at 12:09=E2=80=AFAM Simon Baatz <gmbnomis@gmail.com> w=
rote:
>
> Hi Eric,
>
> On Tue, Mar 10, 2026 at 09:54:58AM +0100, Eric Dumazet wrote:
> > On Mon, Mar 9, 2026 at 9:03???AM Simon Baatz via B4 Relay
> > <devnull+gmbnomis.gmail.com@kernel.org> wrote:
> > >
> > > From: Simon Baatz <gmbnomis@gmail.com>
> > >
> > > The test ensures we correctly apply the maximum advertised window lim=
it
> > > when rcv_nxt advances past rcv_mwnd_seq, so that the "usable window"
> > > is properly clamped to zero rather than becoming negative.
> > >
> > > Signed-off-by: Simon Baatz <gmbnomis@gmail.com>
> > > ---
> > >  .../net/packetdrill/tcp_rcv_neg_window.pkt         | 26 ++++++++++++=
++++++++++
> > >  1 file changed, 26 insertions(+)
> > >
> > > diff --git a/tools/testing/selftests/net/packetdrill/tcp_rcv_neg_wind=
ow.pkt b/tools/testing/selftests/net/packetdrill/tcp_rcv_neg_window.pkt
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..15a9b4938f16d175ac54f=
3fd192ed2b59b0a4399
> > > --- /dev/null
> > > +++ b/tools/testing/selftests/net/packetdrill/tcp_rcv_neg_window.pkt
> > > @@ -0,0 +1,26 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +
> > > +--mss=3D1000
> > > +
> > > +`./defaults.sh`
> > > +
> > > +// Establish a connection.
> > > +   +0 socket(..., SOCK_STREAM, IPPROTO_TCP) =3D 3
> > > +   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) =3D 0
> > > +   +0 setsockopt(3, SOL_SOCKET, SO_RCVBUF, [20000], 4) =3D 0
> > > +   +0 bind(3, ..., ...) =3D 0
> > > +   +0 listen(3, 1) =3D 0
> > > +
> > > +   +0 < S 0:0(0) win 32792 <mss 1000,nop,wscale 7>
> > > +   +0 > S. 0:0(0) ack 1 win 18980 <mss 1460,nop,wscale 0>
> > > +  +.1 < . 1:1(0) ack 1 win 257
> > > +
> > > +   +0 accept(3, ..., ...) =3D 4
> > > +
> > > +// A too big packet is accepted if the receive queue is empty
> > > +   +0 < P. 1:20001(20000) ack 1 win 257
> >
> > We do not see the answer, it seems this test is not complete ?
>
> Actually we do not want to see an answer.  The packet won't trigger
> an immediate ACK (it is larger than the advertised window, but does
> not cause immediate memory pressure).
>
> When we then send a RST before the delayed ACK would be generated:
>
> > > +// Send a RST immediately so that there is no rcv_wup/rcv_mwnd_seq u=
pdate yet
> > > +   +0 < R. 20001:20001(0) ack 1 win 257
>
> We are in a state where rcv_wup, rcv_wnd, and rcv_mwnd_seq have not
> been updated yet, but we must still accept the RST
> (rcv_nxt =3D=3D 20001 > rcv_mwnd_seq, tcp_max_receive_window() =3D=3D 0)
>
> > > +
> > > +  +.1 %{ assert tcpi_state =3D=3D TCP_CLOSE, tcpi_state }%
>
> And we verify that we accepted the RST here.
>
> Given how subtle this sequence is, and considering the limited value
> of this test, I am also fine with dropping it if it is too fragile or
> confusing.

Sorry I missed your answer.

Ok then please use :

// A too big packet is accepted if the receive queue is empty
   +0 < P. 1:20001(20000) ack 1 win 257
   +0 %{ assert tcpi_bytes_received =3D=3D 20000, tcpi_bytes_received;
assert tcpi_bytes_acked =3D=3D 0, tcpi_bytes_acked }%

// Send a RST immediately so that there is no rcv_wup/rcv_mwnd_seq update y=
et
   +0 < R. 20001:20001(0) ack 1 win 257

  +.1 %{ assert tcpi_state =3D=3D TCP_CLOSE, tcpi_state }%



Then add my
Reviewed-by: Eric Dumazet <edumazet@google.com>
