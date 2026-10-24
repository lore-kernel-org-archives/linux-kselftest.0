Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792801330;
	b=v7Jj2HCQ33X3Vp/2V9alaLe9qmzCqTJpJ9M4KRY+WZPS9ipQBcF+vGWlCbz5gHTl4He5
	 sYUP5MDCzeoQLXj2egSVmpetFw4ByRECuj7LpdcU42QRZWv8vszlotu/jeuo6qsMkXS1H
	 YGspF6GiwJ1DiTtcJFWN5l7ahQOnzri7H61M/TC5XL8c0VMSl5AfCGLGu8LnbwAZUi2jp
	 7nhpsJN2RFDLdjXOE2gGuscFSbYhwjCkKcjON3cuHtTN4IwGfsO5n9ii6WEB8ozf2U60Y
	 X2BH54JEthpgezH0i2pgatJgiJzTCaDNASjtfm0CAo5GxzlMDPJsy8A2Rt8IbFHPjgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792801330;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:User-Agent:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=HxaRVRenX1FR+iZ0AONAeVn2JQUzRoeRNX74fibnxLs=;
	b=aGo4eAnI1qkiHtqh+KioUSs6C5QluX7ztKjqwpcvc+CSJs2ZBY+ZDj3FGqm3QyviPANr
	 Cfd+UcIX4NqoNRvuvIU5vHTs+setHmwTm19Z2LtHl06FaSDMSc7m7CxX7a5iznQ9OuSKb
	 IKoCvNAzv+nFq21dTfu/7SQ7qQEUdiq/o912aysejTUF34iYnZZy1lDCUA9TxBNI/nn7d
	 6Y0FSreAM50Nr9am/NHt0CNW3saHAeBMLWRJ/QBNxUbAQ+aOoYfD3biFNtg8NG+hpu249
	 PFRPURLzB3KMzfUgGyC+d7LSp6v+GLMOtfggZNFfRhBdcSvf0ZOqggw0T+r4PBI/QQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Zvl1hG2O;
	arc=none smtp.remote-ip=209.85.161.69
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE943606A31A
	for <linux-kselftest@vger.kernel.org>; Sat, 24 Oct 2026 00:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE943606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Zvl1hG2O
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-703a37d970eso1919212eaf.1
        for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 17:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792801329; x=1793406129; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:user-agent:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HxaRVRenX1FR+iZ0AONAeVn2JQUzRoeRNX74fibnxLs=;
        b=Zvl1hG2OHWs9ZOSbEVoI3cqRFny74TEz0aBMW29gKSEGCAtaAEi13N1ZeWWDbKCeBv
         m2821jvEXtbAEXPiQbpEcXPKCS9ulKwu6eLyTGUtA1d4wv9/bB9f5hbh/EXyKXRwr9tB
         drIQXnjBwv9l4h8Vm9l411NpRrHG31xXi4aSvR0x9j1tfWX3L0Hm09p06NV4ojJymjEf
         U4M6iXt9hPtXoDgx6KWzNyc5Y7zrg9E+NgqVYXv2B8eGLX/kgBM/qpqH4IF1IS3zi4xU
         3m19Qj9DKhGISCvZdB4Wo60GoCEsL/4Rl7deMDH9rxinedvh/0263zpKPve1lZJXJGcO
         HhXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792801329; x=1793406129;
        h=content-type:cc:to:from:subject:message-id:user-agent:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HxaRVRenX1FR+iZ0AONAeVn2JQUzRoeRNX74fibnxLs=;
        b=DcxLB6FceUOxR5kyarc1q3tcJe0V2N8hrJvFoqRKIdu352bThXLxQV4CDgeznfCaF5
         b/TJ8n8NyBAxq/Gqkwy9dfxY8fXI7x4nfVbpatxoBjNrCaoNcS9PxezKFYAY7a3wuh4K
         cqUXEvDfopygKBwjMuWxJeH8fEQJMfX4sjeodj6BY0cVjSWx0N1zDiZ9APMvedz4i+YO
         y6Znek86fxDGfKuBI8CMX3YBzHHVDCcRPRFC/WjFvV8M+2SEUxlHYJkBJd5XYzRffIy4
         gTR0V3J3V20O7Sp/i4j92VN+/XAAMKKMsip4E458UQOnZnvXSXER3aZb/k5ch7WN/ddA
         ORCg==
X-Forwarded-Encrypted: i=1; AKwUvByzvy9NCoMzYh3zO5MIXYvszsy+81+8VYyqPAXOE/cVu6/MROC9aCCr40MRr1OSw21HWORvJOL0REyAAm6NkU0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6cHCWcSDbizP0D4GU9W1eCg1ef2qcjWVGtVpbf0x6vH9OHr+y
	nYvp9iXerUaIBrmp6ii6mXXNzVMxxHOFz8m07cmaB/Bq0fVf76jLTi0YnjkMUFozTq+QVPDmyxe
	Tcet7rtCdVQ==
