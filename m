Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE67835B621
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 21:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773697900; cv=none; b=LRKuQSIIR7t2uJ1+Qkyz0OEnsMcWy148m5FSybltpSrytzJLUKzmTNM9A6NbSJqj1Dz/PGnCa9gfHZ8FCcgT/zWAlo+k9Se5XRvCvQDIikGT9D9rLhVnLm1q+neWKjhAN51k4DqwK//yYGj2T5AHTMcTHk2FTMlFQowLYbQHbeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773697900; c=relaxed/simple;
	bh=22FQQziovkybfpoEgGEar4XKtg0Elmc86WdBJzgy3AA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nIzPvlxc8dJPg6a1YInEDQSFsJko/2QQaMWwF4iLrlta5BM9G/fjTIU7olmNJwn1Gcgvl01aAE0VinENwTC+la4bavTlt7JQo4AhSUB6brpMfw0S8DWYvEM2rfgfTQs+oMabcbCnpXnx/RZOea/hRiEr4JnDUzZiRsYx89XCYYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RD0AnySI; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RD0AnySI"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48538c5956bso1424355e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 14:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773697897; x=1774302697; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sj1cmcN77XR2dLCOZTKXheeb7KLeaY6rrHsbkVnSpso=;
        b=RD0AnySIyW2JLlyg7kNXl182x2dz/yCOKiV8rMCNirdvIxNN//NbP5veoW6pRZAjMc
         VMNNx0e+j9nYXfS29C/+e9D96vDDDn/yiOIH1EQfXQ0kYdIHkEA54StylbnMud08dKf3
         hfWsoCeGFIiVmAJsn4K/BA3NIBfmYWNZEuvdYRk+AmefdaoU9dlTMatvzUxBHxTAEWG6
         tx9oxN/7gvvwIaQ6sRwrWvGSp+OxO6IzG5fV0sgGZuV2Fvw4OzYovZhTvKRvFEOkjfKT
         f184BTCR1W7vw32vW7CGApplGLqpd/1aU9rIiG17+SvxQ4//R7iJZRXBRpwA530ZOiSa
         HIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773697897; x=1774302697;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sj1cmcN77XR2dLCOZTKXheeb7KLeaY6rrHsbkVnSpso=;
        b=d+Fj9Io5+Azto/OAshgpxWkgYRCvBZLsXRigwEWh5PMOyzwa6G8+af6a/klCmx/ld9
         3PDsPfpBejm+THTc8MAt1KwLmg3BVPvloArY6j3Vqwdz2tuLKa+m3VBu2q/9bF1BAPeN
         V3jguGuvWRVwE+iuxDhCQV8+t/KbMlB8IGh7cGSiQy0GElab4Vw1E5Vl3SeaJNu0gSAa
         VLGHtL7EubGcZdSqTl5mVvJaCapwv61/rbgU+7eA1w6s6K9qG9Mj/XrK3YxcdH74NDdV
         AvtjYAm094oBFs1Nn7/EzTRvpWblPwrKPfNicnwrSU6jknicFJl51xn0KHvcdAj4cFZc
         5Vgw==
X-Forwarded-Encrypted: i=1; AJvYcCV4TiyJH54VRDwbu26//IhSun9tNEHznOhYGSsLbJJWQ6d2lrcvSv9I/49H+NCvxT1pBNISEVgEUZ1k2fEriY0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJxRBJ+iKjY45ExL9Yzr2XLa1ZJnsUaLOyr7Gt8QL9SrXBVmZ1
	zEnDqZDsCL7FbTUggtZtwYurmr0LDTsDFnGw9BRgmOTbw3zgroXW+3jd
X-Gm-Gg: ATEYQzw51VGXeuQTXp4D7Hhtoa1qOls4XMtBC5wdVGaQHGDraicpsgaHro636znGvN+
	mm8uE6tG7YBaL7GgedqeNHPE6W9cx3by1XszTZMBXAM2BhEMj2pNvNjlbcvRRQp/I+WvcAc2bza
	WSZgh3TQ7natr18fQnYB5w51hKAspMVRg8mmatiwP2flujNmAWSKNmzmLotjjG64WyK3i9ej07/
	AYB+ynFpJylFxmj1uK/+J1sIjCggfsvDIvmrE32BT9eT+qXj5rV6lnhIAQovT4MgMOCSzBVuXa6
	q+xhdF5xRBzz2a1L9g3PV9tllawsiXh9yTzcltTKeu5OqlKGvp5aAdwFjIYqnVSZZARMRk0pDDd
	homyy8z8BvtnqmxR7h7XXOss1TWcpTpfuhbprlV9DDpGF7iHpE+rTLefxQhrMlropTdh/8o7CA5
	rfaEbFTvayN/048BcnOsVyhUz8UQzkhXmDffVD0kEgiyf/3yx/7ec8Y/XLeD1O3AoBuLH9ObfQh
	zVwwnbJ1MhO5tFjVh1fKEg=
