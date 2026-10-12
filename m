Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEDE42E8F4;
	Mon, 12 Oct 2026 22:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791842964; cv=fail; b=Hf18U6cQ542VgCXZdWXGAobh8Gr1ypV0w6hvzX1gZnxZ9/HMVJXyYVL7cuaacPIeahbTlfWwVYSxWf4IA5iYMsaQuM2m9F4E4y9/52n0PH07lhG8i557ybvCY9knrq14PEncm34rZUlOXo1FqhTlskRnwiOxGpXodDl5b7tf+JQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791842964; c=relaxed/simple;
	bh=YqpnOfmg0o4Ub3YXHk8lxxoFC95Awi2fW+AaqPw7SDc=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WXCfk9o8yvYfsMoz5qyE20RDL9fIPsWpj2D80OatZzoC4ddf5VhPUq3NbHGUbgOWoPB13t1A9XoS74C1Y6votMXzNiwYZge//j4nM3T2VBbOfmWWl06kHXKg2tjg9XhsqW9rQMDZFj8+ji5FoEOkKAUGUmPPV+RGzxnxhCDUL0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WOx9fDlz; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WOx9fDlz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791842963; x=1823378963;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YqpnOfmg0o4Ub3YXHk8lxxoFC95Awi2fW+AaqPw7SDc=;
  b=WOx9fDlzZQYEh6M6tvoJ4AndM8XGuzElr6ikl3UKeSwVjZ2kV6D2EY9j
   E6/kGpxLZXL5SrDeszVLjnFZKWTo2CJ+q2aI+lfxDiHMmxFdiLvk0wMe/
   KZUwSeagCU+XFYJ+CmPa23cEnKr++7xYqQYH5f60ImEJ6nPP64UuJjvhF
   iykGcGwl/n49fzKqiNq2w/34TWRsHi0eOAP9vYt8+GluZnLHNdKgzojTF
   0JMFDYNzfoDItudujy44H0DJmh49v51hnMIfEn+j/h9FvqU9g/3jztOk6
   9inwSU/2CoyVojuRG2fDZ5m6dCui4xooCGZvGlqCcTrGmnddonVadN6B1
   w==;
X-CSE-ConnectionGUID: 6XMceJQtR3e9A3zHR4oyUg==
X-CSE-MsgGUID: b1lG5URDQoCyxfHee+t3sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="461965"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="461965"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 15:09:22 -0700
X-CSE-ConnectionGUID: QsaSMEudSg6FtTD3YnTvbQ==
X-CSE-MsgGUID: 207L7EAmRNWhw7YWw6DSSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1323650"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 15:09:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 15:09:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 15:09:21 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 15:09:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ogEqhV1VEa119Odyx4X+Iw9vTCa/rgqS+oC6UhsfRZftMtCSMHCNT5sTA4B8tDC58RLP3ZBSYcHD8KQz3C/hW7ZRpsQejymJqefmquL3Pia/otHHQdgunB95ceTN0gPEHdQNizv5NSRfNvKLvDlJ6ZFWIl5NE6kxOEZ56Uuak7TOFqT4qmuBUXgjH+Ytny5g8wZLXKkiDZ7WmariGG8Uray1zAl3uxn9beFEpP6r8pR6SXYVj9k/vFHTgyUSKFHd0xLCutQ4g1B6g21ICAyRb5xQRmxIre93eQNAR4eu1vvzSj5eHmBpvDYkgGdI0bzD5KIzjJCUfDeRZIvMtPkiGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SYvDWc0vlaH5j8kdkQREqJFPL1NmOJkrfw7vb0BAtiU=;
 b=wlTRv+CGbFHvZMnph3A3LUJ3/LSynh+sp9zSRqeyXGW5gmukaAexWyHsGWNh06Yhl12Ewx7WP4KhBbEwY1yuVYqu2gj2x2CK3Pu4Un+j0ivvpNafYDO+AF8ryyYj4zuDn1umN76HVSRf8Q3iv6Zna2xmR+cuX6SlMd2hjVIfo2fmYhJaFlHpCTWzBkk0FHMVsA4tKPyt8PKZ/6+f8yIYgocsRO/QUGkP+YmJCeTZEbLqc48fcpurimprNAL6rZhc3r6QiY83zE8tYtblq6G66FcsDLqFGylR0ZqJ68Tlvh9a8lPl6kTk8FHfJoTSHF8EaU7kb2270HIH6ECNQvZcXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by DS6PR11MB252200.namprd11.prod.outlook.com (2603:10b6:8:4f7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Mon, 12 Oct
 2026 22:09:14 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%6]) with mapi id 15.21.0496.018; Mon, 12 Oct 2026
 22:09:14 +0000
