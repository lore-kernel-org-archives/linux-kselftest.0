Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.55
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794000359;
	b=Q2J27KZjHsB/ok2n1bDfzm3G4XDzZX4eSKJwk2phTMNlTjv2Pvzf31sN+HFJELUxrujg
	 WIyHKlkoebZc3BMVCb9zuoT/4DsWKyDUZQKiiCzgZg1Er8boUvK0Ui4Xvkkd5mc1czwx6
	 i9UMhxvlh/jOC3RYEU+BxRLtdzWCjvqI+VBeSdRMaFfJDezaGnFbEQidnqNQa57B8ZzDg
	 ckXCA/G9bcczQ9ccEvYEwokp1rEHPCn1Jz/N7ZXiVcI4/4iibPZo4859jSFn01EDeCBRy
	 oy2jdLPYd+rLIoHE45h8i/s3g+4jL9/EZpzV18IWLThEmisZgUTVIk0Sc8G3pyKcwDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794000359;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=dyqsHg7vpitMU6S0mFCKx1gpAu25ciOzUS5O3SNFW0k=;
	b=z7tyWpMrKUw8YYZVu48iu/aufTdidT63Qmn5NN1C6bA2EIR0GiefwazAXibji3pGhnF2
	 FD9VLnOUNs00ZDia2mI0bh7QIy/y5BRNA10iFC9eBP3WBGeEAIoIEkCWvCACODNLNhNeZ
	 vm6TH5rH2uFcUPON8p9TVxiTk3PBPecFjaSPeaBjnzmGhCfK2NOq/covwvEaA/vZQfz51
	 jhmCuqPGQDGmU7p4OPHNr9S4+TXk/3XD6zggYWNXM7DwxWHK4y30r5agiw2hH2LNuN+h/
	 t8Q11gJe6DJs9kTGimDX67HzseQE0yDuHVZsfCdPuFKpwm0VmRqgJNxoTOUkkuxpRIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=sQIuJcGl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.55
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010055.outbound.protection.outlook.com [52.101.201.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7F7606A32D;
	Fri,  6 Nov 2026 21:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B7F7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=sQIuJcGl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eqv71gVVLXW1HSLVmYYAnUtNdHlpQlE4MWWlEuYrL+uJ15uNB8wZYbp1bxXPT9xy+ZfyF4w7HRn/fsYo//FdAGuMZ/iYcKXP8MizkE+k7oqziUEShCMtgSpnknFCJVhjrkEFq9+Rz80JuNz2SU6lNQ20ktQAjwOIOok2QyE4Qz8bi/Y39I0zcwT6ea25ejCPB5EvDM1/ZCUKTbrs9Q59iPCWxVGv7xFqKCN34j2k6kdRkjObSFtybVtkewHt7J0Dnk4276EJL1mD//YAiz6nLK9s8W/4qiyW1shaz64RXWtw7lKCPQfMziBNxKFXpVyxe03Epj2YM0SYyJNnSxdN7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dyqsHg7vpitMU6S0mFCKx1gpAu25ciOzUS5O3SNFW0k=;
 b=eU9/3C7+HLcAT/xWnKr18t8HcyC9nkXxWNm0BswhQmOSlrlh5GjiKx26trOWMdpXEbiRhJxy33Zp921LE5n7oNFJkWpE5g/ploNEoXANnWuw7BKLVmipCvhfO4s1IBuCVptftV5o5LUUBTUOehYKBdZnGhoBpsQXuWriP6xINjWo4rVqrdng/Qwmz5xBrEe8MH2nwjMp0++8jON/TiNZhibFinCdX8mpbvqGCFZXP1o3VGJpBe9OeZ80/wLX1FsoPFpvXPdzguemqMuel0gKSWRHWfb6SWzkd9kd0e/5oN6NFOtf1xAo4CyFfUxs2UYTRTh8fHwHY+Vpu6cVNGyygw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dyqsHg7vpitMU6S0mFCKx1gpAu25ciOzUS5O3SNFW0k=;
 b=sQIuJcGl5FHGnTf48yVEmyfbQcLtRng4rgg/bpF9bxjocGEzT2OmGmYNhnvDjUWnmlFTLybOW5RK/vji7XsdVwVIJoWjQPU6UgLou4n7BuCUw9nm6S65GYH0qEAqC3YEm2Y7CPQWj0TlTGSKhqYL573CLOyFjuyArFrx3+jbhfY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by DS7PR12MB5743.namprd12.prod.outlook.com (2603:10b6:8:72::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 21:25:54 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 21:25:53 +0000
Message-ID: <39598840-29b1-4524-806f-9ef9dc2a3944@amd.com>
Date: Fri, 6 Nov 2026 15:25:51 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] selftests/resctrl: Use bandwidth values for AMD
 MBA schemata
To: Reinette Chatre <reinette.chatre@intel.com>,
 Swapnil Sapkal <swapnil.sapkal@amd.com>, tony.luck@intel.com,
 fenghua.yu@intel.com, shuah@kernel.org
Cc: Dave.Martin@arm.com, james.morse@arm.com, peternewman@google.com,
 eranian@google.com, tan.shaopeng@fujitsu.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, x86@kernel.org
References: <20261022132517.46805-1-swapnil.sapkal@amd.com>
 <20261022132517.46805-5-swapnil.sapkal@amd.com>
 <b250f681-5726-403c-86af-cb4bc35b9d1d@intel.com>
 <e30b8e81-938c-4426-8b4a-2a3a8d5163ad@amd.com>
 <4f656f59-9f2c-4774-9d9b-3a4d7b7b509d@intel.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <4f656f59-9f2c-4774-9d9b-3a4d7b7b509d@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0052.namprd03.prod.outlook.com
 (2603:10b6:610:b3::27) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|DS7PR12MB5743:EE_
X-MS-Office365-Filtering-Correlation-Id: 324c959f-ab65-4459-5efc-08df3c4c899f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|22082099003|18002099003|6133799003|10067099003|3023799007|4143699003|11063799006|261028144727099003|261102123227099003|261026140227099003|261026121527099003|261022105027099003|261021121427099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	5Wnk/8rxY6xUaasnjfFw1KY+Tgx4cOCl8NA4oTfr4dygx/UggYqH6yexBcgRr9i+S0OZ5MMFvvctA469YLB1DA5mLpxOn2FfD7VXQZhRMKuW/gM0mLk9c+VVkbmkft996MxBWnT55AQDfZZnAc3d2KlxE3q034cZYbbVY+hyHbbCjl9OoWnwAtmXlVUfQDoe7rtj0/b2kxhd9o4rGJa1S1VMpU8FOAw9uhi+M5BksAjQgJRpb/1wnuqwsTxmOu/D6eYq29TacEADFm8X6gaHSXot/ZEt9JWFY3t4ZnMBJnosYONJwxiJrCTmLIWwBEeCqKia30iWkBv/ZeVfm95UEmIrG3FVh6KvrwWOADWl0fZcvYhkl0WBPBfWWf2pKg4AJ/rXOsi4cPKkJHpowC/m1ut60KQ1j1+tw4n0LyVUL103LqLoqydSQRbQ1U9AB7PDZUthOufiScGzmYWZdJ3PLAk89GAtpOwSRjAJ79nGt9OqhqJGCAXvFZmkAfk5AjQ80W+EkcbEafOBldEsL7dke3+pUPhnSS9yrmlc5Gl0l3wUsryMpgCnbViNREVQacQTj8mA0AXUAJnd4UHrZBtBjLgL30Xvf8cVZkFQ4AgLNb6fhJbSkWIJ4Ky5JPhsNIQfo+HXqn46bWuyXg/FWcF2qi1pkCyJN4mTIzLNhZs775I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(22082099003)(18002099003)(6133799003)(10067099003)(3023799007)(4143699003)(11063799006)(261028144727099003)(261102123227099003)(261026140227099003)(261026121527099003)(261022105027099003)(261021121427099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjVyLzNYV0ZDM3JhVy8vN1pVU3RjTW95L0RhTHlRemhVZ212SDNLa0JlUGFu?=
 =?utf-8?B?eFI0K0RhcmVEaE93OE9mZXJoTkg3WnF2UlhpaTZnb0ZONThMbnpDR3dlak9R?=
 =?utf-8?B?NzBQWnNaYTFUTERva09IZU1jM1gyWmo5U3ZLbVNOcVY1MzE0ejJENjJkdjZ1?=
 =?utf-8?B?VFR5WHI0YndONVAvWTU4U2x5czBoMjQ4TWZjVVE5TUE4dE10RURnWFh5MFZ1?=
 =?utf-8?B?OUs4bmhjU2h3R3lNSXhiaWEyQjFNZjd3MXh4R0tsVGtBck14VUNDNWRLTmZw?=
 =?utf-8?B?cnNmUEJTZjJmUTJzV1lCT0NmV3dlb0hDdUV6dTZCZzY4NEtJMnFCd0hkVFU0?=
 =?utf-8?B?aU4xMUhTZiswVWtreVozclRiVEJYbkc3ZVVmR2ZsUjd3ek5pYUpTZytxKy9Z?=
 =?utf-8?B?N3VSU1VwWWJZd0JybFNGOEN5VTJxWW04UGRpWURjQXU0ME5rZU0reXFJZVl3?=
 =?utf-8?B?eWRkM0VRekpwMmJTYVJDbjZZaUZ3TGFQdEs5WTVud0ZDM0IyV2ZGS2VyaUMz?=
 =?utf-8?B?ajdqa2cyaXhKOWF6WTREcmgwTHdJSVorRVNYVGI0RDNobW1Sa25pVzloWWZB?=
 =?utf-8?B?czlvR2JHdEp3cjdLYVdsdERFZHpxZmxJYVh1RXhsR2w1dVY4eFREVWVvYkV4?=
 =?utf-8?B?d1kzYXNGVDV5S3pzbGtmN3lWdmpqalZCTytCY0pCYVhTSVMvNUNYM1h1ZXhr?=
 =?utf-8?B?Y3BNMXliWFVJUlFZdjhXRzlNdXVhT1M1T2ZubXZSd2VqV1N2cjVKS0cxMWxn?=
 =?utf-8?B?cXBmdkQ5cCtJUStFUmhndERWVXhRWlFWZWo1aTk0N3lmL1hpdlpGSHIwN0Vm?=
 =?utf-8?B?Nk9iSHZaUGpJVTJZQ2JJTjUwVGNkSnc2cmx2RmU3UTVIV0pRSFVMSGdJU0Zk?=
 =?utf-8?B?eGxuYVgrMEpJOGtvZHNLc1hVVk9zc1BXMUR4L2FmZWNBSHB1R1lxdEM3WHJQ?=
 =?utf-8?B?NGVSdmppUVJndzI1TEhtU3FQYVhONUVBYU1KSTBkd2xWdHlQNDVIMWUrYWsx?=
 =?utf-8?B?SXMzVnRmWlRTVmJ2bXBJandpRm51b3Ruc3R2d3E4NE1za2g2c1JiYytWN29h?=
 =?utf-8?B?MklLbm9TdCtSWkxORDdpK2NoVGFKazZWNG02M0szMVRkNXE5NzlqN0dXWkI0?=
 =?utf-8?B?N1hCZVhTaEMzaldha05WZUlxb3hybjZ1YUV1VHpIM0hzb1RvbnZpcGxXQ2ZH?=
 =?utf-8?B?T1RkVXRuSStsZzlXcWR5WXBNSG13ZnFBa0NBMjNWVWhvS2RyYU40RHdUcTNW?=
 =?utf-8?B?R2tQdzA2c3A1TzlJdzhKaVd3Tm1EVDk4bkNKMnpzcU1vU3RybnhmSUhZUTBY?=
 =?utf-8?B?OUIwVzRnbDlaZTZaelVMdStYMnRwUDl0N2dnOWppbStOSXZNWFVKWlFCUjdv?=
 =?utf-8?B?QjlVOWlEd0dYaWpvd2dEY1RyRWdFdWcvOGZSU3ljamJaZC9NMGZ4OW1RWVBp?=
 =?utf-8?B?cEtibklNUnI3UzBnK2lheXA5MFg1TmJmck5zS3RhSXcwOU1rdEgySGI5VVM1?=
 =?utf-8?B?blBiY3pUSE91K0c3eWh4anY3L1dJMWpnVC9jWmRKajl1QWQybHpvb2NIUjBD?=
 =?utf-8?B?aFcwcGJNSytOQVh1dUFSTWk1QUpFMEF1amF2VUFQS3FnQWR3eVYxZSs1eEl1?=
 =?utf-8?B?OWo4ZnJRRmZ0S1E2QzVoQm8yS0VJZTRXaUJNZWtwbzlMWHdOc0tnSVZrbE16?=
 =?utf-8?B?MHBpVGJ3cEh2OHpCWjAwd3Q0cGhIcHFUZFVzMldFN1lvdGpuTG5GVW4yU0tk?=
 =?utf-8?B?MDJ3Z0x4blZ4UHc4VzlSV0I4Ymx4LzZJWlNiSVFaU3ZrSWFxcFlZSEFHUWJD?=
 =?utf-8?B?L215NXdTVmtLcXYyTG1qS3hBaGM1WFNhRFVCOWd5cEI3N1RKT2JOY2VHQXh6?=
 =?utf-8?B?Z0dRbTZCMGNobXdmRlRmM3RCMXFpUkpydWhPOEZQRVVRQ2lKU1M4YXdHRmpK?=
 =?utf-8?B?bU1vNXk3RHRqUmhOTG1rOWRyVUJSQStkUnhOU2NiMlZkM05kTlYydHdDcDZ1?=
 =?utf-8?B?TGlQc0MxUTE1MnpIMVp3a1I4cHVpTUhEdTJXZStpdHlWYnVIejA0SnZSaFky?=
 =?utf-8?B?eVphQUFueHdGbSs5RVJoNkRwaXp4cHZFODJwOThoMDlRQUtPZGtkZ1AzZjNG?=
 =?utf-8?B?bXJhQy8xRXhkY3NLeGk4S1RiNG9rdVlrYWlmSWVpb0dmVDJldjFtZFZ0YmQz?=
 =?utf-8?B?am91STd0WjJtcmcydUxxQ3VzVWxGUEVxUnlkWkM4YWdCUFVKSzZ0TWhJa3JS?=
 =?utf-8?B?blpOd1FQeGZsQUVRRUtpeERIYjBqRlNBZVBnc1Zmb3BvYnU4cVlocG9sazBo?=
 =?utf-8?Q?PfNeBrwrn0av+l78Wg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 324c959f-ab65-4459-5efc-08df3c4c899f
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 21:25:53.6229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bAaleGIcTer/pMawkaj8MZ3AHUmq6QP+bxCJbWvZZgf7eUx0xt37F0cjH0v3xY0d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5743

Hi Reinette,

On 11/4/26 22:16, Reinette Chatre wrote:
> Hi Swapnil,
> 
> On 11/4/26 8:05 PM, Swapnil Sapkal wrote:
>> On 29-10-2026 00:15, Reinette Chatre wrote:
>>> On 10/22/26 6:25 AM, Swapnil Sapkal wrote:
>>>
>>>> diff --git a/tools/testing/selftests/resctrl/mba_test.c b/tools/testing/selftests/resctrl/mba_test.c
>>>> index 17ae73d3476c..947735e26099 100644
>>>> --- a/tools/testing/selftests/resctrl/mba_test.c
>>>> +++ b/tools/testing/selftests/resctrl/mba_test.c
>>>> @@ -13,10 +13,51 @@
>>>>    #define RESULT_FILE_NAME    "result_mba"
>>>>    #define NUM_OF_RUNS        5
>>>>    #define MAX_DIFF_PERCENT    15
>>>> +
>>>> +/* Intel MBA is specified as a percentage: 10%, 20% ... 100%. */
>>>
>>> The percentage based interface is the generic interface and not Intel specific.
>>> You can drop "Intel" from references to this interface.
>>>
>>
>> Sure, will do.
>>
>>>>    #define ALLOCATION_MAX        100
>>>>    #define ALLOCATION_MIN        10
>>>>    #define ALLOCATION_STEP        10
>>>>    +/*
>>>> + * AMD MBA is not a percentage but an absolute memory bandwidth value. The
>>>> + * test sweeps the bandwidth from 4 GB/s to 40 GB/s in steps of 4 GB/s,
>>>> + * which the hardware represents in units of 1/8 GB/s (i.e. 4 GB/s -> 32,
>>>> + * 8 GB/s -> 64, ... 40 GB/s -> 320).
>>>> + */
>>>> +#define AMD_ALLOCATION_MAX    320
>>>
>>> The AMD maximum is enumerated from hardware. How can it be ensured this is
>>> the appropriate maximum for all AMD systems?
>>>
>>
>> As Babu mentioned, it's difficult for a single-threaded workload to
>> reach the hardware-reported value. For that reason, I used these
>> values to verify whether throttling takes effect.
> 
> Just to confirm, my question was not about needing this value to be the actual
> maximum of a system. Instead, I just wanted to confirm that this "320" value that
> is hardcoded here for all AMD systems is a _valid_ value. Since the actual maximum
> value is enumerated from  hardware it is not obvious to me that all systems will support
> this hardcoded maximum.
> 

The value 320 corresponds to 40 GB/s. I have tested this on several 
systems and was able to achieve the expected 40 GB/s bandwidth. The 
tests did not fail.

There are some older systems where the test is not expected to run 
because AMD UMC support is not available.

If you are concerned, since we are no longer depending on the maximum 
value, we can be conservative and start with the following adjusted values:

#define AMD_ALLOCATION_MIN	32
#define AMD_ALLOCATION_STEP	16

This allows the value to reach 32 + 16 × 10(num_allocs) = 192, which 
corresponds to approximately 24 GB/s.

Hope this answers your question.

Thanks,
Babu
