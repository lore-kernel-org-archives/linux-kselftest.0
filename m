Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E02C1389E04
	for <linux-kselftest@vger.kernel.org>; Thu,  3 Sep 2026 08:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425473; cv=none; b=ULIxvuUPV5IYoyeNSIEvJlGxu8DQMIZdherVXUpqA3q/aWN1ICjaQ6HdQHaZvFALyAcKfCkJzImacM9ZiuhctlnhA8kGC6+h/Xwgs6P7/HzxzDbVkstzG8xNl5AtNEL+kwujwb89aVFBa11X7BZjNlUM2i1T8iOkoe34/cYvPq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425473; c=relaxed/simple;
	bh=7ly5roaVBhOuz8Uf+wlOpzMScbbGT3Gn+abI4matX6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MfNGXxA2XgnGYTkn5TL7zGHQb6wZH6in3+SPE2VhgdB0TfHAC/3SsXBz10o8IgLLq1ZdLKAFJ9T92XWPB7lNTZfarXa8wHx3Fda5EtvU7dQ3tDKf9crxS0NzKNoDT/9rAXyJPzlu3vezPZ43V89q8mFwgqtCk24xOpN+NaLIAtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=KT+pWvfj; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KT+pWvfj"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0BB4F1596;
	Thu,  3 Sep 2026 01:51:06 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8BF733F673;
	Thu,  3 Sep 2026 01:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788425469; bh=7ly5roaVBhOuz8Uf+wlOpzMScbbGT3Gn+abI4matX6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KT+pWvfjhpOIP9JUbMKZsTvpd+1pHytdFYh65fL4CMQkPEra60Io3Ba+oas9RUMa0
	 mQWySB8ayRO5Q7FbW0/+Gjb/y1Nvez5PbGcyqFK10KO6eP674XPfb/d+9Totky6ZHg
	 f2K6iEGhQJHVvjwRJN/sivSpAQoq52FbTE2BmSEw=
Date: Thu, 3 Sep 2026 09:51:03 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, david@kernel.org, ljs@kernel.org,
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, shuah@kernel.org,
	ziy@nvidia.com, baolin.wang@linux.alibaba.com, nico.pache@linux.dev,
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
	lance.yang@linux.dev, usama.arif@linux.dev, kas@kernel.org
Subject: Re: [PATCH] kselftest: mm: remove HPAGE_SIZE and HPAGE_SHIFT macro
Message-ID: <apk095XPQkwdoXf0@e129823.arm.com>
References: <20260902175611.1241118-1-yeoreum.yun@arm.com>
 <20260902122932.7a1b82de7a80dbd5897b65f0@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902122932.7a1b82de7a80dbd5897b65f0@linux-foundation.org>

On Wed, Sep 02, 2026 at 12:29:32PM -0700, Andrew Morton wrote:
> On Wed,  2 Sep 2026 18:56:11 +0100 Yeoreum Yun <yeoreum.yun@arm.com> wrote:
> 
> > HPAGE_SIZE and HPAGE_SHIFT macro is written based on the 4KB PAGE_SIZE.
> > When this macro is used in some test, test result would be strange in
> > the system where PAGE_SIZE is more than 4KB.
> > 
> > Here is example with transhuge-stress test with 16KB PAGE_SIZE:
> > 
> > ...
> >
> >   ok 1 Completed
> > 
> > Remove the HPAGE_SIZE and HPAGE_SHIFT macro. and introduce hpshift()
> > helper to get the HPAGE_SHIFT properly. For HPAGE_SIZE, use pre-exist
> > helper, read_pmd_pagesize().
> > 
> > Also, do KSM_MERGE_TIME_HUGE_PAGES test with size of 512 MiB which
> > is the LCD pmd_size among 4KB, 16KB and 64KB page_size.
> > 
> > After this patch, output of transhuge-stress:
> > 
> > ...
> >
> >   ok 1 Completed
> 
> Thanks.  Sashiko made claims.  The first looks legit, although minor:
> 	https://sashiko.dev/#/patchset/20260902175611.1241118-1-yeoreum.yun@arm.com

Thanks! I'll fix!

-- 
Sincerely,
Yeoreum Yun