Message-ID: <f1717846-9f29-4de8-b342-87e819978c7e@intel.com>
Date: Mon, 12 Oct 2026 15:09:11 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] selftests/resctrl: Fix resctrl selftests issues on
 aarch64
To: Richard Cheng <icheng@nvidia.com>, <tony.luck@intel.com>,
	<x86@kernel.org>, <shuah@kernel.org>, <fenghuay@nvidia.com>, Ben Horgan
	<ben.horgan@arm.com>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<kaihengf@nvidia.com>, <kobak@nvidia.com>, <newtonl@nvidia.com>,
	<kristinc@nvidia.com>
References: <20261012074729.40042-1-icheng@nvidia.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20261012074729.40042-1-icheng@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0219.namprd04.prod.outlook.com
 (2603:10b6:303:87::14) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|DS6PR11MB252200:EE_
X-MS-Office365-Filtering-Correlation-Id: 3503da62-012d-4c5f-33f2-08df28ad7349
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014|23010399003|56012099006|261009223027099003|11063799006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: StY1hDhwON6ph5ekrBuSgxX0WxPQ5tLOTvFnQH0BeO8oNiEAUaaNPBQZr8JJHepsm2rdVInGcb9dh4BPDB5dmrhCmz+nxLJM0uv4ARz+OWI+YNBlla39J9olR+dLcjl04ZDI96ebXqm4XHJNa6f0obsmpTtlbr/kOro/lJ73N0wJcFs8Yf7orTLKtn5KQon3e69dkOOkfbSM2MoJZ3qpP6IcyCT6Dn4+be2qLS4vdGziVJcOdcj2jlU2Wyk8rBSr7ZPmOIVpqRnwRFSg4W1kDnhihA4S3r1KD/qdbWM6272KYWGqTf9nAhmECshVlLiCRtjyJPYn58tiBDQ8PT2sU9KNY1ibYQ9VdZo10cZWIngOrTpBp/UhSWUdyBsmiWNNYZEAUm1icGhR52N3DdxIevHtGDBDB6sCCZrW0nINNUOapBypVqLQ9SzdGn+wmNp2giXkZprbT1AHURbPJLgT57hC6kLbOwZBlWLIXR3HP4BO6aUBw6nCOVxdtPfQQNCuOw+wmoYdZOLPAX5YfBtAuKPO0at4t46AgjglnnTGQ57QwdoqdcKdo1TV1Mh6bIsw4d156FgZcI10f0fFd1nSFxHqaqgJyBYqaPZ6o2mPY2baPguDCszOOEtV7BN6CEVc6TPjQtRYWOso0rq5L3sENC58f5XXMFm4GKXTAFI3dn4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(23010399003)(56012099006)(261009223027099003)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MThHUVI0ZDFuU1JKWFJKY0hPb3RrYzN6Q2svTkxJSFh1alNQZE1temNoM3NL?=
 =?utf-8?B?TzNuOHh5SlU0NnFDakdPTnkvckw1bWtLWjYxLzU5aWxYVTd2cmkyRFh1V1ZE?=
 =?utf-8?B?a1RReEFCMEJwUWM2L01nam4wYmxFVmU5NkNtbFh0azVUUnRJQ2lmSjhDYzhC?=
 =?utf-8?B?bzI1SWNqYXZFODdmaVo0NnE0ajBmbG1IeGZwZE5YdUtFd3ZaWStIMm83UmVs?=
 =?utf-8?B?ZmMrUFdhcHluaEVSZ241Nm9jUHV5dmE3bXB1YXR2U0RwSVI4YUR0UHh0ZS9t?=
 =?utf-8?B?UGlrK0dYUlpGMmE1cVEyM2pxOWJZQU4yOFgwUDd5VGdUS1ZTdTBzd0ZHUnBw?=
 =?utf-8?B?MDVuM2o4Zjd5QmtJYko2d2dvS2ZwRUpwQW9MQ3hNQnByTUdNU1ZEd1V2clp3?=
 =?utf-8?B?clpKUWh1NzdicXoySW41cW5VMlRmTkNyVXVBK1NVb0dZeVUvOW42Ti80UThG?=
 =?utf-8?B?eE1YT00veXhCeDNTOXBQNFFPMGRESFNyQ010a0VoUXh5bCs2Q0c2SUZIeFlk?=
 =?utf-8?B?WkNCSFBOckRxWUl6SFl3L0MwMXBCUCtLdGtYWWNuaGI0bDBEd3FXYXkyemtz?=
 =?utf-8?B?WldzZWZuejFGN1pKc3h2NXo1ZHNrelBLUmdpSXNPcjEvdkVhSjE4ckRKVGZP?=
 =?utf-8?B?ckYycnBLZXFIS3FLVGg5cThpWmdPWjFTRklhODhNdTlGeXVEY2R2b25CVitP?=
 =?utf-8?B?MzlJNU1YM3RFVFFURERpSFB1U3I5a2x5QklrOUxWQnJwWnVva2lTREV6dzBs?=
 =?utf-8?B?b05Jb04zUXJzQWN4VHJDWU5ST3llMDZ6ODV6SnpqV2QyNnpzQ0VaZXJOK08v?=
 =?utf-8?B?bVFibXQ2Q2M4MEhXVTN1VTRwMFF2ZHVLemRkaVpIZUFPaWllalJrK0UvVXRB?=
 =?utf-8?B?SlFPWll3QlYzSUxZcUd4NGVVMnM3SGV5dGVzbkt0S3pEZkQzWjlzb2NRRmVz?=
 =?utf-8?B?WEc4RUtYc041cTRaSXR6VU9KWkc4UGZzYzhtNU1Ld1JKVDRidWswNGxIb0hr?=
 =?utf-8?B?OGpYYUlubEk1WUVYendXTURocTArME1XVmorSkpzN3BDNEpVN2w4cklITzJC?=
 =?utf-8?B?dU5iMkl2bE1iVk0wUGVGazJKNDhaUzBaTDVsOG1vWmNON0J1cGR2VVlFRkdj?=
 =?utf-8?B?dVVGM05TRlIvUm5iamVLSyt0NXh0Zk5pTDA2VlJqVjlpVWM1cURhN3ZIWVR0?=
 =?utf-8?B?OTdQY0F4NE5Bamd4U3U4WGJmZ3hCbjlDSTI4QXllNzdlZXA0OWRoNTQxdDZz?=
 =?utf-8?B?YWpVMGZyTUs1N0U1SFdLUy9qYzV5V0l2ejh0dmtUc1UwU0F6eUFCdGZzWDA1?=
 =?utf-8?B?UmZSazh2SEQxL2FRTVFHcS9SSlVNWVl5WHdiaGJpUDJIaS9UaHVpem5nL3o4?=
 =?utf-8?B?UjBpeEZBb2FRcU5IQVFYbCtYbGU1OFhlTGovZzhDSE5OTjhkQXp5aFl5Smlh?=
 =?utf-8?B?UWNyU3RPeGtxbFh0dTRnb2xmV053dnY0aXlPdHM2NTBqa3JCMnZzSUR1ekV5?=
 =?utf-8?B?VlVmZnV0VVFLY25keU5xSDRWVE0vS1J4MDR1T3hXOUt0SHZqcEh1UDVnMmdP?=
 =?utf-8?B?d3oxYkJDZEJ5bFRENXJuWmRlY2RqcmhtN1FpNERkd0oyN0VLNHNoUXNvUWJ2?=
 =?utf-8?B?OFVQR3k3QWpSTWoyNi9xdStINE8rcENGYjBVMzJIdVQ1aXhLYW1WOUFQQ095?=
 =?utf-8?B?eDRhd2w4VjhOLzdINXR6STBpeVh5eHQ3aTR5d0FJZE9XMFRRbzVadkNzZHE0?=
 =?utf-8?B?NEZCdUZqUkFlMDNuaDE0ZGZVUk9xTzAvalJvVVUrZE9sU1ZNNUU3U1dRdU5L?=
 =?utf-8?B?enU0SFBTS29HMnkvb0R0SGRnQ0tBcnpoU1JkaFJIck9PbDVxa0JYVUdENXp4?=
 =?utf-8?B?R2N3OHZPVGlFRHdvcEI0NXhpT291L0pveHVMcklTSEdJekwwY3NTM0JhYSt2?=
 =?utf-8?B?UXpmTmwwRDJqelEzbVlDcHo4SkhSTy9rWHk3K05lTjB3eGhwZGFJOS9xWmJY?=
 =?utf-8?B?aVp0Qi9KdUN0OVZWK01zVlZSSTQzRSs3NHM5akNOWGVjVDVwTCtiL21zd3dv?=
 =?utf-8?B?R21qazY3OGhRR3BMNkNRbG1MN3UyaWUxbWVkenh1azJSb1ZqdnphQy95SkpG?=
 =?utf-8?B?UXVNbTNuS01vZ1l6OFJ4SmlPbHV5UTluQXl6MzVjNFE1d2xjeTFwLzVqckVO?=
 =?utf-8?B?NDlEcGl4SHlFWU9TS2tpdWhnWFhwblBscHF0Z1U3a2tUNGR5MWtmc2tPdjhv?=
 =?utf-8?B?cVYybDRoaUoyTWZTcUJFN3NRY2hIcjNETTlSakI1YllSMUNvREg5Q2tUSFJk?=
 =?utf-8?B?RGxJb1FUbE91bVlKaXlKQ3VjUE8wKy9uaTd3dFljTERWdE9uZTdtVVNYZGJh?=
 =?utf-8?Q?V7zd6rzA40rv8D0A=3D?=
