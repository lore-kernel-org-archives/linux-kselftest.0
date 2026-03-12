Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1884376BF2;
	Thu, 12 Mar 2026 21:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773349354; cv=fail; b=bPFfOqMzjQ0flhl70Fza7+kGRG61rHyZqCT0Un416B8t1ornGxiAwHNHtV6/BqnvXMqyNrpQ24EnrGjqpnrjG6B2SXMmKHWn9CTo0wH1lp+h+taOvzi130TItGKysL+P8sht0JiL/0/U2LMrfuXD659EFcq+DLkVmdD6l415QDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773349354; c=relaxed/simple;
	bh=ulZrdZRNLIV7lo2zyZWVAw5MlgFjhdwlcEJNKKw3gxI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=f1kbkaSHBRxbYQaa1e8z5mZl8BPl+yLYR87Hrxn2h2gPK+rL2FDK15Xdj9zF+mc4jdwpE53xKQ/jpIIP+ivc3O0foqAS1IjFlDoMwImYOI7kxaas/LCTxS7UJDeSZTaggObs33t90/Kim4JhUwgtlYi7wd+Q/yZ6EEy+VUOPlCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RtMOZuLO; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RtMOZuLO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773349353; x=1804885353;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ulZrdZRNLIV7lo2zyZWVAw5MlgFjhdwlcEJNKKw3gxI=;
  b=RtMOZuLOa02o9qjHyDxinBv9j+OI8IyonvRlTUix+ojAutYYfdxMR1SV
   pA4VK9WTP/tbxi6oV7N9lNA10ymstW/zUIP4TJupqg5CfGVz/+/uW12sw
   CZ2Q4AzQRaPQvadmWGOCoyUKovFHNc2uWdUVq/kFdIMumsnGNdVbSkvSW
   fxw9u6SVaAIHllS4scIny/nm1oWMZ4WS47xsGkOwCE3aw7WQ6W2tpwJW8
   13pz2Mvc1JsZOh9biXBaZmG6bbD1UMy8Rdd5iwlXqdq/Mr4JBJDWIyqTY
   Ur4Df3C5i/twYHK14j49M3OW0b3bpgLtO4H827JBAc4y6U+o1phghZxbV
   A==;
X-CSE-ConnectionGUID: oH13YE8CTnO7cagBSDbgBg==
X-CSE-MsgGUID: IDC8LHMqQVu259HJPNo8yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="85808415"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="85808415"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 14:02:32 -0700
X-CSE-ConnectionGUID: nWchwA81TguiN5kaGVsk0Q==
X-CSE-MsgGUID: Xex4RYJ4TdWYnno4SvcfkQ==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 14:02:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 14:02:30 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 12 Mar 2026 14:02:30 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.58) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 14:02:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aliZ6uHsVTbtiz07ShsMl4oeqcmfW1qo+Mh4h8TLxQIVkB1qWU3pKe4vd3Uog1K9nj4z4z0hvXrJZU2dsp8vSIjBDdoBb+CXhkJdbKc9xg8BKwv+qYg6mEUTzkAcfkLSZAUXK7MkKxD5VgJRGj3y3Ly9rO86pUbXGdyAW4xuluxXm4vJHSFNIMNpPWtwy3q25klRfi71NisZmpofQbY6EPYqMANKv6+/X1iOrs8lWMY3hdIO/l3omADNt93u2wvKBM1osCC5QOsKrwjJ0FgbzUyBmhOUi7k0D25SwVYjUsWODCOVF2g1+t2Ze4VDyW9TYJTZnK1IE2jB2TCheW/4PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCtI9wvw/a9jaE9q1NqP3Ni3LpudwRhxQ2c+MyF7604=;
 b=XCN1D1CLpaLyKGMQVD1ZvMVvWv54uPoJMksM9ps0w7TdybVrbwaGF20dy5WhkaaVI+PKyCki+F9BK2duoJgqul9IC8O7ol41lO2gwbj4wQiidgdQvNrDMTnKY5aM/KdezduOBpbk9ORdFNEJuWraaqR2vfDE8cyO8622SPWK9lMu/K2ol0NajKoq/GWWC+CwETWhT7W9WnqHl8q5JZIT6HgxnKtby/lbcirhhfGTW0pm/aqUGbxeD5aOnxsYR11qNW10o0+RHzQHocL3kRy1ksUGBSe5oM2NtShI7eiBipGJQym+IbCeScJqGxB9UTJ+xJc/RqKl9F6UK32v1a81mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by BL3PR11MB6434.namprd11.prod.outlook.com (2603:10b6:208:3ba::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.8; Thu, 12 Mar
 2026 21:02:26 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d%5]) with mapi id 15.20.9723.004; Thu, 12 Mar 2026
 21:02:26 +0000
