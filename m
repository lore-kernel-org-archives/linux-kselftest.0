Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52673CA488;
	Sun,  3 May 2026 13:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777814590; cv=none; b=aWnP8BgYNWhmt7+L2EEc37LKV6u+Yo/L7V5ZgPbkolZjAgQkbkMisX30UyYJzDhdQNJgVxGyV1R1lkUDkjujQnwCAtxdM6qRa4PtTeJEztT90F+ljGifEeCtu4LrgPRfzsxibDtfLZymUVT4IxfgwWefDoJ4Efx6D1dGPFp2iaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777814590; c=relaxed/simple;
	bh=mYNWMtlRqxgw8ZzffIHWqmYjfKhkeKsUP+dHj/1loP8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=JeGkffM9j9sVISRvHd7iNqY5393My5Iuy1KP0EVmBw/Sk2wz8iJgZda4LrLqZfAh/zfECfJ4Cx+9BwE5GvFjnJN+L3o3+HkWzBjHC+ADy9sQqN6lMhKlT3CLo59yRIuCph1oovJn3q0vdQYCcrkuntgsXq/iZADh2UQUBH8d2K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=NH30Knx/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="NH30Knx/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E538C2BCB4;
	Sun,  3 May 2026 13:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1777814590;
	bh=mYNWMtlRqxgw8ZzffIHWqmYjfKhkeKsUP+dHj/1loP8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NH30Knx/rQBjY70h33pZJsdDa3qAzY4uq/KYKBhUN8qk1pNAQ6F67C81O9jhHv1gS
	 qnp2ajP2p1QLUzjqg/3mdi8PtjgsM/f048oy1RotBnwkU/sUWnoOT2/cYYdLrTBrNQ
	 8QIyy0ATNhSwGdjtqtXXM8b8uu5GioQYP7E3HCHo=
Date: Sun, 3 May 2026 06:23:04 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Vineet Agarwal <agarwal.vineet2006@gmail.com>
Cc: shuah@kernel.org, linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, david@kernel.org, ljs@kernel.org,
 Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com
Subject: Re: [PATCH v3] selftests/mm: ksm-functional-tests: fix partial
 write handling
Message-Id: <20260503062304.02b166415ef419cf4df6cb87@linux-foundation.org>
In-Reply-To: <20260503101229.654763-1-agarwal.vineet2006@gmail.com>
References: <20260503101229.654763-1-agarwal.vineet2006@gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun,  3 May 2026 15:38:40 +0530 Vineet Agarwal <agarwal.vineet2006@gmail.com> wrote:

> Update write() checks to properly detect and handle partial writes.
> 
> Previously, partial writes (ret > 0 && ret != len) could be treated
> as success because write() does not set errno in this case and the
> code returned -errno. This could result in returning 0 and
> incorrectly signaling success.
> 
> Fix this by verifying that write() returns the full expected length
> and treating any mismatch as failure.

Thanks.  AI review asked some questions:
	https://sashiko.dev/#/patchset/20260503101229.654763-1-agarwal.vineet2006@gmail.com