X-Exchange-RoutingPolicyChecked: 0XhFXVk080M/cKngtMnFzCAk9csmkd4y1z/tzN8bFcKSWrHAj9JIQABQpPlvLRkNKRw6A+S6rUN900Aw1K/4kA3lLMRGa8UHma7yys2k2ZqOG9bGYNbjv/h+BIyXCV1CeR6rknZjy7p+ZWaezJReTCYIEoDst8lmmxezs2znxPqytkuUzw1R9AzXTI8kHBrLAlNEneZu4TDg9q1vOKVOv806tu2rjlVVYX29IeN+Fo0+PotxDMbxaK5wT0ZYejyqyyXHWoJvXrkTlBDH6IOILhfoEDqjPdyh739myNaWEQiLBZL1swhuyLOqATA6GefJWUVwBUyUquM6idaOEmlpoQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3503da62-012d-4c5f-33f2-08df28ad7349
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 22:09:14.0037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: spvXJzs6IhjV0wCtCNoKF2tGqqs1/OaO/YId+9hfwlNRe7P4nAx2s1otgcH0u7zspGa/t23/3aeWIlStbHkifpgvawS7ctnyXf3rl56ONg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB252200
X-OriginatorOrg: intel.com

+Ben

Hi Everybody,

Could the Arm/MPAM folks please consider this series?

