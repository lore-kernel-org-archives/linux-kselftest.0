Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527273AA1A8;
	Wed, 13 May 2026 06:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778654505; cv=none; b=jsOt/ATmqoIyCmXZWBN30b5SYnudtccxe8bYXHBTnZcS6a44YcZsaqfnlmjJQoQkibViLS2OCu0vb1atqngdlBORPlBrjeUIT7mnPq4aTgZq/eBzw+khqQNiJQXAeW/HjEWTCM0cFntCzVsXpiqL9Maeu6fuGrVxzqtpcCw54rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778654505; c=relaxed/simple;
	bh=7R/PjqxKg3Z4XsAbhiXZQ++P5C4nFHaFNQ+CAjPljRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gn5Jv7awzs575vz1sFfnexOrHkRDHz6ojPVp0w7/J0PeAjBVAKWp5SB3FbI0PxSENglIY10XWBDVCQZABBGvRQDHE8fw3vQRUjYDnr/w4HyxALLs47PO/rkT+kM3nFPmY27X/Q1gXXT18uH316PZIaYGl24HbbxpjcgWtaZt4Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=PSmx3S5/; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="PSmx3S5/"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D1mivH3185046;
	Wed, 13 May 2026 06:41:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=9J6n2L
	v2v/q9h3KjXOrjftDiD7o92sAA/McwtKvW1a4=; b=PSmx3S5/Ph32ayIpVA1Daz
	/7OlV+Afi5vdJtkX411ZtcjsnvNrAdP4R4t7f/9tFK1nPlivQMqNCD5k2oZeP9FC
	kDRm9wwFJFMDlVCvi/3VTOI6UzK0/1m76E+XdWudhlPjU5ark1eZPZrTET3AgGRq
	hf6gw33DSP/e8pZuLEybhMOpFeflH43kxKRkNezlRqRrX8w2pwSeNk8xsTY6aUAC
	faC3wnFJcMNO5M7eYERfRLEQsMG/Gj2UCVOmkOx692pUj2crj3xJTlQufbmZfmpS
	3P2LAnAIwwXF42jh1YBXdOFmhs54hRJQafQgIkcSz8N3DiZyHhHfyC+qagF71cYw
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4e3nv5eepg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 May 2026 06:41:14 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64D6dPq1011007;
	Wed, 13 May 2026 06:41:13 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4e3nfgekbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 May 2026 06:41:13 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 64D6fCmn19399308
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 May 2026 06:41:13 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AFC185805E;
	Wed, 13 May 2026 06:41:12 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B6EEB5805A;
	Wed, 13 May 2026 06:41:05 +0000 (GMT)
Received: from [9.39.28.204] (unknown [9.39.28.204])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 13 May 2026 06:41:05 +0000 (GMT)
Message-ID: <826cbbca-c980-4a33-bdd8-d9025951648d@linux.ibm.com>
Date: Wed, 13 May 2026 12:10:08 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/14] selftests/mm: fix failures and robustness
 improvements
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
References: <cover.1777877814.git.sayalip@linux.ibm.com>
 <20260512202439.e71f233281428ff596dab0b6@linux-foundation.org>
Content-Language: en-IN
From: Sayali Patil <sayalip@linux.ibm.com>
In-Reply-To: <20260512202439.e71f233281428ff596dab0b6@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=cPHQdFeN c=1 sm=1 tr=0 ts=6a041d0b cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8
 a=4Y6SIygtnxKvHputqZkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: -NBiRoaFtg3G8PYhRqU2Ni85VOXn7oL9
X-Proofpoint-GUID: RjYf2xpdHsPa3b6eg7wjDpy9nlqUMmXM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA2NSBTYWx0ZWRfX1K34WBEkHxcq
 ARB4HOuvTBtDTK5to5VuerxmCoU7LFr4uZZ/POcaqhKcIIP+W3iCT+p6BodT2L6qLnsLJoZdEHY
 7JzUoXsld+Q6MSYdznt9+v1/lZxL7umvR+UzMWxaeQpTWlSvOeQY8YdXxen3UICUJgn0DeSFjor
 y/FajIzUgmk3GF4cXpHEVHXn7Hz/cFNcN/xx9Jqa16cdOKywnDt+ULwOYPvFA3ajfOvFw5L4Y8V
 dr58SfD864c/IJeDPrjqhbV39f4SFcKDybJYff5HLJFCb4fNRPj0n0lQoaVfkoPQF265cjl+SzY
 4WgSdYgJ1ipVL36qfXwrOLJ6V13dfrrXiEzoo42HyN5bnblThWpD4nrDAIuGjsm2sRavddnfeSk
 0Pa9DMnw8juUeAjFMWwAkxumqQyO8QZPWT6z43//yLSo+WjDUUBsdNpdMQOLWWmH9j8ez0vVKO7
 Tvstu8bsP08hbhhKlvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130065

Hi Andrew,

Sure, I will rebase the series on top of the current mm-new branch and 
resend an updated version. It appears that Mike’s changes have modified 
many selftests, so I will adjust the series accordingly and ensure it 
applies cleanly.

Thanks,
Sayali

On 13/05/26 08:54, Andrew Morton wrote:
> On Mon,  4 May 2026 13:54:37 +0530 Sayali Patil <sayalip@linux.ibm.com> wrote:
> 
>> Powerpc systems with a 64K base page size exposed several issues while
>> running mm selftests. Some tests assume specific hugetlb configurations,
>> use incorrect interfaces, or fail instead of skipping when the required
>> kernel features are not available.
>>
>> This series fixes these issues and improves test robustness.
> 
> Sorry, bitrot.  Mike's monster series "make MM selftests more CI
> friendly" has moved a lot of this code around then altered it.  Can you
> please redo against mm.git's mm-new branch?
> 
> Thanks.
> 
> 

