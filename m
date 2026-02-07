Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B51D2853F8;
	Sat,  7 Feb 2026 04:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770438079; cv=none; b=rduS0QIk9nwDRHfetomkjC1KHw7RtkYFL3zymm2Nkh0k/DTLCs5mjx1kmURwItSOqdc/gddZYsr2CBrAOYsK5Q485vNKbxXEqe5DyT32qRUuuTZTYQPFCmcDnNbnoDUvixosYvWh/pE5UrDiNe0IIoAavNHEGo1ygnCn194MW2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770438079; c=relaxed/simple;
	bh=d+jYSCsW1lE8T4R2oqRGAjCxmdQcw0Kd4nuFwwtbz+c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p2PCzpapoRzjgzDMHq7DdiRi9s6Wa/K6+Fd+IyemfNJKTBYxxLu1SdAcu7ziHORRS2ZUPvTCH/IkVyAt8wdaNUxkDNkewNwHjNNsv6bTn4VPosKRIYZDXHpOxMNjfj6eT1MFHahDPu6mEsXWCUF7ZF0HUsgfFTmhBTCCkgTnXmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JY6r9Syj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JY6r9Syj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71E56C116D0;
	Sat,  7 Feb 2026 04:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770438079;
	bh=d+jYSCsW1lE8T4R2oqRGAjCxmdQcw0Kd4nuFwwtbz+c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JY6r9Syj0MPDcCPgfHBI1o2VVimkf3byKGHt/epLts1lqOxUZIfwyfYUuYBawPvu5
	 hTW169s4L2L3/9kUSd3MoLey/ADVmhBw8M1O1rqhRapZM/GxbAHcRqz3I2NBHAY8B7
	 o2dLjt3/9fUyoR5ev/C0tFYS3bN+spWOQ5BKaD6tsw4V/FwViLrtUDbE95auykwfff
	 1wgx1ocJkDW/fKGU23WzP0YNeNuDajph446nHwR1B7oeyRrmdFitdMxjCcyfXJnuS+
	 JT/sAe8qVCmyExJIn9Mh1sXrNcrW+bJkbagZj+e5LVnwsPhwT1DuBB4EphVAbm/JXG
	 A52wjupgW94ZQ==
Date: Fri, 6 Feb 2026 20:21:17 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, Boris Pismenny
 <borisp@nvidia.com>, Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky
 <leon@kernel.org>, Tariq Toukan <tariqt@nvidia.com>, Mark Bloch
 <mbloch@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan
 <shuah@kernel.org>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 0/9] psp: support rekeying psp protected tcp
 connections
Message-ID: <20260206202117.3678a6b0@kernel.org>
In-Reply-To: <20260204-psp-v1-0-5f034e2dfa36@gmail.com>
References: <20260204-psp-v1-0-5f034e2dfa36@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 04 Feb 2026 07:20:04 -0800 Daniel Zahka wrote:
> Daniel Zahka (9):
>       psp: support rx rekey operation
>       psp: move code from psp_sock_assoc_set_tx() into helper functions
>       psp: support tx rekey operation
>       psp: refactor psp_dev_tx_key_del()
>       psp: add driver api for deferred tx key deletion
>       psp: add core tracked stats for deferred key deletion
>       mlx5: psp: implement deferred tx key deletion
>       selftests: drv-net: psp: lift psp connection setup out of _data_basic_send() testcase
>       selftests: drv-net: psp: add tests for rekeying connections

Sorry to say but my immediate reaction when seeing this on the list 
on Wednesday was "wait, no packetdrill tests?.. we never finalized 
and upstreamed packet drill tests.."

Let's get that wrapped up first, then we can move onto more features.
