Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED3714AD20;
	Wed, 15 Apr 2026 05:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776231610; cv=none; b=b3+qsVUd0LjHZgAWviAPR3bBmH03KDdiwRYFVec4CpabMPj08U5Zj7U55Tu4D5wq+eymgwzKDgODlJehGkt1pPyqMIV4UaJn/mfCLS2PySkvADHbt80bpUhUkITFf+hFXgzcnt55v24OR+DtWwT7LTDWZNc8LZk0j4Or1MUnDz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776231610; c=relaxed/simple;
	bh=dNICcBHvo/hqaxUPytkCNFCE5CoQVqMer91nE3fZCdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LJUg+yC60aZRQY8822sYC4scAM9tiB9AaLaPddts+q6InStwxUICEltcXlSt4Av9mT0V6SVsHNePPmw5/v01xuhFgkHgthqCtl9j2VLGOSWsPhzCbcMCyR4l4xFTnW4Sed+aXUCGWaTuP+4zoKqttxSXBH5+DNhFlWbekUFzlm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=TJmXuBSr; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="TJmXuBSr"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EGH51a2451334;
	Wed, 15 Apr 2026 05:39:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=0n6HTL
	G7e9ILzs+XjWC2pf1cq5ZuUAOHbj2wjvUJB/U=; b=TJmXuBSr0craOeSZoNVOF2
	WIXP+BbTWB3/xzA36zyRvOtFKOEbNTM5ZEHRJsyjZiwMo00Zi7r561neZ5duSl68
	zwqA1Wv5Nga0p3LCNmALKtz7tx5V0opzVM+7ngmxz5zrvQXoxWzHh8NJBElpx8ah
	fQv4Z1fAjUs9f9lim2O8yeAQKgSY345nILQjEjxqECk98uHrTpjzwmxZwaG8QI7P
	tal2DT8c1Srjpf96HA+BNHIjsnGR17RHGCSfmigI3ZlCYTmM72Ulq9UPNo0RJDRw
	WX5mpOk5ifxdtf2Ta93ZRLSxmbRvlb/mVq+EPD3J1KSvYuzzgjWlk/EVNg1hBpfw
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dh89m644j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Apr 2026 05:39:52 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 63F4XdgK025841;
	Wed, 15 Apr 2026 05:39:52 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4dg3b1mkf1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Apr 2026 05:39:52 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63F5dphZ36176138
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Apr 2026 05:39:51 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 54D0C5804B;
	Wed, 15 Apr 2026 05:39:51 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C3A4D58059;
	Wed, 15 Apr 2026 05:39:41 +0000 (GMT)
Received: from [9.124.217.38] (unknown [9.124.217.38])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 15 Apr 2026 05:39:41 +0000 (GMT)
Message-ID: <b1fc0aac-9619-4240-86f7-abe0d68f2798@linux.ibm.com>
Date: Wed, 15 Apr 2026 11:09:40 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/53] selftests/mm: khugepaged: group tests in an array
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
 <20260406141735.2179309-13-rppt@kernel.org>
 <1524b172-a5f7-4fe0-9bb4-29287762dbff@linux.ibm.com>
 <ad5kXC-F_YyWD590@kernel.org>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <ad5kXC-F_YyWD590@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=I/dVgtgg c=1 sm=1 tr=0 ts=69df24a9 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=xH5FL6UbJZk6oSiiWT0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: p8gPax9qbfzKNyrdtcYTznrGJBiguDjm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA0NyBTYWx0ZWRfX0QNXQu2az0po
 QJumG+aWfNLS+XCDj+rXLMGOMe6w+46T2Knu1R/znRaeDfJguPdioqbuFQ5fbUhFeH6xHbTPh50
 SmoqjBCEHVQzLcSQlN8gxJS8xkYTE5pEfoSM+5DIh8qE5YGtTgD0YTombZ/Ama3MhKouwv5LBmW
 eI+EbCeBrqWVM/0teamekQG1Z/sK8rMHrsHfxP+Ven1BXhJNFzK0CGGeen4adRBnnFV9vfRUWeQ
 NgKhn0sOd75YpDsSw3MCOYGg4D7HmN6vn+xCQzt7/W7b1cTD1cSt12G4SQmCwquPiMkDjtOKOtW
 AKOBVWwU7rnUt3l0OJftsqQwpiT/WPGOEHAdGfRIIYFCmoCCC1tUyBSENBL727Z3LaDdinJJgL8
 AVKbu1Q1Ib3oPmcXBLQNYeyM+1uEZhE2/UuaT3rLlZZUf4ugmcwWf55VZ/CHX4YCLxDnxiGkuA6
 F0VvY8VejlTmzvkYjig==