Message-ID: <c0bf5728-55b5-46e5-aced-4f856144f746@intel.com>
Date: Thu, 12 Mar 2026 14:01:51 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC patch 8/9] selftests/resctrl: Add support for HiSilicon
 MBM/MBA test
To: Yifan Wu <wuyifan50@huawei.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<shuah@kernel.org>, <tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>,
	<ben.horgan@arm.com>, <jonathan.cameron@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
References: <20260304040334.765860-1-wuyifan50@huawei.com>
 <20260304040334.765860-9-wuyifan50@huawei.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20260304040334.765860-9-wuyifan50@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0271.namprd04.prod.outlook.com
 (2603:10b6:303:89::6) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|BL3PR11MB6434:EE_
X-MS-Office365-Filtering-Correlation-Id: e7d46ae7-7e2c-40d2-5a39-08de807aaa56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|56012099003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: 5RCWxZrzBwS74sjLO566zbkZD5VFXZDhv95YklnXMvNjAGuDJoDVdAxagjMulkw0c1+gwLGxkzFhl/gPeejA/z7yy27B8TxsDWz3zqX2kwM51KTGe7SPO1Py9h+qn+7mUeLnvFqHD+0GLjCOM+8t4RjbTytGrgfWdoVc+r30bomfiLsrmpwvMxJMlUr7AiggkXtx6bw+KefCFeVxeokHM3sgHBRGacPdG+KuBGYGH2O/gCjcS78yuMDAOXf8Dtu087qvSa9Iv7vEDscgKaqQ0ta7oiwvCBwsEv4AvghlHFoCBIAbKB4bBgSbRZjfLflFryylmCm058B1qHemypzqcuUfTO8vwG4A/WIoSjiwmcUbBiAIi0GYDs2Pfcx0tpRUBRyrby1pfeGIc/y1P8ruXYDIq3/S96/R+vy7BM/0FH60VZ8JZ7xbwsOvp4HoiZyFRF1O6YCvo4Smyf6vnj5wUgPxwAO0Tm0hawSvInZbPdlRrvGdMvJg4jLt6GCNh1C8RFAW51FUxDEa1VOVTyS+/+gKWvYqOG7DKRGzBeureNqDQ0Dx1h2m2zjeOFXx1jo4QqQ4H73Qh7ShDfQIUBNjuzIy0tgZjJUOgBipD7WFvN9ir2B83Ghay4E92dgQxjU6sSuMMCtQQptUADPPfWKMdXY9l7RH25Zh0hlB4M5OHbytThymN8xExoV9fgUDCtUkOZ5Pbl+kb7FBKr0Fe3yqheOVDZ8MF5fbu59p8SEtP4tvYHOKoWhEMMdhk9DsfbHv3lJg/F14BQVQ0jARehg2Ig==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWlycGk0aXplZHpKSWJTRXJJMWtUWGxJcVkyMXJCYi9VVEpnNnJyaVZJTkJD?=
 =?utf-8?B?M2JhYmNvYk4rN01BQ25ZU0h4YjJOTXFLN2xMbmkyZDZQajNQOUJQUUJYbUVa?=
 =?utf-8?B?UFhBcWh5WHlnZkE0V0dDWExRZ0tWUmRFVkVwTS96U0xSTDI2ck13WkRBTGNG?=
 =?utf-8?B?b0VtYzc3VlBlRFlXalQ3VG9CQ1lRWHBYalhzeWVHSUpLR0Q4QisyYktLWXBW?=
 =?utf-8?B?SFZGNnkzZ0hxUnpsd0wxVG16REJYSXFlTVR5UUVmSkFSMnBRZm5DcStUSkhH?=
 =?utf-8?B?eXpHZlIxWUgxRXIxMG9GZEd3Y0VxWDFrdzRzczhJT1NBZTRyY2dqMS96Mk9C?=
 =?utf-8?B?VlppNmVSaEt3anIyRlg1Mjd5YVMrVlFQMk1rNHU1emJ3RjA4dnlkdUNiVmdZ?=
 =?utf-8?B?WmJDOTVoa0xGUGZUc2x4MVVkL1QxbVdWUGdlWktCS1Y4cnQwZzhXVlUzanBE?=
 =?utf-8?B?QytHckpMZEV4Rm5Sblc0dEVTMjAzczMxdGVQcEFJMzU2YWZma1RSNDZ0ZXkv?=
 =?utf-8?B?UnZndWdXcGp5ZkJVVlBINENkcStSQ0VkNmkwWVRqbDAxc0ZPS3lEOEtvMUc0?=
 =?utf-8?B?czZXUDlyVG44dW82R1ZPWE03SzVJdzVmV3FLNXY2MDR3L3U3b1drL1IyU3Zl?=
 =?utf-8?B?VjZ5cjZPbnZuMDE1bWV5RDZCWXRCR2laYWZadjVvWURSZmd0M3NzVXg5d1pF?=
 =?utf-8?B?Mk9qVVlEUTl0THZzWTZHdU5yTmFyamtya1ErcFVWdWVuUmk4VURCR0RLb0hB?=
 =?utf-8?B?Sm8xU2FSb3phYmIzcnlzZmRSNlhTZVFuUDhHTmN4K3IvSHBtKzZraUZieUlt?=
 =?utf-8?B?Z3lJWE9GQnpjclQvekdLNmhoYVFsbjJ4MWMya1NETFZoTU9YUUw1a1BzNWRC?=
 =?utf-8?B?bXNyby9LMGtNRnhCdEFXaTlicEF2dTQwZ3lrOE5GM1FxTjNqOGZvckdYMU5v?=
 =?utf-8?B?OHRuV1oxU3UzMTNJbVpBZWlpcWdKc0JnN3ZKdkx4ZnptQTA0OWx6VmNDZ2gy?=
 =?utf-8?B?bGE5WFhxb0krVm1KN1ljakFsSG96RTJZS1lMZzNmUDU3Ylc4VVR1QzF3WExv?=
 =?utf-8?B?cnprU0plKzVoYmVWRlJmU0N1N3Q4UWdCamcvVU45aFYwbG5ybHFaV0NhVFd4?=
 =?utf-8?B?NlhWc1ZyRlZmMDRmUDJyMklRbVpYMXQrZEgxcjJTZ09PdnV3VTErWllaVkV3?=
 =?utf-8?B?enhIVVBUSVR3YVoyaXZ2aEs2VTBtZDFyMGFQU0NqQmJQbkc0eDdSV2tEbzFz?=
 =?utf-8?B?SE84L0VGUFNLdFpQaVlHQ3dJWjlHT3JrM1JXYlE1aUZINDFqeURKZWRlZUJF?=
 =?utf-8?B?amRFNzRlQy95V085a1B2dmh3UjNnVDVlSldQbXNFQzRkeHJBYmxrbUxadTA1?=
 =?utf-8?B?ZTB6QWQ4TGFNUWY5RVVia1NQaGpJWE5hd1o5NE9nYS9pdzFaYzlKVklrZXBX?=
 =?utf-8?B?aldoT05VeDd5WUV3R3NlYU5FY29HM2hlZGtDUkpBRlZHVDFCaWZRZXFuM2R5?=
 =?utf-8?B?MVpEYWVYcDEwY3JBbGIzVjBjQ0ZXM0hlRUJqRjRRNFdSNjEvditBR3N0Rm1h?=
 =?utf-8?B?TGF5UHRrNVFTMDlsZ3FDVjNnOTV1Qi9TSHVnbG9uaW1WMmhuL3FuWjIrcENm?=
 =?utf-8?B?WktwTmdmZkdiamhCV2xJbGtkNjB5ZU02RFN2am02VzRPSFNndEVXY2YzNjRD?=
 =?utf-8?B?d1B2TmJTdmpNREFDUEZDZ3l5eFdoekV0NHhaUDNHYzZ3dW8yaGprL2xiRzdC?=
 =?utf-8?B?ZjhoU3BwaFlJSFI2a1J3VFNscUFPTTN6a1FsV1h4MldjWXBINEtGTkJEMmEw?=
 =?utf-8?B?RkpaR05KZURxR21HbkhBT00wLzMyaksrUTdOQmRXcjdKUnlZR09yZmpIaCth?=
 =?utf-8?B?dFJ0TkdGT2hPWXc4VTg4SitmQXJKN1MveXVoQmh4djdya2hORW9EdlFNNDBZ?=
 =?utf-8?B?RGFtazlFb3N1aER1UitmVWNVMjNXUmd6ZzdDYUZlVGRZUTFTbXArdkV2cEZr?=
 =?utf-8?B?bDBUTFg3czRNMHhSSzFnZEZsa1RKUWxjZEw4TVlURjhzaWRnZUdpNGMwcWpZ?=
 =?utf-8?B?U0ZkY3N4WXdPUUZ5WU9zeUtXaVRUR2RGUFYzcktqNEJUNFNKait2b3ovMmZJ?=
 =?utf-8?B?TXZoalplZEJYK0VZcjUwUldFa0E0VFRJWGE5dUgwS3lsN0ZJVnRoR1FuMzE5?=
 =?utf-8?B?cWhOU3o4ZmZFUXNPSVpoMzY4ZklYUFB6NTJhNGdJditpWkxIZGtCMHpKWDZY?=
 =?utf-8?B?VlV5U1NEMnBQb2Njc0ZkbGt3WjMzakFadGlXOGNIZzcxbzdpYUtZY1dWYk1i?=
 =?utf-8?B?akVER3NpdEJHOWEzM0pkZGMzaVQyS1loU3F3bnFTZDhiY3lGMEdCeWZ0ZzU5?=
 =?utf-8?Q?j2JnDbuOm3baRz88=3D?=