X-Received: from oara11-n2.prod.google.com ([2002:a05:6870:534b:20b0:4a7:c9:bf73])
 (user=wfelipe job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6820:f027:b0:704:417f:a571
 with SMTP id 006d021491bc7-70ba0b5aa65mr348934eaf.5.1792801328540; Fri, 23
 Oct 2026 17:22:08 -0700 (PDT)
Date: Sat, 24 Oct 2026 00:22:07 +0000
In-Reply-To: <100602397eadeaae2e3206e1d9aae55e@kernel.org> (Tejun Heo's
 message of "Fri, 23 Oct 2026 10:05:11 -1000")
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022042921.711624-1-wfelipe@google.com> <100602397eadeaae2e3206e1d9aae55e@kernel.org>
User-Agent: mu4e 1.12.15; emacs 30.2
Message-ID: <p973fqxwymkw.fsf@wfelipe-west1.c.googlers.com>
Subject: Re: [PATCH] selftests/cgroup: convert cg_read_key_*() helpers to s64
From: Wilson Felipe Pereira <wfelipe@google.com>
To: Tejun Heo <tj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Michal =?utf-8?Q?Koutn?= =?utf-8?Q?=C3=BD?=" <mkoutny@suse.com>, Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>, 
	Nhat Pham <nphamcs@gmail.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Tejun Heo <tj@kernel.org> writes:

> Hello, Wilson.
>
> The following is a Claude-generated review.
>
> On Thu, Oct 22, 2026 at 04:28:57AM +0000, Wilson Felipe Pereira wrote:
>> On 32-bit platforms, cg_read_key_long() relies on atol(), which returns a
>> 32-bit signed long. When values in memory.stat or event counters exceed
>> 2.14GB (such as on 32-bit systems with large memory), the parsed value
>> overflows and wraps into negative numbers, leading to subtle bugs and
>> false test failures.
>
> On 32-bit, glibc's atol() saturates at LONG_MAX instead of wrapping:
> atol("3000000000") returns 2147483647. Event counters are counts, not
> bytes. No test reads a value near 2^31 from its cgroups, so the false
> failures are hypothetical. Can the description be updated to match?
>
> cg_read_long() and cg_read_long_fd() still use atol() and return long.
> They read memory.current, memory.peak and the swap counters, which the
> same reasoning covers.
>
>> - Migrate helper functions (get_cg_wb_count(), get_zswpout(),
>>   get_zswap_incomp(), wait_for_writeback(), and cg_check_freezetime())
>>   and their callers to s64.
>
> In test_freezer.c, only test_cgfreezer_time_empty() is converted.
> test_cgfreezer_time_simple(), _populate(), _migrate(), _parent(),
> _child() and _nested() still store cg_check_freezetime() results in
> long and print them with %ld. In test_cpu.c, overprovision_validate()
> still computes "long delta" from two s64 usage values. A 32-bit build
> with -Wshorten-64-to-32 flags all of these.
>
>>     rebased on top of mm-stable to complete the s64 conversion across the
>>     cgroup selftests (including updating test_no_kmem_bypass() to s64).
>
> This doesn't apply to mainline. The test_zswap.c hunks depend on the
> test_zswap fixes in mm-stable, which aren't in mainline yet. The
> tcp_client() hunk in test_memcontrol.c conflicts with eb69e955de7b
> ("selftests: cgroup: make test_memcg_sock check flushed sock stats"),
> which went in through the cgroup tree for v7.4. Can it be rebased on
> v7.4-rc1 once that's out?
>
>> +typedef signed long long s64;
>
> This is the main problem. The KVM selftests build libcgroup too:
> kvm/Makefile.kvm includes ../cgroup/lib/libcgroup.mk and links
> cgroup_util.o into every KVM test, and access_tracking_perf_test.c
> includes cgroup_util.h. That build uses -I tools/include, and
> tools/include/linux/types.h has "typedef int64_t s64;", which is long
> on 64-bit.
>
> cgroup_util.c then fails with "typedef redefinition with different
> types ('long long' vs 'int64_t' (aka 'long'))", so none of the KVM
> selftests build on 64-bit. Maybe use int64_t with PRId64 from
> <inttypes.h> instead of the local typedef and %lld?
>
>> -
>>  	ret = KSFT_PASS;
>
> The blank line removal is unrelated to the conversion, same for the one
> in test_cpu.c.
>
>> +		ksft_print_msg("debug: zswpout=%lld zswapped=%lld zswap_b=%lld\n",
>> +				zswpout, zswapped, zswap_b);
>
> The continuation line was aligned with the opening parenthesis before
> and now isn't.
>
> Thanks.

Thanks for the review and I'm sorry for the build failures! I believe I
messed up with I rebased it on mm-stable and didn't check all places
that had changed.

I've updated the patch locally to:
* Use `typedef int64_t s64` and to use `PRId64` from <inttypes.h>,
  similar to how KVM selftests are using, while fixing the build
  failures.
* Convert cg_read_long(), cg_read_long_fd(), and cg_write_numeric() to
  s64 along with the remaining callers in test_freezer.c, test_cpu.c,
  test_hugetlb_memcg.c, test_kmem.c, test_memcontrol.c, and
  test_zswap.c.
* Update the commit description to reflect atol() clamping at LONG_MAX
  and clean up the whitespace changes.

I'll wait until 7.4-rc1 is out and send the v2 that applies cleanly on
mm-stable and cgroup tree.

Thanks!
