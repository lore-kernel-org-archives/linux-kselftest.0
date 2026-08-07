Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB374B04B9;
	Fri,  7 Aug 2026 00:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786062005; cv=none; b=QFNRnTaEckZrggqycwjMFpAXsJkSxionhhORKgDIn+HUYn7LApClOFKZzpSAzC+fEQnCGLzbjpP9ZlCoBueQ8LaRCwQp8+dcx829JDok2mU6A1B/73ZSqxwecpf3ghcgAwZrNDzYr9JAXYakH9Vi5YXg+DZlbLj4bqLcSBIXiq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786062005; c=relaxed/simple;
	bh=Ki8FAR1872dAp/UzsLSApPoufvJ1CgSkv4bWKwwUcEA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=bUeZQab3Eu7odjkteHjJIevgvRKcMssvvR2oVBg3Bq81XVKzhOzeZOj5VmbquucpUiTho7dybvb1siSUaReSRxi+AaFYhmw48YVZe7yqV/tVXrSVYGDMQgO49CiX/y7Pm7w6tdb1i60JGnw8bAv0mKXRwr4z6ZTvvMffw4/1GtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dKE/H+l8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dKE/H+l8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 831911F00A3D;
	Fri,  7 Aug 2026 00:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786062004;
	bh=bulUr6vm7rDqnz7Cj3GH7w1sFh3G8A5tW88syWQ8Gek=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=dKE/H+l8ivR6/iIlXn+Kj9O20IlrfEkwDxJ1mYKhtflAUNTbX7vJ+Cn6NPNmYuaia
	 pOyrNQcPuBVoz+JPUDvXeOto2wK7/xBcj6EmxBxN8GNKVPeF2dBtji1Ro5MYdIzLle
	 aUoTgwRcaJab3NJPrq+kkm6pzksSgFLS6LLGzSL1TWO+XENtHkg0FmAE9pdlrygh3w
	 6pD1wey7fg2+2q9IVU5kNHINYhIfoM0leT8scA0Pxr4p/GycGj7zaZW9g5YKLaLxNR
	 S94rnjwud739fCh0trN4VdR7pBhe3Ik7WQK64xaVdFgovDvEhEWM+IG6xsi1C02f8F
	 Kix3a8AtKpPyw==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 4F130F4006C;
	Thu,  6 Aug 2026 20:20:02 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Thu, 06 Aug 2026 20:20:02 -0400
X-ME-Sender: <xms:siR1ajtKZ3T1RRM-lLZ2CuY5UI1Ddjop1hY6JIq8VccdbBWULx1LNA>
    <xme:siR1avRwntCYorISrhhdjLyeE1ACZuT-RmZd2kIZUiJkHqbO0FInhFTGxphl0pFiA
    qysARMuYmOeG0tF-eqD_G39ufjEtBHL6EFHRSH3huFLDH5b3er4clgk>
X-ME-Proxy-Cause: dmFkZTFYW+Fz5tk/HvnmodK9Y39AUZ56JeYBFUFCZRdYy/urEtUNR27dZ2xerHFVphltPf
    0ICbsGVeNdLCq1qL0RdHW0JP+7MD4R79+VXyzA/1TkO1zp0HiHRQuZuiDoVDG2Qrmhdjk2
    OiFGtiLfCkXPYtVd7pdvQShnXt6/3BOxjvLisbku8Jak4Vu9hoohGRysg1DmbtMwiVPe8l
    tPpfZlyU2KE3zh6LuWkL8xaHgSntg8rZB7+kdL6gOU/ZuOtmst+w58mOj3VF21m/ryk3zZ
    +j5GGKIdFlYUhdAx5uisXchbei2uV/AIRUsePe5E2Zc88/I4aahKiSljLt6zvK/kAsFdVS
    Z/vZDl+GUAK73W/fv5HS9GbzyTeUhFYvqP/gpodkRhqtF4ypjaDjzA1p3y11+iWIBCcoAT
    FEWxjyneIm8RX6NQ+wNtygyYOr/dsTIN6rAEezVt3dh7acjziHbAFoUQl6xd4gS5dIh6HA
    LgrEsi/YPNRfrilM2f6MFe96wSTqX6oh2L3SJi3yxC+dxZX3mjUD6FtniKkXaYnTnhLlOp
    kXvV18/u07nJADq9eAb1AQpyanFKgRaiaLpPp4B77ymuw/xdhvvDvGWnKU/5BOWzwSmWZ5
    kLB7f9fGyi0QnxRLxc20t7wqBBn4GIPC4RI+3dsYTgsVhCF0WHvzZAL59FUA
X-ME-Proxy: <xmx:siR1anSGt8Fyt-uFUX1I_4xqWJpSTfAKtrUK182g3-UdElgNgINWkw>
    <xmx:siR1akpKxd9u_BmB1euV0NNlb_vkoIQVooTqvUvE0p6jeLooMD4r9w>
    <xmx:siR1ap04wv_066BkE4yCBgmczKVmrrgBhzvaLGQpLln75PPHoBbzIA>
    <xmx:siR1ar6TfHh5ortQBIdv2JaOhRFxdowKa6ehQc0eBGab2BkpWXCYGA>
    <xmx:siR1alTVQPmB_5OmnzsJ6Rr_NTPOAi84Rf6L0O0Xb9GuQQZr4ecluzS4>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 301B3780070; Thu,  6 Aug 2026 20:20:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AoilFcRgMmPZ
Date: Thu, 06 Aug 2026 20:19:41 -0400
From: "Chuck Lever" <cel@kernel.org>
To: "Sabrina Dubroca" <sd@queasysnail.net>
Cc: "John Fastabend" <john.fastabend@gmail.com>,
 "Jakub Kicinski" <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Paolo Abeni" <pabeni@redhat.com>,
 "Simon Horman" <horms@kernel.org>, "Dave Watson" <davejwatson@fb.com>,
 "Shuah Khan" <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Message-Id: <82269201-0bf8-4cd1-b5fe-40ce094859ab@app.fastmail.com>
In-Reply-To: <amsufVx5T-xs9Ydd@krikkit>
References: <20260726-tls-follow-on-v1-0-99bf4cc1c729@kernel.org>
 <20260726-tls-follow-on-v1-4-99bf4cc1c729@kernel.org>
 <amsufVx5T-xs9Ydd@krikkit>
Subject: Re: [PATCH net 4/9] net/tls: Honor O_NONBLOCK in tls_sw_splice_read()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Thu, Jul 30, 2026, at 6:59 AM, Sabrina Dubroca wrote:
> 2026-07-26, 20:33:32 -0400, Chuck Lever wrote:
>> tls_sw_splice_read() currently derives its blocking behavior from
>> SPLICE_F_NONBLOCK alone; the socket's own O_NONBLOCK is invisible
>> to it. A splice(2) call without SPLICE_F_NONBLOCK on a nonblocking
>
> Is that needed?
>
> ssize_t do_splice(struct file *in, loff_t *off_in, struct file *out,
>               loff_t *off_out, size_t len, unsigned int flags)
> {
> [...]
>             if ((in->f_flags | out->f_flags) & O_NONBLOCK)
>                     flags |= SPLICE_F_NONBLOCK;
>
> We're not going through do_splice()?

That line is in the "ipipe && opipe" branch, which never involves a
socket. Splicing from a socket to a pipe takes the "else if (opipe)"
branch, and the test there is out->f_flags, the pipe's. The socket is
in, so its O_NONBLOCK is not folded into SPLICE_F_NONBLOCK on this
path.


-- 
Chuck Lever
