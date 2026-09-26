Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2682037F74B;
	Sat, 26 Sep 2026 16:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790441670; cv=none; b=r+aUP/5li4YgD15l3sf4qNKCA0RwizjwOP0SWboDi4i40GwAE/txRE9YVh/k3QmSWtbmpPgHoYxP8ZbDwAlhOzT3qCBrzvQqfUWRBDHsviJQZcZlmZvfm6bo9lyqJ8rJGbD8URVv6sfq08ORfHvsvIwFX1Ze2Cn/bhNM32SetU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790441670; c=relaxed/simple;
	bh=5yB2zImz4Sjaoai9s+HN1xbqeohU8MxyMMiMUB1K0AA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rwAjCdgSW+xvOnHoPa1ldo+/veTuRoovJ1YD7ef6Bt4oThCBYwEmoww0pW1DgUJWSVAdHdkrWm8Bq8k1GIpwsFJxZl/p1/+Wk9wLLow2Clf7PMDJWaZNsI8EXUSb10RuNBxmBwfgcaWbPmOKtXDrC+Q2VR5bncVvNiVy9zAfHvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m0f/x+gC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m0f/x+gC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35BE81F000FF;
	Sat, 26 Sep 2026 16:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790441668;
	bh=b3HUZ5BVeVdit3FZ6xzv6uN529jgXrNqbDf+GQGdQXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m0f/x+gCL+kd/E+m1f+sw+/ngwsY4Us6VHsw1ml78jiJeM/CikgmCvF6LsAmCJlMk
	 wPwVkg8hsoD2HpZQNUlI0Q7udrQPPyfRxfY5oALg52VJ2iYbfAMQFySFtj2HtXPo6O
	 0UFlzdBuPoqkjyli3lO4lqvxI0uLCavi2P4Yw3S1EvRgFKcYAt6JfnhWj5vPGWeyWa
	 c9SKrqJiSEQLr71+gUk33Yer0PgUMmy6lP7+jO5os6ir7DoaLXAx5N5VZRZbIM23Js
	 pM/e/zSdmRR2OAwlVbZARClR2g0op5TLc/d1VEws8PCbQOcv+A42WEhnUu2xwxTy8s
	 CGzmoyaTpwbdg==
Date: Sat, 26 Sep 2026 17:54:24 +0100
From: Simon Horman <horms@kernel.org>
To: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
Cc: David Heidelberg <david@ixit.cz>, Bongsu Jeon <bongsu.jeon@samsung.com>,
	Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, oe-linux-nfc@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] selftests/nci: skip when the virtual NCI device is absent
Message-ID: <20260926165424.GY13925@horms.kernel.org>
References: <20260925134232.3638500-1-eva.kurchatova@virtuozzo.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925134232.3638500-1-eva.kurchatova@virtuozzo.com>

On Fri, Sep 25, 2026 at 04:41:59PM +0300, Eva Kurchatova wrote:
> All 8 tests fail in setup without CONFIG_NFC_VIRTUAL_NCI.
> 
> Skip only when the device node is missing, so that a real open()
> failure, EPERM or EBUSY, still fails the test instead of being
> reported as a skip.
> 
> Signed-off-by: Eva Kurchatova <eva.kurchatova@virtuozzo.com>

Hi Eva,

I expect that tests are expected to run with tools/testing/selftests/nci/config
Which has CONFIG_NFC_VIRTUAL_NCI set.

So, as per Jakub's comment's elsewhere [1], this seems like another case where
either the environment should be updated or a local patch carried.

[1] Re: [PATCH] selftests: netdevsim: skip the rate tc-bw check without tool support
    https://lore.kernel.org/netdev/20260925171154.79c372fc@kernel.org/

-- 
pw-bot: reject
