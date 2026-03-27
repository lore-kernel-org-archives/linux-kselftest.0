Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2021B346E68;
	Fri, 27 Mar 2026 11:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774610124; cv=none; b=ndut8j8bxYjK5aODb+OwrZhhXGrzcgwwkl/A4eyGqZHLPUqR700wZR7NI1+4YwA7/5cmOsByJwdsQYM8leIXSer05FzyrQsAI+p6F+kd4jpRTQbRXuAfOkZ/hAviSsKZOQKBtsT47UJLpIsZGRjMcgLxKBgJW/uGKj4prJJSEGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774610124; c=relaxed/simple;
	bh=/7djG6P2tm4I3MZ3kUwor6OV+5m6kTdnBQ74DdYTxV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oND5bnEyUjNKV2JNJUJASk9xYKAy50C2iURoJfKY5UF8lfK76vVJOPlr9C6zEWwVM1teAxH90JNsL3RdOb7pC3Df2f6qSwmMoB2S5403cGV2a2V++8BT0pUDHXYMO44wLYXlOYlRponkhvhpYfXTfb5iZ3mRjDP/wPQwa8YEjMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DvJAYh7j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DvJAYh7j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFAE2C19423;
	Fri, 27 Mar 2026 11:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774610123;
	bh=/7djG6P2tm4I3MZ3kUwor6OV+5m6kTdnBQ74DdYTxV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DvJAYh7jU6rXzb4YVe/K5X4s419/RuEnx7cCu1w1k7C4j52CibNRtOYmTchNamPoC
	 FvvXj90UvIP3VUoVKN1xC1OXHY9x2YirPEVwOSDtVvecix0GVLGIciM0DM/NNj1PhN
	 AETz5/aec57lc2DgjzYjoUyk4TwDJ/GBZvlMgqa/ZrRItiZtw+AQKEJ5EbqPl/ko82
	 yBhnC+jkwdjMJY94QuM+0EdEuDPJJ370Y5B2b7RJMoOfCcyvhrhH5Ti8UthBFFKFxG
	 m/xPVnSg7eflyxZbWrUYghSq5k8FQSH2LNfil5LZ/VqabdzA6x2bq5/KYBWNKiMHsI
	 nME8Ol1Hka5rw==
Date: Fri, 27 Mar 2026 11:15:18 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: akpm@linux-foundation.org
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	Audra Mitchell <audra@redhat.com>, linux-kselftest@vger.kernel.org, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, shuah@kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: Fix soft-dirty kselftest supported check
Message-ID: <7794ccf9-3a18-46f1-aca6-a61eab77bd70@lucifer.local>
References: <20260218184210.206466-1-audra@redhat.com>
 <c1b6f8eb-602b-4306-ad60-7a181fd94a45@kernel.org>
 <abludfGu4upPcyRI@fedora>
 <f635585f-7488-4bfe-8566-1c19f493c6a3@kernel.org>
 <815b2fc9-cee7-4bfa-8036-4b93d1b47b4e@lucifer.local>
 <237317fd-d2e6-4e9c-840d-fc60b7d8883f@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <237317fd-d2e6-4e9c-840d-fc60b7d8883f@lucifer.local>

On Fri, Mar 27, 2026 at 10:58:30AM +0000, Lorenzo Stoakes (Oracle) wrote:
> BTW, even _at_ the fix-patch commit hash (28edd9c5a25c) the test builds fail.

Ugh sorry wrong commit :) should be 9652b82ca9632.
