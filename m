Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4322517AF;
	Thu,  2 Apr 2026 17:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775151876; cv=fail; b=giIvYLh/+Bkgz2kyJTw1aOWEUrz86F/eVRIMBnTSTXsZTbPS4RceZ/UukeEmT+uHbbdMB6idUmY+3h6C8vFqcvTNqF+UA0trVsdP5x4KT6zxlXxIeXs74BJyaF+NoFGZTztW33jm8mYB7w0rgHarIeUL6h8vIDopr68YkEf/g+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775151876; c=relaxed/simple;
	bh=g2e2J/HZEDEymM2gUMHM5ATox5rSaMaYgA44hf+MQoA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=F2PWSpDV2UZ1kxdRMKA4R432lxb11DgZh3e3I1PENF71SsCMu5XmWX3mRaqYqjFC8J2y6JNuBy01tRoQ8KmngF9Ivaxiu5HUwex3bGYBMlplZJFJ01mDVCMfY2DR87HsmFRVR/+S11WK/MEdgvoDmzmOl8Y7l2MVw28OMmyHQOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kypF5iBF; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kypF5iBF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775151874; x=1806687874;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=g2e2J/HZEDEymM2gUMHM5ATox5rSaMaYgA44hf+MQoA=;
  b=kypF5iBF1E7yP5pLBlriwOfRuUftWT2xnfcGoMG2t69rCvoFIPPOqT3F
   8no/6F578PdZdm8nCsu5+Iu6PpORRY18jD+dFC+xelk6eAMDy40xx8ZU0
   0bgyszXk+9JCX6E0B3FbOBrD+BdSuppkjNJOOkj0sHukaBel6g0mjgfjm
   mcUf9CpICYxozTlbl8yFLL0kZkeK6yFTXxBUIcsR/s1tWlSBL+ICa7rYa
   GATO6soBauxJi5FR0TlBqu+cFr5S6LAJ+AKgGzs6qvst3p8BaNKRhbf6q
   r+MUOMKNhwwonjkT38tAe8rrc3LMQzhQIwv9HPGK2RB1qUayhQ/vpE5CP
   g==;
X-CSE-ConnectionGUID: Jp/owKLgSgmF/MdvhYwegg==
X-CSE-MsgGUID: RLQK568fQoeoN1k7byEEuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="63767091"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="63767091"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 10:44:33 -0700
X-CSE-ConnectionGUID: 7Udx2WEtSySUDBp3XoLl3A==
X-CSE-MsgGUID: I8Z4uAwPRC+5EKYbBHscfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="231442783"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 10:44:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 10:44:32 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 10:44:32 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.46) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 10:44:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VunoQOOWPAoJ9aGc9j0Ip6PKw+YMHUykxlB5M2VNg3blZUG9+YwfYEpnT/o0I6EkDMAPsoJUbUjFw52c9YR3P57WieFCBiZf524zzRc5008Zlyw6+BGHUqmh9RdXYCl2L5FO7ftIbSh0+nO6PE7LJBJd6DU/qWnvOVssuGxYTPZzz54dwNpbn5LcycUDNsX+ffkSz7p6zadrleBlNIiu74jJ1e71zIQnXEQ0ZVUleMQqzDx6NSISFEJFkBPqM6C8UFrW2FiT3tx6QoGQ976t279Xq9os0sZsTI+EOs4Vq9aHFuw2A1A/59ZzqQKUugV+LcAlbmvUYeXWJJTo7aB/7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VHx5kaE75YGf3u8rqLkKZZRnJvFxqaruue3KYAYREuY=;
 b=mqyEogC+WU/qojAvmOK2MTnU/HMSDmRpU6JJgy95ofCqpdk/R82mPdQ+5V4P9rAJg//SZb9aCHiqkd2BZilJFnasyAsLYxTkvxqHVWKBAt3ar2EJQlirekbcUxqzXJE0ymfYty4qfiDLIwtS+/OEIKAPtXBiFi2KjwMD1n6R87f0F42uloyJ5PQGKZyxZ+7Ido1JtWksGLEDm4AUxLeFMP9j8EWHbprPX0nQFSL99hsyMqbOweXqKXzkB9xFh4qyMF1EDztbmUVvVl3s+5nGF6X3Eo0RZJ2Smy3cSAd3v0z6jIu9GdBzREOSopkilqOBlVOSNt7ncjRqNXbSlu5dfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by DM4PR11MB7205.namprd11.prod.outlook.com (2603:10b6:8:113::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 2 Apr
 2026 17:44:27 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d%5]) with mapi id 15.20.9769.017; Thu, 2 Apr 2026
 17:44:25 +0000
