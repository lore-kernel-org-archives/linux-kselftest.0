Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4170C334681;
	Mon,  6 Apr 2026 14:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775486680; cv=none; b=fH3Z98p+PU9AiXbzkWbK0Wl1HDJ5tgn+eSzoWqPd1o4wzwe7yb8r2faFdTsxCQICkdbTuQSMNZ9CWcsOfYJXvPd43wvrbo+5R0MLJvLyoKU84SMBiNEHH5EqYxzd2EIPO82Q4Na+FdfLU6WN9lCTxhtLcP+LnRalP6ykmUNmFrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775486680; c=relaxed/simple;
	bh=cUc/USTOXTckbKII2P/K3rxyrbVtnkvsLV7A5OMbn7E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vxe3xOLUPLLa7Q+gjcSur52kgxHYqKbF+9nsam+dCO0/Upck4PEIu2gf0SUXH1saQrKQ1IBQE1YPsKRX7FtbzeBb5G8wYxSslWnkOOGSkLtpfOMsZHIsGRp/BLuIcpCb4jAEY19pY8EJNE7EvPTnyNlqFsNH2xxDWo1We2/IqAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W23Ii5gw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W23Ii5gw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCC3FC4CEF7;
	Mon,  6 Apr 2026 14:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775486679;
	bh=cUc/USTOXTckbKII2P/K3rxyrbVtnkvsLV7A5OMbn7E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=W23Ii5gwcwcRvfER1ccWlIiqmxwU9wzIZXlCqrHkFRhFZwQOHXRfXUJj/K++9KvgY
	 btTRTrODvylC9A4M4pmP2JGRWp+d2EUMGFODnwX/ytO0Ojou8PARizHNVKOQRGvFhT
	 Wrl2QfUVrMIQ8MRsUeULqDdHJu1HZUzRrchoc0oz5vLBS6gqQk0Nvc5LlvLJdvhNwz
	 RarrnYtUp4Aa7zkY/ostKNc+KgtAKh8luaqos140WwK92lBpfmznQi8ZBCJ89VdES6
	 PoyrNgEt9iXWJeY899NO5JQfuui+yf2TowRb+ucJlaX5dWzaxANZHckKbPIRf2juZN
	 sMxVsOMnw73Lg==
Date: Mon, 6 Apr 2026 07:44:37 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Marc Harvey <marcharvey@google.com>
Cc: Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan
 <shuah@kernel.org>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v5 00/10] Decouple receive and transmit
 enablement in team driver
Message-ID: <20260406074437.3ebb904a@kernel.org>
In-Reply-To: <20260406-teaming-driver-internal-v5-0-e8a3f348a1c5@google.com>
References: <20260406-teaming-driver-internal-v5-0-e8a3f348a1c5@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 06 Apr 2026 03:03:36 +0000 Marc Harvey wrote:
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
> making the final decoupling patch clearer (1, 2, and 3).

activebackup:

TAP version 13
1..1
# overriding timeout to 2400
# selftests: drivers/net/team: teamd_activebackup.sh
# Setting up two-link aggregation for runner activebackup
# Teamd version is: teamd 1.32
# Conf files are /tmp/tmp.ydjNK9Um7H and /tmp/tmp.xZuc3cWbN0
# This program is not intended to be run as root.
# This program is not intended to be run as root.
# Created team devices
# Teamd PIDs are 21457 and 21461
# exec of "ip link set eth0 up" failed: No such file or directory
# exec of "ip link set eth0 up" failed: No such file or directory
# exec of "ip link set eth1 up" failed: No such file or directory
# exec of "ip link set eth1 up" failed: No such file or directory
# PING fd00::2 (fd00::2) 56 data bytes
# 64 bytes from fd00::2: icmp_seq=1 ttl=64 time=0.753 ms
# 
# --- fd00::2 ping statistics ---
# 1 packets transmitted, 1 received, 0% packet loss, time 0ms
# rtt min/avg/max/mdev = 0.753/0.753/0.753/0.000 msPacket count for test_team2 was 0
# Waiting for eth0 in ns2-lZ0gqd to stop receiving
# Packet count for eth0 was 0Packet count for eth0 was 0
# Packet count for eth1 was 0
# Waiting for eth1 in ns2-lZ0gqd to stop receiving
# Packet count for eth1 was 0Packet count for eth0 was 0
# Packet count for eth1 was 0
# TEST: teamd active backup runner test                               [FAIL]
# Traffic did not reach team interface in NS2.
# Tearing down two-link aggregation
# Failed to kill daemon: Timer expired
# Failed to kill daemon: Timer expired
# Sending sigkill to teamd for test_team1
# rm: cannot remove '/var/run/teamd/test_team1.pid': No such file or directory
# rm: cannot remove '/var/run/teamd/test_team1.sock': No such file or directory
# Sending sigkill to teamd for test_team2
# rm: cannot remove '/var/run/teamd/test_team2.pid': No such file or directory
# rm: cannot remove '/var/run/teamd/test_team2.sock': No such file or directory
not ok 1 selftests: drivers/net/team: teamd_activebackup.sh # exit=1


transmit_failover:

TAP version 13
1..1
# overriding timeout to 2400
# selftests: drivers/net/team: transmit_failover.sh
# Error: ipv6: address not found.
# Setting team in ns2-yxjiUo to mode roundrobin
# Error: ipv6: address not found.
# Setting team in ns1-Jht6kA to mode broadcast
# Packet count for eth0 was 0
# Packet count for eth1 was 0
# Packet count for eth0 was 0
# Packet count for eth1 was 0
# Packet count for eth0 was 0
# Packet count for eth1 was 0
# TEST: Failover of 'broadcast' test                                  [FAIL]
# eth0 not transmitting when both links enabled
# Setting team in ns1-Jht6kA to mode roundrobin
# Packet count for eth0 was 0
# Packet count for eth1 was 0
# Packet count for eth0 was 0
# Packet count for eth1 was 0
# Packet count for eth0 was 0
# Packet count for eth1 was 0
# TEST: Failover of 'roundrobin' test                                 [FAIL]
# eth0 not transmitting when both links enabled
# Setting team in ns1-Jht6kA to mode random
# Packet count for eth0 was 0
# Packet count for eth1 was 0
# Packet count for eth0 was 0
# Packet count for eth1 was 0
# Packet count for eth0 was 0
# Packet count for eth1 was 0
# TEST: Failover of 'random' test                                     [FAIL]
# eth0 not transmitting when both links enabled
not ok 1 selftests: drivers/net/team: transmit_failover.sh # exit=1
-- 
pw-bot: cr
