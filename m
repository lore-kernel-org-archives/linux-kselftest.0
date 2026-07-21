Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9449C2DBF75;
	Tue, 21 Jul 2026 18:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784660021; cv=none; b=Q0x5KMsBMMidndwdggL8OHP09uB3vDipsrfr1bWE4OBaRnxvnLybkA2IaVBDtUJw8KDwDZZh4Cbcnb1Hufuc4waiNWAVa5ngExbN0yhbycUgEcyKRxSg2225PlDy+5ggzEdJ/AtDjDHflt1LAl7XgOXDzwEH5OYw1eT91EnsBps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784660021; c=relaxed/simple;
	bh=GoBQdLhcvzXYRcBc5t0EDxCmJ/gOKn2hnuSn5lZ1HSk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZRQzmcrtgkB84NpH/C8ej4ms0a5RquqbZpnAX2C6aSzhysMXuDdXwwlw76cSR7GzJaSrJXJDUEQA2fctF8jRGWdiF/w6FHIWknR+p3E+lsLvtlSs8cSiHrSYSwRkLdovSaavuuPngz/PS6fudM23eGDfdqqRmLWJfslVwhNDtXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S8Ech+r9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S8Ech+r9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F15EB1F00A3E;
	Tue, 21 Jul 2026 18:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784660020;
	bh=gte7GzV85JHaJhjN0FetqQSkNf/MaghddVNXQ+n/6k8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=S8Ech+r9WybBN35QPIhcuUCsjAWnlIGCgnd5gDh7Ks2OxZ1xZrhugGcitbJbkbDT4
	 gjbYaq2qv2JNAJ/wii7eLNHtOzngJd8DPyTgNSBo+OYRXu/x03y/rtFqadeIICA7fl
	 kVn41/xwiVpPFLxknnCmV//lotvgkiBNKlHq8893w7sDv1AYsSia7+NTqBtOtKNKPY
	 oPKgBGm0v4mt37c6/PD18fIIY0IPLFxD86w2PVqkf8fHdG0+RuG6ZRHiKysSr3rRzQ
	 aCNQEoCEg4bLMrbkEMz/K0vyk2KgfQW0bjpwFgZ0KnyNTEYaCqAG8CnFzRZB3Mlbdt
	 GgT8lZA8NGuzg==
Date: Tue, 21 Jul 2026 11:53:39 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Thaison Phan <thaisonphan@google.com>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan
 <shuah@kernel.org>, Fengyuan Gong <gfengyuan@google.com>, Stan Iliev
 <stani@google.com>, Simon Horman <horms@kernel.org>, Willem de Bruijn
 <willemb@google.com>, Petr Machata <petrm@nvidia.com>,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] selftests: net: update wait mechanism for
 relocating netdevsim to a new ns
Message-ID: <20260721115339.09a3ea0e@kernel.org>
In-Reply-To: <20260709160807.23650-1-thaisonphan@google.com>
References: <20260709160807.23650-1-thaisonphan@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  9 Jul 2026 16:08:07 +0000 Thaison Phan wrote:
> When netdevsim devices are reloaded into a non-default network namespace
> via 'devlink dev reload', the host's udev daemon does not receive the
> subsequent device creation events since it is generally associated to the
> default network namespace, so the host udevd queue never officially clears.
> As a result, running 'udevadm settle' blocks indefinitely and eventually
> times out.
> 
> Fixed this by bypassing 'udevadm settle' when a namespace ('ns') is
> provided by utilizing the namespace-aware 'self.wait_for_netdevs()'
> helper to poll the namespace's sysfs until the interfaces are visible.
> For host-only configurations (where 'ns' is None), preserve the original
> 'udevadm settle' behavior to ensure udev renaming rules are completed.

I don't get it. I never saw it hang. And if the event is scoped udevadm
settle should return immediately, rather than hang. We generally run
on latest systemd udev in Fedora and CentOS. Please explain your problem
better.

> Also fixed minor bug in wait_for_devs() where wrong exception was caught
> from if get_ifnames() failed. Now the if get_ifnames() results in a
> command failure exception, wait_for_devs() will catch the exception and
> set an empty list for the interface names rather than the exception
> propogating upward.

Should be a separate patch
-- 
pw-bot: cr
