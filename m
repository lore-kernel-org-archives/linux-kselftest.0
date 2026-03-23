Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8496125F994;
	Mon, 23 Mar 2026 15:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774281126; cv=fail; b=lbpFTh0+UEGhrvNVc8GH2kcdOqrMIw+y3XnHvgjxsCoev4OxJF8Tqfkldl0xTLXJKJYLrDAeKf2Gy90mTx5afSiDpo3nkOdAZ54Cyyljn6mSzfA+QUyOAhALFFlo8nMwFsCGrtwoICdVTeTL4C499KO/8Qw7cCY3q9SOxIspJxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774281126; c=relaxed/simple;
	bh=Wsy4mgLvmZ1zb7hkkxczM7lgmvPfWbrrjQnkYsvJG78=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LJSmHyDWPMTyeoCKJocFRgXcA76MsNzO6AvbXrxljBy7v/7Osy7a/3Bm2+VlD8l5ZRyZsz4sP+gKFNHBnSSxxX2jY0tgMmo4LqAteR+tomCWmIrosA7sVa0Y20bzfBfs/42AnaOnhr1H/4pElNmYlyM1NMZIOvaLflEEI6mtGs0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fz6B8uA/; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fz6B8uA/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774281122; x=1805817122;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Wsy4mgLvmZ1zb7hkkxczM7lgmvPfWbrrjQnkYsvJG78=;
  b=fz6B8uA/Xw6lYcEdKbS+zg/tVjMUzL0hTTDnQRVKQbXmX7/rFk98RiVb
   Kb9QzV0r3O70n0+skYxGSgkOXQymzgS7AXHwzdia44DPIW+V/RAeOz/1m
   sf9D+srDUplbuepjgPgBxDJzleh12QH5j2PWKXbkhLQ6gyndvxRfqwaK/
   jAH3BZMPe94AU0PhpMZFB4p/7yD7F4HIL2PbPJ/SNP5IEL8c8cvPehGmc
   LYV6lzP6qA3RINYV/p/ntAX+cIev9bJth+vnCoy0AJTCF6sNNGUHfL9rr
   XAyR4sh/WiYge55Ofq5iJsamqrNHD75kkUas58OxLLvdk/xsjdkE6ljrw
   A==;
X-CSE-ConnectionGUID: QrxWtF6RRbaYn7Brm2H4bw==
X-CSE-MsgGUID: qtYEj1CnTjiGkZHzidEmHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="97903016"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="97903016"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 08:52:02 -0700
X-CSE-ConnectionGUID: fF/VTXQ+QIWmdRo9h/oAMw==
X-CSE-MsgGUID: Yl4SNv9AQ4WkXymCMEBTfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="224028180"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 08:52:02 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 08:52:01 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 08:52:01 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.62) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 08:52:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lmSDJem7Arv24G7O7pOKOaTo6A14Lskb+9HocNXmg2tZYyc/S6DVkCY838RH12oTVKldXS3n1pGOcXVoHEs7Z+amxHFvS390wpc4fQkjuEX3w3oktVD9MRgoLhDahfpPKDRluBbaPBg+UnveCdwS0RPaGc5QrEffpWU8XZ4OMkkS+L88t5mBnZ6Ou8mIWsaEs3QI4AH5Dalw3ZZ6wA9qb5175Jt1o1Axu274QThtL7pDgzg/wnIHYYVXeoevkTYIp2C5FQg7N/UGasxjQw082jgmDFAHZD81fAOSBu+NcY6o6ls0QtxmC6azCgoVtq1pb0XPBNHt1XmA21FY+b2G6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32EEkOhoYJwH8hrTa443uf4buDKYrx0jNJ4E+5sch6s=;
 b=LE6Nx/p04MfmsyKpOg3ZA9IgkkBVb6Z9FmVTKed/Oja1UaUGE45GHLAgDNOeRTHm6QZhjEoePP1olRtCHVTX0+Nzb6Gm8HlqHMbg7GiJ6qGwU9f0mJZ/mOnYpOlPKaKUjTWJlqprktrX0wuK5U+jZgN+EncvvUO+/EIJZCAv1sVhEIuGwzaV07pzN5r3/LEasU2ySbaFWQ6b20z64To/BoUI9Eqqb9bVFjFgg5QpmabN2S12LCVn9HibJvEdQTQb+Pr85z2ICd4ur7Ps7GdJx5aj9LtOjpUg4/0CXg8amZI9m2G6P6vm6Ea0+HAy0ZRN8XEYmC5DMNb2lYtbiRkptw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by BL3PR11MB6412.namprd11.prod.outlook.com (2603:10b6:208:3bb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.10; Mon, 23 Mar
 2026 15:51:58 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d%5]) with mapi id 15.20.9745.019; Mon, 23 Mar 2026
 15:51:58 +0000