X-Received: by 2002:a05:600c:3e1a:b0:485:3428:774c with SMTP id 5b1f17b1804b1-4856eab522emr17811775e9.4.1773697896899;
        Mon, 16 Mar 2026 14:51:36 -0700 (PDT)
Received: from gandalf.schnuecks.de (p200300c14f1996009e6b00fffe39b8a7.dip0.t-ipconnect.de. [2003:c1:4f19:9600:9e6b:ff:fe39:b8a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856eae3037sm20082795e9.11.2026.03.16.14.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 14:51:36 -0700 (PDT)
Received: by gandalf.schnuecks.de (Postfix, from userid 500)
	id 903633040F3A; Mon, 16 Mar 2026 22:51:35 +0100 (CET)
Date: Mon, 16 Mar 2026 22:51:35 +0100
From: Simon Baatz <gmbnomis@gmail.com>
To: Eric Dumazet <edumazet@google.com>
Cc: Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	David Ahern <dsahern@kernel.org>, Jon Maloy <jmaloy@redhat.com>,
	Jason Xing <kerneljasonxing@gmail.com>, mfreemon@cloudflare.com,
	Shuah Khan <shuah@kernel.org>, Stefano Brivio <sbrivio@redhat.com>,
	Matthieu Baerts <matttbe@kernel.org>,
	Mat Martineau <martineau@kernel.org>,
	Geliang Tang <geliang@kernel.org>, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, mptcp@lists.linux.dev
Subject: Re: [PATCH net-next v3 6/6] selftests/net: packetdrill: add
 tcp_rcv_neg_window.pkt
Message-ID: <abh7Z5GEhEzty18d@gandalf.schnuecks.de>
References: <20260309-tcp_rfc7323_retract_wnd_rfc-v3-0-4c7f96b1ec69@gmail.com>
 <20260309-tcp_rfc7323_retract_wnd_rfc-v3-6-4c7f96b1ec69@gmail.com>
 <CANn89i+PypF1cK4mnp8L_eCG_z+3Aj6uxJoohm_=DwGfR1=4FA@mail.gmail.com>
 <abCkmiCSPkmxzECa@gandalf.schnuecks.de>
 <CANn89iKYxs644ardFFSKo8d0EXL_2A5eUQjWZ3yp9-Q4tVLKzQ@mail.gmail.com>
 <abWVuS1XJaKrndJw@gandalf.schnuecks.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abWVuS1XJaKrndJw@gandalf.schnuecks.de>

On Sat, Mar 14, 2026 at 06:07:05PM +0100, Simon Baatz wrote:
> Hi Eric,
> 
> On Sat, Mar 14, 2026 at 04:58:28AM +0100, Eric Dumazet wrote:
> > On Wed, Mar 11, 2026 at 12:09???AM Simon Baatz <gmbnomis@gmail.com> wrote:
> > >
> > > Hi Eric,
> > >
> > > On Tue, Mar 10, 2026 at 09:54:58AM +0100, Eric Dumazet wrote:
> > > > On Mon, Mar 9, 2026 at 9:03???AM Simon Baatz via B4 Relay
> > > > <devnull+gmbnomis.gmail.com@kernel.org> wrote:
> > > > >
> > > > > From: Simon Baatz <gmbnomis@gmail.com>
> > > > >
> > > > > The test ensures we correctly apply the maximum advertised window limit
> > > > > when rcv_nxt advances past rcv_mwnd_seq, so that the "usable window"
> > > > > is properly clamped to zero rather than becoming negative.
> > > > >
> > > > > Signed-off-by: Simon Baatz <gmbnomis@gmail.com>
> > > > > ---
> > > > >  .../net/packetdrill/tcp_rcv_neg_window.pkt         | 26 ++++++++++++++++++++++
> > > > >  1 file changed, 26 insertions(+)
> > > > >
> > > > > diff --git a/tools/testing/selftests/net/packetdrill/tcp_rcv_neg_window.pkt b/tools/testing/selftests/net/packetdrill/tcp_rcv_neg_window.pkt
> > > > > new file mode 100644
> > > > > index 0000000000000000000000000000000000000000..15a9b4938f16d175ac54f3fd192ed2b59b0a4399
> > > > > --- /dev/null
> > > > > +++ b/tools/testing/selftests/net/packetdrill/tcp_rcv_neg_window.pkt
> > > > > @@ -0,0 +1,26 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > +
> > > > > +--mss=1000
> > > > > +
> > > > > +`./defaults.sh`
> > > > > +
> > > > > +// Establish a connection.
> > > > > +   +0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
> > > > > +   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
> > > > > +   +0 setsockopt(3, SOL_SOCKET, SO_RCVBUF, [20000], 4) = 0
> > > > > +   +0 bind(3, ..., ...) = 0
> > > > > +   +0 listen(3, 1) = 0
> > > > > +
> > > > > +   +0 < S 0:0(0) win 32792 <mss 1000,nop,wscale 7>
> > > > > +   +0 > S. 0:0(0) ack 1 win 18980 <mss 1460,nop,wscale 0>
> > > > > +  +.1 < . 1:1(0) ack 1 win 257
> > > > > +
> > > > > +   +0 accept(3, ..., ...) = 4
> > > > > +
> > > > > +// A too big packet is accepted if the receive queue is empty
> > > > > +   +0 < P. 1:20001(20000) ack 1 win 257
> > > >
> > > > We do not see the answer, it seems this test is not complete ?
> > >
> > > Actually we do not want to see an answer.  The packet won't trigger
> > > an immediate ACK (it is larger than the advertised window, but does
> > > not cause immediate memory pressure).
> > >
> > > When we then send a RST before the delayed ACK would be generated:
> > >
> > > > > +// Send a RST immediately so that there is no rcv_wup/rcv_mwnd_seq update yet
> > > > > +   +0 < R. 20001:20001(0) ack 1 win 257
> > >
> > > We are in a state where rcv_wup, rcv_wnd, and rcv_mwnd_seq have not
> > > been updated yet, but we must still accept the RST
> > > (rcv_nxt == 20001 > rcv_mwnd_seq, tcp_max_receive_window() == 0)
> > >
> > > > > +
> > > > > +  +.1 %{ assert tcpi_state == TCP_CLOSE, tcpi_state }%
> > >
> > > And we verify that we accepted the RST here.
> > >
> > > Given how subtle this sequence is, and considering the limited value
> > > of this test, I am also fine with dropping it if it is too fragile or
> > > confusing.
> > 
> > Sorry I missed your answer.
> > 
> > Ok then please use :
> > 
> > // A too big packet is accepted if the receive queue is empty
> >    +0 < P. 1:20001(20000) ack 1 win 257
> >    +0 %{ assert tcpi_bytes_received == 20000, tcpi_bytes_received;
> > assert tcpi_bytes_acked == 0, tcpi_bytes_acked }%
> 
> Unfortunately, tcpi_bytes_acked is the TX direction, it will always
> be 0 here.
> 
> Instead, we can still test that the oversized packet is accepted and
> indirectly verify that no immediate ACK is sent by eliciting and
> checking a RST:
> 
> // A too big packet is accepted if the receive queue is empty, but does not trigger
> // an immediate ACK.
>    +0 < P. 1:20001(20000) ack 1 win 257
>    +0 %{ assert tcpi_bytes_received == 20000, tcpi_bytes_received; }%
> 
> // Send a RST immediately so that there is no rcv_wup/rcv_mwnd_seq update yet
>    +0 < R. 20001:20001(0) ack 1 win 257
> 
> // Verify that the RST was accepted. Indirectly this also verifies that no immediate
> // ACK was sent for the data packet above.
>    +0 < . 20001:20001(0) ack 1 win 257
>     * > R 1:1(0)
> 
> As the series is merged now (thank you!), I will send this
> separately, as suggested.

Patch is at: https://lore.kernel.org/netdev/20260316-improve_tcp_neg_usable_wnd_test-v1-1-f16d5e365107@gmail.com/

-- 
Simon Baatz <gmbnomis@gmail.com>
