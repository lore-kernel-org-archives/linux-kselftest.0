Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB6039901A;
	Fri, 12 Jun 2026 08:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781252831; cv=none; b=otRohPXRY9dDnsdCfZ9FhhglLrpbSGhzBNKj1lhAkdvzBzDAt4KHDhzAWA0B0h0gZzJA0Je52iZ1fkcwnIkuleNZN1srAy2g8Z4M7OvvijX5yD1VobNO5IU1Ue46XykEF2P2gk9jH0jcRDU2HLfr4JJFr8yC1F0wuXxuwcXd+0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781252831; c=relaxed/simple;
	bh=vdIjQHsfRCVH/plNOLVPFqmEhnC3fqhv5jVgMQiHDUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zz2htmzO/V9oMC3ZkrW+e/7bhhH34VTcyxlk8dr4Iy2kTTOAgUhx7pQXk17xgiHSRr+kDuyEjTtIoNCwZhAfsDcwjCXzbA3xE2xJnTOPf+HiqwaFRqhG2WhpAAM54Y0DTL69uYA7yHDFrUvkRdQuXwzx845ObvXOZHPJPyM6aLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fwxo2+Mq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fwxo2+Mq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECF1B1F00A3A;
	Fri, 12 Jun 2026 08:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781252829;
	bh=xSXyYCehVzjZ6VWy2CdERbEJQJPls+dlCik6nw/DEmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Fwxo2+MqdsBp0HUK7sEkG667rVMSi+0oB4i0/a7Q5FZ1Np7JummQHadI0olhtS+VW
	 00AS7CCa/GUluWmq/EfI1QHKwI7kcAskqcOCZkM639As8iYGhoJ7ss54RtZVBTk8xM
	 dU9qL3Vp/e0n81SAiuGW9nhIszvJrhOyZmumzEKDEgqpLvOpg9K70pXxbxF/uyGpbm
	 7e+n0ZclKeqB253uRefKsPWrv4VVhadDEFna6pUArf9keMw6jp7js7dmwy+A0MAdM1
	 Iq72q3TDMzQrCxry6J6EKqmPwHa0oiy9acGthOuqdTpGO2E1phr68mS7xw+0HSzACH
	 Q3YJunl0JVnFA==
Date: Fri, 12 Jun 2026 09:26:59 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Anthony Yznaga <anthony.yznaga@oracle.com>, 
	Mark Brown <broonie@kernel.org>, Sarthak Sharma <sarthak.sharma@arm.com>, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Aishwarya TCV <Aishwarya.TCV@arm.com>
Subject: Re: [PATCH] selftests: mm: fix and speedup "droppable" test
Message-ID: <aivCvvj_Ztezkrie@lucifer>
References: <20260611-droppable_test-v1-1-b6a73d99f658@kernel.org>
 <aiu39cOX1w9ICe_U@lucifer>
 <2cf7bff8-1681-4344-8bbc-16bf4306ade3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2cf7bff8-1681-4344-8bbc-16bf4306ade3@kernel.org>

On Fri, Jun 12, 2026 at 10:00:29AM +0200, David Hildenbrand (Arm) wrote:
> >>  tools/testing/selftests/mm/droppable.c | 46 +++++++++++++++++++---------------
> >>  1 file changed, 26 insertions(+), 20 deletions(-)
> >>
> >> diff --git a/tools/testing/selftests/mm/droppable.c b/tools/testing/selftests/mm/droppable.c
> >> index 30c8be37fcb9..57e1b6fc5569 100644
> >> --- a/tools/testing/selftests/mm/droppable.c
> >> +++ b/tools/testing/selftests/mm/droppable.c
> >> @@ -17,10 +17,10 @@
> >>
> >>  int main(int argc, char *argv[])
> >>  {
> >> -	size_t alloc_size = 134217728;
> >> -	size_t page_size = getpagesize();
> >> +	const size_t alloc_size = 2 * 1024 * 1024;
> >
> > I guess regardless of page size this suffices as an arbitrary range over which
> > to check things work.
>
> Yes, that was my thinking. "some pages".
>
> I was briefly wondering whether to add separate tests for THP vs. !THP, but
> decided to leave that for another day :)

Yeah we (or Claude ;) can expand and extend later, key thing here is to get the
slowness sorted... :)

>
> --
> Cheers,
>
> David

Cheers, Lorenzo
