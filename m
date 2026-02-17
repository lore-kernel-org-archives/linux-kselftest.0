Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0798437104A;
	Tue, 17 Feb 2026 17:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771350623; cv=fail; b=jNjrZ/4sZjFPs/aEAhI78xBpPr2MWYK/DeyjedBFPRr4CeC6fZvuCJYROM7PbXenU18JOG2IZQ4B0FsdvOoBpys1eZ83ZlM9iB/cyB48E3jHv9i9cmGk+8OWj091PnlZ5r65k51UHH8f6Q7iSZeV/aPS9VKmTima3gK/dtZ5hbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771350623; c=relaxed/simple;
	bh=/jrE4cHVwd882sq+w+VPpv4SaAOVibdVbqGDY0FnuKo=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IG/Q4nuWZEdUT/4jvQtnMnyKDp3kZ0reK/UKyFBQurpdOjSVr8R9OxlV6HmiEmVsQcNOPelQUqVOTQn5hpT+hwgoK313GyARGBVz7lvmUHVkKs2ClvhMp9VYzvB+4EldXrOvLf9S7AjwKX+PjFje5eo4Xg1gXZ1LAg0vnM8WN1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NPLNKevB; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NPLNKevB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771350621; x=1802886621;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/jrE4cHVwd882sq+w+VPpv4SaAOVibdVbqGDY0FnuKo=;
  b=NPLNKevBEGhEkTB05p8XoAymItaAuJy7OhA+Hw1OveXYFRa7B2aCMXwP
   9Pdw4tkuVIOgCxHbcjuum7ZmnnrJWEfApEW40op0iEo7exX7nT/1IWN04
   kxtelWFncpSaYJ7JiO0zyfUenfPmVT2Qaa9K5RPIyf1hRMba6o7E09qFM
   CZU0m8+ISI5bYCOzItO4bJBqjqwlg4ECkOECIkelAB7Yl3Xro/LzPnrGt
   gGao9Pf7c1hHaCgA/wG1p+l+Q0dm4/9kllTg9SgjKZ6QeNjQCakz/rqU/
   vo1pEi2er0X5aG1QhWvEsvyOGLL3eqLsK1BNweHNTfFivif0bxIwT4BWF
   g==;
X-CSE-ConnectionGUID: SVxJBje3TzW/zgcnbh5tcg==
X-CSE-MsgGUID: PQJvzmCCQ/2HZtYmLi1uiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72601225"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="72601225"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 09:50:20 -0800
X-CSE-ConnectionGUID: C0E0xh2RQn+R3VfGoBpqBA==
X-CSE-MsgGUID: qzf4El08QGiGpDUqRobYcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="218486513"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 09:50:20 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 09:50:19 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 17 Feb 2026 09:50:19 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.29) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 09:50:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yrxW022Ki6xTo2HgS5KU/w9cT45FAt0BbWQXDCSj6E1iqVcAwYKShHVrFNEqNoCmoR3hz/XfwoWpvzNG20Ms6KS6Sqagl5XnSI9SDBhCkXa0eJcdTBhuqmycGjBDA/sZnLB9enx1zyMzwfrQHkLgxZbkGAGLklv3Bjph6ureyVnBQ3+6ypzvNjkodFQBrvWrDxodpHe+3nmshAj4+VS4YItzgE/IuXNvHCEbBxkOLenfAM5DXxQJKXmRXEmVfXuoAKUFHKEIjGku9o+vrOPHR+3MdqWu7YxNBx3yuKeCsrERgkSfhODyyjKtxWFeY93LnastR3M8TAro0yHqD7LIaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AuOgjMx5bdDJ2zpzm4DF1XZk0HnaPDdBWmCpmOLWMVA=;
 b=wbyBl+dD6/QhOEjQfJoEy2JFwxA1eqvI50LBrt0wHCrsz54+xpR3BiEVyCSjO1SWdRVfJNPL69aBuaTqLYwA+44yiKi9GfIY2GrUQkOG2hiqoPiez/peBTIuw/qqbiR4cbBWwG4LaFXpKzQILkQocCWXNBflGYHQx8VKPeZXFzDamlVUXrk26ric6ZQpZTyMaqW7mpeuwWFXnWLvTAPl04zq2YHIDcGkgOkeDBKu6T21zM1RaFBnObsBDfgvJHeM1d6mQpmohUuDBYbzgv49ykNonaWbUG2J80BQX+rU6gT/XJY1okX00ro/AWLY+aM3vSjC4qYNpahd8UOIIjcdkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SA1PR11MB5779.namprd11.prod.outlook.com (2603:10b6:806:22b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 17:50:17 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d%6]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 17:50:16 +0000
