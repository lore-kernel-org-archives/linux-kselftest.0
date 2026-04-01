Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFBA3264E3;
	Wed,  1 Apr 2026 14:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775055442; cv=none; b=mv/TEzVnUe2+nZVzb/7RvX8lhOjqjxkoG/+7hPdWtN1P9mQT5yzBt7v0eExs1rr4HnznJjuB6FHbF73ac6Fre7pjU5wTVo2HHHCRNYPzVsH6EoaASRNDMqJGYGRqNZ2CDvKmVfeIXIhlubCzYCAlCB1mwWelSk6cY+lPhjEn22k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775055442; c=relaxed/simple;
	bh=JbF39arA0eSNLMl5/chl5JXnKz9KMOAa2M3VvE1zJjs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bend1tnLRe6PSq1jzzAmKSxo2iZKkkkHUMNHDKsBiY2WJJpmkCV2RKzWpGHasg7mw8LVdLZCdiHbj6nMGffoo0LG3Y3DZdtwil8H+IS8w9W0b/YKiAfZ6J2wnobTp+KkaQxdxUq358fyD2+JvQWGBh46BaGM7RPSXJzz2efwrG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k1XGGxAh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k1XGGxAh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1E5BC19421;
	Wed,  1 Apr 2026 14:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775055442;
	bh=JbF39arA0eSNLMl5/chl5JXnKz9KMOAa2M3VvE1zJjs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=k1XGGxAhLsV9aaEYiE2gCyQEQX/ZoFDsHAQ4FSfomnPfw+pUKmsRPbZHc64YM5McZ
	 hnh14YDcASBTC1DTSha4VaexsODEEjvxEcrwLyxrmsvdvnUAr67x42y6Hk9SpLJMxj
	 ei9rX0aTDyNlAjRmMa7mT3HBI36IxYAEZ39qJ5hdpMv4hwUe2cL/L2YKmXQJVYKKvF
	 wXTXFPG5hB+XstdGcDxuGf4oQl4rmHn2AIjihSvBnCGDqEHw350KgiJIHi5oCwMTGw
	 gYjHP8Dnnu6ZcNr4clMvIPcp4HlzfXo3O3mh8niI8uY81+tvyMlfqkKShUp7mpg60O
	 AGE1AHlEf94vA==
Date: Wed, 1 Apr 2026 07:57:20 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Marc Harvey <marcharvey@google.com>
Cc: Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan
 <shuah@kernel.org>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v2 0/7] Decouple receive and transmit
 enablement in team driver
Message-ID: <20260401075720.7976a1da@kernel.org>
In-Reply-To: <20260401-teaming-driver-internal-v2-0-f80c1291727b@google.com>
References: <20260401-teaming-driver-internal-v2-0-f80c1291727b@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 01 Apr 2026 06:05:24 +0000 Marc Harvey wrote:
> Allow independent control over receive and transmit enablement states
> for aggregated ports in the team driver.
> 
> The motivation is that IEE 802.3ad LACP "independent control" can't
> be implemented for the team driver currently. This was added to the
> bonding driver in commit 240fd405528b ("bonding: Add independent
> control state machine").
> 
> This series also has a few patches that add tests to show that the old
> coupled enablement still works and that the new decoupled enablement
> works as intended (4, 5, and 7).
> 
> There are three patches with small fixes as well, with the goal of
> making the final decouplement patch clearer (1, 2, and 3).

Closer but the activebackup test times out (45sec is the default ksft
timeout, I think). How long does it take when you run it?

# selftests: drivers/net/team: teamd_activebackup.sh
# Setting up two-link aggregation for runner activebackup
# Conf files are /tmp/tmp.XyCJqts2JC and /tmp/tmp.kI77XQxR63
# This program is not intended to be run as root.
# This program is not intended to be run as root.
# Created team devices
# PING fd00::2 (fd00::2) 56 data bytes
# 64 bytes from fd00::2: icmp_seq=1 ttl=64 time=0.027 ms
# 
# --- fd00::2 ping statistics ---
# 1 packets transmitted, 1 received, 0% packet loss, time 0ms
# rtt min/avg/max/mdev = 0.027/0.027/0.027/0.000 msPacket count for test_team2 was 138
# Packet count for eth0 was 0
# Packet count for eth1 was 124
# Packet count for eth0 was 124
# Packet count for eth1 was 0
# TEST: teamd active backup runner test                               [ OK ]
# Tearing down two-link aggregation
# Failed to kill daemon: Timer expired
#
not ok 1 selftests: drivers/net/team: teamd_activebackup.sh # TIMEOUT 45 seconds
