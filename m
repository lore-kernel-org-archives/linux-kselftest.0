Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3C74A3D42;
	Tue, 15 Sep 2026 23:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789514473; cv=none; b=IHdXaDGei/gcbHJRbj4w4oVNIPJa5SSVUBym70ccR3uKNOx37uoOPZLEFbFEay+GtPHGPnvmq9JKbMkRjCfW1dmsBru+Zo8jH5q9YmwsgAjltyVFgXSyQytiS6f0rZYi3wfxYEatYE3tz0d316eRu8XZHJeEBgeMqVdqxNr3aBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789514473; c=relaxed/simple;
	bh=aQlJM13Aeer2ejNphKPnEOK24xGdIXZ8iO+kIxvBhSQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=pZSDUjOGbPdxZhyB7IHoK0nPgMGjW9e5PqR7oORuXJj9nAWJorJkrsKvi9oYYpuHebfK5fDTyVjfFEA1zIgRkGsCFx/AaN27qlqm6kAb57eX0WaiRZgMJXnynLuedEroCPBkldh0NzIJq4oyPcWesZiZlTxwxF4RWPrUtJNI8zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LmrPw4Tl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LmrPw4Tl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB6241F00893;
	Tue, 15 Sep 2026 23:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789514472;
	bh=f8dUDDJRw6rmsQ9DSmKG1TOmScb1IbwZ6B0CVsXvrMs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=LmrPw4TlM+jfhJWpeZvbou6xZbDXVbuFlJkwYyeVdqxfAfbjm30ekxfPjhneNjVxz
	 BSxi7u6/zIF2BEdroxjRAzHVMNexzSZHEF+FUbX7pqPvB6uR1vOqBx4mRtEzLuAgpX
	 3oEuEPl5Z7mb+gK86JmqiNDqfvdEuZQjU4Q1eIISfJsIah5pj/XadgYZ42j2KeImSV
	 daJJTxe9KScseUlDbBWJf5Nnur8OCLrXn/4tHhYuv0iAiN9umDcf0Gx6h3nLjVOfi3
	 xO347wJJNYSpiZql7FHZyjtNZBtP/GeZLP+tSx+Geyxwoy8P9ZTGvx0CrKMl7Riy3n
	 D8371oq8WLPMg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939CA3927069;
	Tue, 15 Sep 2026 23:20:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] selftests: drv-net: remove duplicate functions
 in
 hds.py
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178951440613.2314577.9685453307145210984.git-patchwork-notify@kernel.org>
Date: Tue, 15 Sep 2026 23:20:06 +0000
References: <20260911224255.3675903-1-dimitri.daskalakis1@gmail.com>
In-Reply-To: <20260911224255.3675903-1-dimitri.daskalakis1@gmail.com>
To: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
Cc: davem@davemloft.net, andrew+netdev@lunn.ch, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 11 Sep 2026 15:42:55 -0700 you wrote:
> From: Dimitri Daskalakis <daskald@meta.com>
> 
> There were duplicate definitions of the enabled_set_xdp and set_xdp
> test methods. The two enabled_set_xdp copies were identical apart from
> a comment and whitespace.
> 
> The set_xdp copies differed by a reset of the hds configuration.
> commit ee3ae27721fb ("selftests: drv-net: hds: restore hds settings")
> introduced the config reset, but this was shadowed by the copy.
> 
> [...]

Here is the summary with links:
  - [net-next] selftests: drv-net: remove duplicate functions in hds.py
    https://git.kernel.org/netdev/net-next/c/3661253d2253

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


