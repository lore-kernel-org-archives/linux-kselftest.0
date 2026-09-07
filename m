Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED406436BEA;
	Mon,  7 Sep 2026 13:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786683; cv=none; b=oSrn2HE6Y+Saur+ZdB6FwBnG6IDPgBze6r024fkXikUlBVXLxN2oB+ei6RmErQZyDLOE63Xvvoj7YiOWsCpXMRNtfm2wZGyJTBV0WUD8bRpFqafA44N435IkoZFey2jvoAG4W92AjI4yCm55ybmzgT/uc3uJW7VQ16Grj9oMP5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786683; c=relaxed/simple;
	bh=tA0OMRv8oj06En5/BWfSVzQAOrbI0aJi40goniR2kr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aZ+KD3OX46ko/hQd/pvAOmDMcrgrFDNthDg7g2PjXQzh9Cscw2v1BAPDq5CpKuElLoOzM4AskIIcXbMUagKyxIOcPVDO1LoI/EM7Wj1cq8tTyXImvoAPh8Fd2TkG7xZ+OncL73cKEMLVB3ja6Id7Ju3NtzHrNMqXQIoR6ulNm78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=Y+kYpxzC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qN686EEZ; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="Y+kYpxzC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qN686EEZ"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id 3B9701380129;
	Mon,  7 Sep 2026 09:11:18 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 07 Sep 2026 09:11:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788786678; x=
	1788793878; bh=e0j3fsVumRKOaqygse+y9YlCuGTHtFBd6bkppJhg5aQ=; b=Y
	+kYpxzCmkaObMDKsElaKybkYiQgDFAOfumjkiK0v6gqCc7U5sXGsc22hXru8gl+d
	JzI96FZcZ/XPyC6fLhv+xxX4U9Nanr6s7UlcXP5h/AnnAuGbgNSUYcHQcbBcHLja
	FdW7ylO/d9rw1Huk9KhQOZk51SAFDvTZ7ODcfddfK7WM1JKshD+bvne+CmRYOh24
	6H6L88Ld5HHTMkx4G7QovqMsd0R10eyIQoCZyXtwxFU7qJ4CESxo70tA1DE+nJZq
	zqbzRzwNXRpYZCAxY0FlB1GE2EQVjW3+OTZFufIRIhWI8Rct/RRuMTkAmkHsevlL
	bIr0g8waGjTv4pzBVrlKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1788786678; x=1788793878; bh=e0j3fsVumRKOaqygse+y9YlCuGTHtFBd6bk
	ppJhg5aQ=; b=qN686EEZGG/tsa69vxZL8F3XI2sKttIIO5qdBhlAqyUuD6Rd2Z1
	+2a9luALx1xUUGzhRYuwu/e/jmHiPww5L7zzpLjwBpMs0hxrTN+l8/L8BGDO1iqC
	gJ0dm5/FY0/+A/FtoBKuuJpnaI082/eCVnARX/ebCDj9XSIlA95UpwalC6Iflbfp
	cpoi47OLLqvHcV1iMtyuFdpz0uxhQPp3IJeq5MLW+/MthMEvQH3qcHj08wpVvdqm
	kalN0Z8vr0XPBECWwdRcjLSfevn59rw10Nu9UuKrcgJpM5xGqAvOTeYtXbpS/Hd1
	NPOn6gDS4Ii9KzUhmexqVcEBxj9rHWUS5mw==
X-ME-Sender: <xms:9beeajiUotEuDdqY_HytcU5-9lftUbtXdHdAToE2WIj-H7h2eo_UAQ>
    <xme:9beeatr2uKO4gyrglpPPWgLvfi0ZC58w5zrKmK68FKgVODRqivMp6dQvOOG5F_5YX
    YzOfsxJ79VKQsK0rUhMqjKpnMB2eHm546EceyWk2sjpW65VCD7N0lrR>
