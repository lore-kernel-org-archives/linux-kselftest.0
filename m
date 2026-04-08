Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2EE3A3819;
	Wed,  8 Apr 2026 20:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775680568; cv=fail; b=aNPohDowk/vXpusCVCq8bg8GQCfl8b8Y0nHQF/sw59fR05uJftggsg+z3NA0A+JYmQaG/Ecb0OxZOboxIQhBXS3QKe5woh6nDRzGSkgL30CkU4J/Tuxt/DJmacu0nNpedeajy6TA/XdyCC6YSelrzbnJwsxXRl1S1v9Iba9o2MY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775680568; c=relaxed/simple;
	bh=UqLEGvZdoJIfyjFWfIG9gb0za+fWEhT/VUIafL+IAGg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oF/Wr8ltawrGxWmsphiBfS0b5dv6g8BGEeEYFvnMlKuWN1M1/pmMuioSO1v3ElbQtjAa+uSNcMz8PRt3lmt8RXqEYFN3CyOySbf7T/M/kVgsMERLusN91EZi+nSBC+Pru93Xuv0LEaQGYon+jZkQjjHDU0OXDBEZ8X1ml8p6GmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cdTCglx9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=aSNOjFbV; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cdTCglx9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="aSNOjFbV"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638KBXLt1463997;
	Wed, 8 Apr 2026 20:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=spTVXylMvx0q5sy3vOijXy6dU/P52BxGx70W/t4A1XQ=; b=
	cdTCglx9J7FkXzXe04nsyuGtkISQkiAU7stDCwLLevKD01EGUpkPgLa/S9aUXlSa
	9i3FbDTFQHJwNQk405/279QfKbuVzzAWJ+MDNSn9CIiHOq7mi+FeZRHUZ5dV60wz
	2RDquI0EdiTQW1tfHFY4zRJ+J17ka1I/mijpycENeOGudHsTZYgoSRZj8sLp4vcW
	tYIN2iBvQq0PBp7PKgkaQ2ajfRCYJ13OA+AonWGG8FlkFFD4+h2W/HsmyKQEnP2h
	c4V0SnIQBgMr/vX4Svaql6qjNWYIO8zECQna23nNNZnHlBx+67cQknXcVYkyU7jo
	kAtHzvjo6EojBL1ihfXMIA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4dcmq9vay1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 08 Apr 2026 20:35:54 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 638IY9kC026185;
	Wed, 8 Apr 2026 20:35:54 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010002.outbound.protection.outlook.com [52.101.193.2])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4dcmebsd8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 08 Apr 2026 20:35:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EE60YxqNYmueurgjVPVuadiAauqEY4RY6WiCHiNyPvGtksP2FJNGazhDJAuZgne0SzD9qmhjcxHnc5JRhwEnklSmkmhkzDH9kZNyHgbEmXyrlGxPg9LfJSFBKPfkAe2nOfdqGHjkxDI7XTnbtf6xI2vb0cM79Y3MhQS5qtk2a0xslUGE0cZZQpK8HfvnndfuACGavYcIMvk/LZMWDs3wHGLoL9uHhEr2ZIOiyqdbQwuQfK+cMkTGYX/NCYae5NxctjSc7MP8j64twR2Jc+8jHXlP5Sd+Y/LmYqhZ2z2jDk606YxFwo4OSChKxqkt8B/hNVHmcYeigO1OhPXHEBRx9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=spTVXylMvx0q5sy3vOijXy6dU/P52BxGx70W/t4A1XQ=;
 b=jruI+5g43dvtnbqKXDfyEla7eGhf5AMKNKkJyZn5O4BuRP3vF+oU08T3IdXADyB9JFTnzpvwpIeGsLLLTg/aygcsNFswGHVWD0QXQOI0uiHXqkHhPR4d2luABICZbAiK8ajW+uw5KvsE96FDUjIWuP2lEVuUuXWK2olFeNAT+Y1vITR1Utx0yk0hDnAAtZwMrvnxWLqJ8JI3f43aSuntqEKfgVK6w4D9W3VQSxrhzWZ+JqMO4S/FD1YVV1JHkDEwnR2NHza3TGsPxUmx5IJ7bDVlPdS6GX2YIIRbPYrTp8hy3JWoPjGEydFFG0uLvijRBtltyaUSEvEWRRtA9Ok2Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=spTVXylMvx0q5sy3vOijXy6dU/P52BxGx70W/t4A1XQ=;
 b=aSNOjFbVGv34RC7gioc6DDg7HCxe+B3yv3NbZSqSMZaRy+kT/ZVaUGzKr5Jr4y+xo4vo38Q9Mpf5LTLfAx/CdfOBOx1HGGX4GVOyIU2PPWY6zMGaTw82QyrjyUGOo0yg7a/n8ShINXFMAjNAY7bPUHbt02fRafYvHavceuzzITw=
