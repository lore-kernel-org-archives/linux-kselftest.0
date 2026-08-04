Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD92B47DF97
	for <linux-kselftest@vger.kernel.org>; Tue,  4 Aug 2026 20:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785875959; cv=none; b=jGRE2+vDW4ly0qF79wCTNVRHDKCiEarMmhEcBu0/A5di5YcTQAW+Vemrs2TnXT4iaU/TZNdfdJm/2nNFULdzYc6Rf9jb8RQ/g+vEzoik+xLcEbzcj6DK8BZWykLrxG2Fkj9Gnhb6loSgPqG6L1Z+kBiRGBypnbMeuBdYqGC4K2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785875959; c=relaxed/simple;
	bh=ncqU5v3Dgdl6TY0GvYyGNG/EXeGA0WrYiQotiF8E0+o=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=ONIsEr44u69mSl1TVjMogD+lHwVs0tXikjBlCnBRjeYl1W/cvVwIvpIm52iBRZmjYI+kEdiRHJ0FCdwkvN+Z4UndtAYF5xotztKwrCDpUiy2tqkbcqD7EPyMP7c3NKiJUf3Gv1/hG0NKgbwueAdqJ6cFtsLxKAIjK6lJWA4L7eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QL7vGd2Y; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QL7vGd2Y"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785875955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/VvjpSGk2j7wEi+0eGooFSuN61xYiJE9ZIQ63JPvePM=;
	b=QL7vGd2YCSw9/c4n/5pToSUUL092xi1wVowNHWu7l7DB6mX9ZgDeh4sqyOgF9EdvU2epIA
	EGNQ+uBmyZwrzOOnJblnNUNdBRrVC/zV0B9PASLszFj0qhwU73z6PZCJzHVFSqkRQ10kyc
	G1BSOlXaI+2qa69x1jC5FHtZwrq7B5s=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 0/4] add anon mTHP collapse test cases
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Nico Pache (Red Hat)" <nico.pache@linux.dev>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
 ziy@nvidia.com, liam@infradead.org, nico.pache@linux.dev, dev.jain@arm.com, 
 ryan.roberts@arm.com, baohua@kernel.org, lance.yang@linux.dev, 
 usama.arif@linux.dev, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <cover.1785564857.git.baolin.wang@linux.alibaba.com>
References: <cover.1785564857.git.baolin.wang@linux.alibaba.com>
Date: Tue, 04 Aug 2026 14:38:43 -0600
Message-Id: <178587592371.79283.16750931617435580186.b4-review@b4>
X-Migadu-Flow: FLOW_OUT

> This patchset is split from the previous shmem mTHP collapse patchset[1],
> which only adds anon mTHP collapse selftests. All khugepaged test cases
> can pass.

Thank you for sending this out :) I played around with it and it seems
to be working. This lays good groundwork to expand khugepaged mTHP testing
in the future too.

Tested-by: Nico Pache (Red Hat) <nico.pache@linux.dev>

-- 
Nico Pache (Red Hat) <nico.pache@linux.dev>
