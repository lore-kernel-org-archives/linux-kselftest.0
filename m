Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0903CCA1A;
	Thu, 12 Mar 2026 22:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773353128; cv=none; b=f0N1j/WkaQut1dzCuNsGUkDlbDfMCwzaLBBJfpMRrYY3vaKmV4Z9TWh69GqQTMyMKrDIlKc9DCVu4G+RgRHl2srk6Rw7bsCAU+fu19xXLukKyh7WVQY4Okwtqw/ij5EgdvEDn4deCBdg0phxlcN6xExgcfdOaAaEXnGEVvqpgrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773353128; c=relaxed/simple;
	bh=kJpOMXmeVrgv0HG/rFG8bTekmGeeG6gm/5I211m0F2s=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=L++lXP7RrXEhsB6q4Wf8iltPFqOCBWfDWicgznXn1iNX3iN5Z/ZzGT9tfeE09qYUlZS3qFkJE+hpXN+0jPfUhc5DIGeCfRLb0K8yUVeCcngpMeSLgzTm40AchSiGcDL8jhUnDjJ7gX+49ZDhRZ787e3z/fCFWY/6WeyOy/4FBIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ZsTJnAFO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZsTJnAFO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87E28C4CEF7;
	Thu, 12 Mar 2026 22:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1773353128;
	bh=kJpOMXmeVrgv0HG/rFG8bTekmGeeG6gm/5I211m0F2s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZsTJnAFOvr36+k42PB7o8XC4L8ru8l4Pwk5EqtRL49hE3Afi6x8ed3VLafByWN8ek
	 b1Uh8rOn14iieth4yKSCmtemSITG3j5PoDpI762Vf2n+jiVAHL7MrnoQArrm5MWVyX
	 ao/3KIJbyb4xf/LbczAsiBmxmjquDbsgMM7uMdDs=
Date: Thu, 12 Mar 2026 15:05:26 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Sayali Patil <sayalip@linux.ibm.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Ritesh
 Harjani <ritesh.list@gmail.com>, David Hildenbrand <david@kernel.org>, Zi
 Yan <ziy@nvidia.com>, Michal Hocko <mhocko@kernel.org>, Oscar Salvador
 <osalvador@suse.de>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dev Jain
 <dev.jain@arm.com>, Liam.Howlett@oracle.com, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 00/13] selftests/mm: fix failures and robustness
 improvements
Message-Id: <20260312150526.3662b2717b9a91776a2e43f5@linux-foundation.org>
In-Reply-To: <cover.1773305677.git.sayalip@linux.ibm.com>
References: <cover.1773305677.git.sayalip@linux.ibm.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 12 Mar 2026 17:55:27 +0530 Sayali Patil <sayalip@linux.ibm.com> wrote:

> Hi all,
> 
> Powerpc systems with a 64K base page size exposed several issues while
> running mm selftests. Some tests assume specific hugetlb configurations,
> use incorrect interfaces, or fail instead of skipping when the required
> kernel features are not available.
> 
> This series fixes these issues and improves test robustness.

Thanks, I updated mm.git's mm-new branch to this version.

> ---
> v1->v2
>   - For "selftests/mm: ensure destination is hugetlb-backed in hugepage-mremap":
>     update FLAGS definition to MAP_HUGETLB | MAP_SHARED | MAP_POPULATE and
>     used it for mmap() calls as suggested during review.

That was a really small change (below).  It's better to wait a while
(half to one week) before resending an entire series.  So as to
hopefully accumulate more changes.



--- a/tools/testing/selftests/mm/hugepage-mremap.c~b
+++ a/tools/testing/selftests/mm/hugepage-mremap.c
@@ -31,7 +31,7 @@
 #define MB_TO_BYTES(x) (x * 1024 * 1024)
 
 #define PROTECTION (PROT_READ | PROT_WRITE | PROT_EXEC)
-#define FLAGS (MAP_SHARED | MAP_ANONYMOUS)
+#define FLAGS (MAP_HUGETLB | MAP_SHARED | MAP_POPULATE)
 
 static void check_bytes(char *addr)
 {
@@ -121,23 +121,20 @@ int main(int argc, char *argv[])
 
 	/* mmap to a PUD aligned address to hopefully trigger pmd sharing. */
 	unsigned long suggested_addr = 0x7eaa40000000;
-	void *haddr = mmap((void *)suggested_addr, length, PROTECTION,
-			   MAP_HUGETLB | MAP_SHARED | MAP_POPULATE, fd, 0);
+	void *haddr = mmap((void *)suggested_addr, length, PROTECTION, FLAGS, fd, 0);
 	ksft_print_msg("Map haddr: Returned address is %p\n", haddr);
 	if (haddr == MAP_FAILED)
 		ksft_exit_fail_msg("mmap1: %s\n", strerror(errno));
 
 	/* mmap again to a dummy address to hopefully trigger pmd sharing. */
 	suggested_addr = 0x7daa40000000;
-	void *daddr = mmap((void *)suggested_addr, length, PROTECTION,
-			   MAP_HUGETLB | MAP_SHARED | MAP_POPULATE, fd, 0);
+	void *daddr = mmap((void *)suggested_addr, length, PROTECTION, FLAGS, fd, 0);
 	ksft_print_msg("Map daddr: Returned address is %p\n", daddr);
 	if (daddr == MAP_FAILED)
 		ksft_exit_fail_msg("mmap3: %s\n", strerror(errno));
 
 	suggested_addr = 0x7faa40000000;
-	void *vaddr = mmap((void *)suggested_addr, length, PROTECTION,
-			MAP_HUGETLB | MAP_SHARED | MAP_POPULATE, fd, 0);
+	void *vaddr = mmap((void *)suggested_addr, length, PROTECTION, FLAGS, fd, 0);
 	ksft_print_msg("Map vaddr: Returned address is %p\n", vaddr);
 	if (vaddr == MAP_FAILED)
 		ksft_exit_fail_msg("mmap2: %s\n", strerror(errno));
_

