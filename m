Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8A830101F;
	Mon,  9 Mar 2026 21:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773090384; cv=none; b=JTQzGgGseoZL0yDOUHkJhmxCmjsFxIkM621KNDGWc5ejG7fqHiIlxdX4O/pYYfoUvCfUB8C/uY4T7A0nVRVNn7GTY0JfakktI1Y91yrlkr5s02t2egw04VN8qA1vDmnRriIfCHgBYNftaP8xtkA63j/ehn6K+g0B7DLBpDkgt6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773090384; c=relaxed/simple;
	bh=394tMn2i3QgrPSVwxio7meDWyh9tuN7/Kb4fawfNK30=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=YdD4T/Ws6SKF7a4WbYPffZi5GW/7kE6AFmtNtnhvAYGqjHQbRq2e/gx/A68CKpoADCa60xyVpZD/pLUVB9RW2n0GUuAH3nuTVp4xlhGzDMr7hjU9lUsI8qWlEfrHIcM54MDQMZ9gE8kS9M9XRyfS1XQLM5mCb0c7G9dJyuGI+aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=EN/0x0Q+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="EN/0x0Q+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84956C4CEF7;
	Mon,  9 Mar 2026 21:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1773090383;
	bh=394tMn2i3QgrPSVwxio7meDWyh9tuN7/Kb4fawfNK30=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EN/0x0Q+suGeyNYRhR3fwe350ttsjzhBzYNu2qkXZyx1BYGPxEne8AK2/bG7mny+D
	 GKh7dCOWAOxbw2D6Ti9E1TcBUmLD69zjzp5KvskG5AMuJnL1ZnhUroZaTRVg7AFMAQ
	 R8GxWoGwlnW+wCxgs/sLn1xs9RWbpaRPe+VwMxnM=
Date: Mon, 9 Mar 2026 14:06:23 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
Cc: Shuah Khan <shuah@kernel.org>, Wei Yang <richard.weiyang@gmail.com>,
 Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>, Chelsy Ratnawat
 <chelsyratnawat2001@gmail.com>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: fix ARCH normalization to handle
 command-line argument
Message-Id: <20260309140623.f0ed9289571da7f9b690aae2@linux-foundation.org>
In-Reply-To: <20260309205145.572778-1-aleksey.oladko@virtuozzo.com>
References: <20260309205145.572778-1-aleksey.oladko@virtuozzo.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  9 Mar 2026 20:51:45 +0000 Aleksei Oladko <aleksey.oladko@virtuozzo.com> wrote:

> Several selftests Makefiles (e.g. prctl, breakpoints, etc) attempt to
> normalize the ARCH variable by converting x86_64 and i.86 to x86.
> However, it uses the conditional assignment operator '?='.
> 
> When ARCH is passed as a command-line argument (e.g., during an rpmbuild
> process), the '?=' operator ignores the shell command and the sed
> transformation. This leads to an incorrect ARCH value being used, which
> causes build failures
> 
>   # make -C tools/testing/selftests TARGETS=prctl ARCH=x86_64
>   make: Entering directory '/build/tools/testing/selftests'
>   make[1]: Entering directory '/build/tools/testing/selftests/prctl'
>   make[1]: *** No targets.  Stop.
>   make[1]: Leaving directory '/build/tools/testing/selftests/prctl'
>   make: *** [Makefile:197: all] Error 2
> 
> Change the assignment to use 'override' and ':=' to ensure the
> normalization logic is applied regardless of how the ARCH variable
> was initially defined.

lgtm, thanks.

> --- a/tools/testing/selftests/ipc/Makefile
> +++ b/tools/testing/selftests/ipc/Makefile
> @@ -1,12 +1,12 @@
>  # SPDX-License-Identifier: GPL-2.0
> -uname_M := $(shell uname -m 2>/dev/null || echo not)
> -ARCH ?= $(shell echo $(uname_M) | sed -e s/i.86/i386/)
> +ARCH ?= $(shell uname -m 2>/dev/null || echo not)

What does this `echo not' do?  ARCH=not if uname failed?

