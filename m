Received: from flow-a3-smtp.messagingengine.com (flow-a3-smtp.messagingengine.com [103.168.172.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D0F459AED;
	Fri, 14 Aug 2026 11:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786706803; cv=none; b=X8ucoAwF+pGl+uKoC4KXtcsTR18/74fP7Y5YxDXEgzccxDep61j/uItpR8JjycCWSQZzw7BTChK7si/nigUPju50RypyHjC7SujpWNdHfKPhWPkvlr5/SivNuQxGnYtVZsHen4v2geXrY+mKFVttnfKjv38jVVIaQI+7GvtZINE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786706803; c=relaxed/simple;
	bh=On09TkNON5CRVGsw+3uLKwqcnrWKc9bWgXNgQYo7WVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eN40IdaeZ3MIXbx+O8UEHrlTxPD6XScThgVTjOnFDQYemeUncLVm0fiObar0gYjrhjcUMg672w9GqVI/+5hijIBZ/qyOd1qG6IKvtTlZVHyYlLzbOqPjX2nPU3nxyUPnHZ1MY7MPZRFEIfHviq4k8HVSyhwNZqIATkPUbQ3sZ6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=mF2dfDVt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jA1lc8n+; arc=none smtp.client-ip=103.168.172.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="mF2dfDVt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jA1lc8n+"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailflow.phl.internal (Postfix) with ESMTP id 258C013802D8;
	Fri, 14 Aug 2026 07:26:37 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 14 Aug 2026 07:26:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786706797; x=
	1786713997; bh=1S9NCI2+tHYOR01YLEaMonDlYZYYqApipw0wF5z4uJA=; b=m
	F2dfDVt5VsZvn/gKKd4vRJWJwz/dR2B9Al1pwaFrx1p6RpzZNz4x0/cw4hwy652k
	hOgYj4nTDsTQ8SJYcjdqU7Xm8mMWLRMFQjnrffyde11JMqOo0DYgc+ZtkRj1bBYT
	zw4wG3PTtowPyQGeE+0FnE4MXHGTlP7rf1jH4hD/IxpWDbQw3NgWx1qCale+A19M
	5p3uxPeuV6KnB3uiy+XHWnd1SsZ03hz8QnzljnJLFyCNenn7RdjeizQucFy1bmmM
	0HH4H21yCmPro0Y5Y5oN4fQtH/GiD8HzkSEtOXEQUX0NaJcu5iPcDTNGMtbf50U/
	rk+4UOzo4ukuU1QuEiE3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1786706797; x=1786713997; bh=1S9NCI2+tHYOR01YLEaMonDlYZYYqApipw0
	wF5z4uJA=; b=jA1lc8n+hN/4w7a4SdbFPbD8q9J3bQ1hGwbiEHqXJKctHuORlXi
	RGf6Z1fBofJn8u8Uh7omkOzx4mBudBClnZdeRYwuQX/A6jrI586OKVuDim3MOLnI
	P1h9qdol6tWZxirMwPkec1PEKSE4UXIWm7XgQ132hP61Atrf0p/jBFCFkfs64dcL
	XjKAE03Tz/Y28FE8mDyzOPlsLYtWEJkI9f+5VlV+Lxdwds7AF81YYp0Reiim9OIS
	iOFszzce5j4RmEwDbTPZAGQH7JDdpetgUcfPKS8MMIJYj48+COfOHZbVfRlQtiHQ
	+07BIB98s9RePak9zX/lgJWbUFF0cmvTaiQ==
X-ME-Sender: <xms:bPt-avm1n6O7CR5cqF7oCwQAQ8P5W8t2W5qzDYcb1hw2iaxDvxwulA>
    <xme:bPt-age8v_R6fhPAU9dUVxSslAHlCd3jxbB6VFPtLI3hTTs5r0aiSgWvKGQI84eOk
    Wd3SMhEZ9eoByXs6YMajcsLeBN67yPsRks9ZHoNl-BT8lTVflsGAN8>
X-ME-Received: <xmr:bPt-arMefDglRGnvG6hEePO2saIHcARy3JeYoFUH3W1zg2261YY8uCioWa8>
X-ME-Proxy-Cause: dmFkZTEoA6e9DNf8/AIkBCVe3C4E+A4zolmZoi+9rifEJTLPQJhzWR0S3AmeiZGHug6S4b
    ccnioTWyHa12kRYm5RXSa90Pq3oqFxXrvIKRfjcxMDtRlRosWwAxizIPcHnnoXqUSfiwbC
    NhMN2gUmfXhomnpCyzpnlIM8G50+Jh9zxBXw8ktKseVExRb03bdQlcFRevvsL9GEeyZ7xs
    8No9EKR34bblH8st1fNGRsr2qmWAJMomZO90nrkTl2DH7S+1eR2+5202NUvgy8kdQP5MII
    gm47x3G8KsrdPEKhV7LqtzYV5moSYCVDWqrgPwskor9yrzsntXhYRM7MoZ3jWI3iym2FCs
    VJhnvJd08pB9xJ21VqmoovnV62v21+vfJf1zuP6tZZ9q8WCKRnXvLldRo+jdJkGwN9SuA/
    xRY7YZi7k4PwrxCRZEt84nbtINUKZZ55cp/Yh0CrF4ZJJuXvfmDi0+4/JER3WkOUM67OkZ
    +lFSSvEltN2wvSBZbKd2dDtthvMAITr10LI04vUKYaV5vpQOxX+jGYF3Jh09UnZbW5oH/u
    d9NcvImq1GwEDmAPk7kJ5IfoybsyrqnoteGVCFXR4d+X7j81Yg6eJu9IPu6ONvH/qtpV5b
    NtEAVxQ+McQ9NcA9IkMxSGaaRoP6aRFLcLPVtDmO7OEeL4mtcQ4ASykyQMwA
X-ME-Proxy: <xmx:bPt-arP3Ts6Thsx6FmRXWk30RwhVRiaDf8thZgD-0jdfLVPMkXeLnA>
    <xmx:bPt-as6YeoGeAtDgTMc3O2gLp9gv-tN92fOqmHZA3NE4Ct5FkKaEAA>
    <xmx:bPt-avY_K4pjy295JDQWY5op1Vu2yXXuU-zjesiGnacobbm4lnThPw>
    <xmx:bPt-akHOwa-vX_exBnEzcNf4vRVEqa0vC4QR59xuM9Mv-cTBeKgfRA>
    <xmx:bft-avLHiGK0gIMG-i0YU8R4JuFQtrSJ-IVVoiAERVq-P6b18n3knxTK>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Aug 2026 07:26:35 -0400 (EDT)
Date: Fri, 14 Aug 2026 12:26:34 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Mike Rapoport <rppt@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	nico.pache@linux.dev, baolin.wang@linux.alibaba.com, baohua@kernel.org, 
	dev.jain@arm.com, hughd@google.com, lance.yang@linux.dev, liam@infradead.org, 
	mhocko@suse.com, ryan.roberts@arm.com, shuah@kernel.org, surenb@google.com, 
	usama.arif@linux.dev, vbabka@kernel.org, ziy@nvidia.com, usama.anjum@arm.com, 
	agordeev@linux.ibm.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/18] selftests/mm: keep khugepaged out of the
 swapout the swap cases set up
Message-ID: <an77GjsF5Qip60ql@thinkstation>
References: <20260812132304.199287-1-kirill@shutemov.name>
 <20260812132304.199287-6-kirill@shutemov.name>
 <178663341429.2230969.913958776768961527.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178663341429.2230969.913958776768961527.b4-review@b4>

On Thu, Aug 13, 2026 at 06:03:34PM +0300, Mike Rapoport wrote:
> This commit message broke me, I'm going to skip the remaining patches
> for now.

Something never changes. I cannot write coherent commit messages with or
without LLMs.

Will try harder next time.

Sorry for wasting your time.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
