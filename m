Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E533E00B6;
	Tue, 18 Aug 2026 03:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787025496; cv=none; b=Y/jCk8M1DSclTmalPEuRXA2gsKjtncYW8yvgNYcHZHmDEN+DuNEFVp53+UP6VL/dRp3lv3neOTNZkZr2b0ui5/KTDJyzQJMULpItduYS43BUxeTes9QFiWJMyiH6yDByPM5z+gBqZlsCvAY07cjkYf8I4KnNAq1TfDAQK4ilu/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787025496; c=relaxed/simple;
	bh=p8ylFoaQ2EoB7gOXb846nKO8P0yXlY19FhG4AQBJO4I=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=lcW/amkZL/wmoOisCD9+D6SvNB94kDmarKV8r3YTpS7t34OI0l7nEavH1kmRXJSmyTjgVInHs3QWUK6cb2njRZiF8v2T0KgYOCwp3VMvArcAPdB5CrLgaCYkOupPRHet1zK0w0SFD2zgwJW7IzRYIvyOnKmJeDbcNNyhIZpnoDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h8uvFJcl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h8uvFJcl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3381A1F00A3D;
	Tue, 18 Aug 2026 03:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787025495;
	bh=px90yepf9BHb3RAZ+sYHDCZ+dS0pcMS0qsJLPJBOLhM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=h8uvFJcl5blFeazmdgEDOkUmVJdeUX1hpFIk+IXZnKYqZ9fGyZqTUmm+PmQP+vOJU
	 KLQg1Gzgf5f+NLumZf4fRmkQxEVEamtGlM3Dh0UWbN0102MB0CY7jlEJvu/rMX7x8n
	 GorrMGpbcoLilyQlSZctgXwaumVsryCwwx9bRZ9NWkQSUNhrxQbMcRx8/4sf3Keq0T
	 1nzI6JPqRyRBVyPFEkqtkg/LU2HfnvwlJjeUrqQmyQNEqs+WmyxPLjtrBz2D8UNg9K
	 zxDZ+Hk77moZNhuS09NFIb10X+HDxxZxOI5LRcXpsuyQaYCDzdpi29gvZs/vpzFVI4
	 qNAoEaQqLrtBA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569103926381;
	Tue, 18 Aug 2026 03:57:28 +0000 (UTC)
Subject: Re: [GIT PULL] kselftest update for Linux 7.3-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <a5c7d1a5-46b3-4bca-9b5e-96355591b6b2@linuxfoundation.org>
References: <a5c7d1a5-46b3-4bca-9b5e-96355591b6b2@linuxfoundation.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <a5c7d1a5-46b3-4bca-9b5e-96355591b6b2@linuxfoundation.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-next-7.3-rc1
X-PR-Tracked-Commit-Id: 649ba27dfac784427a01f9c95c09ecbcb88900d8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0f23d56f17fdfc7db69d51f64c8b91bbab947aa9
Message-Id: <178702544698.1862718.3272985470868983915.pr-tracker-bot@kernel.org>
Date: Tue, 18 Aug 2026 03:57:26 +0000
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Shuah Khan <skhan@linuxfoundation.org>, shuah <shuah@kernel.org>, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 17 Aug 2026 14:45:56 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-next-7.3-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0f23d56f17fdfc7db69d51f64c8b91bbab947aa9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
