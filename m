Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC26D2DCF61
	for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 13:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781702028; cv=pass; b=nQtqiKYEyG7ji/Bt/nZh+tBJEFkIaEOhgKxr7niK44LzbeY2JK12LOABwOTcjqJRApfDdit4pTkVG87tIKWfgnDCgM3WmW/bWU7f3J+TgX36rcQ6dSfzMzdt4guSB04Qw1Y0LoF2QhYGosmz0Bfgiq5RnVp23s7cBkzeB7GgwgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781702028; c=relaxed/simple;
	bh=etk5TEpxc/Cbokv32elfaJQtcuFnx/QCHFl6IdRsRsE=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UySSI8evJGb4BBObKbgKPQJ2LWR4eT5PM0FBYa1wfnNILJ4ukF2Cv/93iTkIj7//32+rfcvxSBLuHWn/3XHMcrLd8oR10Rpuka1rfQLEqZegD5rVpiZF1tNuYR7AwdqGgxF0m7wXocyyJ8K1rEUo/wAXw5JsmOHygG7Ds4S5cDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WURSLT8G; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WURSLT8G"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-137335bc3caso7137494c88.0
        for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 06:13:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781702026; cv=none;
        d=google.com; s=arc-20240605;
        b=IG3mbgsdWJ25ABzFp1F4AKbIzQiIhEkYdr+8I4djEOByuaGpV+RJQcA+JCs+TzSf8q
         L00AyE52vFl3rK57kc2Kk/W36Hcln9BVDBP3rQaJwaVHZ4dqF3OHljXV7Qed224667EB
         SMtt+83QcZd4AQ5eaBbEid7iQPDCUY4mhLzz0X3o4SkFagiUThNn8NhDIIdHBz0OqNLw
         1YsxR7tIJ5fpU0oWpy1OnfrwA0RGdfdWJNWE3IYFUOAYl9vRBbDfHXpnQorTlT3Hb7vd
         FWTjILUyb2tPLcLq4+aZV/XqQAgyq/OdcppnM+30RPUdq5HryPb6X33YJQ9aDNjo4qVT
         hJdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=etk5TEpxc/Cbokv32elfaJQtcuFnx/QCHFl6IdRsRsE=;
        fh=KmyjkFaJgPqn81S9yJ81/U7I90MylzyXR3YtgXJHg50=;
        b=CKlf+bYYWkC72GG35bd2g0MG8HnnJLfqtpzOAc3KcSHvtzeBfYgCj+EhNo2oY0v+2r
         QGHkMtbAb1f0Ij0BKAYxsZxRBHO40creaoko0jjnei6NC0T/hYcIV3cINenI43QfhyQB
         ylQq0z7m/i+xJA5Q/cZPFm6y6qvliPUHs26G/0qJhil3VYglfcwqgs0IXeinB5zjq3+Q
         7efJ7dMankQZBxZhBdAVnCYNxpcf5D2wwVUhmPDvlHQ1RbhvXFtfWj3kOKYFVmj9t+MU
         mABhDiSpvFcECBeRgzCY9msonFd6SrJqOO30PUoQUWkG29Zg1JX8zjLyjokRPiYeAxMv
         R48Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781702026; x=1782306826; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=etk5TEpxc/Cbokv32elfaJQtcuFnx/QCHFl6IdRsRsE=;
        b=WURSLT8GJavJ/M1WIL1iPJmkZhxu6BXJTy9IFCf0E6qJfOOVjG/LVWkh3jKTQlBpN8
         6fhHige+n2UKYumtYzhOAfhAitRgXxPA6J3L0au6sl4uelyExcsX/XZF2W65ywE5ppZT
         EeRrYlxUrQMA9gUvnKIdoA3NoO2AFOx/N4Jlc6d3aNVG3r7qdHBivE2KQrHxa6cOzKG7
         qlAJ4EseWc5D/f+ZrLOcN4HjQnwj5BLLSoOq468s8JM3rVoYA6wGKZVedDka0i+m7w6w
         JJrQyrBoQOphObbLwqeNXPNcfjSa2R31fUoaleVQ5Aa4c7Rpnrvxe5SA0moU7hTKKr0H
         wAvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781702026; x=1782306826;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=etk5TEpxc/Cbokv32elfaJQtcuFnx/QCHFl6IdRsRsE=;
        b=DqgcxQHkcs09iCMGJcKWCIFwCI6HL8u272/1FS+ogbl2W1AReRQUpiT9Wc7hpwon43
         Irne5CyzSo+OWY8wiRkKgEgLdMaieCdhkCrlYrABcU++M9UT5Cir+LuchkeJcMJO1LBQ
         KkWbLSBMJzlXYlf565PX743Pz7kgagfRTl/kHo5DtkdB5UwhmPXvxLHExLp0Z6Z/KIHz
         tYN/0f1V3nBWo/A+Qk4HvIJY4eoZO4uDq3WZ+WC2Rb5/Lhvc5W2FL+bAdMvtaic+dkvd
         Yki7xrj8ND4inkJSDNzwjdMIsxMsCoZWACYkDdIQUguZUf2nqvG2JXW7UjwRzlva2Q+H
         uavA==
