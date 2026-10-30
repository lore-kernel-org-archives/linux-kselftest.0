Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793342210;
	b=GkOVZA25Tu7ler35NdtnOFg0mTiXLRZNd6MJC9pYwjAYgB4mfUlOFuhamEo7L6B39XKL
	 HG9kRwgIJgcLBruH8UqbOen6VZzcjOjWYrXNFa3XD4ApQyhk5ENXktcokYyHjdQLOhE5H
	 bzldHEkutAWAqPcfbfz6hkq/97TrnOv0NjyLgyHHXaM6BI4zVJ5ABbh/bJnEzllDUbg+O
	 /tzp/RAYRoSHuXhA+k4uG8ZMqJ3tWLQRRzVp9Xwx2oPoNoesfTWZmtMgUvOymEg+73l+r
	 54wZEkJViLv22ZyZ6+zPUuM9dMAFQIn50riM9OOalPrqoZXoAHbdMaN04CvJI97bhCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793342210;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=N+7zvAqlp0d0d7Gr2cOeiKROaAc+i7VSl3up75bUsok=;
	b=QSHaxHJC6O6dDzQuzwZf9j9eSVP5VjrnJ9R6bSavPBaJdBspIQs8+8qdqgWWXOdZ+ohF
	 VOmg3a3vLLsqCJDh4aixuS+02Af97KrRuaIBsQYnfnZ3mnurC643VyG/w5H5ng6SLccI4
	 iDpeItewceURuPrYJYGapPboel6Sdw2TS1f5ck/bHKPXQ1prl6OxuFn7dcOwTz6oS2dNZ
	 v4PAVDmHqMGNTIsmWZ5qVtC5C2YjqX/7UIgQ4RSqQGm+q6qIDRJMaEe79ts3JHhpv2RYe
	 o09kv6diIvborQwIGAOXWPN43LN23YF4AfEDsIBnN1Sf3BMBQjI8FCKMN77B5X78QVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=Bsjaog2w;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCAE606A31E;
	Fri, 30 Oct 2026 06:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=Bsjaog2w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 060C11F000C1;
	Fri, 30 Oct 2026 06:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793342210;
	bh=N+7zvAqlp0d0d7Gr2cOeiKROaAc+i7VSl3up75bUsok=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Bsjaog2w+CSeoZN/8Aj0MHyr3aZLND+5zSldzTR/m/8Igs+W9b/v2cOZF5Ifn/8Py
	 FCoc8fdSXzwyjD9G1PKhK5/5uQe/BHAFahEg92nCbwVPJbLLsolBisJeC+4H78ryWm
	 fkrn+Qs2iIBU/05FRgMxTEE17l5F0Fyx1kHs7NXU=
Date: Thu, 29 Oct 2026 23:36:49 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Wang Yibo <szwyb123@gmail.com>
Cc: David Gow <david@davidgow.net>, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lib/tests: convert test_memcat_p module to KUnit
Message-Id: <20261029233649.8f3b46bfc2b1f50b2db70708@linux-foundation.org>
In-Reply-To: <20261014034143.551624-1-szwyb123@gmail.com>
References: <20261014034143.551624-1-szwyb123@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 14 Oct 2026 11:41:43 +0800 Wang Yibo <szwyb123@gmail.com> wrote:

> Move lib/test_memcat_p.c to lib/tests/memcat_p_kunit.c and convert it to
> use KUnit.
> 
> This change switches the ad-hoc test code to standard KUnit test cases.
> The test data remains the same, but the verification logic is updated to
> use KUNIT_EXPECT_* macros.  All allocations are made test managed, so the
> manual error unwinding paths and the empty module exit hook are no longer
> needed, and a failure now reports which element mismatched instead of a
> single pr_err() message.
> 
> CONFIG_TEST_MEMCAT_P keeps its name so that the defconfigs enabling it
> stay valid; it now depends on KUNIT and defaults to KUNIT_ALL_TESTS, like
> the other lib KUnit tests.  Those defconfigs already select KUNIT and
> KUNIT_ALL_TESTS, so they keep turning the test on unchanged.

Thanks.  AI review asked a couple of questions:
	https://sashiko.dev/#/patchset/20261014034143.551624-1-szwyb123@gmail.com
