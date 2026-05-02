Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BC440DFA0;
	Sat,  2 May 2026 00:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777682743; cv=none; b=Y7PYs0X2TobtvnEWgI+h0ig1hy/krgghIojWcDLbWB7cFbgci0hjBT7ptzfVJwhqhrhmXzCEJfsln95tn9i90YAL2f5H226raZlpOrq1hN0UCNSsZwWv+9XfNp1utc0vnp9P9Y832vreUe1t/HlH3MubiRTGAEDr5q8qQmCmjYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777682743; c=relaxed/simple;
	bh=2bVyOlG8DIIcdk2f1Ny3W3YiMVFlBFhBI1XAed3eLKE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ya1R/3W+vnvTUgUsxiLtG5TY+YY8KVgHzbhjo3BRvNAc/jmkNKNP50NkcozJIj1P4lIePNRXB+jl7wstEILP00EhcjEq753WbAej+zodl+cEhYv0Xn5BKKS+P8Muj0Iy8brxEubTmikLHusW8OkHTrf1G4Ols6a5RGvDS10dbb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MjI+RAru; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MjI+RAru"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F0E3C2BCB4;
	Sat,  2 May 2026 00:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777682742;
	bh=2bVyOlG8DIIcdk2f1Ny3W3YiMVFlBFhBI1XAed3eLKE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MjI+RAru2LMTZkN3fARRyNW3ryR1auKn/XqBrLyJvhN7neIeB5IZPClHx7kJtSdPJ
	 sRUvBdRxjkaXAmUzSSRx4qh5iIwrLZDtLCqSXzobYKa65sK19/UAgk9MTv55594078
	 STvOP7zICOgnv7Kmpdqm58QvHWmx7uwGDpvvwaXdwmSnQj47+BhFGHhgCtlhfYJCgb
	 Y0ZY3+zsz6KN5tFZrM0eSAvBAUAF/qaCmdGYQmPkWQnC+o05gV74WUOCqZW7vAUQzF
	 dvEvisQQAn3oX8GepGZl3tBbJNJN/buQUbdJssP1pRB+U+SR52+fCC+yYGYV/8HksA
	 4hPQPgTQoy45g==
Date: Fri, 1 May 2026 17:45:41 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, horms@kernel.org, linux-kselftest@vger.kernel.org,
 shuah@kernel.org, Willem de Bruijn <willemb@google.com>
Subject: Re: [PATCH net-next v6 3/3] selftests: drv-net: convert so_txtime
 to drv-net
Message-ID: <20260501174541.0338ad0e@kernel.org>
In-Reply-To: <20260430132820.1944517-4-willemdebruijn.kernel@gmail.com>
References: <20260430132820.1944517-1-willemdebruijn.kernel@gmail.com>
	<20260430132820.1944517-4-willemdebruijn.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 30 Apr 2026 09:28:06 -0400 Willem de Bruijn wrote:
> From: Willem de Bruijn <willemb@google.com>
> 
> In preparation for extending to pacing hardware offload, convert the
> so_txtime.sh test to a drv-net test that can be run against netdevsim
> and real hardware.
> 
> Also update so_txtime.c to not exit on first failure, but run to
> completion and report exit code there. This helps with debugging
> unexpected results, especially when processing multiple packets,
> as happens in the "reverse_order" testcase.

Reviewed-by: Jakub Kicinski <kuba@kernel.org>
