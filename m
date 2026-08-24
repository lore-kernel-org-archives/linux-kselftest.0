Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946D0369D45;
	Mon, 24 Aug 2026 18:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.143.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787596352; cv=none; b=RBekvaPCKIrL9xR9ImXUR9Afrm0RODylV6DKKw8rG/qGwTNYhlYX8nEi31gGsbIUlp7zaKetyBLhg+KxVxBAgVAh4/QQoHjS8toP4Ol0JqeYyRMZHa1o4yfkCtoHb+2nagDxcav3w8qVwQPYnZ4Cwh2Xs4a7J6UA5z5j7OF3nVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787596352; c=relaxed/simple;
	bh=F1hD0YXmzNWa4tbixReu3tFoSzCcSvSrhkajv4t0ojM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=de0+jGGXIPeGNtXiyIOB4Iq6ECwQ1viHbEKE7Apv22Bk1H3EOclPKorbpynxHGF4z3DtoBWAKuwp+XdclnhxHTBOqBrZO6ddKqMQ6dtvA0mnHJB0WiZUZU3N0VQcl3W9CQWGkI++GNyMmGhlztmE2DSjErtP4NXJgEdkyNHpwjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=jwd4kc+/; arc=none smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="jwd4kc+/"
Received: from pps.filterd (m0134423.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OFllYu3126801;
	Mon, 24 Aug 2026 18:31:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps0720; bh=dTgLwMTzne+xNna2gstnLVyAmc
	Vmelz+lcqZmF36Kqs=; b=jwd4kc+/A/6y5lqMApvXmdgJCE6xM2XPgZrxohHn3V
	vDpxNRSdhzMZHSyyti6m7bUEwW4mx93exJbJ5qKurygrzxgWdsnVNbSYaogvxfyb
	Xi8GMfzEvR9SnxZqV0bHQqwZ5YKTEN37stj6aUw1h3ugoxtNT0OQ7GYFxXj7dgew
	LaPxmbUc8OR1wZl201FewYq2mlHI1T3g9HD3Glc+PlPCITOjj0+amZ2nujSm3QKh
	GXL8RpkjgYkuY+Wx6cUyMjWzj69NUoPkCXXWjhtQCuMnUT2Bm8FrTpm8wDkjGgSN
	ZjUO6FvLKuWwE7QYwwBRgA5+6bAF5cTb4ix96KCfac5A==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4g8q2nv49f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 24 Aug 2026 18:31:21 +0000 (GMT)
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 66225800236;
	Mon, 24 Aug 2026 18:31:20 +0000 (UTC)
Received: from HPE-5CG20646DK.localdomain (unknown [16.231.227.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTPS id 7B7C9800EF7;
	Mon, 24 Aug 2026 18:31:17 +0000 (UTC)
Date: Mon, 24 Aug 2026 13:31:15 -0500
From: Kyle Meyer <kyle.meyer@hpe.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Shuai Xue <xueshuai@linux.alibaba.com>, Liam.Howlett@oracle.com,
        bp@alien8.de, corbet@lwn.net, david@redhat.com, hannes@cmpxchg.org,
        jack@suse.cz, jane.chu@oracle.com, jiaqiyan@google.com,
        joel.granados@kernel.org, laoar.shao@gmail.com, linmiaohe@huawei.com,
        linux-acpi@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-mm@kvack.org, lorenzo.stoakes@oracle.com, mclapinski@google.com,
        mhocko@suse.com, nao.horiguchi@gmail.com, osalvador@suse.de,
        rafael.j.wysocki@intel.com, rppt@kernel.org, russ.anderson@hpe.com,
        shawn.fan@intel.com, shuah@kernel.org, surenb@google.com,
        tony.luck@intel.com, vbabka@suse.cz
Subject: Re: [PATCH v2] mm/memory-failure: Support disabling soft offline for
 HugeTLB pages
Message-ID: <aoyN8-ak5MdMIwRn@hpe.com>
References: <aMiu_Uku6Y5ZbuhM@hpe.com>
 <0d2fc2ab-333e-42a1-88a1-6bb85538cbb0@linux.alibaba.com>
 <aoyFK92azAlDAPuF@hpe.com>
 <20260824112005.856732bac3094b62a430d17c@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824112005.856732bac3094b62a430d17c@linux-foundation.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDE1NiBTYWx0ZWRfX4POZUMYyd648
 PXlE5egxtKLsgB5kDgcaXQqcmlk8D41x5iJMetT5e/wAilsXl2C9G/Rl4vHqpAV4xnd6oFSLimd
 P8EvBvONjQg8gzrY6Q7jK+ydmGl3dr+ET31iWSvGIV/MyaTXQhCTc7xdSNOsqw70xR6Mlp5fzHl
 58AKF3k/3JAcPv+gVqZjhojSQ6XZf/+ydPGgX8YvxL1CGdK0sdagR7c9TWuYSgofb/Nj381wnsI
 uIeLHcrxwUpQ14Gli4jrBfHZHrC4kHikhY0NLDGEIDCbYGRoHa1dZO1hOQ0lvMbC5Ojp/Q44v3m
 QrqhUGzvBeHUYnrHAKvfggxWwKkFIHT9KPP4M8/AStaN6sSUFieCxFvFbmPtmRwm8Oyafg2KF43
 wCtakXil2LeWtXIirTCTu9NfKrLfAAIZhMN4x+rYOYD9gXp79M7GFtMkiKzUOYu/AV6teTiEmdf
 4rH2+KyZNxe+h8xf1dA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDE1NiBTYWx0ZWRfX6uJwKZTqlCCt
 aAMwZuLwgEvQ2nA4oj2lQf2s+6p4Llk+ODrr613WTamS5s5RPx5nX2EHyXLHTkSHRpbnDSXXPla
 w8OYJzpKv6ZRiX8aXgB540JvLUIlqKs=
X-Authority-Analysis: v=2.4 cv=FbUHAp+6 c=1 sm=1 tr=0 ts=6a8c8df9 cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gQcMVamqm3wCPoSYhaRC:22 a=g3u0LPWLDYfGfufhFw6-:22 a=VwQbUJbxAAAA:8
 a=MvuuwTCpAAAA:8 a=mUo24Y9Byt_vt3lN3ZMA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: DJZXb0Uwd6wLKdcdI_s2ylsQLCyv5-HC
X-Proofpoint-GUID: DJZXb0Uwd6wLKdcdI_s2ylsQLCyv5-HC
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240156

On Mon, Aug 24, 2026 at 11:20:05AM -0700, Andrew Morton wrote:
> On Mon, 24 Aug 2026 12:53:47 -0500 Kyle Meyer <kyle.meyer@hpe.com> wrote:
> 
> > On Thu, Aug 20, 2026 at 11:47:11AM +0800, Shuai Xue wrote:
> > > Hi Kyle,
> > 
> > Hi.
> >  
> > > Following up on this thread. The v2 patch once landed in akpm's mm
> > > tree (9ae6eefa4b6b "mm/memory-failure: support disabling soft
> > > offline for HugeTLB pages"), but that commit is now not reachable
> > > from any branch, and mainline as of v7.3-rc1 still only has the 0/1
> > > switch in /proc/sys/vm/enable_soft_offline.
> > 
> > Thanks for pointing this out.
> > 
> > Looks like this patch was added on 2025-09-16 [1] and dropped on 2025-11-11 [2].
> > 
> > [1] https://lore.kernel.org/all/20250916032512.AE588C4CEEB@smtp.kernel.org 
> > [2] https://lore.kernel.org/all/20251111231818.52A60C16AAE@smtp.kernel.org 
> > 
> > I must have missed the second email.
> > 
> > I don't remember discussing a v3. Can someone please remind me what we planned
> > to change or whether there was another reason it was dropped?
> 
> I interpreted the (lengthy) review discussion to mean that a new
> version was to be sent out.
> 
> > > The underlying issue discussed here is still unresolved for us:
> > > firmware reporting per-rank corrected error thresholds via GHES
> > > triggers soft offline of huge pages, which neither addresses the
> > > failing rank nor is acceptable for workloads that rely on stable
> > > hugetlb physical layouts.
> > > 
> > > Do you still plan to send a v3, e.g. with the disable-bitmask
> > > layout Anshuman suggested upthread?
> > 
> > I wasn't planning on sending a v3 but I'm happy to revisit if needed.
> 
> That would be best at this stage - please review the changelog to see
> if additional details should be added to cover the considerations which
> were discussed.

Thank you for the clarification. I'll review everything and send a v3.

Thanks,
Kyle Meyer
