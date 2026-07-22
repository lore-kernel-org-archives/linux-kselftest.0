Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E483E3BBFAB;
	Wed, 22 Jul 2026 10:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784715239; cv=fail; b=l2T+Ozx3CARBCI/28tG+RKS6LvK/xpOxyegn+3/b/MdhSWNqMBbX+q3br5XY8u4617sJiIfCmsFWlIKtG3p6UWEC/4KvLNWSJr/PK1AIiZ36M/5xDPTHrqdKkjj7eey9ik49iq8F1n5kUVed5WKdCJTtUva54z3mgErS+LL+Fws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784715239; c=relaxed/simple;
	bh=3h2P+PYLA8q0dNYuEiwH4UlkCIogRUfFflmYX1X5WkE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GMX6nG16Cox8dPyd/0Oy/aXYAQ/KgSckH10Q6ncq5jTkecsxLSvra1KZCTHgTR3CVbZgg9WTU1huvt6r+GkZsKSHdwER8MA8d30Q5ch21Gb2N+cOy/qm2zg8TE90721rjS06TKsJ5IUrTV6MatTGYhcqP0f5/jZldj3yd8eeCQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fEIC+yG+; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fEIC+yG+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784715237; x=1816251237;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3h2P+PYLA8q0dNYuEiwH4UlkCIogRUfFflmYX1X5WkE=;
  b=fEIC+yG+kH9DkjPCxr7MS8A05DME7hb5qWv58WAhDpayJNltqXMsY4ji
   lTcFI8TSXE85jiNfIiTM02A/bVdNcRm3r7bZ6fCCnzx5tkftdexLJH6eG
   9Mro0acdzQZbQzRuOSM5JnpYfePuzyd+Ao/Q8eZ0g4yXGPgrXUzSx27dn
   tymZ804Vlm7087wmhVIHj/KeYonHU6eohW6+GRyScGXa8K6hl5YdmoaW2
   NrqmLkaGlqQAVnH7Z2KZCMPTB4Eeu/0mReS5TTTYw1dnN3oJ3ELrAGNJl
   Q/UeoJ7Xddao9m/tKMiojdv3rVX5W8a5raeVcMQneYyf/SsRpLRGs7jBU
   Q==;
X-CSE-ConnectionGUID: +MpGtauKRYC+Zbjms1vf+g==
X-CSE-MsgGUID: ghi0i/MWRK63sB4GUo9VJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="96003785"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="96003785"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 03:13:56 -0700
X-CSE-ConnectionGUID: 6F0L7wtLSNu+sHEW/zAsYg==
X-CSE-MsgGUID: q57eXa/yT2S+cinW6So0fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="260008591"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 03:13:56 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 03:13:55 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 22 Jul 2026 03:13:55 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.52) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 03:13:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kgcNGqp8kpr2uRLVPHoXro8yEvYLiOejzXn4QSfmpUDmZTEPkT80NpLaebatLOHJZbe5nfzg9ehMRT8VPlJ0UsExV1ZHJpoeBJ7UAIgG2eLoIsz7N8CzXO2/XLdKM4CtrSoPnCPpuSnsaoj1aBiR+xtvGF+6sWVHyY2aPX3REcNsbi5YWsDd1kVhTvBvO9gg7mBSBM47Pd2iYwsjF0WeA84gYH7R0/A3bKWFTrS+QXNfijsbxWIQK6OlZ/fUqE+OIzxtzH/5SUvj9cLjZS2UHBt4B1oqs2eVH3RFKhU+crTyJn3UiISv2TdbxbbrExEXcVM19FxUsjH/VxHpBQHC/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dNzUCEB6pP8pKFQkOCo1mh6qcrwo4dGD3W5m7NTshPs=;
 b=eGBGjkoXyU9S8yLcTWotFKocqhnE4ypnGIH3VukTvs+O1xbnTBrTFEsSdmissd85W+FXnf0M0FKIC095s5YtbKuvEuxNgs0pK6BqFrA7SYA4uHKiVLHuzWmkyFQDB4vFsHrfFiubTaJ+NUh9HKU6EkFAGKLdIoz/XSSm6cDWiuISaOt3iZN66JBS7zzwY+eQKyaYidKwe6Z3ChgFzy8ZEuRrCXIcQTzEC5vyIeit/qFAULmFCG064q0QZ3Vu/HMJxHxtuJIFhtEfl9n6f9L+eTVovlT+8kzvDpiBhb6IG9MGL9RXwvIETdFFl664GOFdc/nRYWe6GL5t3qXUxIuilA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 BN9PR11MB5321.namprd11.prod.outlook.com (2603:10b6:408:136::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.10; Wed, 22 Jul 2026 10:13:53 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 10:13:52 +0000
Message-ID: <656bbcec-fc0a-4c60-b4ec-c060f800c1cc@intel.com>
Date: Wed, 22 Jul 2026 18:13:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] sched/cache: Add PR_SCHED_CACHE prctl for per-mm
 control
