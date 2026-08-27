Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A063AB274;
	Thu, 27 Aug 2026 10:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787825471; cv=none; b=e4EsQH+zm8XuZ7FipmZw5rjKUjTcyjqjTWbQ4IImXo1sOvlHcZp+X9MoYacMg3ygQk+gMpb4GmUjKtvWJb6Avwk6ywcQowA1YljdKCcfGV34YXZooMcgxcKx9NJOPqspRmwUmaw9SIkiCDsHPZxJo4kXVu4ilF2AgcXY0hB7x/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787825471; c=relaxed/simple;
	bh=xujP5rH/zad5zCcbr687JFW/0n3uiE57wzs4CJRNnt8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=CInYP+b8lK3XK8nNKFq844BKu3ly2KBVu6jyFDD9nQFI3enplBAe5FvpYyjq/h3GeDn0e0UBlwBX0UyWE7PummRX3rjlNnwV6/4hgAe4cKmLdsUfvRAxMFTY7N/dYyvVfyvnUJqkkhNcwWSI10tr/n3R8wVDt0YsU/6eibxKrug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AD9omzWU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AD9omzWU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1AE91F000E9;
	Thu, 27 Aug 2026 10:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787825460;
	bh=auct4veIQ8Hmw1eCNeL7Uaf5Kwi5g/OmyshtmjRraMc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=AD9omzWUC4zspUGqm03/l5cYxJ0+7Y1kcgVXUfSbhiropMyuCIvq7zqxJ1H2MNG2f
	 H/zs+4qNCw19ctjngt5qHURpLBNwpH9BzvUV+gILL3q8cpJl6ySJViSoIlaxkGWtVP
	 TEO5IUpvYeDGroeH+W9ioCAuv5EFwgv9VSdZdDkGJRp1Da/IVfJ0gD0uR3/mxz3rlB
	 0Xf2xul77xCFSDG7Ptow9BUjh3lCTfG8lmn9yQUqHty6vCzL9U0acXPxA2pPAIdido
	 eiQaGYrMdgn8LIjS6DJhlEF0mgCXTdEvg1XSLoLYhT97yvp2gDc3iCszyabmmWdXd1
	 PJDgAXunx+quQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D09B53809A18;
	Thu, 27 Aug 2026 10:10:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2 1/2] net/tcp: fix TCP-AO key deletion in VRFs
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178782540674.1145855.8291296014675389448.git-patchwork-notify@kernel.org>
Date: Thu, 27 Aug 2026 10:10:06 +0000
References: <20260822201119.272269-1-rastislav.szabo@isovalent.com>
In-Reply-To: <20260822201119.272269-1-rastislav.szabo@isovalent.com>
To: Rastislav Szabo <rastislav.szabo@isovalent.com>
Cc: netdev@vger.kernel.org, edumazet@google.com, davem@davemloft.net,
 dsahern@kernel.org, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 dima@arista.com, linux-kselftest@vger.kernel.org

Hello:

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Sat, 22 Aug 2026 22:11:18 +0200 you wrote:
> TCP-AO keys with TCP_AO_KEYF_IFINDEX store the VRF L3 interface index in
> l3index. tcp_ao_del_cmd() validates the supplied ifindex, but does not
> assign it to its local l3index before matching keys.
> 
> As a result, deleting a key scoped to a non-default VRF always fails with
> ENOENT because it is matched against l3index 0.
> 
> [...]

Here is the summary with links:
  - [net,v2,1/2] net/tcp: fix TCP-AO key deletion in VRFs
    https://git.kernel.org/netdev/net/c/94ad9e114a1c
  - [net,v2,2/2] selftests: net: tcp_ao: test VRF-scoped key deletion
    https://git.kernel.org/netdev/net/c/687e5b48c4f5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


