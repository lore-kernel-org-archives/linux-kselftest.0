Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58053E1CEE;
	Thu,  9 Apr 2026 16:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775753375; cv=none; b=kzq1c8GT/bQTnjbQV4Q0e6wILobmUB9ybO+OyvtCw6TQh1gylBlhC/+kiK+fs03BtoMp3S7lA18UoUKw8R8bU/gv0xig3KDQ9EFdtF/twzwKFvzE/fiC5EQiDdzcFxjKEmOU9TBFqhN+RhKiwySe67SiS0nHCC3eIkFZk39tQMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775753375; c=relaxed/simple;
	bh=Sn8WS2SeZ2vp6BQH8IRoZOc159Nk9bw1z6MLKy+vsZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hLldSFAUd9OB9hEMsHrBsT2EysCTgicj4PkMADQtMNeGjp8gKSwYQxJEPdDjDA/eqBFeyNNVUq1ftEZuz9UA93Baw6HFSllA1c8+KP4tSkVhJr+cd7HNcoLkJ05G0dmmay5C1qNYl55TnKUlAHvMxKqZVvLaaTdkbNCxnkHOhGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=PMFB/VR1; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="PMFB/VR1"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639AeONS2302396;
	Thu, 9 Apr 2026 16:49:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=skeijJ
	YAw0fiK+XGH88wl8oZ8yiStugPyY7G6KP4bYo=; b=PMFB/VR1NXWf8l0QKJrRcB
	PHjR84wRDpsPwS1adRf/bF0JB+gkpC4Z4AXSJN+J5ZTSjlGI38MVL9tCj9OENoSR
	bJI5EtM+A+3Bmvlu5yKGBoy2YRQgTGtNXu54wM/7581yDZE6EQWW7DoGvCqgZbBy
	ZXDPbQuJX1KRD9BaD6ish3ZIg3KZpo6xHwaxWCK/B8ZJX23Zr9J+fSBZp+tb6L2S
	gJ0OzwJhNi6mAF2iLhcTfMrnumMtQmwTbhU7lhltC6o1y2oDcVuip268j6xoIHAc
	aeq8ynWzyyz9VJ5IySBSgMxzWG4hdQ0SRiBbXf0n99Grms+mCMdCtzm4ENevcnHA
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dcn2fp2ay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 16:49:08 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 639Cnqf7018946;
	Thu, 9 Apr 2026 16:49:07 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4dcme9mf5c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 16:49:07 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 639Gn7TF30605878
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Apr 2026 16:49:07 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 45DB958052;
	Thu,  9 Apr 2026 16:49:07 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E7C5B58050;
	Thu,  9 Apr 2026 16:49:01 +0000 (GMT)
Received: from [9.124.212.138] (unknown [9.124.212.138])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Apr 2026 16:49:01 +0000 (GMT)
Message-ID: <d90cd4aa-e0d9-43d2-926e-2154df924f97@linux.ibm.com>
Date: Thu, 9 Apr 2026 22:18:39 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/15] selftests/mm: move hwpoison setup into
 run_test() and silence modprobe output for memory-failure category
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
 <8ef8640092004d143fe80e6fc32ea8d30a9080de.1775466330.git.sayalip@linux.ibm.com>
 <8B26C697-4D0C-4E1E-A14E-D517CC9DA05A@nvidia.com>
 <5888f69f-c336-4151-a9ac-9b0b00f9c3bb@linux.ibm.com>
 <B686276F-89E5-4192-8973-3B787FC8AC86@nvidia.com>
Content-Language: en-IN
From: Sayali Patil <sayalip@linux.ibm.com>
In-Reply-To: <B686276F-89E5-4192-8973-3B787FC8AC86@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE1NCBTYWx0ZWRfXwvUI0Gwo1mcg
 wa1oc4VivmfI6eqIsrx8m3q64N5D+QkE5qQAGXfOivbbn3ZQEqXfSmSlVy/K0Dps8xXoZaVMnCB
 r5diJrPEAJbjIykV3ww3Eci0OcTESE3gTBHkmZAtxpF1wLrmCma1oB+WP6EDaOnI4oLY5Yfec59
 kDQX1zfgi6bNccGxjRPs+kf5SglhOOehYCksJ7c1gPID6TvNffvYx+Ul+qHbSVvGrtRigilR3qr
 piV9Bn1/LA/6Qvq/k99gi4NmG1Ak0U7LFnmHAZWVq/fFci4NHE3xtA8dOjqKA+EbSi6lTGmA6q2
 g0y1+3k19oD+2rD4ovMYdGMm+IUYJe5kV66/kasDHEDStwCDNH4XpoGXa9MU4XGQvCH0GEFSTnY
 qUlYgRvbvrZkuiTAaOX8TXhPSEOTDMp4+bHx+kgHvR3ExfQi7rvwMltrOwHHymce0EZe9ATuePU
 tMWn/SL0eq3LJN0Ujqw==
