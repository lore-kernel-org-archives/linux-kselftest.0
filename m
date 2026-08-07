Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088743EC83F;
	Fri,  7 Aug 2026 23:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786146683; cv=none; b=oNqdLjlh5PVieT8t1I/Wb9FB3aQ2T2hqL8rVkL5Gf5E/+cMVFVjyvcDU7fthnE7cUXq7hU/c/IUMwSwWMzTTBSkG9TH7Vxx42ShU8I9+E/R69so6Hor2FpeOhhxHxJyyIGUA/rkLoWVVjHim5yKs5Xma2okBsPX1ysHQGweOt5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786146683; c=relaxed/simple;
	bh=k5tULKbMi0qzuQwezFlWEXdbtgRky27IRgRIiTBUM4I=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=mpYxQIVQEU4963QiF5c+KrMdI/zkGTtwlnUBDAszwiVHQU7ZoE7Sf7YoMurJvwhfx/8/8w0tu1lDX5GCEJNG8bVRGKMfsLr2aMC2zaebSdVwreTihX4eE4JLWyZwN724wt9nQ3uN34Gmlni2ZJ/2JZ+hcUqCCKW33l7NP0yKTnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mba0/mlI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mba0/mlI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E163E1F000E9;
	Fri,  7 Aug 2026 23:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786146681;
	bh=N47jnt2bP29zQ2jvHDVdIgx+caSVaSGLIR/5kYqZnoo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=mba0/mlI8HXwJt6IvWVEVluS4ccvHnfM3uTcAPf7Ei5vFZmMZ7LLKdCmR9cJk0YZ+
	 e2TObqync5anCNhKH/m3lyYk1fU3cO/Q3L4PZL3z6w/iKLAghkA/TnSDF9YfOeOvgq
	 ozwdZbIuHCikxGL77Qo0nvXVuSe+QzdGLbb+Wqiw3/Yzan2jkEZ2fh7D9VaeA44C5c
	 wd6LLfKTo0SoybNg0jWMehyqfxuB+buqTLdNbesR5uwHJ0oRD1bWYzcCaDyEXBQWaK
	 9WPTLrBOxhV88E8N4xdiX0uGDRMePpFLiwC0+mFVm8IXNJDAedkWE9yXyhJ8Pp2znW
	 0FGE04LS2mBzQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93A2D380CEF9;
	Fri,  7 Aug 2026 23:50:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 00/14] selftests: net: shaper: Expand shaper API
 coverage
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178614664013.2467553.3659943416881200948.git-patchwork-notify@kernel.org>
Date: Fri, 07 Aug 2026 23:50:40 +0000
References: <20260805030936.1092907-1-mohsin.bashr@gmail.com>
In-Reply-To: <20260805030936.1092907-1-mohsin.bashr@gmail.com>
To: Mohsin Bashir <mohsin.bashr@gmail.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, pabeni@redhat.com, shuah@kernel.org,
 alexander.duyck@gmail.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  4 Aug 2026 20:09:22 -0700 you wrote:
> From: Mohsin Bashir <hmohsin@meta.com>
> 
> Add more net shaper selftest coverage for group operations and nested
> node management.
> 
> The series first prepares shared cleanup and capability helpers, and
> separates the basic netdev grouping coverage from the rate-limited
> variant. It then adds tests for updating node shaper rates through both
> .set and .group, discovering the supported nesting depth, deleting child
> nodes and reparenting their leaves, moving queues between nodes, and
> rejecting node reparenting.
> 
> [...]

Here is the summary with links:
  - [net-next,01/14] selftests: net: shaper: Drop redundant command timeouts
    https://git.kernel.org/netdev/net-next/c/9515a13829df
  - [net-next,02/14] selftests: net: shaper: Prepare helpers for group tests
    https://git.kernel.org/netdev/net-next/c/7ea7db704f51
  - [net-next,03/14] selftests: net: shaper: Decouple basic_groups from netdev rate limiting
    https://git.kernel.org/netdev/net-next/c/1b5c2eb00e59
  - [net-next,04/14] selftests: net: shaper: Add basic_groups_with_rate test
    https://git.kernel.org/netdev/net-next/c/ff0c37b8c134
  - [net-next,05/14] selftests: net: shaper: Add node scope .set rate update test
    https://git.kernel.org/netdev/net-next/c/212410dc81df
  - [net-next,06/14] selftests: net: shaper: Add .group rate update test
    https://git.kernel.org/netdev/net-next/c/047735744ded
  - [net-next,07/14] selftests: net: shaper: Add nested depth limit discovery test
    https://git.kernel.org/netdev/net-next/c/1e89d0d7430c
  - [net-next,08/14] selftests: net: shaper: Add child node deletion reparent test
    https://git.kernel.org/netdev/net-next/c/5c84926ef73c
  - [net-next,09/14] selftests: net: shaper: Add queue migration between nodes test
    https://git.kernel.org/netdev/net-next/c/aa05d8096a9b
  - [net-next,10/14] selftests: net: shaper: Add reparenting rejection test
    https://git.kernel.org/netdev/net-next/c/4f197c44981f
  - [net-next,11/14] selftests: net: shaper: Cover scalar attributes
    https://git.kernel.org/netdev/net-next/c/83731be09057
  - [net-next,12/14] selftests: net: shaper: Reject invalid set requests
    https://git.kernel.org/netdev/net-next/c/3651c7e18c04
  - [net-next,13/14] selftests: net: shaper: Cover mixed-parent grouping
    https://git.kernel.org/netdev/net-next/c/ca157503b5b8
  - [net-next,14/14] selftests: net: shaper: Cover recursive node cleanup
    https://git.kernel.org/netdev/net-next/c/e09d72c1c80d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


