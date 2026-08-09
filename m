Received: from sender-pp-o91.zoho.in (sender-pp-o91.zoho.in [103.117.158.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081B137DABC;
	Sun,  9 Aug 2026 22:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=103.117.158.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786314030; cv=pass; b=lWkgyZ6nOSrpAf3raA+lKX48XYTx5JN6qki7jvsbNAzQmPjqDKENf/EB3QJeJkWFAINMfjkyHMZoNBFhzTNkrF7WFR2k1bIqQ6+uh16YC3H8YpdgbU+vtquiluhEdr6ZkUtxeQtuzvAnEnuWfGloRJwx63C9BxEeZpZWAK0R31A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786314030; c=relaxed/simple;
	bh=oTcuUZxcxISO0aAUWAXTc3j9NOFEs7LhMPL2CTcVwQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xz/fqfb6hLvTEUv1M9EME9bM94Zz/MwMGzrQkhFIJkG/p1KWM/VdpfXr//34qXpwx4+Ak5yyo1hYqR4cBBl14+sICrTo69gjG3WaQCjH2i3RAo17o31P29BtK4RjpEO7ClACF8tBH+JDyYmlpl8OB0wZtmIohBNK8fRKfnmsVXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in; spf=pass smtp.mailfrom=zohomail.in; dkim=pass (1024-bit key) header.d=zohomail.in header.i=shivamkalra98@zohomail.in header.b=ouv34i1w; arc=pass smtp.client-ip=103.117.158.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.in header.i=shivamkalra98@zohomail.in header.b="ouv34i1w"
ARC-Seal: i=1; a=rsa-sha256; t=1786313956; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=NQCq8XmOE6qKoO22GjVXqQTOR2Sp+vKAmkW5pvVfbl9swnWfzKI08lhQevogBp3dxvlN4IIhAAi1tySJtyUmtP03p5zjOIVRgn3TcgBX0sh08uaHVT9Vt87Cdn3K8oTF+XoO62mbIFkr8o+OKIDQDK5bXZuzXJ3HFgaRgVHZpl8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1786313956; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TCth6d4HKGfZUrSI82mfMkVa2dz4/Lsd/fle9sOPtXY=; 
	b=VCf4C6/taSAoFArzTNsEpCWwCs+69Ft/yY5kKM7Fm+LVA6dQqnWK4y5Ti4C4Kxyk4oCB51txZR6iasU01adNfooryf6XUTlUbJ1drFX0kEHm3CQVLNFKR0XJNyU4uIryr6zoLJgNr6GYgEo5hM99p64BZGDC9iDnM56lOGhieSQ=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=shivamkalra98@zohomail.in;
	dmarc=pass header.from=<shivamkalra98@zohomail.in>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786313956;
	s=zoho; d=zohomail.in; i=shivamkalra98@zohomail.in;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=TCth6d4HKGfZUrSI82mfMkVa2dz4/Lsd/fle9sOPtXY=;
	b=ouv34i1wGWg+xIW6QEo3g6/D+Vn0pM/fW9jaX6lcCwZVpttuqdKa3t/gEF6OdCN1
	UZCLr7ug9QRIFZ4KZ2SXjlQZDXpT53bPnybfavafr7WaA0eIsqnBZ9Sh+P3Mb/6dtrt
	3KpqGKyOudNRI/qhJ/7uoZelGE8YXB42X+7Dj9Yo=
Received: by mx.zoho.in with SMTPS id 1786313955272460.28314754096664;
	Mon, 10 Aug 2026 03:49:15 +0530 (IST)
Message-ID: <da382f96-2da9-44ff-b1cd-1e087c93b110@zohomail.in>
Date: Mon, 10 Aug 2026 03:49:14 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] mm: support splitting mappingless swapcache folios
To: Zi Yan <ziy@nvidia.com>, Kairui Song <ryncsn@gmail.com>
Cc: Kairui Song <kasong@tencent.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <shuah@kernel.org>, Nico Pache <nico.pache@linux.dev>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260805-b4-mappingless-swapcache-v1-0-b1d78ba257ca@zohomail.in>
 <590B3189-5B66-4ECB-84CD-7B7EF18C0E54@nvidia.com>
 <anNOroQdjQh7xmU9@KASONG-MC4> <DKIRYOJXLIYN.32KI06POZL7SY@nvidia.com>
 <anZLkwwxHdhM2M2Q@KASONG-MC4> <DKJQ3G2MCOGS.7T7QJ4TDZWG1@nvidia.com>
Content-Language: en-US
From: Shivam Kalra <shivamkalra98@zohomail.in>
In-Reply-To: <DKJQ3G2MCOGS.7T7QJ4TDZWG1@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 08/08/26 22:32, Zi Yan wrote:
> On Fri Aug 7, 2026 at 5:22 PM EDT, Kairui Song wrote:
>>
>> Hello,
>>
>> Thanks for the reminder, I got a bit busy so delayed for a day on that
>> RFC.
>>
>> For this series I think it's functionally fine, just the split logic is
>> a bit complex to follow and we still have restriction on swap cache
>> for order 0 uniform split only. I'll have a closer look later. Also
> 
> I agree. I wonder if it is possible that a shmem in swapcache could
> enter non uniform split, folio_split(). With Patch 1,
> folio_check_splittable() will return -EINVAL, causing a WARN.
> 
> Hi Shivam,
> 
> Can you check the above issue? If it is possible, we want to avoid it.
> 
>> let me know how you think about that RFC.
> 
> Sure, will take a look.
Hi Zi,

I checked the current folio_split() callers and this does not seem
possible.

The shmem swapout path unmaps the folio before clearing folio->mapping,
with the folio locked. The non-uniform split callers either get the folio
from an address_space or from a present page-table entry, so they cannot
find a mappingless shmem folio in swapcache.

The memory-failure path uses split_huge_page_to_order(), which performs a
uniform split.

So I don't think the WARN is reachable with the current callers.

Thanks,
Shivam