Message-ID: <a4bb0590-2ab7-491f-9261-256754347a44@intel.com>
Date: Mon, 23 Mar 2026 08:51:55 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC patch 1/9] selftests/resctrl: Move CPU affinity and resctrl
 FS setup to child process
To: wuyifan <wuyifan50@huawei.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<shuah@kernel.org>, <tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>,
	<ben.horgan@arm.com>, <jonathan.cameron@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
References: <20260304040334.765860-1-wuyifan50@huawei.com>
 <20260304040334.765860-2-wuyifan50@huawei.com>
 <33a9c54d-565b-4de9-b525-1390bfd50593@intel.com>
 <076199c7-265a-4c24-9e8b-964af10931e2@huawei.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <076199c7-265a-4c24-9e8b-964af10931e2@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0318.namprd04.prod.outlook.com
 (2603:10b6:303:82::23) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|BL3PR11MB6412:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f5449f9-0ed3-4c49-bda4-08de88f41d32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 7FdTnb0jDGy3yTnbZneW+fluKCuMFyudwVp1YxbzCjqwAZo0dzLmXUVxtnschGmL1yBbwdQPCg4N5Fm8IrzDH9kXDKzkvDPltMAEhlCd0YytLwF0k+7GCEIeKaliPg0nE5g5S9O0DPx50QxajFz0WGFMoXUm3u+zwYcP1M5nH0V/EuiomNVVqpwIjWYukmBlofj872VCmcR0uFEo0EPR6cXSn/HUStTJB3GeRHtLz/2jLHzD9RpQzOdiN8IeRM0to9nJmINQUy7nKYcEZjHa4YKqhTrXCqXkkhF2BH3729RZmplsSDMD5rz1A2kH55SJzOCN7Qm3/DNwnfMGNtu0pG+5QPsSwBU1sQCPZIXzHJDA3gfCl01+tqpw29W+mZomWgea4hiDc87jinNASjDMjVkonmnoDiMRfONp0sMs32icj+vG0thDDW2sZCOiUwxsK0SKE7WN5RW37o0zuOB3ebLeRCKHEKthd+1lU2x2AeowZFW2Xte9l/D5QpFtJ0cYhgY+WZbqEBvI659RVYeC+YZe0QQoBRiTCGucovaxy8T7dbhLGMhP8qJkRWYZk/mc+disl3iS5SceLWFTddK3xA4+ynaS0AfI7YSvxZYumr/AD6b9jWKVQKnhBq2pzxRgYN6RV4yzyYRa471TF3DSXip3pyppVf6tJskflx3FEJWDmADFF2mqTZJ/v7k4inuJjec/oEB8pWdKi1muS/Xaebp0ySU0AXwA9ZxW/TII3FWVHlBvC2fMqSphkxOtvPX25lb5lFf4m1wHDSI9/7FtoIIt+EuiRkgvqz05kHrU6iQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1lsZWVhN0dNdFJzVjB0ZG9IYzdxMVNHbkZ3NG81Rmp3eUp6dEZ2Mk1kcUEv?=
 =?utf-8?B?S1RwQzdBbWc0Y3pCN1B3Q2tQbmVZcTJ2eTJCcmRCeFpBZlBJWEpWdzYyajBp?=
 =?utf-8?B?S0ZsaTdKZWxiVzNxLy9qSjNPSi9ueWdRb1RzNTJQbG9hWEg0WWx5QmlXWlZV?=
 =?utf-8?B?MDdlQW50MGU5SHBUM1BvbTdmNVQ1QkMyeU42aW42WkFCYTNmVFVaUzhKVTdw?=
 =?utf-8?B?dVdkMWZpalQ4ZDVORkZidHlEOUVJMkc5Rzh6WmVvT21ULzcyaUMxY0JTRnQz?=
 =?utf-8?B?S2ZyMWZQMDBJTUtLanJjU1Rxb295VGdjNW03R0VCb1JTdmdKdkRITTltNmJB?=
 =?utf-8?B?b0EvMG5rZkszOVdySTNHV0tSZm5pZkV1V09OWE0zRW8zZ0ZzNHNGMmZJODZP?=
 =?utf-8?B?dDkvNjVaTVMvTm5CYWJhSzN6cGp1bzVGaHNnWDBtb0ZmZW5yV0Y4QkFwakpD?=
 =?utf-8?B?UjhoMjUxZUFQeUpxV1FiYkF2RVgwdWpRTFFqZDNTRmdzeUtpRDFYeGhjTGJY?=
 =?utf-8?B?dEhLNXJLODQwSUtNY25zU1JpMDcxbjZkSEg0aTRMKzFvVEZacEwwdHNYdHll?=
 =?utf-8?B?K3F4U09aUFhVOCtjd0xCSU1NWDhseERtOFgvYTNTRUQyKzc3eGFodDdrV1hh?=
 =?utf-8?B?ZTJINjZvYStoTHlrWm02cGJ3V2trdjJRUEQ2MDVoZ00zcTVhd1Bsb2lROGJ1?=
 =?utf-8?B?VWMrWE0vTWdNVjNGSUlZeHExWmFBUCtkZUNzcnpzclEwMlErSzFEb1NLWlRw?=
 =?utf-8?B?eFA1b3V3UWRBb3JqNzJBdVZXU1hHS21LZHRibGN6MG43cDN3c21Xd2RzL0VI?=
 =?utf-8?B?dGFrVXdVMXBPOGR2WGUyb3dNclY2czlyM0liRUFhOXBUbmlxT2tDN1lGek81?=
 =?utf-8?B?ZGpZaTBQWHFObm9jbG52MTlvUVBkckxtZ1dhYWR5Ny9NV24xU2d2Wk5mLzA1?=
 =?utf-8?B?UVBHTVAyYkRpNmVoSXhnNmRySW4rZkQ3aE5KS2F6Uk1SSEVNSll5SXQ0NDFo?=
 =?utf-8?B?V056YXIvRnJsUks5U3ZibVpqalVyektRMjREVk9Id0cvZ1VnSDYxYmgrdkI3?=
 =?utf-8?B?M3FsUmt0OCszQ2JzWVAzZTd3RXltckZQVUdIV3MyK2x4RGJOQjI4bjFoOE5x?=
 =?utf-8?B?OXc2ODNNTWNzQkppRWpKUm9VUHJGZUVqdjRjU2UrcVEybnBmaXdzQUk5dklu?=
 =?utf-8?B?ZEd5RVlEYitWYXhYWDhESUJ5S25QVElsRW9iVENTVWdaYzlSbTh1enJ6K0xv?=
 =?utf-8?B?WVBCanNTVmJWdUFBTzROTGlQV1owNlRVMFFCalRYSnhhSFZhZWtaRnA2ZFpp?=
 =?utf-8?B?NnpJQmwrQ0d1YVNQUUlDcXFOWlhpR1lYekVnVmg1TG45TVZUM3Z1di9PLzB5?=
 =?utf-8?B?aW5keklCMkI3TGNjeXl5d3g0czNxMWdreUUzdjZ0U0dtMnJaVjBhdmZTVmtW?=
 =?utf-8?B?cTBBSXBaVDNlQmRzcUZ3QTdHNWhxcVB6ZWhlWjhlL3pHVmh5YlBsSFV5Tzhw?=
 =?utf-8?B?ZW5ITmZrRUY4cm9zOGRwcHJ0Z3daVTVjUmhCOEZ6TGtXbDdVQlBjdnYzVnYx?=
 =?utf-8?B?ZTB5bDlwNVNRQ2NSdWJuMlZ2ek9PUEEzQlQ3WTlybU5zMWhTWW40cXF0bFY4?=
 =?utf-8?B?RVExMW10aVlFUEoxN2tUYmsyRk9oeEw3Z3NXRjE5UDlFV0JGWjBITCswaVFE?=
 =?utf-8?B?emNUMmJmd1JhMkFGZFpEU3JhVVBJbG1scTFRQ0s0QWpZOGIraXVTcUNhTm51?=
 =?utf-8?B?UmZCWVdPUFhUend4RkFRNlFrMUt6UGxMNWtFN21ZMXh6Y2FoRzVTRUlYQTRy?=
 =?utf-8?B?MGZ1SlBUejZPcTJqNWhnanlESk5ZMFMzZEVBQkJwVzhPdGlmQ3VPYVZoblQ5?=
 =?utf-8?B?R2U5TjJSRjFTMFUzWG1aMjI5L3NmWkRIVmVKcm80L00yMUhwSTZMUE1pZXR4?=
 =?utf-8?B?VkhhQy9FLzRQVTNpMisxWU4wTW1HWkZnVGp3clFGbEsrdEVqcHFNZDkxelN6?=
 =?utf-8?B?Uzd5QjY3bTJnRjYzYnQ3QlZPcStUOHdDL1NQU3F2dHRlUkVSWkNxZW0yZUZL?=
 =?utf-8?B?L0pWY0ZhaG9KU0Nyams5T1VIRU0xd3JkRTVaV3NGTGlueDRmYWdPMDBwTFRy?=
 =?utf-8?B?WGJ3VTExMmdkZXdpbVdhV1V2V1NXVkRtSGxHS0Y5RUY2Q1NyQVp1VS9wZy9W?=
 =?utf-8?B?aFZURWFObm5keWRFYnZQZCs0UXZyekRaKzF3cHdvYjdJK25PRGxSaTU1OGNQ?=
 =?utf-8?B?dnI2TWthZWRWbU8zdDlKU05KZGkra2JwTktUOWxoUnFDTXNza3M5eWxXUk82?=
 =?utf-8?B?ZHAvZDlVNFpSejZEZDIwMGR3eEdKMTJzaFNuMUkxZ0tpNE1PaXpCbXpiUUhK?=
 =?utf-8?Q?qBgjFtGCeQ71pL+0=3D?=
