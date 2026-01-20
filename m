Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1367827A10F;
	Tue, 20 Jan 2026 23:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768953415; cv=none; b=G+PZyGnfdpynISiHm3AXNWrOGYOAdUCEBG5/jHEy1aQ8Ev7N1Nl5CpuzpE9xu8adrRaz2rue6FpMbK2SirwRPbBR4B4INRXX22mlTOl8rXsxYhStHMBxmP0B6oBPq49WMssDeZhYYb2z6ZSKQCaIgoaInyqOWWq3AXu9T9EY3qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768953415; c=relaxed/simple;
	bh=gFu+RtvJLkH0AxIHtA3f6GTHQeVoUhyZgvT6LbiFcvo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J612S0SRpVm+NTOlcVEFj+ESMPM9PESj8wlXMvJVfOYsWPzTHb4RdJ29Ond3e2YM1uyeon3aJqiq4TxMq0XQGHmd4K2oQQf91qvLiMDJOhGJkgyp4ZkEdMxTjMGeLSa52voO2lFwy2Xjbea3zVPY4IN67i1e1sUs7811N1cfdQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dtbaX+eJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dtbaX+eJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4F97C16AAE;
	Tue, 20 Jan 2026 23:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768953414;
	bh=gFu+RtvJLkH0AxIHtA3f6GTHQeVoUhyZgvT6LbiFcvo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dtbaX+eJYL96w1nwrpc1GBc2Aa691vta4jeFGn61fkEJO1BYgBW136KoYeO+uycNO
	 u9IwQiH+rjyLIZQNRgKkaCZ3qSqzRaW7f3SSiGyzAfCv7uaDSKe2P3DWjkpHPluZCb
	 M4ZcU32l7ay2fgYA4dnGiiDcYQcXjBHWTmHvAVc/uifmrj5KE5awasZje+vBrxPlWa
	 ZJDyRRGlKymVX0kd1ahU2IyA6adg5b9FLKAI0X1lawwuz54w2Oqk2QlUGVovr09NtB
	 B/cjm+kNRHtJOKNrCMRMkeslp3Z+Kmhm2LtiIW2YFhdW3lmMlT1WP/YTkTxarD5a02
	 QdS7Gqguq8WFw==
Date: Tue, 20 Jan 2026 15:56:53 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Nimrod Oren <noren@nvidia.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, Joe Damato
 <joe@dama.to>, Willem de Bruijn <willemb@google.com>,
 <netdev@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Gal Pressman <gal@nvidia.com>
Subject: Re: [PATCH net] selftests: drv-net: fix skip for unsupported
 devices
Message-ID: <20260120155653.6be7d349@kernel.org>
In-Reply-To: <20260119091303.3524210-1-noren@nvidia.com>
References: <20260119091303.3524210-1-noren@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 19 Jan 2026 11:13:03 +0200 Nimrod Oren wrote:
> The test_rss_flow_label_6only test case fails instead of skipping on
> devices that don't support IPv6 flow label hashing.

HW tests can just fail if something is not supported.
You can repost against net-next without the Fixes tag if you care
deeply but I want to very much prioritize ease of writing these tests.
IOW there's no practical difference in "SKIP" vs "error + EOPNOTSUPP"

We care about crashes and regressions, primarily.
-- 
pw-bot: cr
