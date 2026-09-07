Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658A837BE72
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 14:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788793067; cv=none; b=V/lHHBoNLEcTQB0k/Agr3ba+AhlWN2Jg9b6StvYADqDeAG4er3mTcyfXqoycXtsOelPTwlgSkPw6ikA4D+H8dYJmvSwGGgVyZIigORyeMTJOICpHVUAtC27wTdvlwJERYopayrGaL7dd10PVsm7j+p1rpwvoGFqJHaZQGW7O7Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788793067; c=relaxed/simple;
	bh=gbehEEdOEBuU3HHxuQ6NSXa8DS14VTlpX5880xHhcCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bbaoCUSjpvpZXbIY1N3lDBjohzWJe+8HkMvmylb2SAl9koDqkC/aFzG6GXccDgPWfjoV3ZNBpAiQQ19hpkHJ+ic6Q/qOn/pYGJTjWgGhlreyd0a1xirfjD13X1lgYTRIINN9qNSk1UYj6hcv5kLOSy26WM8nns3uRu2Mv0t9cOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Oe+bokNH; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Oe+bokNH"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-9399daa3d43so125502385a.2
        for <linux-kselftest@vger.kernel.org>; Mon, 07 Sep 2026 07:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788793064; x=1789397864; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fKmfltuahHibleolgFqoLkoM/YklChy1LcLNAOhU3Vo=;
        b=Oe+bokNHNe/HImO/aGgXCxRhqjQPHB13UpTfCeBV+/tmCki99R6DiFxw7plKkLuB9A
         LiGcTKwlViMCe5dBh/zHvvqd37Ch7enS336pveukKQH3DNM4Nk3v5p4tPBa/+jKFsosn
         5hugnxuLKQ+h24mwAEzWY63nv1CqzETrdZlJspPh4LspkzFmiEI0xqybV9Ed9F6e3YOx
         H5q3cCaw52waPs54kVKKhJ9U/3BflkuStFbltvgQl8nqhprSqMqpOZGTnmZAg6C/nAhR
         teFFWcmhwfEVecpKzoALShR5CNYK1vxfPO6jUGIr5yNq4OD0XysxdMGSbqj9QoG6yr/B
         9K1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788793064; x=1789397864;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fKmfltuahHibleolgFqoLkoM/YklChy1LcLNAOhU3Vo=;
        b=O74zFAlHK2jo9oPK1oF1sRS4BNmv5SkoT5JzD+1xCUTGqUiYCmjlLKPjzsZgE50gt4
         oM9PC8RkkQUkC01iwUYl50BWF5TW5t0l6syzGPqvmINCjrCFGSHwHgqSAznhRGYSp4O/
         CcWDaMP3qN0FJ53C7N5SQdhdUpHZvctiULOhl04U+yVP1MNiPrmHELuL1kVIpQUJZ7nV
         pHp0Tv+d8BByPHcvGQ77TLdeFE/9Tzhb2cGZnIPkerkqrlGVhZLKxSVd55oPGRDYcMWN
         ZCGi3cI+Mvn1gGFlH8vxAbPfygdQjL4izD7z3Wd/VWXfuZrBO5yCJ+0RTowPcWNOZb4+
         wYuw==
X-Forwarded-Encrypted: i=1; AKwUvBw5mvA3hXRaQaPyOWDfdL3VFX2OeDEn4BfkArbGQ1f42oVISY0jVfN9Xo1RLs97r+tU0leoz7d5FEJBCbZ3T9M=@vger.kernel.org
X-Gm-Message-State: AFuF++nviPRTlS+Dajhpc1nv7qL8y99Ix03G6GCnxEw7xEJKPxN0ZiWH
	3RkTuD2j6RUvXKhr6rv6zSqdBfGKhRdwjbDH7PFS3C2815Ld302j6aEBR/2XLatDSxc=
