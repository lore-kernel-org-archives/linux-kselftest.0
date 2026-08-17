Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD308282F29;
	Mon, 17 Aug 2026 18:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786991297; cv=none; b=XEApYpzbu8waT2OSmCA1CQFz8c+PrhnjH4FUWWI9sQtHfybBbUeorhYfm3n1K4VHY6Qr2hhbFBp8iZT2YpCzy7g/NyDQG5rvxCLE3vN/HuCx3Vu71MBpBe8JLP1BsXIIVsjZx4XGJd4doVIk7dNLCZ2R3I9R4lTtSCbTDp2neEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786991297; c=relaxed/simple;
	bh=P/DFX19iPVRyKIoWqb+hSGrRbqtj+239113PQo8H0e8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=sTKJ0P+9w4cWOdipBKwmSdO/zH6gFufkNI5nk8afZ7P1RZwAnM3io9sBfrqkPJqUSNxgW9pBUXWftkn1HlcD+j5NZa1tGAikeOOdMjg/AL2qXax4HRNvRvIUP/Ww2Lz35M0lFUlpkk1/eN/bMYO/HES/tHmwnLUZPpICMygW48Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im; spf=pass smtp.mailfrom=fastmail.im; dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b=RbNrK0zV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=P5dXGfZU; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.im
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b="RbNrK0zV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="P5dXGfZU"
Received: from ams-compute-01.internal (ams-compute-01.internal [10.64.2.61])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A8ED31400133;
	Mon, 17 Aug 2026 14:28:12 -0400 (EDT)
Received: from ams-imap-19 ([10.64.2.39])
  by ams-compute-01.internal (MEProxy); Mon, 17 Aug 2026 14:28:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.im; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1786991291;
	 x=1787077691; bh=/SAYwrtE+2KL7VtJNGSqzqFNhlz+LUncJzqFy+7g+Jg=; b=
	RbNrK0zV4TCrBt9IRu2fitwmB34hPbLUGxUs6HVmC9WORSjfkuZtJI5FvBViZg8P
	QH5VypolrRKDMLasTFTTtNzaBGHX+lrw42zHtDLcn1ToFXsrYxS+3AM4EK6PZ53H
	oHTUQ82ZKM980pdwLTX/Az763MW/3ujXDUh6Ph1HJcVFkHVul8H9bGD/DogWyivn
	IayyZWoh1aZu48Trdcj/28SfMH4uQE3AKisWcM+hx690in4QTik+qpthj01p6IUW
	fqLrV9BtaakwYZsVQcJRPVRh6ATf47lHiMEn0z2my/MhIFme+WvX64PxQb0gHtOF
	Dn/s0qPJHz3YefCZ8jRLNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786991291; x=
	1787077691; bh=/SAYwrtE+2KL7VtJNGSqzqFNhlz+LUncJzqFy+7g+Jg=; b=P
	5dXGfZUe3oiJVfJnS5OKYHywTulIa8QpwacLVFqxtAet/32jN3K7w2yFN4XpySTQ
	75VrBRW1zVQvyIIv2DH0uCiiy1qxABFu4ctcN6vgi/mkrcBu4phECs2lx/Aqcvm4
	Y5t5jS2pTGaY5B4JWDvc6i5PJwWH1fd7cE4/X88heS3uyjfzX0MYEXwunreqwx2I
	x46HIK+ieLnm6PXzEs3pbsQWDDTsSb7K0EdRoUREbbL/9ae/3amYrkOy7UNQkIVc
	UjjEyXdhQD/eFTEMaXmlCLZNVCbHOGxi+i8UQzs961sT5FYMe42N/jzvJq9PrhBQ
	JLdugkxFbMfTrCWZxPn3A==
X-ME-Sender: <xms:tlKDalvV2qmb0daWLMy8gDCmZ1DDAYj4eWRUw52EBFgiHa6MCfZ-dw>
    <xme:tlKDapRtT2MhE_zHJ7CvLAyf0WAmZxT2xYt2MOB1s7qAPRZRPobGZdh29tf7QI1E5
    qJ216B2RO0vTJhJVCR8i0JlewsTmSAAomISU1Jz8u2MwgW_ikNZlAO2>
X-ME-Proxy-Cause: dmFkZTGoHwIAF44WXvuXFCl5x/oBnnSU0PhOsIsRvg6+qgX8CVrda2ORO0+byBI+JPqrqq
    uZbjiP7PO7h1gP2vgvRstmDTYXKL2eSjlJ0jjhb8xYoifD3z0mdEzEH5gIl0M5o6FhMIzT
    DNDVIHDEn45wqNog5C7dLw0iKiABV3+YrMx5g+C3R9tsHJovZmL/bYi0ZxYEjhRYaDx23G
    GwfPwSbFlubka8iXO2x+Hph7H6O/nOTF2r4J+N4lPePmDkuvfMX3P07oDINuLOWNgOU91D
    8Ege6hRSh9d1U9+8NtHHroK1Ybc86gVMjoT+OsGvyY+KXQ2PbR7+w7g133hi5II68LY8YP
    kaV2ahlmkoVNeBd08VKpfQ7yyG90eX4HLFD9lDEerr+HrQSa/Gnz7Bi3r285CTWfPTxcAk
    bqFkYvfN9oHxp1Si3g+Sasbpp5p7Q2y/Nl8k2Up0hoKzgCcWxsOedRu1mRbTAe6i9ptBv4
    IqLdKYGYPI67APf6peaGAbX9v1jAia4PDf2z55BOs34zh+s3lyYi9ySE2ywKnEYDA/woug
    YNvWrObkMVGlIFLtuB0gNLeilOFUbpY7XLjXWUJ8xX97Q3QyrfUNV4p1gQKsXhdaBfxKDE
    gd6pray/FT7qe2/+Cx0SI5n/WYovu3RoguTdE0g7R/goWIYChFwk+j28Y+dQ
