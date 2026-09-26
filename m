Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9773354705B;
	Sat, 26 Sep 2026 00:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790381516; cv=none; b=P8qurSiw9YD/ox+kRSBjB2hNjH25eQ0iQv45eXZAX0uOawi47nuj6jFLCm0VOHXZY9gtaAxzYE2utfoGv1JiuZGZfcMN+SwJxA8IlnrvfAxUSvYHRwk0i/p3kzFFOZ5CoLOg/q3nI3LLKyWxKpUavHX/TEYDPEdJD2MKpgfh10E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790381516; c=relaxed/simple;
	bh=XdpWbtPg1LbZY2T6AFj0I/Lxq26jRDW62tmupVdd9y8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uarRl620io93aLPa6b9R/bMDL7wXEJzhItkf3MYXRaRNUxrJvk4G5fwZPXr48PV7maUv2gza5yZh1XTeQcvLn+VkTDjTriKCGgZpP275u9KSsEkCm3+sP4SzHYmOj1iM145kUqhu/qLVy5uZvFvB3xSO9EWLPq/utaQvMJdZD+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dOIgz05U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dOIgz05U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E12921F00893;
	Sat, 26 Sep 2026 00:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790381515;
	bh=nKzAF51FfS702o9KmJaCXqVAau4IjF0573r6WA2oydA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=dOIgz05UV27doHFeu6NP9jsQpkTi9ZfcG0ck3h/9G5Z3JGgPs+wiLG1q+X5f3iHgC
	 bfrSuGh2cdUfc9QMEOokSuzrB+K6bzPKjZcPahvyTD8Z1zXSN7xZSEd3ZzQq5IuVdA
	 Zkawn7zKbSDn4Up3N5V634kCzVYSfMExcNXFWwUDXM6ot2LUQxo83ZmdFlcbPaEHeJ
	 hLJUjt0yHKh1IBdighOPFzRwCaqrdJZwNrMAtbPirZ/qSjWdN3UVyDg+4MjrE7t400
	 oZImKdFgNRJQx/uC/pJjbUbfLVg5OJkTe8Ohbrg6jF0hov/9PuFtv8PME6EIHueCbt
	 HNjUAiX9eA0pw==
Date: Fri, 25 Sep 2026 17:11:54 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] selftests: netdevsim: skip the rate tc-bw check without
 tool support
Message-ID: <20260925171154.79c372fc@kernel.org>
In-Reply-To: <20260925135512.3644101-1-eva.kurchatova@virtuozzo.com>
References: <20260925135512.3644101-1-eva.kurchatova@virtuozzo.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 25 Sep 2026 16:55:01 +0300 Eva Kurchatova wrote:
> The tc-bw attribute was added to devlink in iproute2 6.17, together
> with the kernel side in v6.17. An older devlink has no such option and
> the rate test fails on "Unknown option" instead of skipping.
> 
> Probe once in rate_test() and skip the tc-bw checks as a whole, so that
> a missing option costs a single skip line rather than one per rate
> object.

Maintaining backward compat for tests is not a goal for us.
Teach your testing hardness to do this automatically, or carry your own
fixes.
-- 
pw-bot: reject
