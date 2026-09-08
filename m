Received: from flow-b2-smtp.messagingengine.com (flow-b2-smtp.messagingengine.com [202.12.124.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC594949FA;
	Tue,  8 Sep 2026 21:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788903393; cv=none; b=CAWO5FQ9zgSjKbnOapkt2hfCRqJhMxi570iTWldVFeyoGC/Zkc3+mt108JPMrvyBsGuLnPvS5WtmGaTgcg02DJEDHAA0GQ96nwE1nlGu18HmQGp+hG57vc7kz0EQWaKUVYhEgvK8ZSSd8ArRNu61sUDsGcAy2RBl2lBfsbauH4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788903393; c=relaxed/simple;
	bh=idr7ULCDvJn6JiYzLJUoIx7sZOuuhk+nSmMD/o4L+p4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jykywUcrze7qKtnAcM6Xa6ESz+mEn/l+519YZYw6S8xVtRD9OQcaxCYQSh66h9yPPpl64wJhWWI1sFlwFyAqAyFheJJlDm6y1d0nx37bckGNGRVPwRaPhrXNOWHyYFSlbwortRRCrblREcaxq2WlDEf9KQ8J51zbGL1/pNBJS+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=KOpgUNDe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=wV82FlUi; arc=none smtp.client-ip=202.12.124.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="KOpgUNDe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="wV82FlUi"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id 79B2B13003CB;
	Tue,  8 Sep 2026 17:36:29 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 08 Sep 2026 17:36:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788903389; x=
	1788910589; bh=rDbrLWkii0++pI81ymuGxKLFDP2vxoT7yk9xrVDS0G8=; b=K
	OpgUNDeyogjhDImLoLAtUdF/3ZssahsLG9WdiQRBBDzG66H3Vd+NGmuS/thCVNXf
	gbo1hHSzcAiwpU8y7Je/zwCgWqcr/LXvqg2S1bZecJGLFwmyZLyFFgl+oOIgbS2W
	5Pm9hRvDtTrSG5CM0GirpIN+1DKYrXQT9NfxDPXeTOBMzr5Tvt3wZfxtfWgBNryk
	jV2WIyAx+y9mG/weS4O5Pdg5eOO1Tvy19V1KiHFREYRk+1HYRqm0sgjRX2W1JqBa
	sj2CIVsaq08lbdu+jCGnmpyGqbuy1amZ8Ht9WVC1EDe4Ri2rL+qB6BrOo8NX7vJi
	27jmPQClIUADBHHG8Sw3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1788903389; x=1788910589; bh=rDbrLWkii0++pI81ymuGxKLFDP2vxoT7yk9
	xrVDS0G8=; b=wV82FlUiMIWUPqYpEWiPj1Pt/M0c9MKTpOyV5DsKBZjtRsRTVOU
	zTsqJfex9GRIni8/Ew0eJRvEmmpBLPJwKScHCeaZpX1f5j5Ex/1fKcnAYuLFCvER
	EE5XCGPNEM7W7iIPyLdYFUV6naTszx3K7C6Y4llufj5AAUgxRMp9UvXAk6GaiYLs
	vXXjfHsTgKMvHfteuzFTG9kweuqdAEwJhgWVR5c4l/CvIN3ZJ3NoCr+MTHoQ5o8t
	7CKtbE6HzwH9/twNS1Q/Ma4TsQzfx+Sst/Qko3xiA5qeR70X9Qi2L4gKcwphGZR0
	2txJ8F4RC8Y0Kaa8zX47Y/z1LCrfjjP5SZw==
X-ME-Sender: <xms:3H-gat8C9LpFlc5fFz8jxLsSwp3qIpFezRk0P1TU8IUXFb2V1Mw2kg>
    <xme:3H-gaiafVcGgtw8kf2CSA-PpZFVLMpiUxtlttDgNq-KDqerUR7HznKwHq4DtyMtq6
    vplQqI26H-g5a44KCwR66blgk8lEzy9f8zoUKyyz5jYcaXAZQ7itsPs>
X-ME-Received: <xmr:3H-gamFOcBhdWruI9XsUGG0NhzeeENajnqvFrWXo3bh0idqPaw7Tl-KF8iU>
X-ME-Proxy-Cause: dmFkZTEs2RLI7ynlmKvNumBP+mhPrub9YUQB2IUepwl0zaqL6vmAlAHuu9hDfPkzsmvSt0
    PXpI86qqrGdR+aos/9lYymlU9wbS9cEQVhvdsgaJyrJN8FURhOEtfp0GyCkiY7PCo/owg/
    +QdaAAFc5pvs0UzgDJkFJyziwO9UuT7TsvqlYGGCeBlqnSa2xNtoakQoelpLZeo0k25PAM
    m0GIcEhMVaf7ZVzu05/A9InZTCoLxYYIIy/gKTx6gBZtYrh2KdMJZJ521rbzuniB4KXnfk
    8Ivqq6+j7+MI0IGymvJ4rVru4BV8d7yWehuOy2Q2f4zvCiPF0FRhTMrKTHvFQ4MhRk1Lfi
    0YKx0KpxECVDHveerVIXmYguOP/shMUKufCJVheMoGqPSPsMBz3KHvZB5Im4zbOgD/NJtu
    zdOZ4KFWnLbzMAqVMaBeADXSdsJ0GpoL1/dlOKzaXExTDDlUqNpi5mEjVS36Vdkig0XNI8
    oxJevTtioI/63+2wzhUVsahMTEI2c0TSYso2Sx6//pXswgzPbg8e9/WZ3SYRuYHMYpfQkw
    77/rb0YixJC4CxbxclVc8eYVzafwqZhhiHmOKs4FNGGRfqWtgakrXZqXFY+X3E+TeKbepA
    IXl7oWkfIynnTKYXBonpxkLzeBN6WpzlTF+/KZeqTXIRSN3d38M+zQJ08WPQ
X-ME-Proxy: <xmx:3H-gahdXeRDgSN9GSnAaAAwCTt4zYJdsrT38jrsSUyRuDV3EzNx1qA>
    <xmx:3H-galJIb1WDBYBz-49_D7TleVc4vTGV5IgQYabhHyiuYiRi6qPYgQ>
    <xmx:3H-gakOCOCpgOI0HfHvAboOfkDa8U_pgqehjmVm_u0ODg5a2KKVEbg>
    <xmx:3H-garzM9-HkEVxYbQtJvNwUDfzy4nz6YPW_xDyBe150adtIGxB_sw>
    <xmx:3X-gauveQnzy2RkHRocek98vCKLfIMYzjtZin8LINZnNozRi46lKEkkq>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Sep 2026 17:36:27 -0400 (EDT)
Date: Tue, 8 Sep 2026 22:36:26 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: david@kernel.org, ljs@kernel.org, rppt@kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, usama.anjum@arm.com, 
	usama.arif@linux.dev, baolin.wang@linux.alibaba.com, nico.pache@linux.dev, 
	ziy@nvidia.com, baohua@kernel.org, dev.jain@arm.com, hughd@google.com, 
	lance.yang@linux.dev, liam@infradead.org, mhocko@suse.com, ryan.roberts@arm.com, 
	shuah@kernel.org, surenb@google.com, vbabka@kernel.org, agordeev@linux.ibm.com, 
	jgg@ziepe.ca, leon@kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v5 00/19] selftests/mm: improve khugepaged coverage
Message-ID: <aqB_XMEUElzeCc_H@thinkstation>
References: <20260908125105.1510704-1-kirill@shutemov.name>
 <20260908124102.4c874a8a63e50a1cc90e4bfc@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908124102.4c874a8a63e50a1cc90e4bfc@linux-foundation.org>

On Tue, Sep 08, 2026 at 12:41:02PM -0700, Andrew Morton wrote:
> On Tue,  8 Sep 2026 13:50:46 +0100 Kiryl Shutsemau <kirill@shutemov.name> wrote:
> 
> > khugepaged collapses to mTHP orders since 7.2, and 7.3 added three
> > selftest cases for it: the generic collapse cases run at one order named
> > by -c, with the result detected by counting folios of that order.
> > 
> > That leaves the collapse path largely untested.  The suite does not run
> > where a PMD is 512M.  A folio count cannot say where a collapse landed.
> > Fixed sleeps cannot tell "not collapsed" from "not scanned yet".  And
> > nothing exercises collapse under contention.
> > 
> > Close those gaps in order:
> 
> Added to mm-new, thanks.

Thanks!

> Sashiko asked a few things:
> 
> 	https://sashiko.dev/#/patchset/20260908125105.1510704-1-kirill@shutemov.name

I've replied with fixups to the affected patches.

Let me know if you would like a respin or the fixes in any other form.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