X-ME-Proxy: <xmx:uFKDammKLKeNBvvfbkt_UOLzZNG_Enbe6UBg4-PMtEXaJoLNeHK5mw>
    <xmx:uFKDataDO3clweHSuLJW_Lg4eL5cul8umlT1z2NyFs2uVKq-zsz7MA>
    <xmx:uFKDao_5jDzP_eomyjcc64Xi_m4Jt2mnBbecEespeveD69tJMZcO8Q>
    <xmx:uFKDatE78cJcdOIqhFEJSKAuB6lF3cPmVqORzNsG_3MdlD61qiRCZQ>
    <xmx:u1KDamgwcDJu0f6FW8Hdid2RnEuZrFcoDfFRN_0KLMzkZaly6PPq5CEt>
Feedback-ID: i559e4809:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 089652F81645; Mon, 17 Aug 2026 14:28:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AvO3R8q6Da5c
Date: Mon, 17 Aug 2026 21:27:45 +0300
From: "Alice Mikityanska" <alice.kernel@fastmail.im>
To: "Willem de Bruijn" <willemdebruijn.kernel@gmail.com>,
 "David Ahern" <dsahern@kernel.org>, "Ido Schimmel" <idosch@nvidia.com>,
 "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Simon Horman" <horms@kernel.org>,
 "Shuah Khan" <shuah@kernel.org>,
 "Hannes Frederic Sowa" <hannes@stressinduktion.org>,
 "Vadim Fedorenko" <vadim.fedorenko@linux.dev>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, "Alice Mikityanska" <alice@isovalent.com>
Message-Id: <6f5e403b-dc29-41e0-8cdc-ac17dba30bde@app.fastmail.com>
In-Reply-To: <willemdebruijn.kernel.22c7d90c91d06@gmail.com>
References: <20260813120351.2807829-1-alice.kernel@fastmail.im>
 <20260813120351.2807829-3-alice.kernel@fastmail.im>
 <willemdebruijn.kernel.22c7d90c91d06@gmail.com>
Subject: Re: [PATCH net v2 2/2] net: ipv6: Clamp to IP6_MAX_MTU in
 ip6_dst_mtu_maybe_forward
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Aug 13, 2026, at 23:25, Willem de Bruijn wrote:
> Alice Mikityanska wrote:
>> From: Alice Mikityanska <alice@isovalent.com>
>> 
>> Commit 427faee167bc ("net: ipv6: introduce ip6_dst_mtu_maybe_forward")
>> dropped the IP6_MAX_MTU clamp that used to be present in ip6_mtu(). A
>> similar IPv4 commit ac6627a28dbf ("net: ipv4: Consolidate ipv4_mtu and
>> ip_dst_mtu_maybe_forward") preserves the IP_MAX_MTU clamp.
>> 
>> Restore the upper bound in the IPv6 flow to avoid potential 16-bit
>> overflows in forwarding paths.
>> 
>> Fixes: 427faee167bc ("net: ipv6: introduce ip6_dst_mtu_maybe_forward")
>> Signed-off-by: Alice Mikityanska <alice@isovalent.com>
>> Suggested-by: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
>
> Reviewed-by: Willem de Bruijn <willemb@google.com>
>
>> ---
>>  include/net/ip6_route.h | 2 ++
>>  1 file changed, 2 insertions(+)
>> 
>> diff --git a/include/net/ip6_route.h b/include/net/ip6_route.h
>> index 09ffe0f13ce7..fb59a5885faa 100644
>> --- a/include/net/ip6_route.h
>> +++ b/include/net/ip6_route.h
>> @@ -382,6 +382,8 @@ static inline unsigned int ip6_dst_mtu_maybe_forward(const struct dst_entry *dst
>>  	rcu_read_unlock();
>>  
>>  out:
>> +	mtu = min_t(unsigned int, mtu, IP6_MAX_MTU);
>> +
>>  	return mtu - lwtunnel_headroom(dst->lwtstate, mtu);
>>  }
>
> It appears IPv4 only clamps device MTU, not route MTU:
>
>         mtu = dst_metric_raw(dst, RTAX_MTU);
>         if (!mtu)
>                 mtu = min(READ_ONCE(dst->dev->mtu), IP_MAX_MTU);

This is some old code from v5.14, it changed in commit ac6627a28dbf
("net: ipv4: Consolidate ipv4_mtu and ip_dst_mtu_maybe_forward"), and
IPv4 clamps MTU in both cases since then.

> I don't think that was necessarily intentional. Perhaps route MTU
> itself is already bounds checked on configuration. The device MTU
> min() was added after a syzbot report, in commit c780a049f9b.

This commit merely adds READ_ONCE to the existing min.

> Current IPv6 proposal is arguably more robust, covering both. There
> just remains a difference between IPv4 and IPv6 code paths.

So, looking at the fresh checkout, it seems that my patch covers the
difference, right?
