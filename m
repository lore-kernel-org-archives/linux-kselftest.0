Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007545;
	b=ktXW1J6Xllv+iakbTTm5WZ/tzuLNLcLr4eISIa3olwuaGGSSle1BBg3Rr51tf/IgPcFf
	 Df/4i+RDqvYKfce8oI32jOjl6mZfbh0r92RauCOLuGEzsci1zRHHOO34sfdJJ8/1Q+351
	 j+f6ntaEmHIC4d5ovCTAXQMsstQCpTfN2zviRUrMV5RxU9kN4TTcMiraV356rG5jndgFh
	 MqroPiLWeB74LRq1Ylhc3GrSNK51lKFB3qAt3ZM5OWT43s1x78hnpUfo96sQxBcXQLiCJ
	 9vGJYxivEDt6CrM8tCEtcfWujrT80COpOH8jUOhl/Mfou1SN5f8V/uPMcTKyAZyMYyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007545;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=zlTJRXNdUH57jyzaCq/E8WWS7DoKJQxESYFn2N5Oo/k=;
	b=OAN3UMNHeEvOg0kwyjENs65aAa/x5rIMdc59mlQI+TdJKvW2uSqhY+cusvds7s16y+bj
	 rpDewO8BLFe1ta4SxVaZZirrEXYYFLY1BuXACjCv3fpahfjrAj2ns3UK+1Sd0tyykBdMz
	 bQi6uwIqsI2KDEVia+PNpDxfwOhEqi1/ZYXtOvEo5dGxwf+BWBZOdXGU5oIT28cgOgOAE
	 D+DJlfFG/e8EpHzCGXcUysMTrDjXEjWB6pBqArIpfx0sYwiOib2w8/LdYPuKjkkBK9AhJ
	 FytORXmvhTMVC25YzY3LfH6TCEo4OPKBV24GNGVIo3dindcTqtzLkTlZVIx1h83k5gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Un7LKiPN;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2254606A31E;
	Mon, 26 Oct 2026 09:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2254606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Un7LKiPN
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F1DAE1A134A;
	Mon, 26 Oct 2026 09:39:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BB5A960740;
	Mon, 26 Oct 2026 09:39:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9CDC710328E76;
	Mon, 26 Oct 2026 10:38:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793007539; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=zlTJRXNdUH57jyzaCq/E8WWS7DoKJQxESYFn2N5Oo/k=;
	b=Un7LKiPNjLMPOY/InbbDUlDTcPmC3CR9e/92yKsNyRnpsvJfUVLxt9MCpTGNtJpDXjUzU4
	+Pu2wRCoQsI4dgMs+khR4Cwp0sbCFWRj/+JOMfoYEtJI8vn3MZE41I20W4CCwtlLMWRXtT
	YYnpwHr45/GVRkbtVgJ8QfG/4WwESgqmjnBVsJZZbuSQ8u/zUFODjj5UbYi2z47aaaM5iL
	iWIH587ZvTB5+61w6/tcuKrjV4TT29u0K4/At8EpFX5O0rUvgDtnuO3XsbVDPveh3BjVA0
	7tLFtHQ/d5xt+1U1w77kndd16Oz39aGiK6FLci6PBTaobFLFWJpJk9X4jH4pFw==
Message-ID: <ce8f0d43-0078-41e7-a5d2-cf31c6dc97fb@bootlin.com>
Date: Mon, 26 Oct 2026 10:38:50 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] selftests: drv-net: devmem: Skip when hugetlbfs isn't
 supported
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Bobby Eshleman <bobbyeshleman@meta.com>, Stanislav Fomichev
 <sdf@fomichev.me>, Breno Leitao <leitao@debian.org>,
 thomas.petazzoni@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20261021090852.996899-1-maxime.chevallier@bootlin.com>
 <20261023105258.2a6349f9@kernel.org>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261023105258.2a6349f9@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 10/23/26 19:52, Jakub Kicinski wrote:
> On Wed, 21 Oct 2026 11:08:51 +0200 Maxime Chevallier wrote:
>> The devmem selftest requires accessing /proc/sys/vm/nr_hugepages,
>> which is only available when hugetlbfs is supported. This isn't the
>> case on all CPU architectures, for example it isn't supported on ARM
>> 32-bits on cores that don't support LPAE.
>>
>> On these devices, the devmem kselftest doesn't skip gracefully
> 
> We don't require graceful skipping. If anything IMO hiding the stack
> traces isn't great.
> 
> If the check is extraneous and makes us fail some tests which don't
> actually require huge pages please make that clear in the commit
> message. Otherwise the net benefit of the changes is unclear.

hugetlbfs isn't required for devmem AFAICS, but the blamed commit
moved the access to nr_hugepages before the actual "is devmem
actually supported" test.

I don't expect the full test suite to gracefully run/skip for devmem
on these arm32 platforms TBH, it's likely that devmem is only something
that's been used on platforms that support hugetlbfs anyways, but
strictly speaking both features are unrelated.

Maxime
