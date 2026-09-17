Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8547337C908
	for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 02:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789611478; cv=none; b=FgRXtTbebBUX2rqgA5AS+Uh50LPizRUNhJg1Euf6jYHjtI+x53zF79uaXdjx3a0fCmcJloOXnDsGqTotcVF5OxrgGygl+7Zb9M6d3iokC/t6Znywi8d+4BDxrwuiS+4y8ax+qKCAUrF4HxutrPJVbREmAAoGwyn5vC6JnKN7ZYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789611478; c=relaxed/simple;
	bh=iNBfcS6MDvr00DcTaevT0gyCh2J7vLAarU2nyk/qJjQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=KMPWlmcPcL8NbbeBsoXkEDrm3RK411rQfmE15MbU0oSEPoK9/ltTcvrwtD6nB2z326Ro68+nBISbz0SLCNh49QhJ1MVpGv7P7ohtXA6M2tmuWaG+I3au8R4uK67VJ9ophjVGHP4O7amtQuyWJQufJr8UKnjn+BWaPqLA9ycFin4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n8+FBuIJ; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n8+FBuIJ"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-86b90133ae8so223383b3a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 16 Sep 2026 19:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789611476; x=1790216276; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=15AYesmDPyE/Pkb7voFatC1kEWMKzHw4E6qOfih9IzY=;
        b=n8+FBuIJuDho1iO04wTcUOendOlL52ic7mHoFSFIjpk0GBHhB8hUEfJ9c3ksDzE+L4
         JHe8V4tQtqhhlqGxSrIi2LK2uvsQl5YlFIz9xPPhpohxeRltZvxCnW6JV5jLuXNhLj3v
         OtnH+nJthqoi9b2FWYLOP+60rzZ8vQHHfbA1XGzWNSXzC/d+nXjblV8bRR0jj+9GkAur
         b87Cdif8DMCVHL2muWCOk7pU6SNXmycKeZJlIMCStg9d4stDfgXbccQJN5b1jukq6Vaj
         PgHFDGZzPpUn302WaIjJTuKHDqI2umQTLJguyLcBzIwn1EVmGXqK2D7EWNZG7HO9Tvlg
         pLXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789611476; x=1790216276;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=15AYesmDPyE/Pkb7voFatC1kEWMKzHw4E6qOfih9IzY=;
        b=XT0nMUTsMXY8L9Ff1ZzLzwoCUbcsX2+EyuTbEUKjQBCAqsryeN+qZTq6eHy84uHRwE
         wN/sJOOPKLnrBL42M6yLfKk1koLdGE0HZCdkvtaQbxV8puaYto3fl0E5XJPnZy+OEL3r
         XjRRoxgHXk8eoPDJ3fdCi6nLm0hRSKm3zFpr6+GegE8OBI+N2lsv2RIW5FD7S0Fpjy7U
         Ov3t8Z5akHGDuKKfF27d/slmqrY2pkwD1JXyt8AaSbwC1t+9jalzP6PNz3KjXfpYp+9Q
         CeLnJLB5WQs39I2LK7l3RauGll/daujN2nchEnVTjxxhCpmQL5XgIGFxr9Vc/WfllKGh
         UbAA==
X-Forwarded-Encrypted: i=1; AKwUvBy+vlA/Lp18rIrlEGoepWzjXB2ZdWZOeafA1hARdP15Eh5AYPZinTeyW1eSu5NhGvHbueUFephTijDC5yuuBfM=@vger.kernel.org
X-Gm-Message-State: AFuF++nZPo4WgyBni0L7haYqUfGfT8q0+2YhrXEcbjx4lhUmbGmGTvNR
	1w43Oj+9UOkYf79T/qfjphPfTEb6Cd9c7In0BjuZrXqQlhw8y8KA9PhU
