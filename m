Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879397;
	b=qlwQPMjaKzZN3Pktm3iNdFocbu9Qk9lcCM+8o+kasc5bd381wGWls3TrTzivdRqoEoos
	 mkAgCzjs/iqCKsizCOzRGO143ywUM6KEOCyIsbjFPb5tUKoXt1A+CtkVmY6v2veNHM5mq
	 qohWTZfTL/E3GXiQaV+nFjj0Rrkx8yNKjg6rSO9WT0qjoSLccZozRhx35rxBpwKOlC0Yt
	 odNvIRXsPiVT9A3gM+0QXFNhwqta3Hh3fB7CITXc7C1CvNOBaKNxhtrz+V3pECfToiQca
	 q1wW+0FNtgoY706LSGqVRbz6aJ1HhPnSsydB9jDkgdUWkiEWmcLFqb7StbO6FEAly1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879397;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=VImrv8FOkQBPZjLUsdaZmiq4Cy9sbelPnrfcMNk1WI0=;
	b=scmczt0DZl2DQpMDrUljjFESTziZjnL9+nLD94PfEAejNzJxewYik7A7xy/GRqzeCiZx
	 E9GDnLYUNY6C+9eWYpUAnxKQVRwL3c21nUQZLr/PaTeFcNiBq5Nl/h6a+8cYsf9rUpCPS
	 Z7YAlbv3s+7mNNd8v5DmxsfZtKe6qIWnOcyr5VsrBxhX3N3wy/7gTuSUeK8Y2zZbh/NYQ
	 jmNMNsuhT63w232YNx4A+oZJvpMK1VRdp3cLc5HW3xnJ4DwsnC8VNB4CiSt/iLTJmcS4O
	 wiAT3/TgHILbSOFjuZm4Cr+tmgpeU/gxR8Q3OcS2vKV2z9+WANiWIRsT4pEJgjC0Nug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hOhJJ17f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D97606A31B;
	Thu,  5 Nov 2026 11:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hOhJJ17f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD5BD1F000C1;
	Thu,  5 Nov 2026 11:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793879396;
	bh=VImrv8FOkQBPZjLUsdaZmiq4Cy9sbelPnrfcMNk1WI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hOhJJ17fnaoVYndtIuekxR8R6KO9FBbg6IMn7mFLdmS1AHggfitt7+Nvrcw1ZoLS4
	 Q65DYL5m5guEYklW1MnM8sShCjbOu/AVXCRkeAq0oWJzYgdSjMYQSoPJ96z4njASSx
	 g0B6PgBhVRGiD/wpmrvUwA1kR0egiK6rTVJvWHCbIph7lJVlgjaYza1OLGN6+QLjV7
	 eB+WAtu5GOmRtEtNDB3x5vun45DMPw9GgdaKtuLzUTNEVCYpObK5jCJwkxgaleD938
	 anISYi/vi9jKckwLJA6u6BOWD2I3Hy1tpQyEN3C1GYWIOm7+okR8USjxmUUyIzI++d
	 OX/zTf+vcj9eQ==
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.ams.internal (Postfix) with ESMTP id 8419B198003A;
	Thu,  5 Nov 2026 06:49:51 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Thu, 05 Nov 2026 06:49:54 -0500
X-ME-Sender: <xms:Xm3saiAdn_cZh3JtSZrh99WhVttXV31FNCr4PBP-ecHfjESLFAyeLw>
    <xme:Xm3saopxSAetXRYpzwVNDP-QRy3P_jPcWB7JsYsS16lNph1qMbflVqH7SrgNofevG
    o9yA6mIHliJgXjQtkKKvElnY8KcnuLkCCcGHC9u_cgftVDxmYe4qQw>
X-ME-Received: <xmr:Xm3sau1vZ0S9_M5aNLCqdNT5Lq-NPQ05c7vA75rSiwVOkLoUv75Ra_nvijk>
X-ME-Proxy-Cause: dmFkZTFaQBfUFVPMP8xrPqBpPtUnYXtbN3LRpp/oxJl/b1RmZnSSZHsU20CPxF1I64DXUJ
    SNLa91ZNNqfrtHA9eDebWdeJ3pYuxgu/qVSEnCct1TlKIRlJn3GcjTHnnT+sn/oHMnbGM1
    92CZwyL88cWl12ru+oFk3aGPCVOPyvG/BBaSa3nzQ0qnYXC+EDwfMTbKFpKaz7lB8mwBSr
    tjdeBaZoIb3fDCkky6tsMipkpHqSdW7Zzs1aYBXDycZrYrz694hViPMgw3pBshbYyrko2L
    Ohq3WEDa90dSPdCt1Zj6L7kr+Qhl/jG4fQDMc8x/v4q4YqTy9IFSVobK5sWmdPu2MF5qpt
    EjNpg3PBFTo3XO9RRKHjGaWEQXb5hxpkiWD5hurwcftjcBKJ3dF7hkJYtdSdF1MXJTQGtI
    U1DxCDZulyaz+XBHLq20bFdQhQbcfFjWNS+nuDxFo8TUM/HN7akP5A3EdHg18A8AJQwdQv
    PWAvcY13nCclZdQ9XC+ee25WbgDrMiKU8N3e64SqzkgOYAmYJbKJAAlcOZK0GXdOgKQBNC
    ul1laNs1D8hTZTkx8NJuJzTLRCqehRluIahZmS7tTps7YtiVuhHvREip5GILZ3mwcCpJtr
    UaCfBsMS72oJMuFm65lhi0wXsXbtCojAj7PUM7Q/sN338f1Y+5/vcc2kDuzQ
X-ME-Proxy: <xmx:X23sav36-BZf_GdwZf1t908PDlsbnfG7hQS6Im0OKWe1m08mb8IFBA>
    <xmx:X23sarciPpe7lJ_W_T8XXfpsZ5Dz4Nickzk89PD9OSK30i_0X_RguQ>
    <xmx:X23sar4mO8DRWKgjo6flEr1hmYHrDo14rxHdRIiC1TMqq78q9bRNlA>
    <xmx:X23saoi18BpZHjKIwprPReemBZ9lHVBBrXRlSF6c1dUmGIYVXOylvQ>
    <xmx:X23satrGkUFjjpRHQtDWiikpbfIcGWhCKBGjUS-v73FO4Hw4LlhPATus>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Nov 2026 06:49:50 -0500 (EST)
Date: Thu, 5 Nov 2026 11:49:49 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Shuah Khan <shuah@kernel.org>, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: skip split_huge_page_test without the
 split_huge_pages file
Message-ID: <auxtQQ7KsQJK0wkH@thinkstation>
References: <20261105030242.1241448-1-sashal@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105030242.1241448-1-sashal@kernel.org>

On Wed, Nov 04, 2026 at 10:02:42PM -0500, Sasha Levin wrote:
> Every case in split_huge_page_test goes through
> /sys/kernel/debug/split_huge_pages. When that file does not exist,
> because debugfs is not mounted or the kernel has no CONFIG_DEBUG_FS, the
> first write bails out of the whole test and it is reported as a failure:
> 
>   Bail out! write_file(/sys/kernel/debug/split_huge_pages): No such file or directory
> 
> Skip the test in that case.
> 
> Fixes: fa6c02315f74 ("mm: huge_memory: a new debugfs interface for splitting THP tests")
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
