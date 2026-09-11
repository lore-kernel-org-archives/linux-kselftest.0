Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C9A3BE643;
	Fri, 11 Sep 2026 23:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789168095; cv=none; b=rpyR98X78/HXr9TsMMxnp3vnpNZgGkl+uhCgApc0161PAdFLOK0Xo2Rp2ANlGGHD5nJCB7hDsnm+JEsLSS6VOcNDernBozVwOuWPCGGxeHlW2SDlLWVr9VD3c3mCMwVQVRbDRCm6tail9e/58EAqBPnjukt3zJ7THvEkqOBtpI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789168095; c=relaxed/simple;
	bh=/PwjuMvcSZ0fhPtTH12Ek1tQKVNRKC0iZDzLO91hAS4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UTxlHubh4E+IlOoXVZ4GNoC4aDy+Y42NEVmt81ktYD43XhNX1I9mfPMzN5rsHpWcLMGaAJ3VnGy8BuvhGyatpZdeeO+ppv0X6wVUZaL1I9RIUQWT2P6OlJW8dT+162pkCfsR0v/ts4DWDTLxGoL8RobAZaYJQYBstsFtRKInj0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WN/+fiq+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WN/+fiq+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426961F000FF;
	Fri, 11 Sep 2026 23:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789168093;
	bh=a1Bc2O8PyWz0OyZmMUEMy1c+IMjD9Lmiy7MHPqTb8pc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=WN/+fiq+NfN2TgjTImeR5jnqaYpEchf9aH7kuH3kSHj9WCdNxkgcIirwXXp1tXxiJ
	 Rygx/Hx2uKTlCcOX8WmbRZ1jHtRSjf9udjJA2rWlCtNFXYzooPoBZCVoAng1CJ7gta
	 zw7s9l5C3waLY2ritWse4K4v9TG9nCDdjA6R0++wvgHQDDkBiWDbCscOkwBEhZVQVu
	 LK7dlXysKF9kMxf8+dhP6QEZPqxN+o31txpzMFG5efjV9qrnOGZrvuI8w1smftYRX2
	 7C5tKS7M1ndgpNTd12hJHrMyARbzsXie6KSqd7/2Eajzfac/10HY8V2kei9fttk866
	 kDXxPTuGaWzqQ==
Date: Fri, 11 Sep 2026 16:08:12 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, David Ahern
 <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, Andrea Mayer
 <andrea.mayer@uniroma2.it>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Hangbin Liu
 <liuhangbin@kylinos.cn>
Subject: Re: [PATCH net-next v2] selftests: net: move log_test to lib file
 and remove duplicate code
Message-ID: <20260911160812.3aaed4f9@kernel.org>
In-Reply-To: <aqN2K7rAm-S6QI86@fedora>
References: <20260831-self_log_test-v2-1-eda2e8490cf9@kylinos.cn>
	<aqN2K7rAm-S6QI86@fedora>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 11 Sep 2026 11:31:55 +0800 Hangbin Liu wrote:
> Hi everyone,
> 
> This patch is a bit too long for review, and maybe cause conflicts for
> stable backports. I plan to split it into small frags. But there are 2
> ways to split it.
> 
> 1. Split based on the test name. e.g. srv6 part, fib part, test_* part, and
>    others.
> 2. Split based on the changes. e.g. group the tests that using exactly same
>    log_test functions into one patch.
> 
> Does anyone has any suggestion?

I don't think it makes sense to split this.