X-Exchange-RoutingPolicyChecked: QnU5qc/tYteB8toMIiCOIjBZ8L8shm/en9qdLnS7K0XmRls8tn1iJIB9qLWt32Wf9F7WQaGMUgbjHGSsajKeIzPhJEfgIjp0/9uPl7rxb9fPrrDOPlIDXMTJqH486ESbgIUhUgU96AxR8bUQ1DlJXs50yOLxyS2sbtm72QRXb5zkkqEiSAvQOZQRQaX/Ya5oUSxXtz9NHWHYJwrbgcGO9vbmlG7h7TRXtLdiPYciWOF1wsOQrhHbJeV9Z34N4xVSv8K+UgUDlit2RrmSl+ZX3fqkrWDhkpLXMVNB/JGYhAdCmMLdKBWC5p6jEq6KYtijJKFe+nUUsDKmjALw7hsl3Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f5449f9-0ed3-4c49-bda4-08de88f41d32
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 15:51:57.9877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SoIDqvRPQaQYtVU4gDPuR5kg+TpHjS6plLjxJxD2rU7FghlZnRWdsNBGU+/u7d+xbffoPvf9lEhxf9s3MjPaasOHpg6gWszW8OKmGjS86Hc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6412
X-OriginatorOrg: intel.com

Hi Yifan,

