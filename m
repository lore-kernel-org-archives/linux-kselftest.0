Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F293511235
	for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 16:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789059082; cv=none; b=mH4iDhUpuIqijtC2720eVhpuh5J9094PpuM/adEny4ZzF64uli2kJZJMhUBK7bcsgyWaUchsS0O7sO8eErsiMcRjXUjkrjMv0sy3QGXKhgpkfdAbA6/kKslqez1PQ1YBu188SQV4x+MOpVV/LnKJ8TDibQhotsb9D0sAfTO45i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789059082; c=relaxed/simple;
	bh=HrCbYNmgcS+z2LSJ5VdsjxHeTs6NHzzFMJ25U0e9i20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J/bLlRQjKW5ampvsJO9gpVEoxol05B/EAO6cRru98rswO2llSdKyCngcqC4868SzxFf/E9Yu18HtQgv7HPkh+Jo6cvB2REKMv6g2q0oLNi3vxWESqGErvRqo+QckbN5Wckg9vbn0VnxIJ03/PWQsMxCnK9onTD7BFWf0avk88f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZY3VVNAi; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZY3VVNAi"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6940C1A0113;
	Thu, 10 Sep 2026 16:51:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C295D5FC38;
	Thu, 10 Sep 2026 16:51:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 091FB11C787F4;
	Thu, 10 Sep 2026 18:51:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789059071; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Puo/f4i5KVDLdRJ1D40f76FmqplugDPSVWcD8oF1klI=;
	b=ZY3VVNAiQVBAedQVFDK4t8gmBE9DeejapVidrSilggvhAF1lOCdp3Bs7ZdT2GlHgW/bZNS
	pq3bRy7yAuXX381iQr4lV4gF+kuSDQ+d9EBuGV81OfJZO+MOkO0DYa2kBrJs9IMTeaGKoq
	UnzZbDJ8sg7qeANclkyyRuYXUDRIOuAEwskwstfWmjXBt05JP1ClKIuQ066M6nlKoizhdQ
	UgOELVh8TxxV5x4gHzFG27ZzAFq2umiPPNIgHGt3fxrGnEthaRXPuGNsVU/CjTxsHTIufA
	WNOa6ryDKkhmH7pzn3hl2VzU9NZ5WzCeg3MrpMXxjg53J6Jgxcbb0vjM2wxcFg==
Message-ID: <fd239a92-30ce-4084-b2c1-632f1fe3a30e@bootlin.com>
Date: Thu, 10 Sep 2026 18:51:06 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] tools: ynl: Fix out-of-tree build for ynltool
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Donald Hunter <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, matttbe@kernel.org,
 Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 linux-kselftest@vger.kernel.org
References: <20260909071155.1234922-1-maxime.chevallier@bootlin.com>
 <20260910085931.3c64f2ab@kernel.org>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260910085931.3c64f2ab@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 9/10/26 17:59, Jakub Kicinski wrote:
> On Wed,  9 Sep 2026 09:11:54 +0200 Maxime Chevallier (Netdev
> Foundation) wrote:
>> thomas.petazzoni@bootlin.com, linux-kselftest@vger.kernel.org
>> Subject: [PATCH net-next] tools: ynl: Fix out-of-tree build for ynltool
> 
> Hi Maxime, thanks for the quick fix. Looks like this did not hit
> netdev, unfortunately. It reached lore but via a different ML,
> and our patchwork only trails netdev itself. Please repost.

Dammit, seems like most of the patches I sent yesterday failed in a
similar fashion :(

I'll resend right-away, sorry about that,

Maxime
