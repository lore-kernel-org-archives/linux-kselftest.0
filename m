Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177BD1ACEDE;
	Mon, 28 Sep 2026 03:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790566701; cv=none; b=rjUx7RRiirFT6JiHvQMqdhV41qlj7jL3TRWEblX2JXf5rsfPa/tkF3DfxlZCD5CLLid7WizuSdG7ym8w8cQEOWLiVu6X1jrSI1LmWz4GlirAILluKl+hkEY1sp1R2w0PYHOrE3ULLzsTpPhIMv6982tZuFs9UkUW50TYMMU63+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790566701; c=relaxed/simple;
	bh=e1FzCridveI351/gfFU1tms0yyFTfLVWqo9GWJ0c2g0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=qL1ecP/xulKxKxdn2t8W9Vv+oCepUE5mCDcFpb/Ug65yfkIWeCOAjbG0S7GR5dN+VZiVmjmIPLY2TSdWpPvddjAl0OX5JLoXUEOw1vzC1zSGygqXX4fahemcqNhtIa6qwO8TStE5eXM+CLZGzdjdgEQTWpZuAGkIfTDi+U56kY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=M8jfexNR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="M8jfexNR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 388F51F000FF;
	Mon, 28 Sep 2026 03:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1790566699;
	bh=Rqd+kxmYgnmYy9//PxWDP0AuMpqwxlp40X1NB7XfM3U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=M8jfexNRiMmn5SqJpBK6o3SBKOT0HgRRk9cgWxXQbDn6pmXiFaiW2OMkxLHbUwS5d
	 AWY3tunpj+e3LTLNE6nOknZGSZu/zBOT4QQRUMfbIxV40WhmGPFoIfks2bG9gJwIco
	 iAgzaVlcT+BSLLgdxPzrtPNJcORV+bgYVOmdu5jY=
Date: Sun, 27 Sep 2026 20:38:18 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Martin Cracauer <cracauer@cons.org>
Cc: linux-mm@kvack.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, shuah@kernel.org, peterx@redhat.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: uffd-missing-wp: add GC related
 functionality test
Message-Id: <20260927203818.2f4b34b37f4a6e1685c3d142@linux-foundation.org>
In-Reply-To: <arneZ-KkRWUNI0Ho@cons.org>
References: <arneZ-KkRWUNI0Ho@cons.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 27 Sep 2026 23:26:31 -0400 Martin Cracauer <cracauer@cons.org> wrote:

> Add a test that asserts that functionality needed for generational
> garbage collection works.  Namely to implement a write barrier using
> userfaultfd instead of using segmentation faults.  The planned target
> is the GC in SBCL.
> 
> The real GC will initially fill heap pages by using on-demand loading
> of pages from an image file, either via mmap(2) or using userfaultfd
> to decompress a page read from an image file made from individually
> compressed blocks.  This test doesn't do that so that it needs no disk
> I/O and no decompression library.  Instead, a fault will be filled by
> copying page content from prepared pages in the heap.

Thanks.  Sashiko asked a couple of things:
	https://sashiko.dev/#/patchset/arneZ-KkRWUNI0Ho@cons.org

