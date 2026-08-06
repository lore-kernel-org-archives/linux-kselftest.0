Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8132E5B02;
	Thu,  6 Aug 2026 18:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786042003; cv=none; b=PSeS7+BC7jeaDB9n7YzBcURI+LHZ+bdo1q/4mRITJRQn1wMxpGXW9aTyr0JHwrJkRc3CDVXYNKsooUUZs8G5gbK0BWGXJkrtaNbIOewNf/YZ7NAGhEAx3h3ckKhFY2/SlP2wyMfk2+21pULmls+MefzesRMuwuYUT/VncZGe0o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786042003; c=relaxed/simple;
	bh=v/dhwL1aTnp0zUauV5bqQu7zFQc2tvaiEUYY0guu7A0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=QaPvg7o6ECI4ODGKL9R/7KAnCLWAIxKz2EhFlyFrikOFw5GdCntNg/YgFT1GflT3/d6eAHHk1cGy0/1FbOFCPDTVFO3njQcYY2/2Vpf9WnFnT1QYXHlfaVMUoCLlA9zmjG89ZN2G3qQufYd3zy9Sv6NbYBRkc7FPO0dwsXxRtUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=wxALH0zr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="wxALH0zr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A54C1F000E9;
	Thu,  6 Aug 2026 18:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1786042001;
	bh=Z/yDdM+xtBIjfhLSWDVmVpQD0k85o3q8t4merW6u7QA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=wxALH0zruJBk2K/lSFP2gs1rsnRh8jjzXCMoB4elwdkVMBhwpQ9JsLIptsJh/UCaN
	 uHot1HJSGxHahs9dQSdAVsVGblouETBr45OgZ/++2STIvJrkTWXMzKZ3nBuZsInfJ1
	 Uz7Xi0EPqSioHVu+NEkLH3UIAnvFT8tVgalYhnVI=
Date: Thu, 6 Aug 2026 11:46:40 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Audra Mitchell <audra@redhat.com>
Cc: david@kernel.org, jocolema@redhat.com, raquini@redhat.com, Lorenzo
 Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil
 Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren
 Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah
 Khan <shuah@kernel.org>, Colin Ian King <colin.i.king@gmail.com>, Muhammad
 Usama Anjum <usama.anjum@arm.com>, Andrei Vagin <avagin@google.com>,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] selftests/mm: Fix soft-dirty kselftest supported
 check
Message-Id: <20260806114640.722b8b12d32f0f62a238e5ba@linux-foundation.org>
In-Reply-To: <20260806181843.1839943-3-audra@redhat.com>
References: <7d6b4401-e230-4ca7-b64f-c1277fa643b8@kernel.org>
	<20260806181843.1839943-1-audra@redhat.com>
	<20260806181843.1839943-3-audra@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  6 Aug 2026 14:17:04 -0400 Audra Mitchell <audra@redhat.com> wrote:

>  /* `start` is any valid address. */
> -static bool pagemap_scan_supported(int fd, char *start)
> +static bool pagemap_scan_supported(int fd)

Thanks.  Sashiko points out that the comment is old, so I just removed
it.
