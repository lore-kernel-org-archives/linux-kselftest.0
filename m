Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A173F0A9E;
	Wed,  1 Jul 2026 08:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782895724; cv=none; b=roJaUSaploYLB73AULOoMVGaQpX0Z0ndhqM62lNwUiBKqh3RWWoMAggPlPf0k2ArV+eH+NMk8Qby6igFAF4DAsV6iyvUaH3kjTLelNq5rTWqIj0oL58uAlP6CkNwSJqYbQIcYC7RR9OmR46Z/OjyVt3tuwi0SluiyZLlnKhU2W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782895724; c=relaxed/simple;
	bh=kcjNMO66XSIEF/iAXE3FuGZ0OWXnyv0A9h2AM7C8BEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G75mSZmRwV6VhCOgSh5QzWrQYITAjhYGZy0ZMO+bDGpIlgC+rvYH+3UB4r7r8EV5gNeog40YuYCwzfHTnhkpTt+I3Z8CIAaJUeFkCaPAoCDBW4YWJ4jh4CXYS/BUbXwlaFw0QaM6dOD/vxwTmvs8FNtIRJ3jjr5Gm2/hc4v9FlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=UUZG11Jn; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="UUZG11Jn"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D85CC339;
	Wed,  1 Jul 2026 01:48:37 -0700 (PDT)
Received: from [10.57.81.2] (unknown [10.57.81.2])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4BFB33F85F;
	Wed,  1 Jul 2026 01:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782895722; bh=kcjNMO66XSIEF/iAXE3FuGZ0OWXnyv0A9h2AM7C8BEE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UUZG11JnwTN0Wq/TaeDeCOdanWmjFRo1FHUmiOvPnGzCk+0nqr8Z/amy7fAhaqqL+
	 d4At8zrzsJJVLefeSUS7SYskAqV4OfGmkrGQCuRfORjNwyXCAo9dLLmV4WObQlqK72
	 BRlH5jKPHPzyaY+bEpYq4Z0bl21om5m/VGnn3p5Y=
Message-ID: <8ad9d4ed-939b-4e93-bfb8-fcf1a19c00db@arm.com>
Date: Wed, 1 Jul 2026 10:48:31 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/5] selftests/mm: use pkey_assert on clone_raw failure
 in pkey test
To: Hongfu Li <lihongfu@kylinos.cn>, akpm@linux-foundation.org,
 david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, keith.lucas@oracle.com, maddy@linux.ibm.com,
 usama.anjum@collabora.com, yury.khrustalev@arm.com, jhubbard@nvidia.com,
 joey.gouly@arm.com, zwisler@google.com, hongfu.li@linux.dev
References: <20260630073235.3802271-1-lihongfu@kylinos.cn>
 <20260630073235.3802271-4-lihongfu@kylinos.cn>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260630073235.3802271-4-lihongfu@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/06/2026 09:32, Hongfu Li wrote:
> Use pkey_assert(0) instead of perror("clone") when clone_raw() fails.
> The old path only printed an error and continued; the test now exits
> via pkey_assert() on failure so it does not hang or proceed with an
> invalid child.
>
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

> ---
>  tools/testing/selftests/mm/pkey_sighandler_tests.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/pkey_sighandler_tests.c b/tools/testing/selftests/mm/pkey_sighandler_tests.c
> index 085e771227fb..882928f2912b 100644
> --- a/tools/testing/selftests/mm/pkey_sighandler_tests.c
> +++ b/tools/testing/selftests/mm/pkey_sighandler_tests.c
> @@ -333,7 +333,7 @@ static void test_sigsegv_handler_with_different_pkey_for_stack(void)
>  
>  	if (ret < 0) {
>  		errno = -ret;
> -		perror("clone");
> +		pkey_assert(0);
>  	} else if (ret == 0) {
>  		thread_segv_maperr_ptr(&sigstack);
>  		syscall_raw(SYS_exit, 0, 0, 0, 0, 0, 0);
> @@ -506,7 +506,7 @@ static void test_pkru_sigreturn(void)
>  
>  	if (ret < 0) {
>  		errno = -ret;
> -		perror("clone");
> +		pkey_assert(0);
>  	}  else if (ret == 0) {
>  		thread_sigusr2_self(&sigstack);
>  		syscall_raw(SYS_exit, 0, 0, 0, 0, 0, 0);
