Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C0327281E;
	Sun,  6 Sep 2026 08:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788683297; cv=none; b=PiL14vFr/JsapcJHsuvOe9D5Pgd/hRN4PTTBk/J7id7TdYPvW8r8QpDZnx0Y2SITn7mwlS4N4mppBJvIfsA9/ZeQXSBJIoioGU8Kkxx7AnFifcv75HIPhDIReFDBg9+ZANcXCQYvyrnMWE3FdOuAS8w7t/Zj+8S3Ois+JlcGFno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788683297; c=relaxed/simple;
	bh=A5UooArabeK01NQMj6gNqqEueX16FUPcOycJGGtsqUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KCowLc30iw/D9BPVDS7SFKcr3hdgLMb7221NgCITvpaPhtAigqqVzdPU8wj0nGKriP11tVEXDS8oyor0O+MAgsGILRXF4L+RgwXwcOBZTZqmhE4/eFg2s2ullCvBgknC+jzZZ8zucY8lvzXI7VOheEuzHZI/FbI3SsgzzpA/EhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XhGOi3zb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XhGOi3zb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BD8C1F00A3A;
	Sun,  6 Sep 2026 08:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788683295;
	bh=7TSAAf7dKrbS5v1dGM2WSG2wiMP0B0BxkF4EViCTd0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XhGOi3zbq//JHvO67UrobFFT80aGsjjauCD0+38TUdft3Ro1ayi2i6B9j/lN0J68W
	 t3FrOZYiO3gn5gW5PlygXwOACzLYFTVwAGLdIOS1AYA2C7ehdYO/NfoweezWEgmnvZ
	 EBWp6YqxzX/jyaBgRQKC0grYayIdgUD375o99CmCuwdTXEmQOEtWwm8pYKhndnd+Po
	 Oc2WG2vhpJu7keEcOhLGP7KL8uUx2DoZYy9fIE/HUxlTIwdaFyNTh2B+OfaKNaq9X6
	 CAxGFuKx0FiCXyKQnyc1CuryNGydWBF+4Tue6D/ShyJrYC+6DNqkSfPGTgNARjMQTO
	 bgWYf65LUGf5g==
Date: Sun, 6 Sep 2026 11:28:07 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Song Hu <husong@kylinos.cn>,
	linux-mm@kvack.org, muchun.song@linux.dev, osalvador@suse.de,
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
	surenb@google.com, mhocko@suse.com, shuah@kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mina Almasry <almasrymina@google.com>
Subject: Re: [PATCH 2/2] selftests/mm: restore hidden hugetlb reservation
 scenarios
Message-ID: <ap0kF3dWU8UWaCpO@kernel.org>
References: <20260714021630.1063823-1-husong@kylinos.cn>
 <20260901173748.fb7a442941102894a0c42baa@linux-foundation.org>
 <apqBn7tWDHQeMrzB@kernel.org>
 <20260904104812.7ee79803a10ab355ad2cdf81@linux-foundation.org>
 <929d0143-91c5-4b47-8e38-30675b4ace5d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <929d0143-91c5-4b47-8e38-30675b4ace5d@kernel.org>

On Sat, Sep 05, 2026 at 10:17:12AM +0200, David Hildenbrand (Arm) wrote:
> On 9/4/26 19:48, Andrew Morton wrote:
> > On Fri, 4 Sep 2026 11:30:23 +0300 Mike Rapoport <rppt@kernel.org> wrote:
> > 
> >> On Tue, Sep 01, 2026 at 05:37:48PM -0700, Andrew Morton wrote:
> >>>
> >>>
> >>> OK.
> >>>
> >>>
> >>> That's reasonable.  This code was added by Mina six years ago.  But
> >>> he's still around so let's bug him with a cc ;)
> >>
> >> And this code breaks our CI e.g:
> >>
> >> https://github.com/linux-mm/linux-mm/actions/runs/33040981840/job/98414290236
> > 
> > What do we need to do to view the error output there?
> 
> I recall that one has to be logged in in github in order to view the output:
> 
> @Mike once sending automated CI failure mails, would it be possible to include
> the full output?

I'll take a look.
 
> -- 
> Cheers,
> 
> David

-- 
Sincerely yours,
Mike.
