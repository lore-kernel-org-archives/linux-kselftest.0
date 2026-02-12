Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6576E35CB8C;
	Thu, 12 Feb 2026 15:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770908494; cv=none; b=dbh6shPgcYJOXFA+kBaEjqya1OKIszk65XDtAPCNV68qf7HFpJoz1nvObpUJGN+xOjZOYBSruSQoqcJXpglmuF6O/UdkdW2NqmkXckNmve4yW6F9dOUAG6806ZQAmjVJjR1At7BayP170NKyygWiDjHCzt8LgmdCv4D1YBgNaEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770908494; c=relaxed/simple;
	bh=Kb982x1GUO7vXVuKBOhiQzpM4sv3ErXgtaGOIxfCrX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rEvLxwUslKOQlS+w5be4Eko0bPmLd9pe3yta/P5KqscLLHoYimemCvC4ie/fu2guHJDvCmM0Q7u7yAVIu/cjJUDz4pIOYehECzcRucxfRsa5xoXKNoHkW6qJffRakmG83ruHEXCzOmp7H/9iiIPav1BnnMKvLyh53/Xz/NzNEQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cqeu9frs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cqeu9frs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6EFFC4CEF7;
	Thu, 12 Feb 2026 15:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770908494;
	bh=Kb982x1GUO7vXVuKBOhiQzpM4sv3ErXgtaGOIxfCrX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cqeu9frsvPkfQERhH/YwdTJRxR/6s8PpYCpGVxuDA9wWSZbaDxAmwpXRuTkXqaTMQ
	 g0/q/HaWB1cBpwp6Ym0p234e3YvjvMdsRbwjLR6gMTB9dzy6eP4/owZcctGycQedSZ
	 Epmu2O1VNoFs9PeANmdLZvIIDXecMhnXBGyvWW8Aw/jqRHl8pDvbGdJacaIDku7naX
	 S4qMCyea68B5bJCXqZCO7IGu6WkzkV+R39ej/KpvfbdKR3xWDbgbZV/h+1UsqxFd46
	 rClKJ3vSmo+zEHJbQbQJEVuXz6Zwp36Lr7e8obZYpc2klR2h7QVfVVPoTEpoXgOuoD
	 ULLElTSLHMlNQ==
Date: Thu, 12 Feb 2026 15:01:29 +0000
From: Simon Horman <horms@kernel.org>
To: Pin-yen Lin <treapking@google.com>
Cc: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] selftests: netconsole: Increase port listening
 timeout
Message-ID: <aY3rSceyDJ2j3UAN@horms.kernel.org>
References: <20260210005939.3230550-1-treapking@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210005939.3230550-1-treapking@google.com>

On Mon, Feb 09, 2026 at 04:59:36PM -0800, Pin-yen Lin wrote:
> wait_for_port() can wait up to 2 seconds with the sleep and the polling
> in wait_local_port_listen() combined. So, in netcons_basic.sh, the socat
> process could die before the test writes to the netconsole.
> 
> Increase the timeout to 3 seconds to make netcons_basic.sh pass
> consistently.
> 
> Fixes: 3dc6c76391cb ("selftests: net: Add IPv6 support to netconsole basic tests")
> Signed-off-by: Pin-yen Lin <treapking@google.com>

Reviewed-by: Simon Horman <horms@kernel.org>

