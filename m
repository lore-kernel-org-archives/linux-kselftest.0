Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B843D34BE;
	Wed,  8 Apr 2026 14:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775658683; cv=none; b=VTp4jkq6SVI5GbQJUZA1Uwqg3BZfyv/5OXFmMI2iKGFu3WoNXlfI8CIhsTYk45P6Y4IzYYi1FZONrJ3a+WzstqMvqz0nVokDpBqZjyX8LioH0cvXpOuNYIfSnuxlylbBJKu6EzOOSyNTqQkrQpzrIo5tkbkO9wJ81cMrzcc8wbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775658683; c=relaxed/simple;
	bh=cO/l2bMxTNh+UBqYKUs3J+RIZAsvRQfk8BesZKO/g4I=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cWk3IeDjNHZrvqgG3mjrISGXZCWzkCbhy7eqUssULgMtOmgg1iL8UJzmT0ev3UalogaZRGoqgigSYPZ0+G71w0x38pNL2PNhLaECc8+FwhJaAJVgiccYzB0j13TVtij80FX82mdoFCxumBP1wUZ5rsqNb63BabzQIHG7qOYhVR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=pdGi1kEw; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="pdGi1kEw"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6387ILri2314896;
	Wed, 8 Apr 2026 14:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=LkRE4M
	yaMSL6KwXVE1etnD6z4m8EDACY0FZ+agyr/ww=; b=pdGi1kEw1SysBWzPsGJXwy
	jcJXmX0vc9mZKOd5+q18uUWJpg/aib89ONUWO/LC9xO55vXI082cPBczKFtIM9vW
	voYFrN2I+loFLyeaPPb2yhvzAPcvrN+5Ovk+RfH25uHnWdF7vX/rVofRFbMF26Om
	rU6zHNUQu+TIZFhV7H7ZEE/cvUmbb9easLybsU/fYat9kX9Es/SXzqCFL0zWdPbf
	tAlrcQKeh3ROLIBbBbeDFzX16Jz/RJH9R815RMpWL7LnAlI0LLsih4ff0iH6+boA
	I0kWivJNVE8hWc3BBQJJTLpfwwQFvK8c4Kbf8yBKyUdiUcH+icMFT4r23yfP0F9Q
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dcn2g0fdq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Apr 2026 14:30:55 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 638B3Kx7014348;
	Wed, 8 Apr 2026 14:30:55 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4dcmg4qr3j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Apr 2026 14:30:54 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 638EUrBu27591242
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Apr 2026 14:30:54 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D6FFE5805A;
	Wed,  8 Apr 2026 14:30:53 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B3FD158051;
	Wed,  8 Apr 2026 14:30:48 +0000 (GMT)
Received: from [9.39.21.61] (unknown [9.39.21.61])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  8 Apr 2026 14:30:48 +0000 (GMT)
Message-ID: <162ca3d6-c5b6-4c36-8e20-313fcc4e3eb4@linux.ibm.com>
Date: Wed, 8 Apr 2026 20:00:23 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sayali Patil <sayalip@linux.ibm.com>
Subject: Re: [PATCH v4 08/15] selftest/mm: align memory size to huge page size
 in hugepage-mremap test
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Ritesh Harjani <ritesh.list@gmail.com>,
        David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>,
        Oscar Salvador <osalvador@suse.de>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Dev Jain <dev.jain@arm.com>, Liam.Howlett@oracle.com,
        linuxppc-dev@lists.ozlabs.org, Miaohe Lin <linmiaohe@huawei.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>
References: <cover.1775466329.git.sayalip@linux.ibm.com>
 <6aecfff81bd3e288e66af238f50f35eac0bd4ee7.1775466330.git.sayalip@linux.ibm.com>
 <15910BAF-8D1D-4EAA-85A6-2E4CD3700513@nvidia.com>
Content-Language: en-IN
In-Reply-To: <15910BAF-8D1D-4EAA-85A6-2E4CD3700513@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=FKArAeos c=1 sm=1 tr=0 ts=69d666a0 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=VnNF1IyMAAAA:8
 a=Ikd4Dj_1AAAA:8 a=PlrO5bDOHtOk0AGLARAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: GMkL5xqOH3UGrqRF4CDulkIlDuZm63Q6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDEzMiBTYWx0ZWRfX7sR153E1SxqB
 DN+Cep4BN+qcjTKbrKDl9xnUmR343bNrAl2sjAzGn2vbbkeE4EO7lBJo0l6fxfwpb6VM7ukVDEl
 ZX77a5kK8eZRKarKuJSQhr7mSPHjTUo/cgxh9BDr73M9hbf7cgnxSrF1g8lOVSS6ij4i1WmYTBv
 EVzk8K8v5Lf0HhY/uk76yDw/veNukXmcyQafNbOBMXQ8cPMX73Y3bt+LWwu/yUvaP+4zgOmKxxP
 jQ0j2Rfsvk3JbXAqLNc1gEXd3bEfyhw8eKKw3E68bKuFLr8IkhLwhECP227jzF0ANymlcYEITrb
 RKd48EjQ8003w7fARoYivDsP01bNG7xJytu6x5PPSKhA/0NEesLK6aivT/2dGBVhUHBbs563nla
 eLFu3ZMuxCotVnvsQoIqIh9Xn2hqSzj5I6lY311lQEacAU06q2SMZQ7Gnfwk+Rtb0NLPTQNJL2U
 YVSigkuSgM+WOKhCGUA==
