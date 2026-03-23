Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD24382296;
	Mon, 23 Mar 2026 22:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774305583; cv=none; b=cNz5Jg0qaLetqF3M4HiOx0X35EF1MLE+P9hbhubpzUa6eq1xSK0SFfqjr1+HiSc6dirOjJKLgHVMppwbL5kGS9Z+8xudpHyJFr+kOpGUTmZDr/5Mk+6YPrUDQKUEEh5AMdTz1rmyrrlbUZb6J/JFNfBB0B+hDUE/HWxMdyjnAKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774305583; c=relaxed/simple;
	bh=/POZ2oyUorAwl07dujQRj5OswZjstruSQ2Nk+WEEwVE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=skBe4Q/8krVcW3ay87F9lPPL/7zk536HyT7yAON2r6Go7EqGJV/m/b/UvBPr5y/knbI2c98g49B9ZXVRIIW13oAbDYEgDkp48Uv1kU1g/kE0tMSNpb44Z4ceVptB4acXvfcGGtUXMnzlYR9KionaryWlBtgCVQ0CFmTmK9HHaGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=IWvfirzM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="IWvfirzM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A12FC4CEF7;
	Mon, 23 Mar 2026 22:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774305582;
	bh=/POZ2oyUorAwl07dujQRj5OswZjstruSQ2Nk+WEEwVE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IWvfirzMniNwG13wiim+tYJvHHNqtjnwB2Xmhzc+Mxq+gEpjC4wppnhtyoJJdylan
	 Ic4ev5sD2XcmD4ZWlCd62CYnEZ0mqdN9M+63U2bGlR10Rsm9iojPfERVlK6SRyeVbS
	 poawOx/Z28W4YqEFCytBm9qhcKdLhK/7f/d10Af0=
Date: Mon, 23 Mar 2026 15:39:41 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Chunyu Hu <chuhu@redhat.com>
Cc: david@kernel.org, shuah@kernel.org, linux-mm@kvack.org, ljs@kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, npache@redhat.com, ryan.roberts@arm.com,
 dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev
Subject: Re: [PATCH v5 4/6] selftests/mm/vm_util: robust write_file()
Message-Id: <20260323153941.289938dd9ced4dbb76ca7804@linux-foundation.org>
In-Reply-To: <20260323151753.2576137-5-chuhu@redhat.com>
References: <20260323151753.2576137-1-chuhu@redhat.com>
	<20260323151753.2576137-5-chuhu@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 23 Mar 2026 23:17:51 +0800 Chunyu Hu <chuhu@redhat.com> wrote:

> Add two more checks for buflen and numwritten. The buflen should be at
> least one, otherwise the 'buflen - 1' could underflow and cause trouble.
> The numwritten should be equal to 'buflen - 1'. The test will exit if
> any of these conditions aren't met.
> 
> Additionally, add more print information when a write failure occurs or
> a truncated write happens, providing clearer diagnostics.
> 
> ...
>
> --- a/tools/testing/selftests/mm/vm_util.c
> +++ b/tools/testing/selftests/mm/vm_util.c
> @@ -769,6 +769,8 @@ void write_file(const char *path, const char *buf, size_t buflen)
>  {
>  	int fd;
>  	ssize_t numwritten;
> +	if (buflen < 1)
> +		ksft_exit_fail_msg("Incorrect buffer len: %zu\n", buflen);
>  
>  	fd = open(path, O_WRONLY);
>  	if (fd == -1)
> @@ -777,5 +779,9 @@ void write_file(const char *path, const char *buf, size_t buflen)
>  	numwritten = write(fd, buf, buflen - 1);
>  	close(fd);
>  	if (numwritten < 1)
> -		ksft_exit_fail_msg("Write failed\n");
> +		ksft_exit_fail_msg("%s write(%s) failed: %s\n", path, buf,
> +				strerror(errno));

AI review
(https://sashiko.dev/#/patchset/20260323151753.2576137-1-chuhu@redhat.com)
points out that `errno' was overwritten by the close().  Maybe.  Or
maybe a successful close() leaves errno alone, dunno.

Apart from that the comments appear fairly minor.  Please lmk if you
think we should proceed as-is.

(I'm really trying to slow things down now - we have a *lot* of
material and a few weeks of consolidation is needed.  But selftests/
tend to get a pass, for obvious reasons)
