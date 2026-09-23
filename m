Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 358AC377EAF;
	Wed, 23 Sep 2026 15:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176833; cv=none; b=ZbM0HoqpPDOxOhuITme4PNAT8SV26/3c6YeWjZeTOMnyJVaBFHwzNraK3rA3DTSka3T8jKhOOpbVKb0Qp5VWIKjTnaOJHLs+ZFpmSePa/khjVRlEvrKBA3svwgPC3pKS0FUUsrXdTei0Lox1DEKOyuxrGjmvV3FQuhGChLs6Ovo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176833; c=relaxed/simple;
	bh=plzh3izsHXGgmShwIXotE4fldBJ7kvc6B3ReIpURaYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KsdwiNrbIV0v6hY9teQM9PFGPnrHqDFFszoqMMgX80bCviwhhW4vdCub8t/lidbW+3K2Ki2Y6u+LPohspn9t5EeDCyu3ccAQEbI6N3lFO0w1fzAzs7w8JdgenNThrfFJaPLZlbvVdidrj3SEP1ClBiY09TwrzHte+hzDRQMJHgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=mPCFAHmZ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mPCFAHmZ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 170D01516;
	Wed, 23 Sep 2026 08:20:28 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E79ED3F86F;
	Wed, 23 Sep 2026 08:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790176831; bh=plzh3izsHXGgmShwIXotE4fldBJ7kvc6B3ReIpURaYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mPCFAHmZzgwdrxNMzuHRfXYirzpSiYJQcS8aJ301s2u2mfEr1wZy19i1cUSGKQSw3
	 42zIFSwpkZEZJ2rnyqPudLRvMa8F5eo/Lct8ZJyZ8S+TqCfHuTTqNWS5T2ATQDiQQ5
	 Dtb9iS2rPYhJlArINvaQ79bDm/LAssiqGw4sfcPg=
Date: Wed, 23 Sep 2026 16:20:26 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, ziy@nvidia.com,
	baolin.wang@linux.alibaba.com, liam@infradead.org,
	nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com,
	baohua@kernel.org, lance.yang@linux.dev, usama.arif@linux.dev,
	kas@kernel.org, ljs@kernel.org, vbabka@kernel.org, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, shuah@kernel.org
Subject: Re: [PATCH] kselftest: mm: use helper to identify anon_ops in
 khugepaged test
Message-ID: <arPuOvSlZr_uheSL@e129823.arm.com>
References: <20260923110133.429745-1-yeoreum.yun@arm.com>
 <0241581e-3823-43ec-9c6d-2346433f8f87@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0241581e-3823-43ec-9c6d-2346433f8f87@kernel.org>

On Wed, Sep 23, 2026 at 03:54:48PM +0200, David Hildenbrand (Arm) wrote:
> On 9/23/26 13:01, Yeoreum Yun wrote:
> > Instead of comparing mem_ops->name to determine whether mem_ops is
> > anon_ops, use the is_anon() helper.
> > 
> > Suggested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> > NOTE:
> >   This patch is based on mm/mm-unstable.
> > ---
> >  tools/testing/selftests/mm/khugepaged.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> > index bdc0c7c117d9..b0cb02bf1a73 100644
> > --- a/tools/testing/selftests/mm/khugepaged.c
> > +++ b/tools/testing/selftests/mm/khugepaged.c
> > @@ -618,7 +618,7 @@ static bool wait_for_scan(const char *msg, char *p, size_t len,
> >  		usleep(TICK);
> >  	}
> >  
> > -	if (!strncmp(ops->name, "anon", 4))
> > +	if (is_anon(ops))
> >  		madvise(p, len, MADV_NOHUGEPAGE);
> >  
> >  	return timeout == -1;
> 
> This should be squashed in the other patch under review.

Okay. I'll squash with v3.

-- 
Sincerely,
Yeoreum Yun
