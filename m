Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D30723EAB3;
	Thu,  3 Sep 2026 01:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788398122; cv=none; b=ocJ7xQx6+RYFqmC4bn7rQDC9EImzVkIdwuhajK7IVZ4dUmMmXtsYEG2Jea0exggxcsEo8ZjrKs/0/HG2zohNgjU1jicgPll4c3HCSVUXIdILShStbb2OCeDAsrFfIbfl5Bn9C12qP3DEUhgEUI+04RWsHhhLuwWOLC2cOsHJQ1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788398122; c=relaxed/simple;
	bh=dMqdxoBwqFFSrFTHC1f2CVhYpTOdSGNtd5zULIgqBMA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=CplopJNOpq98Amk10HQ3gA/907jGmQCkdzSDO44VkAaxF75TR1qbFfIJ6ebm/Y/kA1Y3KPLxjXrgJN13wZAGbx6YfLzgPHBkxNOIlKRmYBZEW1zUsSOAu1FS9XURaZWRbSRW3yzCeUNGAybHBKBkm7MIzFVJjMycfqYZ+5Le5MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=m+G/9VyX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="m+G/9VyX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4828A1F000E9;
	Thu,  3 Sep 2026 01:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788398120;
	bh=+qmJrY2px6cXpY4nVf4dvIM+H2DeJX3DN7hEcIN4IMI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=m+G/9VyXk/yPu3h8kxwnqEU9thKy0sQ2f4MxnueS/diJc0ep33y7uU4rjvAk5jJKl
	 EIFkSm1Br9bbLTdt+yo5iHL5bwK9q3UIVtTZz4k1v+DOzxMPeIlazqrK3HkQZZsdrJ
	 me2qUIJUZiEjpSq3F8Sy7fyJyY30o7dLjWOnKuJk=
Date: Wed, 2 Sep 2026 18:15:19 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Malaya Kumar Rout <malayarout91@gmail.com>
Cc: linux-kselftest@vger.kernel.org, mrout@redhat.com,
 skhan@linuxfoundation.org, me@brighamcampbell.com, Shuah Khan
 <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>, Andrei Vagin
 <avagin@gmail.com>, Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>,
 Bhavik Sachdev <b.sachdev1904@gmail.com>, linux-kernel@vger.kernel.org,
 Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: [PATCH] selftests/statmount: Fix file descriptor leak in
 setup_namespace
Message-Id: <20260902181519.f99e0943d99dc06a1afd740d@linux-foundation.org>
In-Reply-To: <20260704120437.99851-1-malayarout91@gmail.com>
References: <20260704120437.99851-1-malayarout91@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat,  4 Jul 2026 17:34:36 +0530 Malaya Kumar Rout <malayarout91@gmail.com> wrote:

> In setup_namespace(), f_mountinfo is opened with fopen() at line 115
> but is never closed. Multiple ksft_exit_fail_msg() calls exit the
> program without closing this file descriptor, and the cleanup_namespace()
> function registered with atexit() also doesn't close it.
> 
> Add fclose(f_mountinfo) in cleanup_namespace() to ensure the file
> descriptor is properly closed on both normal and error exit paths,
> since cleanup_namespace() is already registered as an atexit handler.
> 

Thanks.

get_maintainer totally sucks with selftests/, alas.  When determining
who should be cc'ed it's best to poke around in git-blame.

I did that.  Hi, Miklos!


> --- a/tools/testing/selftests/filesystems/statmount/statmount_test.c
> +++ b/tools/testing/selftests/filesystems/statmount/statmount_test.c
> @@ -82,6 +82,9 @@ static void cleanup_namespace(void)
>  {
>  	int ret;
>  
> +	if (f_mountinfo)
> +		fclose(f_mountinfo);
> +
>  	ret = fchdir(orig_root);
>  	if (ret == -1)
>  		ksft_perror("fchdir to original root");

AI review suggests that the patch is good, but the leak is not fully
resolved:

	https://sashiko.dev/#/patchset/20260704120437.99851-1-malayarout91@gmail.com



All that being said, we don't care much about leaks in selftests/. 
Because exit() handles them pretty darn well.  So fixing this is mainly
a matter of pride and of setting a good example.


