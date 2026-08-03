Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909552F12D4;
	Mon,  3 Aug 2026 22:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785796747; cv=none; b=qu/vh/nthIcstWDHI+YP7L9WwkfGmlmhtxBcxz4nh998dYMH3ihNiizrT4A/EwM6AyeVmMb26yx07IfrbUB3WNihkBEQwgM8xVLPSmz/8Ya4f4DRr8mLFBleXCAi66kc6OuBigaIbao4vhyBZQM9jVWByrVOc9942VqNl7ICqK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785796747; c=relaxed/simple;
	bh=JYLpK2RLwXx3J7tIEi0X7VbNKnQmO0ohjTBD1Ifb93U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AyUHaWKAcwf951ySM54cdePbSzbu0Orz1/iiD3JhtVW5pUuwTAFjPgWJYpiodW8sIytxekMETAJzRgmK/9IIhOglfHUIVZ8LrtMPi3Q6r54145ZjiU6y8WuE8aj8+Em0P1eZolqaXEW8UtZc6nFCs3BzUrIHM5Vzx1Vrrr08bIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TVb/JgEQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TVb/JgEQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED2F21F000E9;
	Mon,  3 Aug 2026 22:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785796746;
	bh=NEGciP0VpHF7NNx2H3k0pGo/GG53AY+AzCRZltiFtgY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=TVb/JgEQa5xUMPG/F5acI3nRG8WG61yAjn6ZBW7rKf7l+Z8iShcU44GNgtd41xN6p
	 2WtTlFYVRm8NQF3FOmtOjFdAeKYWvu2rg2KcAkyRbUGeZiAA4gK5ebxABz1/vbABx3
	 +XIDcUWeo53tXthFWb93rW9ifescV+3rX+145Z83rj9zLHCuL7wEDaMM79SsWG0iex
	 spZWt8HavQQ79GTo4K36kcxCNhysRba/kxf02pRjOtED4ejbikgB4XFBr/YlvEfpFc
	 V31r7tVTrsLps8B51qpz6FVMlsA2x+0Cjco4bBwvSxpATs0jRcvrlI59emiyjhIvq+
	 KGienQCZwezBA==
Date: Mon, 3 Aug 2026 15:39:05 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Chuck Lever <cel@kernel.org>
Cc: John Fastabend <john.fastabend@gmail.com>, Sabrina Dubroca
 <sd@queasysnail.net>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 1/9] net/tls: Bound time spent on no-data records in
 tls_sw_read_sock()
Message-ID: <20260803153905.09f1ba0b@kernel.org>
In-Reply-To: <20260726-tls-follow-on-v1-1-99bf4cc1c729@kernel.org>
References: <20260726-tls-follow-on-v1-0-99bf4cc1c729@kernel.org>
	<20260726-tls-follow-on-v1-1-99bf4cc1c729@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 26 Jul 2026 20:33:29 -0400 Chuck Lever wrote:
> +/* Bound the time that consecutive empty ingress data records keep
> + * the socket lock held without releasing it.
> + */
> +#define TLS_RX_NODATA_NS NSEC_PER_MSEC

A time bound is a bad idea in the kernel, a softirq can easily 
take >1msec and turn 2 consecutive zero length records into
a fatal error for the connection.
