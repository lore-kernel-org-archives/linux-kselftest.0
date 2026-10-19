Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792441111;
	b=ijYwSdelnkGSBGyrSTqscGuQHa6lTRSKMmk8DOprJovng7Gm2VZu/eOMbvEc1CeDQhm0
	 ETEMlkVbJCx/vrCdnk+wdxbqmZjUNB1TiVL5vJVg6dLx29oODx8aPvhjIgpOqmdGEQOw7
	 biWSzwhQAux9dEHiUvymo3NlxYQY1Tc5zai4ZNh5LOVHV7DuKE9QZhQT7JrtdaeeNeZER
	 w7BdKFOMsQvxD80yg07dmIT6V7+QnEdyWP+F0ts4WkAiBzYiGZIgZz9qXUo5BekUqbVQY
	 dU2Q1ruBAJHssaLSVFxgRY75DrPDcHnxq4CvO1qBeb10g6LYLI024WGue3pRWsH3pAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792441111;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
	bh=MkqhDlCJTohBxctyl1gHARlF4BNJMbmsSdvBSP2tGiA=;
	b=GOyuBd0ops8O58bz6Il0dBvv6YbobVpo5Lwj/3aNZmtzFUEpSZpN6+sXIaOA6QLUZLTq
	 ZRPESjJv9/jdJq1o7w9NGxOb4vsbZ0uknUnN9J1av8ScKryWu8VEfRvJ1J1T/YCc32NNl
	 Uebql1DpzUtagV2DbpOcKXuObebA0JB272hZCtmR1mhFJYVd/SgF6mhfzI3OvvLN9cxge
	 8UojsW//ne6EyYl1pPDfru2D9wL6jf/Yl8JVPNqDXgCaKd9TF7afpQxiK+pLcMJgJF7cG
	 0BGhTMqmoi7o0ctl7cJC8Inl7FRuFisf5Q8FZWx5YjzRBj2x6aXdl9UiEswwI+RDCGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Q9uQgvZn;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44419606A319
	for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 20:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44419606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Q9uQgvZn
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A69451A1235;
	Mon, 19 Oct 2026 20:18:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 63C5760582;
	Mon, 19 Oct 2026 20:18:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 170C510328D6E;
	Mon, 19 Oct 2026 22:18:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792441102; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=MkqhDlCJTohBxctyl1gHARlF4BNJMbmsSdvBSP2tGiA=;
	b=Q9uQgvZn/cxWkImLYfGBZjJd1bVc8WGEP/o5eoVhw0fj53CBIKpDpXEoox6TbxCWAhSiN0
	gBjRNK+r7WFw9pF2xCE3JVepca/vAXtqWBkvyDZtKQkqqkQjpxIkub7rknPkBUR+rAK89z
	FQWYX2Z0Ah7lXl3IwC2W4w9F0AGZ7nbWO8IodobEBKiYQTonj+gOcBp2luy+raI0OYfmci
	Z8DCehzF4xKAbmvfmvaVJ5shUVgktRZT9PVMlGq4z358d1VRE1/VvUhN/pWvojzjLQ5I2R
	1SN+uuKSMuAy5POls0ZBsepVEwbj3HSqrHDmNR7RPO9eHjxKWdurkoMRCAlMmw==
Date: Mon, 19 Oct 2026 22:18:21 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>
Subject: Re: [PATCH 0/3] selftest: rtc: rtctest: improve handling of skipped
 tests
Message-ID: <179244109231.106899.15231964260310763850.b4-ty@b4>
References: <20260916213108.9234-5-wsa+renesas@sang-engineering.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916213108.9234-5-wsa+renesas@sang-engineering.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed, 16 Sep 2026 23:31:08 +0200, Wolfram Sang wrote:
> Here are some fixes for issues I found in 'rtctest' while checking RTC
> drivers. Details are in the patch descriptions. Patches 1+2 have been
> tested on HW. Patch 3 has not been tested, just follows the pattern of
> patch 2, but may need more discussion in general. Please read there.
> Looking forward to comments!
> 
> 
> [...]

Applied, thanks!

[1/3] selftest: rtc: rtctest: don't mention skipping twice
      https://git.kernel.org/abelloni/c/ec55c6e9c5cf
[2/3] selftest: rtc: rtctest: make missing UIEs really skip
      https://git.kernel.org/abelloni/c/7980352c78f5
[3/3] selftest: rtc: rtctest: skip properly if setting alarm fails
      https://git.kernel.org/abelloni/c/bd55831c0bfc

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
