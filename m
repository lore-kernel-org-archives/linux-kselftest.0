Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8153B4EAA;
	Mon, 20 Jul 2026 07:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784531567; cv=none; b=NNbCpcUYTm9ln2YLh+z3glN+8Lx4VZKESaaqskCEDXgv+3c7WFm063ZFLEFAWQovOFNTxHGnZPNdA2XiZsdFjaa+xmxwDsgTjKf0xVWYWl/LjPnQ/Oxe+dZr5rxh2et/k2gTAD5gzMMAFO+0Q+NN/5abCWDvYpEbpEFia7Qi2nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784531567; c=relaxed/simple;
	bh=GVOEDyv4G0On/L05E1DBWG1r1v38GQd5p1hQSI27COM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MWBuJtZ1F2qX9JURVbQ3/sxYzhQHDqLmBpt+yBF7m5x1K2B2Qrwjr85rkYF/ifMpfLSHvY7gSomZ+m8Eq+txZwk7Av17lORbrvoJDADEtf6zecC6SW6KxnTt82n9aBHt9Pk1GvRybhT8YkXYRvXDe50Evz1sKrF3c+dCC6WMns8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=isB5eEcy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="isB5eEcy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EE4F1F00A3A;
	Mon, 20 Jul 2026 07:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784531566;
	bh=FgAiu17rXWC3zHOGUqFToJe5G7OQWTbuDGRbb0NCHB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=isB5eEcyRAYafbLmZJqOBbZRdk9yMddHVnTz/zNIUABbWR4hgJgK04EjpyzWX8Ylx
	 ttzf6kdprgX/I4/GNoGyLOai/QCAbPkVkZvjxCnj0O/bGdyTIyCgw0AQtf1Mm/MZkU
	 4ZmXMSVKLByIkYYU2egqGxa9s7Y0Fd7z8rZxuhm0N2G9KLLmmdTOnL4VB3WhSy81/L
	 R66KLWge6oH8wU15eeHqsbHRW35EEUCzs54GVBF05UGd0kUl4PUeVio/KXD8brPLCt
	 XenAqTgGoRXDU61a7smiQgj+JPcrK039JLLnewqS21b0O5CJfqgOznQFbRqesjc4ky
	 2owiWNma5Lk+Q==
Date: Mon, 20 Jul 2026 08:12:28 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: longlong yan <yanlonglong@kylinos.cn>
Cc: akpm@linux-foundation.org, david@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: use MAP_FAILED for mmap error check
Message-ID: <al3KJJlhJgsg1ZFe@lucifer>
References: <20260720063439.522-1-yanlonglong@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720063439.522-1-yanlonglong@kylinos.cn>

On Mon, Jul 20, 2026 at 02:34:39PM +0800, longlong yan wrote:
> Replace the direct comparison with (void *)-1 with the standard
> MAP_FAILED macro when checking mmap()
>
> Signed-off-by: longlong yan <yanlonglong@kylinos.cn>

Great thanks!

