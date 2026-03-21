Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A9A1FBC8C;
	Sat, 21 Mar 2026 00:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774054419; cv=none; b=lzh8SKQ+58MqDpzUkyE26llKbR8UqHuwKP51/9LwkzKsxq/YBvFFPo/UncntcWSuZGHZVfEsA2x0wojzXEE1SaIIsebxpR9mgQCVt+iOjuPe0vUDQkzu8z3lN2ZJP70uTPBue7989f9UwDz5UrV7P96Uiz+Pb/Fv+C6IBrfi+W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774054419; c=relaxed/simple;
	bh=5SupC/QboNW6HtcGYgPPKzGRtNz7S166REYF09l7I0I=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rIiacjOxm9td0vUlSFsh+Nul+NXmV9NIHfNcIAD79FXhPNHhwQ29Im6QlwyJS4mkRrHFGUoLCGX7XbokwUmlWpk+PyuV7dWzn2zzHHEV09gAWdHMrunWwAzli0fc0Dpe61E+nCxJZuLVK74ZyTZYC/D1gJJBjeD6Hkd8XmfETOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QO+4LKwd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QO+4LKwd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BE55C4CEF7;
	Sat, 21 Mar 2026 00:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774054418;
	bh=5SupC/QboNW6HtcGYgPPKzGRtNz7S166REYF09l7I0I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QO+4LKwdMhwOM+/UH0bS7idbp4v3HJsD+kWCXOaX3a6WIWp+8LttKKtahNcoAYmbb
	 H7mdJAuLi1bUNOuEA9YRQXWpYRDb8lubmP2NDImGNR21E+105Vjy5eDjzciNztm7lm
	 nG3e9yJNvWcknkfJ7toBfbIEEh7Q9xVGFkAMbqENfRP849QH7eyi31Dq3KFccmck3T
	 3AmFLfwKzcZEz+5ZyM6iOusJd+RRe55mJkatsj/g+ETTbJntbSiWQj9EcjHHso0OkG
	 t3jCQvMO4kkrvERmkFYnjUYymuYkTDlOoxU8ChgEQyeHXdsqxOaq1fatJdWn4LcL1f
	 pFiB5LyLvDzag==
Date: Fri, 20 Mar 2026 18:53:37 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Charlie Jenkins <thecharlesjenkins@gmail.com>
cc: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, 
    Sergey Matyukevich <geomatsi@gmail.com>, Andy Chiu <andybnac@gmail.com>, 
    Deepak Gupta <debug@rivosinc.com>, linux-kselftest@vger.kernel.org, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] riscv: ptrace: Fix BIT() compilation issues
In-Reply-To: <20260309-fix_selftests-v2-3-9d5a553a531e@gmail.com>
Message-ID: <d87c7b4c-5849-6254-8e85-805c752acb5b@kernel.org>
References: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com> <20260309-fix_selftests-v2-3-9d5a553a531e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-680884709-1774054418=:243157"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-680884709-1774054418=:243157
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Mon, 9 Mar 2026, Charlie Jenkins via B4 Relay wrote:

> From: Charlie Jenkins <thecharlesjenkins@gmail.com>
> 
> BIT() is being used in ptrace.h without a definition, resulting in
> compilation errors in tools/testing/selftests/riscv/cfi/cfitests.c:
> 
> cfitests.c:101:60: error: implicit declaration of function ‘BIT’ [-Wimplicit-function-declaration]
>   101 |                      if ((cfi_reg.cfi_status.cfi_state & CFI_ENABLE_MASK) != CFI_ENABLE_MASK)
> 
> Include linux/bits.h to resolve this issue.
> 
> Fixes: 2af7c9cf021c ("riscv/ptrace: expose riscv CFI status and state via ptrace and in core files")
> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

Thanks, queued for v7.0-rc.


- Paul
--8323329-680884709-1774054418=:243157--
