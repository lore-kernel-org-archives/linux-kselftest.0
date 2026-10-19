Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792440817;
	b=WbQ2UlnHXIHcWc2M4U+cJlobAQva5jW64JG6+DYIeaq0c9dAguUrFCxzdzR6i3k9emwB
	 Rh60xiGKYU/PzGDKjCVT4ILaBbbJotHSEv1y9UZg40KEAtsvGqfa9wV31w9nvvpqyGVFF
	 4D4S1A3CDnOEVxwukhj9Vi7vZbGcOezabj3sb+MSlqgT3V2X6QMr3cn8O+f/BagYQLVsw
	 /R/JGgDDdc7baUxDL7a6/LMLNi9VW2FyYx8RCRl52k17ZdghfzidmAgkRxzGWjwVfzX0G
	 CJDku1PatEazcuF+YKcUAGUeh+7UPtN91cqMu1avu09txajfrzj7w2B0Er2GP9yPNyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792440817;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
	bh=UmLvI9mU/knn1IKKzwxAJ1414ElMF+G8scSYn1obsAE=;
	b=TRmCP3PKzxyHp4Ong01yZ1eDFM/B0Dk49I8WiSLU1ZCCTTdOJwi4s8hfzNoxuX9UQ3Ie
	 RSZAFEK/s3OghPefHfg/SoRGrm/fCiJ0pltjUwyky8HOLWaI3nBOWtU7UIy4wbvo7KzAE
	 xmpB7gyg1RC7q/eIeyoqhbcbL7gGnkXjXt+sFTTCjdR0wjezQORugsXCm/Zam+mb+eLOD
	 X4zg9SkbkfJtnvq4k9PPFyVWFOk1Sgnv2c/8daR7//Ppl9haZ4zXFrpkV3hx9FeEjePY/
	 DsJOZYaw4RZZKTtZQm/KPkvYqXjUpM2z6qYmiFQLe/IMrfRku4yyxXAcbL96tp+ATig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="nw/z/tSx";
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE03606A32E;
	Mon, 19 Oct 2026 20:13:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAE03606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=nw/z/tSx
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 541C74E4127B;
	Mon, 19 Oct 2026 20:13:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 276F460582;
	Mon, 19 Oct 2026 20:13:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9188210328C22;
	Mon, 19 Oct 2026 22:13:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792440814; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=UmLvI9mU/knn1IKKzwxAJ1414ElMF+G8scSYn1obsAE=;
	b=nw/z/tSxxz/ymrUXlw7ytwYdCJH6TxBGodUA8LfL1kQejlDk8IrrF/eXWHoNH/61uNDqup
	na6DZ2B5oMOCMLXsvCzP67IXfSSw45uELKkl4RownbnL1l5xbPXkHvVnhEICsVrSx+TZ18
	PziLAFYKVOhsjps3645NMz/U/MGAhCf5QpevmSQvTCuHRELZ3vHRr987PMG8wnqBO+hjQB
	DABliIfp39v01RmsnffsGrBCBYkjx4zv1v2+Q66+sZ1iINqgHlnV8N68byRUGe7CyINW/+
	k79I2WHOyloC5pqOJKXJVZBlgmjyzbvyJWePgE9D8e7K0YH60pm0aH49u1ouTA==
Date: Mon, 19 Oct 2026 22:13:33 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Shuah Khan <shuah@kernel.org>, Wake Liu <wakel@google.com>
Cc: linux-kselftest@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] selftests: rtc: fix flaky date_read_loop test
Message-ID: <179244056634.104236.8068913442860813306.b4-ty@b4>
References: <20260929152212.2092062-1-wakel@google.com>
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
In-Reply-To: <20260929152212.2092062-1-wakel@google.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 29 Sep 2026 15:22:12 +0000, Wake Liu wrote:
> The test case rtc.date_read_loop in rtctest.c fails intermittently because
> it checks that the RTC time does not advance by more than 1 second per loop
> iteration. However, the loop sleeps for 11ms via nanosleep(), and if the
> test thread is descheduled by the OS scheduler (e.g., under heavy system
> load in a VM), more than 1 second can elapse between consecutive RTC reads.
> This causes the next RTC time read to be 2 or more seconds ahead of the
> previous read, triggering a test assertion failure.
> 
> [...]

Applied, thanks!

[1/1] selftests: rtc: fix flaky date_read_loop test
      https://git.kernel.org/abelloni/c/82e7babfb39f

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