X-Proofpoint-GUID: dBpu8GKVWMWHKfeY1egIlL6ayOxFRprk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_04,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080132



On 07/04/26 20:27, Zi Yan wrote:
> On 6 Apr 2026, at 5:19, Sayali Patil wrote:
> 
>> The hugepage-mremap selftest uses a default mapping size of 10MB
>> when no argument is provided. This size is not guaranteed to be
>> aligned to the system hugepage size, which can cause munmap() to fail
>> and mremap() to succeed where a failure is expected.
>>
>> Align the mapping length to the runtime hugepage size using
>> default_huge_page_size() to ensure the mapping is properly
>> aligned. Also handle the case where
>> default_huge_page_size() returns 0 by skipping the test.
>>
>> Before patch:
>>    running ./hugepage-mremap
>>    ------------------------------
>>    TAP version 13
>>    1..1
>>    Map haddr: Returned address is 0x7eaa40000000
>>    Map daddr: Returned address is 0x7daa40000000
>>    Map vaddr: Returned address is 0x7faa40000000
>>    Address returned by mmap() = 0x7fffaa600000
>>    Mremap: Returned address is 0x7faa40000000
>>    First hex is 0
>>    First hex is 3020100
>>    Bail out! mremap: Expected failure, but call succeeded
>>    Planned tests != run tests (1 != 0)
>>    Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
>>    [FAIL]
>> not ok 1 hugepage-mremap # exit=1
>>
>> After patch:
>>    running ./hugepage-mremap
>>    -------------------------
>>    TAP version 13
>>    1..1
>>    Map haddr: Returned address is 0x7eaa40000000
>>    Map daddr: Returned address is 0x7daa40000000
>>    Map vaddr: Returned address is 0x7faa40000000
>>    Address returned by mmap() = 0x7fff13000000
>>    Mremap: Returned address is 0x7faa40000000
>>    First hex is 0
>>    First hex is 3020100
>>    ok 1 Read same data
>>    Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
>>    [PASS]
>> ok 1 hugepage-mremap
>>
>> Fixes: f77a286de48c ("mm, hugepages: make memory size variable in hugepage-mremap selftest")
>> Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
>> ---
>>   tools/testing/selftests/mm/hugepage-mremap.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/tools/testing/selftests/mm/hugepage-mremap.c b/tools/testing/selftests/mm/hugepage-mremap.c
>> index b8f7d92e5a35..f66e4d806477 100644
>> --- a/tools/testing/selftests/mm/hugepage-mremap.c
>> +++ b/tools/testing/selftests/mm/hugepage-mremap.c
>> @@ -32,6 +32,7 @@
>>
>>   #define PROTECTION (PROT_READ | PROT_WRITE | PROT_EXEC)
>>   #define FLAGS (MAP_SHARED | MAP_ANONYMOUS)
>> +#define ALIGN(x, a) (((x) + ((a) - 1)) & ~((a) - 1))
>>
>>   static void check_bytes(char *addr)
>>   {
>> @@ -110,6 +111,7 @@ int main(int argc, char *argv[])
>>   {
>>   	size_t length = 0;
>>   	int ret = 0, fd;
>> +	size_t hpage_size;
>>
>>   	ksft_print_header();
>>   	ksft_set_plan(1);
>> @@ -126,6 +128,14 @@ int main(int argc, char *argv[])
>>   		length = DEFAULT_LENGTH_MB;
>>
>>   	length = MB_TO_BYTES(length);
>> +
>> +	hpage_size = default_huge_page_size();
>> +	if (!hpage_size)
>> +		ksft_exit_skip("Unable to determine huge page size\n");
>> +
>> +	/* Ensure length is hugepage aligned */
>> +	length = ALIGN(length, hpage_size);
>> +
>>   	fd = memfd_create(argv[0], MFD_HUGETLB);
>>   	if (fd < 0)
>>   		ksft_exit_fail_msg("Open failed: %s\n", strerror(errno));
>> -- 
>> 2.52.0
> 
> LGTM. BTW, it seems that multiple files, pkey-helpers.h, migration.c,
> uffed-unit-test.c, hmm-tests.c, have their own ALIGN or ALIGN_UP.
> They can be moved to vm_utils.h, later if someone wants to do a cleanup.
> 
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> 
> Best Regards,
> Yan, Zi
> 
Yes, I noticed that as well. I am planning to clean that up separately 
later.

Thanks,
Sayali