Message-ID: <3059840c-ccf7-42e1-95f3-4d8192dc68a8@intel.com>
Date: Thu, 2 Apr 2026 10:44:23 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] selftests/resctrl: Replace array-based IMC counter
 management with linked lists
To: Yifan Wu <wuyifan50@huawei.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<shuah@kernel.org>, <tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>,
	<ben.horgan@arm.com>, <jonathan.cameron@huawei.com>, <zengheng4@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
References: <20260324125034.1509177-1-wuyifan50@huawei.com>
 <20260324125034.1509177-3-wuyifan50@huawei.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20260324125034.1509177-3-wuyifan50@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::24) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|DM4PR11MB7205:EE_
X-MS-Office365-Filtering-Correlation-Id: 0344ae28-5bdc-43ed-9532-08de90df7b37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: ++s5w1/50nLxY8LxYFZwmYnzg8KZ7OgCXSRSQhL5bRJKmUZBFZu1IH/UnlFb3wq4oP2tSWZ23rMD1Gsx0wCx9Nb6EuwWewD0TZr6DeqQCRM4f8p/JGfP/lpBc0Za+zCHRq/YOojggGgUDNGigRvJ4nz5SHC4E3ifhmTg0Meyy1bwMI6+Hk4iMuw6xm2VY3qHLi8rX3pRmJwVt84PRcVC0KicYYyUpHFo7gP83qNox6tnIc77ENlmKzqYehCGzjcOPHoDn3bOfMYpl0IQURUkgn3+P5DPXYHZh3agTC+mBC+sQT3BaczVRMF2aJoKtebSWhRUZ3Cx1+dyQ+YFLZ52CgPs4Hir2S/reqtF0PH8GSgnAyuasP7pgwYLS7oKwS1U9+xftZWA6gzgUx96EbzvMz/sNuozRzE5CUds/rd6+RMs6TCSmTHsbkQEI2T518JaymohDps/Mkrp+4jId428lSOJya76BnVAlmu7RemrlkA+b9YSpvI9J67gaLZKIld4kqBK+y7qRLc9ucTVBsKb2VElvlotJwq7v1YWatt7+89MUqDaGbAwK4jMVs+1HAjb1rZes2P0xG7LGHEkjw1p7Qb0a/21IdhXYgKGrUzBVj1uNEQJ1FNFzybiMYw63fnEOyLCTx4stFaoPn9720Z2JCuVhpwls7ivxScGH2rDiDKNujHuwOPSrOqZPY2DzXu+RvsT5lE0ZYz5QoS9UTI1LntOW+b9FWt0Sp6wc+G33mME/pOI6HKMvmJNU3SNatf5PLnYRVQ9ts2z/hSIIIdTIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXNqMUxYbTRUV0U3cTQ5Uk1RcWFQNDZDbUd0RU1LU0t0cm5SdC9ZS2RMSEFw?=
 =?utf-8?B?c3k5N21OWnB3dTJDMnJ4cjNKaGI5SjdweEMvT1VwSHhUOEpKZy9paTRpdWhP?=
 =?utf-8?B?WlRCeUlJZ3JtYmx2U1EyRTFmTFkydTk4NWJwdDBOQ0VLNlRaVjJ6Q2FoTk9Z?=
 =?utf-8?B?ME5KY0plVXVPZzNZMmVVNStKWHRJWE9KdklxUHo3RzBScmt5K01ZSWNSQlRm?=
 =?utf-8?B?ZGJDY2N1L2Q5Tk1LazdsbThiNFpqdVZVbkorV25acnhwMnlEbGpvR1EySVB1?=
 =?utf-8?B?c1Q4N3FjR0FxMmFYZk9uMjU0b3E4ajBlTzBpN2ZIcERtTlgzdXhtbjF5T0RC?=
 =?utf-8?B?RGFrSzJmVms4WWh3MzZDQ24vZStZVzd5aGNOT3NjVU1QVkZIbEkzV0NHV1Nu?=
 =?utf-8?B?N0Nnc0V6YjlJL3FYZC8yY3J2ZmczSWtWTVk1alpsSTVyekt0LytlS2x1UmNY?=
 =?utf-8?B?d0R6ekE4Z3BpMEs0Vkg0QjB2UStMd2pVUThuYXZIZnh1U3VJT0VEeVdhY1ZQ?=
 =?utf-8?B?QXJLZ1hFNlFjYk9CdDh5bU1ITmJnWm9BdlhCNWxqajc2QTdNMHB2OUJRVitX?=
 =?utf-8?B?ZXNUNE1tVGdIb0VvZi9zcjZQTXdIcUJKSGdLRmJDV0Uydmp1azVsUFRpQjgw?=
 =?utf-8?B?ZU1wa2RPV05FcDdQNTZnWktZdHA3b3pVOE83Uktqa0RlYk9HU1hZbi94YkdK?=
 =?utf-8?B?K2diekRSV1Y3K3hYd1pQZEthN0hZdGFyeTZ3ekZJWXI5b1g1ZkxZOXhmVWEv?=
 =?utf-8?B?U1laamhhTlBGb1htdFpLZjlMdXluRkJEUS9nWVRKNzd0ZG5jNjRrNURzMnZn?=
 =?utf-8?B?UWVXS3dSb0I5dkVaUmlXM0ZHd05nNFBPN0dCQjI4d0tTQUsybXZNMVM3ZTFi?=
 =?utf-8?B?a2tJZ2JOYmM1M0o0NlJVaEkyTjFtcDVudGUyRWFweXlnN2lXbWlLcC9ObUZk?=
 =?utf-8?B?UXpHZldOaHEvMGFvK0Zoc1dJUkRDVGlnUE5nS1JJLzNmOWU0WFg3WXlEUWRZ?=
 =?utf-8?B?eEMybjd6Z2FFTzdqb3NMTTczRXZOMG5CRUswMlJoR1F6SytEWU1BQTNXN1R3?=
 =?utf-8?B?Zk4zYmo0dnhobkZYRTRyb1ErL1ZQekVhWFg3UGxQQzgvUjJtUmFicTVZdlRU?=
 =?utf-8?B?anJwemJrNGtySE14b21wcGFYVTI1QjUwY1lEZmNjOFZMMno1WmpyU1hiRGsv?=
 =?utf-8?B?M1ZOTUxFczh2cWJ4eTFSV0xGV2NBQkJkWGxzbVBHNUpaWFJneHZmN2dVWEpq?=
 =?utf-8?B?dFQ2WFlJVFdNczAzYWd1cUNIZld2QmNOdm9jUUc0NEJBQUpxV1Z5Vy9tcXkz?=
 =?utf-8?B?UnE5NHZHZFE5dHlwQnl1ME1yc0xldGIrRDEycVhwUjN2NXJ5UEo2UXNnSmUx?=
 =?utf-8?B?a2w2TW1BSVMwTVZPckcwRnlSSG43QmxxVFd1UFNpczRDaDBYUFYyUC84NGpx?=
 =?utf-8?B?QjMwQzBNMGhUN3lHc3RFWWVjV1JxbWJTT0ptM0NxQ2UrNHFMRnQ5RTVBRHZ6?=
 =?utf-8?B?QzU0NkNwbFB3bEZJRXV0dHMyaDFzenJHVVA3SmRTaUF5TURLK2F3UlRaeWZJ?=
 =?utf-8?B?WUV5Um9XaFcrRStWOE1oTER5NlI4U09RaDk5QmQzcHlxTFkwS1VTdjZEd2l6?=
 =?utf-8?B?UWVyZk95bnN5WlI4S3NmWGRuWW1GeVdWVWFmcVBHcVZwRno2WVFUK2VQK2Fl?=
 =?utf-8?B?eGRicTdZZUVoa2ZwN3JzN0ZHNWdoM1l1OURxR1lFTXJqU0t2NUEvOTVGSU9h?=
 =?utf-8?B?UVlFdlJrOFNwQ1REc3lVWEplNXBKZGVQR01ad003VVh1SEVIN2twT0lmdDBI?=
 =?utf-8?B?eHpESE8xZ1J2TTN1UFdBaUVxUERnS2R6czRUMmJvUnhTakFsUzZKUzNubGNR?=
 =?utf-8?B?bW1WYkZNSk9hOXQ1Zllvcjhzb2lJTU1KV25pclFrZlRHK045VFNaN3BqY3pI?=
 =?utf-8?B?N0JhOGhuMmNmOGNUbGFxeERIL1EzNWkybWNZQ0ZoNzJnbWZvaXFMTGhKdHBp?=
 =?utf-8?B?M2tkckRLYWZCQkRYVUF0VG1SMzVCZ1ZRV25tYTF6SmI5WVlRamplb01qMUhx?=
 =?utf-8?B?cm5YaHRuOUhvd0prbWlGV1BVelVLUjB3UWtjY2M4NHlMelVCM3hmTmxpbVk4?=
 =?utf-8?B?R1dPaXNSbUZnYk5YSDB4blduMFBpRklBWEpZZlVHK1hDNjc4Wi9ydy8rWFBB?=
 =?utf-8?B?VFpqckNYb29QaUFwYXdwUEZFcVZ1NVpwaXVkUGdPczhUSWsxRXo3TncxOVN6?=
 =?utf-8?B?VWhRWTArOGZCbnV3V016bEdmNUdtMGcrbDFFZ2ZzWjkwRHFvKzI1cEV4emJW?=
 =?utf-8?B?cW9ycDRjZzF4Wlo4NmxsVit1M0FJM2w3WWxBTUNvVklzYVVrUlhZNnpBVDI1?=
 =?utf-8?Q?5OE535HAUQys6Lrw=3D?=
