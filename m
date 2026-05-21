Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C6B3DD532;
	Thu, 21 May 2026 12:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779367834; cv=none; b=nwbivx72IAVXpfx8QxBa/ChCH1qiaX9sMO0/35bL0ubhx4pbNlRDgSimxP1ZRSX+uzppaqWho1BspIkh7WSXN8vkJWM0Km7q3hQZsBiGLRviK0S6utQEOQipYGw6kWZVyOSYTwu69MugL3oC5OTM5qxMye0RZPNn+zYYaOjlXpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779367834; c=relaxed/simple;
	bh=cQ+8vKRBCwxZgVfUo+dkYcspnC9qqt3zeu55Qw9FmGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vv5md6fSTKi1c7ABCBr7uc3GhiRbl5LckmP94H0bRpbh/0EbhXkWwZyB2Cm0HwK5rthAe0c0jzVenwgezfPYCpqdIMNlHMkINTMskmVp+aorn53AI8+mtkUBk/tIQhzh3MqspEb0jeRiRMsq3fX5NkgOaCadMzMk3AgNXxRRirE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=AtOom/F4; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="AtOom/F4"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L7dqDB394602;
	Thu, 21 May 2026 12:50:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Nb8HcH
	ohl6ZMAOWhdPfbNsQPZkLpIUnnAWIDe04J6FA=; b=AtOom/F40sO3teBktgKVgw
	xe7Aycy+4hlqhH9zp32Obfz8ubAOcrMwyP/2bMh24Hi+dkYXKCzkosX45SjmQeK9
	dcy6OCnHoY5y3CKl2t4MypMTEMHzGYzdaUp37J40esYaSccL33Is6kIZhd7kbgoA
	jNgcAh5fEe1hoNMEL2L+Iqgr5QfFC3HURI9gAQ05YipvzVY8KrMH5GDDN/9on6Mx
	Aa/UrF99KDFroZ4KjchWkHCk53rjRoPB6rGJLmbIlExjOMUDUNRvs5Iay93uVpW1
	xoiYBNw1LWIrFZYVe/biWvHKrUqRDj2Slm4esuSfNl345Eosd/kvHON13S61OF7Q
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4e6h9y7025-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 12:50:30 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64LCd3Fh007405;
	Thu, 21 May 2026 12:50:30 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4e72wqcb0x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 12:50:29 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 64LCoSwA45875528
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 21 May 2026 12:50:28 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5CF002004B;
	Thu, 21 May 2026 12:50:28 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 31E6020043;
	Thu, 21 May 2026 12:50:27 +0000 (GMT)
Received: from [9.39.17.57] (unknown [9.39.17.57])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 21 May 2026 12:50:26 +0000 (GMT)
Message-ID: <b9bda4cb-8125-4612-b6ba-9694361e7509@linux.ibm.com>
Date: Thu, 21 May 2026 18:20:25 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/filesystems: Move file_stressor to dedicated
 subdirectory
To: kernel test robot <lkp@intel.com>, shuah@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260519104210.11836-1-disgoel@linux.ibm.com>
 <202605192100.DvRgEGZ3-lkp@intel.com>
Content-Language: en-GB
From: Disha Goel <disgoel@linux.ibm.com>
In-Reply-To: <202605192100.DvRgEGZ3-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEyNiBTYWx0ZWRfX4qySvzHASD8e
 4UlzgqVYoc4pU0nhBhEe5+mGHR1DwGOqp3kNMtg3vLseq8IeIXw1YKxAq7NO2nJS56F9UggRRcf
 rHfip+9sAC7EcSTJNJnPQiec6aCgOiJtChiVGkXyGKdg2pr1SbrWWDto+guCADD10GQR6XwlnrS
 nKNt6I0sHPIg9IL7/LL3HTE63BJGliBVOe4Foqhsay1JTHrMQ8hOl2MX0CVlZFN7r1NEizeKcSk
 e1nKJhaCGi1c+34590j7hgmpx4qSn0onT3D+z3kuVZIukhZAib2/KY0jK/7yBx3YraB82155TW+
 lwR17R9R7l0uEfWhs59+Mn6JQsE85hORJSFUAs/yFojz8dvATgQ7Kdwn+HdQD4+D/5zpWQQQ6tN
 /HiXiVl/MPenQHrypiyWgo+1OXOIbseOOtPkYJoHVjAJPz8anCagjEjk2HTw9rE9DF06N52Wv5c
 zLY2JeB+osiblQuO6aQ==
X-Authority-Analysis: v=2.4 cv=BNuDalQG c=1 sm=1 tr=0 ts=6a0eff97 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=anyJmfQTAAAA:8
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=i3X5FwGiAAAA:8
 a=QyXUC8HyAAAA:8 a=S1w3OjsLY70aBQMZpDsA:9 a=QEXdDO2ut3YA:10
 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-ORIG-GUID: 7-rHGWq7GS084NPTuCCsZaSKxd0lrJze
X-Proofpoint-GUID: 7-rHGWq7GS084NPTuCCsZaSKxd0lrJze
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210126

On 19/05/26 6:48 pm, kernel test robot wrote:
> Hi Disha,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on shuah-kselftest/next]
> [also build test WARNING on shuah-kselftest/fixes linus/master v7.1-rc4 next-20260518]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Disha-Goel/selftests-filesystems-Move-file_stressor-to-dedicated-subdirectory/20260519-185602
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
> patch link:    https://lore.kernel.org/r/20260519104210.11836-1-disgoel%40linux.ibm.com
> patch subject: [PATCH] selftests/filesystems: Move file_stressor to dedicated subdirectory
> config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20260519/202605192100.DvRgEGZ3-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605192100.DvRgEGZ3-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605192100.DvRgEGZ3-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>     Documentation/.renames.txt: warning: ignored by one of the .gitignore files
>>> tools/testing/selftests/filesystems/file_stressor/Makefile: warning: ignored by one of the .gitignore files
>>> tools/testing/selftests/filesystems/file_stressor/file_stressor.c: warning: ignored by one of the .gitignore files
>>> tools/testing/selftests/filesystems/file_stressor/settings: warning: ignored by one of the .gitignore files

Thanks for the report. This has been fixed in v2.

> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

-- 
Regards,
Disha

