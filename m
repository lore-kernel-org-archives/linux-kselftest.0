Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C66C2EAD1B
	for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 05:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786340643; cv=none; b=g6UYrwIrtnw+w+bfm2m0YYqB03JGJaLFro31jpZLfS7Cs0fY7JdVrYcFqw0/HvbgpZ6nlkwMcmHUKeL4Q8AnXhaEc6oaKPiYgHM6Xt0wuFOOrajfB6+6rbJHabOOyNbfSw06OHP+oNUvT9uUIJs1cWr4bgGed/6XOSR22HgrVIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786340643; c=relaxed/simple;
	bh=h6iuQvAsOX0KAW3vFHq8BlxF7913JKolA/fJJS9R95s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YWr8y/aetxGxVLiRiyAuNVLO6RZu5Hgq2LfuSI+DAnPTfe7ddyTQ+JQQEg8MACzTPaXovnRQvh48sHRP15RLbH7TYzbjaINpci97kgTvH9gUuiEq0SU7V/CKgSdKAjEbnfDy6QoOyQUAqXauoW9FnX+jhufSfBXE6fAYrS7e3e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GWzAyzsx; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GWzAyzsx"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786340638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SO9O2x/1heZGfWI79kiI1MjVfL/S/CCSC4z28A4xhNE=;
	b=GWzAyzsxnA9O25inhOpor2MP5uPSYRS5xoFbf5Pgh/SBVcrR+On+egCA10gZzUj06LvIpq
	lNsWL8qGLK0RBRJCGBq0vMLTJKBviMQ+3NDBSk+XHzjkK7DAyC907W1eT6QgfJ/DBZ4qL3
	uSWhFGPuS/W9cufF3rm8Pv0MfPEIpLU=
From: Hongfu Li <hongfu.li@linux.dev>
To: david@kernel.org
Cc: akpm@linux-foundation.org,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	dev.jain@arm.com,
	hongfu.li@linux.dev,
	lance.yang@linux.dev,
	liam@infradead.org,
	lihongfu@kylinos.cn,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	nico.pache@linux.dev,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	shuah@kernel.org,
	surenb@google.com,
	usama.arif@linux.dev,
	vbabka@kernel.org,
	ziy@nvidia.com
Subject: Re: [PATCH] selftests/mm: fix read_file() return value check
Date: Mon, 10 Aug 2026 13:43:00 +0800
Message-ID: <20260810054300.82437-1-hongfu.li@linux.dev>
In-Reply-To: <43b5db93-1c1b-436e-a8fa-d89582e31894@kernel.org>
References: <43b5db93-1c1b-436e-a8fa-d89582e31894@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

> > diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
> > index ef1ea11981a7..2697d50d07f4 100644
> > --- a/tools/testing/selftests/mm/vm_util.c
> > +++ b/tools/testing/selftests/mm/vm_util.c
> > @@ -755,7 +755,7 @@ unsigned long read_num(const char *path)
> >  {
> >  	char buf[21];
> >  
> > -	if (read_file(path, buf, sizeof(buf)) < 0)
> > +	if (!read_file(path, buf, sizeof(buf)))
> >  		ksft_exit_fail_perror("read_file()");
> >  
> >  	return strtoul(buf, NULL, 10);
> 
> 
> Yeah, that looks correct. Do we have Fixes: tags?
> 
> I think it was already wrong in read_num() in
> 
> 
> commit e0c13f9761df8f97cf5e81495d12ecbc4075684a
> Author: Kiryl Shutsemau <kas@kernel.org>
> Date:   Wed Jun 3 16:00:06 2020 -0700
> 
>     khugepaged: add self test
> 
> 
> where we had
> 
> +       ret = read_file(path, buf, sizeof(buf));
> +       if (ret < 0) {
> +               perror("read_file(read_num)");
> +               exit(EXIT_FAILURE);
> +       }
> 
> 
> So likely
> 
> Fixes: e0c13f9761df ("khugepaged: add self test")
> 
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>

Thank you for the review and tracking down the original commit.
I will include the Fixes tag you mentioned in the next patch revision.

Best regards,
Hongfu
