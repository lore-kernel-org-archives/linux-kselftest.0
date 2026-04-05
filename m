Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998D833F8A3;
	Sun,  5 Apr 2026 21:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775424961; cv=none; b=XUFKenPZCXK2GXJ6Xv9k7cqxmEraYfW0+awVd62Cr7vue8MjCSpOB4MiMxDpFpYmPOLwBaZ4G+4Y1gsoROcC+30A27BvE+EGwNiFLQouAmEHV0V+Zi6zq5tN8ZAQIwuhwDOzf+8UnbgnWkIwZEQXvt0f3/9QUU2gSXPLNDVoehk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775424961; c=relaxed/simple;
	bh=+vbdlbFbNNNIfUyUX0JsNdUg8YUtFUxeGql4X9jzJ+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YeDy6vjniHp/l9vFRhzP4kEPT9VdLFDmMS+lo6KNfqt9NHTBXE5mSuTYnRNsP5/gfHAKLoDydvTvN4aAV3qPzXVfVpjnG0c2HUfwEV0F4tdLwqxeeWsggxM0U/8nM1milAcEvtkit5efdcb/FRew4+0U/KAQOZIyO5REGeMUtZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=gCAAIveA; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="gCAAIveA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:Content-Type:
	MIME-Version; bh=+vbdlbFbNNNIfUyUX0JsNdUg8YUtFUxeGql4X9jzJ+Y=;
	b=gCAAIveAKpJx4T70s7HCK22QW/k7334xQjus7sJzsq6Qlr2Ta1UIIwzPDupifN
	pPNZJRcCjY6zvxR5G/vCwNCc3vNCPSRgyenvcmwETWdH9vx6VA5SBMIg22rN7cfS
	Yzk6DDp75MFel7YOeRoBAck3dZ6/REV8anjlT7Bh0ulHE=
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wDXfHuQ1dJpNHtrDQ--.62638S2;
	Mon, 06 Apr 2026 05:35:13 +0800 (CST)
From: CaoRuichuang <create0818@163.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Liam R. Howlett <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mina Almasry <almasrymina@google.com>, CaoRuichuang <create0818@163.com>
Subject:
 Re: [PATCH] selftests: mm: capture write_hugetlb_memory.sh exit status
Date: Mon, 06 Apr 2026 05:35:12 +0800
Message-Id: <177542491250.2079.13359792600713218361@163.com>
In-Reply-To: <20260405132057.c1ae7267911c5657cd5a3fe9@linux-foundation.org>
References: <20260405194623.84218-1-create0818@163.com>
 <20260405132057.c1ae7267911c5657cd5a3fe9@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:_____wDXfHuQ1dJpNHtrDQ--.62638S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GF15ZFy8Xry5Kw43JFWDJwb_yoWfArc_ur
	93tryDGw1DWanxtr1Skr1UtF4xJFs7uFy5Xa48XF42yFy8tFsrAF45Wr13W348Ja18Aa15
	Crn3JFWUZ34aqjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VU1yxRDUUUUU==
X-CM-SenderInfo: pfuht3jhqyimi6rwjhhfrp/xtbCwBGo4WnS1ZFWbwAA3e

Hi Andrew,

Thanks for the review.

I re-evaluated this after your question about the backgrounding model,
and I don't think this patch should move forward as-is.

In the async branch, write_hugetlb_memory.sh is invoked with -l, and
write_to_hugetlbfs prints DONE and then deliberately sleeps until
cleanup_hugetlb_memory() sends SIGINT. Waiting for $write_pid in that
path therefore blocks before cleanup runs, so my patch can deadlock
instead of reporting a meaningful exit status.

So I'll drop this change for now rather than push a flawed fix.

While validating the test on a minimal Ubuntu VM, I did find a different,
reproducible issue in the same selftest: cleanup currently depends on
killall from psmisc. I sent a separate patch for that one.

If there is a clearer direction for simplifying or tightening this async
flow after -rc1, I'll follow up on it.

Thanks,
CaoRuichuang