Received: from MW6PR10MB7660.namprd10.prod.outlook.com (2603:10b6:303:24b::12)
 by DM4PR10MB6861.namprd10.prod.outlook.com (2603:10b6:8:106::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Wed, 8 Apr
 2026 20:35:50 +0000
Received: from MW6PR10MB7660.namprd10.prod.outlook.com
 ([fe80::c2dc:a34f:6987:1230]) by MW6PR10MB7660.namprd10.prod.outlook.com
 ([fe80::c2dc:a34f:6987:1230%6]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 20:35:50 +0000
Message-ID: <83b56ffb-6e2e-4c9b-b0cf-9f04b61ebe7f@oracle.com>
Date: Wed, 8 Apr 2026 13:35:42 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] selftests/mm: verify droppable mappings cannot be
 locked
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, david@kernel.org, ljs@kernel.org,
        Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org,
        surenb@google.com, mhocko@suse.com, jannh@google.com, pfalcato@suse.de,
        Jason@zx2c4.com, shuah@kernel.org
References: <20260402235933.10588-1-anthony.yznaga@oracle.com>
 <20260402235933.10588-3-anthony.yznaga@oracle.com>
 <20260403123120.82cb5becb19e1b572d474394@linux-foundation.org>
Content-Language: en-US
From: anthony.yznaga@oracle.com
In-Reply-To: <20260403123120.82cb5becb19e1b572d474394@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN0P223CA0001.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:52b::19) To MW6PR10MB7660.namprd10.prod.outlook.com
 (2603:10b6:303:24b::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR10MB7660:EE_|DM4PR10MB6861:EE_
X-MS-Office365-Filtering-Correlation-Id: b7c0ed91-887b-401a-b830-08de95ae6c26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xVA9PbnDf0kxcSJK9+ernmRdmyyqMK/DQB33cib2YqG9JRhSS0nZO2jKFIZtpQtt5iHxYIYnO9IJHcCMY2T6t1+bxa3cervBYAD/zB7cFNIm8YvL7bvh5xiYGkKQS6VyNum7fqaqClH2bAWIvr77PMfYJiyCVrhgVe+rE6lX4wmUTbzYUqv45NMuSFyDC7Q5/Oj3hfPN5+WccpPYjopFzIkNVpa0XrfT1tXa0ftp6dXNy1XTj/emcUFXI8TuvBIIX0B0ujQnknWFZlaBYZEcCuB/aYKr6Rb1gaLGWxxHJYz+gr6VFvrnON181sxTTNy3pwruKyX77O2k+v7V+8BIyxTvM/p+DIfjNabUAgdb0N/OzyPb/hc1BAFGgQeuqPjmeaSTeEQ90JXB0KTGc564Vpc4bzpt0ntHKi6KkVz5rsL8D9GfqIRTZmuAyKRHzL3/V9ki8JV2pfIhC8KPhDuVVanH7VcxDlT3YcxATV6YmWLztf8cQiYmjfe3ew5qwHn34zvv/Yf0qu1o90F6wEZY6t0+EmUZWA4RpHbKlzsxtQW81uIu8EX4edhvK70zLlaZph21Ea8txBcmPILHGjLvo0brAoz/qa73qlY5XnzhJjZthMoVnGmNwrnOkPYevUIOEaPi3X/0zLR6XXFiz6qnztOfxKMZBwE2yKLIrK1MwEk0MC0LtG4FdnKZE5lA3T06
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW6PR10MB7660.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mlk5cDdZL1B5UEczVmJxZnlWeDQzUHFvOEpIb1hiODFlWWtUSkJtQXJzV2VD?=
 =?utf-8?B?a3JZRlZvWVhQVXdlSUE0cWczSVIvRWVEMmdJRDhwd0U3THdsQnR5eU0vb0ZH?=
 =?utf-8?B?YVZIRkZtbWVQaG9OdXdkN0NUTkFDQytvVlp2dFphL0RoRXV0MkpjMHNpNitD?=
 =?utf-8?B?NlhnUWErSzZvVFlQSWFRNnZFRDRQdHF2aUR6b1k2RnFuTjlmekM1TGh1dlhu?=
 =?utf-8?B?YkpHSmsrRmdOSzVPMXJrcVVJVlJnVk5Ja2JqNENnbWJNczNvV2lIN1BKTTVW?=
 =?utf-8?B?MG5XR0s2YUhaVnh6dm0zMDJzMmUzREJiajZiZDk5VFpRSDdLNzV3VUhsOGl4?=
 =?utf-8?B?VkhMNDUrM1ZWYkRRVHdjZTh3dUpFUC92b1dZQlIyWWdRcng5M0Mzdk5jTXla?=
 =?utf-8?B?VTlDZ2J5UnN6RU5sbzU1WnlBWno2cUFIN1Fodlpsb1dPRkxyTzJPalNEMi9G?=
 =?utf-8?B?SGluUW05bjFJcFlzaWMwR2tYY3NtR2FpbzllWUtxQ3dYMTN3MkNMSEJWbGRo?=
 =?utf-8?B?WU9LK1hjSE1GemVrNkpNcDNKSGFvZk9sT21Bc2JmSWJwWU9ocEZqNWk2L0xW?=
 =?utf-8?B?VHJUYU1ueGE1cS9IRFovVlJaQUJwWmFXaHl1ZzYxMkREK0QwNVJvb0VuVmxD?=
 =?utf-8?B?alNtc25uNGxVelJLay9XaTNpdmFvRzl3VDZkanlSM1pKOHcxQkVGb1RCSG5o?=
 =?utf-8?B?L1VwVVo0UlRjM0RINVdoeEFES3ZkM3lURDN1bzZ5aDZWbGlVVnlPaFEyeEFW?=
 =?utf-8?B?Y0w2bWtXYTF1bnZta1BBbHB5T0dtOXBaVEwzUmZad2IxellTYmVKVHBqOUlz?=
 =?utf-8?B?R1JvdElKaEM3eng4NTU0ZUlXTCtjeDEyNGdzZW1XVEFEUUJjV2JIb1VwN2RT?=
 =?utf-8?B?U0JZZ2xFbzVZaXlyeXBIZ0JqZkg0MHR6SjMxNmllaTlkTFJVdkttams4OWM3?=
 =?utf-8?B?ZGRleDR0dktWSlVwRzZDeHpoVmpzMkZXeVBOTC9ZVzFHSE41QlBHOTkzTEdO?=
 =?utf-8?B?cGdUUWl6V3AwdHNyTURiN0N0UnRJdTBmdENpVjdKK2hiQTNJUi9MbzFYamZJ?=
 =?utf-8?B?WE10VE1jclo3biszMFNIRmpKR2VibE05WFY5Y015NDk0K1dWanZaMThYWGZG?=
 =?utf-8?B?NndnRHlxQVJ5UmhRWlhtSlU1ODdQU0dINTh2Q0hSMFNTZ1pRVUIzRWxKZUZG?=
 =?utf-8?B?VGY0UzhXanJYeU15bzUwbHNFWGY2TnpwcE5hN0dGZCs3RWpEUWpzNW5KWjVS?=
 =?utf-8?B?NmZZZVZXNEkzUFkxejA3NG1GVzM5bldGdU9wVlYyMmRwMmRzM05qQU9nNmlQ?=
 =?utf-8?B?SDdPTmpicXNuV0g4ckNsbndzN081RUlWa0xJYlBkdjN4RVc1RHBoWndtRmhH?=
 =?utf-8?B?TlNqQ0JBT3lzVFE3cWxsU3hsdzVQaGFNMEl2MkNEZnI2UnJYelJ5dndBTnBu?=
 =?utf-8?B?MlArQjZKdEpBcXBkcnRzRWd4d2hxY3JSUVUvSzR2NGYya1FKM0dMci9IbnRq?=
 =?utf-8?B?ZHBSOUcwVUd0SjdHZk9FWGQvQXlFdXdpMWlQNkd2eVB3bzdCQTRIcFZhTVcz?=
 =?utf-8?B?L3ZiVWVicVBHYUx4WkFOUTM3L3QzelB0cnpKeHpSY3QxQW50aTdKSU56Vm5x?=
 =?utf-8?B?S2g3SDN1K29mMWF4VkpDN1JJSWJSL3V6VGNHOXFtYzF5NWFKQmJxSVJIUGNq?=
 =?utf-8?B?N2hSRklpbEIwNmlEalNnTm8vcEE4UmlIMFJaMTJYSUxtZG9qT29lUDg4Ykx2?=
 =?utf-8?B?L0VqYkxIV2hMTjBaL3FTd2NuYmxpVGFGODNWK0dabFhoNlNQckRGaUZKdksz?=
 =?utf-8?B?RUY1TmRneGtsbFUzQlEweVdCcUtpNDZ5ZEwxajVOUys4TFdUV1Y5Q2Fhd1Jo?=
 =?utf-8?B?amlDQmNFcmZCV2lFQU5FbWpKdm56QWN5c1NyTHpXWCttVThXYUxxMm1TTjRN?=
 =?utf-8?B?Z3prRXppMWRlRktCL250VEJScmhEMmRITld0aWNIQTBJVGFxVG5GcWN1UzE4?=
 =?utf-8?B?Z0JHbVRNUEdhUzcvOWNKY2tsSFovWHRBS2pGcXdxSENVbG5mUHMyOURnZVhO?=
 =?utf-8?B?ME9BbGc5QXdOcHVoZllJSDVPbk5lQjVuU1BwNHVsL01mQ09kWldGRFo3SzY2?=
 =?utf-8?B?eVFmTVhMR2NlT1g1Z0xCbDZ4VTZkeG03KzVUTHZMMWJPRmNBcTdXcG5RZW9Q?=
 =?utf-8?B?Z21VTkZRTVJHd1lkenFsTzJpbzM4THYwWWZmbHRQYjA5OFQ4eHU1U2tyRkp1?=
 =?utf-8?B?VkVsakc0RFpuSnZpUkV3Tk0wZWdpNkU0RmxKNlpQUGppWlJwN1BQdmFxS2NU?=
 =?utf-8?B?NEZncSsvUVBpL0FiV1JkeHRhQmhqT3B4T21xWkpZNjBobFpBRWczRGp1NnhR?=
 =?utf-8?Q?Vbcqt+K5+kawHYYw=3D?=
X-Exchange-RoutingPolicyChecked:
	Bxwk4iOJeOSh1Oc3AplJVJvksyHf/vGdXSHjQV1Ljcivu+BTaKmHkc3sqt6kU01TUvix+0sDC3LohWcEI2YwlepZZkXQVoWWH7AOniWBteP8kUqyWipd8ppyn9TpKEABXsm1CiLybuSJPVf6eHvfSWiXA8bISkWKB7kw2HNm4ueFCpG9bqO/lEz7Nsjjg1owvzt4x3JBoDn7r4zSHDak385PbKtAnP25Me8cNAl7GoWgfVEaoUJTEnulqsKD/zEkdpUlaAOPVj2jMGc+Upsb1bONzlsaezW1SGoTyS5JhIbJJyaLUT42wpuWuactl8jwyctcUERRlZDxeA20CvZlAQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IKqv679NqWRMLZBF6/fyixie5fms05Mvac4MEe1zV00W5xN4Bf6QcmHvY7Fh9rnRcoS5S6k+SruGTKZkEv0hAP7IF8ZBvIWrrGPzxcc2oCek8yoQgHvO/cKyDdx8YfIVCLa3+HmN7C52Z+PTAeeLX969OTKZEQYTEQxSrdXqIR+t/i99VdwC9iwfK3qBJPIJJLbHw++wfJ20m2HB3+Pul+hEWqrg5ceaKggHwUy1hA10gCYmxAJJXTd9U+3YE2zVAqA9JOXGm10lLoWyflER6YH33W/YrNgq3MOqq9CS0hEwr/622sln9lOstbTIVFGE5Cq80tz8Uvz94QSzV06cylBJqCYuPTk/GLRe/Szy1zIEeWrhdsC8puZPYWOBzbk0j4efLoP3nux1d6an9hPgQQ90KqfoFddfJFcZr+fzS/Z4NYQXE/mt8ZfadBvg+RDtW0NEft1FtLXXMnSTl8l8Q2BepZF9MyP0+/HIHzLd7CxMYcwlUUBQCp2lzWFIAJP2HNdBy7/yEw+moZqrou1Vq1il82CVyKNoZ7tGSXe+gYDBDq2IWu9+raQVRTNPYl8HUUriT/t8au3ZAte88WKGx1CbCvUMcHWEROHFvuB/zgs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7c0ed91-887b-401a-b830-08de95ae6c26
X-MS-Exchange-CrossTenant-AuthSource: MW6PR10MB7660.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 20:35:50.5819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LqL8DWx3FRKhr4h9ocRKRU67PoAqviH263tcn/09IxP4SI+EP9Jgg9BHu1NVWt/h8D/KxDAlRnH3I1822mrZSGr+k8P33QghUDFTuWUsvUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6861
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_05,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 adultscore=0
 phishscore=0 mlxlogscore=990 suspectscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2604010000
 definitions=main-2604080191
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDE5MSBTYWx0ZWRfX2c3+bulM3xwK
 Scwc0y0ZjskABhIo88/7ANZFuVGHFxTNN8Jyioz+q5xAKgLWkrzMDO/U1OFe52vKTKaMLSIs2Wq
 cvacpLft2O78f6Ofo+4kHZxhIFTM/lp821zKvq86brNdtmqh+UKBfQOIhxisfEPwUSLU4cPMW6t
 6VcKhE2Rdu7TE/4cRgl+qHuQHvKj5GEbauGemQzi2wqRymgl+FyfNNe470uZxJaaaM2d83yBPcY
 ABQLm0iGCmQlUiqojsjSSJO1KNDJhnaLB77CS9Dy6/tG+UVs684+6jSVFcsVaUsFm2vOj0WduGT
 ApynqUXm9fe+8dwWJAtTFdWjQExSlCSb6+NBQF8RgypxujokzH8A3b543PsY2dRgeGYYcj8qO62
 mm0uLL/jMDhn9sY1c1x0KPWF3xYRB/swUPiAVJdMOdkkPC+rxfxXG5mJ6Zyo+zHnh8sSXSUHik0
 Fv5yqOk/SfUrQjoLdLBXZoo9ohPsne9s0En/sbHQ=
X-Proofpoint-ORIG-GUID: v03-bCj03k-lMqnCjvM3n1bOzX-85e4S
X-Authority-Analysis: v=2.4 cv=MaJcfZ/f c=1 sm=1 tr=0 ts=69d6bc2a b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=o5oIOnhZENCTenyL_yNV:22 a=c92rfblmAAAA:8
 a=yPCof4ZbAAAA:8 a=VrYRbosYpvdKnHUA8TwA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=GvGzcOZaWPEFPQC_NcjD:22 cc=ntf awl=host:12292
X-Proofpoint-GUID: v03-bCj03k-lMqnCjvM3n1bOzX-85e4S


On 4/3/26 12:31 PM, Andrew Morton wrote:
> On Thu,  2 Apr 2026 16:59:33 -0700 Anthony Yznaga <anthony.yznaga@oracle.com> wrote:
>
>> For configs that support MAP_DROPPABLE verify that a mapping created
>> with MAP_DROPPABLE cannot be locked via mlock(), and that it will not
>> be locked if it's created after mlockall(MCL_FUTURE).
> There are a few queries from the AI reviewbot;
> 	https://sashiko.dev/#/patchset/20260402235933.10588-1-anthony.yznaga@oracle.com

Interesting. Of the two issues, one is certainly legit. I need to add an 
munlockall() on early return from test_mlockall_future_droppable().
For the other, the question posed was whether the tests should handle 
possibly being run on an older kernel that doesn't implement 
MAP_DROPPABLE. It seems to me to that a selftest should not be expected 
to work (or even necessarily compile) on kernels older than when the 
selftest was introduced, but I don't want to assume.