To: Yangyu Chen <cyy@cyyself.name>
CC: Tim Chen <tim.c.chen@linux.intel.com>, K Prateek Nayak
	<kprateek.nayak@amd.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, Yangyu Chen <yangyu.chen@intel.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, "Ingo
 Molnar" <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, "Vincent
 Guittot" <vincent.guittot@linaro.org>, "chen.yu@linux.dev"
	<chen.yu@linux.dev>
References: <tencent_93116D14C771DC8C988C10E3C634BE0CC107@qq.com>
 <tencent_4F460FBE0B41016D2247455CEE988A90D707@qq.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <tencent_4F460FBE0B41016D2247455CEE988A90D707@qq.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TP0P295CA0042.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::10) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|BN9PR11MB5321:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e03d063-19c7-4e08-2f1c-08dee7d9ee57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|6133799003|4143699003|3023799007|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Vx8+0jqplzI8K82OTgBdSk1vcW0dpyskUVD+NqUomlDugn7oxaYIrwPU+ynLfzONTjDE4w2on396MlQAeurQndMgl4xfXcCS6FRLIcpCtfKDOgJ3BOPA03j0q1O/xmwp8uSCr9fgP4TCwFEPEhoWP7Lg0JkEDmWvMqC7FiIekV5gLsKLd6s9ntqXw13fJyV6l3d4BocN1P/b1bu5OQ2bsi2Db/YRQop1Y7pRTM3Z6T/dAJ1goQVIUDAc7mMH6lrdYbNVc+4nPhlSGhjjHJbb9DWoIfCF1xb/A3ZS/jGMSItwHgcPdVq7D+Cd5f2nsnkun9vx8lq9230WmfNnCQLc7/kFpM1YKgNUZYwGgw6qBf4tai8o+3paXpKxT/lviyV8ZCNKJvmaiLr6PR7TW22DJQS7X68jMgwMgHORml6Kf3Cx0ytR8Qw4CUPL7DtHCKi/Xhzd0s1L95SRNdik2KOL7LarsPKak9ZUudQPBPqaKUHXThRrW2JNyP6OQ0BOFxFOyu+vSb4cUjyE2asL6OBKbEO5J8EwFNMWpqkYqKAU0yLEKSIDk2xi4rdP8iMVKZhZtGTvRWy/Dj1FmuupvQeAdDX+JZg8BKNBlUK/29S84wkQ/bLVHBCdlf4kjtgLbKANIXyds466lalvJEgrL+oBTJV44pP+fwTAKLjUonaOnZA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(6133799003)(4143699003)(3023799007)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmhzeXk0VGdqQm5iT0NhZUoxR1RNSEJYVEZKNWtzNUNkZHFIU3Ivcnl1Y0Jj?=
 =?utf-8?B?bnQyVnVERi9IRmpVU21iYmhZOWZaSkVEb1NQN0JIV09aMGZtb1NxSWl0dTBH?=
 =?utf-8?B?MjZJbGptRElBb1hRcVROUkg5ajM3YzhiNVRNaTBUQzh0YWFlMCs5T0tZSWxu?=
 =?utf-8?B?YkNOMzNEYXRiMzZFZXl4SkR6dmZaREJ0M0tHZzB4SUE1anZHN0ZvSkowa0ha?=
 =?utf-8?B?ZlZkSXE0Nk1rd3F6aFZWZzRtMklWMnRMdWl2MnJHaVRpbitZL3VzanR6b1FI?=
 =?utf-8?B?Z3IxSmVzNjFJb0tYWmowbEhENnNzaStCd2J0VHJQZFp3dHROQ0h3ejNZY0dD?=
 =?utf-8?B?VWs5cnFGZ2tRbnR5OUMvN0E2V2VRVnFlZkVzVU5jTk9ubENsTVRudTRqRHps?=
 =?utf-8?B?WWVvTEI3b0ppYlc4M2VsYlZqYm9pb1pVbnduckVyWXo4U1hMZFhIeXNINUtO?=
 =?utf-8?B?RG1WQS9CcGg1SlJPelNxV1MxRlAyQTJJd2xrYVRwWUJybGVMS2F1SU42c3pq?=
 =?utf-8?B?MGZKUVZ6UkR4QUl0ZUtyTkhEckRjcUFhVUZaNGZER2EzNGZjaHpPaVV4QkVZ?=
 =?utf-8?B?V0tIc01mSGp3NEppaDE0MVY2d2FvNXJ0WXVYaURvNzRnYWE2b21xM1l5NFdW?=
 =?utf-8?B?cGlDWVo4N3RRaW5KTWxhODdWRlljTnZVQ003TFltQmxHczgxZnpiRnpFREs3?=
 =?utf-8?B?TmtqS1U3MWl0SnI4NEI3RDg1N1crY3NYWkx3UjhlejJHa2JQRHVWOXU2cWY2?=
 =?utf-8?B?ZTRFL004aWZTdXhDK3NZekNTajVOOGo5MFVnaFZuK1padlhidGl6cUxKYXZV?=
 =?utf-8?B?dXMvUWVrRTg2SkMxd2I4YnI2MFJGcFowdHRxSHZrS1dqbGxqRFFQTThpeHlx?=
 =?utf-8?B?MFJuQ0ltNFFqaGtIWk9DQUIrN0UzNlJxbGRrVFlNZHVGbXgzTVovSHpHMDJq?=
 =?utf-8?B?UjFSRExPc1dGeDZ1WklKcThtSFdDV1dtbWQzMm5naEZSRU5OVVVuTWMyZkJs?=
 =?utf-8?B?SnJ6REhSOTRSS0hXZFhCOU9DQlZiMVZqMjNIZ2ZqVWdoUVJKSDdRazZmcisx?=
 =?utf-8?B?a3oxMWNqTUd5OVJyNzQrOFlEdi9rYjlzcHJCRG5ZTU9qZ2IyRGExQWFzSTFv?=
 =?utf-8?B?SmNiMHQ2SkR5NHIxa1hnSHQ2dzhkV1Fxa0dlTVY0b0VKMElTejlpd1pqWVN1?=
 =?utf-8?B?Zy9hV3dlTWpPZmtYNi9DMnlKNlJEME5XSGdtczFrOFN6Y2pSc3NWME5aQzNp?=
 =?utf-8?B?WmlPWjBKdHM0QVJZUmtDb1poeThBSmc0bk10M3c2QU9JK3lCRE91ZXRLcHhU?=
 =?utf-8?B?aWFwYnVvdU9yaVNFSFI0cVhzM05kYmtoM1ZsVVc1Q0VBSk9DV3hIRllYWWQ2?=
 =?utf-8?B?ZGtJelZnNDhHUzlSWnJ3UXVHYk4xU0RZcUZTbU5PT0RkWmZCWXdLSGx4bGZY?=
 =?utf-8?B?MXR1V09VM3FVOTRoVGYxVitlTkRqVHhMdUN0UE9hVlc3b3R6VzFPUk81SHhV?=
 =?utf-8?B?WERCRlZsKzdhSWFJM1dXVHVnUHVGVWxVdVczK2NjUXVybW5RbjVFSGJZYUR3?=
 =?utf-8?B?ajlna0NwRTFhQ25iRVJESGZsWFRHK2tENnZHcFdRR2MyWmptemFuMCtJWGVv?=
 =?utf-8?B?VUNWeEwvMUZFeGpSUjdiQzJ5VzhZRkZHTm9DZVRPMTMwRVlQNmVVZnFsU1lL?=
 =?utf-8?B?clE3QVJLa3N4SllrcUFyVkVZNVNBWlc4MU43VTM2NjViMzZ4Q0FYNE91bnNV?=
 =?utf-8?B?MEw4aWk2enJybE5kRlk3NUhZNGFJejM0eGR3TGJNc2N2Q0NJdnBMYURLRjZ1?=
 =?utf-8?B?M3VYdE05QUtoMno4OFBFYmRUaUNMZXBYcFAyRG1wUFh4NFErM3l4cXgwRWpC?=
 =?utf-8?B?V2VXcFppL3hyN2FjSG15UEhic3VKUitIdVVpYjFQblJJMGtNSzMxQnM4dVlJ?=
 =?utf-8?B?eE9LSkt0VitHYjZpcE05aisyT3QrV2xoemRneU82U3ZwQUc2Sktnb3hoS3FE?=
 =?utf-8?B?TDBQWDJ1QXhTZEIvbjY3cG5aVjF4L0JkQjlVWHlrWkZxOXlRSm5IYWhubkta?=
 =?utf-8?B?SnczWnZ2L1QyNHp1SUdIZ3B4OVlUNUVYQ1g4UFNCVVphQSswaGxyUkIzbFZy?=
 =?utf-8?B?UjZNZWhKMXBUVW1XSCt4bmJRZVZscXZHNTRUc3crMkxKV0xkOS9MR0ZBZlpP?=
 =?utf-8?B?cnQ3OWRtVkRwSTU5NDNYa250TW1Ea3QyM1JMSTg2bWxaTW5RY2dsVnJiUUI1?=
 =?utf-8?B?SDcvYXZoYmloV3YrNjFGVkllUFlKd2p1dTk3YUc2d1FYWmgvQWR4bzdQM2VW?=
 =?utf-8?B?QzcvclEyTGUvOWZ6L255TWJuWS9HRy9tM0xLSTF1eVlFeTQwMHV3UT09?=
