Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCCF43C05F
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 08:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769374; cv=none; b=Xd/v13gmFhUco7LK+kMbe0X2xwOw7UTsFT5pTj/5lgzLyRbpM3A0gdQ0dvvxnlojMTeABVbTd0L1aGiBPhI+APUAqZWLR62Z5tr+JDfHhdd9yafvh9SPnVA9rt+4cyHVvGvjlx57OkqhNJB/VmgEa/eZw0NOmU9qPCRWJ7P1NFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769374; c=relaxed/simple;
	bh=KU55nb/L8hOqLp+NhbwKS2WcnkIPg95D/pO/pEcv+Wk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gT0O/nD3KtigqpIyXwzTKyIP0x4syLci9Na3zvJwGooYNO2CxwYMeKJEd5zqOf5Mu5y2PW2BEUDGBBMdulx+IwsZE3hKSN3p8gqeOyaEllUmYynacEIW6aPViRaMeMOqAMUuqj0mGugZbGi//vNfjKH+afDvRfpMoGz+F2atNxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OV64HFnQ; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OV64HFnQ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E32D24E4155F;
	Mon,  7 Sep 2026 08:22:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B53C760383;
	Mon,  7 Sep 2026 08:22:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7972B11C7AF0F;
	Mon,  7 Sep 2026 10:22:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788769369; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=jPR05otjLbJCGaV5jK++Qw2cQ++1iAzWzFPIrf0FWbA=;
	b=OV64HFnQQIlF4DJx4ciaxPzStUeiTodewTSwQgGqTeQl/CiAFbDV9dbosp3aMQVFB4FzY4
	SyE6SKf1A4GEV5vjD0XlHslnQrMeMNdbx+lo5/xaVSfRDy0INFOa2lYDMDpW5hNWv4qtBB
	ZAEX8+zFiUZPx7d7aSm+26KEpSLZicGzzqh69cqn01H/6Hu4ivYisUdoeoJKd0pE5eEFab
	7M+eDxRy0Ubmtv3cKnlnEGLLW+cvZBC6CZpq23/Hueo2A7f879BMMMcga+dWwzl3PI2kqs
	zXyaqK3KXfFCTs1jhIUFWC5ulSfAGjSJRXrrywvO9ABV3GPdSptTSXzvrwt8BA==
Message-ID: <d1928f33-23ca-46cd-af71-1f3cdc55bf96@bootlin.com>
Date: Mon, 7 Sep 2026 10:22:45 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 1/2] tools: ynl: Allow cross-compiling ynl and
 associated tools
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, donald.hunter@gmail.com,
 horms@kernel.org, shuah@kernel.org, matttbe@kernel.org, sdf@fomichev.me,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-kselftest@vger.kernel.org
References: <20260903155524.2241065-2-maxime.chevallier@bootlin.com>
 <178870681916.219967.14635919564673520317@kernel.org>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <178870681916.219967.14635919564673520317@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 9/6/26 17:00, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider:
> 
> Critical: 0 · High: 0 · Medium: 2 · Low: 1

[...]

> [Severity: Medium]
> Should the new include come before Makefile.arch rather than after it?

This looks like a legit point

[...]

> [Severity: Medium]
> The commit message says the change accounts for "the cross-compiling options
> such as CROSS_COMPILE or the LLVM-specific variables". Does this also cover
> the documented LLVM form described in Documentation/kbuild/llvm.rst, that is
> make LLVM=1 ARCH=<arch> with no CROSS_COMPILE?

I'll update the commit log to document the limitation

[...]

> [Severity: Low]
> This isn't a bug, but now that Makefile.include is pulled in here, the
> existing Q assignment later in this same file disagrees with it:

Also legit as well.

So, I'll swap the Makefile.arch and Makefile.include inclusions, document in
the commit log that we don't deal with LLVM + no CROSS_COMPILE, and drop the

Q = @

line in ynltool/Makefile.

Matthieu, are you OK with me keeping your review tag with the above changes,
or do I drop it and resend for you to re-review ?

Maxime
