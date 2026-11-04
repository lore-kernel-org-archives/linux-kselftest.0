Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793831953;
	b=I5u8PBXQiBR57oBzwWmOPdJhOC79DirkeH15yWa0ATNAtwKsbM+/unp3IXFoWyv/+CsW
	 p7DonUQs/PF40tw6V+mmA/YOChKv7qq6rAr4ThONwneYiMGiINACqR4MvpCCEER0W2M/T
	 kRBP6cCuN0XOOrCxggCYHKJIMetiU/CJEu8hcQ3MlqSkR6wVGuWroFUz2i8LGl+lUEfZS
	 D33oxOQmwnWsdltk6oOpqN4CPeVW5Faiy7IA6ZErbaGDwQWuBr+Ad+LPDtP//6pUPyCYd
	 N5CSzbYcraNhZTre0Ie6Q6wKr3sOQz2O6LrCzAZgOEPtwT/1oEY0QncCzHlucsboG6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793831953;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=bAsyixqVf5xWEDwVzg2o2S4wu7/wLVmjvNltYGASE08=;
	b=wkOijo8BGY9quHK6vFmFRPhXTDjIwlbOcFupMAmGQX04B3i8Ymeekj3nTOpJVc3aNKCX
	 6cVPnFqBzLEzKNZ6XzLMnIBo2Ry8IO6eWlXr645KKO4WPxo91hFu+BXUZmM7Dht66ki5V
	 o7HR0pQuh0grT/3MZu9gu5O45/ZIW+IpolEL3k58FGsY6MMcPWtgpDGtnvFjHf8NJR97o
	 VkyN3cJUaerKHiisejJiIIlG2TQ8kFCC4WTuWrgL39zixfp1wev/NBb+ZE0WNfnayxk0M
	 inPLMg7EqnpTgVjlbp15ofJNitTVixN6oaxe0CR6DiZPatInHY9Y6cO0+lRCl5SEDUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jy3tQ1zi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B04606A333;
	Wed,  4 Nov 2026 22:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jy3tQ1zi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF9621F000C1;
	Wed,  4 Nov 2026 22:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793831953;
	bh=bAsyixqVf5xWEDwVzg2o2S4wu7/wLVmjvNltYGASE08=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Jy3tQ1zivWfS5oPDiVdTObMeS0UbhgEzoBguaBTjDMhdXUzbv9g6pRCIrJRntQlGa
	 XWKjdeSgAL5XqfQNg30hIXgoth1hViYG9IuUo1sOz7zustNQOCPwkrh8QYHs0s0grm
	 UivmjrGzw2Jdk8C/cKOahFUxXFjvMAqlFoIm+8fgCV+hdyq915iskhT6t0YT6OedOZ
	 alfPoBt/9DhMV2FQJ9Hu+Pqcua8dfGQNCNHY8SeCAIX8/myfUOvWf2mTQkc1n4wmwx
	 0UPNz80HCoP6d9LY05NofvI6yrEmCRIt3U2edIYhnFj9PY+20q6qMQGHcqSkgyz0um
	 AUnVeCU+8OXMQ==
From: Sasha Levin <sashal@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Shuah Khan <shuah@kernel.org>,
	Aleksei Oladko <aleksey.oladko@virtuozzo.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/prctl: select the tests by ARCH alone
Date: Wed,  4 Nov 2026 17:39:11 -0500
Message-ID: <20261104223911.857140-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104120859.28099ada5f1dbce682cb6267@linux-foundation.org>
References: <20261104193639.333186-1-sashal@kernel.org> <20261104120859.28099ada5f1dbce682cb6267@linux-foundation.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, Nov 04, 2026 at 12:08:59PM -0800, Andrew Morton wrote:
> Rather than continuing to make this selftest x86-only, wouldn't it be
> better to fix things up so the other architectures also benefit?
>
> In fact someone proposed doing that just last month.  Oh, it was you ;)
>
> 	https://lore.kernel.org/20261014200127.1363472-1-sashal@kernel.org
>
> what happened to that?

Right now I'm focusing on making our tests "pass", that is, not fail
horribly on non-x86 platforms that they were never designed for. At
the moment it's hard to tell whether anything actually failed, because
everything is red all the time, so my first priority is to get to a
state where we can detect real failures.

Once we're there we can start looking at enabling these tests on more
architectures, but it doesn't really make sense to do that before.

--
Thanks,
Sasha
