Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792771104;
	b=vKjfv91CyMqP+YLzhm7EuNxAs4+WTn2vej93Y6NpgN3tsczaCUfNWdNH0507td0lL2PC
	 xyH25v1oiOyet1/1SbMSh+jDsDR2snwiU1Q7QNn0Gk/oe53wIewCMtUxLWC5587V5CSgR
	 s2r9vrjo1XQ9/u4S9RoYkmsW8EdN9Xk3poQ9/Q8AZn7NFUuUMU1r01Z+aMnLjxDiAlO9/
	 SIqO+z/OxF2QPxyHATfIISfXIOQFywx/YGh7gpUe1Dce8r1dNz7eZvwUvK0wRNDbdzfft
	 ImLNe6ycoKhFNexay55H9A/MCJCdqx0Yk3i+B9JEfIu/ZXLepc9j6TInxPsmqZ5Qynw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792771104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:X-Mailer:Content-Transfer-Encoding:MIME-Version;
	bh=oR8WsW0STYE/yZ/T3jtIUfWqW3IPmySlmYoCN5YBLrk=;
	b=F38k4OQoDQgJwLXnpPi971Z/Te1Zxk2hPixdeQ1yJxFVrwvjHY+r+vFOOz6CAW4UWHx1
	 eiV9iHCH0u443WY9+O702MibWCfGzbUyz/4sStkGPhLN3e/sj1gDo5LF4ouXlc66OvPF1
	 e+H6WYnJTTEl91QdZqUBwDqYOf4DOAl9NktGPlH3A+3PPyySLQVIsp1FYcqRNvv6gYV+w
	 Z7zDeUVB+YPZ6ZBpoxsnCqucCD09H7JErrYJil5DGMSyWALf3iRAitrJEcEcpfNhWZd2O
	 D7RBhAAkB8/4SAOI97o8fHsPeLk4mMBY02rb04FhMB8HpD0DyxHuZ4AD5w3+cEN7Hng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PTx3+SOh;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB5D606A31F
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 15:58:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EB5D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PTx3+SOh
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cd3310348d2so858967a12.1
        for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 08:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792771104; x=1793375904; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oR8WsW0STYE/yZ/T3jtIUfWqW3IPmySlmYoCN5YBLrk=;
        b=PTx3+SOhTdnUC4l9QD39mzvDBiRvCJt5QG2Znwe0srIuIEhUJHRM3FUgALlOCZC4gu
         qpjaRZxY+Guwr4ugPHVqYeuGevQv2QafXFhobLSduTUFHskSQzQ2hlSFUDxJ+eptKuF4
         YDTaHS7NriA0WBIKczxLaKmqwZbbT87SHmNHaynZsHX6Abe8Cce1Ql2PMn9xh8fb8Jtn
         0auAl2nnXl1i5R+mQBN9JENdebgSsgGyZNa3VoSLY7iGHKd650/imzOW4DjDdAX+VwLK
         SeNV0+1330zbD00mA7a9LhynPip0JZpa/XPPChke4zCXYZZGlJPAAmwUhP9X5BtyHBi8
         kx9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792771104; x=1793375904;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oR8WsW0STYE/yZ/T3jtIUfWqW3IPmySlmYoCN5YBLrk=;
        b=GXGrFvSWAjoNHE+yegSyxOj1ejVN8mpIwQr8aRegFuxZgmBEynWreuQWkq/YP1r5ag
         jb1V0ed4UCJmOR7cCm8G00NNN/g0FQNXRRCQndlJiaA5Qsg5RqkpblPWBVhGF9LtAn+v
         HgwCwrVD00LdFMoDpWDd6iUElkcx/WOiqoL7bn8Ff7uXGJ4SqYrkXr/EdBb/D918P89v
         w8HXT2vzxlZpxVbCgP9aSuLmecpKprS8hS/gdSEiV2MYPIeYxsJsSg9bB1kvnnEQ/KdK
         b7IL/BqhxlBSWSycVjqH+E2/OK9BrOhBh3EGVKmIWR5g3zOqJTJLigOu0kDNBcz4zJYm
         1Jaw==
X-Forwarded-Encrypted: i=1; AKwUvBy3sBqjPe+Ox4l/dhK2ik59a5o/m9fcnRe6FVUF98H3CaQEqZXTgZc4PlLFV6CB9rnhkB1WoF6eclFe8nC5EIA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKg6/Rz2WtDODilYxryDloJXaN2BUfQpGVBYUW6STp1sEE7kZRa
	5GzpENH3lKl30Tu9TZnR9upIaAXc0GV2uH3daEn+mwniqNI9vHP9Gnke
X-Gm-Gg: AYBFou1xDwtC2oVksVtmoYTsQVcGHVG0w7kp7J6QuYEUpxCy9hCfYEGX5F1HFvtUF+v
	OORH7Qk+L0PWTggMBL2ifgwN7C02gllF+bRiVl1RP8GCYmtTFtjzZKBBIoRVf3Bs4+E9IhnJnHC
	uEqVc6Q5r/ZCXNMrRi9CFdQi/SFc8UwcuDfzeDnJm9jfwkoFy08B/95iBD7OQoEEiCUqrXBiyL1
	XBVotXomG1CcHzN7Cqs74XcRhnMY4LbWFYTfH6ztOAAJyOXKGwio/Yhr50lbfjIVzZmoEyEhura
	zU6o2vNOMzOQycb7FKtqAoogbjQe46I22KV21AQvdCyL1efGyXbS8m8je/xAxEkfdYdcttLWku9
	n3MKVAqW1YfAZZztWWi66O33AOW/LpHDCDTKTcW1KTRkyJUjVRf8OYPxsAt5HvkBin6sc3Lb0cO
	+pcO2AnTJ4FmJp3TSka4YnwQZybg1i0MwQHQ0LbZWebipGbqlswVJy7Po7zrC5TqwzkYMTScFyP
	FhidP7VnpO1QQFL96x10Nsn6iJsUGQgpNeRMzuThlSEePtmm38gkrgZ1sldkpWmXZT2br/naAy5
	5fu7V1CHas1zm5ri29p9ZPHdbICpp+GZqR+5rOqAQxSnUwsV02stMc4OPY9j
