Received: from mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BA03921C1
	for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 07:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789714816; cv=none; b=tbrbVXg+TquygbV3qRxcpCOgg4WG2SX1Q+Tl34K8RyK3ZZWT/BJnn0A0OJhItJ16fqR9SwFQxlh4jxEDqnET7mA83ru4jegCX8Mx4eTXZfl4o+Brqojity3t9YG7NY3+xxNy63XQ3s41k8UZSGocIK6GjVUfG8PSMspj9q60qPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789714816; c=relaxed/simple;
	bh=5AhHIUfW947DwN3a6RXdBqv5Jg4ND8aDfO50FS7r8Ng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BZRHfqGca06CoupsY9Pr5YZXxz6zWyyrsL7qpiZIUpVuhC/pfyZ84bk3IisVja3ar6WmcPO2Xg1849raIETQlThrLyTb8PaiyVRz7ns6Aw+JHOQ7mUxtUA174egdRImXm1suta5d5NdsX8JUah3wAJSUwASJ9VilmHbARjprvoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JiAGQ2dD; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JiAGQ2dD"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5AhHIUfW947DwN3a6RXdBqv5Jg4ND8aDfO50FS7r8Ng=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789714804; v=1; x=1790319604;
 b=JiAGQ2dDVHRzkONP8nYitr16QOtQvBEDWuhFHjQfTvRcs2KkgKicFJl9QuJ4ZXQw4sO97DTW
 JiT6rBcE4NHZEzix7tTWyCC5BqwzoSCAlatrKXb0clJXfaItQMpYblRzUCZ2niHnoh6gJrCs4fE
 zDB82Uy8503PWrsxVTFsynjA=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d10ab4f1e424aaa1;
	Fri, 18 Sep 2026 07:00:03 +0000
X-Mizu-Trace-ID: d10ab4f1e424aaa1
X-Migadu-Flow: FLOW_OUT
Message-ID: <fa0bdb5c-3903-44bf-8d14-91d77e32b201@linux.dev>
Date: Fri, 18 Sep 2026 14:59:53 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] selftests/mm: init page sizes early in
 pagemap_ioctl test
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, shuah@kernel.org, gourry@gourry.net
References: <20260908134117.84405-1-zenghui.yu@linux.dev>
 <20260908134405.84448-1-zenghui.yu@linux.dev>
 <b1f2a146-1a61-42bd-98c5-fc4380b6ae49@kernel.org>
Content-Language: en-US
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <b1f2a146-1a61-42bd-98c5-fc4380b6ae49@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi David,

On 9/16/26 11:30 PM, David Hildenbrand (Arm) wrote:
> On 9/8/26 15:44, Zenghui Yu wrote:
> > From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
> >
> > Initialize page_size and hpage_size before calling init_uffd(),
> > hugetlb_setup_default(), etc.  That won't fix anything, but it is safer and
> > saner to get these globals set up before doing other things.
> >
> > While at it, drop the page_size parameter of transact_test(), which is
> > actually unnecessary.
> >
> > Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> > Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
> > ---
> >  tools/testing/selftests/mm/pagemap_ioctl.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/tools/testing/selftests/mm/pagemap_ioctl.c b/tools/testing/selftests/mm/pagemap_ioctl.c
> > index 1a87b7483316..d9a4fb782ecf 100644
> > --- a/tools/testing/selftests/mm/pagemap_ioctl.c
> > +++ b/tools/testing/selftests/mm/pagemap_ioctl.c
> > @@ -1489,7 +1489,7 @@ static void *thread_proc(void *mem)
> >  	return NULL;
> >  }
> >  
> > -static void transact_test(int page_size)
> > +static void transact_test(void)
> >  {
> >  	unsigned int i, count, extra_pages;
> >  	unsigned int c;
> > @@ -1653,6 +1653,9 @@ int main(int __attribute__((unused)) argc, char *argv[])
> >  
> >  	ksft_print_header();
> >  
> > +	page_size = getpagesize();
> > +	hpage_size = read_pmd_pagesize();
> > +
> >  	if (init_uffd())
> >  		ksft_exit_skip("Failed to initialize userfaultfd\n");
> >  
> > @@ -1661,9 +1664,6 @@ int main(int __attribute__((unused)) argc, char *argv[])
> >  
> >  	ksft_set_plan(119);
> >  
> > -	page_size = getpagesize();
> > -	hpage_size = read_pmd_pagesize();
> > -
> We have some other code rework that part, so I expect some conflicts for whoever
> goes in first.
> 
> Why not
> 
> initialize them right when defining the variables, marking them const?

I'm afraid I don't quite understand your suggestion.  page_size and
hpage_size are static global variables which cannot be initialized at their
definition.  What am I missing?

Thanks,
Zenghui
