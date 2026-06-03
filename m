Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1C72153EA;
	Wed,  3 Jun 2026 10:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780480879; cv=none; b=dfpXWOTsuZpcZbFqP+g/OvcgRmRUrihJF4Bgea3E2R117FPhnnfchP/RxjvG5qodQNXNydulu3tPd+RmND8rMUsBAzPD666kcDy6JSUYgm53qIojdfm0nKmHgwN7fj6WYCgnH4a+VdQwGng9aiMO38n5zrYVGsF5I06+lgcvZ3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780480879; c=relaxed/simple;
	bh=QxFBotsgB8UUnDrQLfItNgUhmUtkFQv1RM9zjbNOnUs=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=YSiWNwEQHtyTuViEr+h5/Gywe6Ie06RZjm1UQypfGnQB1D/MDf/+mzXDNNEE6zfuft8oJ9nglxDI5PfnAdRW7rpAV86XddkVYOO/c/QYjMIDqpHvL7tupeYaGy7yAxdxaLfAnaJ543XBJs6ark4qDCdXRJPm6RbnmT+s7ztW0cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gjuSI+Mu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gjuSI+Mu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3031F1F00893;
	Wed,  3 Jun 2026 10:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780480878;
	bh=q0UEN0T6ZdBymDl9PpvYHn+oresFz/OvDTAtvxMlbog=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=gjuSI+Muvpa64FsbQp0C798uC9heDmpv3fdEuh84z+86XBxG1fvEQ67e/vX8+wL7K
	 Y7rr2et3VW/Ny+hwumBYFnnt+Bpq83US7jerAsqO5Ald11hBK1RHwB2JEQrQkKmOjQ
	 0EfslI1ewAJMPW6RpqDuQFlvdoNwuXdwoKfK+sl5UdzUVmDuQQspUvRwFrWixz6c1/
	 HLw2Eq5uEFinQ3xWicCLCAos/nLRrYe4XMyXc1o+nti2tRVsov4/Cryr9DQL9/90XL
	 orlUdVKatU7mpJqzxzmCoKHBiPRiULCkShyXv+oApD/apilcFeKpSlS5gKXv9ITn6E
	 H1ijxviFEgHRg==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 1/5] selftests/mm: make file helpers return errors
From: Mike Rapoport <rppt@kernel.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>, Zi Yan <ziy@nvidia.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, 
 Peter Xu <peterx@redhat.com>, Leon Romanovsky <leon@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Mark Brown <broonie@kernel.org>, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260527142432.230127-2-sarthak.sharma@arm.com>
References: <20260527142432.230127-1-sarthak.sharma@arm.com>
 <20260527142432.230127-2-sarthak.sharma@arm.com>
Date: Wed, 03 Jun 2026 13:01:08 +0300
Message-Id: <178048086818.472368.16811711474077698399.b4-review@b4>
X-Mailer: b4 0.15.2

On Wed, 27 May 2026 19:54:28 +0530, Sarthak Sharma <sarthak.sharma@arm.com> wrote:

Hi Sarthak,

>
> diff --git a/tools/testing/selftests/mm/hugepage_settings.c b/tools/testing/selftests/mm/hugepage_settings.c
> index 2eab2110ac6a..c2f97fe97e58 100644
> --- a/tools/testing/selftests/mm/hugepage_settings.c
> +++ b/tools/testing/selftests/mm/hugepage_settings.c
> @@ -61,7 +62,9 @@ int thp_read_string(const char *name, const char * const strings[])
>  		exit(EXIT_FAILURE);
>  	}
>  
> -	if (!read_file(path, buf, sizeof(buf))) {
> +	ret = read_file(path, buf, sizeof(buf));
> +	if (ret < 0) {
> +		errno = -ret;
>  		perror(path);

Hmm, looks like those slipped ksft conversion :/

For kselftest compatibility this should be

	printf("# %s: %s (%d)\n", path, strerror(errno), errno);

> @@ -103,12 +106,18 @@ void thp_write_string(const char *name, const char *val)
>  		printf("%s: Pathname is too long\n", __func__);
>  		exit(EXIT_FAILURE);
>  	}
> -	write_file(path, val, strlen(val) + 1);
> +	ret = write_file(path, val, strlen(val) + 1);
> +	if (ret < 0) {
> +		errno = -ret;
> +		perror(path);
> +		exit(EXIT_FAILURE);

These seem to repeat themself, how about we move prints to read/write
helpers?

Then it wouldn't matter for the callers what the exact error was, and no
need for errno games.

>
> diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
> index 311fc5b4513e..290e5c29123e 100644
> --- a/tools/testing/selftests/mm/vm_util.c
> +++ b/tools/testing/selftests/mm/vm_util.c
> @@ -703,62 +703,72 @@ int read_file(const char *path, char *buf, size_t buflen)
>  	int fd;
>  	ssize_t numread;
>  
> +	if (buflen < 2)
> +		return -EINVAL;

heh, this feels overly protective :)

-- 
Sincerely yours,
Mike.