X-Received: by 2002:a17:90b:3e48:b0:3ab:8288:b8ce with SMTP id 98e67ed59e1d1-3adce7398c5mr1635912a91.24.1792771103440;
        Fri, 23 Oct 2026 08:58:23 -0700 (PDT)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3addd84b1basm707058a91.14.2026.10.23.08.58.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 08:58:23 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Oct 2026 15:58:22 +0000
Message-Id: <DMCCBEPCIWH0.2JEDKE64WPJRQ@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/7] mm/page_owner: add bpf_iter and kfuncs
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "zhen.ni" <zhen.ni@easystack.cn>, <daniel@iogearbox.net>,
 <andrii@kernel.org>, <eddyz87@gmail.com>, <memxor@gmail.com>,
 <martin.lau@linux.dev>, <song@kernel.org>, <yonghong.song@linux.dev>,
 <jolsa@kernel.org>, <emil@etsalapatis.com>, <ihor.solodrai@linux.dev>,
 <akpm@linux-foundation.org>, <vbabka@kernel.org>, <surenb@google.com>,
 <mhocko@suse.com>, <brendan.jackman@linux.dev>, <hannes@cmpxchg.org>,
 <ziy@nvidia.com>, <shuah@kernel.org>
In-Reply-To: <d39db4fb-e511-440e-9065-72c34a1a295a@easystack.cn>
References: <20261021112437.1799213-1-zhen.ni@easystack.cn> <DMAURQCKK6CG.10CZ7MFXGJO3V@gmail.com> <d39db4fb-e511-440e-9065-72c34a1a295a@easystack.cn>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, Oct 23, 2026 at 07:51 AM zhen.ni <zhen.ni@easystack.cn> wrote:

tldr: it's still nack

> underlying iteration logic. This shape is also what Documentation/bpf/
> bpf_iterators.rst prescribes:
>
> When adding a new BPF iterator program, it is expected that similar
> functionality will be added as open-coded iterator for maximum
> flexibility.

It says what to do when an iterator is added. It doesn't say that
one is needed.
Iterators are for kernel data structures that a prog cannot walk
on its own: tasks, cgroups, kmem_caches.
pfn is a number. bpf_for() is the iterator.

> 1. What range to scan. Where do ctx->start and ctx->nr come from? No
> in-tree iterator context provides them, and a prog cannot derive them:
> min_low_pfn..max_pfn, memblock holes, and offline sections are all
> kernel state. The loop bounds alone require either another kfunc or a
> kernel-side walk — which is exactly what the iter target already is.

From user space. It's a syscall prog, like scan_open_coded() in your
patch 7. Its ctx is what user space passes in ctx_in.
/proc/zoneinfo has start_pfn and spanned for every zone.
In holes and offline sections pfn_to_online_page() returns NULL
and bpf_page_owner_read() returns -ENOENT.

> 2. What makes a page eligible. The alignment test in the sketch is the
> only part the kernel agrees is expressible in a prog. Everything before
> it reads state a prog doesn’t have a handle to: pfn_valid() over
> MAX_ORDER_NR_PAGES areas, pfn_to_online_page() under get_online_mems(),
> skip_buddy_pages(), the PAGE_EXT_OWNER / PAGE_EXT_OWNER_ALLOCATED flags
> in page_ext, and taking the record snapshot inside the RCU window so the
> checked value and the reported value are the same copy.

bpf_page_owner_read() in the diff does all of that:
pfn_to_online_page(), page_ext_get(), PAGE_EXT_OWNER_ALLOCATED check
and the copy of the record before page_ext_put().
PAGE_EXT_OWNER is set together with PAGE_EXT_OWNER_ALLOCATED and it's
never cleared. No need to check both.
__reset_page_owner() clears PAGE_EXT_OWNER_ALLOCATED, so
skip_buddy_pages() and MAX_ORDER_NR_PAGES steps only make the walk
faster. They don't change what is eligible.

> 3. The walk is deliberately lockless, so exposing struct page to the
> prog is not safe. The pfn validity check and the page_ext dereference
> must happen under the same kernel-controlled RCU window. Otherwise the

The prog doesn't see struct page or page_ext. It passes a pfn and gets
a copy of the record. The lookup, the check and the copy are in one RCU
section inside the kfunc. offline_page_ext() does synchronize_rcu()
before freeing page_ext.
page_ext_from_phys() does the same lookup from any context.

> 4. One record doesn’t give the prog the useful data. The record holds
> only opaque handle/free_handle tokens; stack-depot resolution exists
> solely in the kernel. The memcg is neither in the record nor trivially
> reachable — the path is built by cgroup_path() walking the kernfs parent
> chain. The NUMA node comes from page_owner_get_nid(), which bypasses
> page_to_nid()’s poison check. And so on.

The handle is the key to filter and aggregate by.
page_owner_stacks/show_stacks_handles maps handles to stacks.
Same for memcg. bpf_page_cgroup_ino() in the diff returns the id.
st_ino of the cgroup directory is that id.
