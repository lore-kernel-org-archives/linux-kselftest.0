Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793726320;
	b=xnmxH6By0IgdUcm+XTuEp6qg+mNbKazqj7VZl0Eza+1Zt/6ci2cms4jvzesw52NeDvtc
	 UBVCG5YzEVbtfdiGTU9/ypnKtWCe47p/OFwNBJsA+aK+Km+3bF7oFwAjH+VX+RmUWQUFn
	 1DeWeYqnciUlycy5RlVnHqu2zHxntvLZlVPJpE86XA37+RvyW5txPktMMc+I7eFDtN6tv
	 ToKNWq2rDOlnHjQJ8LjHey6VwmZTrPaYEh55YD6vHDZ0XhdWoUbf3z5aUWOa2chUJ/V9B
	 HfEsBby1SfJ2H5AyfnbO6aqKpdygNlNg/9qkIGFkLxV8KGQzhZ0/7NnF4Gs/c1hZf1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793726320;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=zUB0hsoYpltSXGgmhjCTbURxtzzGIGicuUjcqG2tTT0=;
	b=yBLA7Qe2LN5MENpgseLURrgzdpjGCVTRFo8cy0w4AVbBhnKPNoLIsE1IYBtTSALIFVV5
	 QJ6vTqHbkfAe6MjoAXCwZEIUn1H7hO0uXg2w4rBLl6YYN3CxOXs3t6+swJuElPupJyuVs
	 lEI/5YNac3BVVyb29i02vQJ5qC74L0P7eO81CPSpV3/IdnKx1vsG4mHXxmS7ER5rTGCFb
	 qfI0UiGGtNkRoOqyOH2ojs9nUko1CTvi+YquFLN9X19P1B9MzMWxhM73R9X0G5i6G9HvV
	 0hN0kEIlvi0rkDlz/qQJy2ZU2owW5aowxkRNFCLO8g3JAqC386U4rm6vZCOrRacu0AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=S3SUQB5y;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E87606A31B;
	Tue,  3 Nov 2026 17:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48E87606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=S3SUQB5y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zUB0hsoYpltSXGgmhjCTbURxtzzGIGicuUjcqG2tTT0=; b=S3SUQB5y1+ytWwuP5SrKm7EFV1
	PFAKSr4Kj0JHctbaWZMzZON2t2/Fp0BaBT6XVTbxMsnpuWQJG4z/1rjrXusKvv32ZBvV89NIlj6AV
	wtpWI02I6QIOiaK0rR9LsqdEDbhzn/1yVsFDk7ph8Poy7SsuzbQd6MkH2YjGJOUthX+PMw/HnFzBN
	4sd6FMzX+wJ+tsQgxU7k9iUQw2VJoS8MiF2R3tKS0PQ1XXOKon7CPKB3MbXgJ49+8ltIMcvbRwCBO
	qVXnK91yhQh6l693aFRhWhlx3AT8aLskx46YLfFzujsBoFhozx3oKD5zy/Wd5nmSGNGlXU56HaPvT
	OmhdQh7w==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xOI9c-0075lY-2u;
	Tue, 03 Nov 2026 17:18:37 +0000
Date: Tue, 3 Nov 2026 09:18:31 -0800
From: Breno Leitao <leitao@debian.org>
To: Sasha Levin <sashal@kernel.org>, chleroy@kernel.org
Cc: Andreas Hindborg <a.hindborg@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/configfs: fix the build on 32-bit architectures
Message-ID: <auoW3rXVeBkgM4qp@gmail.com>
References: <20261103141627.30838-1-sashal@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103141627.30838-1-sashal@kernel.org>
X-Debian-User: leitao

On Tue, Nov 03, 2026 at 09:16:27AM -0500, Sasha Levin wrote:
> The fixture setup checks the result of mkdtemp() with ASSERT_NE(), which
> hands the pointer to the harness. The harness casts both operands to
> intmax_t to print them, and on 32-bit architectures gcc warns about the
> cast from a pointer to an integer of a different size. The configfs
> test builds with -Werror, so it fails to build there:
> 
>   kselftest_harness.h:797:49: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
> 
> Compare the result against NULL inside ASSERT_TRUE(), so that the
> harness only sees an int.
> 
> Fixes: a7fdcb2edd0f ("selftests/configfs: add tests for the userspace interface")
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Thanks for the fix.

Reviewed-by: Breno Leitao <leitao@debian.org>

> ---
> KernelCI's 32-bit arm kselftest builds fail on this. Built
> configfs_test.c with gcc 16 -m32, with and without _TIME_BITS=64 (fails
> before, builds after), clang 21 -m32, and both compilers for x86_64.
> 
> The harness cast warns for every pointer comparison on 32-bit, a few
> thousand warnings in one KernelCI arm build, and configfs only breaks
> because of its -Werror. Making the harness print pointers through
> uintptr_t would be a separate change.

Christophe posted a harness fix for this in January, but it was never
merged?

    https://lore.kernel.org/all/948937bfe461cf0fb6ade2623e51f673f845fa51.1768298756.git.chleroy@kernel.org/

It still applies to linux-next, and with it configfs_test.c compiles on
32-bit without this patch.

Either way, I will merge your patch tomorrow if no other review pops up.

Thanks,
--breno
