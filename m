Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF383F8819;
	Fri, 27 Mar 2026 14:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774622845; cv=none; b=KIQsiBR+sCGSIdl25NfgNoikYuQ9zx2NNsCuWaWczmURk31Vge3G1/HG2OdGi6k0r/mwQRpIBMf0Q2hcFzDxhFWAy9S1tioEM7hU/iitIP4OzVCb/9edCyrwbisq1u/UNcs1KoIZZ80su8nscbFb3hQ/O2t02rpgE3nrLrNS5To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774622845; c=relaxed/simple;
	bh=2rXQs32wqvDW7QSkYIr4YtldGSQDImxafhk89H7DS1A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pme1FcFlSt8UUnM8xCDQlgJxTy++egu1L0Jr6OMdoR+8rvwmgWHmpAROtQEslNJp2jORiepnfDbqMpPT7+GSeAaqUu7pIeS/4pjVyXnXS3UlHGypehlV7memYakw5KSMNzco5ysS4T77kmGnf3WbISUSbRxgpRkxKfnUvndppE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZrN6GdQs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZrN6GdQs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE435C19423;
	Fri, 27 Mar 2026 14:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774622845;
	bh=2rXQs32wqvDW7QSkYIr4YtldGSQDImxafhk89H7DS1A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZrN6GdQs0ktOGev58eAnzNGJtREEZW0v3FXnrZ5tK+XfjF2p9AXjNiEaPH7rWWH7F
	 tW/M1lhVAWLzELJJZWSnJnfCV/omxVDQ/tNNFSd12C9EmcWKrbnKuyYh5Q2AVJFK0f
	 jxd2nKAEjgxMTIMpS03XQ46OPHgUtKj9/szQQc/hWBeO8lkRl7HhHNgbboIcds4bYn
	 jXYMNHp0H4vdN8obwcC6JnRT2AVEH6pF4cX45uLe8drEdHjrMZ5pSb9ZF+Q991QrZn
	 TCQc3R38C9pADyc58aBYfcoUYiu707w2CzWpNuknm/+mBkvArIlzRYSY3CaIRKS0qY
	 Bg1jWsEfBhdhw==
Date: Fri, 27 Mar 2026 07:47:23 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: fffsqian@163.com
Cc: davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Qingshuang
 Fu <fuqingshuang@kylinos.cn>
Subject: Re: [PATCH v3] selftests: net: broadcast_pmtu: Fix false failure
 from incorrect ping exit code logic
Message-ID: <20260327074723.26e086d8@kernel.org>
In-Reply-To: <20260327012705.2389814-1-fffsqian@163.com>
References: <20260327012705.2389814-1-fffsqian@163.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 27 Mar 2026 09:27:05 +0800 fffsqian@163.com wrote:
> The broadcast_pmtu.sh test verifies that broadcast route MTU is respected,
> but it uses an incorrect criteria for test success: it relies solely on
> the ping command's exit code, which leads to false failures.
> 
> When the kernel correctly blocks oversized broadcast packets due to the
> configured MTU limit (1500), ping fails to transmit any packets and returns
> exit code 1. The original script interprets this as a test failure, even
> though the kernel is properly enforcing the MTU (the core goal of the test).
> 
> Fix this by checking ping's output for "0 packets transmitted" or
> "message too long" instead of relying on exit code.

Still failing, are you testing this locally before you repost it?
Does it pass for you?
Please do not post another version until someone asks for it.
