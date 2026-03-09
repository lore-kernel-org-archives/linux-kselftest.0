Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC4C217659;
	Mon,  9 Mar 2026 09:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773049472; cv=none; b=j7OoEjtxeRnWNH+D50qYIoifuArFmN4tFx/oot0FLBa5zbV3/eO7SFs6IoCc6a6FFtYRKLk5BKIsIFQ8la/ZABNgCPw6caAbZ59QOsh60NL9QjabpVp1dGypnmetexo2yQSZIF7v3bFiadZKI+sFJ/40UXxGNLCbZd1JD6hBK+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773049472; c=relaxed/simple;
	bh=d4JPYcPcD4m8y83els63OMtGXXEhLqe4LG58g5ri42c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tatFrdYZEjX+oV8xTVI20MokcLzdSAmVr9ADfR6gDZbeuXrY7iiiefyk/LrL11VVCK3GO7KRve4dwJmH9u6s3T2Y/oiyAegvDe1nyvvV3MTcrRyZR7Nxr+MqDSmrijyV8g7/F8m+iiJjBAaFW9c9VVkBHupyCObec1VI6emA28o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Gtt0DM7v; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Gtt0DM7v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1773049468;
	bh=d4JPYcPcD4m8y83els63OMtGXXEhLqe4LG58g5ri42c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gtt0DM7vJBCozWR41sfKlwfqZqNnAPl7uN3F+YGqDQfk5IFs2HL7PDDOET5l8HcWd
	 ULccko2KzAi9SxB/98EGIPMSzfRXXaqHdDqHY53xKaQB4tHZ/RgfL9OxLQ51ujrh2v
	 M9rUHdtpjueWG1WJsExfgVQBEy4fl+EtFFqKV2Wg=
Date: Mon, 9 Mar 2026 10:44:27 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: shuah@kernel.org, linux-kselftest@vger.kernel.org, kees@kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/harness: harness-selftest: cover XFAIL_ADD
 ctor ordering
Message-ID: <cf8100c4-b746-49ce-a9d7-a89f93aa9c65@t-8ch.de>
References: <20260309093752.808533-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260309093752.808533-1-sun.jian.kdev@gmail.com>

Hi!

On 2026-03-09 17:37:52+0800, Sun Jian wrote:
> Add a fixture-based test with a single variant and mark it with
> XFAIL_ADD(). The test intentionally fails and is expected to be
> accounted as XFAIL, covering the constructor ordering dependency
> between TEST_F() registration and XFAIL_ADD() registration.
> 
> Suggested-by: Thomas Weißschuh <thomas@t-8ch.de>

I used my wrong email address for this.
Could you switch it to:
Thomas Weißschuh <linux@weissschuh.net>

> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> ---
>  .../kselftest_harness/harness-selftest.c      | 23 +++++++++++++++++++

Also update harness-selftest.expected with the new output. To verify
that everything works, run 'make run_tests' from the test directory.

>  1 file changed, 23 insertions(+)

(...)
