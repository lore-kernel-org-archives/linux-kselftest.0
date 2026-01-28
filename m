Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E317E0E4;
	Wed, 28 Jan 2026 11:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769600398; cv=none; b=Qhf0LqjhKD+SE96g6nP1btbfaq/bcVn2ZPN1VfyEBy6ddTxq5BzQM3mzBZNUfBcAcaYNgv/pZBd5o3FaYzH5pfjpnDOqM24ujOgFGfiEQSWBBw3yy99wibY3UCzzObIVFWfaIDPWGYNf/EgXr5a3HkOY1FEEBLHN7z42XxllYcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769600398; c=relaxed/simple;
	bh=8JE6fgOxRKWA+V8VYu9R9Q+rh59VkQxn7th+VjXJ/kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X/HNl3oXLIcsSDhOf7+74uf6JqbNcifNa34QXWafQIg4GQJr4RaIUj+JFZC7+TtTeR+oucuKWrqIN6A6Jv3UksgoyGGlk/5BpqWpGHY0oLse0abY36GN8g5tR5cTqiuiyKWfLz7MOJXDbyaE79WY/lOGjtzl/M6CYJnqZc9wzpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nMdvjuDp; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=n4uGvG1F; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nMdvjuDp";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="n4uGvG1F"
Date: Wed, 28 Jan 2026 12:39:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769600395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CJTWYk+YesdvpGhIB0dJi/fYpBD0/tHDEy3akF3Lp+w=;
	b=nMdvjuDpEd/rTbBSzhjmJ7NPshjPCK/ChOhAswnyHBSux2QG/poQiyRuQpG8sYjpSyeQCM
	B6R4bdJDoGAt9sYZc8A03oR4c6R7zb+cLrVCHU1/UIm4LiLJMbpqq2rLKwNleKfWTHJAKM
	hNoZNv4Ds0dT6J7dIi1y/LtAbplBtKLM7IWBCpB2Dh603e2jm4H4+PqdzOt2z5KYuHYEwM
	T+tU8KhQMmSL4TcmKA7gomEGwP+HNFDtVNZ1x9kW0vBDSBmk15RPeQnzqmy/Qgi+vssnx1
	qhTRS90raMm28UxTSfnp8tDJ6n+eyg1XRmrYbs0qumvCfeKoXOE/cAy1QEvlvA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769600395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CJTWYk+YesdvpGhIB0dJi/fYpBD0/tHDEy3akF3Lp+w=;
	b=n4uGvG1FdMOreZxb92MIinReioVnN21YcMF5PuWN0mo2h1GNO/G04Okk0numKey41T76Ch
	Ltc4M8gcyEujpjCg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Brendan Jackman <jackmanb@google.com>
Cc: Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: runner: Avoid spurious warning about missing
 failures file
Message-ID: <20260128123203-28c3a39f-3751-40ae-91a0-35355cb0ba5a@linutronix.de>
References: <20260128-kselftest-fix-failures-file-v1-1-b58072c66317@linutronix.de>
 <DG06J6S40UW7.15VFU5DA8YJIY@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DG06J6S40UW7.15VFU5DA8YJIY@google.com>

On Wed, Jan 28, 2026 at 11:18:35AM +0000, Brendan Jackman wrote:
> On Wed Jan 28, 2026 at 9:05 AM UTC, Thomas Weiﬂschuh wrote:
> > When runner.sh is *not* executed via run_kselftest.sh, 
> 
> Hm, what's the usecase for that? runner.sh is a "library", right? So in
> my mind there's basically an undocumented contract that you need to set
> this variable before you call the relevant functions.

This happens when using 'make run_tests' in a selftest directory.
There the failure currently is also not reported to the caller of make.
Maybe we should make the failures file also work there.
I am not sure what the expected semantics actually are.
In any case, a larger fix should wait for the next cycle,
until then I'd like to get rid of the warning.

> The fix below opens the door to bugs where we fail to report test
> failures which would be... a shame!
> 
> > the variable
> > $kselftest_failures_file does not exist. This triggers a harmless but
> > annyoing warning from runner.sh if a test fails:
> >
> > tools/testing/selftests/kselftest/runner.sh: line 50: : No such file or directory
> >
> > Silence the spurious warning.
> >
> > Fixes: d9e6269e3303 ("selftests/run_kselftest.sh: exit with error if tests fail")
> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> 
> Having said that, it's not a big deal, the risk of those bugs is not
> that high and we'd probably notice them before too long. Assuming you
> have a usecase where just setting the variable to /dev/null yourself is
> a pain, this LGTM.

Passing /dev/null explicitly would also work.
I don't have a strong preference.

> Reviewed-By: Brendan Jackman <jackmanb@google.com>

Thanks


Thomas
