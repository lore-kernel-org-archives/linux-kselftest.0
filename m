Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 905FE37A857;
	Wed, 16 Sep 2026 02:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789525310; cv=none; b=iyp0jBAOX2ahSIpUWw1dUrXG15tRLAtf2TxDotY87SvNhdMOpU54p5HB0KMGfDUeAq0wSF6HwG2MDt0DbgFa+afQjgJz9Ble/5RP4vv6xU5uW73x+Yp3D4cTRcBU9CgRPgiZ3UClF+9wu5s0ynWpd3VcdaDfjoO7r8+xhhj+FRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789525310; c=relaxed/simple;
	bh=S4w36axQ/SJ69u2USTyQfVcFaYAkRYJZPUbJ4PAI6Oo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pJo2GrOiZuKpl6ULEpJw8QoWZKo8YhAdeuDcIXZSmA7FkcTT1EXvGJcP7J/fFPR7rNIDt9bYey+nREXLbBBwp4E2kLt0dLBrbRt2/qDt24rtd92Kc/mr3DumKWGfDKm6arbtU1ujQaKGopdbrqE5GnKiV45mKvxmZkqgvChK8xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=JoXbFyMV; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="JoXbFyMV"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 877521516;
	Tue, 15 Sep 2026 19:21:38 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E8F33F882;
	Tue, 15 Sep 2026 19:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789525302; bh=S4w36axQ/SJ69u2USTyQfVcFaYAkRYJZPUbJ4PAI6Oo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JoXbFyMVWWZjqZk7Hc5TRbF/vgpn9cjNNGutfJNMW8RhND0pNpA5AXidlK9Ldvtsa
	 TWTQ+aTujtaCejCqatN/QhAotVYLBDh5r4kqL5fLeY+perXuNG1cI8QD+Ep0/zP7o5
	 E/bEJGq1a8cTncs9O48EsuAoacSHe0uhQShjZ2Z0=
Date: Wed, 16 Sep 2026 03:21:36 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>
Subject: Re: [PATCH 0/2] kselftest: mm: fix intermittent failure khugepaged
 test
Message-ID: <aqn9MBPcN4nctCBI@e129823.arm.com>
References: <20260915-fix_khugepagd_fail-v1-0-bb6f04c8759f@arm.com>
 <20260915181519.648c2962143b761cf02efd17@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915181519.648c2962143b761cf02efd17@linux-foundation.org>

> On Tue, 15 Sep 2026 10:21:35 +0100 Yeoreum Yun <yeoreum.yun@arm.com> wrote:
> 
> > There are intermittent failures in collapse_max_ptes_swap() and
> > collapse_max_ptes_shared() when using the khugepaged_context:
> > 
> >   # Run test: collapse_max_ptes_shared (khugepaged:anon)
> >   # Allocate huge page... OK
> >   # Share huge page over fork()... OK
> >   # Trigger CoW on page 1023 of 2048... OK
> >   # Maybe collapse with max_ptes_shared exceeded.... OK
> >   # Trigger CoW on page 1024 of 2048... Fail
> >   Bail out! Unexpected huge page
> >   # Planned tests != run tests (26 != 23)
> >   # Totals: pass:23 fail:0 xfail:0 xpass:0 skip:0 error:0
> > 
> >   # Run test: collapse_max_ptes_swap (khugepaged:anon)
> >   # Swapout 257 of 2048 pages... OK
> >   # Maybe collapse with max_ptes_swap exceeded.... OK
> >   # Swapout 256 of 2048 pages... OK
> >   Bail out! Unexpected huge page
> >   # Planned tests != run tests (26 != 17)
> >   # Totals: pass:17 fail:0 xfail:0 xpass:0 skip:0 error:0
> > 
> > This happens because khugepaged may collapse the pages before wait_for_scan()
> > is called, causing a sanity check that expects uncollapsed pages to fail.
> 
> Is this something we should be testing for?  If I'm understanding
> correctly, success/failure is dependent on timing vargaries inside the
> kernel and that isn't something we can reliably test for.
> 
> IOW, should we say "bad idea" and just delete this test case?

If the test environment can be set up to control those timing vagaries,
I believe in that such cases are meaningful for verifying the expected
behavior.

This patch sets up the conditions needed to make the result reliable,
so I don't think this test case should be dismissed as a bad idea or
deleted as inherently unreliable.

-- 
Sincerely,
Yeoreum Yun
