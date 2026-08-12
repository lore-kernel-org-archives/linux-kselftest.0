Received: from mta1.migadu.com (out-119.mta1.migadu.com [95.215.58.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6775233B96B
	for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 15:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786546967; cv=none; b=jawiNOCN0fskI5wk5JkSYWYxObrcuyqYv88WVwHzI7VXYjr9dAnPMDuhb5pfVbvfGSYsh4ui/32Vc8JOTFVGjH46cko3wBEFNx6XtQvbVvXfTA3j8zW5jLT/Ni9emvQV0diVV4N77/ps7sUZWihvBCg1xPgV82Y9G18n9MCQW6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786546967; c=relaxed/simple;
	bh=JKWLnlDFJd1uxYLyCitzdHvCvuNrwGxgCJboQQwEr0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f1yjFst7ZaaUXmoFHcWDeGjPuoyw6R+tqu4VJMN8DxNL+T817PGDsl9bOC/RyJzBlswBlNH6yOkglrVWREfzY4RijJK4HGwEYj2uRbxQPr+Aq9A9zlOIbJoZYk+DxjDJvxKy8s4UbDyZ96zw/ySIEm2Yie1/gL7bDDIvDiT3E2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tPg0ZtA7; arc=none smtp.client-ip=95.215.58.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tPg0ZtA7"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=JKWLnlDFJd1uxYLyCitzdHvCvuNrwGxgCJboQQwEr0I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786546957; v=1; x=1787151757;
 b=tPg0ZtA7vfMucBEGVMj/kbusrB5CiB8ql5vLhyi9AbCuVeqzKtN2JI3tVk1yEJPnKBTqZGcj
 zPkLMzUB6n8Qc5bD0sXKckHuHmaImcFQuJEBszWr+JKnJR1g9cJ8PLVVxCG96YjH8cClm0U63yI
 LsN8EQUnNDJnZiNro04tZwtc=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: from [IPV6:2a03:83e0:1126:4:9d:a05e:5bd8:c200] (2620:10d:c092:500::4:f140)
	by smtp.migadu.com with ESMTPS id e66d9dbc13f52a81;
	Wed, 12 Aug 2026 15:02:26 +0000
X-Migadu-Flow: FLOW_OUT
Message-ID: <8433cfb1-111b-4c66-b2b5-7ca7242623ea@linux.dev>
Date: Wed, 12 Aug 2026 16:02:20 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/18] selftests/mm: raise the khugepaged test-case cap
To: Kiryl Shutsemau <kirill@shutemov.name>, akpm@linux-foundation.org,
 david@kernel.org, ljs@kernel.org, nico.pache@linux.dev
Cc: baolin.wang@linux.alibaba.com, baohua@kernel.org, dev.jain@arm.com,
 hughd@google.com, lance.yang@linux.dev, liam@infradead.org, mhocko@suse.com,
 rppt@kernel.org, ryan.roberts@arm.com, shuah@kernel.org, surenb@google.com,
 vbabka@kernel.org, ziy@nvidia.com, usama.anjum@arm.com,
 agordeev@linux.ibm.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, kas@kernel.org
References: <20260812132304.199287-1-kirill@shutemov.name>
 <20260812132304.199287-2-kirill@shutemov.name>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <20260812132304.199287-2-kirill@shutemov.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/08/2026 14:22, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> TEST() ends the run with "MAX_TEST_CASES is too small" when the table
> fills, and the table holds 64.  A full invocation -- every context crossed
> with every memory type, which needs a directory for the file and shmem ones
> -- already registers 63, so the next case added anywhere aborts the whole
> suite before a single test runs.
> 
> Raise it to 256.  The table is a static array of small structs, so the room
> costs nothing worth counting, and the cases added after this have somewhere
> to go.
> 
> Assisted-by: Claude-Code:claude-opus-5
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Acked-by: Usama Arif <usama.arif@linux.dev>