X-Gm-Gg: AYBFou3RXKCVnhd/ueIAobpS+a3/OlCpOSVUNVtyf4TYssyxF1/EuJY54pObrPtXGvD
	/ohuuxKlj42sSFXLoT3fgTXec6p8AM/gKhcSr9KfmsJT75bUame4B4S2elV07+nHFvqsDsY3ZJp
	OtvwzD1C5aHhzQqLWIaxIJExs4UNKXuHnmFmJlox2fEkv/CJTf4N4fjPF2Mh9VTbS6ocU7Bef9N
	7CmBq0Lp8SNsklSWtE3i3fm83HtQ3kgipqGvDIFwHAaEu257LuISecBw0aPGOqmZVPPq/upDOkQ
	pYcn+ziw3821KCIRc8hxb5zd2jcSUmYFBlBtCeBi9R87iI28DQaMfjlv0uOGhC6krqHDfKoRBnO
	tsozOj3YxsE6nkI+AkIiaftPX7YNyKdO1NYEX5LG7K++y5VFfWqKcWsRs9AGeRcawCvsfW1k/x+
	oOuync5qMAFnlO/041CMmRS7hprsB3/R8RXe9DQZg9WbXn5FlLpi4zUEeQJg5UN3VvDhBVWb9UQ
	2x0nPZbgLb5yi6lR1i1Gwfrn7Oy/dqAJRYcNUjk1ZzoShiM2fI6cJpGaFWmCmbIZ4sIXno00Llb
	jOWU
X-Received: by 2002:a05:6a20:4308:b0:3da:6bdd:2c74 with SMTP id adf61e73a8af0-3dd5f466f35mr11180754637.10.1789611475781;
        Wed, 16 Sep 2026 19:17:55 -0700 (PDT)
Received: from localhost ([153.61.198.253])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50ab8ae01sm2452008a12.18.2026.09.16.19.17.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 19:17:54 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Sep 2026 02:17:53 +0000
Message-Id: <DLH8BLA0ZCFY.3U2Q1BS1DBTYU@gmail.com>
Cc: "Emil Tsalapatis" <emil@etsalapatis.com>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Ihor Solodrai" <ihor.solodrai@linux.dev>, "John
 Fastabend" <john.fastabend@gmail.com>, "Shuah Khan" <shuah@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf-next v7 1/4] bpf: Add a sleepable page allocator for
 map memory
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Jiayuan Chen" <jiayuan.chen@linux.dev>, <bpf@vger.kernel.org>
In-Reply-To: <20260917015618.7488-2-jiayuan.chen@linux.dev>
References: <20260917015618.7488-1-jiayuan.chen@linux.dev> <20260917015618.7488-2-jiayuan.chen@linux.dev>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, Sep 17, 2026 at 09:55 AM Jiayuan Chen <jiayuan.chen@linux.dev> wrote:
> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> index e80963971f680..345fe4c2e6422 100644
> --- a/include/linux/bpf.h
> +++ b/include/linux/bpf.h
> @@ -2786,6 +2786,7 @@ struct bpf_prog *bpf_prog_get_curr_or_next(u32 *id);
>
>  int bpf_map_alloc_pages(const struct bpf_map *map, int nid,
>  			unsigned long nr_pages, struct page **page_array);
> +struct page *bpf_map_alloc_page_sleepable(const struct bpf_map *map);

[...]

> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> index c7bc9ba9b331f..abd0f67c68d97 100644
> --- a/kernel/bpf/syscall.c
> +++ b/kernel/bpf/syscall.c

[...]

> @@ -636,6 +635,27 @@ int bpf_map_alloc_pages(const struct bpf_map *map, int nid,
>  	return ret;
>  }
>
> +/*
> + * Allocate a page for map memory with the blocking allocator so it can
> + * reclaim. __GFP_RETRY_MAYFAIL keeps it from invoking the OOM killer: the
> + * page is charged to
 the map's memcg, which need not be the caller's, so
> + * an OOM there could kill unrelated tasks in the map's cgroup while a
> + * foreign caller could never be its victim.
> + *
> + * bpf_map_alloc_pages() serves arbitrary BPF program context and stays
> + * reentrancy-safe by falling back to the non-blocking allocator. This
> + * helper always blocks, so a sleepable context alone is not enough: the
> + * caller must guarantee it is not already inside the page allocator or
> + * reclaim, where blocking here would reenter mm and deadlock. The only
> + * user is arena_vm_fault(), a userspace page fault in task context.
> + */
> +struct page *bpf_map_alloc_page_sleepable(const struct bpf_map *map)
> +{
> +	might_sleep();
> +	return alloc_pages_node(map->numa_node,
> +				BPF_PAGE_GFP | __GFP_RETRY_MAYFAIL, 0);
> +}

Don't see the point in #define BPF_PAGE_GFP

Just call
  alloc_pages_node(map->numa_node, GFP_KERNEL | __GFP_ZERO |
		   __GFP_ACCOUNT | __GFP_NOWARN 
| __GFP_RETRY_MAYFAIL, 0);

with a one line comment why RETRY_MAYFAIL, 
drop this patch and fold mayfail+comment into patch 2.

pw-bot: cr
