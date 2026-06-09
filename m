Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458B929DB86;
	Tue,  9 Jun 2026 13:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781011209; cv=none; b=Qk/cx1jmnuJ5v8rlaZHts0ci5xjk7Gmhk6U9w0nn8l8GKJPEad6Fc5tZVUiYlG9bxAgGoXWHF1mcd6YbUvOnNBP9eLO+xiH9noxlnw3Fcn9sL8i5gigX+q9GxRmgvHNrehy+OPhqGgTdV22VRPKwhAI663jbrdl87oXrM1krbp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781011209; c=relaxed/simple;
	bh=E48D0tBHwscDI1kzWsQeXf1Yfyc3k+15+lB368TCO5U=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=BfiQ7MSHy5SvBpkP9m08ughG5hZ+q7PFlbkNjWi6bz6Q0l/ReOaW1WOy9BBKZThlxEQK0zzRrF399/Ij8WfElx3leE129DdKDEthECqxod+RFbL1RlZK6DZeAsxXsPp6CxKwVFr9yYW03XWb4q6UA4a91z7hM/JeUf9/wWs7cog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AsCEJpSP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AsCEJpSP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBEFA1F0089A;
	Tue,  9 Jun 2026 13:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781011208;
	bh=8D0L0qL5RPk9eqKdVbMj7tsfNsAaNxtOHD/KIHGCx8k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=AsCEJpSPBw1X0b1dS/auXd8mhXF//7MDzYztOOpKnn28oOEGdjoHjiVVuf/oo8zXd
	 drjyHlzdhf1A70wYMS/Uw48XBkgtbuSljdBJnrfRKIcy8nf2j49vO0sYn4GRqs6kPX
	 FvwiRjZ5VKmIxA4m5gy/SBYaMyaPubeJBhKROQEnjQpxXyEPBWzJgsjc42gVIK6eqf
	 PvxbQz9TzMjKirR8Xm8109NRiMNULzvMLkzkNGVH7dF6d+PWGPpXl1J/b5dmIEZzB0
	 F7Djs2jxVz7ujrFpBVK+xtSNqUqzruVKTWFzuUtmHK3/XV22DWKUxSCiNCYpsxGz9e
	 7IuW7f7weYoQA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 938E839308D4;
	Tue,  9 Jun 2026 13:20:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v4] selftests/net/openvswitch: guard command
 substitutions
 against empty output
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178101120615.2025134.17400866656842960591.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jun 2026 13:20:06 +0000
References: <20260604163016.3929371-1-houminxi@gmail.com>
In-Reply-To: <20260604163016.3929371-1-houminxi@gmail.com>
To: Minxi Hou <houminxi@gmail.com>
Cc: netdev@vger.kernel.org, aconole@redhat.com, davem@davemloft.net,
 echaudro@redhat.com, edumazet@google.com, horms@kernel.org,
 i.maximets@ovn.org, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 dev@openvswitch.org, linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri,  5 Jun 2026 00:30:16 +0800 you wrote:
> When ip-link output is unavailable, when the upcall daemon log has not
> been written yet, or when pahole does not know the OVS drop subsystem
> ID, the affected command substitutions silently produce empty strings.
> The caller then passes empty sha= or pid= arguments to ovs_add_flow,
> or matches against wrong drop reason codes, all without a diagnostic.
> 
> Add [ -z ] guards immediately after each assignment. For test_arp_ping,
> also align the MAC extraction to use awk '/link\/ether/' as in
> test_pop_vlan. The drop_reason guard returns ksft_skip because an
> absent subsystem ID is an environment issue, not a test failure.
> 
> [...]

Here is the summary with links:
  - [net,v4] selftests/net/openvswitch: guard command substitutions against empty output
    https://git.kernel.org/netdev/net-next/c/9415471e01c1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


