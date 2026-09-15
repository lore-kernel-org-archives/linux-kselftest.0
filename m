Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B9649E5E6;
	Tue, 15 Sep 2026 17:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.147.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789494980; cv=none; b=DB8NlwizsfdHQDYCC2tybaTcg9dV6M7Uf5a/XHEbo2TdU+nROr4yYXcTPIUQfTr9G0ihyb6MVTsAHxHIHsh0WEmWWzubyB3XiT198SH+Ee6qEsEYGxDnhYHS7eW/yIXKiksgUbDJUfXCl6uDgKC1SY7KNGgPmI8EB/6TnDbxgCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789494980; c=relaxed/simple;
	bh=EwzSM2YpKfya0JXRveWZ69rYR1xw5kgFdDFZ8hLc6HA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IIPXy0gSGUhChIq94CbuID7ItJHmRK71c23nHUqBiFdBbkhvEJHXtT9lz/KnjBrB2zsXFeJxelCam5q5hQC/IY0kH+DZ9L9KYagxaBAQVa5xUrIUTcq8O5MXdNJNVjNKElRSE6Nc8hdrdlpqCjwZELOJn5n4qsDseyx7n9+pUAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=JtkvPdj9; arc=none smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="JtkvPdj9"
Received: from pps.filterd (m0150241.ppops.net [127.0.0.1])
	by mx0a-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FHsVqr2942025;
	Tue, 15 Sep 2026 17:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps0720; bh=PNlXKXX5IyXBrJN4ylgfbuPEUG
	zQwPHtOwfHhk/bIe4=; b=JtkvPdj9EgRpDPcHrWl7UiRg4FD51sG7bJwVBqU6NW
	Uf9ZBrOUOIdWZdWKf3O6D1LdCvuCCfHBVsothhkDzcEQvQqpUa+X3DE2tXlkrmaq
	TwHA1tHiyDDO39sk9SEBf3lo8SVxRGAdRe/PmOH1oG2U32Ew1HRH3/0SvQnq+ooO
	K2eGSGVE35K+NtUNjDt9OOnemYoYORplPC7JhdkdpeH9DTdCYMi3Gziqdeq3MRUw
	O5s18X3g6ws5CMnEnGIjZAuhE5rAO37Xlpzok4myiSzSteUdQL3O4OYsdgwNOqRJ
	wJibhZ7YuJ/A1lYAxITpmgTpsQD3Am432oLyRbNyZ3hw==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 4gq95pstj8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 17:55:12 +0000 (GMT)
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 6BD1312EB9;
	Tue, 15 Sep 2026 17:55:11 +0000 (UTC)
