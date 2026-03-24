Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072BD391820;
	Tue, 24 Mar 2026 16:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774368569; cv=none; b=sAtCoJo0cr7OCCJzQoEfvCsOXDJitmz0id9Gnm/DwEAs2j6lc6ALhpmFl8PAsEi/3F8zjh1iA98KGAWbUoyeR2PrnRtCDsuPgoKBj3C0uA4BeHzfoLxLarRuZ8+W1KJaNy5m9FYnEkj/5Y8Ue3QwHb0umbE20t+IX9D6fRsFwrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774368569; c=relaxed/simple;
	bh=+VNZwLf2hFq4tQFgtsQXYLO62uURuRRQHVBaVT3NuT8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=YNQaOJc5VwEV0d5cV08skxlF6n9+mhk3tJ28SV3VALtbpS7tNN2vaeUvnjCQdrhmal/CpZ8SZ4X/JPGMfycLihWgI0VnePaJTHudXyyNrgeX/1198u18yp5v5FSYE7RdF+zuy2cx+vfLfG6jNguY1/74fNkQd7REJIfEWiOWbLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=07YayBE8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="07YayBE8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13225C19424;
	Tue, 24 Mar 2026 16:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774368568;
	bh=+VNZwLf2hFq4tQFgtsQXYLO62uURuRRQHVBaVT3NuT8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=07YayBE8Ncq4/YfhiSmUk+V5imcNswHCuEhleALDb/hAo8TDnKVgGaZP09RaZ/R4V
	 bqkotKSQTkLaYp17fVGuZ72YNGJ1WxMQGPFZwyKWSPb350yaYBwuwiWK3jHVmTXI7o
	 TdoP18t/YDq0Hdhvd8z+OmffHCx6lyMsO1xyJToU=
Date: Tue, 24 Mar 2026 09:09:27 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Chunyu Hu <chuhu@redhat.com>
Cc: david@kernel.org, shuah@kernel.org, linux-mm@kvack.org, ljs@kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, npache@redhat.com, ryan.roberts@arm.com,
 dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev
Subject: Re: [PATCH v6 0/6] selftests/mm: skip several tests when thp is not
 available
Message-Id: <20260324090927.eeacb7987d22ed8ba13fada2@linux-foundation.org>
In-Reply-To: <20260324013316.2590422-1-chuhu@redhat.com>
References: <20260324013316.2590422-1-chuhu@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 24 Mar 2026 09:33:10 +0800 Chunyu Hu <chuhu@redhat.com> wrote:

> There are several tests requires transprarent hugepages, when run on thp
> disabled kernel such as realtime kernel, there will be false negative.
> Mark those tests as skip when thp is not available.

Thanks, I updated mm.git's mm-unstable branch to this version.

> Chagnes in v6:
>   - patch 3 add reviewed-by from Lorenzo
>   - patch 4 handle the errno before and after close(), suggested by AI

Here's how v6 altered mm.git:


 tools/testing/selftests/mm/vm_util.c |   12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

--- a/tools/testing/selftests/mm/vm_util.c~b
+++ a/tools/testing/selftests/mm/vm_util.c
@@ -785,15 +785,23 @@ int unpoison_memory(unsigned long pfn)
 
 void write_file(const char *path, const char *buf, size_t buflen)
 {
-	int fd;
+	int fd, saved_errno;
 	ssize_t numwritten;
+	if (buflen < 1)
+		ksft_exit_fail_msg("Incorrect buffer len: %zu\n", buflen);
 
 	fd = open(path, O_WRONLY);
 	if (fd == -1)
 		ksft_exit_fail_msg("%s open failed: %s\n", path, strerror(errno));
 
 	numwritten = write(fd, buf, buflen - 1);
+	saved_errno = errno;
 	close(fd);
+	errno = saved_errno;
 	if (numwritten < 1)
-		ksft_exit_fail_msg("Write failed\n");
+		ksft_exit_fail_msg("%s write(%s) failed: %s\n", path, buf,
+				strerror(errno));
+	if (numwritten != buflen - 1)
+		ksft_exit_fail_msg("%s write(%s) is truncated, expected %zu bytes, got %zd bytes\n",
+				path, buf, buflen - 1, numwritten);
 }
_

