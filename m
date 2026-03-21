Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7402BD11;
	Sat, 21 Mar 2026 10:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774089372; cv=none; b=J6mX7wy69t5sZyTXWd08qeG9qGKddMAcpTzyO0e6lPOGeNjLTuGTFERag+La8yjog9KcrMWn1+x0TjPdpSoVwOKmOjeqOrkHxkq6mHvyNkut9hbpmhqwTIF4GVmP4EMe7FhW0N3KRRwJw4MUN2z/XDNBvxXWJpaGMB6WzJbhKwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774089372; c=relaxed/simple;
	bh=/6eOLTSivq+etcgwBsYg5Tg2Jeg74Hgv+HHyl+MfzjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6OBKwRWfcAShTESWFyuEJ5Y2EzYWjTwhYSMQGG/04KuHMZ2FQY3mJTOdaCf3A0xBvKGW6p9RInvArNPuC/JeQgd2BP4GVi26+mIGhxz7ugD0y4DL7QBV+lWledomxrkGtIhCcjwv9XFZXRxYNDt3bvC7McbTv+95LuGfoAjigg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k+CHKcvc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k+CHKcvc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F4DDC19421;
	Sat, 21 Mar 2026 10:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774089371;
	bh=/6eOLTSivq+etcgwBsYg5Tg2Jeg74Hgv+HHyl+MfzjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k+CHKcvcxzfZXTvWuk0btSostGs112cEL/nkkDN4RiAwIvySyaTSS7YRsryeBytZp
	 10g2tQXRu0OXpBta3VDu6MBlQ8Ew22DDIC3NfZ7CTERkyAQRo7HXHDFps4/JeXaJEv
	 2sq/uoqovyZxLwpJ+R91aa/yZSMj1hieIS0/y/LTHuyDR+WhFP4OelAwex0A9Oblxc
	 d56sQMILsSzD63KAApDx90MN9HblHBgkmlSw7Zwgc/QmwD1ljixQkTfxzqyO/VAw3H
	 KLZEzYyO0Q/xtvjImgUVxY1MDJqVJRTQahkUm5ZF2HRhdjUHSuBqD5anUwKGk3Ob3G
	 M5MZu5Wf6P5zg==
Date: Sat, 21 Mar 2026 10:36:07 +0000
From: Simon Horman <horms@kernel.org>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>, David Wei <dw@davidwei.uk>,
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net] selftests: drv-net: add missing tc config options
 for netkit tests
Message-ID: <20260321103607.GA74886@horms.kernel.org>
References: <20260320-config-fixes-for-nk-tests-v1-1-1e20ec6ddc7e@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-config-fixes-for-nk-tests-v1-1-1e20ec6ddc7e@meta.com>

On Fri, Mar 20, 2026 at 11:08:35AM -0700, Bobby Eshleman wrote:
> From: Bobby Eshleman <bobbyeshleman@meta.com>
> 
> The NetDrvContEnv env context uses tc clsact qdiscs and BPF tc filters
> for traffic redirection, but the kernel config options are missing from
> the selftests config.
> 
> Without them, the tc qdisc installation trips on:
> 
>   CMD: tc qdisc add dev enp1s0 clsact
>     EXIT: 2
>     STDERR: Error: Specified qdisc kind is unknown.
> 
>   net.lib.py.utils.CmdExitFailure: Command failed
> 
> Add CONFIG_NET_CLS_ACT and CONFIG_NET_SCH_INGRESS to enable these tc
> options.
> 
> Fixes: 3f74d5bb807e ("selftests/net: Add env for container based tests")
> Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>

Hi Bobby,

Unfortunately this does not apply cleanly to net.
Which breaks CI.

Please rebase and repost.

-- 
pw-bot: cr
