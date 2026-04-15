Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEF22C11DF;
	Wed, 15 Apr 2026 05:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776231310; cv=none; b=UIbl6P5gsV2e8X4kS8W+ydySTzB9WN9pGvkbLsIyfF8t7XabAXKQ1TCeYKwviEuLyb0kCVL4ga6iLUYFjLRdgbta9Ezx+3GFo6SW3gWwGsmo6K8sGP8q7GCvWoF0hfILHXNivxUCiXTO1F9JDTxvSptRLtvpysNWHjW/cooT5eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776231310; c=relaxed/simple;
	bh=OLOi0OH4PO4Y5ttX147LjPglu02to8frk5y/guYkTm8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hnHCsk5jf55m7shUyWsktDk/1gnHC6pkuXbJTExt7XHi0IbAL05NouE8fGCe98IYJE4IcfJYzxXiRllNtSvO0DSLL7poYxzhS1KD0of7FS7WiY0sM4hAexh1vK4LjvLstd+OzVKo3WMCkIgibXo+4UxY6kYWnDy6+zXh0B8fUHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=VniIU8wA; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="VniIU8wA"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F5NYYt1835027;
	Wed, 15 Apr 2026 05:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=5Jn/bY
	nePmmBijhebJjawFdR7dw/NO7bhdl8r0/lNyQ=; b=VniIU8wAQgXc4YVPyxfsw3
	YGAWphVS0Mkbp4ye2+wKggHLXrPlVixfv5iMMmzICjvfVp6M52DryayZeZxp/Llk
	u54G8Gc8pFMYsGJX6XQ51XEXtJLs8XWA4VR+INtemhMNFr9dv3VAknH4MRtcMl3T
	YBbpmY/PefAdqWG1piBw9d3YbmI9zYjnvbuU/9DMGbSMZct+tLhYou6MVk/1xLAR
	8btrV5cJTCwybgOzdsHAHG0BxzdEE95JUTr9jsaBf+lA+5QTCYx5XGFreCEfPG5n
	5itvyosHAprbk/sI8BrxpZt6AIMP83d1WzwvgaXse4vH2t8gYIuNaB0qrJYKpcSg
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dh89reg0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Apr 2026 05:34:46 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 63F2je6L031099;
	Wed, 15 Apr 2026 05:34:44 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4dg10ycy88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Apr 2026 05:34:44 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63F5YiTh62062968
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Apr 2026 05:34:44 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5C9E858065;
	Wed, 15 Apr 2026 05:34:44 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4B2BD58055;
	Wed, 15 Apr 2026 05:34:36 +0000 (GMT)
Received: from [9.124.217.38] (unknown [9.124.217.38])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 15 Apr 2026 05:34:35 +0000 (GMT)
Message-ID: <42a006b1-2b51-46ae-a5ed-829f3947fb20@linux.ibm.com>
Date: Wed, 15 Apr 2026 11:04:34 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/53] selftests/mm: hugetlb_madv_vs_map: use kselftest
 framework
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@kernel.org>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
        "Liam R. Howlett"
 <Liam.Howlett@oracle.com>,
        Lance Yang <lance.yang@linux.dev>, Leon Romanovsky <leon@kernel.org>,
        Lorenzo Stoakes <ljs@kernel.org>, Mark Brown <broonie@kernel.org>,
        Michal Hocko <mhocko@suse.com>, Nico Pache <npache@redhat.com>,
        Peter Xu <peterx@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Shuah Khan <shuah@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
        Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-mm@kvack.org
References: <20260406141735.2179309-1-rppt@kernel.org>
 <20260406141735.2179309-11-rppt@kernel.org>
 <c1ff61ca-89a2-4d13-b376-03cbe7719366@linux.ibm.com>
 <adzEg1JM-OO0yzqd@kernel.org>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <adzEg1JM-OO0yzqd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA0NyBTYWx0ZWRfX5jAnyqzoweR2
 CGXDG7GeOEyhlibk9pkaSRTU6V3VMMhek8jQA9GtnZNk8w3PwE97lw91KTPXfaTYSDCv0mDI9Rs
 zD9/jpQDArrR7maoxfc4iCcQoH8iYTYPaUBlUq2HRy+lfRGOD/QVKpOTGJlsIKqTh6k65H23KxW
 TKYPVFVtmNuyaSWWWPL/DVgB0dOggfaRyLxfw5h2YyrpKw6Dd/ukjz6QVuS97aEv7AxBnlYdV8U
 sGP3lFXRVO6sGg3SClJPhr6ea+oo15amzqQmOt1K04ACZZeUnYoFskw/zxA7qBPGYISthpv39Ji
 rz4DJquojsevsvbGgBBrWEQIre8en6U71j1Kmasaqc8BoGv4aGoOZytkGOsEIHEUdEtihDlkxnb
 1V3kg/QbO6qmSafdOMinntMfZcOnP6l/4vU2G7C633MbGR6HvbvJLL0xKOl4hVi4sl2DAGebPYT
 VIVTPYzhMkAiGk2JMdw==
X-Proofpoint-ORIG-GUID: msp-FA4ZJIjvPQaSQBaqiFu-rrAPM7RF
X-Proofpoint-GUID: 4h4UzFtMaRJRpHNfGTmCSqmleT-WqJv1
X-Authority-Analysis: v=2.4 cv=fYidDUQF c=1 sm=1 tr=0 ts=69df2376 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VwQbUJbxAAAA:8
 a=rQ_swS4sU4-nGWuC61sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150047


On 4/13/26 3:55 PM, Mike Rapoport wrote:
> Hi,
>
> On Thu, Apr 09, 2026 at 10:44:28PM +0530, Donet Tom wrote:
>> Hi Mike
>>
>> On 4/6/26 7:46 PM, Mike Rapoport wrote:
>>
>>      From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>>
>>      Convert hugetlb_madv_vs_map test to use kselftest framework for
>>      reporting and tracking successful and failing runs.
>>
>>      Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>>      ---
>>       .../testing/selftests/mm/hugetlb_madv_vs_map.c | 18 +++++++++---------
>>       1 file changed, 9 insertions(+), 9 deletions(-)
>>
>>      @@ -115,12 +114,13 @@ int main(void)
>>
>>                      if (ret) {
>>                              ksft_test_result_fail("Unexpected huge page allocation\n");
>>      -                       return KSFT_FAIL;
>>      +                       ksft_finished();
>>
>>
>> Should we call munmap() before exiting?
>   
> We could, not that it really matters.


Thank you for the clarification—it makes sense.

>   
>>                      }
>>
>>                      /* Unmap and restart */
>>                      munmap(huge_ptr, mmap_size);
>>              }
>>
>>      -       return KSFT_PASS;
>>      +       ksft_test_result_pass("No unexpected huge page allocations\n");
>>      +       ksft_finished();
>>       }
>>
