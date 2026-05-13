Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4500385D76;
	Wed, 13 May 2026 03:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778642680; cv=none; b=B7P4GnAVaSxDeWbhw5CuJ1l6OFDRj08fiEL3jIStsPYXkpMAX9vRkw1Kkpxkc3URn6C7eIdZUv6UkPZ/LeGSa5AO3BQ96PEUPTOPN/RPthIVnUd3QwbC5lT+akQ6QDjsdWtNABD1P3VPPfu6ir/NFycFacbuJjHO/Fzz4MJYb+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778642680; c=relaxed/simple;
	bh=WeTxWCELMc05TsXWrycjVf+KrYRziDCqbR7joXkp6tw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=E2rrjmOJvFbI4qYX864PCv3PqH8IJrswe16BmCxgjUFyRoF1kKDgoCB6qjuA4nZDmg/VqDa6eg772pAGsyOSLhxo7lRiuxPLaMlH9a7l+SzmWN3F3Vqhre+2aNe47TVYjxCTrw3an50DtKxVlIlxHn7TRg/RxLAwr5GjCcAw7Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=xd0V97Ck; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="xd0V97Ck"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED6B5C2BCB0;
	Wed, 13 May 2026 03:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1778642680;
	bh=WeTxWCELMc05TsXWrycjVf+KrYRziDCqbR7joXkp6tw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=xd0V97CkQEyg8x1FCAD5O8fl3kaLAs6QTAlIzAN8i7h9BDqugDelSjLtLWiLpt82w
	 /lo32+w1a5m/ikHJozf7RS3jC3KMNyJPQRApM3skBLRvETu1vUSWOhogkx1RkNfRkY
	 WVNe7LEJIPK3i85YpX/8OCD2wwknb8wg1/pXfZt0=
Date: Tue, 12 May 2026 20:24:39 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Sayali Patil <sayalip@linux.ibm.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Ritesh
 Harjani <ritesh.list@gmail.com>, David Hildenbrand <david@kernel.org>, Zi
 Yan <ziy@nvidia.com>, Michal Hocko <mhocko@kernel.org>, Oscar Salvador
 <osalvador@suse.de>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dev Jain
 <dev.jain@arm.com>, Liam.Howlett@oracle.com, linuxppc-dev@lists.ozlabs.org,
 Miaohe Lin <linmiaohe@huawei.com>, Venkat Rao Bagalkote
 <venkat88@linux.ibm.com>
Subject: Re: [PATCH v6 00/14] selftests/mm: fix failures and robustness
 improvements
Message-Id: <20260512202439.e71f233281428ff596dab0b6@linux-foundation.org>
In-Reply-To: <cover.1777877814.git.sayalip@linux.ibm.com>
References: <cover.1777877814.git.sayalip@linux.ibm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  4 May 2026 13:54:37 +0530 Sayali Patil <sayalip@linux.ibm.com> wrote:

> Powerpc systems with a 64K base page size exposed several issues while
> running mm selftests. Some tests assume specific hugetlb configurations,
> use incorrect interfaces, or fail instead of skipping when the required
> kernel features are not available.
> 
> This series fixes these issues and improves test robustness.

Sorry, bitrot.  Mike's monster series "make MM selftests more CI
friendly" has moved a lot of this code around then altered it.  Can you
please redo against mm.git's mm-new branch?

Thanks.

