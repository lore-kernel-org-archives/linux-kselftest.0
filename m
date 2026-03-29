Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AAD42D9EED
	for <linux-kselftest@vger.kernel.org>; Sun, 29 Mar 2026 09:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774776098; cv=none; b=MnAoKHSMioAcp7n625DHxIkM3qMMTCzeY9iQp8/x/b3FYV7q47cxgYxCf/C4JYxg7OQdLxMin/lBasaFZthGmQejdxbXEVN8KfGf+iOKWdcpdOBL4S5waRrHORQ0Oix43P8B41V6h1eBrIdV15rVIR851fWOgPNhHLmzqiGhDgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774776098; c=relaxed/simple;
	bh=ix51tPQttaF9IP+CoZJq1BAbvfBkUV/SdgoZ4r5Yw+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PzM8C0lB5fBf4uuCYiSRGDYbGdidd2ZrjuKQPIEtLyG5mhGIrY3vDK40YlP7BlzYQOtybmxHUQAHxUfK3SewQN8LoGBeYqiBJpYhm2vS+fV5eezt8U6TgRyU+URUd4t8lENuFWXiBG3gyh3XrMJ+wNbD5K1yjUqBxzj/N9GMS9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K4XYf0/P; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K4XYf0/P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774776095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/PqKdnWYBl+3MLXiN4FswCOj05Ubop0U+aeuFYzD6Zo=;
	b=K4XYf0/PBx4m4FxMcuwkOFQyTNuruztFXM149hT6ZUQYH0NPz4tZeh1oG+2PDQ/5m0bAZg
	3YD25h2ao5ZlSD0w26TaRdN8iGZD1O60d9CLrZyQ+F0Ib7UOfWLqhP2EYp88KLcWaQ1XFI
	3HQUICRozAvkWuu8dUgKhJi5IJ8OyDw=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-230-D--kvJZ5Md-wWk-tpjIpQQ-1; Sun,
 29 Mar 2026 05:21:32 -0400
X-MC-Unique: D--kvJZ5Md-wWk-tpjIpQQ-1
X-Mimecast-MFC-AGG-ID: D--kvJZ5Md-wWk-tpjIpQQ_1774776090
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7DFE2195608D;
	Sun, 29 Mar 2026 09:21:29 +0000 (UTC)
Received: from gmail.com (unknown [10.72.112.11])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B9FD3180036E;
	Sun, 29 Mar 2026 09:21:19 +0000 (UTC)
Date: Sun, 29 Mar 2026 17:21:14 +0800
From: Chunyu Hu <chuhu@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: david@kernel.org, shuah@kernel.org, linux-mm@kvack.org, ljs@kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
	baolin.wang@linux.alibaba.com, npache@redhat.com,
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
	lance.yang@linux.dev
Subject: Re: [PATCH v6 4/6] selftests/mm/vm_util: robust write_file()
Message-ID: <acjvCmSUV2b2ltLM@gmail.com>
References: <20260324013316.2590422-1-chuhu@redhat.com>
 <20260324013316.2590422-5-chuhu@redhat.com>
 <20260326230349.dcd0b30030c7d460e8b0f319@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326230349.dcd0b30030c7d460e8b0f319@linux-foundation.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On Thu, Mar 26, 2026 at 11:03:49PM -0700, Andrew Morton wrote:
> On Tue, 24 Mar 2026 09:33:14 +0800 Chunyu Hu <chuhu@redhat.com> wrote:
> 
> > Add two more checks for buflen and numwritten. The buflen should be at
> > least one, otherwise the 'buflen - 1' could underflow and cause trouble.
> > The numwritten should be equal to 'buflen - 1'. The test will exit if
> > any of these conditions aren't met.
> > 
> > Additionally, add more print information when a write failure occurs or
> > a truncated write happens, providing clearer diagnostics.
> 
> This one has no review and AI review did identify a kinda-bug.  Maybe
> nobody calls write_file() with buflen==1, but still worth addressing I
> think.
> 
> https://sashiko.dev/#/patchset/20260324013316.2590422-1-chuhu%40redhat.com
> 
> Chunyu, could you please take a look?

Andrew,

By limiting the buflen at least 2, it will avoid such an issue, this is
also suggested by Lorenzo. I'll fix this in next version. 

AI question about that we need to handle error path and trucate path
(numwritten < 0) and (numwritten < buflen -1) seperately.  That makes
sense. I'll handle that in next version.

"""
> +	if (numwritten != buflen - 1)
> +		ksft_exit_fail_msg("%s write(%s) is truncated, expected %zu bytes, got %zd bytes\n",
> +				path, buf, buflen - 1, numwritten);
>  }
This isn't a bug, but the new error messages here and above use %s to
format buf. Since the API requires an explicit buflen parameter and writes
buflen - 1 bytes, does using %s risk out-of-bounds reads if a caller
passes a buffer that is not null-terminated?
Would it be safer to use a precision specifier like %.*s and pass
(int)(buflen - 1) as the length to safely print the exact contents intended
to be written?
"""

That makes sense, I'll use %.*s instead for the buf print in next
version.

> 
> Thanks.
> 