X-Proofpoint-ORIG-GUID: tVSaGMBHpoh9ki9OrGwK4cAX9J672Sit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150047


On 4/14/26 9:29 PM, Mike Rapoport wrote:
> Hi Donet,
>
> On Tue, Apr 14, 2026 at 12:32:48PM +0530, Donet Tom wrote:
>> Hi Mike
>>
>> On 4/6/26 7:46 PM, Mike Rapoport wrote:
>>              get_finfo(argv[1]);
>>       }
>>
>>      +typedef void (*test_fn)(struct collapse_context *c, struct mem_ops *ops);
>>      +
>>      +struct test_case {
>>      +       struct collapse_context *ctx;
>>      +       struct mem_ops *ops;
>>      +       const char *desc;
>>      +       test_fn fn;
>>      +};
>>      +
>>      +#define MAX_TEST_CASES 45
>>
>> I see 48 tests in khugepaged.c, and running khugepaged all:all results in the
>> error below. Should MAX_TEST_CASES be updated to 48 instead?
> I'm going to bump it to 64 to accommodate potential future tests.
>   
>> ./khugepaged all:all .
>> TAP version 13
>> # Save THP and khugepaged settings... OK
>> Bail out! MAX_ADD_CASES is too small
>> # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
>> # Restore THP and khugepaged settings... OK
>> # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
>>
>>
>>      +static struct test_case test_cases[MAX_TEST_CASES];
>>      +static int nr_test_cases;
>>      +
>>      +#define TEST(t, c, o) do {                                             \
>>      +       if (c && o) {                                                   \
>>      +               if (nr_test_cases >= MAX_TEST_CASES) {                  \
>>
>>
>> I had a small question—since the number of tests is fixed, would this check
>> still be necessary?
>   
> If we add too much tests without updating the maximum we get a nice "Bail
> out" rather than SIGSEGV :)


Thanks for the clarification. It’s good to include this change.


>   
>>      +                       printf("MAX_ADD_CASES is too small\n");         \
>>      +                       exit(EXIT_FAILURE);                             \
>>      +               }                                                       \
>>      +               test_cases[nr_test_cases++] = (struct test_case){       \
>>      +                       .ctx    = c,                                    \
>>      +                       .ops    = o,                                    \
>>      +                       .desc   = #t,                                   \
>>      +                       .fn     = t,                                    \
>>      +               };                                                      \
>>      +       }                                                               \
>>      +       } while (0)
>>      +
>>       int main(int argc, char **argv)
>>       {
>>              int hpage_pmd_order;
>>      @@ -1216,13 +1244,6 @@ int main(int argc, char **argv)
>>
>>              alloc_at_fault();
>>
>>      -#define TEST(t, c, o) do { \
>>      -       if (c && o) { \
>>      -               printf("\nRun test: " #t " (%s:%s)\n", c->name, o->name); \
>>      -               t(c, o); \
>>      -       } \
>>      -       } while (0)
>>      -
>>              TEST(collapse_full, khugepaged_context, anon_ops);
>>              TEST(collapse_full, khugepaged_context, file_ops);
>>              TEST(collapse_full, khugepaged_context, shmem_ops);
>>      @@ -1284,5 +1305,13 @@ int main(int argc, char **argv)
>>              TEST(madvise_retracted_page_tables, madvise_context, file_ops);
>>              TEST(madvise_retracted_page_tables, madvise_context, shmem_ops);
>>
>>      +       for (int i = 0; i < nr_test_cases; i++) {
>>      +               struct test_case *t = &test_cases[i];
>>      +
>>      +               exit_status = KSFT_PASS;
>>      +               printf("\nRun test: %s: (%s:%s)\n", t->desc, t->ctx->name, t->ops->name);
>>      +               t->fn(t->ctx, t->ops);
>>      +       }
>>      +
>>              restore_settings(0);
>>       }
>>
>>
>> -Donet
>>
