Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B523400DE8;
	Fri,  4 Sep 2026 06:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788502295; cv=none; b=MmtLXAl+m33B1tJ8uxWlCsvJGM8LIfOBAsqxgl+ahMU3Bev5mDEtZUyH4OYsQ391r+1dVqMSjBboaBOdfuoJ0G9muzfR3CrE0qj4z3DCtG0WA6KjZv7zxna+jNUMPegRF2GrjtWr93ydAnwKp1M9bexsFj1qJ8S6EkZ4uJ3XgVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788502295; c=relaxed/simple;
	bh=JHkbB1JfRxNI1CsXHCi50vbXHL74mLGXT94u8wHDfJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k3HMyPW9vtB1VjoJFmitJtvCgrzHvcMHHZxrXKLik2lpcoIfqyu+joHgTvFXUVGkphmGfriP1pa0XGX3ewVYmyWbKV6TIoRJP8nfC0ZBM0psudc9ebM8qRufs+Od+1U0ok+Xi0XJr/+N8N2Fl6grjnfToa3l27/2m4elfXls2II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0NwTAcz0; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0NwTAcz0"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4DA831A199A;
	Fri,  4 Sep 2026 06:11:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1BDEF6057F;
	Fri,  4 Sep 2026 06:11:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EC85711C79F76;
	Fri,  4 Sep 2026 08:11:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788502288; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=RjzcsyivNlPTUwhkXm3AdIxL5Bh4sKOmVQSxjRl8PGI=;
	b=0NwTAcz0MdpOoqji7q2xKnNJsmjSu7eAV4DCPTkxjm2bz6sY218UF5hr5I1U2fiLxVcZK/
	PKl6aLGBwKKLyAq3fgos0WtRv8PBkzjTurWfdK6FQ/JcUcUhmmuRQdnYAZ8F9XvemMKVTh
	QdH3ZPOG+pskVTVF8f3x6HkslNdT0ovkmuPhGFLTVpnML3R6dRkW4H059ji5nfGVs22eEb
	Sk7Zv5OiCMCsZoL9X3WuUQrNPclPlXqm4DgNz0GsNILau1nLMJd4EngNvu0NGwDhGncwji
	G7LNbQk9jginQ8/55C+hynixCrjw89yeW7ZLj1wlZThmdoBSIPbTDhc+EwdXwA==
Message-ID: <de57fcda-30b8-4afc-8711-0f0d06840fa2@bootlin.com>
Date: Fri, 4 Sep 2026 08:11:22 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 0/2] selftests: drv-net: Allow cross-compiling
 the hardware tests
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 matttbe@kernel.org, Stanislav Fomichev <sdf@fomichev.me>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-kselftest@vger.kernel.org
References: <20260903155524.2241065-1-maxime.chevallier@bootlin.com>
 <2a595cf6-d208-4a0a-a96f-738235236aa1@lunn.ch>
 <b2f7d07b-5c14-4767-9fbf-47a72a6c22cd@bootlin.com>
 <a0ced283-7eac-451c-b22b-cb88a302995f@lunn.ch>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <a0ced283-7eac-451c-b22b-cb88a302995f@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 9/3/26 23:59, Andrew Lunn wrote:
>> But then there's the kselftests that require a peer, and here it's another story.
>> Some tests, when using the SSH remote type, will scp a small binary on the peer
>> and use that binary for testing (sending specially crafted frames, etc.)
>>
>> Just in the drivers/net/hw tests, we have :
>>
>> drivers/net/hw/csum.py
>> drivers/net/hw/devmem_lib.py
>> drivers/net/hw/gro_hw.py
>> drivers/net/hw/iou-zcrx.py
>> drivers/net/hw/nk_qlease.py
> 
> But none of these are binary, so long as you run the .py file, not a
> pyc file.
> 
> iou-zcrx.c ncdevmem.c nk_forward.bpf.c nk_primary_rx_redirect.bpf.c
> toeplitz.c would be a problem.

What I meant is that all the .py files above are selftests that are copying
actual biniares (generated from the c files you mention)

e.g.

drivers/net/hw/csum.py sends the binary generated from net/lib/csum.c to the peer


> 
>> We could expand the remote_ssh logic to probe the peer, and raise a skip if it's
>> a different arch than the dut. Or better, have the DUT check if the peer doesn't
>> already have the tool in question, i.e. the kselftest "package" is also installed
>> there.
> 
> https://github.com/torvalds/linux/blob/master/Documentation/dev-tools/kselftest.rst#install-selftests
> 
> does talk about installing the self tests. Maybe somewhere in
> /usr/local/libexec or /usr/local/bin. 

Yep that's what I meant, this is what buildroot uses to populate the rootfs on the target

Maxime

