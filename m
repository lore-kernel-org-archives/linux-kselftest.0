Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F03737B02D;
	Mon, 10 Aug 2026 12:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786366746; cv=none; b=g4+JWx7jYbmRQ6ldGSJvv5v5WWOW94zx9FOvGaJtr15gT/LF3cId2L/B+60GFEo6lfsj8e3nMSgcwCKfOg84SkUPIpjMrN1ziZ7D8GBV2/ErQAYIkdINrxFF7vZ73m0Lye3rDg8A97QwDGKoCIh3UVQBJ2BgoiFbITB6bDL3tZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786366746; c=relaxed/simple;
	bh=corMVmeYBz1wKU1F/hX40IdMINJAx6Q4mCyAHQxxve8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=at+TZ4JkjhGpTm8NIv3MdC3YzCE+tHDWJfMtlzzW2Wh8L/6Kti7vb74VnqEAhPYyx6fGsJI2nA40bByQOieBR1d4D6xUhBsShtuK/Z00Z2oga1/ls6FWKK9cHp5yudyEN0liXTiGyYufx6W47EAEdNxtcvltHW4xVoxaSMRc/aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Gzz3kVOr; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Gzz3kVOr"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9VesW156779;
	Mon, 10 Aug 2026 12:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=dSiblIiYTIEmqanmh2YkYImArEcTnc
	zokd31LNN7kYY=; b=Gzz3kVOrvWCVRzZkdQEYdPzIdPMzqy4qsVDzew2xBktM85
	GE8iepSqJ+ovQBywfgeyr04ta//fK7T7YrA/4X7WnIy+3TQxLZr4GGszy9akGjfW
	eQSFSKcbNUKv5W9QRgx4L4V3tVG4B9QIcgh3zv7az/m3Xq2zdXKwxvoW9To9wcbZ
	AP8JS86gyANYkvPQkdA+C3KLmn0XumA4XyMh3cFBsIv4UthRJa12UagfR/ALa2xr
	4sglh+x/gFAGaZ3IUmXbDOXOf+PQiNhdqowh81WSym4VBwiUNNsGupcfCwpQBxy4
	AKKjSVISEInI+ZhhaRPfC7PYfHFcl+IG3dbFN94w==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fyb23h04p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 12:58:47 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67ACuhGB009990;
	Mon, 10 Aug 2026 12:58:46 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4fxhfxvkg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 12:58:46 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67ACwjlG41419190
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Aug 2026 12:58:45 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E034D20043;
	Mon, 10 Aug 2026 12:58:44 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 980EC20040;
	Mon, 10 Aug 2026 12:58:44 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.224.92.206])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 10 Aug 2026 12:58:44 +0000 (GMT)
Date: Mon, 10 Aug 2026 14:58:43 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
        nico.pache@linux.dev, baolin.wang@linux.alibaba.com, baohua@kernel.org,
        dev.jain@arm.com, hughd@google.com, lance.yang@linux.dev,
        liam@infradead.org, mhocko@suse.com, rppt@kernel.org,
        ryan.roberts@arm.com, shuah@kernel.org, surenb@google.com,
        usama.arif@linux.dev, vbabka@kernel.org, ziy@nvidia.com,
        usama.anjum@arm.com, linux-mm@kvack.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        kas@kernel.org
Subject: Re: [PATCH v2 00/17] selftests/mm: improve khugepaged coverage
Message-ID: <f9e0fe38-47de-4577-b638-1142d4ffbe6c-agordeev@linux.ibm.com>
References: <20260807113647.3744609-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807113647.3744609-1-kirill@shutemov.name>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=XqfK/1F9 c=1 sm=1 tr=0 ts=6a79cb08 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VwQbUJbxAAAA:8
 a=Hq8G7kb28POlo2kKp_sA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwNyBTYWx0ZWRfX3SMiRUWGUIYF
 RNyU+VCVbf1wMhedsG6ts0uBTyN1XnDiaAMXFz2VWe44OSsqpXaI+Bmri74bCkxf9i6g4KZxvxN
 /Co9yK844fmCV0bN7XfPlcnAal5YKqAIyo0BuVqHBElKQl2F1lq0tvPHVACmi5MQD1z6v4gswvr
 KJyzmHMQigwl1HNGYwLRBjY2qmkLZ4wYIVc0/HNhjFo5CePLHDNqmIw7jQN89Ejx7TJlVQFCYiW
 mO9p2mrLmRXcHHELV2wNYdvOxQew/qiX/26CDPMaWdhG4PtSMYf2QM6FmjWs7vogcT+dF7qMp+8
 qC9nTXyoAjpU9z4RRqVoCFf5FHAfjMFozcBsa2nBVr2jryzcazoqmW4otD78hY6vnJdS7MtKl/b
 AFyD+iDMFbP8mBUTZnrSrtjyDNPrX0rAr6Wao2a3DbZOGWgsifZLv/nFtazcuPYgUi6MHdDsG4H
 XX45j6Tb9iaFm2M+L/A==
X-Proofpoint-ORIG-GUID: ANPpCN1PvFh-XlYVrdF7tqcS3P4jSn4Q
X-Proofpoint-GUID: MSLDefExe5nYuA80fEPFcTJzJ6JhaPnE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwNyBTYWx0ZWRfXxRcTmIoc+1PV
 t/cLDMYLbX9lYLzgKBJM7tHD3tS4NKxxH1mJtsg8jTvBc3VjZYTwBrNQAsrt2ZWqOiFfLZlllQ0
 QMotxG/f3ULO8iSWDN6D2TkD6oGk+Ro=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1011
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100107

On Fri, Aug 07, 2026 at 12:36:30PM +0100, Kiryl Shutsemau wrote:

Hi Kiryl,

...
>  - Dropped the swap-skip patch, an equivalent has landed
>    (Alexander Gordeev).

And dropped [1] following David feedback [2]. Would you pursue the proper fix?

1. https://lore.kernel.org/mm-commits/20260808063054.B75691F000E9@smtp.kernel.org/
2. https://lore.kernel.org/linux-mm/9d0d98ea-05bd-43c0-bb36-68aea62cbde8@kernel.org/

Thanks!
