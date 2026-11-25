Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.80.4.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795576614;
	b=gfOjPFvNu7gvE58X/7SNizGQ8IZMNNTXmZxksLSjqH9HVRFqCR2Oqu2G8FF8G1Z6J2H1
	 N94/zE4W2be5yvl1mYyUVxs2jTvxA+xROY4oXOYJPfQt1nN3bHiwG/ZA5cj4gFCdjDHJv
	 MxJJNi3mYGCj/Cmj9xfg0BnSqQTelEpGQeXcFZmOz8dKBDoZv9O/F55jQ972AmvCRbOvI
	 7tlhEuC8PJgoj43vidPu9TDc2FaOx1PdjtcdjGTaiH6hSQG5cWeRESPW64dGk14kGvwEo
	 3G6x/y4H628CHmNnuIIJI42o3TQLooDg3cCMNL6XNojWmA7RDlg2S6dnY110dLso+nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795576614;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:Date:
	 From:To:Cc:Subject:Message-Id:In-Reply-To:References:X-Mailer:
	 Mime-Version:Content-Type:Content-Transfer-Encoding:X-Virus-Scanned:
	 X-Virus-Status;
	bh=hxTBbzJHEKVwGJg01FIKFcQnVDEoJyS+/2z4anXy+k4=;
	b=mkFkgyWQmYB4L/1thZS3Lumtbh8W6IykFuu95ZAhZ96r8IDhPbrpazU7wuar7WSQP0Gh
	 pAhNF3zMIkdhl00clLsYvUfHdaXFewSJdx3MoH0tB4XCnyGMuhwMKUMnQlfL6z93VxGF2
	 G97FzESsIcqzI4wmzIdow7Q+T4TFouMFySAES8dZP0qwznIHkPHLOYSFM5RCeJMPFhdL+
	 fOw/5SgrB48MUIycBTO1S9mUi9eOljVH30eUB+DxKCOS87HrsGYB/hJEEsleuq6FSHE83
	 EiHRTh8MKsgvpTLzmA7LTocwvuME+rNxhpBSznam8sfJskm+dj88yJai/efM9VnFzgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniroma2.it;
	spf=pass smtp.mailfrom=uniroma2.it;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=ed25519-sha256 header.s=ed201904 header.b=T4hnDlVL;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=rsa-sha256 header.s=rsa201904 header.b="NXD/C3hd";
	arc=none smtp.remote-ip=160.80.4.34
