Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163544EE87D;
	Mon,  7 Sep 2026 13:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788789117; cv=none; b=XCCQMI6yxWNiwhu1F2CFgILytFbKXvHY2HMlY0BcG6Leck0ri9NuLS73Joq8xex72gA0pv/dbJCY+qqM3VidrxT6R/kq2pENbbTJFIkFG3iVKJ4TZ3IWqFaRfL/xVbuX+oaRgUHJObtT3gifCQFqYDX8EmC+gdPEIKiX+XSQHc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788789117; c=relaxed/simple;
	bh=ThHeYkZYHeYjd7tF89cElYsGMLmimQV2FzPcueOlD24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cxTpAjErGYUl0UGzCPxu/MBFm3YZ/9/s4ywFlVO5BJsnpi5ajNgwZPyhISYqkNYW13p9HNI9o4j0tlAvrsl6iOGgE/bIW1NelhAjR82glzrJ5IhLh2pRas9J+jEOJsFohSIOfb5LhBK2IRHvemUNbLYxmILOIbA6JYsHEPSKthU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GlpGw7H8; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GlpGw7H8"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 368E44E4156F;
	Mon,  7 Sep 2026 13:51:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 086F460383;
	Mon,  7 Sep 2026 13:51:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EABD311C79257;
	Mon,  7 Sep 2026 15:51:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788789112; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=dCdnS8YGabKEY8dwf5ux6eiXZ8smgAq5tjIUZqqWccQ=;
	b=GlpGw7H8O+6FyW9wvK2smDhNdOI28WjVK8NV8KC2zUsNI97UqIWeIRWS/GSO9YniJzgSoL
	EbEFJzbs7igWmG3j9FqXp1hHQ3T7a44ZvOQaW4GAUQfWNSuFpRboOoiVTHkO8U6bm5Ymwu
	2YurP8VJAFU9ITW/uDrFKY+2OTI0j7mkWHEM5Ebsc2q3ENJtW2MgYtFb3k0XcMq59fPv04
	C6oIAJKd1PqWomXKGOOWiQRcDPld6/JsuG915suSh1RQfAG1V7JgNlXxrBkNmrrgyam/Qh
	Xwg+H/wnyuvtW/LmMp8tRYKK2MniHp93xHAdRS9GJ7jjbl0ZMWdKkgJi44oY4g==
Message-ID: <318ed226-ec5a-42f8-a2be-c41959970ef5@bootlin.com>
Date: Mon, 7 Sep 2026 15:51:46 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/2] selftests: drv-net: Use cross-compilation
 environment for the io_uring check
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, donald.hunter@gmail.com,
 horms@kernel.org, shuah@kernel.org, matttbe@kernel.org, sdf@fomichev.me,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-kselftest@vger.kernel.org
References: <20260903155524.2241065-3-maxime.chevallier@bootlin.com>
 <178870682049.219967.8686151218558794028@kernel.org>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <178870682049.219967.8686151218558794028@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 9/6/26 17:00, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider:
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 1
> 
> - [Medium] Incomplete fix: the capability probe still uses a different
>   compiler than the one lib.mk installs to build `iou-zcrx`, in two…
> - [Low] Missing `Fixes:` tag.
> 
> --
> 
> selftests: drv-net: Use cross-compilation environment for the io_uring check
> 
> This patch sets CC to $(CROSS_COMPILE)gcc at the top of
> tools/testing/selftests/drivers/net/hw/Makefile so that the liburing
> zero-copy capability probe (HAS_IOURING_ZCRX) is compiled with the
> cross compiler instead of make's built-in default. The override is
> guarded by ifeq ($(LLVM)$(CC),cc).
> 
> [Severity: Low]
> 
> Should this carry a Fixes: tag?  git blame on the baseline attributes the
> whole probe block, including the ifeq ($(HAS_IOURING_ZCRX),y) gating, to
> f81171fecd0c3 ("selftests: hw-net: auto-disable building the iouring C
> code").  Since no CC is set before the probe in this Makefile, in
> tools/testing/selftests/Makefile, or in lib.mk, that commit is where the
> probe started evaluating with the built-in CC=cc in cross builds:
> 
>   Fixes: f81171fecd0c3 ("selftests: hw-net: auto-disable building the iouring C code")

Yeah but OTHO this never worked, and apparently was never tested before.

> 
> On the changelog wording:
> 
>> The CC value used for the io_uring library check defaults to the host
>> compiler, which will fail in cross-compiling environments.

I'll reword yeah...

[...]

> 
> Since the probe is expanded well before include ../../../lib.mk, would it
> be possible to mirror lib.mk's own CC derivation here, or to move the probe
> after lib.mk is included, so the gate always matches the compiler that
> builds iou-zcrx?

Well this is what I wanted to avoid :(

Let me reword the commit log for V2, Matthieu if that's OK I'll also keep your
R-b, as I'll leave the code as-is unless someone has any objection ?

Maxime