X-ME-Received: <xmr:9beeaoq899ew8Zak42SLQR9dmL9HG729mbfwXqE-oaLf78542WfmFaeQ2x4>
X-ME-Proxy-Cause: dmFkZTGCNMd4Q9EInv4pZwT0BWMYc3KKxkNKEeuTjTisAjU8d5Iurn0W2J3En98eX2qsVN
    ekRO29qUaexBsyWN7A53qFlun/i+vnBWAtli1SZa6vfamv7SenRmqOOprxPz+Q/bWWetUh
    /S3jyyw9PXvPTNSDAdwTD/58wgq9G4gqlODsXkcpxOTf+YWzdmvXK+ELl7ZgjUbshPyR+y
    c13E7au5/4A72e68nnUGJ/wf/F+5kOOFDRXY2a5WFfQZeYaYPEUG6Ns+q99gBu8gTBju26
    bGZ1UjcI1UN8N5K2VwRkS/SQMLA//GURXziQRtpudSQgoNzKljxQmQV355Zep/Np6A/6KU
    KgQQ+WVW0mlx1tgz7Frln65/T4Y+JYh5W2jxZK7XZg4UEcTOwCLMGxQPa1br0UPh6FhhHp
    /a3rzemnykab/qHDTUU3TCBJK8Bowu4xG4sg7H2gVgADUprLnw/0/jueoSfX9GrLvLfPlu
    i/4mC40gk+iKxWl2JMN6TCPziEjAPOu7udpC4diN3sTcOWsuLoTrzVfXyfCueXrzWYhCFh
    0m2MQ10Ao35Ahz6ncrzA3jteAAuy33LSJ4BQA8zngl23k8KUI4VjgAsF+9vvyfHDHOFwBz
    cuZCynSFR/UpGwThhQpThki9pueYfybMpTXOHzxiSqnZWkAy0cOjIp5wlxFg
X-ME-Proxy: <xmx:9beeaj5W9Lmlg6Tz7-HMToPbyZYSougqkORofRhP4zJR10UQYhs5Hg>
    <xmx:9beeav27-BtC14nEIvXsWKxxdRiha83uzI9zH36U-xBOovqjlTCo7Q>
    <xmx:9beeavl00NZt6HF9eX_bCAPySDPKg5_q2CVn8MuTQywKD2za7MXIcw>
    <xmx:9beeaogSfjhpC-Wrs9S6gNPldI1-5_hT3tJSJjz1oedHd1-ot8D9sQ>
    <xmx:9reeau0BHTfgTqODVRoJfWKaEOCSyeqmMEuLqGM3np_iDtJs2yonPbSi>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Sep 2026 09:11:16 -0400 (EDT)
Date: Mon, 7 Sep 2026 14:11:15 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, nico.pache@linux.dev, 
	baolin.wang@linux.alibaba.com, baohua@kernel.org, dev.jain@arm.com, hughd@google.com, 
	lance.yang@linux.dev, liam@infradead.org, mhocko@suse.com, rppt@kernel.org, 
	ryan.roberts@arm.com, shuah@kernel.org, surenb@google.com, usama.arif@linux.dev, 
	vbabka@kernel.org, ziy@nvidia.com, usama.anjum@arm.com, agordeev@linux.ibm.com, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 09/19] selftests/mm: add folio-order detection
 self-check
Message-ID: <ap63H6oZmka_oWpD@thinkstation>
References: <20260815015901.1236937-1-kirill@shutemov.name>
 <20260815015901.1236937-10-kirill@shutemov.name>
 <aoQzXhP0W0FVsvTp@lucifer>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoQzXhP0W0FVsvTp@lucifer>

On Tue, Aug 18, 2026 at 11:30:06AM +0100, Lorenzo Stoakes (ARM) wrote:
> On Sat, Aug 15, 2026 at 02:58:51AM +0100, Kiryl Shutsemau wrote:
> > From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> >
> > The khugepaged mTHP tests detect collapse results with the vm_util
> > folio-order helpers rather than smaps AnonHugePages, which only sees PMD
> > mappings.  If those helpers are wrong, every case built on them is wrong
> > the same way, and nothing says so.
> >
> > Check them directly.  For every anon THP order the kernel supports, fault
> > memory in with only that order enabled.  Require the helpers to classify
> > the backing as exactly that order: not a neighbouring order, and 4K-backed
> > memory as order 0.
> >
> > Run it in the thp category, ahead of ./khugepaged, so a broken helper is
> > reported as itself rather than as a collapse failure.  Verified on x86-64
> > 4K (orders 0, 2-9) and arm64 64K (orders 0, 2-13).
> >
> > The test needs ALIGN(), which hmm-tests.c and migration.c each defined
> > privately.  Move it to vm_util.h and drop both copies.
> 
> Also:
> 
> uffd-unit-tests defines ALIGN_UP()...
> 
> And really you probably want to match the kernel convention of ALIGN()
> defaulting to align-up (for some reason) and name this ALIGN_DOWN() to be
> consistent and avoid confusion BUT...

Hm? It is align-up:

#define ALIGN(x, a)                   (((x) + (a) - 1) & ~((a) - 1))

It matches kernel definition.

pkey-helpers.h has ALIGN_UP(), ALIGN_DOWN() and two pointer variants of
its own.  Folding those onto the vm_util.h one is worth doing, as a
follow-up rather than in this series.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
