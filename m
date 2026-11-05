Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872990;
	b=SwbTPwv1lO7ww0Pa3lFansi3ThIBjwgwpQGtdY6SDfmCIOEDVmTh5X3et4Fv1ARL3mIN
	 YMnt80XBbE4vWttprLsfJLYmG1IDMsbt+/BZpR5LwxzRm1Zr6Gkdnnjt35pUi4HVciYKx
	 LcF85m0zuxsV1MhHsfWkfYqJ7E4vcn3FhRUa7pX2M6YiotewmKEz5PlzJ0tJgPDvMzW3r
	 AemVv6R87LUeb2+Wqz4Mn+PmOOW0TdbZjedpO8YCgpJG1p4YXaGIe/vHN8JmiWa9wCg24
	 5v8IUGktPb5jFu/RXjmkFk/oxC4fozCkFU7s3bn05DIZ4plaIPDNEWV4LtGWfkMI5xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872990;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=YGxMLGOpmO21KJ2mjD9khBg9SC63tjkRy41YsLQwOKA=;
	b=mzI8+UFvPD7ATnEnk/SbrJOkjzc7HXb7DfD/WGEaz4tfNiMtttRzw/3kK2vGrL+9SEdY
	 O4YQrVCgdm0fzuE9dEtIPjSRyOCJM47COFT+k3DcYz0PjyMIddEe4k/p8Yy43QIwBolBj
	 BkCbUoGezJmmeYZ9oomQZ+s7qi7UcnsIXurdvfLnvX8ENsK58M/Q2bxBMM4cryP3V3Fh6
	 vyvA8Uz7gDTbAXUkPPW0xqK4bNj42rIW6aW33BOnYxJ4i/jgQ2RvJALkVWgVWzch/Wjsz
	 JdVDYD7ykhgrpclP6kreLLmyujyoYEcrYk0w6sIxeN4rxiELS6Z9ORlTwQlSbuFW3nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X23c9kWV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5138F606A31B;
	Thu,  5 Nov 2026 10:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X23c9kWV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E8C11F000C1;
	Thu,  5 Nov 2026 10:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793872989;
	bh=YGxMLGOpmO21KJ2mjD9khBg9SC63tjkRy41YsLQwOKA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=X23c9kWVkPgMqf9QyBhUBCMJnR9wXAEOhBgM4zA+aaLN25UZaS72McMQVN0/qvLUj
	 gyk5MOm29CmrgYJH9yay9R0doiqzvqabiwazIkyDlhKcCIJ8plw01qp3O1I61UTMb2
	 4sDnNnTwzudp4tadLZyxoi3npf+TTtP02nBBVgnX6ZEX+80DAIf/GFQwwsOf2R8b+Z
	 hlvrM8pjyLZtfwgzHKBPb+KT/mu5ORHSRwxL/NWD+/twyME/sINzijVNN8QeVMy0SY
	 SkJJrq4ukXNq1AAh4nbKw54nZ/nmzNeR2PTlSjc9shb0e57kDG9CxL0ftVLrYYgdTM
	 MLp33ObuR7rRg==
Message-ID: <e6be27d9-6cf1-476e-9d8c-8e91664b95e2@kernel.org>
Date: Thu, 5 Nov 2026 11:03:03 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] selftests/mm: cover merging KSM pages aged by
 smart scan
To: Qiliang Yuan <odys.yuan@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Xu Xin <xu.xin@linux.dev>,
 Chengming Zhou <chengming.zhou@linux.dev>, Stefan Roesch <shr@devkernel.io>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20261105-bug-mm-ksm-smart-scan-align-skips-v2-0-8a9780b6844e@gmail.com>
 <20261105-bug-mm-ksm-smart-scan-align-skips-v2-2-8a9780b6844e@gmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261105-bug-mm-ksm-smart-scan-align-skips-v2-2-8a9780b6844e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/5/26 10:36, Qiliang Yuan wrote:
> ksm_functional_tests checks merging and unmerging with ksmd's default
> settings, but nothing there exercises smart scan, which skips pages KSM
> has failed to merge for a while.
> 
> Smart scan used to time those skips per page, so two identical pages
> that became mergeable some scans apart could end up never being looked
> at in the same scan, and were never merged. "mm/ksm: align smart scan
> skips with the scan number" fixed that.
> 
> Add a case that lets sixteen unique pages age for a dozen scans, then
> makes a duplicate of each mergeable one scan apart, and expects every
> pair to be merged 32 scans later:
> 
>   kernel               failures, two boots
>   before the fix       20/20, 20/20
>   with the fix          0/20,  0/20
> 
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
> ---
>  tools/testing/selftests/mm/ksm_functional_tests.c | 108 +++++++++++++++++++++-
>  1 file changed, 107 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/mm/ksm_functional_tests.c b/tools/testing/selftests/mm/ksm_functional_tests.c
> index 31c06c72203fd..71d9b3cbdb8c1 100644
> --- a/tools/testing/selftests/mm/ksm_functional_tests.c
> +++ b/tools/testing/selftests/mm/ksm_functional_tests.c
> @@ -695,6 +695,111 @@ static void test_fork_ksm_merging_page_count(void)
>  	munmap(map, size);
>  }
>  
> +static int ksm_wait_full_scans(long nr)
> +{
> +	long start, cur;
> +
> +	start = ksm_get_full_scans();
> +	if (start < 0)
> +		return start;
> +	do {
> +		cur = ksm_get_full_scans();
> +		if (cur < 0)
> +			return cur;
> +	} while (cur < start + nr);
> +
> +	return 0;
> +}
> +

This looks a lot like the logic we have in ksm_start().

Likely that logic there should be factored out into a common helper.

> +static void test_merge_aged_pairs(void)
> +{
> +	const unsigned int pairs = 16;
> +	const unsigned long size = 2 * pairs * pagesize;
> +	char *map, old_smart_scan = '1';
> +	int smart_scan_fd;
> +	unsigned int i;
> +
> +	ksft_print_msg("[RUN] %s\n", __func__);
> +
> +	smart_scan_fd = open("/sys/kernel/mm/ksm/smart_scan", O_RDWR);
> +	if (smart_scan_fd < 0) {
> +		ksft_test_result_skip("smart_scan not supported\n");
> +		return;
> +	}
> +	if (pread(smart_scan_fd, &old_smart_scan, 1, 0) != 1 ||
> +	    pwrite(smart_scan_fd, "1", 1, 0) != 1) {
> +		ksft_test_result_fail("Enabling smart_scan failed\n");
> +		goto close_fd;
> +	}

Can we have a helper to enable/disable smart scan? Likely belongs into utils as
well.


-- 
Cheers,

David
