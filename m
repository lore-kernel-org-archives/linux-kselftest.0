Received: from flow-a4-smtp.messagingengine.com (flow-a4-smtp.messagingengine.com [103.168.172.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0498A3ACEF3;
	Thu, 10 Sep 2026 10:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789037973; cv=none; b=gbNpOEe8aylLU7T9LvB8Q+JXF/6W6RFvQfnx5MldDYHAcG+w5GemyFnl1DXMdEmY5xM1RGgVEX7xwxTWMZhfCS0p6YTvKOWTgAEvo0z+v5c/NeFk3rNvV5fvH7Rm3mSCutSAK0ebi7QljZmv1xnl1gqlbz0QEWSmJlnrE8764Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789037973; c=relaxed/simple;
	bh=BgniumLDwEiQr6fO1Okm3qxcarVPyKMttr7PdcA+W/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rdzy1GzJXmaYrN3Xgl1nQIxxT4vW48zNxru8H0PICT/bGuSkFCKCTUZ/h0ckr14ld7g7onxGMAC64OAMEVDlo7+RkJVGMeZEAqEFKWt6mAr7JE2p61cckpkLFRzsf4DnObilBUdOhwy6KrE21mX4vg/DIMALL7KWWfIhmja7Y94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=EoHYaXG2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ja0/aFLs; arc=none smtp.client-ip=103.168.172.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="EoHYaXG2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ja0/aFLs"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id 0707A1380361;
	Thu, 10 Sep 2026 06:59:31 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 10 Sep 2026 06:59:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789037971; x=
	1789045171; bh=3BwfusbEF09le3lRy6VYoc5vvb8/UgBwJTc77fiy39Y=; b=E
	oHYaXG2d6dnhrhlZPaw+buBZDZ/ZOK2YnKEt4PcmBcdz5tJ9IbfSf4UPrvUhgbqw
	/XMx0QP8N2fiMU1TW13nPJtYe0p5+Si6eaiMiz2Iko7W+2LkAlvXpwPrscMrT7om
	wlQC7EgKzUFPcVZ0GihfXZMpdxcUtxyQWrRLOsWSASvu63ddI7zLjGjkGH30yi+f
	JcnpRoVTp9Aewwmgb7PaYgdIPXPTtk+eDbzgeQ6ZmU4Am+7Ribf8HMHcUn1qXNmE
	ZwVKL+CCx8kzvJm0Ix3vqwLozSpFcymTJQ9LaI5NIUYM0f70nkbNKt7xiPZ8+0/S
	JdUpgREE6BnuJ/R3K63DA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1789037971; x=1789045171; bh=3BwfusbEF09le3lRy6VYoc5vvb8/UgBwJTc
	77fiy39Y=; b=Ja0/aFLsK7Q3t9RqL1iZ8DdLkI58V/wC//AmOKKX/7gsudbj4+G
	xtJ56ZTUa7nIixXwpt4BQ43rQQ7Zzo3fsLVebFzLMEBUAkdcPF2Q6/6HDKzOjrmY
	T37i1UKa37PRYZ7dsb/AaAm6KUSSbYexjaRKNM1DAOeEwoLvOyFwaVY1jtF3uyii
	OxjO2HnpTwPBcyWBcj7RkaO/BuYFUM7Tn1sUtokaQrRHlYgIdbff5ual2iOqQzPL
	ZyhTWt7uAMb3AQfzw7dA3W5L73sD5KUj8PQQ8rhl/qjMt4/f5+2fGDWX7jmC9gRV
	iTwdPlILGZNByZ8Ev1FYHkvLW5cz4lD1uiQ==
X-ME-Sender: <xms:ko2iattjalcwPWIL5UNscg0MIXiF6WmOWJlVElV_0LdpRy9806dh9Q>
    <xme:ko2ianKt3vTu5gQv9t0di3ONtO1WeMGB6drgjQDGZnfDqQSfdUCAX7Cc5y9tAq8uk
    xh0KAxNz6_ltNAjZPpXG6QnYiPI_vurirpQuFY7K6QsvUoG1yn9hzfgTw>
X-ME-Received: <xmr:ko2ialQXjXZW9N5NZHRNckiuQE2KO-6QzYckf8mWVty2FfzfGlKuSb3bFR8>
X-ME-Proxy-Cause: dmFkZTExGDeRAc2ZQvQEVOZg05RC7pzdHKVkkxCU4OVzC6eJ1yiq+dkvuNpph491rCSg99
    ItVtML130B8ODTdy76InRXCLDNaNNaTXWNKl71VlGzapLT/PKpaq/yp6tPxANkNdjNuqob
    hUhC5q+z3VJokLVhtdnNzOHq8HB3Gu5Ki3O9wHHpqx6QnVCJ6Mwr6zY1sfs6ioIkhduQB2
    cjK46H5gyRhde+ukXeSmJg7XmiDbNE8++i8Ylsv0wnJwn5W1L9sKPmXxdBB0BYsnvUNs5B
    4qHkIOL9/2e667KRTruDA/HZANASE9ZIxHm48xWT6Jg9ai0h943Ghn3IVLvfn13XDvCjZZ
    AHaR9sdNGERstfSRz8Jbu+sZ0LYCoL5Z7DkxQFQZ/wGLvdwBejDf+fYHnCiL6KFc4W7Y2k
    Wf1EzYf+EDqW7tkNXyVs9IA1vdj2qTdXRleRBRBEa6wRZbtuY43Jb3Wgju5yQKbjkcI8L8
    /eLkf1wSSQhYaKwlRb0xXOyLFwjVAvsReMSx31i6VJK9APRimVscJHj+lHFyl5ceIBR7bT
    kZI3XOFLpsbaz6OYOiFQVizlu1JPaBWhWAOqydoiofLiU4ESgyl+gkR4NZ/egwkgFhifOX
    EaY1uhrPJpP4xyvdbP87nRnG9NJ7W0SNoN7NVd/aS+Q+4Fx98G3M8gWuB0Dw
X-ME-Proxy: <xmx:ko2iakvwyqhKy250k9J0RtVdTTIkYbA7vSC2kKlL5CuuPna6nzIlwQ>
    <xmx:ko2iaki9tMjClm9xKnmkPgfeHjMINXbSZkRvznOScD7766ssSXAePA>
    <xmx:ko2iat1rf7gWeDZlzLuBwlvHFUZhXHlJVQL1P5agEF4-rt5pd3s3vg>
    <xmx:ko2iaqq7LcXmxRJXqP4FeoI8N7Xuylh_b_QY5fTXBgeURRc0T667fQ>
    <xmx:k42iauO60ajg5omKOYksNnMDp6gk1alTZ_S78VJASSjv3m28xQmlRTT8>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Sep 2026 06:59:30 -0400 (EDT)
Date: Thu, 10 Sep 2026 11:59:29 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	rppt@kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, usama.anjum@arm.com, usama.arif@linux.dev, nico.pache@linux.dev, 
	ziy@nvidia.com, baohua@kernel.org, dev.jain@arm.com, hughd@google.com, 
	lance.yang@linux.dev, liam@infradead.org, mhocko@suse.com, ryan.roberts@arm.com, 
	shuah@kernel.org, surenb@google.com, vbabka@kernel.org, agordeev@linux.ibm.com, 
	jgg@ziepe.ca, leon@kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v5 06/19] selftests/mm: stop khugepaged during the
 MADV_COLLAPSE cases
Message-ID: <aqKNcw8-2H035xyc@thinkstation>
References: <20260908125105.1510704-1-kirill@shutemov.name>
 <20260908125105.1510704-7-kirill@shutemov.name>
 <4e064b9d-aea9-485a-8547-3830999cff01@linux.alibaba.com>
 <aqE3Vq8Go01c1icS@thinkstation>
 <ba2d7885-f017-4d4c-bb59-e45f8b9f1b63@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba2d7885-f017-4d4c-bb59-e45f8b9f1b63@linux.alibaba.com>

On Thu, Sep 10, 2026 at 02:27:28PM +0800, Baolin Wang wrote:
> 
> 
> On 9/9/26 6:41 PM, Kiryl Shutsemau wrote:
> > On Wed, Sep 09, 2026 at 05:55:01PM +0800, Baolin Wang wrote:
> > > 
> > > 
> > > On 9/8/26 8:50 PM, Kiryl Shutsemau wrote:
> > > > From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> > > > 
> > > > __madvise_collapse() turns THP off before each MADV_COLLAPSE, both to keep
> > > > khugepaged out of the range and to prove MADV_COLLAPSE ignores the setting.
> > > > It clears the global controls only, which is no longer enough.  A per-order
> > > > control overrides them, and -s, which makes the cases fault in folios of
> > > > one order, leaves that order's control at "always".  khugepaged then
> > > > collapses the very range the case is working on, and the case fails on a
> > > > collapse that was interfered with rather than refused.
> > > 
> > > Right. So I think the correct fix tag is b7f16963efe7 ("mm/khugepaged: run
> > > khugepaged for all orders"), because before this commit, khugepaged would
> > > not try to collapse this range since it only checked whether the PMD order
> > > was suitable for collapse.
> > 
> > Agreed.  The series is in mm-new already; if a respin is needed I will use
> > that tag.
> > 
> > > > @@ -547,9 +547,16 @@ static void __madvise_collapse(const char *msg, char *p, int nr_hpages,
> > > >    	/*
> > > >    	 * Prevent khugepaged interference and tests that MADV_COLLAPSE
> > > >    	 * ignores /sys/kernel/mm/transparent_hugepage/enabled
> > > > +	 *
> > > > +	 * "inherit" rather than "never" so that MADV_COLLAPSE on shmem still
> > > > +	 * finds an order to build.
> > > >    	 */
> > > >    	settings.thp_enabled = THP_NEVER;
> > > >    	settings.shmem_enabled = SHMEM_NEVER;
> > > > +	for (i = 0; i < NR_ORDERS; i++) {
> > > > +		settings.hugepages[i].enabled = THP_INHERIT;
> > > > +		settings.shmem_hugepages[i].enabled = SHMEM_INHERIT;
> > > > +	}
> > > 
> > > This looks like a workaround to me. Shouldn't we fix this in shmem instead?
> > 
> > Good point.
> > 
> > It can be a follow-up patch.  Do you want to make a proper shmem.c fix
> > and update the selftest along with it?
> 
> Either way works for me.

Please, do it as a standlone shmem fix, plus selftest update to reflect
the change.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
