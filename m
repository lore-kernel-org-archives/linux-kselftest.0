Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9CE3EA66;
	Tue,  4 Aug 2026 00:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785803777; cv=none; b=mW/wESSdebRdXr47NuBfI8N3pl3fRhsBVEW/zrMp9Z6VdfeyOxTgd3e2t/j2VbxgbGNMv7b+3UaQB0oFQlvkokoLgc2mGWOkecZ1ZWwYJna6HVPBMkniQoxmZe0Jt0MwaSTMDhS2/ZbY3wBKCPcUChrgXLM2DXBHXIXn2n91mig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785803777; c=relaxed/simple;
	bh=owUZO0GaruEeUom+rYgZQVjvxQGPUrrqdGEx8tSnuLI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=B6VnhE/t0mnNjYUG8QERGRiYm7jV2toaHM57UBw56upsRtp0adVpeO057jl9OXNOT8MBzbDKZ/PQDJn6kKJRBgAnJkjuoc2JFOHNQGXjuFdfh0t2ISeSNco413FUQ0TCSQhoen+pzReot2WHEzfy5OK98KZfuqURbmEMf9vDTFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hq/jM21F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hq/jM21F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE521F00A3D;
	Tue,  4 Aug 2026 00:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785803776;
	bh=owUZO0GaruEeUom+rYgZQVjvxQGPUrrqdGEx8tSnuLI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=hq/jM21FWSX3Z89SruuLfvM7Xi31dgVKTsyMutOCIfVsiWmYrJruyXHWn+rKiEl6O
	 DtnwGARRtPSIbUP2Ve/XknMO0cmLaHHLZxNA9eI44pLq8CZOAngclcnHPLFSltXK19
	 yrm3kjDNRWezyXSFMF1BjBK7n9GzJyuQ7rlodEZv8+W3LRRf6F4Mq5hCLZbI+bAoIa
	 CAWAX/w7s+0IgpHfx0KOBG4f4F4Io0+pYEk2tQUcYAbdEI0mfoDQ6TYLRV8fAeHuu4
	 zS5xi3llV7QuVdViGzW6tOLNUr6n962VZZbb3qJhrdbT8zvJ3THinEQLp3W+qp02Bu
	 fEM21BBEE6qRA==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8F8DAF40068;
	Mon,  3 Aug 2026 20:36:14 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Mon, 03 Aug 2026 20:36:14 -0400
X-ME-Sender: <xms:_jNxaluJ2vMxhnOg5lW2Vvq_-pL6NGa9kcaDA27V73DY7srGFSn_ig>
    <xme:_jNxapQR55D1PNJAH5XkvUcLNmXO8ZppDO9jbdfK9_V-wwBbImhkKBx6lbC6Z_LUH
    JP-tt8gVioCWmf4mbM9jOk-5ciACbgpIGdqYmBtlpDN9hNye_22eN8S>
X-ME-Proxy-Cause: dmFkZTEL3Nm7825IrFWzPhaZR8Uj6YcDqdW1PuqBBrA9DvhaC8lzAhc0G1SmrkTiRcRjo2
    Cjcsk6kGRxISyDZZpgKw3U8UTsUEQV+fMG9Qb4tSOJJvgSy9J8zoR0X83YNg0nWfnSe7Na
    yIYB1rACc8OJebEMZJgmvDbbVtmrkM06MApbk8C/wbuIprrx0YB6sat6UKJLMKzbhj01Bl
    DhpVKiNjC5jrt5PIQu5igDLxfLPWRTo7JiXnw8agW2/B8/nvb4+j1dOxxqJBIdaGhJtbId
    ghlv7Cl8REH2xgZC8+ZZZNn2wRdKgNLYvM+V3Voy437WorqcF809/jUHlXSoNoJdsYWfEr
    JTSHfaJQbTCylGJK0P++FanMnse8/130GCoAfV829mdxXdJjXc9OhQ8LxJo5p9q9TH/k8x
    kTcDLBKRy57ed/ChRbsRJ7eMNYcGhSQS6Fb4iIoHHH5xuJ9AQOcDTBrJMOnxoOL9b9eJ5s
    RUcjqzuzQIIuunpaCOrutsu5Jvnzyf9vcHYNPhJfDW9hs1Rr87LjN5P9tM06URECh98j5o
    6lz6pSFTbeu5XHtS+SNGE7wcPZIx0B3kMUqpW9J8V9tMDeoQqYuKq7fVc88gtiKRxmLLbL
    jUDklzxnA3S1mzhTeaYGILjsWd0nRRvFURR8QOKt4Olk42rJn5VeCQ8j+o2A
X-ME-Proxy: <xmx:_jNxaq4mG4hhXZflbEsoNJ1aL6g_l7I34IYUaBDsdDdIp5uc1BMdZg>
    <xmx:_jNxap5Dur3g0Oo40KN_teMhFyus9NLKnczqps1XOx8nWSJ_oQ6McA>
    <xmx:_jNxakQndw6iZMI0940pVGWUHfVy94IGrtImWCGbQpA1JoXsZZcHBw>
    <xmx:_jNxap_gJCPRs7zIrMnwzldz_HhrC-DhqKFDkg4CXIwG9tjNpxPSBw>
    <xmx:_jNxatY_kZbp6AyW-FsY2k6jMB1XWTMszG2aqjmUtKYJRlbboNA6keRP>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6CAFF780070; Mon,  3 Aug 2026 20:36:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 03 Aug 2026 20:35:54 -0400
From: "Chuck Lever" <cel@kernel.org>
To: "Jakub Kicinski" <kuba@kernel.org>
Cc: "John Fastabend" <john.fastabend@gmail.com>,
 "Sabrina Dubroca" <sd@queasysnail.net>,
 "David S. Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Paolo Abeni" <pabeni@redhat.com>,
 "Simon Horman" <horms@kernel.org>, "Shuah Khan" <shuah@kernel.org>,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Message-Id: <b997d118-0e36-4511-b14e-66704dc8e9c9@app.fastmail.com>
In-Reply-To: <20260803153905.09f1ba0b@kernel.org>
References: <20260726-tls-follow-on-v1-0-99bf4cc1c729@kernel.org>
 <20260726-tls-follow-on-v1-1-99bf4cc1c729@kernel.org>
 <20260803153905.09f1ba0b@kernel.org>
Subject: Re: [PATCH net 1/9] net/tls: Bound time spent on no-data records in
 tls_sw_read_sock()
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Mon, Aug 3, 2026, at 6:39 PM, Jakub Kicinski wrote:
> On Sun, 26 Jul 2026 20:33:29 -0400 Chuck Lever wrote:
>> +/* Bound the time that consecutive empty ingress data records keep
>> + * the socket lock held without releasing it.
>> + */
>> +#define TLS_RX_NODATA_NS NSEC_PER_MSEC
>
> A time bound is a bad idea in the kernel, a softirq can easily=20
> take >1msec and turn 2 consecutive zero length records into
> a fatal error for the connection.

I don=E2=80=99t have a particular dog in this race, but you and Sabrina =
need
to thumb wrestle to decide which way this needs to go. My original
thought was to use a count of zero-length packets.

--=20
Chuck Lever
