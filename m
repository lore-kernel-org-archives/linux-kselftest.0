Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1B33CF201;
	Mon, 31 Aug 2026 09:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170054; cv=none; b=LcAEUkF/YC2LbgpzH9jTNwmAkrUokME6uvb9/whZzk5Owz/vH6WWswk0ccIxyYWbbRA8gwAH8NUUzGx55jNrDZxOpnz2C7MsdATbmVRp1ReXIy48dwV4b52gEgQXgZM5QtViwd60kpHRmRh/Oa7CY+HdA6VGFcIzEqiuXxMIUts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170054; c=relaxed/simple;
	bh=WPYILjTj1XhEKKnetHI3GAXEdVYhCS/Rgz72+FxXANs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FSKjm6swSjBOvShA2Lc8EaEw9bYaMwCpJb0dZF5EJX9JGdNNuh45tLX46CqFPcHInvRguX93hXD5V88pu13tNSF7thQpfEk/2M8hlSOFm6tO1KnFSMsIjz21xnKeNKiI1wut1ZVJIBRVVAVGlLi5USPpqolazBAK0Qw241oN6dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=sN2Nh/x1; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="sN2Nh/x1"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V82VLh1698357;
	Mon, 31 Aug 2026 09:54:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=8c8dyg
	oA7sjX0hep2C/MKWpWP3yipeywymZHuoWawYQ=; b=sN2Nh/x12M1u1jG4uOCOdf
	kgVkp72FQSr2m9UnnDC7iJ5ArsjXjls6xRPkbYVl2FE4up8NaNvLhdCNwPsIYu3M
	MtWijo6WuxlLDRBAnLvLJGf6Az6cxF4D+SKBlbH7t57RucTI411dWZO/xz3DMYF9
	pNTHgLp2UGlI7gPz8lsQrtsk+jePw6REf7TmoA2jlFPHJpGv70SgQETdySSWSlzC
	vWepcqIchCb71LkCsG6sN3wYt+8/46GD9dFfd4pWmZ+2LsH5F3zAPncS8zMlemkH
	9p8HA+hKWRuO6Kz2IPOezq6Ivb/rN0GED9f4MWhxOH5ocUfuPBy+XTbzmNZAyxpQ
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gbq2t0ad2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 09:54:08 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67V9faAw007679;
	Mon, 31 Aug 2026 09:54:07 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gcbyg50pb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 09:54:07 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67V9s5Pl50594182
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Aug 2026 09:54:05 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CABFC20043;
	Mon, 31 Aug 2026 09:54:05 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 439EF20040;
	Mon, 31 Aug 2026 09:54:04 +0000 (GMT)
Received: from [9.124.216.250] (unknown [9.124.216.250])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 31 Aug 2026 09:54:04 +0000 (GMT)
Message-ID: <31368a5a-989a-46ff-a3e2-ec0e7838a7d5@linux.ibm.com>
Date: Mon, 31 Aug 2026 15:24:03 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] selftests/filesystems: Move file_stressor to
 dedicated subdirectory
Content-Language: en-GB
To: Christian Brauner <brauner@kernel.org>, shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
References: <20260521101758.14639-1-disgoel@linux.ibm.com>
 <20260831-klopfen-gedenken-vorleben-54fd9d119a83@brauner>
From: Disha Goel <disgoel@linux.ibm.com>
In-Reply-To: <20260831-klopfen-gedenken-vorleben-54fd9d119a83@brauner>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=bc1bluPB c=1 sm=1 tr=0 ts=6a954f40 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=DQmHLPe0WECjKNEuLnwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA4MiBTYWx0ZWRfX7839bKwEI/Vu
 lV1CkMeTZfqfxAtct1PcZUmnwC3MHZRf3uc7o1TM18HQkV1nuSw/45NaAQvR43ve8bqnT23leC8
 yR4VpoBFtK1fCjKXmnM3n96taSUv1oM=
X-Proofpoint-ORIG-GUID: 1TJOd8xgtVa6NGL89rsEhfl0uZg6SWNo
X-Proofpoint-GUID: 1TJOd8xgtVa6NGL89rsEhfl0uZg6SWNo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA4MiBTYWx0ZWRfX4QyjFZ1P7mix
 9+tZrZoKUU2sU5WcXOl6ckhuydIqLexby9SCPVkt8wvdaDkKCg7obdd3PnTu6SYOVGsayu7VzVw
 k7rP6WGcX/P90WSoXHiPkfxlj6ACt9aeUyzpaOytWIZvx73+DRdrs53Bo8nWdJ8N1yK1louvEcr
 Apw3RRfVHUmJClqpI7Eav3hxF2JI04LQO4v1V+cVEcbVg2k5kejY8G9HFwjpPnJNoVGC+NvXmZD
 pFcLkVE+rz8541+V/M8c4b/JmrbucvsrwbwKecr/7JWsl873uXiaEV/7xFYgYlmhjQ6XLCk7BOo
 vr61Tohb7s9/72E3MgfddL562mHmTHTIJj5dkMJmm7y6ZOTvTT37qTxOGwX7DlNpoYBZkU06hfH
 L0db6WTKoKsUz6o+DlIL4J7S0bDSp3fr95quzIYGkNfFx23OtfZvqpskcJqnVbv11DYdUsEGmk+
 06RYpVWjiJBQfkhKZBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310082

On 31/08/26 1:20 pm, Christian Brauner wrote:
> On Thu, 21 May 2026 15:47:56 +0530, Disha Goel wrote:
>> The file_stressor test requires a 30-minute timeout (1800 seconds) due to
>> its 15-minute runtime plus setup/teardown overhead. This is significantly
>> longer than the default 45-second timeout used by other filesystem tests.
>>
>> Move file_stressor into its own subdirectory (filesystems/file_stressor/)
>> with a dedicated settings file to isolate its timeout configuration. This
>> prevents the long timeout from affecting other fast-running tests in the
>> filesystems/ directory.
>>
>> [...]
> 
> Applied to the vfs-7.4.misc branch of the vfs/vfs.git tree.
> Patches in the vfs-7.4.misc branch should appear in linux-next soon.
> 
> Please report any outstanding bugs that were missed during review in a
> new review to the original patch series allowing us to drop it.
> 
> It's encouraged to provide Acked-bys and Reviewed-bys even though the
> patch has now been applied. If possible patch trailers will be updated.
> 
> Note that commit hashes shown below are subject to change due to rebase,
> trailer updates or similar. If in doubt, please check the listed branch.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
> branch: vfs-7.4.misc
> 
> [1/2] selftests/filesystems: Move file_stressor to dedicated subdirectory
>        https://git.kernel.org/vfs/vfs/c/5550456dad37
> [2/2] selftests/filesystems: allow security.selinux xattr in listxattr kernfs test
>        https://git.kernel.org/vfs/vfs/c/cc87d0a97bc0

Hi Christian,

Thanks for applying the series. One note — v3 of this series was sent on
03/08/26, and patch 2/2 had changes compared to v2. It looks like v2 was
applied instead.

v3 patch 2/2 link: 
https://lore.kernel.org/linux-kselftest/20260803150837.91604-1-disgoel@linux.ibm.com/

Could you update the applied commit with the v3 version, or let me know
if a re-send is needed?

-- 
Regards,
Disha