X-Exchange-RoutingPolicyChecked: oUBHUDZC2j28ilYILs0ql5N/+HAY/ww///yntziClPFSbjfaDpTjyYbrHyliq68XRgN8GwmHgH6GHcQnYOOaqFCuLbnNNbWfwh3dmGi5KCAcMAMLHLjtBrd4K1QtMMMQ3Sm2EKly26/GeMY/7+oS9jT4OyjemjkVjAXcrMGICrr3SbjTrtq+TN0grA1fuKUNM4V7tlUCz5PobCfnqwOFWcOaf0rUsOmItraeween39HSyQijr6ZdIop8IZBNRvUTCTjEQ7fbI3FYTPEwP1O6yynwJzg7vFX0vsLDqub8Hjx8BvRLCuDNAY/OezgZVikyYrwnEyXg6IAmuF8UcSE5Kw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e03d063-19c7-4e08-2f1c-08dee7d9ee57
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 10:13:52.8371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 67dZBMXtPqI40/s6ZId53tyvSW3I5+C1e6tf5NnV/rPZDkTXEU3k5i6dSDRqc8Bg2pHxPVTZzOJ0n5kqZYWB4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5321
X-OriginatorOrg: intel.com

Hi Yangyu,

On 7/22/2026 5:10 PM, Yangyu Chen wrote:
> Cache aware scheduling is currently controlled only through global
> debugfs knobs, but the right aggressiveness is workload and platform
> specific. A multi-threaded Verilator run is one example: its RSS is
> large while only a small part of it is hot, so an RSS-based footprint
> estimate should not decide whether it is aggregated; and packing its
> threads onto the SMT siblings of one LLC beats spreading them across
> LLCs on some platforms (e.g. AMD EPYC Turin) but not on others (e.g.
> EPYC Milan). Such choices cannot be made globally for the whole
> machine. Add a prctl interface to override the knobs per process
> (per mm_struct):
> 
>    prctl(PR_SCHED_CACHE, PR_SCHED_CACHE_SET, attr, value, 0);
>    prctl(PR_SCHED_CACHE, PR_SCHED_CACHE_GET, attr, &value, 0);
> 
> A single prctl command implements both directions, like
> PR_RSEQ_SLICE_EXTENSION. The attributes are a per-process enable
> (effective only while the feature is globally active), the two
> aggregation tolerances, the overaggr percentage (applied where a
> task's own migration is admitted; group level statistics span many
> processes and keep using the global value), and an inherit mask
> selecting which attributes an mm created by execve() keeps. fork()
> always inherits everything, and the mask itself lives on the
> task_struct so it survives both, which lets a numactl-like launcher
> configure a workload and exec it.
> 
> The overrides live in mm->sc_stat with -1 meaning "follow the global
> default"; GET stores the raw value through an int pointer so this
> sentinel round-trips without being mistaken for an errno.
> mm_init_sched() gains the creating task to tell fork (p != current)
> from exec (p == current) apart. A disabled mm has its preferred LLC
> invalidated at the existing invalidation points, so all group-level
> statistics self-neutralize.
> 
> Also sync the tools/perf/trace/beauty copy of prctl.h.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>

