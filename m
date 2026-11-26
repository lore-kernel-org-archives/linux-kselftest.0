Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795720134;
	b=RYbcFsudyjssXttSkimrksD2OiYo66sPDdfp1NspDQKwWuoMezFCuyTd943m0aEfnMRn
	 CckC/ZDfhBTh4dIZcpy8gynqo6Tg/0L4dUW0e8BLt/Z1h8VOCgzWVM2Vphjm2TvuOStjp
	 yvQsc2nJRRdkEAmTxIGmyMuVzw3guw6WX0QKYTwu7Ugl/kZn/ZGtzE1x+oGF0wZbHqvSX
	 +5K2LJdqkNyArXqTJUI5kC/KDAu57NnG3lB6lmJYpFRutVbWuIfzNxsEh2tp6z90XqWMO
	 8VEUqscr+POsh3x3y3mZWZmN0N+3YnvC3sm+Wzoaye8Rea2ZFb4K5k0iqYiuQFjvt4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795720134;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=gzDN1QG2r+ew53MNcYjRJsztIJ6bXJi3dv7JbJUryts=;
	b=r6RFK2eeT3bJYOUZr3iW1n7EvaEf/R5zweh3d4uV4lDJlZJ1k/plkkx+5AA+ry+mssmp
	 gH6QRrZvdW5JzBBHBYyeZxcJR+SmFiWO9+FzFrlLY5IuuJfBvQCCcOt8HKO38AfGRpOvo
	 9wBypGi456J6853NUcrhhJtUux2IrHAEk9CAsHwrQKluedMSVn5PFsQIh1ZNtYShvGcAm
	 Q3FAARb7hQb/CDY47GjVm8jO8CN0Fug9otjiQSHmsEsFlEN6z8ZzVeWV7FpkqHS51CKpP
	 LChREAUHSsA1cBcliwsPYAemwCOcqPjQBgYZMlCRQbKh0Tj21VAm2IqAVELEF0eb8WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZjhVBDf7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C459606A32E;
	Thu, 26 Nov 2026 19:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZjhVBDf7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06DF91F000C0;
	Thu, 26 Nov 2026 19:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795720132;
	bh=gzDN1QG2r+ew53MNcYjRJsztIJ6bXJi3dv7JbJUryts=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ZjhVBDf7i01xUwHDBDd6t5Dd9jfrgoOKt66dR9QNrrc7L0T0YpubcyqvMK0wbN/ia
	 N5atc2f24UBtRU0S+Od103hhN6aomFIo4lUV8NH7otae9s9CkrP1XNak7SusKsyuNi
	 JkL+MoY04YXrIsQU1zFKVFP9T3f4PE1zgUKcKB7/NL84/k+6u74vQKvJZyupKIEt0o
	 AZfV4KXHHyeCjiK2GYQNrImZuCoSUW/eVZRcsXIQFlsap0dkg8rCu7Ve55neanZp3M
	 VUneTvy83IDOxnbJ490HE8Lefc1MHbwcbYRzOzVKlpqtjxIzuSYB9j8bRAoC5SerdJ
	 hF+qL17Mb0c0Q==
From: Pratyush Yadav <pratyush@kernel.org>
To: Chris Down <chris@chrisdown.name>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,  Mike Rapoport
 <rppt@kernel.org>,  Pratyush Yadav <pratyush@kernel.org>,  Alexander Graf
 <graf@amazon.com>,  Baoquan He <baoquan.he@linux.dev>,  Jonathan Corbet
 <corbet@lwn.net>,  Shuah Khan <skhan@linuxfoundation.org>,
  kexec@lists.infradead.org,  linux-mm@kvack.org,
  linux-kernel@vger.kernel.org,  linux-doc@vger.kernel.org,
  linux-kselftest@vger.kernel.org,  kernel-team@meta.com
Subject: Re: [PATCH 2/9] kho: Make bootmem reservations visible to fleet
 monitoring
In-Reply-To: <20261113003059.056dd036a6546756@chrisdown.name> (Chris Down's
	message of "Fri, 13 Nov 2026 00:30:59 -0800")
References: <cover.1794383544.git.chris@chrisdown.name>
	<c41c639fc5f453d60a265ba42a233f2ea5b48319.1794383544.git.chris@chrisdown.name>
	<179443886218.2329176.10742245280418377061.b4-review@b4>
	<20261113003059.056dd036a6546756@chrisdown.name>
Date: Thu, 26 Nov 2026 19:08:48 +0000
Message-ID: <2vxz4id3wgu7.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Nov 13 2026, Chris Down wrote:
> Pasha Tatashin writes:
[...]
>>> Today the collector would have to sum kho/out/bootmem_len in debugfs,
>>> which isn't a userspace ABI. In /proc/meminfo, free bootmem contributes
>>> to CmaFree, but the reservation doesn't contribute to CmaTotal. The cma
>>
>>Is this a different bug?
>
> I think so, yes. Bootmem pageblocks are MIGRATE_CMA, so their free pages are
> counted in NR_FREE_CMA_PAGES, but totalcma_pages only counts the areas that
> mm/cma.c knows about.
>
> zone->cma_pages is a separate problem. It only gets bootmem added by
> init_cma_reserved_pageblock() in kho_init(), and on a KHO boot we return before
> we get there.
>
> I can send patches for those separately if you agree that bootmem should be
> counted in both. It wouldn't give us the bootmem size though, because CmaTotal
> would still include any other CMA areas.

I have a internal bug assigned to me to fix this. It would be great if
you could fix it for me. I'd owe you a beer ;-)

On cold boot it is pretty easy. Call cma_init_reserved_mem() on each
bootmem region.

On a KHO boot it gets tricky. Not all of bootmem is CMA, since some of
it is given out to early boot allocators like memmap. So we need to
count the pageblocks that we mark as MIGRATE_CMA during MM init. And
then update totalcma_pages directly, which already sounds kinda iffy.

Plugging the accounting directly into kho_bootmem_migratetype() might
work, but I don't like giving it a side effect. Maybe we do it directly
in pageblock_migratetype_init_range() and __init_deferred_page()?

None of it is super elegant and I never got around to figuring out
something good.

>
>>I have some concerns about exposing this as a stable API. What if we get
>>rid of bootmem or make it resizable? We only recently renamed it from
>>scratch to bootmem, and we have been exploring for way to optimize it.
>>
>>I would keep this exposed under /sys/kernel/debug/kho/bootmem_size for
>>now, and not worry about it being stable.
>
> That's fair. I'll move it to /sys/kernel/debug/kho/bootmem_size in v2, and we
> can look at sysfs again once bootmem has settled down.

Is it really that hard for your collector to sum up the areas. I don't
mind this change since it is in debugfs and very simple, but I'm curious
if you really need it.

[...]

-- 
Regards,
Pratyush Yadav
