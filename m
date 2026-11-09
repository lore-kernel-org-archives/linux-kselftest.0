Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794252525;
	b=B21VzSlTe/miziADi0EwjO9FLXuqPESEDtQa5SsqN5OxYduTtVKkBqBiC3jeS+5wjn74
	 jA7Kx1EEOIpIInshwR6w5i2KHPARuIIPL1kSuQji9911+7gmW7/63Zg8EJ04eBF/v/2jx
	 PjZQBVF3seT2qPneS2Cck3Jz+El++4PuE62LJvh+UCbX1E1VTI7wZwduH4WRCwrRcXXf1
	 mPVxCVpIaOp2ogvw9k7dT8018w0LJvalsXhLa6KlNExdiDbxVO+daQzBTAhhcFhl+xHnt
	 xX1E8bCOehQKSssznOnm2WSwZKPoWhT18yMPFfe5dqmWfc5PSUYpze+EziP90vI2m0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794252525;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=8P+ZG6KiZ77Eb9mO9Id+HUpKEbu4gTtjlzZy16Jeb5g=;
	b=mVY+lTAMu38O51N3Sk+R4SvfogYPvCAOiFN7pm0rhXJ3U/Y1lQntvlt05jRNNHKlcB6Y
	 ngvlcWt1seLytXolw2FJ+sQuYQQ28Q/nh079OjYyYy0z4jytzFIAiYu9jROUz5PT+4Bas
	 cDtowZmklXj1e8auGSs34iP1GmirKuJdQZkshwo7xf+yvhS5peKRSzZAn0fqdoGwDRpfn
	 vqBDeu2YHRYd70Ks9Qc0VDm3VxuxGsZwwvLAEn/re56s8uzbdQkCkQx84U9GoSs7ez19b
	 /HedAXG30r1Xp+uZmpppkxC7X3QvHsN2KP7QrrRGcai3a4EWcAqO1MyHfkvn9LruDwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=qPeji1th;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF0A606A336;
	Mon,  9 Nov 2026 19:28:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBF0A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=qPeji1th
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=8P+ZG6KiZ77Eb9mO9Id+HUpKEbu4gTtjlzZy16Jeb5g=; t=1794252523; x=2109612523; 
	b=qPeji1thMDMO7dMQavXBh/l+wyF/4VJcXpq2aN2cj0Qyjpc4uwo/IrTWOcCBwET0wn4npsE4dFb
	BJifpZ6pCabyLnTOOoMNBT9MEeAsFysHl9sTQiWM369770p3eEiC6BXLzUSZnsGRLelFbIf0ZM8pc
	LDLZylE5eq2X89AvaN4WwK+yIUypfdZCApzOG8SOEhuSaSsiptLXvvvZkDhrmaxSsYJO5KtsT29l/
	Wr9Ie8BU2PY083POm9dtlsEuiyetP65+YbGqPJpRbOhP49CpPyVLyaOaLmpepKwiOmqAc/Mc9VcvW
	4+PUiTRN67tRr/QGZIQv3M/sjFVUQ5BMFpXA==;
Received: from [177.172.122.137] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xQV2c-007bVC-TT; Mon, 09 Nov 2026 20:28:31 +0100
Message-ID: <d767ae10-2738-43f4-bcc3-1583a5294766@igalia.com>
Date: Mon, 9 Nov 2026 16:28:37 -0300
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
Subject: Re: [PATCH] selftests/futex: print tv_sec as long long
To: Sasha Levin <sashal@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>,
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Ingo Molnar <mingo@redhat.com>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20261103155445.534229-1-sashal@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20261103155445.534229-1-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Em 03/11/2026 12:54, Sasha Levin escreveu:
> On 32-bit architectures with a 64-bit time_t, such as armhf in Debian
> 13, tv_sec is a long long, and printing it with %ld warns:
> 
>    futex_requeue_pi.c:351:30: warning: format specifies type 'long' but the argument has type '__time64_t' (aka 'long long') [-Wformat]
> 
> Cast it to long long and print it with %lld.
> 
> Signed-off-by: Sasha Levin <sashal@kernel.org>
Reviewed-by: André Almeida <andrealmeid@igalia.com>
