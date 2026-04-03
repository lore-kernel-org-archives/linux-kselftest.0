Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE5734B19F;
	Fri,  3 Apr 2026 19:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775244640; cv=none; b=EP7VLK8CV4qvh0gry11TkYMKDJbU+caxJNpdO1qCj34YIF3O8bXd+fqiQWg6tM73ACQZwfB+FdnhMikZwxV8X532m17G89cfxwZz4Y/h85ZKP2ZYoz+Idi/xiaYgSD4zm6jafRcJ+e0X+gNgoy9giS08gviLnKuiadSgXPH3h/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775244640; c=relaxed/simple;
	bh=Dz1LSvT372IyG3wrzNUL6KKaNddhe85AVaWS3aBV/tc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AD2BPK/DcIEr6dGM466DZ02cF/E8CQNbXrVe4p9ha+q/SiIAL51Q57Hyv6fHuFAr3qsFWpvVcV/0c0qZ38PL++Jnh9uHNj9G9SmnzcoHzlrVctQv8DirIXq6FmhZUVf/C4Fe37Jcqm1jZxhg9Lb6jLRx1bl3kt51tBJv1iR93ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=edFkBZWj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="edFkBZWj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF56BC4CEF7;
	Fri,  3 Apr 2026 19:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775244640;
	bh=Dz1LSvT372IyG3wrzNUL6KKaNddhe85AVaWS3aBV/tc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=edFkBZWjZrqTsIv8oA0MnZB4ijEXyNMYVH5dc6TqIPYPVByk2zJ86D6iDBjWxEETZ
	 MpVga2W0n9+Cpsf7O7cd++PqJ7R+4omuuxciWaGuWYDSLQB7L7/zMwSL5GTsKn+NF6
	 VFVz40JdlOnts2UwwRSLseEWO2JHxftnYcleANeletAIsNuKa5LJSGHmKaoFhMSFU4
	 Lggu7AJ5wXffBLBO7mPn2xUC7GnJ9PRWmcklstEN6S3DAbjZDbutdyPixcJ8tjAw86
	 9amztS6INkwcqM+IV1GBevT5nwOb3QsRAqKritBqOuKmpT01uMHmfSptJI6ubqLZvK
	 dtFR8oPX0wQvA==
Date: Fri, 3 Apr 2026 12:30:39 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Marc Harvey <marcharvey@google.com>
Cc: Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan
 <shuah@kernel.org>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v4 00/10] Decouple receive and transmit
 enablement in team driver
Message-ID: <20260403123039.77c80266@kernel.org>
In-Reply-To: <20260403-teaming-driver-internal-v4-0-d3032f33ca25@google.com>
References: <20260403-teaming-driver-internal-v4-0-d3032f33ca25@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 03 Apr 2026 07:14:21 +0000 Marc Harvey wrote:
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
> works as intended (4, 5, and 10).
> 
> There are three patches with small fixes as well, with the goal of
> making the final decouplement patch clearer (1, 2, and 3).

The test seems flaky, we hit this twice in the last 24h:

make[1]: Nothing to be done for 'all'.
TAP version 13
1..1
# timeout set to 45
# selftests: drivers/net/team: teamd_activebackup.sh
# Setting up two-link aggregation for runner activebackup
# Conf files are /tmp/tmp.KEuJWeKPaz and /tmp/tmp.yNhnkNmKxF
# This program is not intended to be run as root.
# This program is not intended to be run as root.
# Created team devices
# PING fd00::2 (fd00::2) 56 data bytes
# 64 bytes from fd00::2: icmp_seq=1 ttl=64 time=0.032 ms
# 
# --- fd00::2 ping statistics ---
# 1 packets transmitted, 1 received, 0% packet loss, time 0ms
# rtt min/avg/max/mdev = 0.032/0.032/0.032/0.000 msPacket count for test_team2 was 136
# Packet count for eth0 was 1
# Packet count for eth1 was 123
# Packet count for eth0 was 122
# Packet count for eth1 was 0
# TEST: teamd active backup runner test                               [FAIL]
# eth0 IS transmitting when disabled
# Tearing down two-link aggregation
not ok 1 selftests: drivers/net/team: teamd_activebackup.sh # exit=1
/srv/vmksft/testing/wt-9/tools/testing/selftests/kselftest/runner.sh: line 50: : No such file or directory
make: Leaving directory '/srv/vmksft/testing/wt-9/tools/testing/selftests'


What's even worse the retry of the test then fails like this:

