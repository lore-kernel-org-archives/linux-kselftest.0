Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C848317173;
	Wed, 12 Aug 2026 13:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786542141; cv=none; b=ftoL40P1cA/QEBDrpFtvc2BueSziIMJithO8LFWzblwYdauydrJl/TS+2D2mWWSJDONrgPk6u/S9FmF9qRF6R6jhMhMBMsAPZG/YYPn6BDaBvhZa7wc08G+8Gzgl7DHYrk4gXZt6haDz7TxHjz0UcmIfv+G1A1GALxQmQ9MhwuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786542141; c=relaxed/simple;
	bh=0XaxWheGYTDR87LgUIuppZORR3AznVVp4ujh1JCFC4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fbas+Z3sVT/oyz0kQsa3CwUL2tGuT8Wsvq4a1pzmrWGv4VaTLFzzb8xEcOsJPn87KM7rkayxku60Q2nxQchLM67teeMz4ingdDoOw2gVIUVFXlj3oEb3V6/pOzF0khj1QEmPd3DRbf0Bugs7+9AHXVKUM52W+WJW4H2H0ViOC90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F6YnCJWl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F6YnCJWl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C9FC1F000E9;
	Wed, 12 Aug 2026 13:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786542140;
	bh=/v3X9kDnaj2Mwr/HHxgw6e3NrNjwRw1A4OPoazOeV+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F6YnCJWl07aBrUyTvYaOjCTLeFvwaF3p2SgFe3SAOg5tAl242wTSagMumlOFtMrE6
	 fb2vDsZCP1OZOi2fUXaG3HfKFXoXYNFa4mcZmZDLk7xGZJ4gbpMV6GQPMNZPrI8vdr
	 sUmHWk4NzSqAUjWjDosNI8F0xsKcyrHJ151vHgig0Jiba3RoqdTsbq1i+tfgkcPabe
	 psTIP4pTLwXBvdcm7oJINbvvsJp5DQ44jHowy4CvZ4TeWZh2FOvhmOXsTh9KgHCcVS
	 AKtbmk6aXuJgSUqqNs6MXwLG36TEqTXyBSGuY6PcodtdSfb+Pto5G/kcGuNTU7GvYo
	 Xh5VUcKZJqIsQ==
Date: Wed, 12 Aug 2026 16:42:12 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Song Hu <husong@kylinos.cn>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, shuah@kernel.org,
	david@kernel.org, ljs@kernel.org, liam@infradead.org,
	vbabka@kernel.org, surenb@google.com, mhocko@suse.com,
	peterx@redhat.com, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] selftests/mm: restore enable_soft_offline in
 hugetlb-soft-offline
Message-ID: <anx4NBqyMKwqvEGb@kernel.org>
References: <20260812120821.523860-1-husong@kylinos.cn>
 <20260812120821.523860-4-husong@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812120821.523860-4-husong@kylinos.cn>

Hi,

On Wed, Aug 12, 2026 at 08:08:21PM +0800, Song Hu wrote:
> hugetlb-soft-offline toggles /proc/sys/vm/enable_soft_offline between 1 and
> 0 (test_soft_offline_common(1) then (0)) and leaves it at 0 when it
> finishes, silently disabling soft offlining for the whole system after the
> run.  Read the original value before the test and restore it before
> ksft_finished().
> 
> Signed-off-by: Song Hu <husong@kylinos.cn>
> ---
>  .../selftests/mm/hugetlb-soft-offline.c       | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/tools/testing/selftests/mm/hugetlb-soft-offline.c b/tools/testing/selftests/mm/hugetlb-soft-offline.c
> index bc202e4ed2bd..35dcf661b091 100644
> --- a/tools/testing/selftests/mm/hugetlb-soft-offline.c
> +++ b/tools/testing/selftests/mm/hugetlb-soft-offline.c
> @@ -99,6 +99,23 @@ static int set_enable_soft_offline(int value)
>  	return 0;
>  }
>  
> +static int get_enable_soft_offline(void)
> +{
> +	FILE *fp = fopen("/proc/sys/vm/enable_soft_offline", "r");
> +	int value = -1;
> +
> +	if (!fp) {
> +		ksft_perror(EPREFIX "failed to read enable_soft_offline");
> +		return -1;
> +	}
> +	if (fscanf(fp, "%d", &value) != 1) {
> +		ksft_perror(EPREFIX "failed to parse enable_soft_offline");
> +		value = -1;
> +	}
> +	fclose(fp);
> +	return value;
> +}

We have read_num() in vm_util and write_num() that can replace
set_enable_soft_offline().

> +
>  static int create_hugetlbfs_file(struct statfs *file_stat)
>  {
>  	int fd;
> @@ -185,6 +202,8 @@ static void test_soft_offline_common(int enable_soft_offline)
>  
>  int main(int argc, char **argv)
>  {
> +	int orig;

Please spell out what orig is this.

> +
>  	ksft_print_header();
>  
>  	if (!hugetlb_setup_default(8))
> @@ -192,8 +211,13 @@ int main(int argc, char **argv)
>  
>  	ksft_set_plan(2);
>  
> +	orig = get_enable_soft_offline();
> +
>  	test_soft_offline_common(1);
>  	test_soft_offline_common(0);
>  
> +	if (orig >= 0)
> +		set_enable_soft_offline(orig);
> +
>  	ksft_finished();
>  }
> -- 
> 2.43.0
> 

-- 
Sincerely yours,
Mike.