Received: from HPE-5CG20646DK.localdomain (unknown [16.231.227.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTPS id B4FBC805E88;
	Tue, 15 Sep 2026 17:55:06 +0000 (UTC)
Date: Tue, 15 Sep 2026 12:55:03 -0500
From: Kyle Meyer <kyle.meyer@hpe.com>
To: Michal Hocko <mhocko@suse.com>
Cc: akpm@linux-foundation.org, corbet@lwn.net, david@redhat.com,
        linmiaohe@huawei.com, shuah@kernel.org, tony.luck@intel.com,
        jane.chu@oracle.com, jiaqiyan@google.com, Liam.Howlett@oracle.com,
        bp@alien8.de, hannes@cmpxchg.org, jack@suse.cz,
        joel.granados@kernel.org, laoar.shao@gmail.com,
        lorenzo.stoakes@oracle.com, mclapinski@google.com,
        nao.horiguchi@gmail.com, osalvador@suse.de, rafael.j.wysocki@intel.com,
        rppt@kernel.org, russ.anderson@hpe.com, shawn.fan@intel.com,
        surenb@google.com, vbabka@suse.cz, linux-acpi@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3] mm/memory-failure: Support disabling soft offline for
 HugeTLB pages
Message-ID: <aqmGd0GGUCkbZpkZ@hpe.com>
References: <aqiIEkrc6aDBOqRg@hpe.com>
 <aqkCbgHmMGxI_GLG@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqkCbgHmMGxI_GLG@tiehlicka>
X-Proofpoint-ORIG-GUID: ZGyhASJQPrkZtald6s-qe-XaJzb3rLwu
X-Authority-Analysis: v=2.4 cv=SJ3Xx+vH c=1 sm=1 tr=0 ts=6aa98681 cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gQcMVamqm3wCPoSYhaRC:22 a=_ZmgHqWwjZUDpi_pur5s:22 a=VwQbUJbxAAAA:8
 a=MvuuwTCpAAAA:8 a=OCHxr62PC90mTwIpeikA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI2MCBTYWx0ZWRfX/bF3jfMe5L2R
 j63mU1nIBKQUtxaBXijRxEhjpUkMVc4zIvOsjeAo1gXa6d8EaQ3zY67L76NuqyOpj1PqfHtArmO
 2vl0Zj/ywj1xKqs1a/mzZMNwlkOXYrqejAwJQ505r93PdMuHej9YKGoy+OOhjdgIGcbnHU5kPaU
 yvvrSCWy5ejLgHtdaE3GjSon0dkRbhoyLPGlPM5ivm10iaII7ndWeW/6v4Wb+WicsOGN6iGbq5y
 TmACnEazHYCmP+PBiUKK1AlL2cSjGIx6qbmqEPScHv5nRJqfghhw+WYCVTjioKj934H6QVwbEyn
 +l7ofYSeMOrVz1JhspzsrFr1N4lD/2CI+O885v1QKv5nzT3CrROQPCxW5DGn1rcxZV1AAEnv7EB
 8HBx6GOAVf7DeSMdD7b3ATQFGeRAgDSkWYdpFHxj64RkQev4NJH17HwCiED+iffIRQ5Flebq0JV
 zWia0hniMaXW7l/WWHg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI2MCBTYWx0ZWRfX63h0+WaHo6KX
 o28u0TT4xIFnPPwvxBVPnt73ZCm6PXqMR4K+TANuw3CaFV5L9FIl2AQlI4GVDKvAEj81K9dRKGJ
 DaYbaSq0UXlb+dnZCcP9Cbxr0DS1x+w=
X-Proofpoint-GUID: ZGyhASJQPrkZtald6s-qe-XaJzb3rLwu
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150260

On Tue, Sep 15, 2026 at 10:31:42AM +0200, Michal Hocko wrote:
> On Mon 14-09-26 18:49:38, Kyle Meyer wrote:
> > Soft offlining a HugeTLB page dissolves it, permanently reducing the
> > HugeTLB page pool. This can be problematic for workloads that depend on
> > a fixed number of HugeTLB pages.
> > 
> > Currently, soft offline must be disabled to prevent HugeTLB pages from
> > being soft offlined.
> > 
> > This patch allows soft offline to be disabled for HugeTLB pages while
> > remaining enabled for non-HugeTLB pages.
> > 
> > Commit 56374430c5dfc ("mm/memory-failure: userspace controls
> > soft-offlining pages") introduced the following sysctl interface to
> > control soft offline:
> > 
> > /proc/sys/vm/enable_soft_offline
> > 
> > The interface does not distinguish between page types:
> > 
> >     0 - Soft offline is disabled
> >     1 - Soft offline is enabled
> > 
> > Convert enable_soft_offline to a bitmask and support disabling soft
> > offline for HugeTLB pages:
> > 
> > Bits:
> > 
> >     0 - Enable soft offline
> >     1 - Disable soft offline for HugeTLB pages
> > 
> > Supported values:
> > 
> >     0 - Soft offline is disabled
> >     1 - Soft offline is enabled
> >     3 - Soft offline is enabled (disabled for HugeTLB pages)
> > 
> > Existing behavior is preserved.
> > 
> > Update documentation and HugeTLB soft offline selftests.
> 
> This is adding a lot of user interfaces to control something you can
> disable by config option for an admin only functionality.

I may be missing it, but I'm not aware of a config option that disables soft
offline specifically for HugeTLB pages.

> I fail to to see any actual justification for all of that. If an admin
> can disolve a hugetlb page it has power to allocate a new one as well.

Allocating HugeTLB pages after boot is not guaranteed.

> Not to menation that the whole soft offlining is mostly a testing
> feature so adding a lot of fine grained configuration space seems
> excessive to me.

Can you elaborate on "mostly a testing feature"? For example, how does that
apply to the BIOS/GHES path discussed here?

https://lore.kernel.org/all/aMkOCmGBhZKhKPrI@hpe.com

If you think this should be handled differently, I'm open to suggestions.

Thanks for the feedback,
Kyle Meyer
