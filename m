Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC68306B3B;
	Fri, 14 Aug 2026 23:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786748862; cv=none; b=etNzlIFio2eYp7eZgiO5R0d2bgYCrMJ/rixFxK8WVb8ERfXjdMX1ru9oiNtmgRC353zfq9smWa7CBKvAKB50mbirD4AVlrwzn35y+eZOn4YDlaIZ7c4Jzk6PEVZNz8DhatOyZFI0Pwxk1m/lNGULvFgvkY2aSBL7m5WpMdYXgC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786748862; c=relaxed/simple;
	bh=jQ6Y6dcMSrpMjKg2pUFiZ7XSVpb7Ji+fdOVYlNkB+uE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gjM5WnkUQfuZVzlrr0T4ltgP14JKK2lmZZX/5g+lp7KivIgX/+tQVLMkk0+ylshgr83oHAErKTQ9Ex1xSRnMwaq+u4flZ9AZTHCYhwU7pxdE2NuFvuCa/hOq5/4Jz38PhfXBRkH8Y6h6mMj9GtoeX+Wec7qCA/+PRXRIVlCRXhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KREDyTY/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KREDyTY/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC961F000E9;
	Fri, 14 Aug 2026 23:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786748861;
	bh=Rf8rFsByb/4KElgDc0YWPuNcgqqu3Ti02BSgkxOh9O8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KREDyTY/6s9bebcbPqSDHbBV2v6Wc2lgKUo9R94XFgsl5YtMkwEdUUttdX90czi1U
	 K/dMe13vM8dXkonj8mNS6BJevGa0qo1ilAaL8waLtP4ymHwVH4cFX6kfPwIRbfXOfp
	 xjRP8YFyicoFIpRTwMqkyPKyOO2vz6KpV5NkRXniRttNPiNk1SYQ8KxZAN93xEWhp9
	 Y6HQn5YU4+mG3xkJQEVDt8ahBcEFmBme7XADblbyCQIPsoXl0s1MKq5zfEyv8X7Dd3
	 JQcgvUHGlh2FtQdxS/otG0rccVM92mDNPdDm91AHXcmL6my0FClQDOyER8GXk2IelU
	 K4DnvABAUlL6w==
Message-ID: <ea0ae140-86e9-4578-a24a-d50fc0b19c4a@kernel.org>
Date: Sat, 15 Aug 2026 01:07:36 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH net-next 2/4] selftests: net: Lower threshold on debug
 kernels for big_tcp_tunnels.sh
Content-Language: fr
To: Alice Mikityanska <alice.kernel@fastmail.im>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>, "David S. Miller"
 <davem@davemloft.net>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Alice Mikityanska <alice@isovalent.com>
References: <20260814194124.3102581-1-alice.kernel@fastmail.im>
 <20260814194124.3102581-3-alice.kernel@fastmail.im>
From: Matthieu Baerts <matttbe@kernel.org>
Autocrypt: addr=matttbe@kernel.org; keydata=
 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
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
In-Reply-To: <20260814194124.3102581-3-alice.kernel@fastmail.im>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Alice,

On 14/08/2026 21:41, Alice Mikityanska wrote:
> From: Alice Mikityanska <alice@isovalent.com>
> 
> CONFIG_DEBUG_NET kernels run slower and generate fewer BIG TCP packets,
> making the test flaky on upstream CI runners. Lower the default
> threshold for those kernels.

Thank you for looking at that!

> Signed-off-by: Alice Mikityanska <alice@isovalent.com>
> ---
>  tools/testing/selftests/net/big_tcp_tunnels.sh | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/net/big_tcp_tunnels.sh b/tools/testing/selftests/net/big_tcp_tunnels.sh
> index 9b7d0456bcc1..e27774eae20e 100755
> --- a/tools/testing/selftests/net/big_tcp_tunnels.sh
> +++ b/tools/testing/selftests/net/big_tcp_tunnels.sh
> @@ -17,11 +17,25 @@ CLIENT_IP6="2001:db8::1:2"
>  CLIENT_IP4_TUN="192.168.2.2"
>  CLIENT_IP6_TUN="2001:db8::2:2"
>  
> -: "${PACKETS_THRESHOLD:=1000}"
> -
>  # Kselftest framework requirement - SKIP code is 4.
>  ksft_skip=4
>  
> +is_debug() {
> +	local config="/proc/config.gz"
> +	[ -f "$config" ] || config="/boot/config-$(uname -r)"
> +	[ -f "$config" ] || return 1 # No config found; assume non-debug.
> +	gzip -dcfq "$config" | grep -qx 'CONFIG_DEBUG_NET=y' || return 1

Are you sure it is CONFIG_DEBUG_NET that causes that? It shouldn't be
that heavy.

Do you not want to change the thresholds only for the -dbg runners using
kernel/configs/debug.config? If yes, you should check if
KSFT_MACHINE_SLOW == yes:

https://github.com/linux-netdev/nipa/wiki/How-to-run-netdev-selftests-CI-style#dealing-with-slow-runners-in-performancelatency-tests

Cheers,
Matt
-- 
Sponsored by the NGI0 Core fund.