X-Authority-Analysis: v=2.4 cv=FsY1OWrq c=1 sm=1 tr=0 ts=69d7d885 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8
 a=WTjc7Mk9pcOPGDH6nUsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: xQKqax6dvX8APGiCVYRA2NgekkI8SNQd
X-Proofpoint-GUID: ERlRxTJ0wNXRKaZ2H8ZfNUREZ1Be82IX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090154



On 08/04/26 21:10, Zi Yan wrote:
> On 8 Apr 2026, at 4:36, Sayali Patil wrote:
> 
>> On 07/04/26 20:21, Zi Yan wrote:
>>> On 6 Apr 2026, at 5:19, Sayali Patil wrote:
>>>
>>>> run_vmtests.sh contains special handling to ensure the hwpoison_inject
>>>> module is available for the memory-failure tests. This logic was
>>>> implemented outside of run_test(), making the setup category-specific
>>>> but managed globally.
>>>>
>>>> Move the hwpoison_inject handling into run_test() and restrict it
>>>> to the memory-failure category so that:
>>>> 1. the module is checked and loaded only when memory-failure tests run,
>>>> 2. the test is skipped if the module or the debugfs interface
>>>> (/sys/kernel/debug/hwpoison/) is not available.
>>>> 3. the module is unloaded after the test if it was loaded by the script.
>>>>
>>>> This localizes category-specific setup and makes the test flow
>>>> consistent with other per-category preparations.
>>>>
>>>> While updating this logic, fix the module availability check.
>>>> The script previously used:
>>>>
>>>> 	modprobe -R hwpoison_inject
>>>>
>>>> The -R option prints the resolved module name to stdout, causing every
>>>> run to print:
>>>>
>>>> 	hwpoison_inject
>>>>
>>>> in the test output, even when no action is required, introducing
>>>> unnecessary noise.
>>>>
>>>> Replace this with:
>>>>
>>>> 	modprobe -n hwpoison_inject
>>>>
>>>> which verifies that the module is loadable without producing output,
>>>> keeping the selftest logs clean and consistent.
>>>>
>>>> Also, ensure that skipped tests do not override a previously recorded
>>>> failure. A skipped test currently sets exitcode to ksft_skip even if a
>>>> prior test has failed, which can mask failures in the final exit status.
>>>> Update the logic to only set exitcode to ksft_skip when no failure has
>>>> been recorded.
>>>>
>>>> Fixes: ff4ef2fbd101 ("selftests/mm: add memory failure anonymous page test")
>>>> Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
>>>> ---
>>>>    tools/testing/selftests/mm/run_vmtests.sh | 52 ++++++++++++++---------
>>>>    1 file changed, 33 insertions(+), 19 deletions(-)
>>>>
>>>> diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
>>>> index afdcfd0d7cef..17c9bd910c47 100755
>>>> --- a/tools/testing/selftests/mm/run_vmtests.sh
>>>> +++ b/tools/testing/selftests/mm/run_vmtests.sh
>>>> @@ -235,6 +235,7 @@ pretty_name() {
>>>>    run_test() {
>>>>    	if test_selected ${CATEGORY}; then
>>>>    		local skip=0
>>>> +		local LOADED_MOD=0
>>>
>>> Can you rename it to LOADED_MEMORY_FAILURE_MOD to clarify its use?
>>> Since now LOADED_MOD is visible for the entire run_test().
>>
>> Thanks for the review!
>>
>> I kept it as LOADED_MOD and specified it as a local variable intentionally. The idea was that, if any future tests are added that need to verify whether the module was loaded, they can reuse the same variable. For that reason, I did not make it specific to the memory failure test.
> 
> You mean future tests that use hwpoison_inject module? Or any future tests
> that load a module? For the former, you can use LOADED_HWPOISON_INJECT_MOD;
> for the latter, I am not sure how a single LOADED_MOD would work for
> different modules and that probably would need new code for that case.
> 
> My point is that since LOADED_MOD is now in the scope of run_test(), it is
> unclear which test uses it without reading the entire run_test(). Giving a
> specific name improves readability.
> 
> 
> Best Regards,
> Yan, Zi
> 
Sure, will rename LOADED_MOD to LOADED_HWPOISON_INJECT_MOD in the next 
version.

Thanks,
Sayali
