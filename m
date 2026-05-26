Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7813F5BF5;
	Tue, 26 May 2026 13:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802412; cv=none; b=SSm3WoS9whxST7kRU6NtYHkvhVex/Set8Oql8vnuJLW5DzYBmi9MNTtL019wASDk2qooGtg1LJOh8aVVUtTBeLp3QG5phFNyKvMyMf7xddMZVtn8pbHSwGaEAg6NKGOoH2pdOt9IwJ6vraKHiqlQ4n/YhBwaQbTE+VsabiuOrIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802412; c=relaxed/simple;
	bh=073jW0xhpCx4z9nV9ue6UOj6C+GTpbjBLZEW7NjzsCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/3QDkQ3nx4H3OgEG1VMswAsrkpezpE+0WQsW+PwBOF42HMf0nGfTl+z2XrnLbJ3/v3vlQ6q6V4vaGHHawa2PUS7JO/RdeptWqTi9pe0jOXYYxAgAa4G+PjaD3PAdDYp990gv7VcXV8Geb7FVes+tcxY0MffCH2fnkHWnKA+eMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IJdXqJ/O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IJdXqJ/O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C33F21F000E9;
	Tue, 26 May 2026 13:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779802410;
	bh=6jAOS0/EwvvAsAZOUxgHfwKPnBOOkFHmitJou6/DGm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IJdXqJ/OztdUKhdnt0gLGbIvLEpUPwej3tFhKIDpQw61hr3H1/peeCesxk8MmYrsp
	 KqLVT/2wVO8En0vC5kHzx0QCBOXGNWInvzaxUyZwbHe8tkcM4oYB0MD45GTch5R+FE
	 KUdNx2Gl9BQJE53dgCh9tNwv7kx6ABm8CNO8BcxX7dIViod50yPBIkMeZ9V4EOtoCV
	 qoLPNPeK//aKaCNBCZo6zYeR/gTZILe07Ld0kSekYXnbhtto5tS8Y4S89gwd/W7ZSh
	 qn5JBBj9WIrbT0Ut11YBtYuGisVtvBBRnHchDLrIF00eFQ4Ky3EPny0cj9f+kB4qSH
	 bgnZLkwoHpAug==
Date: Tue, 26 May 2026 14:33:24 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Chris Gellermann <christian.gellermann@codasip.com>
Cc: brauner@kernel.org, shuah@kernel.org, akpm@linux-foundation.org, 
	david@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] selftest: Fix UB of getline due to missing var init
Message-ID: <ahWNRKCzGykpYE0h@lucifer>
References: <20260526113848.530105-1-christian.gellermann@codasip.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526113848.530105-1-christian.gellermann@codasip.com>

On Tue, May 26, 2026 at 01:38:48PM +0200, Chris Gellermann wrote:
> Clone3_set_tid uses getline(&line, &len, f) in a loop to read the
> child's process status. The code expects that getline allocates the
> buffer for the line on the first loop iteration. For this, glibc[1]
> requires char *line to be set to NULL:
>
> > ssize_t getline(char **restrict lineptr, ...)
> > If *lineptr is set to NULL before the call, then getline() will
> > allocate a buffer for storing the line.
>
> However, char *line is only declared, leading to an undefined
> initialization value. Fix this by properly initializing it to NULL.
>
> Same issue fixed in mlock-random-test.
>
> [1] https://man7.org/linux/man-pages/man3/getline.3.html
>
> Fixes: 41585bbeeef9 ("selftests: add tests for clone3() with *set_tid")
> Fixes: 26b4224d9961 ("selftests: expanding more mlock selftest")

You'll need separate commits for each I think? That'd at least make life
easier. You can send them as a series.

> Signed-off-by: Chris Gellermann <christian.gellermann@codasip.com>

> ---
>  tools/testing/selftests/clone3/clone3_set_tid.c | 2 +-
>  tools/testing/selftests/mm/mlock-random-test.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/clone3/clone3_set_tid.c b/tools/testing/selftests/clone3/clone3_set_tid.c
> index 5c944aee6b41..485efa7c9eed 100644
> --- a/tools/testing/selftests/clone3/clone3_set_tid.c
> +++ b/tools/testing/selftests/clone3/clone3_set_tid.c
> @@ -141,7 +141,7 @@ int main(int argc, char *argv[])
>  {
>  	FILE *f;
>  	char buf;
> -	char *line;
> +	char *line = NULL;

>  	int status;
>  	int ret = -1;
>  	size_t len = 0;
> diff --git a/tools/testing/selftests/mm/mlock-random-test.c b/tools/testing/selftests/mm/mlock-random-test.c
> index 9d349c151360..16294bc7dae6 100644
> --- a/tools/testing/selftests/mm/mlock-random-test.c
> +++ b/tools/testing/selftests/mm/mlock-random-test.c
> @@ -84,7 +84,7 @@ int get_proc_locked_vm_size(void)
>  int get_proc_page_size(unsigned long addr)
>  {
>  	FILE *smaps;
> -	char *line;
> +	char *line = NULL;

Strange this didn't result in noticeable bugs but maybe perceived as flakes
or such?

>  	unsigned long mmupage_size = 0;
>  	size_t size;
>
> --
> 2.47.3
>

Cheers, Lorenzo
