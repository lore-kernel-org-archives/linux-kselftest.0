Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D851A23B6;
	Thu,  5 Feb 2026 02:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770257877; cv=none; b=Jnkmzp7T4M98JZVNDRKAnDJKlfvWH42V8/PFNBjEWlsr/5hJgs4okyLd006boZSik1yflgJPHN9AJeJMDytBsqpGXjBg/oe/ToswyDIye03lJeR2ZwD7fUJb+sUef1opJGf0jy8EFRAX9rSmKF4sDCIb54gHlxoFRclkiPsx1Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770257877; c=relaxed/simple;
	bh=L0DvYHQJNJF/lC2P+KJGIREVhsBH84sxbUkIriKsYvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AEgI5BnooF3082dm4SgJcmNTpxWip1luBS8slBEmlfMKLLoisFBMFqqt/8mpXYT6s2ydlLMxKwiZ9sOu7uyqYshnu003vRMpxFsnF2AMkzVrwzEQZ4eh1ZUUgNjCbeKK78frZTO6NswbLjK/pTBAfKVB6LiAyX96FzSrzNRfbW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CDJ5IFaS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CDJ5IFaS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA3FAC4CEF7;
	Thu,  5 Feb 2026 02:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770257876;
	bh=L0DvYHQJNJF/lC2P+KJGIREVhsBH84sxbUkIriKsYvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CDJ5IFaSPf4+lkkU8WykvVjk3cg/Y4IRTcNsjJeysbwSeJY9nNqjHiyY6F//5G+hK
	 gZRbt6lAtxzZmheg/kdC5WUJk1tk1ODvxRxoKZAf6SaE8qYzCZvvcxRounKA9hmvVK
	 4cdYqgipTIoMmvxdOTnmlWkzgOgLuoQDluTfGu8Als5vPv1PuVprshmCgJbizclvBu
	 TwaiNlHuK9XgQDWaBKNcg9DLXAZQRwknpxzaJX4HA6JOKI3cvLVsVDVi8XY1Wzyeh/
	 kwkPbFIWQ8X6A2SQja0YO4z4RrBurb3Uz3r8SnIOtFpVP7qlHFKNqyduSSsCcCdOtK
	 S0CnFr27yym0w==
Date: Wed, 4 Feb 2026 18:17:56 -0800
From: Kees Cook <kees@kernel.org>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: luto@amacapital.net, wad@chromium.org, shuah@kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, glaubitz@physik.fu-berlin.de
Subject: Re: [PATCH] selftests/seccomp: add Alpha support to seccomp_bpf
Message-ID: <202602041817.3967F048D@keescook>
References: <20260203063357.14320-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203063357.14320-1-linmag7@gmail.com>

On Tue, Feb 03, 2026 at 07:33:26AM +0100, Magnus Lindholm wrote:
> Enable seccomp_bpf selftests on the Alpha architecture by providing
> Alpha-specific register definitions and syscall accessors.
> 
> This allows the seccomp-bpf test suite to exercise syscall tracing,
> seccomp filters, and user notification on Alpha.
> 
> Signed-off-by: Magnus Lindholm <linmag7@gmail.com>

Great! Thanks for doing this. How did you test it?

-Kees

-- 
Kees Cook
