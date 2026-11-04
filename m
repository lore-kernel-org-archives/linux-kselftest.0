Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822940;
	b=HoLT1ao9lj21KGXrC/3/MkANOgxH88yLRUKVeYPqpSFSCLNEORs0efkxrGbq1o6yuz4z
	 0FbMOqEC4a1Y0MRXquZuV8SfI8zchqSpPMwnVEw0H+cbxtbXBfpq/PxNIj+NLHJg+DWrL
	 egTn0jqBJVe3RXFS2aV31T4nZpT7yoVZJH01b9d0QqemGITVTzLLMlLTLeRGwaSftvvBO
	 HhaENXMH4ljrnx+pIF/zijKwMJRPRFqvT3GN/EfXdccYXDWzKW7e4Pg4s2r4g36uFF1vy
	 F7+L2zCaF2dyJKUoMIQ3ckhfnGd5MLudxezx6nIDOAvzjSnGw2o2LT/0bAMsZkhdOww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822940;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Yb4jTJ8Eq+hyJ59TSJnjZuZhspqhafxO+atmMdyN59o=;
	b=4dVD75MxSfDjLo4giqPciV7c9GApmiPCSfnXAGAcr7W9+RLAyrsdP45OSzjez+pNJjBv
	 xI84T7fSbtrJcfngT7UsYw5Ul282yq9YQp1EnnDkt6YavPCWKqLX20/dWd75wUkJCMBhq
	 joAzDuCtcMz72it3MewxvfwPxWzAl3lz2XTnqtEwKmtz4Qg+M1kZ5gbdW4JhcjTFiuDUT
	 hA3sllZ3eyxVasQoM3iGFsA2rlVFZtuGYdTLVqxWRAQaZ2oeI2SgPpsLbRlKW1zB2Syqi
	 +LFYq9wQGwT98rfWx/rL7A0oZXyT6vjTHWTtS0E1JDZJGvs09r7Jn0n/0Qe4lGWve7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=qISbhUKx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303B4606A32F;
	Wed,  4 Nov 2026 20:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=qISbhUKx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 809EC1F000C1;
	Wed,  4 Nov 2026 20:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793822939;
	bh=Yb4jTJ8Eq+hyJ59TSJnjZuZhspqhafxO+atmMdyN59o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=qISbhUKxBQyuuu1QMm1eHQxOam3Z+yowuy9yQoTBgBrsD8lQqiIJDjLjtA4ujBTOB
	 72Gfa70i0qTr8vdNZU36+mIlDeG+fWB9irpfXwl838HP3gc9+NH+GNpRprHnAhFci4
	 GajYJF5pn1w7qH3GunLJ+k21ER/7RDBZ9bzvGs7I=
Date: Wed, 4 Nov 2026 12:08:59 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, Aleksei Oladko
 <aleksey.oladko@virtuozzo.com>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/prctl: select the tests by ARCH alone
Message-Id: <20261104120859.28099ada5f1dbce682cb6267@linux-foundation.org>
In-Reply-To: <20261104193639.333186-1-sashal@kernel.org>
References: <20261104193639.333186-1-sashal@kernel.org>
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

On Wed,  4 Nov 2026 14:36:39 -0500 Sasha Levin <sashal@kernel.org> wrote:

> The prctl tests are only built for x86, and only when CROSS_COMPILE is
> not set. In every other case the Makefile defines no rules, so building
> or installing the suite fails:
> 
>   make[1]: *** No targets.  Stop.
> 
> TuxMake sets CROSS_COMPILE for every build, native x86_64 ones
> included, so CI systems that use it, such as KernelCI, see prctl fail
> on every architecture and never build its tests.
> 
> Like breakpoints, ipc and x86, decide by ARCH alone whether the tests
> are built, and give the Makefile empty targets on other architectures,
> as sparc64 and drivers/s390x/uvdevice do, so that the suite builds and
> installs nothing there.

Well that's annoying, but...

Rather than continuing to make this selftest x86-only, wouldn't it be
better to fix things up so the other architectures also benefit?

In fact someone proposed doing that just last month.  Oh, it was you ;)

	https://lore.kernel.org/20261014200127.1363472-1-sashal@kernel.org

what happened to that?

