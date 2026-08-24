Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8B0415F1D;
	Mon, 24 Aug 2026 12:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787575437; cv=none; b=lkA/qtRAcwqaT78S3saAbGmHPAbbvjZE+mllmAOSlnKV/iJESixhoP6qtTjXVSEzUBjsqY8QCbs1nbiQo+Lopt5eG0hdNrVJHfKzcDSxqpoHc+OoDUyO7MlZy/K0ifNzT0fFB2vJVdOdpuEyGVfqNlNS+vL2LdY2j1oWo2NbdIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787575437; c=relaxed/simple;
	bh=1ywALngvv3juxFYqYn4XUHlgD+gz+wRhVexjC7ai+Jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dRoRJ2vEcs8YK+rLPmke5EBKy39odfmF7tlXZvCXBqNVEHxAFNC3wjAKwncQ1eVJ1lVjEHZys1d+4jqKwzRLr4ZNxVwA9psEwxvXUHj7LcS4F0LNA8tiskE6BBdtw8ZhuQqTvwFTNq79ZVBE65Rjx5NP03vdzoZM8qFEki4JNeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HncPRFJ4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HncPRFJ4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 048BB1F000E9;
	Mon, 24 Aug 2026 12:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787575436;
	bh=JVKcrYAvjhWufbWjQatO2G3w6YhI07+cbPCkgdtA/6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HncPRFJ4b/oaaaU9ZxRd0/jlgJsvcBMKCa2yVDCvOVtySpygH090wIXnlmvpFxKCC
	 87dOQA9eE5lNSK4M01DYZP+ZaUJlga5HtRNZcRxXhjV2m5inD9e9mH7lhS3xqNY4DM
	 eDmpUVi4k9+33htqYpXor4SDZFAlOJ7KxXmxKFkpwxtXcoz2H1yuooASSG/5Uth5iT
	 25HGFd4BkjdvNGieV7TSBEN1kDmYzMT85oTzhYa1a7LZwbt47gN/vw9OITZ+5+MOFj
	 H9J3XrtOZ8YhzVWza28BZJPFx7tAL1jPPzclFD0j3ydvi4ueNCe/YKj83YC+20f5//
	 flbS365VtH7Sg==
Date: Mon, 24 Aug 2026 13:43:51 +0100
From: Simon Horman <horms@kernel.org>
To: Qingshuang Fu <fffsqian@163.com>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, SeongJae Park <sjpark@amazon.de>,
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qingshuang Fu <fuqingshuang@kylinos.cn>
Subject: Re: [PATCH net v2 0/2] selftests/net: fixes for fin_ack_lat
Message-ID: <20260824124351.GS265046@horms.kernel.org>
References: <20260821030922.1123754-1-fffsqian@163.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821030922.1123754-1-fffsqian@163.com>

On Fri, Aug 21, 2026 at 11:09:20AM +0800, Qingshuang Fu wrote:
> From: Qingshuang Fu <fuqingshuang@kylinos.cn>
> 
> This series fixes two bugs in the fin_ack_lat self-test.
> 
> Patch 1 fixes the swapped kill() arguments in sig_handler(), so the
> server actually forwards SIGTERM to the client.  It also makes the
> wrapper script's cleanup tolerant of ESRCH, since the client may now
> exit before the kill command reaches its PID.
> 
> Patch 2 adds a missing fork() error check: on failure the code falls
> into server()'s infinite accept loop, producing empty output that the
> wrapper script treats as a passing test.
> 
> Qingshuang Fu (2):
>   selftests/net: fix kill() argument order and wrapper cleanup in fin_ack_lat
>   selftests/net: check fork() return value in fin_ack_lat
> 
>  tools/testing/selftests/net/fin_ack_lat.c  | 5 +++-
>  tools/testing/selftests/net/fin_ack_lat.sh | 2 +-
>  2 files changed, 5 insertions(+), 2 deletions(-)
> ---
> v1: https://lore.kernel.org/all/20260817091017.281104-1-fffsqian@163.com/
> 
> v2:
> - Split into two patches
> - Add shell cleanup tolerance for ESRCH per Sashiko-AI review
> - Add missing fork() error check per Sashiko-AI review

Thanks for the updates.

For the series:
Reviewed-by: Simon Horman <horms@kernel.org>