X-Exchange-RoutingPolicyChecked: sh317tm7ZPuLeWBylmpsJEKecu1wkBunwWdA7ItY8SQW8sqOAoNFMXDNwRmbONUXstelMRzKpyabxktmMi101ly+tqQNotGWaDVW3eCOjPVT/8TrxUowqRaahojdmpGHkEw7sLjicJNwc67tNR7FiwYs7/jIZZKd31UgKkihoOKAGJ/fu4xW028zNBjRGC0PXhs7y1/IYSo9s6w+7POTfodTthuCmxxQme60Ln1Z7gI/+p5ubfrAmzonjEcUbVkBAUDwMKuS/lw5P4dIuUf429pORifUkDVAtV2SYTpYG9XfpFkG6G6dDqqRftUtWBs5bc/Loft1m9FhUos0KSfepw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0344ae28-5bdc-43ed-9532-08de90df7b37
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 17:44:25.3662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B044vnwiCskXdrcuKOmXpdh4hG/+v+fVkBZH9UJaNZeYhO3Grf5sEsKhd7FE0OC3yCSBpVb5cvl6QCILx0qZrxYHnbjMSuB+07cuuT2Bo2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7205
X-OriginatorOrg: intel.com

Hi Yifan,

On 3/24/26 5:50 AM, Yifan Wu wrote:
> Convert IMC counter management from static array to dynamic
> linked list allocation.