On 3/23/26 2:18 AM, wuyifan wrote:
> Hi Reinette,
> 
> On 3/13/2026 4:53 AM, Reinette Chatre wrote:
>> Hi Yifan,
>>
>> On 3/3/26 8:03 PM, Yifan Wu wrote:
>>> 3. Since only the child process is monitored, the CPU affinity should
>>> also be set only on the child process to ensure that the PMU (Performance
>>> Monitoring Unit) can count memory bandwidth from the benchmark process.
>> A child process inherits its parent's CPU affinity mask, no?
>>
>>> 4. When the parent and child processes are scheduled on the same CPU,
>>> the parent process's activity may interfere with the monitoring of
>>> the child process. This is particularly problematic in some ARM MPAM
>> Which tests are encountering issues? For MBM and MBA I do not think this
>> matters since the tests just compare perf and resctrl numbers and perf
>> will already contain all bandwidth associated with the PMU so isolation here
>> may require to potentially take all traffic off a socket.
>> CMT tests may see some impact since it compares cache occupancy to the
>> size of the buffer being read. I do have a pending series that aims to
>> address some issues with the CMT test:
>> https://lore.kernel.org/linux-patches/cover.1772582958.git.reinette.chatre@intel.com/
>>
>>> implementations, where memory bandwidth monitoring real-time values. When
>>> the child process is preempted off the CPU, this results in inaccurate
>>> monitoring.
>> This motivation is not clear to me. Could you please elaborate how inaccurate
>> this monitoring gets? The child process may be preempted but it should not be
>> moved from the CPU in its affinity mask.
> The bandwidth monitoring feature on certain systems only ensures
> that tasks currently scheduled to the CPU are correctly counted by the
> hardware. The counters for tasks that have been scheduled out of the CPU
> will be out of date. Therefore, separating parent and child processes
> to run on different CPUs can ensure that bandwidth monitoring correctly
> counts the real-time bandwidth. This approach also works on other systems.

