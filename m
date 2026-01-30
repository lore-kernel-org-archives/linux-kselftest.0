Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A95C3346A0;
	Fri, 30 Jan 2026 10:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769767901; cv=none; b=XDDDzuWb8eeOAM/X2SnHWEYgPaJNlE64BL4OqPsbsjGM8T/luNoj/0jnlRwp31LQCeQc79f8Sk/Tmtm8qJvcaNsXYj9AAZHLwaWzg34YAR4pJlCJwLTCk0787d2qgUhxTNdKwKE4GMqKY4Y5gpM8wY9JgsIqdzY5y383XaezINc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769767901; c=relaxed/simple;
	bh=9MLMNv6i/VETsajuHB63tIw1p1yq5Nm0ZcNMwIX7BuY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=N4+1bUaTrff9Usgp+3fhmBG7ztIUIIs5miQd7gz8AqrlST5BtOXBUJ0rWXJWFyCWjsKBI6zmqciAVoCrR/mqBA5HU9xYC83/6owgT66qXyE6f3K8HcQeXBKYbUAc009/HfQLPwoQlf/i41ymWXw3tt5f526ouM7IF+GBAvgdOy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DdFuT2+V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DdFuT2+V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71A36C4CEF7;
	Fri, 30 Jan 2026 10:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769767901;
	bh=9MLMNv6i/VETsajuHB63tIw1p1yq5Nm0ZcNMwIX7BuY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DdFuT2+VHs6kZg8CD5iPcNfYkkCu0NIDtSMa4iYCb+f5bAx+3oS0UcEGevaYTYpUN
	 N3xhfjgdq5UoBg3emDII5zo6WtOq7OYzY+apggaXyNg856pBizL6BNjeHAxj9qqp5n
	 0yNfOhA0u3ynkPfzpGdiwZ+JBs12LKZGIIfSIVS+oTs3vxd+WtHuCZQ3ZrSba+mIdh
	 +rUhAe2Ragr0DoPnsHEiC7JMFbUt84yD6W3OLpgL6V0Avk0k013+UTpdz+mrXkIQPA
	 jbQcH8iliPqJzY+DPiciFor4gNQ5WsNvKWTrUwFh6iQoSfoyOGPRAFiOHF6NVGqAyA
	 wU0R9XQ1Z2yWg==
From: Thomas Gleixner <tglx@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, peterz@infradead.org, luto@kernel.org,
 shuah@kernel.org, kees@kernel.org, wad@chromium.org,
 kevin.brodsky@arm.com, deller@gmx.de, akpm@linux-foundation.org,
 charlie@rivosinc.com, ldv@strace.io, mark.rutland@arm.com,
 anshuman.khandual@arm.com, song@kernel.org, ryan.roberts@arm.com,
 thuth@redhat.com, ada.coupriediaz@arm.com, broonie@kernel.org,
 pengcan@kylinos.cn, liqiang01@kylinos.cn, kmal@cock.li,
 dvyukov@google.com, reddybalavignesh9979@gmail.com,
 richard.weiyang@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: ruanjinjie@huawei.com
Subject: Re: [PATCH v11 01/14] entry: Remove unused syscall in
 syscall_trace_enter()
In-Reply-To: <20260128031934.3906955-2-ruanjinjie@huawei.com>
References: <20260128031934.3906955-1-ruanjinjie@huawei.com>
 <20260128031934.3906955-2-ruanjinjie@huawei.com>
Date: Fri, 30 Jan 2026 11:11:37 +0100
Message-ID: <87tsw3l89y.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Jan 28 2026 at 11:19, Jinjie Ruan wrote:
> The 'syscall' argument in syscall_trace_enter() is immediately overwritten
> before any real use and serves only as a local variable, so drop
> the parameter.

This collides with the already queued time slice extension changes,
which rely on syscall to be handed in:

https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=sched/core&id=dd0a04606937af5810e9117d343ee3792635bd3d

Please drop this for now.

Thanks,

        tglx
