Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2934F29D26E;
	Wed, 24 Jun 2026 03:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782272245; cv=none; b=AF/W+htF0HFmBB9Pg6nCa1KiWsyDwxftWoCLMKX6d11etnuDkgQJzZEub9fhFpFnJG5w1JKcl7/fiNucX9u6MBE6f2L+HUE+Sz5RXKJmvQigObXlgUAj0hGjNoJ/MXZ7eciy9xlHbA/5KvnR7GNJLuXu5f8fqDZyYCNeSZKQaFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782272245; c=relaxed/simple;
	bh=63Sc0l5i/6qElBY5ztCt9gpTg0pOkkt4ErSNCdlGjKU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PGQ1vUTkD7aE2VbiydwgOYOzFM/GwCr6wh8hG8YJwZ1w8zjptPvpUvLqkajvJsWsmRl4P9I3toP/m7Bm5138e9iBUg7NiGlAXyLcB2hhGqVmJ+f36st/SaYewlHhIiXJf2xyF2dIbqFIHJ6mv2UJIGCjnhur41tCq5CIe7laW5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=noeC84Wc; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="noeC84Wc"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O1mHq43795541;
	Wed, 24 Jun 2026 03:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=63Sc0l
	5i/6qElBY5ztCt9gpTg0pOkkt4ErSNCdlGjKU=; b=noeC84Wc/ABy8GjePXbent
	UxmyEw53aFlLYsodx70ePxdZ+T1cnFjpCBmB/DAII4kHbePE12tV9Ne9s2I3ZcOn
	tbGv4i/fvW7UnbYq5JrWdyHMqi6WE+yNU+g7yMDuMJwF0I25/2SqQKq0EsnbLZ67
	bz41BrH4o2y3jAOsNXxV00oawBXW3bmekESOnSDb/cJaIvikp/ffsCinv2PPxf5m
	CF+30skTutpUn4OMXwbb4icjtHtHJDwivA9dkOhP5vwE5rL+QajfbO6rQY42UeFg
	bq+Uu37xE0JFQqjUHa07OGBkiRlNxmjw1qia8Bw+V5INoDGxuPZZ417YjAuxvRLw
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewjc3j57b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jun 2026 03:34:25 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65O3JhWS011946;
	Wed, 24 Jun 2026 03:34:24 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ex6phek39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jun 2026 03:34:23 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65O3YJiS43516404
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Jun 2026 03:34:20 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C72B520043;
	Wed, 24 Jun 2026 03:34:19 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 88F0020040;
	Wed, 24 Jun 2026 03:34:14 +0000 (GMT)
Received: from aboo.ibm.com (unknown [9.39.19.145])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 24 Jun 2026 03:34:14 +0000 (GMT)
Message-ID: <67f6be911aba36393327a9e88285e2237d3e6032.camel@linux.ibm.com>
Subject: Re: [PATCH v3 1/3] selftests/mm: allow PUD-level entries in
 compound testcase of hmm tests
From: Aboorva Devarajan <aboorvad@linux.ibm.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        Jason
 Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
        David
 Hildenbrand <david@kernel.org>,
        Lorenzo Stoakes	 <ljs@kernel.org>,
        "Liam R
 . Howlett" <liam@infradead.org>,
        Vlastimil Babka	 <vbabka@kernel.org>, Mike
 Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan	 <surenb@google.com>,
        Michal
 Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
        Ralph Campbell
 <rcampbell@nvidia.com>,
        Matthew Brost <matthew.brost@intel.com>,
        Alistair
 Popple	 <apopple@nvidia.com>,
        Alex Sierra <alex.sierra@amd.com>,
        Matthew
 Wilcox	 <willy@infradead.org>,
        Sayali Patil <sayalip@linux.ibm.com>, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, aboorvad@linux.ibm.com
Date: Wed, 24 Jun 2026 09:04:13 +0530
In-Reply-To: <aivB1jLODH1W_0yt@parvat>
References: <20260611034102.1030738-1-aboorvad@linux.ibm.com>
	 <20260611034102.1030738-2-aboorvad@linux.ibm.com> <aivB1jLODH1W_0yt@parvat>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=X4Ni7mTe c=1 sm=1 tr=0 ts=6a3b5041 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8
 a=Wyop5lsuorlMe83hQoQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDAyNSBTYWx0ZWRfX9RgGLbA9Dccc
 f5/iif8qjlwElA8ROthnkHNcGOKruIvI10EeK1pZK72U+Tjz4DOHdR7Z8u4O4fGVMeLKX1DznRy
 RWAKqqdjDJ77u0tOM5zUPYxJLMM5wNg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDAyNSBTYWx0ZWRfX02bQh1+jYxF+
 AAi41vXhMpXNsp9c/J79reJTKeHck2tnvEIOdQ3a3Rd0CIfKxTkWX/jXyx1p34DmeoOr9zY2KXm
 LG9OOVjt66GvCZbu6zCeWmF0GzmphQ1cW2QDkWRnrnHd/FYjGV3LeMakSjbHSKho5QMwja8oU/Q
 J3Bh8lzvCB5DUOF93CErEiHQZuql1jAqERXyobm1YUQaoljDFfcyxk91Stn9CMCzB+pqEJ6AiX8
 LoLRwWNz6spcGt71mhls7NLFjS9JCN4m9BcXL3M7U4BhSVMB16AgDFgwUIEQWRaVZOr0xGz69H5
 7VND1MSbdQupXP7e1E0c9L17G0WsRDCj70pzYisjxT5nWQ+1L8Mi+SBmxJD1i4Gg8q0nA0KhHTO
 ob9lOUpI66ulmyB9OaDN50jPlbkqXg==
X-Proofpoint-ORIG-GUID: pXqvllcblYHJ-VIoONnVIg4_ikWuQb4P
X-Proofpoint-GUID: zwwj86c6l4sSSUImOFuNQTatUl24CtpG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_01,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240025

On Mon, 2026-06-15 at 10:16 +1000, Balbir Singh wrote:
> On Thu, Jun 11, 2026 at 09:11:00AM +0530, Aboorva Devarajan wrote:
> > From: Sayali Patil <sayalip@linux.ibm.com>
> >=20
> > The HMM compound testcase currently assumes only PMD-level mappings and
> > fails on systems where default_hugepagesz=3D1G is set, because the regi=
on
> > is then reported by the device at PUD level.
> >=20
> > Determine the mapping level (PMD or PUD) the device reports for the fir=
st
> > page of the range and require every page to match that level exactly vi=
a
> > ASSERT_EQ(). This accepts PUD-level mappings while preserving the
> > expected/observed protection values printed on failure, and rejects a
> > fragmented mapping that mixes PMD- and PUD-level entries within the sam=
e
> > range (which a per-page OR check would have let pass).
> >=20
>=20
> PUD is not supported with zone device private folios, the fix should
> be really around default_huge_page_size(), using the default pmd size.
>=20
> Balbir


Thanks Balbir for the review.

IIUC, PUD not-supported restriction applies to the migration path
(device-private folios top out at PMD), which the migrate_* tests cover but=
 compound
is purely a snapshot of the CPU page tables, where a 1G hugetlb page can
shows up at PUD. I guess HMM_DMIRROR_PROT_PUD was in fact added in e478425b=
ec93
(the same commit this patch Fixes:) to express PUD-sized snapshot entries,
so handling it here is using the bit for its original purpose. I verified t=
he v3 patch
passes on a default_hugepagesz=3D1G boot (m[i] =3D=3D WRITE|PUD), and fails=
 without it.

But if you'd still prefer to keep this test-case strictly PMD-only, please =
let us know.

Regards,
Aboorva
