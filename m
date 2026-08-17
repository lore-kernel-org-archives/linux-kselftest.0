Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F01F4477E5;
	Mon, 17 Aug 2026 16:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786984825; cv=none; b=KA5Ln0nFZo1VjxssOzZ9MiEBA1zyDM1XsO5cnSVjKlsZLdYoipWqMXORZJbzSl8TEPbnTYfzGMwMCSLYZ4Q2+oZWyiVIFn6KiqbugIoLC+OgqyVzfPmpUZtXwhnbhTjeubxSrMgV+FLpHoMCOdam67fD4FWRcDs9mSK7uSwM8wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786984825; c=relaxed/simple;
	bh=L7h1Shd7QhHubIZwobHpD4CFDbFj/NllrvlP3pfcg4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H36PHVdvAGT0PqqSWTHIs/jaw4kaEC02gMzmzoyyq3G/+m1y/ISc+8OGKXxjV51LCYOwe29s56mYqwiXGQUT+aFKY/NEj74nhyEFcVlFk1na/scqQMAjswt61UFf+bO4VTFEpkLY2rtuszjoi+Ju3KnUqq4LWNY8YCvJNBLXyNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cDOTH9QO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cDOTH9QO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB001F00A3D;
	Mon, 17 Aug 2026 16:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786984820;
	bh=0jT6S4YpgQH38JdW1g0o3Z2pQ+/PX/2D+lf/1VEYoUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cDOTH9QOP614hNdU2RzYQKCefqWgx4OS8MfOUYsoBt9GFSmPkuy1Y41Z3NBnfEg4Z
	 j1JPK1rUG+dUR39kkDskXbp3DfbW6GMesGUpeUmClpdeHrz0qGgKP5um+Oi/Q76Yae
	 0ClklYuvV1wXKhqhFcs+Am4ZCLHrkdgU7y7vmYdRuqgcp6zxIhFhvdIaohDKMvY1/n
	 +Xvk0jf6apulJTeyJV+2oehd9tfUXhibM2lZrG+IA+Bno2CZtHfxsV4RQe9TAIYKb+
	 i08W2vLBg3+wHtnz01DcqXPJnpVZ37pqpqYIZRGjnos0Cww8aILf9zgIM/9Kwv+WgO
	 gRlI+vaXeQIhg==
Date: Mon, 17 Aug 2026 17:40:02 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Song Hu <husong@kylinos.cn>
Cc: akpm@linux-foundation.org, rppt@kernel.org, sarthak.sharma@arm.com, 
	linux-mm@kvack.org, shuah@kernel.org, david@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, surenb@google.com, mhocko@suse.com, peterx@redhat.com, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] selftests/mm: emit TAP header in uffd-wp-mremap
Message-ID: <aoM5S9kq3aPEiMT3@lucifer>
References: <20260815080716.3596514-1-husong@kylinos.cn>
 <20260815080716.3596514-2-husong@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260815080716.3596514-2-husong@kylinos.cn>

On Sat, Aug 15, 2026 at 04:07:14PM +0800, Song Hu wrote:
> uffd-wp-mremap calls ksft_set_plan() without ksft_print_header(), so its
> output is not valid KTAP.  Add the header, like the sibling uffd tests
> (uffd-stress, uffd-unit-tests).
>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>
> Signed-off-by: Song Hu <husong@kylinos.cn>

This all seems to be yet another way of saying 'somebody didn't use the
kselftest harness and so things went wrong' :)

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  tools/testing/selftests/mm/uffd-wp-mremap.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tools/testing/selftests/mm/uffd-wp-mremap.c b/tools/testing/selftests/mm/uffd-wp-mremap.c
> index c973d6722720..572c2516e874 100644
> --- a/tools/testing/selftests/mm/uffd-wp-mremap.c
> +++ b/tools/testing/selftests/mm/uffd-wp-mremap.c
> @@ -347,6 +347,8 @@ int main(int argc, char **argv)
>  	struct thp_settings settings;
>  	int i, j, plan = 0;
>
> +	ksft_print_header();
> +
>  	hugepage_save_settings(true, true);
>
>  	check_uffd_wp_feature_supported();
> --
> 2.43.0
>

--
Cheers, Lorenzo
