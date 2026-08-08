Received: from sender-pp-o91.zoho.in (sender-pp-o91.zoho.in [103.117.158.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E9D33ADB1;
	Sat,  8 Aug 2026 15:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=103.117.158.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786203219; cv=pass; b=YpqkJyBDfV+0G8VBS40sc0oRrr9q+BwUX/b1YaafmHOS2XuKj6ymzvP0cY+Lipps+hgnnmXv8LKpN5DjmZjyvHcFuBc6G22KuhEw3ABXTUcmH3R3fEpQNwcDLeiw7XqCdHG5Z/SXOvicd+0lBddWI4AiIsBEcHVfNSNmEDY53uw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786203219; c=relaxed/simple;
	bh=vBE9QDMYlEy4hGZLT0RwN5rvyo0b7qG9j+dcATuXzuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V0kGCEHvAfckDnBqNLhY+PKRezAv+9FQmVnucaet52BYIePwdWDuIW94/NggmSnIj8/jqSIi8ifBu5g58VFk5ZTBNvcqkhh93o+PzilfDrWWADstHOwgC5qrInQyKK5FdvQD2+//JBYkpSVxqwyN48Gx7AldUNu/EtxORe36eYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in; spf=pass smtp.mailfrom=zohomail.in; dkim=pass (1024-bit key) header.d=zohomail.in header.i=shivamkalra98@zohomail.in header.b=M10L/EjE; arc=pass smtp.client-ip=103.117.158.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.in header.i=shivamkalra98@zohomail.in header.b="M10L/EjE"
ARC-Seal: i=1; a=rsa-sha256; t=1786203153; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=IUWinNYQ6tmUb0p1UpWmaAFZzUrwKtg5Paz9gimUkDNtIdCGYYB3ljb/s/s/BHjWET3XfbyBtI8fIZMsyN+JBtmom/gyC3ShZOv1o9+1arSyG1rPAEhDzgslrGhlC5N8s6OgXz7aHVHkokxg247jC1NeXVlNHXrinAjPj7AaRJI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1786203153; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vBE9QDMYlEy4hGZLT0RwN5rvyo0b7qG9j+dcATuXzuU=; 
	b=JtPYisYciEJVTSUHml4xoXxaVZAOO99Oa9aUkmRSsC0mMLhl8DiWzFTg6XCVEk0KAuL3rUUHaG5R3kkurVtQ03w0MeHmruceOeGkwdLahOJESfXUqu/nDrppvfavbwJ+z8jiFy1NVitxrAnjXyyg25/4Qfzkq9Mc65PNKZcrINE=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=shivamkalra98@zohomail.in;
	dmarc=pass header.from=<shivamkalra98@zohomail.in>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786203153;
	s=zoho; d=zohomail.in; i=shivamkalra98@zohomail.in;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=vBE9QDMYlEy4hGZLT0RwN5rvyo0b7qG9j+dcATuXzuU=;
	b=M10L/EjE3vD42kohUexzJciqpDldPZ0wYTcnLuGjAqfUMacqQRy6kl+ZHVrlWoqB
	WQdC4mwj+1tYvzXg5jpOAGxNm/gslePvE03GzcGKa3C7I0Y/s1osD09uofWJl78lsiU
	H+2qS/THkvJWkrDWypR1EV/ssT4UaXc4tYKdyBuw=
Received: by mx.zoho.in with SMTPS id 178620315259581.6263347714123;
	Sat, 8 Aug 2026 21:02:32 +0530 (IST)
Message-ID: <c0c5f2c0-fd90-4ed8-9c49-7499dc56fcfc@zohomail.in>
Date: Sat, 8 Aug 2026 21:02:31 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mm: add KUnit coverage for mappingless swapcache
 folios
To: Kairui Song <ryncsn@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <shuah@kernel.org>, Nico Pache <nico.pache@linux.dev>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260805-b4-mappingless-swapcache-v1-0-b1d78ba257ca@zohomail.in>
 <20260805-b4-mappingless-swapcache-v1-2-b1d78ba257ca@zohomail.in>
 <CAMgjq7BW_n3HpM=mCGn=q90=4+oXcBLWwZewxvEcwqfzjuewOw@mail.gmail.com>
Content-Language: en-US
From: Shivam Kalra <shivamkalra98@zohomail.in>
In-Reply-To: <CAMgjq7BW_n3HpM=mCGn=q90=4+oXcBLWwZewxvEcwqfzjuewOw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 08/08/26 16:40, Kairui Song wrote:
> FOLIO_SPLIT_KUNIT_TEST seems a generic test and not limited to SWAP,
> but it relys on SWAP, looks a bit strange to me.

Fair point, the naming is misleading. FOLIO_SPLIT_SWAPCACHE_KUNIT_TEST
would have been a more honest name given the scope. I'll fix this if
the KUnit patch is kept.

> Faking a swapcache with folio->swap == 0 looks hacky, could go very
> wrong if you do any actual work on it.

Agreed it is fragile. The reason I went with this approach is that
setting up a real swapcache folio in KUnit is quite difficult.

> Hmm... you are just testing the gating, not the actual split, that
> makes the test not very meaningful I think. And we should not block
> non-uniform or high order split for swap cache after sorting things
> out, then this test will be doing nothing :)
Same reason, testing an actual split in KUnit would require the
full swapcache infrastructure that is hard to mock up. The gating
check is what this patch actually changes, so it felt like the right
thing to cover in a unit test. The real end-to-end split coverage is
in patch 3/3 (split_hwpoison_swapcache selftest), which goes through
the full memory_failure() -> split -> swapin path with a real swap
device.
That said, I take your point that once higher-order and non-uniform
splits are unblocked for swapcache, these gating assertions would
become stale. I'm happy to drop this KUnit patch for v2 and send
just patches 1 and 3 if you think the selftest provides sufficient
coverage on its own.
On the broader question, I'd be interested to see your RFC for the
swapcache split cleanup. Would you prefer that I wait for it before
sending a v2, or would you be fine with the smaller two-patch series
(core fix + selftest) going in first to resolve the TODO?

Thanks,
Shivam

