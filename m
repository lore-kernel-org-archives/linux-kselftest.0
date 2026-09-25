Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55894450906;
	Fri, 25 Sep 2026 07:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790322209; cv=none; b=GOObBc7RbYToKgqfNjTpG7UydOA85KEAaZMOD6b59BRD+pmmFifmBQreghBn2Mi8EnREKSfH6vxSePuYc1fuAdOR9Hvq075TGnGOLwtpJDrJmskng8athIni2N2y45ZQRoKrI6x643IeNsCelBW5x91Ikl7aPKjYIeOB9k+Jock=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790322209; c=relaxed/simple;
	bh=O88qaP0WarAeXSyig97FFUgcj5aIqpiKWtAy+drbqck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mhnunCFbfI5efoIU0shEq0c/16G5PvglEhdJNk/UqtGtP1H5K9hqoT3E2Vv+ImC+3yuETNRhz9Y7C0a2wyZf/J1HEfOaQLxOGJCsmvVd2lr6jxAALY5+G3KQgR6JXkcsz3OfwMvq8SxI1yRtyEuAiPWVXHosWSaxlQE6UJGha5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2gZAXZs/; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=e453Lgjl; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2gZAXZs/";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="e453Lgjl"
Date: Fri, 25 Sep 2026 09:43:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790322204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Gl1orCD+ELM6v9XYiKdyMr6rOaS+gwOdeF/+jU0MqQ=;
	b=2gZAXZs//MkOGp9rU5CiQsoTP+eaSFGEWuAHYx34mtslnwIKjkDfRXFAoSd302MMLlbPbh
	j3mPhDRfGkWWcBQV9UZRyxSM+KSU1Tayl+R5aUsFm7eFpGKLxi/xka9d613G3MaBf0r4t4
	GfFBxA+4u+7qxlDLEvHh34S96f/UREJ5ts8Tn41YLvDqGYGlwZoNIu3ePgo4PY05yDeZpx
	MYcXxCqarNxI8Zer6hOeVFSAWR6wzn/LmQ358lMyXBbjPP/bXAHOn+wP+kTk+ejOp+FQ0N
	+e7/ll+oH/R2qMyLAat7sVvmdlAgugQ2z7pPgQOl/6FHFtH4Xp6j2wyU+vINWg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790322204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Gl1orCD+ELM6v9XYiKdyMr6rOaS+gwOdeF/+jU0MqQ=;
	b=e453Lgjllis5OksbkyXw3KiWo8D1yNshGEDVD0ymgFATIQgaxwwdjS3ugj4aNM8GU0/c6B
	nj+OnOZPC+61S0DA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH next] kunit: Initialize filter error before disabled
 cleanup
Message-ID: <20260925094209-4a53eead-7aa8-458a-9308-c223ae907e15@linutronix.de>
References: <20260901-kunit-void-v1-1-c91952391d66@linutronix.de>
 <20260914025933.9832-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260914025933.9832-1-kmehltretter@gmail.com>

On Mon, Sep 14, 2026 at 04:59:33AM +0200, Karl Mehltretter wrote:
> kunit_run_all_tests() jumps to free_out when KUnit execution is disabled.
> If a boot filter is configured, free_out tests err even though
> kunit_filter_suites() was never called to initialize it.
> 
> Clang's -Wconditional-uninitialized diagnoses this path. KMSAN confirms
> the runtime use.
> 
> With CONFIG_KUNIT_DEFAULT_ENABLED=n,
> CONFIG_KUNIT_DEFAULT_FILTER_GLOB="*", CONFIG_INIT_STACK_NONE=y and
> CONFIG_KMSAN=y, KMSAN reports an uninitialized-value use in
> kunit_run_all_tests() and identifies local variable err as its origin.
> 
> Restore the zero initializer. It remains necessary as cleanup state after
> kunit_run_all_tests() was changed to return void.
> 
> Fixes: e38f53f04824 ("kunit: Return void from kunit_run_all_tests()")
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Thanks!

Reviewed-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

The code using the variable was not yet there when I wrote the patch.
Also this logic could really use some cleanup...

> ---
>  lib/kunit/executor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

(...)