[ ... ]

> +static int sched_cache_set_attr(unsigned long attr, unsigned long val)
> +{
> +	struct mm_struct *mm = current->mm;

As preparation work, should we first decouple sc_stat from
mm_struct and tie this stat to per-task task_struct? In this
way, we could have per-task cache preference control and extend
it to tasks/threads/process/cgroup if needed, which looks more
flexible IMO. We have a proposal here:
https://github.com/chen-yu-surf/linux/commit/bd43a0b6dd189d5091fb88630208cb7bf67b3165.patch

which introduces a pointer in task_struct:
struct sched_cache_group __rcu  *sched_cache_grp;

> +	bool def = sched_cache_val_default(val);
> +	int ival = def ? -1 : (int)val;
> +
> +	switch (attr) {
> +	case PR_SCHED_CACHE_ENABLE:
> +		if (!def && val > 1)
> +			return -EINVAL;
> +		WRITE_ONCE(mm->sc_stat.user_enabled, ival);
> +		/*
> +		 * Drop the preferred LLC hint on any change: a process
> +		 * that became disabled must stop being honored right
> +		 * away, and one that became enabled re-establishes the
> +		 * hint within an epoch anyway. This is best effort: an
> +		 * in-flight task_cache_work() scan re-checks the enable
> +		 * before publishing a new preference, and a lost race
> +		 * is corrected at the next tick.
> +		 */
> +		WRITE_ONCE(mm->sc_stat.cpu, -1);
> +		break;

After we switching from per mm_struct to per task control, we could provide
fine-gain control at task/process/process group granularity(similar to 
core-scheduling)

int prctl(PR_SCHED_CACHE, unsigned long subop, pid_t pid,
           unsigned long cookie, unsigned long type);
pid argument: the PID of the target task. 0 means "the calling task."
pid_type : PIDTYPE_PID targets the single thread,
            PIDTYPE_TGID the whole thread group and PIDTYPE_PGID the process
            group of the target task.

And the proposal is here:
https://github.com/chen-yu-surf/linux/commit/17718b7cef1d03948e9fd3bcd0b5a49aba7aae2d.patch

thanks,
Chenyu
