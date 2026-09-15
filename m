Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283F9303C97;
	Tue, 15 Sep 2026 01:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.147.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789435127; cv=none; b=GFtopZ/1VGqMF03/U7WW/Lbub4qhul6lFlY3NLqalTVUNoo3CNhDjhVIBcfygfsqAb4Q+1YUlwCWSPim9LpWHgQxWN51tIC/u0tAgeGyubXl0zql9SZfOqQc7MuPV9oVvitRLj0OnQ1vDqO8xgSBgq6Xlt7NjzzQkvVZr5yu+RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789435127; c=relaxed/simple;
	bh=XD0cqZXnDU5BH5AH6gAr8KsRREQSPgxoCdth75mTNyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A56E+gTNNQLhwvAMNrn9G9KPfSGelrmelNIztYwuuzpVXi6R6+TMYYfyc4IbiOzE0421Vbo4FlEjoNf2ZcybXh/NPdngdqPpSfb8ewWVbTJcCgn76kAA1mgflagOS9LgB1+co+G3ZuXC50TEME+nUqThMykT1Oc6dzx6GJCwZms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=oHRZ7SjR; arc=none smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="oHRZ7SjR"
Received: from pps.filterd (m0134422.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EN3pS43403440;
	Tue, 15 Sep 2026 00:57:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps0720; bh=OS259iErZnBxTgbybAxhMxIa2S
	Cl4Sz3q64JgdnS2yg=; b=oHRZ7SjRZFoWlHuqcXVhmfDJ0wGKX+/3mpgx0AfSCG
	zyvpc5MC3hwNTiLzQDrzBIcuzozkvFEuZ2U0h3QlKnj6bu76KZiuB95M40+5Zdvi
	sMZvrP4xkB/agoUhMwd92aKH/pFhyeEf9PGN9KBBy+IG0WFQJm9Ue1306kpaZJMt
	sAJCVikyL/DAIgbkMcDD7l4eR7ge+5yXnMGYKQiPS8AWGEGhYcxmIaXcB02aeNBE
	bYNvgxFlxVGYxdpLnrj5+A9Wzi/5WMGWCVEbJ8HRouGFvb6RUAMgQrjiJIY9dEi/
	YIpPCYED1oKg9SOWDfBqiWEMW4ZJTxbvdm/s+Y0DfquQ==
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4gppy1khtu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 00:57:11 +0000 (GMT)
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id B5122806B2F;
	Tue, 15 Sep 2026 00:57:09 +0000 (UTC)
Received: from HPE-5CG20646DK.localdomain (unknown [16.231.227.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTPS id 827A7801710;
	Tue, 15 Sep 2026 00:57:05 +0000 (UTC)
Date: Mon, 14 Sep 2026 19:57:03 -0500
From: Kyle Meyer <kyle.meyer@hpe.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: corbet@lwn.net, david@redhat.com, linmiaohe@huawei.com, shuah@kernel.org,
        tony.luck@intel.com, jane.chu@oracle.com, jiaqiyan@google.com,
        Liam.Howlett@oracle.com, bp@alien8.de, hannes@cmpxchg.org,
        jack@suse.cz, joel.granados@kernel.org, laoar.shao@gmail.com,
        lorenzo.stoakes@oracle.com, mclapinski@google.com, mhocko@suse.com,
        nao.horiguchi@gmail.com, osalvador@suse.de, rafael.j.wysocki@intel.com,
        rppt@kernel.org, russ.anderson@hpe.com, shawn.fan@intel.com,
        surenb@google.com, vbabka@suse.cz, linux-acpi@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3] mm/memory-failure: Support disabling soft offline for
 HugeTLB pages
Message-ID: <aqiX3-TxmbFkU8xs@hpe.com>
References: <aqiIEkrc6aDBOqRg@hpe.com>
 <20260914173700.346dc533f1f21ef170b7722f@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914173700.346dc533f1f21ef170b7722f@linux-foundation.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDAxMCBTYWx0ZWRfX1J48re0Pg76+
 isfei2rI9AQNEKpzmp0oGGQ7+UgNmRXG6g8gKGs2bzMjqbPzityDM73+bGjAhzPS7KlFCRTCd6j
 QEblYzHBFdNln+P8vYgR6jBTU38dP7nj6rvUn3bMbYb8CRJo1k+YIt5PaeCLeHORqzXQOxOuBrO
 I8e93cWpAPEWJNzwwrwrz2az0ri83aYEgZ8crHhfDN9frN75ABYbJ+xDz80Xw/eBo1oxSUFC+Vz
 mhelffqylCDlX0b/AXClyQzByaSWykcB4IQ32kZVL1g1P/GP16ZXC6MhHKJW6YZorpvib3ebP8n
 ucJmktJ/5oVpXLCDQ1rpCzsSbpqx5VrDiQ22zMz2u7LB0I8m1CdoOEzEApVT4mKgUIWwFEwJ41f
 YpvNg/IZtZe8dbRFuYIUda9LA5pMXFFSFa7NC5ALQ8Iw8bF7+wcL/XvdVowuMIeBT/8idp1S1Oc
 0BqsyKKMAIbzqutDtvA==
X-Authority-Analysis: v=2.4 cv=LKbz05W9 c=1 sm=1 tr=0 ts=6aa897e7 cx=c_pps
 a=FAnPgvRYq/vnBSvlTDCQOQ==:117 a=FAnPgvRYq/vnBSvlTDCQOQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gQcMVamqm3wCPoSYhaRC:22 a=ModqzXLkJJ0tFyq98apW:22 a=VwQbUJbxAAAA:8
 a=MvuuwTCpAAAA:8 a=QyXUC8HyAAAA:8 a=8QjRa3sHNxljrvLfDkgA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: r2HkFnvshq4dFtHu-OxLp914XimHte7n
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDAxMCBTYWx0ZWRfX/uPv4lyY3U70
 +n+WkuZ7wkaUjohP3ln1OA8ZTlhbOl5UdaLjpEvIfoodrGnwjaYFQsQPhtK/bFJW9pReige7eOf
 Bef4U7tldSqIwBnAlrNfoL7YPykIIto=
X-Proofpoint-GUID: r2HkFnvshq4dFtHu-OxLp914XimHte7n
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_05,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150010

On Mon, Sep 14, 2026 at 05:37:00PM -0700, Andrew Morton wrote:
> On Mon, 14 Sep 2026 18:49:38 -0500 Kyle Meyer <kyle.meyer@hpe.com> wrote:

[...]

> I'm hitting some rejects against
> https://lore.kernel.org/20260825085756.63030-4-husong@kylinos.cn . 
> Please update this against mm.git's mm-unstalbe branch or linux-next.

Sure, I'll send a v4.

> I'd updated v2's changelog with this:
> 
> 
> Tony said:
> 
> : Recap of original problem is that some BIOS keep track of error
> : threshold per-rank and use this GHES mechanism to report threshold
> : exceeded on the rank.
> : 
> : Systems that stay up a long time can accumulate enough soft errors to
> : trigger this threshold.  But the action of taking a page offline isn't
> : going to help.  For a 4K page this is merely annoying.  For 1G page it
> : can mess things up badly.
> : 
> : My original patch for this just skipped the GHES->offline process for
> : huge pages.  But I wasn't aware of the sysctl control.  That provides a
> : better solution.
> 
> Which is cumbersome but I think there's useful info here so please
> incorporate in some way.

OK, thank you.

> > Suggested-by: Tony Luck <tony.luck@intel.com>
> > Signed-off-by: Kyle Meyer <kyle.meyer@hpe.com>
> 
> v2 had
> 
> Reported-by: Shawn Fan <shawn.fan@intel.com>
> 
> which got lost.

checkpatch.pl complained about a missing "Closes: or Link:" and I don't have a
pointer to report, but I'll add that back to v4.