Thank you very much.

Reinette

On 10/12/26 12:47 AM, Richard Cheng wrote:
> This series fixes issues in the resctrl selftests on aarch64,
> where they currently misreport failures.
> 
> Patch 1 adds aarch64 implementations of cl_flush() and sb() in
> fill_buf.c so cache flushes are no longer silent no-ops.
> 
> Patch 2 teaches detect_vendor() about aarch64 (which exposes no
> vendor_id in /proc/cpuinfo) and lets arch_supports_noncont_cat()
> return true for ARM, fixing spurious L3_NONCONT_CAT failures.
> 
> Changes since v4:
> - Drop v4 patch 1/3, which was applied to linux-kselftest/next.
> - Rebase the remaining patches onto linux-kselftest/next and
>   renumber v4 patches 2/3 and 3/3 as patches 1/2 and 2/2.
>   No code changes to the remaining patches.
> 
> Richard Cheng (2):
>   selftests/resctrl: Implement cl_flush() and sb() for aarch64
>   selftests/resctrl: Recognise aarch64 as a vendor for L3_NONCONT_CAT
> 
>  tools/testing/selftests/resctrl/cat_test.c    |  9 ++++++--
>  tools/testing/selftests/resctrl/fill_buf.c    | 11 ++++++++++
>  tools/testing/selftests/resctrl/resctrl.h     |  1 +
>  .../testing/selftests/resctrl/resctrl_tests.c | 21 +++++++++++++++++++
>  4 files changed, 40 insertions(+), 2 deletions(-)
> 
> 
> base-commit: 30af56a227e27b892d34bc44c23298b5274913e3

