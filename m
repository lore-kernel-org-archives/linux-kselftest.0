Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7BA3859C2;
	Tue, 21 Apr 2026 08:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776759585; cv=none; b=R/wgMyyW+E6WMDLUaXr7PiQRiRG6swO4AJ+jCvlkypqyyLEGeEpENsBWKWif94q794kNA25KmwjKI2YT2rR8fPvhSG2CfQavCQT5iUs7dfg7dHhI0+Dmj2nDkhemjwAgTB503e9Y6a0G9IIXwISp85E94YOz8F30HT3r3YRsbxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776759585; c=relaxed/simple;
	bh=V4FX5dzUh+XiqVKzFc5sM27L6b8ZdiTUZUJVvzyyei4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V5Q9fnVzlhh6IOOTcKqj00Ei2x+IKDuPYUcuUasCuM08MbSfQtAZAB7+Vog61kGMc5fjVO223qVPjL/OizOektz6HigyZbAsMljlhOnarbxVhJSHddldpfP8I0YMBOYPOssbPOjLLFbozAJHSeRXrrrAEvp6hwte6sngkiNUozo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TSwoK5Me; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TSwoK5Me"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4196DC2BCB0;
	Tue, 21 Apr 2026 08:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776759585;
	bh=V4FX5dzUh+XiqVKzFc5sM27L6b8ZdiTUZUJVvzyyei4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TSwoK5MePptekyp3K7AJ8/o9ZokyocVGKgdP63CY67ERuOQ/iQqkTCd11fahOhxw0
	 xQYmbGgEgbv57+eDQb59/EgTMRMKJgtlKmba8T7xFhZQrSlH80NXAhn+IzCqBZwxoc
	 fUivAXeTlReHSyZLvyn59GSoBfKam5OjFsuIG4tJS6+QbNqQtUp5/iter8bVHTYYYJ
	 ZW8kSxIQUHTNRxxa2Lpen5qu2bgP1k3Q4qtHvCX/hiqD/x1RlsGscjFsOyZhpwB0Tg
	 CHgxHRvJ+g5KYhnokZVdppn4JrUMYHvkR1L6L5o0TInCMjxNhohYi24DImYbaOgIQ2
	 G/HCHTF5h2DPw==
Date: Tue, 21 Apr 2026 11:19:34 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
	Donet Tom <donettom@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lance Yang <lance.yang@linux.dev>,
	Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>, Nico Pache <npache@redhat.com>,
	Peter Xu <peterx@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Sarthak Sharma <sarthak.sharma@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v2 16/53] selftests/mm: protection_keys: use kselftest
 framework
Message-ID: <aeczFjEs6sqRPy0w@kernel.org>
References: <20260418105539.1261536-1-rppt@kernel.org>
 <20260418105539.1261536-17-rppt@kernel.org>
 <f8495e44-a34a-4289-90f8-0faa71bf1a71@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8495e44-a34a-4289-90f8-0faa71bf1a71@sirena.org.uk>

On Mon, Apr 20, 2026 at 06:54:31PM +0100, Mark Brown wrote:
> On Sat, Apr 18, 2026 at 01:55:01PM +0300, Mike Rapoport wrote:
> 
> > Adjust dprintf0() printouts to use "#" in the beginning of the line for
> > TAP compatibility and add fflush(stdout) in the end of the test to
> > ensure all the ksft_print_*() messages are really output.
> 
> > +	ksft_finished();
> > +	fflush(stdout);
> 
> If that fflush() is needed it should go into the helper, particularly
> since ksft_finshed() calls exit() so the fflush() will never be reachd.

Looks like I'm missing prints because of something in my environment, I'll
just drop the fflush().

-- 
Sincerely yours,
Mike.
