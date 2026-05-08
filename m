Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BBC401A3F;
	Fri,  8 May 2026 15:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778252626; cv=none; b=c+vIE54EAm3MJ7hEzdfsvsy6aKwFpu1lubxpH44mHsQK1uHVrkSFnZ8CcGsS0147wKQ/ToThS4lsVPKHvtSvFl0wJgG463/M0VYu4AZMdbHWSml9YqvocbrBNl2b/ZzxbEoT9JxtTJz+fvnvQdXQI22di8EebHQw8RtaCSC1pl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778252626; c=relaxed/simple;
	bh=/xqi+t2S8bWuBI+lmZfv0DLDQPE9yHqQarZErY3arIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tkOuRYtx78GtUgbRimsvs5uvifNIPDrEz6WuZZf6JFaqaRiPpjgwxXK5n8OleidleIFlMU+Tot1vzkoANGvV+/zLjFseieuwbb2HzWPQcBYfizJqM8hJaQucwu2E7zjBYROAyD0Ovtj3BczPOXgFaQAjCVKZguAXrIqDjzJekPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dWm7f/4Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dWm7f/4Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3298EC2BCC9;
	Fri,  8 May 2026 15:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778252626;
	bh=/xqi+t2S8bWuBI+lmZfv0DLDQPE9yHqQarZErY3arIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dWm7f/4YhEkoV89JHb4HXlztE3GYoywZdD/GDe3nQLAz78X6KuzxPJU5qPGdXENvC
	 H3ytTh90wVwGo+quMZZO3CUvDuqgkXdQYYrcwdXXldL3HtJH9WcQxvynzbUEFP1jzo
	 OMrmXESr1ryU01xq0jgVnuypCHc9O8K7tAqTjnwVRyGJZNtOXaVScZvZZcIo1OfZrw
	 58zvy9CIegVaeCJQ8VVF/KmWrHMEwuDBaA5vftgSt2aKHeHXXOHJAFEPhEOjHH0Ei6
	 lmPYgxdMmqtiAQuIn1z1zwZQAecmsPK9bdGdQTLedQN4AARMPgjfludsMagPrQ6nLw
	 YNR1yySBEi5xQ==
Date: Fri, 8 May 2026 16:03:39 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Chen Wandun <chenwandun1@gmail.com>, akpm@linux-foundation.org, 
	shuah@kernel.org, zokeefe@google.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/2] selftests/mm: add MADV_COLLAPSE sub-PMD range tests
Message-ID: <af37QMPPJPkOeMJM@lucifer>
References: <20260507070558.3064142-1-chenwandun@lixiang.com>
 <20260507070558.3064142-3-chenwandun@lixiang.com>
 <bdc711fc-c625-4696-b6bc-28461c0c80f2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdc711fc-c625-4696-b6bc-28461c0c80f2@kernel.org>

On Fri, May 08, 2026 at 02:23:41PM +0200, David Hildenbrand (Arm) wrote:
> On 5/7/26 09:05, Chen Wandun wrote:
> > Add madv_collapse_range to verify the fix for the spurious -EINVAL
> > returned by madvise_collapse() when the madvised range contains no
> > complete PMD-aligned window.
>
> Do we really need 141 LOC of test to verify a "userspace is being stupid" scenario?
>
> Nothing was really broken, it's just a suboptimal return value, or what am I
> missing?

Agreed, drop this please.

>
> --
> Cheers,
>
> David

Thanks, Lorenzo
