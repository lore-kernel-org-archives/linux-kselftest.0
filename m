Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C854648A2CE;
	Tue,  4 Aug 2026 20:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785875969; cv=none; b=LL1XoDXviCQHnYuqKkqfWTeCEYgm2lXRiHsePD7LtY/T2pHmuFsBBevYtbfevv7MH7BL1Hv/mRpnPLKCqWwy+FDza1vRD/0ZYoThk6zwpP+5GvpwbPjZVTrmWmoppjCrlYfeSPjP5DFdjTYpSoZ1SkrPms6YQJptE7QEG2WZ+h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785875969; c=relaxed/simple;
	bh=u7Aa0Yb7pInMNAJvKLSY5XxMTzg3r6dcN4jMXP47EGE=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=XKBORlWQNky9xYPDk31bsy/6w1Q4R3SYdG7gFMK9xrI9/+E4kgUY0tvSXuqFNGM3EQB7649HS4SBJTEGgpPtP+RlwkASpN1bV74qdBr0RnzF8ytQKkjAa7IVckEk/Kpzcv7eCSNlXMM0BJRTQvQvfqbmtUDk1rgCqhpHD7ymn1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=B2x5fsct; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="B2x5fsct"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785875965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zX4G9KtIkLWVCOjh6ITiwbytCOR5Bx+nS96H45NLpYk=;
	b=B2x5fsctVX5UOg6LWiPPPuknHansYyABd//bMP1rKjwDDQK/7MI0hKVoM8E5NKgMLX3s5x
	uS+dsTbilTjSLCIiGLLAa8ePjYqWjSZwsX285EUhtKmP5V4+RWPuGTLgz56T7hKzLcI1TJ
	zwHcK8PsmcGQhJtpfSNPcjs11RFedGA=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 4/4] selftests: mm: add mTHP collapse test cases
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Nico Pache (Red Hat)" <nico.pache@linux.dev>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
 ziy@nvidia.com, liam@infradead.org, nico.pache@linux.dev, dev.jain@arm.com, 
 ryan.roberts@arm.com, baohua@kernel.org, lance.yang@linux.dev, 
 usama.arif@linux.dev, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <dd8013c1ddada90913876e3bd912c07e613fba8d.1785564857.git.baolin.wang@linux.alibaba.com>
References: <cover.1785564857.git.baolin.wang@linux.alibaba.com>
 <dd8013c1ddada90913876e3bd912c07e613fba8d.1785564857.git.baolin.wang@linux.alibaba.com>
Date: Tue, 04 Aug 2026 14:38:43 -0600
Message-Id: <178587592371.79283.4567177442714493894.b4-review@b4>
X-Migadu-Flow: FLOW_OUT

> Added a new command 'mthp_khugepaged' for mTHP collapse, along with the '-c'
> parameter to specify the collapse order. Additionally, added mTHP collapse
> test cases for 'collapse_full', 'collapse_empty', and 'collapse_single_mthp'
> for anonymous folios. All khugepaged test cases passed.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>

LGTM! I will try to come up with more test cases, and send a followup in
the future.

Thank you for working on this :) 

Reviewed-by: Nico Pache (Red Hat) <nico.pache@linux.dev>

-- 
Nico Pache (Red Hat) <nico.pache@linux.dev>
