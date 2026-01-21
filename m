Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F5F2E03F5;
	Wed, 21 Jan 2026 01:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768958459; cv=none; b=cpqEH6JulHt9t7AAC1X6hyi+E5q9vmCIjYbNr5O4cz/POt59KcdS0TBg9EOcKmXZ5nvUpVEzr+i9dK/REKNhvhqc5SPBPADEpy1X8REqaWizKKGVFJzSP04HaxikHPskG9rN951nLneBJlZVjaslJUEhxudElk37fxiAhW2bIGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768958459; c=relaxed/simple;
	bh=pq6LGkZKbu+Y7ikc9vrBHrd3pcAGdOQR3oyZRSHXkjE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Of+88SOG4r27uSKmXQwBqEcMdNlGSWZPLmNQvZ8JTLzFYb61oiB4kwm3zhkO0bSfF+3zcfRoqeGADI1jso4GGrkppqJSA11xS2wHIqvwFr9fws+TazVgIKz0HnKG4FO/9HyjknDe1lmpOJ5f8Fb7JqslWpX+ITcZHWFAqSVUjuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BaRJr9r0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BaRJr9r0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7695CC16AAE;
	Wed, 21 Jan 2026 01:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768958459;
	bh=pq6LGkZKbu+Y7ikc9vrBHrd3pcAGdOQR3oyZRSHXkjE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BaRJr9r05E1LpqSJTVHc2u9D+LNsv6+rjRqkCSRA1CFWDSYIgO4UryosSklb72uQf
	 imN6D3dvcqN768Oou5GcCnNgC94o1STltLvR/Wx5ZvdEVsaLrLyO6m4DHtw2S9PnDv
	 UdsvqJkdWOUsOwB3lZKqe3/XkUSg5xMYS9sLDl2L+wuX2eRDQaMVIBl5TZ/8+++2wa
	 kAVUJLGMH6j5caUGfpQiIHx6cu3wlyHVhrIxe1gEG3aPTxM4HzSh1pBjaTOvcblgLG
	 QZ+UoVdgw4zJcCL9NgHz95sHS/VCy15m4P+tBxpQz2pHsf8KbqMTXJAX6SeUxaSkd/
	 kMp3y0eBUWlLw==
Date: Tue, 20 Jan 2026 17:20:57 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Andre Carvalho <asantostc@gmail.com>
Cc: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan
 <shuah@kernel.org>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v11 7/7] selftests: netconsole: validate target
 resume
Message-ID: <20260120172057.6600eefe@kernel.org>
In-Reply-To: <20260118-netcons-retrigger-v11-7-4de36aebcf48@gmail.com>
References: <20260118-netcons-retrigger-v11-0-4de36aebcf48@gmail.com>
	<20260118-netcons-retrigger-v11-7-4de36aebcf48@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 18 Jan 2026 11:00:27 +0000 Andre Carvalho wrote:
> +++ b/tools/testing/selftests/drivers/net/netcons_resume.sh

We'll keep this series in the queue but I think it's time to move 
the netcons tests out to their own target or move them to netdevsim.
There's too many of them now and they keep failing on real HW.
With absolutely no error message getting printed :|

TAP version 13
1..1
# overriding timeout to 360
# selftests: drivers/net: netcons_resume.sh
# Running with bind mode: ifname
# ifname : Test passed
# Running with bind mode: mac
not ok 1 selftests: drivers/net: netcons_resume.sh # exit=1

https://netdev-3.bots.linux.dev/vmksft-drv-hw-dbg/results/482560/4-netcons-resume-sh/stdout
