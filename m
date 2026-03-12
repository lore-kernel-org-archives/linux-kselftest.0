Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D0338655E;
	Thu, 12 Mar 2026 20:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773349148; cv=fail; b=rDJuc+/kvWgng5LhKbN3s2vUrbnouGz2L6iGqzVqHMT7ZH10lgW2TbFIcwzoaqALitpwdFO36N6uU99pb9P836AX6Y4nJPQNBkHJQCZzG6xJ6gOCAIVaI2O9z58GMp+kiOz8QvmGZr59221iD6Wh5uMHtXjrjqHOIhZ3FrBRmSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773349148; c=relaxed/simple;
	bh=eG3WX/K3orMlUYJxvHtp8VTSatul9nsBELn36RD1EFM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fF4s945xHxRjiYh+MPTTmwXwiC2byA6ucCRpSPSPQCTu5EGF1DIEI9gOJIS8eHIyZCDtv4d8HE8mLpoIUeYV1GiPHPlGGXBg3Uqj5Yu+WPFKKiJ7/2ti30AMc0iWh5Rop7av0CZj7B+aRGgq/GZnSfdoH3zFrKJsF/NX7egC+3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y+ZB3a56; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y+ZB3a56"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773349148; x=1804885148;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eG3WX/K3orMlUYJxvHtp8VTSatul9nsBELn36RD1EFM=;
  b=Y+ZB3a56fDiiEdK8OEFlqcdrdNHthSa7Iac4iQCqhHNpEtRrvskHzQil
   MJjOND92evH2S9gn+ZgSja5S1nPqx1GJlku4Ohtb+qeLC8jQdWPFsyT21
   +eREhiVA3N+LRO8xmKpU+8uEeeQA+etfmASW1h4ta0Xn4sQSqTNRLCAeL
   COvfY6hUha9kmAUhp77fa0+lH+zPWhure5uUtEfiGLNMjUKMg2mfBcNce
   h3IAIYRqkD9AbGDPk2vxWj16djHIIpUBGX8W6m+J0AfYbiij4fmdG5r1/
   TaISQ+PPpzpLVNIfc5p/0iTsdZqMI7YW0bf/sHNQSJpJEV/kcRzod8zIY
   A==;
X-CSE-ConnectionGUID: u8vl5CXeQ3COZo2S4tNPeQ==
X-CSE-MsgGUID: hcvniJaRSHSXvTQryZAx/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74371464"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="74371464"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 13:59:07 -0700
X-CSE-ConnectionGUID: iOPxTgMpQbKThrxKu4i2PQ==
X-CSE-MsgGUID: /tI3sSdNQQSGDuLi309Kmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="258860950"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 13:59:06 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 13:59:05 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 12 Mar 2026 13:59:05 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.71) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 13:59:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KUqT4PrrrIUt/7Sl9y91jTm5UDquEnmwgcKSdFPVWhHn8KAcSNHEzMowi5qrNQBYGDQtDAmbXaiBxKRBN1wipfwoj7wscb9hIZh72pWCFMwr8lHaPTUa09fdzYsqZWYtULfpTjMfHdRyaQbTOOd4JTgwlW+O94stKKiFLcE0ZvI3bCzhtXZxzrqk9FzTG25KZwCzxdx44/WB46KgZc2MUmlao0O9w+LD37TKbJMacEdo3bp3NItNZ6r5mMhLl+2CYN071XH6uvZ2mim5o9GVoySqYHr1ThGdh/eyyt3MzXzzqCJC4XKQb5/iEWvFeoSzctUTnuW+4gJGzgmD0DHCvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEihQXJLkdUxWj5UGd8EfQuV7b1bb7WA7LDz18h4OYY=;
 b=S/PWWsIcBCbawutyQmYL+uXS8CCR2n+eBbQF5CuBB/PWHjrio5aA6CKeftYU1wWmcX4ZDuudSDu+WacHwGT5MAUUZtDlkGj0pFe4EudkmEVwtoGNrxUOqD49UPPAQmt6qivRxVu5gtfoizth6LWVlAY14C9WahFKStmqA3/pSeTYi3DvaXkVPzFp/ll/TOArDUmdoErHGTutS/Ktr0EljGuxxPZHZYCN4JTnMyCcDKgJOxIUZLCYL/5A9JgiY/tNBxU9urCbY2dxv2vovkGhRI18gSh3WjTTA+pR4ua6ug/BBNBNjbypy2lDa6fOX/GaTmbRZ5hYqRTD1v3w2HF0Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SJ2PR11MB7474.namprd11.prod.outlook.com (2603:10b6:a03:4ca::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Thu, 12 Mar
 2026 20:58:57 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d%5]) with mapi id 15.20.9723.004; Thu, 12 Mar 2026
 20:58:57 +0000