Message-ID: <15262941-4d8b-4a6c-a09d-f44747c0fcc6@intel.com>
Date: Tue, 17 Feb 2026 09:49:15 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/5] kselftests/resctrl: Detect the ARM architecture
To: Shaopeng Tan <tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>,
	<ben.horgan@arm.com>, <james.morse@arm.com>, <shuah@kernel.org>
CC: <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260123044034.141247-1-tan.shaopeng@fujitsu.com>
 <20260123044034.141247-2-tan.shaopeng@fujitsu.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20260123044034.141247-2-tan.shaopeng@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0103.namprd03.prod.outlook.com
 (2603:10b6:303:b7::18) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SA1PR11MB5779:EE_
X-MS-Office365-Filtering-Correlation-Id: 14139cb5-5c2a-4fd6-9f8e-08de6e4d027a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDMzZldROGYxMmNXUG9WKzY0UU53cXpJOE5Ea2pYdGpRTWRmbW5iZmlITHVy?=
 =?utf-8?B?Rkl3cE1LR2dKUzlOR3FNeUd3WWZOVWdsODNkUDVsemJNanBJSTk3aHJRUEhD?=
 =?utf-8?B?R3BwZktFNXlqSTZpdHdrYmNyNjBNQ3pNbjRCUWROZVV3R2hZd2R2NmNOZ0gw?=
 =?utf-8?B?ejF1eUZZR2xXbkErSlpOMG9kdjJoMWhtUGZVeUJXaGNsdDVYZjl4alNjMGx2?=
 =?utf-8?B?WFhCS2tWZjBMUnJLSDBmTUIwVHc1cVpqV2ppTWJhRnI0aENraFNhWFQwcmpn?=
 =?utf-8?B?OUFidmYvZEdPOEtpV1hmbitKS2FtZXk1TWppbVNndDE4UThyQnF2UkREVFlP?=
 =?utf-8?B?QmZQYlVieDlMQXdOT1MyQU1iUlprOWppT1JkeTdldnJQcWZMTGR5b054SXhF?=
 =?utf-8?B?UVFwaHNXVEtHcXJnbDhUTmVPZ2ZqZGZ6Rmw0UTR6N0hzMVI2Ym40bXhudGt5?=
 =?utf-8?B?NUVwQ08xd0Z3ek5lM2tFc1pCcDJua0VyMlhLVU51aXM4K0hWaFpUNGxhOURr?=
 =?utf-8?B?eUV1dUhDQkN3eDdNVmZWOG1TOWdtZ29QYjQzZm1vVlYwUHlCWTFmRFlWZWo5?=
 =?utf-8?B?ejdQeDJqTkNXKytveHhlYkgrU1lqb2NpTmtydVdDK3ZjUUZzK21PbGZzYjdG?=
 =?utf-8?B?Y2N1TzV4bHVzRmdNWWExc09jNHRSR2xONkJTVzlwK3pSblFGYndEM25CR1d6?=
 =?utf-8?B?ZE1TSE9qc3lINUNyS1hJMU1CN0srWi83RTZzR1hmMDNwVEJzNkx1RWJ5Z24r?=
 =?utf-8?B?b0Z0TkNGMWR5YmxXdnlTZzZjejk5ZFE5V0k1YVo5MjZibCs3dDkvRVJZTlVv?=
 =?utf-8?B?YzNKUEtueThiNWZ6NGVUZ0Zra3UxbGlzaUs3T2d0bmk2MFYvaGpXdEpmMDNJ?=
 =?utf-8?B?N2FIbWxMUXV3cll0RFdoU2JURmxTZ0hMeXRVS0xwT0pFckFlb2FPZTRCWk5Y?=
 =?utf-8?B?WjA0QVV2bnpIakVEaXhsZis1VW5zdzBNVGlQVEpXd2Y2Qit4bWlYNldlZFl0?=
 =?utf-8?B?NGNzTXl3TllVRUxzbFJIZzlxNUVNYWtkY2ZXT3NXaXB0SUdJa2MyTnhsVkF4?=
 =?utf-8?B?KzRsSStyN2Q3WEltRkRKRGQxK0ZMY0YzNCtNTDg4T2VwTllDR0czM0RoTE43?=
 =?utf-8?B?Y1lHa1hRWEdtMlJHK1hUNHc0V2tSTENLZTNNdkpDd0Q4aDBmVFFKVjVVYTRE?=
 =?utf-8?B?Q1h1U2tXeDUxUWlQZ1NHRUZqZStjelpPdXEzVU1sWUsrS1dvMGx1dzBLV2Ev?=
 =?utf-8?B?VHpJc3pVdHVMZlF5T3JiZ3FQT0tvWVdzNnpTUzd6YWpnaUNxemtGS25TTmd6?=
 =?utf-8?B?M2Nwc1ltRkJUeHdxSDBPdy90QVpVNmM5b3h3NzF1MTc2Zkh0S0FXaHkwTzl6?=
 =?utf-8?B?MVN0dWFmLzZBRmtJZGh3dnBwRXFJWjgrQzZ3V0tmRmJpQkJxZTZEeTNZUmxw?=
 =?utf-8?B?YXBvZ1hsT2pUaEQ2cGJDS1l6YU9JTW5TcnFhNWI0MWFmS3BhaXFBcXU2MUlK?=
 =?utf-8?B?QVJFdDFTcm1rVGRKQ0ZGazlXUlJYTmI5RXZZQWF3RThwVXJaRzFxYktsUGFo?=
 =?utf-8?B?cEVudmZSWlp0clRsVWtHbml0TnlqTitNdTZCeXhPVjlkZWZmRnRrd2dVcDhF?=
 =?utf-8?B?NFA1M285UUtLejdmSk9ZdG14d1ZxU2xMU3VZamVwL05SNlB5TkdhdGpRZzFS?=
 =?utf-8?B?Uzd2cnJJUUdLeVI3UENDYUIvbTc1NkdUOUNEOVgwa0FCTDY0L0x2dTVFZWNh?=
 =?utf-8?B?MmZwckpFK0JDNjZJbmNRSTFTenRJMVBCdUxLNmVCL1YwZWxQM2RUbGg2bVhq?=
 =?utf-8?B?SFM4UndnTE5MTlZwajQxd2ppM2tjV1NENG03aW9vZTBWbVdZbFZscUpsN0JP?=
 =?utf-8?B?TElUZW5RV2NKRTFBSUJuSW9HaDZVc0pSOGZMVE5LWldMN3lmNnFGZExLMmZs?=
 =?utf-8?B?RWlpZTZMNVhHd1BqdStUZXlMUnZZeHRjZitHM1ZKbzNJV01HRHc2WmVtcTIy?=
 =?utf-8?B?YmIxdFl0WTNJVXpOL1YvZlVSM25lYSswZTF0MldxMnlnODZHWWRVQjVub3NY?=
 =?utf-8?B?eW1DNWU1MnpOajV1ZWJ6M2NmcklSZUxNSVBRSDE5LytMa3NvSGhGOEJhby9E?=
 =?utf-8?Q?UMCw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVF5Ri9LM2Y1bTZtRnV3SFE4UkZPd3VnY1kyTXJqZUVZdWM4VUR2eG4xWGZP?=
 =?utf-8?B?VCtsMERsdnZXTWF6REs5ZnhOSG00WEtKb29SNHV2N3JXcFdFVit2WnkycHRB?=
 =?utf-8?B?RkV6OUFnYitGTkROM1NzeFBOeW5OcnlBUmxDN3FXaS90QlhVSk9KRWhrcmdN?=
 =?utf-8?B?Z29kbXlycU5oTkY0RG9wWnBGUFVXa0VzTDhWa21NWEkwRzEyMi9GSHlVaDBs?=
 =?utf-8?B?T3hyS01ob2hveC93ODRiSUNJSkVvNmRMUmVUSGM4a1lWcFl2b3RTdUVnS2hY?=
 =?utf-8?B?Q3lqMmVoNXFrb2kwRk5tcGNTLzFibUVhUlRHWnlZRG5mand2Q1NSbGcrU3RX?=
 =?utf-8?B?SHVhZUZOOFgzbzNFM1J1UmZjanIwejB2d2xSMisrRjdXL1MvWTZGWU4vOUJ2?=
 =?utf-8?B?TUJ1NS9nY3A0MHRwaTNqOXpRQzcycWdDd2xoSGlQL1BkRUo3NWZ3Y0dLMjgz?=
 =?utf-8?B?dHpLUklURFJpd1hGL3l1Sm5NWEM4TEI2b2xjdXlLWWxpNUpjUkhabFhTeUVU?=
 =?utf-8?B?MDhKbFpxTzRiVThJL0FneWtwYW4raEU4MzVnZjVwQ1FxVXJMdVE5c3dnLzd0?=
 =?utf-8?B?NTVLRXpXR3NlbVRSMDFRYTdXOFJ2SUt3WTR5T3pYMXp4YTMzdDhLL2Nsdlkr?=
 =?utf-8?B?TjZlajliSWZZRE5rV3BYYXVWR2hVTGNGbGVWVTB0Y3ZFRGd1d3RramFkTjYx?=
 =?utf-8?B?Ym9KcW90T2lYQS9raE9GWHZXOEI0WTlFcFo5eUU5TDR0UjY0MVArLzBkbEkw?=
 =?utf-8?B?Q2U2Vm12ZTFoL3ZPaVcxWWZWSlpkTjE3aHJFcDBLYzdmNGk1OUltUzgyU0p3?=
 =?utf-8?B?YytlN3g3cUovSHlOQmEzci9wZkpjSmVCcE1JMS85ZlVsR1E0c0h2cG05d0Nk?=
 =?utf-8?B?QllKUjh0VFkwRXZNV3NObEdYdlNIVTVTd1ZLK2FvSWlHalE0SWEvY0pBUExo?=
 =?utf-8?B?dFBZTWYzb0owR092ck5paS8xdWdHc053N2tnSnBuejJEK3U4cWFpVk02Tm5E?=
 =?utf-8?B?THNROXQyQkk4R2xNeEhleE5ZMWdEcXVuT3pab0xYYzNmSStoK1dIelRuTzFw?=
 =?utf-8?B?TnJDNmt5aEUrdlRKWW5obUgrYUFQYmJhQ3RzRUhiNHVBYS84WGRiL3A0UGVx?=
 =?utf-8?B?eWQ4TmRWaW4yNjZhUFpMZVhwbG1yWUh3WE94SzJRS1VUWlRkSjNCSWhNczdF?=
 =?utf-8?B?VGFDdnRjSFNjbEdQUnlXMUZMQzFuTzN0NDM3bzJrOWtkWHV6Qjl1K3JLbm9Y?=
 =?utf-8?B?dkUzNDBwSzBidGg2dWx0c0U2WjNCck5MQ1Q3Mjk4MG9GUzJ4ZFc4RHVta0hh?=
 =?utf-8?B?QitlY2Z6bDA0MWxycWt6SVR0RGZnQU9nMXN3eXBWYnIwRnhTS1NvMXhWTXVu?=
 =?utf-8?B?WUt1TDNNaWJJL1c0UlNycjdDUGpuc1dKYXpkdkRBU3FObHhHY3VoN2VDalB4?=
 =?utf-8?B?SFZ1UjA5YkpGSy95VUlUQzh4L3ZKYTRsNkorNXJ4ZVlrWU90b2lRK1REOXVD?=
 =?utf-8?B?NEFiZ0lraDdEclJUQXVCV3NYaGRDcnZhVEx5WDJIMzgwdTVDV0padWIreWNV?=
 =?utf-8?B?Sm1LWTIxbVduTkdzemZNWnVDSVJRSVJVVnpBdzQ3YzROTnhzSGlvb2tWU0RK?=
 =?utf-8?B?Q05VT3lXbTBMR1dBTUNHbnYwR0xtd0p4Q2J3Z2NPY1RNbHZRUzhkRVY1OW9m?=
 =?utf-8?B?WnlMdmNwc2VxWHhVT055L3NqOGQzSk9QV1ptMmNaZlN3dWNZR0l3MlB5ekp3?=
 =?utf-8?B?YVJ6OGxJaThSOTU4Q3MzdUFaSXdpa0M4N1BhVFJ2S0FFMUZwTnZKbWNNMFpJ?=
 =?utf-8?B?bGVlQnpRQ3oxTllqTXVOQUZFMEczbG9JSVd4RWJGdGMvbmRhMC9Hc3JwTEV1?=
 =?utf-8?B?czhsZ0IzVGRHWXlUZHkrTkQ2QnFUbzRGU1o2UU4wVURKL2kvc1JJdEZxb2hS?=
 =?utf-8?B?dEQ3OGZ4Y044WCtTUVI1d2pQbU84c1p4U2lvaDVMdlJXVVR0NzNrazcyMU5E?=
 =?utf-8?B?YUpieitFQ0lLT3piOHhZdjJQc3piaVQ0QlNiaUpQS0ZFL25HeUhhQlAxZHIy?=
 =?utf-8?B?ei93MWpTTGVjRkE0cmJmWGpEV0NSZ2NDRDBJcWVDQUZlamdPcTdGclAvOE51?=
 =?utf-8?B?cHQ4aU1pMzJkemFwSjIxVldiNkQ4MGdlSGlOOS8vUkxRTWZUQUdoZWl6d2F5?=
 =?utf-8?B?YjJMNHJpeVpGVmMySXg4eVpJS2NOaEhWTkhQeWgxYVYrSHk2SFg5a3NNazZO?=
 =?utf-8?B?NjFaSlRDWGdDeStWSkVsSC9Na0k2VURGOHdlUStScSt1cFN5QkcwSWt1SXp6?=
 =?utf-8?B?dWYxUnR3MjVwZDRiaWx2ckYvYkZqVmpmRmh5TmErV2gvZ1lnWm4yT0d5cVpP?=
 =?utf-8?Q?ODZLSVijk9l9X9GA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14139cb5-5c2a-4fd6-9f8e-08de6e4d027a
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 17:50:16.7968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FD17NHD5/OYoG/qGSgB5sE1C/kCmywJjGOzsZgi0U8E1g8O0EIl6XKSUXB2VBrmubK02uc9/ZbLs6XjFPRdwer86GK6R39XX0FmwkpNLW2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5779
X-OriginatorOrg: intel.com

Hi Shaopeng,

On 1/22/26 8:40 PM, Shaopeng Tan wrote:
> The resctrl test is not enabled for MPAM (ARM Memory System Resource
> Partitioning and Monitoring)
> Add processing to detect the ARM architecture.
> 
> Signed-off-by: Shaopeng Tan <tan.shaopeng@fujitsu.com>
> ---
>  tools/testing/selftests/resctrl/resctrl.h       | 1 +
>  tools/testing/selftests/resctrl/resctrl_tests.c | 7 +++++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
> index 3c51bdac2dfa..492d2a1c4033 100644
> --- a/tools/testing/selftests/resctrl/resctrl.h
> +++ b/tools/testing/selftests/resctrl/resctrl.h
> @@ -38,6 +38,7 @@
>   */
>  #define ARCH_INTEL     1
>  #define ARCH_AMD       2
> +#define ARCH_ARM       3

Please see recent enhancement in this area:
4f4f01cc333e ("selftests/resctrl: Define CPU vendor IDs as bits to match usage")

Reinette
