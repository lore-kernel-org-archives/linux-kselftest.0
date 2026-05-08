Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E88A2F8EA6;
	Fri,  8 May 2026 16:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778257401; cv=none; b=WQ8QPvJ2V+kdROMdQAsEJoQgfEh1QqGYIR7jhRjwIM14y7IYjv/64932efX8XXoW2UQOnnNat8QC6pb8kR1qoC02CCJVa9B4OAlaKtX1TQR24kT8e0bUQ5w5NgWDI5UKWvQJKAfDurpyMl9JAG/l/dfKRCQiky/5QjQZ8GpFpq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778257401; c=relaxed/simple;
	bh=JoiUm5wh8Zs0sBuLuIL7ypMZIZSGxbxZQbaJk/2I4Cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uWGZbBOfa/XSofd96nRDIacyR/HM5WJ5fbhjBT6WbSWwk0BRvHvKLRZvsBbuS8fVxL8qmpuo3tyNb8vyzoNSukuw9F88FZ88blxAJC8TSVJ5lDZnWoeW3zepRQvPCBLDx8MJ5v40b37ohGlJFUs+H4gJ6uPWqzX9PVU2QCkBbF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c7wrIHt9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c7wrIHt9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFA30C2BCB0;
	Fri,  8 May 2026 16:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778257401;
	bh=JoiUm5wh8Zs0sBuLuIL7ypMZIZSGxbxZQbaJk/2I4Cc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c7wrIHt95fgux+bSYVElC7l8E4G3CgzagcRn5241VmCXGxKJBhR57Vnmb1jTxDb/Z
	 AqnBvhqrIBjB8vQUq9fPRSsBS3lZ8AWUSFAqALcRQR8MNfYzWtZv4OED9bHkcaVyli
	 qDF3dD4MUZswfP0tdaRVJykv10SSu6k6rksQJw22p1SHqumu4sSCCL6jYTo6pNoMfz
	 71XZdn0ANaWWqlxu179XcjkQyasfyPUjwLuGwnLs3b2C1Ssf1MvgrH8/jF5PcF5tvK
	 aqoQtnfKxW2aWarfCGlTrcYA0cVOi1Wsson+C61R96H2Ox01pDSPqILUhntMLtGnsp
	 fwn8a26WPUUKQ==
Date: Fri, 8 May 2026 12:23:19 -0400
From: Sasha Levin <sashal@kernel.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Joshua Peisach <jpeisach@ubuntu.com>, corbet@lwn.net,
	akpm@linux-foundation.org, skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation
 primitive
Message-ID: <af4N9_YOgDQziRCR@laps>
References: <20260507070547.2268452-1-sashal@kernel.org>
 <DIDEQIFQF1EW.11CESAK4JL4PR@ubuntu.com>
 <af4Fwxndqv2knLov@localhost.localdomain>
 <af4LvqtLu-yeor-v@laps>
 <b14d54c0-0fe8-4d98-a2ea-2dd830cd5869@efficios.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b14d54c0-0fe8-4d98-a2ea-2dd830cd5869@efficios.com>

On Fri, May 08, 2026 at 12:18:28PM -0400, Mathieu Desnoyers wrote:
>On 2026-05-08 12:13, Sasha Levin wrote:
>[...]
>>>One possible approach to prevent "footgun" type of killswitch use would
>>>be to first apply a statistics collection killswitch handler that does
>>>not change the behavior: it checks whether the target function is
>>>invoked at all on the system for a given period of time. Then it applies
>>>the killswitch if it was not invoked during that period. Overall
>>>sequence:
>>>
>>>- pre-soak killswitch for e.g. 30s, checking whether the function is
>>> invoked at all. (period would be user-configurable)
>>>- if no calls were detected, engage killswitch, else report failure to
>>> the user.
>>>
>>>This should prevent footguns such as trying to killswitch fork, malloc
>>>or other core functions which are inherently required.
>>
>>Why not just use our good old tracing infra? Set tracepoints where ever you
>>want, collect any data you might need, and engage the killswitch 
>>when you're
>>happy with the data you have?
>>
>>It feels a bit weird adding something like this into killswitch.
>
>It really depends on whether you want to include some basic safety nets
>directly within killswitch, or leave that entirely to the end user.
>
>I don't have a strong opinion either way. I was just pointing out the
>feasibility of a pre-soak sanity check before applying the killswitch.

What about doing this with some userspace tooling (maybe under scripts/) to
facilitate this?

-- 
Thanks,
Sasha