Message-ID: <47afaa8b-f903-4937-aa10-b2bba2388674@intel.com>
Date: Thu, 12 Mar 2026 13:57:27 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC patch 3/9] selftests/resctrl: Use dynamic linked list for
 iMC counters config
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
 <20260304040334.765860-4-wuyifan50@huawei.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20260304040334.765860-4-wuyifan50@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0085.namprd03.prod.outlook.com
 (2603:10b6:303:b6::30) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SJ2PR11MB7474:EE_
X-MS-Office365-Filtering-Correlation-Id: 27828f75-f72f-4df5-f8c9-08de807a2d8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|22082099003|56012099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: O+GBUXNNB8tPDCFs9as5WT7wHq4BJWV9+hOHzGFH6ZHzmJuN7F+XzSK5SxtqeiHsjdd1HH2rv4YzBUWgTITmKzrSGlmNbXuNFFJ8lMSzqmnrJthppgwOY/Nh6vjd0nZRigE/JYXAB376m6JDI8Bmzm+3V1ZzgzaMuKrloD1ppPKgjYIefr1xAw20JTCNQ2WUM0kMKin+yrUr91FvpV91tmFiX+nQ+oR20r/9n/PeP5yeYfQJEhrvqNp3XT0woQ/O2sRTZv6w7rFwTy0YrbrawbQVe2+bdpJFXgqNyIDZXHKCT4zd1Z28DGBxnPRL2FbY1u/nSlrQB0tpP7Ns9/3fC4P9PoY1frK0peHvFRHPdCYe8UyWpFA+gJhLPbKHAwozYUrq8p1CckIHAEMRBVAq5bCFr6+jnszmkuqwC/yGwHWFsnRYpQ0ZArm/Bw0u9p1/ZMnl6UaocXrU7G56Zztib0Sz0S3o+v2FdY2aVhQ/mllp4LNJbnrDB2D5n+sQyGO7e5565aL4Z0QhvdiLHlgvZcm+ZqUP2uYGhtqHI3xVqloSMYwfQ52h9b4ZmgeD5HeJqgV8yjg87Lv6IuHhH6GQmW22xK3A7+U34YMjTJj50TDfQDxAi/6+a1BsOaSODNVYSBORf4/qTdd+yK8Bmxgqd8+rlCblgjQQ9ieBWrMdlSdpm04ZkSyoHMACmAOjafal89YthybE+UQF+R6qYlcBitIGxFT8hh/hajPOQrxLYGVdL/HqzVpLxEuGbree6aPRso0p/XveOup5/rkxiYYcgRAZ/HasgsrYfkV3Xbq1OTw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(22082099003)(56012099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WitMR1hocXhNamR6MFJvL3Z0UVdwMnVPNnBYQ09MazZoSXpERm5mTERwYmNX?=
 =?utf-8?B?ZEp2RDlIeXQwK3JBMjFqdXZjb09nUS9ZZEU1dGk5QURqRjZoVWRXbHVZMEo3?=
 =?utf-8?B?MFRDbWpiWHc3Uk9vN21DSzNmYmJDTFFBMWxvamN4Qy9mMlhNRzVWWWl4a2xX?=
 =?utf-8?B?YXN0RGNtcHc4N2NHWFppSlN3MmV3Wm44MzVNKy8wenZpSTkxL0ExMDg0ajhj?=
 =?utf-8?B?KzJVRzVWYkpGalNYZmpmWUZDVGlpSWdwcjF5SUJubldPSGJkSUoxQTIrZDgw?=
 =?utf-8?B?L1ZqZ1ZXSUtSNmJjVWJpT0JMZ3J2Rk02VXdoZ0RZTTgrelhydkQ0RiszU3lC?=
 =?utf-8?B?djJhYW1IMWh0MFQ2U0RBc09pV3hqN1RBdUtzRlFUS3RFNUs5bHBubWcwY1ll?=
 =?utf-8?B?RG1pSGdlVG12NFhxVVF6TFF1Z29mRzZFNkVnQUdadUpTMDlXNk9oUGJiVk9w?=
 =?utf-8?B?K2ltT05jMXIxR0UzRisyY0thQ3ZhNUlCU3haV1ZrNmdTSXNYWjFmQm5DaG5Z?=
 =?utf-8?B?K3N3VmdnVDIzSUJWNEQvOU1vNEZFSDZvWXIyYk1yVEl1OEtJMkw5QWJVb1lR?=
 =?utf-8?B?dmFqdm9Zb0dySVdKMUVjOXpHTk9vK3lWdWFSQ1ZYRlZnSHNCNmhUeDdQUnQ4?=
 =?utf-8?B?UVRNMGV2dExXb0dFazhKOXorU3Z3MkZleDRCSUxlSHFFZFF2NU5NWUFLdmJv?=
 =?utf-8?B?Q1pVdHV1dE1ITVpFV3kzWUIyTGFENWdUOE0zY2p6UVhHd3dZWDBRWTk0OVZ0?=
 =?utf-8?B?bFdwK3UweFU0ZktGYWdZT1c2T0k5QUM2VUtQb255TUs4RFZkSTVWSlZ3aFo1?=
 =?utf-8?B?anBrbjZOMTZpSk9INkU5RkIvdnJ0TjB1QWdOQ0R0bWFacnJsc0RCUC9lUVBL?=
 =?utf-8?B?djBWN2JWQTNKQ2diQW0zc3YrNlI0UVNCQ0lCY2x0MnhnS015NXJFRW82Q3BT?=
 =?utf-8?B?NkZnRFFaWlpWNEFCbG5YVlZESG1TR1A1d2VYRDJ2eU9ISG5MYUJPakNnSnU1?=
 =?utf-8?B?Nk5ibTRpdjA4a25OaDNTQlBpL0pMNWxGRDhJYWxoK2xSdDFvVkc1VHpkV24v?=
 =?utf-8?B?c296a3FKVW53cDNBUlBSK21sZTVQdEI3b2VMT3BDcWFEVWJHVUUybm93enBa?=
 =?utf-8?B?TlpzcnlpcEZHS2NFY0w4clQwNm5hRHdFK1JpQVhnUk0rVVkwcW1UbmNoSkFB?=
 =?utf-8?B?dUlNenhkU0E4d0Y1a09kRFpkT0E2d1BzNG9SMkZUZ1l2YzloNmp4UGY1akwv?=
 =?utf-8?B?dk1tY205cmxZOUlUZkc2U09GRUtPbnZBSmpjZnVQVnpQTS91OXd2eGtkaDYr?=
 =?utf-8?B?aWJRZzBIYURZWEpSN0s0Wm50MERZSUYrUW9ML2YwblZIa2RYdUFwRjROeE5U?=
 =?utf-8?B?ZDdELzFzSzRpdExUSFAxakQyQVhhNVZTSFFwUGU3N0Z4VW41cTJGdytydm93?=
 =?utf-8?B?MG5YVEtOWVZEcEtlM0s4U0hPeGhWenh5UWgvTldHdlBNb3VkT0Y2djVFVS9W?=
 =?utf-8?B?b3RZRUNFRjAxd2QvVmNFaE05blhCWmE5YjNDOFc0ajh3dk40R3FtZXlHUm8x?=
 =?utf-8?B?QU5aTFNRNm9QZDlvWklJTFFEeTl2MnQwZEpudWJTc1B1bGprZU1IcUtvSXMv?=
 =?utf-8?B?aVRhd1JmZzl0WllLN0ovVXhtQWthWkhxTWYxeU9yZ21YRGFqT1F0SGVtdnMx?=
 =?utf-8?B?Znpvb3N1aUt5WHJvZFpPcnhFZ0dPSXlZeDA5ME9zZ3diUXRmZmU4MDJveWhC?=
 =?utf-8?B?UjUraUQyRjd2UXF1YTZYRlRyaW9zWDhIUnJXSCt1VnZIVWZiMFN2TlVQb3k4?=
 =?utf-8?B?NWlpRjM1ck01aVN6Q1NwVXZvZ0RhbDJNZ3UxUjBacEhrVkY2OElMYSsreEh5?=
 =?utf-8?B?MmZ5ejJzVkZJcUpCTHlvdG5RNHhqVDcrRVVOdVFNWk9SaG5Edy9qdElLT2pm?=
 =?utf-8?B?TTk1V2dQbGxLTUVOWmdMcE9LWENJeWZQMllIdWJwNFVZRnhKYUsvQ28rTzY0?=
 =?utf-8?B?a3JYdVVwbEZhdWxqeDBhSTNkSlF4cWozTUxRT1lSc2xoS1M0MHBhVEdEVnp3?=
 =?utf-8?B?SDdOdDdRN1VheDhFMGJhSkkrRWJEUnJOUGJDQjNmMEg3a3l1aFNqZDN3OGgr?=
 =?utf-8?B?UHB1NjJZUWxPTWFva0hiK29aSXN3SSs3WjJPaDArYXpER2dLRWFzL01KRGFq?=
 =?utf-8?B?OTV5NElER1VQMWpoS2ZrNmpEUFRxd0dCQmp3dHVzUlI0Y2I4OUFrVG9oL3NK?=
 =?utf-8?B?RDYwMDFla1Bxc0JnZnQzaEFLeUx2RUIweTZFT29rVFp2dTVEczhyUE82ZXpZ?=
 =?utf-8?B?RjkzLy8wSXVPOUxmc0hnYnM3UDNpdHdqc2x3aFloSlBld3FDRDRuYVVoSVF5?=
 =?utf-8?Q?+7C5hrrs6oX7Raj4=3D?=
X-Exchange-RoutingPolicyChecked: G15rVGxsj5xt7PiZKTz1cAVtUje40fkburaQUlThJ/D7QoR9nqHfA94JxIFASCrtypX2NWRQYg1MDr+XlZ7hEYAmK/8Ig+VsmonCEBXtc71Uma0VC3lj9UhM+65bH8dOyLBf4Sx/ws8ux8Fl/efi/qa11uetfN+E6QcUyzAV1RxVXCS1tofgnWnEtLKL7zCYUDBS6Ofl5ltmQyQR771G+EaHY4DZpccxU6FRqpgtuznMvWeM7SkAeCkmAzIDc/pxg9p9gySVSKQDXngrwmQlWLyqUNOA3bA/Iwz2GzWcreDn+MQ5aTmA5lu3LtVhzkP766eSAjvm2KFyDdoF1cZOeQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 27828f75-f72f-4df5-f8c9-08de807a2d8a
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 20:58:57.5267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qQwFguun6ZkpTN5/cvJcdcQKGpSkEnXHJsRXLeyqUglYKOL+Xecxi2cxxwRrlMAWq0LVkbz5PJ3B9TH9hTg2PBTPFqxkHKShWA996IqPwDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7474
X-OriginatorOrg: intel.com

Hi Yifan,

On 3/3/26 8:03 PM, Yifan Wu wrote:
> Currently, a fixed-size array is used to store the configurations for
> all discovered iMC counters, which has several issues:
> 
> 1. Fixed Overhead: The array is allocated a fixed size, even if the
> platform has fewer iMCs.
> 
> 2. Out-of-Bounds Access: On platforms with more iMC counters than
> MAX_IMCS, the num_of_imcs() function can return a larger number, leading
> to an array index out-of-bounds access.

Please note there are some fixes in progress that include addressing this:
https://lore.kernel.org/linux-patches/cover.1772582958.git.reinette.chatre@intel.com/

Having this managed as a list sounds good to me. Could you please build
on top of the pending fixes? Also, please write your changelogs in imperative tone
to make it clear what this patch does versus what it builds on and also please follow
kernel coding style.

Reinette

