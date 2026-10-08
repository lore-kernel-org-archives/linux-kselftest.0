Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E3E23ED60;
	Thu,  8 Oct 2026 02:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791425519; cv=none; b=FvayIv+xtR4XXkqjb8sEsrxZvd3AJa7VUaoNqmR8/TR0Bk4jg7aD1tosz6Xk+KOTqioF6TX0YmbKKu8NWVcE8IyQuPK7wlv8dYG7LLquzaEZvpZAzvOz8DeK2JAVGYJN4ILxR0BTs61mixmGZjKK0ksNvlmmEwHqvswHa1cxppM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791425519; c=relaxed/simple;
	bh=dwHZ+zl8f8S1pCPSvYKAqLhAGM8j4M+6vY4lhGl3BQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lcsCQB8nrGUmyXjeVj5MvOEgxIArRWezVFhcX/YMFWBZsy4W78TezsZRivqNCuFEH9IsHq/UqraijxlomNOO64ze0ueEH191cDSpoixpoejRhPcbl1fxtuinndxi1cTUAC9PUJHQaR/cm1r9d+ciCLllb8xqlYII6Zgitrb21MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PFnpiqbw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PFnpiqbw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF3A1F000FF;
	Thu,  8 Oct 2026 02:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791425518;
	bh=hC1mQXi1Vh4HTeCnZZQKB24ijAQWGz5zdCkOZPsfHw8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=PFnpiqbw4DDye1XR95b4EffWLDyZzVoquqgD9JO3oz1IFukqcAXkU+BxbWR8CKT1R
	 NWrbxgCbKTzyTjFJ713cojImo0BYGvjVlabJfFJCARyYBYxTHYfnm3q4hmMDvTmL8I
	 q3V+kr89GcjCqwkBI0dL4tdPsgxxjouSzM2lCi1jvu5MJqUMtb+PJrHtZqWd4qO318
	 UsEYBMqEMDFYUrigqHCMsGMbpBX+Hyw9fPKo6slWSM3LkuE3+s8R8SCwXkBQwd+Px8
	 Q4PVK/dOtGW1K8Ms2Z8gD2xAW5ss8xWbrnNC+psXRNRp6Obb8y+Y7BRNokCWEZl9DI
	 3U8+VgRTLB+Tw==
Date: Wed, 7 Oct 2026 19:11:57 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Jeremy Kerr <jk@codeconstruct.com.au>, Matt Johnston
 <matt@codeconstruct.com.au>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, netdev@vger.kernel.org, Geert Uytterhoeven
 <geert@linux-m68k.org>, Brendan Higgins <brendan.higgins@linux.dev>, David
 Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3] net: mctp: Make flow KUnit coverage an
 explicit opt-in
Message-ID: <20261007191157.0fd327ba@kernel.org>
In-Reply-To: <20261002212058.25117-1-kmehltretter@gmail.com>
References: <20261002212058.25117-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  2 Oct 2026 23:20:58 +0200 Karl Mehltretter wrote:
> MCTP_TEST selects MCTP_FLOWS, so KUNIT_ALL_TESTS builds flow support and
> SKB_EXTENSIONS even when no transport needs them. KUnit's style guide
> says tests should not select otherwise unused functionality. The CRC
> and crypto library tests use explicit ENABLE_ALL_FOR_KUNIT options for
> full coverage.
> 
> Remove the selection from MCTP_TEST. The core suite remains available
> without flows; its two flow cases use their existing skip paths. Add
> MCTP_ENABLE_ALL_FOR_KUNIT to opt into full coverage, and enable it in
> all_tests.config and a dedicated net/mctp/.kunitconfig. Both profiles
> run the flow cases without a hardware transport.
> 
> A plain MCTP_TEST=y configuration without the opt-in now skips those
> two cases. This is the coverage cost of leaving otherwise unused flow
> support disabled.
> 
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> Changes in v3:
> - Keep the core suite available without MCTP_FLOWS; a plain MCTP_TEST=y
>   configuration now skips only the two flow cases.
> - Add MCTP_ENABLE_ALL_FOR_KUNIT to retain full coverage in
>   all_tests.config and a focused net/mctp/.kunitconfig.
> - Drop the Fixes tag because this changes test configuration rather
>   than fixing a runtime MCTP bug.
> 
> v2: https://lore.kernel.org/r/20260928205352.30502-1-kmehltretter@gmail.com/
> v1: https://lore.kernel.org/r/20260925192510.93840-1-kmehltretter@gmail.com/
> 
> Validation: The MCTP KUnit suites were built with GCC 15.2 and booted
> under QEMU 10.2.1 on an isolated source export from net-next
> 014d795c7383, with the changed Kconfig files copied from 071876fd5048.
> Without the opt-in, mctp-sock passed 5/5 tests and mctp-route passed
> 21/23 tests with two expected flow-case skips. With the opt-in, both
> suites passed all 5 and 23 tests, respectively. On the full
> 071876fd5048 tree, the new net/mctp/.kunitconfig resolves all requested
> symbols and selects MCTP_FLOWS and SKB_EXTENSIONS.

I don't think this is worth applying
-- 
pw-bot: reject
