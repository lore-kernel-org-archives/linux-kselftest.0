Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BCC1F8AC5;
	Tue, 14 Apr 2026 15:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776182375; cv=none; b=X4uB5aHeiVNqquMzQHSMo5HXHSNGkDRofLjcnMiJWvonryL988zPwCuMhPODhREUCnxxTAvzCXNPD5tyJv35YQ2dJelMWmLmYX6FljLqrZg3T4gCdG4mMHL8fL6fCebc4T/yQpBNWPFEYm7Ep5oKSru255XibsM7qOUEB/4J9/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776182375; c=relaxed/simple;
	bh=aITV/bfMgGy7U+vXDq1yQ40U3Qf6rGvHxss7gbOty50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ozctjc44AjwAtVzWhShPjXZ0glV6Dr8xwPwAibrBUbddpIwozD7hb3pQUrHVA3967SxKeuLR+CiWGpIyPzXGIow3k3zo6RaHuGA089u3NoZ0NqzTrnqLcRyGRfvLLt+8bhFnzQ009BYELni7qNsp0bZXGsrhfw7J7TH2UUo0yM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O6hJTblw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O6hJTblw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45174C19425;
	Tue, 14 Apr 2026 15:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776182375;
	bh=aITV/bfMgGy7U+vXDq1yQ40U3Qf6rGvHxss7gbOty50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O6hJTblwwImBWinV4rrS0Rq2sW0tatKUsI/BBl35P2SFrQVGQ1Q3kcLnqd9zpNd4W
	 BFFXsAfzVazpyNReR/Kqin+KcIIPb58+oK5HmBXDETUthYMcPBISlla5PDu7o0AzOl
	 q15GhqbEM4kzho4a0UkxfEmasilmf9N7h5GuxwDQaLzfRX2girh0yP5hFaapnSKWuz
	 RjJydrSpmGIIA64+thIZaim1mSpS+lyhi1QEGgK+KxNJuMcotXD53Pkmdxqmn/mN8N
	 XXZX3tvZvF6T87Ai5kTV08E9H4MIB3zu6AF9Y5VnixXiw7yEnWO5pwTGZJrI79e0xq
	 ZT6H8ksG+WJOg==
Date: Tue, 14 Apr 2026 18:59:24 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Donet Tom <donettom@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lance Yang <lance.yang@linux.dev>,
	Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	Mark Brown <broonie@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Nico Pache <npache@redhat.com>, Peter Xu <peterx@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>, Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 12/53] selftests/mm: khugepaged: group tests in an array
Message-ID: <ad5kXC-F_YyWD590@kernel.org>
References: <20260406141735.2179309-1-rppt@kernel.org>
 <20260406141735.2179309-13-rppt@kernel.org>
 <1524b172-a5f7-4fe0-9bb4-29287762dbff@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1524b172-a5f7-4fe0-9bb4-29287762dbff@linux.ibm.com>

Hi Donet,

On Tue, Apr 14, 2026 at 12:32:48PM +0530, Donet Tom wrote:
> Hi Mike
> 
> On 4/6/26 7:46 PM, Mike Rapoport wrote:
>             get_finfo(argv[1]);
>      }
> 
>     +typedef void (*test_fn)(struct collapse_context *c, struct mem_ops *ops);
>     +
>     +struct test_case {
>     +       struct collapse_context *ctx;
>     +       struct mem_ops *ops;
>     +       const char *desc;
>     +       test_fn fn;
>     +};
>     +
>     +#define MAX_TEST_CASES 45
> 
> I see 48 tests in khugepaged.c, and running khugepaged all:all results in the
> error below. Should MAX_TEST_CASES be updated to 48 instead?

I'm going to bump it to 64 to accommodate potential future tests.
 
> ./khugepaged all:all .
> TAP version 13
> # Save THP and khugepaged settings... OK
> Bail out! MAX_ADD_CASES is too small
> # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
> # Restore THP and khugepaged settings... OK
> # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
> 
>     +static struct test_case test_cases[MAX_TEST_CASES];
>     +static int nr_test_cases;
>     +
>     +#define TEST(t, c, o) do {                                             \
>     +       if (c && o) {                                                   \
>     +               if (nr_test_cases >= MAX_TEST_CASES) {                  \
> 
> 
> I had a small question—since the number of tests is fixed, would this check
> still be necessary?
 
If we add too much tests without updating the maximum we get a nice "Bail
out" rather than SIGSEGV :) 
 
>     +                       printf("MAX_ADD_CASES is too small\n");         \
>     +                       exit(EXIT_FAILURE);                             \
>     +               }                                                       \
>     +               test_cases[nr_test_cases++] = (struct test_case){       \
>     +                       .ctx    = c,                                    \
>     +                       .ops    = o,                                    \
>     +                       .desc   = #t,                                   \
>     +                       .fn     = t,                                    \
>     +               };                                                      \
>     +       }                                                               \
>     +       } while (0)
>     +
>      int main(int argc, char **argv)
>      {
>             int hpage_pmd_order;
>     @@ -1216,13 +1244,6 @@ int main(int argc, char **argv)
> 
>             alloc_at_fault();
> 
>     -#define TEST(t, c, o) do { \
>     -       if (c && o) { \
>     -               printf("\nRun test: " #t " (%s:%s)\n", c->name, o->name); \
>     -               t(c, o); \
>     -       } \
>     -       } while (0)
>     -
>             TEST(collapse_full, khugepaged_context, anon_ops);
>             TEST(collapse_full, khugepaged_context, file_ops);
>             TEST(collapse_full, khugepaged_context, shmem_ops);
>     @@ -1284,5 +1305,13 @@ int main(int argc, char **argv)
>             TEST(madvise_retracted_page_tables, madvise_context, file_ops);
>             TEST(madvise_retracted_page_tables, madvise_context, shmem_ops);
> 
>     +       for (int i = 0; i < nr_test_cases; i++) {
>     +               struct test_case *t = &test_cases[i];
>     +
>     +               exit_status = KSFT_PASS;
>     +               printf("\nRun test: %s: (%s:%s)\n", t->desc, t->ctx->name, t->ops->name);
>     +               t->fn(t->ctx, t->ops);
>     +       }
>     +
>             restore_settings(0);
>      }
> 
> 
> -Donet
> 

-- 
Sincerely yours,
Mike.
