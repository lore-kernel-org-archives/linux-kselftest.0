Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B11347DFA8;
	Thu,  6 Aug 2026 16:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786032650; cv=none; b=E+nvPaB7Cu02Hlyxo5KDHmx+9Xtm9xVwIc7HcrGVnW0ZZSPmcTki8QBrlxpEopJlTA3yOMcB6ON5c+ARK3bKWhAEB2oBet/v9/HMe2pa3ZHdvgVeGN5myCioqjer/XyR8ieqFggWas9eZOk/uWZDvV4zchA4q69sv1jJy1/n8nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786032650; c=relaxed/simple;
	bh=9Nzc8y/TABmfQN0UfVwKGSGx+0CFEfEpPfs555g0/ZQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Xj/yQBald4uUM2w+wOC/mu9AE8tZPgq0gBjMfdDpw9s2iFc2v9Qc4l7iRpee5J95yIRHpbM3bYwzEHbNMoRyO0N6lpHNxbo3iaQj5vdYQbS0NlWoYLnMe2hIfZLyy+/VONIgSHVqf7BL4yz298pMlfKNo4/g90isuAhkgRr3ZqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X+scKozD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X+scKozD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 127DD1F000E9;
	Thu,  6 Aug 2026 16:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786032649;
	bh=wof3NdQyqS+MjG+gb7yjlJyVsrCqSS74Uy8oGYAQ+l4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=X+scKozD3wPvugEk12WlXX8gEqwst5ZvanfBwzOsWnSypXIwTa2UrENxROvVljep4
	 jCN63+g6ao0bF0hwJWQeocwj+uccDa09KNXWwNUUFDUFTvsACTYNLd0gCBWONdkjow
	 U8yzH9OA1Q7yxs3V/g1XvRAJbgdOJwRKV5NnQK+FhO0RITFb6OwMuurgEbt2Hk7bx9
	 DiURF0OgOaLcos0yYEIJOhBZSVvr+Xkzmv6ffqlphm1CRMElpPlPKpDgH6fBW5pejG
	 tjOm3dVNrpnScW2q28IO9Afucer+fqnx2rSg6ZRHx37/owNI2lFMFljUYEtGK9Yyij
	 xeDpQYhjJtNew==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 938EE380820D;
	Thu,  6 Aug 2026 16:10:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2 0/2] tls: fix plaintext sk_msg ring over-fill
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178603260839.1358575.6345718479663374281.git-patchwork-notify@kernel.org>
Date: Thu, 06 Aug 2026 16:10:08 +0000
References: <20260804052837.49015-1-ppoo1220@gmail.com>
In-Reply-To: <20260804052837.49015-1-ppoo1220@gmail.com>
To: chanyoung <ppoo1220@gmail.com>
Cc: netdev@vger.kernel.org, sd@queasysnail.net, kuba@kernel.org,
 john.fastabend@gmail.com, dhowells@redhat.com, shuah@kernel.org,
 linux-kselftest@vger.kernel.org

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  4 Aug 2026 14:28:34 +0900 you wrote:
> An unprivileged user can oops the kernel by splicing into a kTLS socket
> whose open record already has a full plaintext sk_msg ring.  Reproduced on
> net (53658c6f3682) with a stock config, no KASAN.
> 
> Patch 2 oopses an unpatched kernel and passes with patch 1 applied.
> 
> v2:
>   - fix the copy path so a full record is never left unpushed, rather than
>     making tls_sw_sendmsg_splice() tolerate a full ring (Sabrina)
>   - selftest: drop the comments, one splice instead of four, reuse a single
>     pipe, compare the whole blob, sweep 16..44 fragments
> v1: https://lore.kernel.org/netdev/20260726105556.2719227-1-ppoo1220@gmail.com/
> 
> [...]

Here is the summary with links:
  - [net,v2,1/2] tls: don't leave a full plaintext sk_msg ring unpushed
    https://git.kernel.org/netdev/net/c/7bca91d63341
  - [net,v2,2/2] selftests: tls: add a test for splicing onto a full plaintext record
    https://git.kernel.org/netdev/net/c/3834e079d67f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