Received: from smtp.uniroma2.it (smtp-2015.uniroma2.it [160.80.4.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C984B606A31E;
	Wed, 25 Nov 2026 03:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C984B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=ed25519-sha256 header.s=ed201904 header.b=T4hnDlVL;
	dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.a=rsa-sha256 header.s=rsa201904 header.b=NXD/C3hd
Received: from smtpauth-2019-1.uniroma2.it (smtpauth.uniroma2.it [160.80.5.46])
	by smtp-2015.uniroma2.it (8.14.4/8.14.4/Debian-8) with ESMTP id 6AP3GJa3010051;
	Wed, 25 Nov 2026 04:16:24 +0100
Received: from lubuntu-18.04 (unknown [160.80.103.126])
	by smtpauth-2019-1.uniroma2.it (Postfix) with ESMTPSA id 61AFC1227EB;
	Wed, 25 Nov 2026 04:16:15 +0100 (CET)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=uniroma2.it;
	s=ed201904; t=1795576576; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hxTBbzJHEKVwGJg01FIKFcQnVDEoJyS+/2z4anXy+k4=;
	b=T4hnDlVLZAFbc4OfNSryAiBmEeE35ytLR9djf2f+4qF6umz5McQXVUl6uf9d+2DLAEIr/z
	tujVoWEaMsueWlDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniroma2.it; s=rsa201904;
	t=1795576576; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hxTBbzJHEKVwGJg01FIKFcQnVDEoJyS+/2z4anXy+k4=;
	b=NXD/C3hdb01sILs31a0MHe/SgTTq8VHpY9h/hiPjAKb6cQiUL2tSDUzhPr40SHeXAHasql
	qqsW3rDZi116hZY7dksjKsUq6KNWiLbrSrmievFod9b21TXpYoDIHrWl713UWKoPPAe/PL
	yXmHOCHuSLXGJ7CSv3AOZzqh/VfcPQroxMCKWhB/J3NPWRbNwQOOGK7Qu5nbBfLhKgVxs5
	Bu6i1j/f68d6ioiGj+Qzj+D3+HuEKHc6xcj/NU/Q6DcHStma5ztn06HYqgfS6jdEEy9VlP
	T8+7WnS06vxFRBgMbc1Pc4ULMaromYa82QrvY1FQHUhyCjgfdYDV9pDmtuza3w==
Date: Wed, 25 Nov 2026 04:16:14 +0100
From: Andrea Mayer <andrea.mayer@uniroma2.it>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Shuah Khan
 <shuah@kernel.org>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Hangbin Liu <liuhangbin@kylinos.cn>,
        Stefano Salsano <stefano.salsano@uniroma2.it>,
        Justin Iurman
 <justin.iurman@gmail.com>,
        Andrea Mayer <andrea@common-net.org>,
        Andrea
 Mayer <andrea.mayer@uniroma2.it>
Subject: Re: [PATCH net-next v4 5/5] selftests: seg6: add PSP flavor testing
 for SRv6 End.X
Message-Id: <20261125041614.98d96a37cd5a5e082729cc62@uniroma2.it>
In-Reply-To: <20261124054729.GA14932@Liu-laptop>
References: <20261119-srv6_flavors_endx-v4-0-284cdb484eee@kylinos.cn>
 <20261119-srv6_flavors_endx-v4-5-284cdb484eee@kylinos.cn>
 <20261123050952.21dc46abdf5fe4fa235bb68d@uniroma2.it>
 <4717cab46b8eec796eb97799240cd6ab92d8c1ed@linux.dev>
 <20261124054729.GA14932@Liu-laptop>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.100.0 at smtp-2015
X-Virus-Status: Clean

On Tue, 24 Nov 2026 13:47:29 +0800
Hangbin Liu <hangbin.liu@linux.dev> wrote:

Hi Hangbin,
thanks for looking further into it.

> [snip]
>
>  (i.a) hs-1 -> hs-2: on the packets with DA=fcff:3::400a, rt-1 inserts the
>        extra SRH with SID List=fcff:4::e,fcff:3::400a, and rt-4 consumes it.
>        Path: hs-1 -> rt-1 [ -> rt-4 ] -> rt-3 -> rt-4 -> rt-2 -> hs-2
>  (i.b) hs-2 -> hs-1: on the packets with DA=fcff:1::0af1, rt-2 inserts the
>        extra SRH with SID List=fcff:3::e,fcff:1::0af1, and rt-3 consumes it.
>        Path: hs-2 -> rt-2 [ -> rt-3 ] -> rt-1 -> hs-1
>  (i.c) hs-1 -> hs-2: on the packets with DA=fcbb:0:34a9::, rt-1 inserts the
>        extra SRH with SID List=fcff:4::e,fcbb:0:34a9::, and rt-4 consumes it.
>        Path: hs-1 -> rt-1 [ -> rt-4 ] -> rt-3 -> rt-4 -> rt-2 -> hs-2
>  (i.d) hs-2 -> hs-1: on the packets with DA=fcbb:0:43a9:31a9:10a9::, rt-2
>        inserts the extra SRH with SID List=fcff:3::e,fcbb:0:43a9:31a9:10a9::,
>        and rt-3 consumes it.
>        Path: hs-2 -> rt-2 [ -> rt-3 ] -> rt-4 -> rt-3 -> rt-1 -> hs-1
>
> Ah, add unreach rt-4 SID (fcbb:0:4000::/36) on rt-3 will break the path for (1.d)
> testing, as we use End action on rt-3 and redirect via the route. Can we just
> add the unreach route (fcff:4::/32) on rt-3 for (1.a) ?

Right, an unreachable /36 in place of the underlay route breaks the
consumed SRH test of (i.d). The exact route for the (i.c) container
fcbb:0:42a9:20a9:: on rt-3 does not, as the End there looks up
fcbb:0:43a9:31a9:10a9::.

A route on rt-3 for (i.a) is a good idea. It checks the End.X 3>4
without flavors, which the routes on rt-4 for (i.a) and on rt-3 for
(i.c) do not check.

On rt-3, fcff:4::/32 is already in table 90, as the underlay route via
rt-4. Adding the unreachable one gives "RTNETLINK answers: File exists",
and with "ip route replace" it takes the place of the underlay route.
For (i.a) on rt-3, I would add an unreachable route only for
fcff:4::2af1, the SID after End.X 3>4. The underlay route stays as it
is, and the defer only has to delete the new route. I added it to the
routes in my other reply.

I would keep the route on rt-4 too. With your /32 on rt-3, put in with
"ip route replace", and without the route on rt-4, all the tests pass
when only the End.X 4>2 with PSP works as End.

Ciao,
Andrea