make: Entering directory '/srv/vmksft/testing/wt-9/tools/testing/selftests'
make[1]: Nothing to be done for 'all'.
TAP version 13
1..1
# timeout set to 45
# selftests: drivers/net/team: teamd_activebackup.sh
# Setting up two-link aggregation for runner activebackup
# Conf files are /tmp/tmp.R4C5kfI62n and /tmp/tmp.tXdWkJ9GjO
# This program is not intended to be run as root.
# Daemon already running on PID 31311.
# Failed: File exists
# This program is not intended to be run as root.
# Daemon already running on PID 31315.
# Failed: File exists
# Created team devices
# Cannot find device "test_team1"
# Cannot find device "test_team2"
# Cannot find device "test_team1"
# Cannot find device "test_team2"
# ping: connect: Network is unreachable
# ping: connect: Network is unreachable
# ping: connect: Network is unreachable
# ping: connect: Network is unreachable
# ping: connect: Network is unreachable
# ping: connect: Network is unreachable
# ping: connect: Network is unreachable
# ping: connect: Network is unreachable
# ping: connect: Network is unreachable
# ping: connect: Network is unreachable
# ping: connect: Network is unreachable
# ping: connect: Network is unreachable
# ping: connect: Network is unreachable
# ping: connect: Network is unreachable
# ping: connect: Network is unreachable
# ping: connect: Network is unreachable
# ping: connect: Network is unreachable
# ping: connect: Network is unreachable
# ping: connect: Network is unreachable
# ping: connect: Network is unreachable
# cat: /sys/class/net/test_team2/statistics/rx_packets: No such file or directory
# cat: /sys/class/net/test_team2/statistics/rx_packets: No such file or directory
# Packet count for test_team2 was 0
# Device "test_team1" does not exist
# Device "test_team1" does not exist
# Device "test_team1" does not exist
# Device "test_team1" does not exist
# Device "test_team1" does not exist
# Device "test_team1" does not exist
# Device "test_team1" does not exist
# Device "test_team1" does not exist
# Device "test_team1" does not exist
# Device "test_team1" does not exist
# Device "test_team1" does not exist
# Device "test_team1" does not exist
# Device "test_team1" does not exist
# Device "test_team1" does not exist
# Device "test_team1" does not exist
# Device "test_team1" does not exist
# Device "test_team1" does not exist
# Device "test_team1" does not exist
# Device "test_team2" does not exist
# Device "test_team2" does not exist
# Device "test_team2" does not exist
# Device "test_team2" does not exist
# Device "test_team2" does not exist
# Device "test_team2" does not exist
# Device "test_team2" does not exist
# Device "test_team2" does not exist
# Device "test_team2" does not exist
# Device "test_team2" does not exist
# Device "test_team2" does not exist
# Device "test_team2" does not exist
# Device "test_team2" does not exist
# Device "test_team2" does not exist
# Device "test_team2" does not exist
# Device "test_team2" does not exist
# Device "test_team2" does not exist
# Device "test_team2" does not exist
# Packet count for eth0 was 0
# Packet count for eth1 was 0
# Device "test_team1" does not exist
# Device "test_team1" does not exist
# Device "test_team1" does not exist
# Device "test_team1" does not exist
# Device "test_team1" does not exist
# Device "test_team1" does not exist
# Device "test_team1" does not exist
# Device "test_team1" does not exist
# Device "test_team1" does not exist
# Device "test_team1" does not exist
# Device "test_team1" does not exist
# Device "test_team1" does not exist
# Device "test_team1" does not exist
# Device "test_team1" does not exist
# Device "test_team1" does not exist
# Device "test_team1" does not exist
# Device "test_team1" does not exist
# Device "test_team2" does not exist
# Device "test_team2" does not exist
# Device "test_team2" does not exist
# Device "test_team2" does not exist
# Device "test_team2" does not exist
# Device "test_team2" does not exist
# Device "test_team2" does not exist
# Device "test_team2" does not exist
# Device "test_team2" does not exist
# Device "test_team2" does not exist
# Device "test_team2" does not exist
# Device "test_team2" does not exist
# Device "test_team2" does not exist
# Device "test_team2" does not exist
# Device "test_team2" does not exist
# Device "test_team2" does not exist
# Device "test_team2" does not exist
# Device "test_team2" does not exist
# Packet count for eth0 was 0
# Packet count for eth1 was 0
# TEST: teamd active backup runner test                               [FAIL]
# Traffic did not reach team interface in NS2.
# ./team_lib.sh: line 88: kill: (1323) - No such process
# Tearing down two-link aggregation
not ok 1 selftests: drivers/net/team: teamd_activebackup.sh # exit=1
-- 
pw-bot: cr
