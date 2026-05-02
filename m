Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0DBE54B;
	Sat,  2 May 2026 00:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777682360; cv=none; b=lpE4DHooKslf2lg5WMSAg7ONNU5vDUnIdVNbQsbA1ufKfRKa7Ts75NAPv22F17JwyDUA17sTxVhpJDYPS028SMNBtEy0lTh3QM1hR4EtJE8gyiCj74Fb3KMA/v4+pOIctmtGCMXcsc3ZXPqhbsZfgTJvl6SyBHWtp4pu4B194Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777682360; c=relaxed/simple;
	bh=A9P80tFDatGn9HK1Rhit/6p3pTgu+2au+Lp5WwFVn38=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DdGg4c5+l6+/FADBT6pVnQ1Zipb4uGCYuAAJViA0Xetw3yQzVoGkukiGY+42sFsMj5ESoUtASOoRnbRhgPqDPpoWvAjTuQaB44qf9UeCPJJ+yuqXoewNAaxJI9e2qjNgOGuILkwjvdAZXmYUNsuwdknDjik1x8zqliDULC9Ihnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LeXyTvxv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LeXyTvxv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A3E2C2BCB4;
	Sat,  2 May 2026 00:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777682359;
	bh=A9P80tFDatGn9HK1Rhit/6p3pTgu+2au+Lp5WwFVn38=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LeXyTvxvdhbtBM0AJEWfXwRayFrE0rN+jZO6D4igvu2Z78LaiYP/zu5RhIrve0f2t
	 iiW3Y337lKDu+xFEIj+daBc7cP4024+rxRWqe97zZqgNX6sbQFB3Ym8YsCdPXiIrjK
	 sUNxHJrdmk03cJNzuaFsM/xdG+YgLAWbcLdV/VVHC084CX+8y3LCbRf2Rymx8UEHEo
	 iQFUkDJ2TZO9IFK1A4BrnJQ5pAG10TgBtgV9ayaT8SeISafsNrIUck6uSkxmVV++1g
	 h+4sIDCByoGQbohAGzs9AjlZtdNUvMQ0Epzm8i6ipt9TqWlA3DsoQ9Mzc5ShdJi9hj
	 wdkrgI+3vkmjA==
Date: Fri, 1 May 2026 17:39:18 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, horms@kernel.org, linux-kselftest@vger.kernel.org,
 shuah@kernel.org, Willem de Bruijn <willemb@google.com>
Subject: Re: [PATCH net-next v6 1/3] selftests: net: py: support cmd
 verifying expected failure
Message-ID: <20260501173918.575ecdc4@kernel.org>
In-Reply-To: <20260430132820.1944517-2-willemdebruijn.kernel@gmail.com>
References: <20260430132820.1944517-1-willemdebruijn.kernel@gmail.com>
	<20260430132820.1944517-2-willemdebruijn.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 30 Apr 2026 09:28:04 -0400 Willem de Bruijn wrote:
> From: Willem de Bruijn <willemb@google.com>
> 
> Support negative tests, where cmd raises an exception if the command
> succeeded.
> 
> Existing fail values are
> 
> - True:            Pass if returncode == 0, raise Exception otherwise
> - False:           Pass unconditionally
> - None:            True iff not terminated explicitly
> 
> Introduce a variant of True that inverses the condition:
> 
> - 'verify_failed': Pass if returncode != 0, raise Exception otherwise
> 
> We cannot reuse False for this, because existing tests rely on current
> behavior to pass unconditionally.
> 
> Only suppress regular test failure. Python subprocess may set a
> negative return code on process crash or timeout. Those are not
> anticipated failures.

The fact that subprocess sets retcode to negative on crash / timeout
may be worth a comment in the code. I didn't know that.

> diff --git a/tools/testing/selftests/net/lib/py/utils.py b/tools/testing/selftests/net/lib/py/utils.py
> index 6c44a3d2bbf7..ef31c0ba47fc 100644
> --- a/tools/testing/selftests/net/lib/py/utils.py
> +++ b/tools/testing/selftests/net/lib/py/utils.py
> @@ -111,10 +111,14 @@ class cmd:
>  
>          stdout, stderr = self._process_terminate(terminate=terminate,
>                                                   timeout=timeout)
> -        if self.proc.returncode != 0 and fail:
> +
> +        if (self.proc.returncode != 0 and fail and
> +            (self.proc.returncode < 0 or fail != 'verify_failed')):

Personal preference but doesn't feel clean. I would have added 
a dedicated argument for this. Up to you..

>              if len(stderr) > 0 and stderr[-1] == "\n":
>                  stderr = stderr[:-1]
>              raise CmdExitFailure("Command failed", self)
> +        elif self.proc.returncode == 0 and fail == 'verify_failed':
> +            raise CmdExitFailure("Command succeeded while should fail", self)

Can we create a new exception type? Just inherit CmdExitFailure 
but name it more appropriately.

Regarding the message maybe: "Command succeeded (expected fail)" or
"Command succeeded (unexpectedly)"
