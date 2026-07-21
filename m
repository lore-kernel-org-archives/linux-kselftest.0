Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34088408031;
	Tue, 21 Jul 2026 18:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784656838; cv=none; b=kkOrKdSNMR58DthpCJlKMf2s6yIK2mCELaeSCy3lGKaQgDdDjfzXNdD6QlXT7GeA/nQZkzexwlNvhOnoSzVKt3WG59MAzZ49vy54Ao61nvImWllMKLwZL6bcpfH5jmjXZRhrmiehoon3kdG8OLvzOO7wCp6Gs3h7a7GkdsylKrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784656838; c=relaxed/simple;
	bh=6IazgoMQ7PDP4kQ+9HYkFIyXVJdAyZRHK2ZHglLg/h0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=JQu738gYzbmeJyxIqE+pg6RmqaHScMy12oPh1Iec9FjYT8i+G5toUAP0ZoliKDLULzM71n+8fCFBVFT7ltUp7uU9efmOhnu+QCybzzngFr0ujhYUGLmQ9xXPvwfh20BZkpqWxD3VijGTT88GIBdFsWrya70Wcz1YaA0X6ayjjUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iOPAf3gy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iOPAf3gy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D212C1F000E9;
	Tue, 21 Jul 2026 18:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784656836;
	bh=/BG50ubMxVGOW00uXi09Ivh6FYmUu0tamsmAc6wPgaA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=iOPAf3gyf1x7H5iMMkoNz1awfDCJNa5vfbvLhhrwA5UxDQHTxYoBNKDDn+OtIwM7f
	 9B+tZfYg6/6PyPsVegG6RSNqQmD6/cQ2PzKMMyZdgnvC2nPbVe9u108fxEF56VbJrH
	 Lx3Se1RS0ocDOtvRIs+udscfM15f8N3rBjajHGr7JJf8UpIBFF0S55OrMHHt0WpDge
	 M8ritb8VyJSC2aeTCEe1tVu+Br9YsDvtSssMZvHjOupbaDqsLYDbcnszyVVn0NQD/a
	 d+bzMqW2G8sRHkHDN169wnmao2nEarm9K/1vEza0DENdg1IYxwgDqZhp6qDxzCkOJt
	 I5IqPYglbmXjw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9597A39253E0;
	Tue, 21 Jul 2026 18:00:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v5] selftests/net/openvswitch: add ICMPv6 echo
 type
 match test
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178465680614.897813.9680851490738243694.git-patchwork-notify@kernel.org>
Date: Tue, 21 Jul 2026 18:00:06 +0000
References: <20260709120541.3556748-1-houminxi@gmail.com>
In-Reply-To: <20260709120541.3556748-1-houminxi@gmail.com>
To: Minxi Hou <houminxi@gmail.com>
Cc: netdev@vger.kernel.org, aconole@redhat.com, echaudro@redhat.com,
 i.maximets@ovn.org, i.maximets@redhat.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 shuah@kernel.org, dev@openvswitch.org, linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu,  9 Jul 2026 08:05:41 -0400 you wrote:
> Register OVS_KEY_ATTR_ICMPV6 in the flow key parser so that
> icmpv6(type=...) can be used in flow specifications. Without this
> registration the parser silently drops the token and the kernel
> rejects the flow with EINVAL because the expected ICMPv6 key
> attribute is missing.
> 
> While here, add convert_int() to the ovs_key_ipv6 and ovs_key_icmp
> fields_map entries so that specifying a field value produces the
> correct wildcard mask. The IPv6 flow label uses convert_int(20) to
> produce a 20-bit mask (0x000FFFFF), matching the kernel constraint in
> flow_netlink.c that rejects masks with bits 20-31 set; byte-wide
> fields use convert_int(8). The ipv4 counterpart already does this via
> convert_int(); the ipv6 and icmp classes were simply missing the fifth
> tuple element. Existing callers that pass empty parentheses are
> unaffected because convert_int("") returns (0, 0).
> 
> [...]

Here is the summary with links:
  - [net-next,v5] selftests/net/openvswitch: add ICMPv6 echo type match test
    https://git.kernel.org/netdev/net-next/c/6deab902b4c0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