X-Forwarded-Encrypted: i=1; AFNElJ8zL6Dg5Pr8A1xKaDPflWfkgT+y2vNgCaQXB5yqS9kzYJxTL6iJ0QHA2KvtiusUDndy/aLhQImscxERKkHarOo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF6Uu7gXUfAIjgNvJ5AVpkxpVErMMynAQ9vI0RVnOtxj+bfG+q
	CgZmL4Jte7UTMdIhZ9mXVtqwYlQNR2RSjqkHiJSeblVIHpxSUSAln78julGUj+ZfsR9zp7OnpHu
	xikX2BfBGyAc2jQnyhdn/ou4UW6GcBtTmkB9LiRBV
X-Gm-Gg: Acq92OHpeD/YlxIscDcHopEZmdFYWN8qp1zSRqsc99ldOGKzjK7wM0vBGEzcpEDVx6w
	zNCtoldrs8IVj1tAgt8DhsYgkUu8U7IxEbdX8k38DZWO0NZCmhqfsPFnUqxu7kXzToQwEuQeEvE
	bf6PRm0F4Nlkl2P76e1CMPpzH0QnQCRKazeIhLvN04emYODhLFpjd2PL1rZifs0R64NZwSgfSbf
	xbHNykJUo2ZLxdsmiJgm0jUUymQZkvAI9kDVxG4BxpX6dUdD5pX22JT1d3a/syOK49rNxpWRR9a
	Eb0GFoAczupKEQp0OFJzWAWbnz3M
X-Received: by 2002:a05:7022:524:b0:137:fad9:3a30 with SMTP id
 a92af1059eb24-1398f696441mr1495391c88.19.1781702024655; Wed, 17 Jun 2026
 06:13:44 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 17 Jun 2026 06:13:43 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 17 Jun 2026 06:13:43 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260602-memory-failure-mf-delayed-fix-v4-1-a5bc7db5a9b2@google.com>
References: <20260602-memory-failure-mf-delayed-fix-v4-0-a5bc7db5a9b2@google.com>
 <20260602-memory-failure-mf-delayed-fix-v4-1-a5bc7db5a9b2@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 17 Jun 2026 06:13:43 -0700
X-Gm-Features: AVVi8Cfnc-0tXLPGbgF8GaHxdvGvxKqOIRy-XHFGP0uROl7Q0KGVLFb3jhqBNAo
Message-ID: <CAEvNRgGmX9oboHx=GGdWGJYebptyr0qdCsVFgSNQ5miUt4tFEw@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] mm: memory_failure: Clarify the MF_DELAYED definition
To: Lisa Wang <wyihan@google.com>, Miaohe Lin <linmiaohe@huawei.com>, 
	Naoya Horiguchi <nao.horiguchi@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: rientjes@google.com, seanjc@google.com, vannapurve@google.com, 
	michael.roth@amd.com, jiaqiyan@google.com, tabba@google.com, 
	dave.hansen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

Lisa Wang <wyihan@google.com> writes:

>
> [...snip...]
>
> - * MF_DELAYED - The m-f() handler marks the page as PG_hwpoisoned'ed.
> - * The page is unmapped, and is removed from the LRU or file mapping.
> - * An attempt to access the page again will trigger page fault and the
> - * PF handler will kill the process.
> + * MF_DELAYED - The m-f() handler marks the page as PG_hwpoison'ed.
> + * It means the page was unmapped and partially isolated (e.g. removed from
> + * file mapping or the LRU) but full cleanup is deferred (e.g. the metadata
> + * for the memory, as in struct page/folio, is still referenced). Any
> + * further access to the page will result in the process being killed.
>
> [...snip...]
>

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