X-Gm-Gg: AYBFou0QPN2myRktASeHWSzT+SCTpj6jxlmUA7JNICtdvg7mzOAc3LpUtBRR8/Dtcsp
	47oNpWp2GzaTkOVvx3PQQ+0JxipapWhfMSpns+UzuDlqn6NcP+wJFeoWlUt06XsiIgUsZuYbnEQ
	svwD5ynJDIetQnqs/ZMXV/XLqZMchlh9DSjOKX4WYGaOFiTqUlr9lb0p3sP9ZPe6mi5lH8WGHw6
	hZIeDwT9GrWkHQqiuAjDP8veaXjnz34vgXqTujl9pgFcOHMOXQcsvmdyfEEVjnXiqKoSk3hlrpK
	GDW2nHnxcDgQhhsz7RK6EWIdNASOX+T9aORjfharpjj217GfapNTi9y3yrmpW1ByYJAyzT6bjFz
	3dZJ4tfJrdc4HE1WZAScLZkn1Qk3t7B0CcuiYTe5vcsMEE6GED4pB2nGcPo9eO0JaZi8UKOOwyZ
	nn5WeZpbFW9DuxYF6nQPwdvUzsfTK8fv8BmNmd7aeWb/nPJ6nmpi5nVZ8YcrZ1/0Z8Zw/DHCydE
	RUtQUPYBHNmKOO6oRRpMKsCNkaWa5VoyKuV+yjQQ9L9egbdtA0nwuw=
X-Received: by 2002:a05:620a:468f:b0:939:6db3:6cad with SMTP id af79cd13be357-9398035a913mr2267757785a.12.1788793064205;
        Mon, 07 Sep 2026 07:57:44 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb380f8sm905137785a.23.2026.09.07.07.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 07:57:43 -0700 (PDT)
Date: Mon, 7 Sep 2026 10:57:42 -0400
From: Gregory Price <gourry@gourry.net>
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, shuah@kernel.org
Subject: Re: [PATCH] selftests/mm: fix size truncation in pagemap_ioctl test
Message-ID: <ap7Qza32A-MzxBU3@gourry-fedora-PF4VCD3F>
References: <20260907135613.68692-1-zenghui.yu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907135613.68692-1-zenghui.yu@linux.dev>

On Mon, Sep 07, 2026 at 09:56:13PM +0800, Zenghui Yu wrote:
> From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
> 
> On arm64 with 64K base pages, the huge page size is 512 MiB, and
> hpage_unit_tests() builds a 5 GiB range (10 * 512 MiB) for its tests.  This
> exceeds the range of the int size parameters of gethugepage(),
> wp_addr_range() and pagemap_ioctl().  The implicit truncation to 1 GiB
> makes gethugepage() allocate a too small buffer, while the callers keep
> operating on the original 5 GiB range, resulting in spurious failures or
> SIGSEGV.
> 
> Change those size parameters to size_t.
> 
> Fixes: 46fd75d4a3c9 ("selftests: mm: add pagemap ioctl tests")
> Assisted-by: GLM-5.3 OpenCode
> Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

> ---
>  tools/testing/selftests/mm/pagemap_ioctl.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/pagemap_ioctl.c b/tools/testing/selftests/mm/pagemap_ioctl.c
> index eadc7159ca5b..48cbea3a33c9 100644
> --- a/tools/testing/selftests/mm/pagemap_ioctl.c
> +++ b/tools/testing/selftests/mm/pagemap_ioctl.c
> @@ -44,7 +44,7 @@ const char *progname;
>  
>  #define LEN(region)	((region.end - region.start)/page_size)
>  
> -static long pagemap_ioctl(void *start, int len, void *vec, int vec_len, int flag,
> +static long pagemap_ioctl(void *start, size_t len, void *vec, int vec_len, int flag,
>  			  int max_pages, long required_mask, long anyof_mask, long excluded_mask,
>  			  long return_mask)
>  {
> @@ -152,7 +152,7 @@ int wp_free(void *addr, long size)
>  	return 0;
>  }
>  
> -int wp_addr_range(void *addr, int size)
> +int wp_addr_range(void *addr, size_t size)
>  {
>  	if (pagemap_ioctl(addr, size, NULL, 0,
>  			  PM_SCAN_WP_MATCHING | PM_SCAN_CHECK_WPASYNC,
> @@ -787,7 +787,7 @@ int base_tests(char *prefix, char *mem, unsigned long long mem_size, int skip)
>  	return 0;
>  }
>  
> -void *gethugepage(int map_size)
> +void *gethugepage(size_t map_size)
>  {
>  	int ret;
>  	char *map;
> -- 
> 2.53.0
> 
