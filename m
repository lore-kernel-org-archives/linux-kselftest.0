Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB9D40B6E0;
	Fri,  8 May 2026 16:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778259271; cv=none; b=IkaVl5Y8ytA9Rvk2ooELGme8ttDSnNM/9mrY72I2QyqcRrKUxy+HKEBYFruEfCEsGzdcPPPVRUJu205slM63kaCt8TNxBlOP6YxvuWo7LahDSVXXSgzfGrXVeEr4Z5GTQ6Em+0spHWWp1Cmo6A9asrdlGKa6Q7MpHJGY/keONQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778259271; c=relaxed/simple;
	bh=QL6duMgwO5QJbMFah0NGraChZxWVXuFFwdSEtidI5z0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F/hSBEh6DUpnAuRxcPnxnAJRtt2b5sr78IR4frJEbtT4i4Q/O90E1jKVUEiNwgBQzlf6DfvkbEYiIMcaTY3YBkvjN+7hXFLHy5+ZpsgZxyjRiy3XyqkfQxjlhLslRsoIA7sIQscIk2A0wlGaRjWM0r7y1z/ZUenBSFvcMunxTP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CfKhSZ+L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CfKhSZ+L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE87DC2BCB0;
	Fri,  8 May 2026 16:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778259271;
	bh=QL6duMgwO5QJbMFah0NGraChZxWVXuFFwdSEtidI5z0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CfKhSZ+Lz4Jm1DA6WCuKJVkYDu/MMxRFWTwHn/y5VXtKExzkvKDiTKF2YCVD693zY
	 4Rh4mYLwCe+f6d3CY8inz1gOeZk2ObCs7aA8ZMkNGFyW/7So60oqxf2OTkmP9YpiFX
	 YUbIEdGULwAQlroRdv7B2gSHnEjwrDHK4VQWlsCI+EJyZix4iYD1E4jKU6C+Hn94WY
	 b5dqV+u5gGFeYjgeK9CX5pZfj0ni2e4KsOmbOMQjs1uvl0Cue9H5Hvt1tCaaTAyAoN
	 1NR6n6FZf3gR+dbp5+YCpAq0P6ppjX5Ks1Dni9tamhQubcYXtbdT7/mtH1nQelxQXv
	 l2RH7VyPzWXWQ==
Date: Fri, 8 May 2026 12:54:29 -0400
From: Sasha Levin <sashal@kernel.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Joshua Peisach <jpeisach@ubuntu.com>, corbet@lwn.net,
	akpm@linux-foundation.org, skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation
 primitive
Message-ID: <af4VRezugh3kJLfY@laps>
References: <20260507070547.2268452-1-sashal@kernel.org>
 <DIDEQIFQF1EW.11CESAK4JL4PR@ubuntu.com>
 <af4Fwxndqv2knLov@localhost.localdomain>
 <af4LvqtLu-yeor-v@laps>
 <b14d54c0-0fe8-4d98-a2ea-2dd830cd5869@efficios.com>
 <af4N9_YOgDQziRCR@laps>
 <5616fbd5-612d-4c23-aa10-d6b8de81f9eb@efficios.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5616fbd5-612d-4c23-aa10-d6b8de81f9eb@efficios.com>

On Fri, May 08, 2026 at 12:26:45PM -0400, Mathieu Desnoyers wrote:
>On 2026-05-08 12:23, Sasha Levin wrote:
>>On Fri, May 08, 2026 at 12:18:28PM -0400, Mathieu Desnoyers wrote:
>>>On 2026-05-08 12:13, Sasha Levin wrote:
>>>[...]
>>>>>One possible approach to prevent "footgun" type of killswitch use would
>>>>>be to first apply a statistics collection killswitch handler that does
>>>>>not change the behavior: it checks whether the target function is
>>>>>invoked at all on the system for a given period of time. Then 
>>>>>it applies
>>>>>the killswitch if it was not invoked during that period. Overall
>>>>>sequence:
>>>>>
>>>>>- pre-soak killswitch for e.g. 30s, checking whether the function is
>>>>> invoked at all. (period would be user-configurable)
>>>>>- if no calls were detected, engage killswitch, else report failure to
>>>>> the user.
>>>>>
>>>>>This should prevent footguns such as trying to killswitch fork, malloc
>>>>>or other core functions which are inherently required.
>>>>
>>>>Why not just use our good old tracing infra? Set tracepoints 
>>>>where ever you
>>>>want, collect any data you might need, and engage the killswitch 
>>>>when you're
>>>>happy with the data you have?
>>>>
>>>>It feels a bit weird adding something like this into killswitch.
>>>
>>>It really depends on whether you want to include some basic safety nets
>>>directly within killswitch, or leave that entirely to the end user.
>>>
>>>I don't have a strong opinion either way. I was just pointing out the
>>>feasibility of a pre-soak sanity check before applying the killswitch.
>>
>>What about doing this with some userspace tooling (maybe under scripts/) to
>>facilitate this?
>>
>
>That could work, although it requires additional infrastructure to be in
>place (tracing) on production environments, which may not be the case
>everywhere. In comparison, if the sanity check is done within
>killswitch, you only need killswitch and kprobe to be compiled into
>the production system, which is more lightweight.

So CONFIG_KPROBES but no CONFIG_KPROBES_EVENTS or BPF?

This sounds like a pretty small crowd :)

I think it makes sense to document/script a workflow around tracing or
bpftrace, but I don't think it's worth adding all that logic in the kernel.

I'd also note that you can always reverse the killswitch if you observe issues.

-- 
Thanks,
Sasha
