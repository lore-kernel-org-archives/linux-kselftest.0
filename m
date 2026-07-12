Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3FB2459E1;
	Sun, 12 Jul 2026 05:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783834703; cv=none; b=LASRgPbltMThPEAwUtCD0qEv2cGtgDJw+K6NCTPZpH8iBv/0r1nG0rLlU+Pfkp0Y+mI5zxh3wnUPSkOgtINtsBFELMZwsst0jWzjMtj4HUT1rdMARWtAFK1ZKXupv0oofr9LG03RLRYzABsr9bk7QaCZQrkVEHEpr9nWIGFHhJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783834703; c=relaxed/simple;
	bh=fL7ZoUt45eAwuZaRg6CIL6JXG7MR+es48ql6H+7BEN0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=da9caYRtNYAyE21HQGY8Mbe6Fun33rffBri0lk+m1ptCnMvYbnMJqe2YU6Rbzgm7Ss/rNSRPv1ishoe4U/aSnssGN3JLbSjKrR7FTf92StO6Acj6hj8IFCTZfvY7jcbM/3rwata9KcFytlm5+nsIixILycBmknM/mtZIgORqako=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=tpJ8bAHU; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="tpJ8bAHU"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66C4CC5S2755698;
	Sun, 12 Jul 2026 05:37:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=FmrEDx
	8QxMchU1PCvAPUFKd41C7Mk0v0R+yTy+YcmbM=; b=tpJ8bAHUG8kPxxb5vGDVIq
	6O5OoxQhtwfjsmnXCd2wPVjFCG8s7O6+4vwqq0p+koTTBEr0W06YF+vTNvvcrgXQ
	uErDvCo4TgxBLBY4BNfMvygotU2aenEgChUqDSCtS1AIxsgnfMmTjyYaMOqBrr2j
	BZcZME5i+Vgj8lA4KwhMnkGwpmP0SNh6nhgY/R3raZm3LHZPBkLP/KKDrMs1aIAI
	kKF97QDynKp8g1JKLN2VAPdx2QVslr5MAscOeusdaXc7AHYn76vqHtE0nVSemyZL
	rLnia2Mx9psjE0pWsyaM7iFbR6U+ukROXTXqHUHANvnP1WhB25kF7Di04iIhH58A
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fbf29uagk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jul 2026 05:37:48 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66C5YbmF028137;
	Sun, 12 Jul 2026 05:37:47 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fc0hvrr7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jul 2026 05:37:47 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66C5bkdm31261284
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 12 Jul 2026 05:37:46 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B34F58045;
	Sun, 12 Jul 2026 05:37:46 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8FC2E58050;
	Sun, 12 Jul 2026 05:37:40 +0000 (GMT)
Received: from [9.39.28.183] (unknown [9.39.28.183])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 12 Jul 2026 05:37:40 +0000 (GMT)
Message-ID: <ded27d4f-3e66-4cd7-9757-a2e52770c3c4@linux.ibm.com>
Date: Sun, 12 Jul 2026 11:07:38 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sayali Patil <sayalip@linux.ibm.com>
Subject: Re: [PATCH v3 0/3] selftests/mm: avoid false failures in hugetlb and
 KSM tests
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Ritesh Harjani <ritesh.list@gmail.com>,
        David Hildenbrand
 <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
        Michal Hocko
 <mhocko@kernel.org>, Oscar Salvador <osalvador@suse.de>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Dev Jain <dev.jain@arm.com>, Liam.Howlett@oracle.com,
        linuxppc-dev@lists.ozlabs.org, Miaohe Lin <linmiaohe@huawei.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>
References: <cover.1783446924.git.sayalip@linux.ibm.com>
 <20260709185319.cbf0c39dd47ee3853d212b7b@linux-foundation.org>
Content-Language: en-IN
In-Reply-To: <20260709185319.cbf0c39dd47ee3853d212b7b@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDA1MCBTYWx0ZWRfX09MeEcG0vjIt
 7v6YhGGQP//AxKeZoVB57S/v5Phrt2sipl8TptJHgH9R3xgwWMmFzFq68NoEhGw4BHn3N6vcK2I
 uepkizLnWsilGBPM/QUSaAZ6f9RUClY=
X-Proofpoint-GUID: f_xJzRtk3x_iNQf7hVMdY4rgOoSj3IPX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDA1MCBTYWx0ZWRfX5DgCAFtuws9Z
 DIi8QDJ3z9AJL0DbldWqZCL3vjjogx8PrLV8bysPv7AuZB72j8iIUuizKjW9EhXXTvLRI2Cm8ZI
 OpNtmucVuHtbBpvvaNRNMxiP6Zk0rZN6qzZZeIQaOwkV4FLFNqHLs8jjQ4IJAbhEZvhcLSR/4wN
 TR4lK8q1CgVZUKo6+hitjdN9koo89CnlqF3saGiGmDIwktXIi0FBYAXrJyZSbRXKd7AyeGTxPy3
 63rRzBtxfyj83tWZeuEyVe5DmyCHo1Vw8kMZ9kQuoGv/uq3grwcV7zAm6oVxi/dN8hLspgmrJtS
 B4VrGo3w5JJLIXKarQRbyKEuHsPyZHG1gvaQe9lMBwkQRqVlXJ9rLwyavr6Dt/m8PhiP2gK7J/K
 /ZU9IhPpc8cBrFxZjWxn0WADd9mPQQ13vW3gYKOYGxQ8dHkWvQvxvS8dpy2IBPi5ELFVks8PkT2
 fOJ5YdFensaM4cgXIfQ==
X-Proofpoint-ORIG-GUID: roN63tJwwzI1npq61pQNk0ybmXMzHcGC
X-Authority-Analysis: v=2.4 cv=PvajqQM3 c=1 sm=1 tr=0 ts=6a53282c cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=c92rfblmAAAA:8
 a=VnNF1IyMAAAA:8 a=VwQbUJbxAAAA:8 a=YLSOTn8K_J3FlFHuE84A:9 a=QEXdDO2ut3YA:10
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120050



On 10/07/26 07:23, Andrew Morton wrote:
> On Wed,  8 Jul 2026 12:29:04 +0530 Sayali Patil <sayalip@linux.ibm.com> wrote:
> 
>> This series fixes issues in the hugetlb and KSM MM selftest categories
>> that can report failures when the prerequisites for the tests are not
>> satisfied.
> 
> Thanks.  AI review asked one question:
> 	https://sashiko.dev/#/patchset/cover.1783446924.git.sayalip@linux.ibm.com

Hi Andrew,
I answered this in v2, as the same question was raised by Sashiko:
https://lore.kernel.org/all/d73ef56f-077e-4995-993b-56b2c58b6b65@linux.ibm.com/


Thanks,
Sayali
