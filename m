Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5235C2FF155;
	Fri, 27 Mar 2026 06:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774591431; cv=none; b=Ar25WsQmXhv9OmJPIpKFaxA4slxm2v3OJKJD5H2fia9vnKV0ris/MkNvc1v6qwB+ar6aZL0gNKpZPfXn/H0KdcEaYpK4DgLGkIYRYZd9JNURsd1mYERWaANgvecWwwxBVYpJ9sXTkYsNFSXOQvRyrzfJx2LzvclO3SA/tXAggl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774591431; c=relaxed/simple;
	bh=dIJgpW3rgNNkTB5QrRD+G5rTSR8uZZDY8VpAkWA7Li4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=pxnqjUUA0DEsyIoBwlOcpprEpm2NmChpjZbzihyW8rOlbBQldB6S3Jphmu8bWSrgRcfaty66wKsZtrD5stpnjlCqhU5zJ/hl3/1rcQwQsmNadQZp1HtBhdjaNNnE8Cg+NkWZQOtfOPuHz+8W2guwFP9i8BfqnJYhQEdztRDNOQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=lx6yiDrV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="lx6yiDrV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41E31C19423;
	Fri, 27 Mar 2026 06:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774591430;
	bh=dIJgpW3rgNNkTB5QrRD+G5rTSR8uZZDY8VpAkWA7Li4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lx6yiDrV8sD2/KIpF7evwAgIzinKOstx6sQXxuKbm8EsgqO4aWCaVBBIzUbRtchFQ
	 d/fW9dt5XmoaoFDD986TadMhjdCQoJAACrVFbgEX/mcMCw5sj8LBi44NhGs0VzNhrN
	 kuw0XlIB3CKBg00bN2IKT9jdYon6yFveuep4wGCw=
Date: Thu, 26 Mar 2026 23:03:49 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Chunyu Hu <chuhu@redhat.com>
Cc: david@kernel.org, shuah@kernel.org, linux-mm@kvack.org, ljs@kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, npache@redhat.com, ryan.roberts@arm.com,
 dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev
Subject: Re: [PATCH v6 4/6] selftests/mm/vm_util: robust write_file()
Message-Id: <20260326230349.dcd0b30030c7d460e8b0f319@linux-foundation.org>
In-Reply-To: <20260324013316.2590422-5-chuhu@redhat.com>
References: <20260324013316.2590422-1-chuhu@redhat.com>
	<20260324013316.2590422-5-chuhu@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 24 Mar 2026 09:33:14 +0800 Chunyu Hu <chuhu@redhat.com> wrote:

> Add two more checks for buflen and numwritten. The buflen should be at
> least one, otherwise the 'buflen - 1' could underflow and cause trouble.
> The numwritten should be equal to 'buflen - 1'. The test will exit if
> any of these conditions aren't met.
> 
> Additionally, add more print information when a write failure occurs or
> a truncated write happens, providing clearer diagnostics.

This one has no review and AI review did identify a kinda-bug.  Maybe
nobody calls write_file() with buflen==1, but still worth addressing I
think.

https://sashiko.dev/#/patchset/20260324013316.2590422-1-chuhu%40redhat.com

Chunyu, could you please take a look?

Thanks.
