Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2702B3321A1;
	Sat,  8 Aug 2026 01:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786153259; cv=none; b=TItflmAsC2XykI7+YtycjWMbA9nPtoSFkQng/EGWLzcTHoZ6hwWlYx3Jnzbu/r8xmcU4e0VZnLDTAY9QY5no+C7YYk4DQoZw6hENFHZ3g5hU/owtj84OE/kQzHC4NKEPPMn8l37/N04WPCrRlU4t+QmZWzCP1Hun70HCTvxGBXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786153259; c=relaxed/simple;
	bh=NJ8GJPPA+zploVAg3Hn7JkNR2DDXJKV7+/g0hytsz0M=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=SW3E0WKwq8LrwHt99tLPqCK3H4Pnd1LbzlBr9vuXroouueHGGeSI+OPMQREr3ePzTcpIZxyonaVMRN6rlo8XF50UABBrhX83RbGBT2qfFwEkbqvdlJYVJ8rHM/7ZdeHTioxggO0h8iEAB5Ei2rVYtoOSOzHmPCN3OL+I5WtJR0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=joAKtJ9a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="joAKtJ9a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3E051F000E9;
	Sat,  8 Aug 2026 01:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786153257;
	bh=NXm/SsYiv4ju2Xo/fyAJbZ1/yajU4AJnu1Qr1d7j8WA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=joAKtJ9aDWLRW8g60N7rTz7Fk3n3zBec23EWuWHUcWd5HRqJVBkyk5WzNKzjUm85d
	 9lsGEGYAKdlvH34Iw4D0SJhzT+OSm4I97ZiogX8In8C3QDlPx4sL/bJHQX8+z9I/xL
	 llWdFb+5gWtBqCI6caipTdq3EJ5h0snCEe5r3v584ZLlC4dIbfsFFuGlNZ1gWMXXjG
	 gPJYFRkePsgxKXugp6MgsJ6jx2YB/CLH5jYGJREspbCKJ7wNR1g4fjFpD2B6OMjnJi
	 76Cubw0CLs7D2krtwFJV7n8r/JTSsAZEjTiFhC2xcn67UHTA3CEZG4Jtgx1r3vW0f4
	 mcuseiKZ7WFJg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5696B380CEE4;
	Sat,  8 Aug 2026 01:40:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v8 0/3] net: devmem: allow rx-buf-size >
 PAGE_SIZE
 per binding
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178615321588.2493713.16495466969438230257.git-patchwork-notify@kernel.org>
Date: Sat, 08 Aug 2026 01:40:15 +0000
References: <20260805-tcpdm-large-niovs-v8-0-3e0225e2808c@meta.com>
In-Reply-To: <20260805-tcpdm-large-niovs-v8-0-3e0225e2808c@meta.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: donald.hunter@gmail.com, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org,
 andrew+netdev@lunn.ch, kraxel@redhat.com, vivek.kasireddy@intel.com,
 sumit.semwal@linaro.org, christian.koenig@amd.com, shuah@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org,
 sdf@fomichev.me, razor@blackwall.org, daniel@iogearbox.net,
 almasrymina@google.com, matttbe@kernel.org, skhawaja@google.com,
 dw@davidwei.uk, joe@dama.to, bobbyeshleman@meta.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 05 Aug 2026 13:42:42 -0700 you wrote:
> Every devmem dmabuf binding hands the page_pool PAGE_SIZE niovs today.
> On NICs that consume one descriptor per netmem, this caps a single RX
> descriptor at PAGE_SIZE and burns CPU on buffer churn.
> 
> In this series, we add a bind-time netlink attribute,
> NETDEV_A_DMABUF_RX_BUF_SIZE, that lets userspace request a larger niov
> size (power of two >= PAGE_SIZE). Drivers must opt in via
> queue_mgmt_ops.QCFG_RX_PAGE_SIZE.
> 
> [...]

Here is the summary with links:
  - [net-next,v8,1/3] net: devmem: allow rx-page-size > PAGE_SIZE per dmabuf binding
    https://git.kernel.org/netdev/net-next/c/b27a8560eec9
  - [net-next,v8,2/3] selftests/net: ncdevmem: add -b option to set rx-page-size on bind
    https://git.kernel.org/netdev/net-next/c/3e8c9ec4eb75
  - [net-next,v8,3/3] selftests/net: devmem.py: add check_rx_large_niov
    https://git.kernel.org/netdev/net-next/c/8ac4255c1e0c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