X-Exchange-RoutingPolicyChecked: iz3isE1o39PtayuEjdeEM0b2W2Y0zGQDDJhybGIzn8J9Ab6OZhhOcHy/ul2jZbpP+p7z8wFfUgIlzeQTnTzW1QuMSBQWD+NVe7oTJoeay5PeB0prglKvNsVhYEtTT1oTUqjhBJaPZYL8obEpD6RviAWTa/aCh5q+lXv03M8Jrrdt1Mh60tTHf/oIAjhS3Zssm0L+p3TCmE9W465MM02TbUdmN+Ej+zvrAJX/p/B88WiEGDZCpHj/KWv7wWt2v0i4qbLUiNJYoSQIjSe6tJ/EnhWypOQFOBonMVijX4fgOZ6L4MLR7QF1+kfdo4sSDVtJiapxFpR8/ALDTUBbLEOVLQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e7d46ae7-7e2c-40d2-5a39-08de807aaa56
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 21:02:26.6252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wodk1Vn2sEcBasM8sOxwQRK3B9aRncXgC69egvo/wgWLTmDwSUHTBt3R+gBej2zLuqA1dvj7h59V06Tqsx4GCTX7M5XoT79XkZJamYFUkPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6434
X-OriginatorOrg: intel.com

Hi Yifan,

On 3/3/26 8:03 PM, Yifan Wu wrote:
> This commit adds the support to check and test this feature on HiSilicon
> platform.
> 
> Specifically, this is because on HiSilicon platform, the mbm_total_bytes
> counter for MBM/MBA is located in the MB_MON, which is distinct from other
> monitoring paths.

Which baseline exposes MB_MON in resctrl?

Reinette

