Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBF83B9935;
	Sun, 13 Sep 2026 06:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789279449; cv=none; b=uqadN8JvKRpFizaUM+6/c5WrDOm/bc0EOeRuEgkPK7Bj7MMM7qB42pK8fBjTdkQ2Pp4E7F/ghRyLaurGubqRi3XM5QAb1VI7ez6GVgyO4hlv3Iptxue6hFRFOBjtQnc1+BhQgMXqQMjxTdkY55STzBqZplR3Sm2A+UKRk7HMhu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789279449; c=relaxed/simple;
	bh=ATAeMGZD4vD5HW0k8b3zhd352cXuT2Lwx7r/WSp8mP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nlqvQnJCvm1ENQ0UJDCi7RNsqh3c3Z4oUfAZLYHegHAoajx91j5hATwAGgSbHNFMgVdGY3I+qN2gKjF+u1A65zsDenndb6nze0efyJGJXk9ErPgjdGibJHd9bTCjgclioM75/9syW83DMSFX8t3UH14DDjI9gCowTaLaeX+zqxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=j07UY2BE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="j07UY2BE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0C931F000FF;
	Sun, 13 Sep 2026 06:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789279447;
	bh=O34+2PnHiz3Vm899rLDRRsIYbx1e3lEMZD7bzXxtsPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j07UY2BERQjUrfYT81ndLWHVFs/04f9ml+kKFuXCE7upldKkdYIsOgWWavyjpug7X
	 lXPeg125m6U+ioPUIwbqCL47x5jwY4jU55zwqvABfEsOpw+6zYqOqPHMKxaXN0AC18
	 m9fXAqF+ikeZhRis0wV3JjJj4z0WHqbLf2oUdkbM=
Date: Sun, 13 Sep 2026 08:02:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Carlos Llamas <cmllamas@google.com>
Cc: Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Shuah Khan <shuah@kernel.org>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH] binder: rm -f binder.c
Message-ID: <2026091341-engulf-tattoo-ca3b@gregkh>
References: <rm-c-binder@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rm-c-binder@google.com>

On Sat, Sep 12, 2026 at 09:41:10PM +0000, Carlos Llamas wrote:
> The day has finally come. We are dropping the legacy C implementation
> of the Binder IPC driver in favor of its Rust version.
> 
> For 15+ years, the C driver has grown increasingly complex, making it
> incredibly painful to maintain and land new features without tripping
> over vulnerabilities. The Rust implementation alleviates most of
> these issues, so it's time for a change.
> 
> Alice Ryhl has worked hard on the Rust binder for the past couple of
> years, not only achieving full feature parity but also proving that it
> can match and often beat the performance of the C counterpart. Having
> run successfully on Android devices for some time now, we can no longer
> call this an "experiment".
> 
> It's time to move on, yank the C code, and focus all new features and
> optimizations on the Rust driver.
> 
> Long live the new Rust Binder king!
> 
> Cc: rust-for-linux@vger.kernel.org
> Acked-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Carlos Llamas <cmllamas@google.com>
> ---
>  drivers/android/Kconfig                       |   39 +-
>  drivers/android/Makefile                      |    5 +-
>  drivers/android/binder.c                      | 7186 -----------------
>  drivers/android/binder/Makefile               |    4 +-
>  drivers/android/binder/rust_binder_main.rs    |    2 +-
>  drivers/android/binder/rust_binderfs.c        |    2 +-
>  drivers/android/binder_alloc.c                | 1409 ----
>  drivers/android/binder_alloc.h                |  189 -
>  drivers/android/binder_internal.h             |  597 --
>  drivers/android/binder_netlink.c              |   32 -
>  drivers/android/binder_netlink.h              |   21 -
>  drivers/android/binder_trace.h                |  448 -
>  drivers/android/binderfs.c                    |  786 --
>  drivers/android/dbitmap.h                     |  169 -
>  drivers/android/tests/.kunitconfig            |    7 -
>  drivers/android/tests/Makefile                |    6 -
>  drivers/android/tests/binder_alloc_kunit.c    |  572 --
>  rust/bindings/bindings_helper.h               |    2 +-
>  .../filesystems/binderfs/binderfs_test.c      |    2 +-
>  .../selftests/filesystems/binderfs/config     |    1 -
>  20 files changed, 9 insertions(+), 11470 deletions(-)

Yeah!!!

Great job everyone on this, I'll queue this up this week when I catch up
on pending binder fixes/patches...

thanks,

greg k-h
