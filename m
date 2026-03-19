Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884EE393DDD;
	Thu, 19 Mar 2026 21:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773954260; cv=none; b=j787wYJJ0s/hEEfVkxjvSWUhR02biTduxa5ncSzKuc3/D5BHPAGAzCye1qcH/RmFwn4Z5Fn9OPeHQ6S5MZAqHfRRXauDm4Zl+Fm15zl46WZkZenoaLKctenq53B+T0SI/1xbZQkb1jqOcfSKewk+3wt0EGpRqD4aBWwyowhEruY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773954260; c=relaxed/simple;
	bh=TSXpxfxn1C06Oh5nU3gCmTrE8hHiC5bRR/YzQOMCiGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q729EohMSOON+rave9T8yFEXBikXmLzYAXQmHYeDgHKO0bUT/pV2yaq6CtW2mgzKK4c6WM6d6iSCYgjuLsiZLggz8EyJhiiF/28o9mMHyQA1HiKpfYccpQtc4KVLWO2hfrjIiZ0CmECj7VNfc9HNDcy30BTdTdzhJ8DKsSgkxGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=t0RoVT7S; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="t0RoVT7S"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4E0CD4E42721;
	Thu, 19 Mar 2026 21:04:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 019ED60050;
	Thu, 19 Mar 2026 21:04:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2E8FF10450AAD;
	Thu, 19 Mar 2026 22:04:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773954252; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=+UkuwtudtqGZeLAsD+YVOGIQG7rB/ZI2tIrrLumZKXQ=;
	b=t0RoVT7SUzHnPmLNghomPUxEN9iUFcrmq23TeNIl7RS49Na56t6LZyAQOzmFmxhM6Uk4NE
	JiA+fctzt5EiDJPKdsHTvw2IWsK/9Y1GWvnM+0JrKdG4oNRl95V8YS5TeKQV2Oue3IcUgQ
	R5TOCobm2tIuJ85P/Twky+y+keHiBUxX8Tuf/ZjU4iKiB+KqkIbkOPJzWXV4VFiEmXCO5M
	J0OBSaJBJCMTUBhDgyneolG4U4HN6yMWajo+/Hunqsm4P5s0FEVLg+okd35OkKxHhajf8w
	VXWEheOwoL0e4v+ZSfNQv+a3++OHr43CSC/Vjv2BdL8QE31QiB7lV5FsIE+s6g==
Message-ID: <d34f58a4-84cd-4c5a-84d9-85bd615429b9@bootlin.com>
Date: Thu, 19 Mar 2026 22:04:06 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/2] net: page_pool: support dumping pps of a
 specific ifindex via Netlink
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 donald.hunter@gmail.com, shuah@kernel.org, matttbe@kernel.org,
 chuck.lever@oracle.com, hawk@kernel.org, linux-kselftest@vger.kernel.org
References: <20260319035649.2396137-1-kuba@kernel.org>
 <2e4a7b45-8029-425e-8b86-9f3031bd081e@bootlin.com>
 <20260319131843.65de0c2d@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260319131843.65de0c2d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 19/03/2026 21:18, Jakub Kicinski wrote:
> On Thu, 19 Mar 2026 20:56:46 +0100 Maxime Chevallier wrote:
>>>  	for_each_netdev_dump(net, netdev, state->ifindex) {
>>> +		/* Either the provided ifindex doesn't exist or done dumping */
>>> +		if (ifindex_attr &&
>>> +		    netdev->ifindex != nla_get_u32(ifindex_attr))
>>> +			break;  
>>
>> If the passed ifindex doesn't exist, isn't netdev NULL here ?
> 
> The for_each will give us the next netdev after or not enter the loop
> at all. (the selftest in patch 2 does cover this case FWIW)

Ah I missed the loop skipping step. I like that construct then, wish I'd
thought of that with the ethnl phy dumpit stuff, I may take inspiration
here as it avoids treating filtered and non-filtered dumps differently.

Sorry for the noise then,

Maxime