Could you please split this patch into two? One patch where utilities
receive pointer to array element instead of index as parameter and
another patch that switches the code to use a list?

> 
> Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
> ---
>  tools/testing/selftests/resctrl/resctrl_val.c | 134 +++++++++---------
>  1 file changed, 66 insertions(+), 68 deletions(-)
> 
> diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
> index ac58d3862281..417d87ba368a 100644
> --- a/tools/testing/selftests/resctrl/resctrl_val.c
> +++ b/tools/testing/selftests/resctrl/resctrl_val.c
> @@ -14,7 +14,6 @@
>  #define READ_FILE_NAME		"cas_count_read"
>  #define DYN_PMU_PATH		"/sys/bus/event_source/devices"
>  #define SCALE			0.00006103515625
> -#define MAX_IMCS		40
>  #define MAX_TOKENS		5
>  
>  #define CON_MBM_LOCAL_BYTES_PATH		\
> @@ -38,36 +37,37 @@ struct imc_counter_config {
>  
>  static char mbm_total_path[1024];
>  static int imcs;
> -static struct imc_counter_config imc_counters_config[MAX_IMCS];
>  LIST_HEAD(imc_counters_configs);
>  static const struct resctrl_test *current_test;
>  
> -static void read_mem_bw_initialize_perf_event_attr(int i)
> +static void read_mem_bw_initialize_perf_event_attr(struct imc_counter_config *imc_counters_config)

In parameters also, please use a variable name used for element that is further
away from list header name. How about just "imc_counter" for the function parameter? 

...

> @@ -112,10 +113,10 @@ static int open_perf_read_event(int i, int cpu_no)
>  }
>  
>  static int parse_imc_read_bw_events(char *imc_dir, unsigned int type,
> -				    unsigned int *count)
> +				    struct imc_counter_config *imc_counters_config)
>  {
>  	char imc_events_dir[PATH_MAX], imc_counter_cfg[PATH_MAX];
> -	unsigned int orig_count = *count;
> +	unsigned int orig_count = imcs;

Why is global imcs used/needed here? The intention behind orig_count is just to
check if any iMC counters were added by this function. Original code checked 
by comparing the "before" and "after" array index but with a switch to a list this
can just be done locally, for example, with a boolean.

>  	char cas_count_cfg[1024];
>  	struct dirent *ep;
>  	int path_len;
> @@ -165,17 +166,13 @@ static int parse_imc_read_bw_events(char *imc_dir, unsigned int type,
>  			ksft_perror("Could not get iMC cas count read");
>  			goto out_close;
>  		}
> -		if (*count >= MAX_IMCS) {
> -			ksft_print_msg("Maximum iMC count exceeded\n");
> -			goto out_close;
> -		}
>  
> -		imc_counters_config[*count].type = type;
> -		get_read_event_and_umask(cas_count_cfg, *count);
> -		/* Do not fail after incrementing *count. */
> -		*count += 1;
> +		imc_counters_config->type = type;
> +		get_read_event_and_umask(cas_count_cfg, imc_counters_config);
> +		/* Do not fail after incrementing count. */
> +		imcs++;

Note that this is a loop that may initialize more than one counter and since it
uses the single element provided as function parameter each new counter will just
overwrite the previous's settings.

As mentioned in patch #1 it looks more appropriate to allocate and initialize
new list entry here within parse_imc_read_bw_events().

> @@ -239,7 +236,7 @@ static int num_of_imcs(void)
>  {
>  	struct imc_counter_config *imc_counters_config;
>  	char imc_dir[512], *temp;
> -	unsigned int count = 0;
> +	imcs = 0;
>  	struct dirent *ep;
>  	int ret;
>  	DIR *dp;
> @@ -275,7 +272,7 @@ static int num_of_imcs(void)
>  				memset(imc_counters_config, 0, sizeof(struct imc_counter_config));
>  				sprintf(imc_dir, "%s/%s/", DYN_PMU_PATH,
>  					ep->d_name);
> -				ret = read_from_imc_dir(imc_dir, &count);
> +				ret = read_from_imc_dir(imc_dir, imc_counters_config);
>  				if (ret) {
>  					free(imc_counters_config);
>  					closedir(dp);
> @@ -286,7 +283,7 @@ static int num_of_imcs(void)
>  			}
>  		}
>  		closedir(dp);
> -		if (count == 0) {
> +		if (imcs == 0) {

Is this global necessary? How about list_empty() instead?

>  			ksft_print_msg("Unable to find iMC counters\n");
>  
>  			return -1;
> @@ -297,20 +294,22 @@ static int num_of_imcs(void)
>  		return -1;
>  	}
>  
> -	return count;
> +	return imcs;

Looking at how the caller, initialize_read_mem_bw_imc() below, uses the return
value it does not seem necessary to track the number of entries anymore. Could the
global imcs just be dropped?

>  }
>  
>  int initialize_read_mem_bw_imc(void)
>  {
> -	int imc;
> +	int ret;
> +	struct imc_counter_config *imc_counters_config;
>  
> -	imcs = num_of_imcs();
> -	if (imcs <= 0)
> -		return imcs;
> +	ret = num_of_imcs();
> +	if (ret <= 0)
> +		return ret;
>  
>  	/* Initialize perf_event_attr structures for all iMC's */
> -	for (imc = 0; imc < imcs; imc++)
> -		read_mem_bw_initialize_perf_event_attr(imc);
> +	list_for_each_entry(imc_counters_config, &imc_counters_configs, imc_list) {
> +		read_mem_bw_initialize_perf_event_attr(imc_counters_config);
> +	}
>  
>  	return 0;
>  }
Reinette
