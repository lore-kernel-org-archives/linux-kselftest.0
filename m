Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CD5547062;
	Tue,  6 Oct 2026 00:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791246008; cv=none; b=OyAXL6BPuvjBx9MTOmwUZDZrzFvORU5NyRvaKuBsTFgWjrvTOyP1CtjbSQRrG/kpGeuH9KwvGrFNm9hvv21alfzGDebJkhWeYcg5qMA9E/xpYZ/0PTqKAjU2Br6Yl7KGYljGXXwTkOtNWTTSPYcWo+7NE0deQ79RdItDZJNMGD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791246008; c=relaxed/simple;
	bh=0QgLFJx7qh1jeoXpoQjm+gWrg0zxEdDQUluByRBzoI4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=LymSX0U/ZIR/2zGeao5Hn8pwI8yWvjJGalEUH1H90MTTAxklrhrVwPKqJkfeWDB0blvY/nmcNTjkZH7DJWcfAHduUeJgYrvzPXC7+MXkLpV3xFpdWY+gyjfVId1UwaY2zJYoGLKlI5PMJ+Cdu5mrFqHYjgxmv8yKXM3oth3bnAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gUH+7cQM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gUH+7cQM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCC851F000FF;
	Tue,  6 Oct 2026 00:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791246006;
	bh=IVwR6zzcDg7nV42uU1/dBeG+bego9vgJLfPHLUYsOug=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=gUH+7cQMGv3D3fGF8xmmN3/U37aKBQUAuvDvyriH71roGigRkCILZVqBpWZGS7WJ7
	 KkAJkWJRKM/inPdfFVNUTCbqQoBnrbaYui1YExcCAJkpVgV+7g1Y77jiWV63mMzAI9
	 YJlrNJcMU9fX4maPr+XUYKyV38m6d6QKAjoZO/6c1e/8Cen942qBExCo5yqFMA8b5k
	 swQWcu+kzIisQNV2LQjM4ZkkgGNn9eexBhj9vXjgcBGpxI2jC4S1lDavKRAhkDnXxX
	 JDgU2G1jWTlIbl9FGD6FLBT7jtQ/Dghlwxf6N0GEVAtC+zE2x88alvQiSVU5mMflj/
	 TRC15eDdSnRIA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B4312392667F;
	Tue,  6 Oct 2026 00:20:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] selftests: net: Fix minor issues in
 cork_fragsize.py
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179124600557.1950904.6171696782618709280.git-patchwork-notify@kernel.org>
Date: Tue, 06 Oct 2026 00:20:05 +0000
References: <20261001124201.584805-1-alice.kernel@fastmail.im>
In-Reply-To: <20261001124201.584805-1-alice.kernel@fastmail.im>
To: Alice Mikityanska <alice.kernel@fastmail.im>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, alice@isovalent.com,
 sashiko-bot@kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu,  1 Oct 2026 15:42:01 +0300 you wrote:
> From: Alice Mikityanska <alice@isovalent.com>
> 
> return None is unreachable in check_kernel_config, because the try block
> always returns a True or False value, and the except block continues the
> loop. The return None was supposed to be outside the for loop, to make
> pylint happy by making all the flows of the function return a value
> explicitly.
> 
> [...]

Here is the summary with links:
  - [net-next] selftests: net: Fix minor issues in cork_fragsize.py
    https://git.kernel.org/netdev/net-next/c/363cf8def362

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


