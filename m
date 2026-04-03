Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522022D781E;
	Fri,  3 Apr 2026 18:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775241023; cv=none; b=IK2x4yKjR31ekxyBfLxRmmmhR3pb2QbAvc0f1PjNhM5VC8XwvQkhb9XP2GQtNVfYRJ4LUs6+V2y5UZtNC8xhze5HxMMHpBGQGt5bwRDWmSLO5yZndFXWyCokTnFqLw8YtRJcrAuZWxHQo7ul4AEk4wfAJRONKg0cId1+epXt4s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775241023; c=relaxed/simple;
	bh=hULkS0nleTbhKDI0VdhhF9DZ2SvyfPygrOijnrqFZJM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ZxIIaR0eEBvOoQQpDv6a+IotyEqg+D5kCItrsp5CmHx9alhSwVIhEaODGyA8pTSuwKeWSO61zjLVxAfZ3NH8FDBF56wi0CxhE+ukSIr6KM413rb4LsI7qYILDuW0r79QRVAsq6DDiV41q97H0PpGYqt2ArT1s+9qfJoLTrkYn4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gqFFdPzH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gqFFdPzH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2241C4CEF7;
	Fri,  3 Apr 2026 18:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775241023;
	bh=hULkS0nleTbhKDI0VdhhF9DZ2SvyfPygrOijnrqFZJM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gqFFdPzHyL+b9h9f7SdycP5dJrneKqpr7Z1I/BO2hfG9h420C0pf+p0Yx4ZNVFQrc
	 ZNxbHw7BcD7vzkvBg63FVJ69fAF/HelAFOqE6iNq1sdA3vLDh9qNTJbEOphy2WdBnd
	 wBLdeC/T/ucx4rKy44llNtcx7BCoA0Lhugw6hn+3vXKTO5TuN2H53kWj/IYJKb4QFC
	 lOqrxCV99tprtsfEqOjvLXILhtg9Jx6Bsr9OfdVfGnU8yJekm5ldYMay7UP+0vOHRm
	 WNoTZD7R5sF6Y6ldEu3J/7ehooVWdkWFvWxcczsK7pKuZ8u9v2bkUchoMYhmBzj1gJ
	 ywx9xHsEFMJbA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9F073809A14;
	Fri,  3 Apr 2026 18:30:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/4] selftests: riscv: Fix compilation issues for
 v_ptrace and cfi
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177524100454.1406513.15002331983137680726.git-patchwork-notify@kernel.org>
Date: Fri, 03 Apr 2026 18:30:04 +0000
References: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com>
In-Reply-To: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com>
To: Charlie Jenkins <thecharlesjenkins@gmail.com>
Cc: linux-riscv@lists.infradead.org, shuah@kernel.org, pjw@kernel.org,
 palmer@dabbelt.com, geomatsi@gmail.com, andybnac@gmail.com,
 debug@rivosinc.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This series was applied to riscv/linux.git (fixes)
by Paul Walmsley <pjw@kernel.org>:

On Mon, 09 Mar 2026 18:52:09 -0700 you wrote:
> There are a couple of compilation issues of the riscv selftests.
> Coincidentally two of the issues are independent problems with not
> including the header that includes the BIT() macro and the other issue
> is from checkpatch incorrectly suggesting to remove non-redundant
> braces.
> 
> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> 
> [...]

Here is the summary with links:
  - [v2,1/4] selftests: riscv: Add definition of BIT() macro
    (no matching commit)
  - [v2,2/4] selftests: riscv: Add braces around EXPECT_EQ()
    https://git.kernel.org/riscv/c/2ff48e038210
  - [v2,3/4] riscv: ptrace: Fix BIT() compilation issues
    (no matching commit)
  - [v2,4/4] selftests: riscv: Add license to cfi selftest
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


