Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F32480DE9;
	Tue,  4 Aug 2026 20:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785875961; cv=none; b=e/3DJFkRteLe2v6UaYDQDS8Cjaha/3caKMaUBNsOv4NsmSgV1JMrFtQxKbcRw0NvP/pqOs6aFxzGnASUGggoRc5jeraLify/lYK7hY/zxOg5Y+nOyKcCx5Gj/K+8v5KHZXxFMNwtcEiBT5h5MqjrHkYTyFFEZQPvI9c/iRRjz0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785875961; c=relaxed/simple;
	bh=uE1wyOBCs+cxWYyOdYFUbQcBESCB7XjpypKsj6aLd1c=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=aiPsYXOf4PvNc/IW0EG5ko9S6T/+55W3AK9DPbZ0bWU8YSSQYqSPJyWh/FN7FZEWm/9BN/+52YS9cBm0xPiqGbmTyf0tfg95nUTzcGmfYjjXrPJdQ88d5QzA+Munk7PXKA+naUFIbvQ0pLf9/FtCSiTUC1RlO3j51pHkLvMPhVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=f3nv4YMD; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="f3nv4YMD"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785875957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QYfrqWB9UcNJ91M0SwCiE6Sf0hX+9MVTc3GmUaItWRg=;
	b=f3nv4YMD5FA5QABWgLFS+PKTyVX29P0oqAU8AV5fC9d8Ru4z6oozCgqqJ853dAebWIwd+B
	hZg29qwWYnhMfkyVc/+e2pl07n5f384yDcjMK2MOKsKd7Z27IcJTO8ugK9F9fsuwmsTkcG
	vE4RTKKXNg8eaMZROu9xi/PPWCHtaxM=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/4] selftests: mm: extend the check_huge() to
 support mTHP check
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Nico Pache (Red Hat)" <nico.pache@linux.dev>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
 ziy@nvidia.com, liam@infradead.org, nico.pache@linux.dev, dev.jain@arm.com, 
 ryan.roberts@arm.com, baohua@kernel.org, lance.yang@linux.dev, 
 usama.arif@linux.dev, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <f2ad5bbe868dc7ed8642842ad2f9751a1ce79f70.1785564857.git.baolin.wang@linux.alibaba.com>
References: <cover.1785564857.git.baolin.wang@linux.alibaba.com>
 <f2ad5bbe868dc7ed8642842ad2f9751a1ce79f70.1785564857.git.baolin.wang@linux.alibaba.com>
Date: Tue, 04 Aug 2026 14:38:43 -0600
Message-Id: <178587592371.79283.9552373204791612099.b4-review@b4>
X-Migadu-Flow: FLOW_OUT

> To support checking for various sized mTHPs during mTHP collapse, extend the
> check_huge() function prototype to accept two new parameters specifying the
> address range and mTHP size, in preparation for the following patches.
> 
> No functional changes.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>

LGTM!

Reviewed-by: Nico Pache (Red Hat) <nico.pache@linux.dev>

-- 
Nico Pache (Red Hat) <nico.pache@linux.dev>
