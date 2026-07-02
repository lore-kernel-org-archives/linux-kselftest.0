Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AFF42E8EF;
	Thu,  2 Jul 2026 08:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782981029; cv=none; b=LGbYjN4RROxruFvDpwd9cybijCxzSalgYR6XR3+ooMvf0M777LSV2SvYEL68l5AuM4hk9aV+WE3z9sCO5QX5s5XlggbfAc6KhBbuU/ORLUfLzVovLoI2hVRHrNXAWEwHZLaDA3zlUwvFRH5ToqByYByQt04cj4l01Kd28bs19sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782981029; c=relaxed/simple;
	bh=2bw4igrpyVtfYaTd0hz65BxwFOe7o8+X73iYDYgqe28=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=iZbzmAat9rBxDXCqfWFkVyrA9gJmr+70i1yVzt5A4I0wXZL4MzJIbe7i1dvMze6ovjFotShz9aY9QVJHuGL8WfyvivEOfAoCwVbDazE7lq700jkaERd+8EmJl2SjIaJXukgb5Ng81/Sa5G7oR/018kDof+QtETnwhfOgHUD7tWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TZ9kBmzV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TZ9kBmzV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 577FA1F000E9;
	Thu,  2 Jul 2026 08:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782981028;
	bh=9vg0GTfChhCKZvm+cnRjJqJAGTBXlNMHOD0tSCmhl0k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=TZ9kBmzVb0wnkHwyoIwysyqSoauLx+Yk7L8H60ATyCFaNYQTWTWS+MHETYRcavWy2
	 OXugWfJQttS8W1OLJ+DwW/vbhffMTpnuv7CBYoG4SHcTu9SLjOG1t2rsrpqAI6ayI3
	 Cl9eCtYyJJk9Q1PvTqE9kKge+lTx7Lunz4ElLSidHcjaxURl49rLJ/NMM4IGbzPbJB
	 NcUqemCmfXeVIXGEIQVR+KBner/zDCRYZ1fN0KwmGMuYYtJa9xsE7ljAIAV075Y3ND
	 mym41dmX/s+j7Iadh+AYvRjifubBMnd0yoVedz8qzPMg3Jkezdx9OCTQqzhrt1BbvA
	 Br3PbOPmDBf2w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93A07392665C;
	Thu,  2 Jul 2026 08:30:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] selftests: drv-net: toeplitz: cap the Rx queue
 count
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178298101114.1518480.3634582587156593531.git-patchwork-notify@kernel.org>
Date: Thu, 02 Jul 2026 08:30:11 +0000
References: <20260629234354.2154541-1-kuba@kernel.org>
In-Reply-To: <20260629234354.2154541-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org,
 willemb@google.com, noren@nvidia.com, gal@nvidia.com,
 linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 29 Jun 2026 16:43:53 -0700 you wrote:
> The RPS test needs a free CPU within the first RPS_MAX_CPUS (16)
> cores. This is easily violated if the NIC or env allocates the
> IRQs to cores linearly.
> 
> Cap the Rx queues at 8, we don't need more. This makes the test
> pass on CX7 in NIPA.
> 
> [...]

Here is the summary with links:
  - [net-next] selftests: drv-net: toeplitz: cap the Rx queue count
    https://git.kernel.org/netdev/net-next/c/07d3aaa046ce

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