Does this imply that when a task is scheduled out of the CPU then
its counter is dynamically re-assigned to another task? This sounds like behavior
that needs to be addressed by the driver and not accommodated by the test.

Since this failed on the first system I tried I cannot trust the argument that
this works on other systems.

>>> This commit moves the CPU affinity and resctrl FS setup to the child
>>> process after fork(), ensuring these settings only affect the benchmark
>>> process, thereby maintaining measurement accuracy and making the
>>> implementation more portable across platforms.
>>>
>>> Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
>>> ---
>>>   tools/testing/selftests/resctrl/resctrl_val.c | 68 +++++++++++--------
>>>   1 file changed, 39 insertions(+), 29 deletions(-)
>>>
>>> diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
>>> index 7c08e936572d..85ac96c7cb8f 100644
>>> --- a/tools/testing/selftests/resctrl/resctrl_val.c
>>> +++ b/tools/testing/selftests/resctrl/resctrl_val.c
>>> @@ -545,7 +545,6 @@ int resctrl_val(const struct resctrl_test *test,
>>>       cpu_set_t old_affinity;
>>>       int domain_id;
>>>       int ret = 0;
>>> -    pid_t ppid;
>>>         if (strcmp(param->filename, "") == 0)
>>>           sprintf(param->filename, "stdio");
>>> @@ -556,22 +555,10 @@ int resctrl_val(const struct resctrl_test *test,
>>>           return ret;
>>>       }
>>>   -    ppid = getpid();
>>> -
>>> -    /* Taskset test to specified CPU. */
>>> -    ret = taskset_benchmark(ppid, uparams->cpu, &old_affinity);
>>> -    if (ret)
>>> -        return ret;
>>> -
>>> -    /* Write test to specified control & monitoring group in resctrl FS. */
>>> -    ret = write_bm_pid_to_resctrl(ppid, param->ctrlgrp, param->mongrp);
>>> -    if (ret)
>>> -        goto reset_affinity;
>>> -
>>>       if (param->init) {
>>>           ret = param->init(param, domain_id);
>> write_bm_pid_to_resctrl() does more than just write the task ID to the tasks file,
>> it also creates the resource groups in its parameters. By moving it after the
>> param->init() callback it prevents any test specific initialization from
>> being done in the test's resource groups.
>>
> I see. Since mbm_total_path, which is used in the parent process during
> param->measure(), is initialized in initialize_mem_bw_resctrl(), we
> cannot move param->init() to the child process. However, we can perform
> the test-specific resource group configuration in param->setup(), as we
> did in mba_setup().

Setup that only applies to the test self can reasonably be done within the
actual test workload but test initialization via init() callback can reasonably
expect that the resource groups exist. Consider the CMT series I mentioned to you
earlier, I have since submitted v3:
https://lore.kernel.org/linux-patches/cover.1773432891.git.reinette.chatre@intel.com/

It seems better to split resource group creation from the task ID assignment.


> 
>>>           if (ret)
>>> -            goto reset_affinity;
>>> +            return ret;
>>>       }
>>>         /*
>>> @@ -586,10 +573,8 @@ int resctrl_val(const struct resctrl_test *test,
>>>       if (param->fill_buf) {
>>>           buf = alloc_buffer(param->fill_buf->buf_size,
>>>                      param->fill_buf->memflush);
>> This is the buffer on which the workload will operate and by having
>> different CPU affinity between parent and child the buffer may be created in a
>> separate domain.
>>
>> Consider for example if I apply just this patch on a test system and try out the
>> MBM test it now fails:
>> 1..1
>> # Starting MBM test ...
>> # Mounting resctrl to "/sys/fs/resctrl"
>> # Benchmark PID: 6127
>> # Writing benchmark parameters to resctrl FS
>> # Write schema "MB:0=100" to resctrl FS
>> # Checking for pass/fail
>> # Fail: Check MBM diff within 15%
>> # avg_diff_per: 100%
>> # Span (MB): 1280
>> # avg_bw_imc: 50
>> # avg_bw_resc: 0
>> not ok 1 MBM: test
>>
>> What happened here is that the buffer was created by the parent in one domain but
>> the child's affinity was set to another domain. The test assumes that it can
>> count local memory and all of those counts are zero for resctrl since the memory
>> is not local. Similarly low numbers from perf for same reason.
> Yeah, if the CPU affinity setting is moved to the child process, it will
> also be necessary to move the memory allocation to the child process. In
> addition, what about setting the mempolicy to the local domain when
> setting the CPU affinity? Like this:

Is local allocation not the default?

Reinette