If you're looking at this in general, it'd be lovely to convert it to use the
kselftest_harness.h and get rid of these horrible FAIL_TEST_IF_FALSE()
etc. predicates :)

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  tools/testing/selftests/mm/mseal_test.c | 106 ++++++++++++------------
>  1 file changed, 53 insertions(+), 53 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/mseal_test.c b/tools/testing/selftests/mm/mseal_test.c
> index faad4833366a..93c2e13094d4 100644
> --- a/tools/testing/selftests/mm/mseal_test.c
> +++ b/tools/testing/selftests/mm/mseal_test.c
> @@ -234,7 +234,7 @@ static void test_seal_addseal(void)
>  	unsigned long size = 4 * page_size;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	ret = sys_mseal(ptr, size);
>  	FAIL_TEST_IF_FALSE(!ret);
> @@ -250,7 +250,7 @@ static void test_seal_unmapped_start(void)
>  	unsigned long size = 4 * page_size;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	/* munmap 2 pages from ptr. */
>  	ret = sys_munmap(ptr, 2 * page_size);
> @@ -278,7 +278,7 @@ static void test_seal_unmapped_middle(void)
>  	unsigned long size = 4 * page_size;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	/* munmap 2 pages from ptr + page. */
>  	ret = sys_munmap(ptr + page_size, 2 * page_size);
> @@ -310,7 +310,7 @@ static void test_seal_unmapped_end(void)
>  	unsigned long size = 4 * page_size;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	/* unmap last 2 pages. */
>  	ret = sys_munmap(ptr + 2 * page_size, 2 * page_size);
> @@ -339,7 +339,7 @@ static void test_seal_multiple_vmas(void)
>  	unsigned long size = 4 * page_size;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	/* use mprotect to split the vma into 3. */
>  	ret = sys_mprotect(ptr + page_size, 2 * page_size,
> @@ -370,7 +370,7 @@ static void test_seal_split_start(void)
>  	unsigned long size = 4 * page_size;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	/* use mprotect to split at middle */
>  	ret = sys_mprotect(ptr, 2 * page_size, PROT_READ | PROT_WRITE);
> @@ -395,7 +395,7 @@ static void test_seal_split_end(void)
>  	unsigned long size = 4 * page_size;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	/* use mprotect to split at middle */
>  	ret = sys_mprotect(ptr, 2 * page_size, PROT_READ | PROT_WRITE);
> @@ -420,7 +420,7 @@ static void test_seal_invalid_input(void)
>  	int ret;
>
>  	setup_single_address(8 * page_size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>  	ret = clean_single_address(ptr + 4 * page_size, 4 * page_size);
>  	FAIL_TEST_IF_FALSE(!ret);
>
> @@ -455,7 +455,7 @@ static void test_seal_zero_length(void)
>  	int ret;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	ret = sys_mprotect(ptr, 0, PROT_READ | PROT_WRITE);
>  	FAIL_TEST_IF_FALSE(!ret);
> @@ -505,7 +505,7 @@ static void test_seal_twice(void)
>  	unsigned long size = 4 * page_size;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	ret = sys_mseal(ptr, size);
>  	FAIL_TEST_IF_FALSE(!ret);
> @@ -525,7 +525,7 @@ static void test_seal_mprotect(bool seal)
>  	int ret;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	if (seal) {
>  		ret = seal_single_address(ptr, size);
> @@ -549,7 +549,7 @@ static void test_seal_start_mprotect(bool seal)
>  	int ret;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	if (seal) {
>  		ret = seal_single_address(ptr, page_size);
> @@ -579,7 +579,7 @@ static void test_seal_end_mprotect(bool seal)
>  	int ret;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	if (seal) {
>  		ret = seal_single_address(ptr + page_size, 3 * page_size);
> @@ -609,7 +609,7 @@ static void test_seal_mprotect_unalign_len(bool seal)
>  	int ret;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	if (seal) {
>  		ret = seal_single_address(ptr, page_size * 2 - 1);
> @@ -638,7 +638,7 @@ static void test_seal_mprotect_unalign_len_variant_2(bool seal)
>  	int ret;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>  	if (seal) {
>  		ret =  seal_single_address(ptr, page_size * 2 + 1);
>  		FAIL_TEST_IF_FALSE(!ret);
> @@ -666,7 +666,7 @@ static void test_seal_mprotect_two_vma(bool seal)
>  	int ret;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	/* use mprotect to split */
>  	ret = sys_mprotect(ptr, page_size * 2, PROT_READ | PROT_WRITE);
> @@ -701,7 +701,7 @@ static void test_seal_mprotect_two_vma_with_split(bool seal)
>  	int ret;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	/* use mprotect to split as two vma. */
>  	ret = sys_mprotect(ptr, page_size * 2, PROT_READ | PROT_WRITE);
> @@ -748,7 +748,7 @@ static void test_seal_mprotect_partial_mprotect(bool seal)
>  	int ret;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	/* seal one page. */
>  	if (seal) {
> @@ -780,7 +780,7 @@ static void test_seal_mprotect_partial_mprotect_tail(bool seal)
>  	 */
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	if (seal) {
>  		ret = sys_mseal(ptr + page_size, page_size);
> @@ -810,7 +810,7 @@ static void test_seal_mprotect_two_vma_with_gap(void)
>  	int ret;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	/* use mprotect to split. */
>  	ret = sys_mprotect(ptr, page_size, PROT_READ | PROT_WRITE);
> @@ -853,7 +853,7 @@ static void test_seal_mprotect_split(bool seal)
>  	int ret;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	/* use mprotect to split. */
>  	ret = sys_mprotect(ptr, page_size, PROT_READ | PROT_WRITE);
> @@ -890,7 +890,7 @@ static void test_seal_mprotect_merge(bool seal)
>  	int ret;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	/* use mprotect to split one page. */
>  	ret = sys_mprotect(ptr, page_size, PROT_READ | PROT_WRITE);
> @@ -924,7 +924,7 @@ static void test_seal_munmap(bool seal)
>  	int ret;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	if (seal) {
>  		ret = sys_mseal(ptr, size);
> @@ -955,7 +955,7 @@ static void test_seal_munmap_two_vma(bool seal)
>  	int ret;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	/* use mprotect to split */
>  	ret = sys_mprotect(ptr, page_size * 2, PROT_READ | PROT_WRITE);
> @@ -996,7 +996,7 @@ static void test_seal_munmap_vma_with_gap(bool seal)
>  	int ret;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	ret = sys_munmap(ptr + page_size, page_size * 2);
>  	FAIL_TEST_IF_FALSE(!ret);
> @@ -1028,7 +1028,7 @@ static void test_seal_munmap_partial_across_vmas(bool seal)
>  	int prot;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	if (seal) {
>  		ret = sys_mseal(ptr + page_size, page_size);
> @@ -1058,7 +1058,7 @@ static void test_munmap_start_freed(bool seal)
>  	int prot;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	/* unmap the first page. */
>  	ret = sys_munmap(ptr, page_size);
> @@ -1097,7 +1097,7 @@ static void test_munmap_end_freed(bool seal)
>  	int ret;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	/* unmap last page. */
>  	ret = sys_munmap(ptr + page_size * 3, page_size);
> @@ -1128,7 +1128,7 @@ static void test_munmap_middle_freed(bool seal)
>  	int prot;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	/* unmap 2 pages in the middle. */
>  	ret = sys_munmap(ptr + page_size, page_size * 2);
> @@ -1172,7 +1172,7 @@ static void test_seal_mremap_shrink(bool seal)
>  	void *ret2;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	if (seal) {
>  		ret = sys_mseal(ptr, size);
> @@ -1201,7 +1201,7 @@ static void test_seal_mremap_expand(bool seal)
>  	void *ret2;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>  	/* ummap last 2 pages. */
>  	ret = sys_munmap(ptr + 2 * page_size, 2 * page_size);
>  	FAIL_TEST_IF_FALSE(!ret);
> @@ -1233,9 +1233,9 @@ static void test_seal_mremap_move(bool seal)
>  	void *ret2;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>  	setup_single_address(size, &newPtr);
> -	FAIL_TEST_IF_FALSE(newPtr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(newPtr != MAP_FAILED);
>  	ret = clean_single_address(newPtr, size);
>  	FAIL_TEST_IF_FALSE(!ret);
>
> @@ -1266,7 +1266,7 @@ static void test_seal_mmap_overwrite_prot(bool seal)
>  	void *ret2;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	if (seal) {
>  		ret = sys_mseal(ptr, size);
> @@ -1294,7 +1294,7 @@ static void test_seal_mmap_expand(bool seal)
>  	void *ret2;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>  	/* ummap last 4 pages. */
>  	ret = sys_munmap(ptr + 8 * page_size, 4 * page_size);
>  	FAIL_TEST_IF_FALSE(!ret);
> @@ -1325,7 +1325,7 @@ static void test_seal_mmap_shrink(bool seal)
>  	void *ret2;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	if (seal) {
>  		ret = sys_mseal(ptr, size);
> @@ -1354,9 +1354,9 @@ static void test_seal_mremap_shrink_fixed(bool seal)
>  	void *ret2;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>  	setup_single_address(size, &newAddr);
> -	FAIL_TEST_IF_FALSE(newAddr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(newAddr != MAP_FAILED);
>
>  	if (seal) {
>  		ret = sys_mseal(ptr, size);
> @@ -1385,9 +1385,9 @@ static void test_seal_mremap_expand_fixed(bool seal)
>  	void *ret2;
>
>  	setup_single_address(page_size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>  	setup_single_address(size, &newAddr);
> -	FAIL_TEST_IF_FALSE(newAddr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(newAddr != MAP_FAILED);
>
>  	if (seal) {
>  		ret = sys_mseal(newAddr, size);
> @@ -1416,9 +1416,9 @@ static void test_seal_mremap_move_fixed(bool seal)
>  	void *ret2;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>  	setup_single_address(size, &newAddr);
> -	FAIL_TEST_IF_FALSE(newAddr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(newAddr != MAP_FAILED);
>
>  	if (seal) {
>  		ret = sys_mseal(newAddr, size);
> @@ -1445,7 +1445,7 @@ static void test_seal_mremap_move_fixed_zero(bool seal)
>  	void *ret2;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	if (seal) {
>  		ret = sys_mseal(ptr, size);
> @@ -1476,7 +1476,7 @@ static void test_seal_mremap_move_dontunmap(bool seal)
>  	void *ret2;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	if (seal) {
>  		ret = sys_mseal(ptr, size);
> @@ -1505,7 +1505,7 @@ static void test_seal_mremap_move_dontunmap_anyaddr(bool seal)
>  	void *ret2;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	if (seal) {
>  		ret = sys_mseal(ptr, size);
> @@ -1517,7 +1517,7 @@ static void test_seal_mremap_move_dontunmap_anyaddr(bool seal)
>  	 * use allocate/free to similate that.
>  	 */
>  	setup_single_address(size, &ptr2);
> -	FAIL_TEST_IF_FALSE(ptr2 != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr2 != MAP_FAILED);
>  	ret = sys_munmap(ptr2, size);
>  	FAIL_TEST_IF_FALSE(!ret);
>
> @@ -1547,7 +1547,7 @@ static void test_seal_merge_and_split(void)
>
>  	/* (24 RO) */
>  	setup_single_address(24 * page_size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	/* use mprotect(NONE) to set out boundary */
>  	/* (1 NONE) (22 RO) (1 NONE) */
> @@ -1637,7 +1637,7 @@ static void test_seal_discard_ro_anon_on_rw(bool seal)
>  	int ret;
>
>  	setup_single_address_rw(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	if (seal) {
>  		ret = sys_mseal(ptr, size);
> @@ -1669,7 +1669,7 @@ static void test_seal_discard_ro_anon_on_pkey(bool seal)
>  	SKIP_TEST_IF_FALSE(pkey_supported());
>
>  	setup_single_address_rw(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	pkey = sys_pkey_alloc(0, PKEY_UNRESTRICTED);
>  	FAIL_TEST_IF_FALSE(pkey > 0);
> @@ -1751,7 +1751,7 @@ static void test_seal_discard_ro_anon_on_shared(bool seal)
>  	unsigned long mapflags = MAP_ANONYMOUS | MAP_SHARED;
>
>  	ptr = mmap(NULL, size, PROT_READ, mapflags, -1, 0);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	if (seal) {
>  		ret = sys_mseal(ptr, size);
> @@ -1779,7 +1779,7 @@ static void test_seal_discard_ro_anon(bool seal)
>  	int ret;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	if (seal) {
>  		ret = seal_single_address(ptr, size);
> @@ -1809,7 +1809,7 @@ static void test_seal_discard_across_vmas(bool seal)
>  	int ret;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	if (seal) {
>  		ret = seal_single_address(ptr + page_size, page_size);
> @@ -1840,7 +1840,7 @@ static void test_seal_madvise_nodiscard(bool seal)
>  	int ret;
>
>  	setup_single_address(size, &ptr);
> -	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
> +	FAIL_TEST_IF_FALSE(ptr != MAP_FAILED);
>
>  	if (seal) {
>  		ret = seal_single_address(ptr, size);
> --
> 2.43.0
>

Cheers, Lorenzo
