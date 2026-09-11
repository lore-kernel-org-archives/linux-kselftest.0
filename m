Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D518C472098;
	Fri, 11 Sep 2026 13:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789133154; cv=fail; b=SW0MJKL8k0wUU4e/lA8DClqHpKgujxOd21Z5U44pfkIfxYMoUajzhpm0258vnhikvRx4lLGCZ1+dAQlyn0Sa8JB2ImEP9wrCpXiS0nMENqGH1PTOSuoP1j6fmVPb6QYSdjpPiiI1gx287zNWST058P4XrBZjKsKqgf1DteAO2t0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789133154; c=relaxed/simple;
	bh=KIk7otQo43iDGjPyWsE9nNCmpdMwrpTuqWqmOS8utlM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JL7zA3ib4XcYBj9dj1iv9OK0lKKvaonyxgwBSbXerbVDfhBZi81VC5xaUigSVpXXKb9wwYhTjdz9jIXb6gwLKyuFi1w2hFzm00Lw6QxL2BlvEtg0YSQPnJaFe4D40I0GH71zCvunh4Jy4urD0gdQXcoWX4UZv0VFLZe9eA0nZTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RdgBVV9O; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RdgBVV9O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789133151; x=1820669151;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KIk7otQo43iDGjPyWsE9nNCmpdMwrpTuqWqmOS8utlM=;
  b=RdgBVV9OfzqyB7QHxJXoy7ZdRRKiwTFVnnGGOo9Fk+crceFoPK0CG4rc
   AjWW17DEamYEjKnFnDWJBYYJJXE//Ch67KJWPuwjxIaeHAlygK563jK3C
   qYs8k/iXcsA/JwtQEzqvGks9J7NjhTM0RE3eZ81GAR4FRe2Z7lcEPfkjm
   wa0ncy4tnOg5q2eSWxaWsAjbF6DUhwu70s5PZQ+VbyVfrfAuDpQEIisxt
   CwLCAncyQQm+xwJIEBcPk2r9aXKAZ6yI3PuuNn6js3WPSxbNy7IxaH1FA
   /oT9dW7w84aRtD47tV15slAFECii0YQCHzYuLcf380N03b02M0ifvy7E8
   g==;
X-CSE-ConnectionGUID: Kwf51BHqT0ulcGrSXXFgww==
X-CSE-MsgGUID: p+6Js+OnQaSTYo+ZBoUofw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="92105041"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="92105041"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 06:25:47 -0700
X-CSE-ConnectionGUID: C411V02MTOCnyTEWWipuVg==
X-CSE-MsgGUID: g5LpOai6R6yTInQbcO7ISA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="271895344"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 06:25:46 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 06:25:46 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 11 Sep 2026 06:25:46 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.24) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 06:25:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZWO5DCK9AihGmn72yvDddL0iup1yGp6H/hjfawFUujfy0AlvqqGTiJYeDmB/AjZw4+SvClcCEBlPXlE6r7jt1Dt1Gicv3bg+Sh2nuiQ26PnmAzKVgPMgxOftGa0GPEq9FI+IXIUVfYxxcInxvzAPq8qYKECLJFtW06Zv+pC+b3nh0eKjWoMglq3SyzYFeNXMB4nXcghhoKK0nPnc8FeDIB/Jzw9F5wAQVLGdPm/sq162gmZ9NlQYhZU1OaUjnEq+vkhZsROoo6jkgKBm9RiiO+OjAvkb+16PvD7uzjhrQ8q++UFHsSxTngcqsW86b603rdAwCqvl74lFjgg5g0yIyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCPmhGDxQ9bHzvWTk/JwB0NNlDZ/aFYfqgMRNfJKpDg=;
 b=aCWJpIAcGwCJGYld96eavdeLfo2SPbORo6LfmXMaPNy208FR6UTFXIyxKzIYafmihAmS6Y8yV/cozkOSw80dJkoE084r+u58t4QhriPPl8DocaC37lWAa+SZj7d39uOWqXOC0vzG7TSeEuCklRq7yESIPEo4ubHv5R4uQdeMPdMBoi11EwgbcpLJ1pgnyR0Bd277HgWpyV1qvi9FUsyp33IMPbASfwXQFRnNsIbZGDUWFr7tUXXDVDq+Jvae9EoQ5Qc9QJOA/KTbDa4rxJDVpc8wYDuikWiRU0O3ZqT/b8eWJu8U6hjLP2KXzS6jq+R02qr/zIKMIq7nkFsZNFicEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7323.namprd11.prod.outlook.com (2603:10b6:610:152::6)
 by SJ0PR11MB5215.namprd11.prod.outlook.com (2603:10b6:a03:2d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 13:25:40 +0000
Received: from CH3PR11MB7323.namprd11.prod.outlook.com
 ([fe80::abb8:c470:36ca:e556]) by CH3PR11MB7323.namprd11.prod.outlook.com
 ([fe80::abb8:c470:36ca:e556%3]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 13:25:40 +0000
Message-ID: <87ce93dc-ece4-431d-a01d-3476a364fe0a@intel.com>
Date: Fri, 11 Sep 2026 15:25:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] selftests: drv-net: warn if LOCAL_V6 has DAD or
 not kept on link down
To: Sheena Mohan <sheenamo@google.com>, Jakub Kicinski <kuba@kernel.org>
CC: <davem@davemloft.net>, <netdev@vger.kernel.org>, <edumazet@google.com>,
	<pabeni@redhat.com>, <andrew+netdev@lunn.ch>, <horms@kernel.org>,
	<przemyslaw.kitszel@intel.com>, <shuah@kernel.org>,
	<linux-kselftest@vger.kernel.org>
References: <20260908181956.1357684-1-kuba@kernel.org>
 <CADWJPTtu1bjng_1LWAbT7QtnkODw2A36Xd5koaiiESK_2ifHhw@mail.gmail.com>
Content-Language: pl
From: "Pielech, Adrian" <adrian.pielech@intel.com>
In-Reply-To: <CADWJPTtu1bjng_1LWAbT7QtnkODw2A36Xd5koaiiESK_2ifHhw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIVP296CA0049.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:353::17) To CH3PR11MB7323.namprd11.prod.outlook.com
 (2603:10b6:610:152::6)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7323:EE_|SJ0PR11MB5215:EE_
X-MS-Office365-Filtering-Correlation-Id: e9ea5415-ed5d-4170-cd13-08df10082c56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|11063799006|10067099003|56012099006|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: HaAJoAbQ2sl9MvQNPBxdkKp8KNF1lXmJj/apNBVI88VKPN0r7W91pb3KG4gN6g+G3lmNwAwf1706vpnhF+s5Yh9Ns+W3zwxv0F5s4TTind8d/Ovkm4TJJ3/TiX4Fm+qBvQLgvd9HL52iQjIAwdmpFCQ4h1muf2Vda2iq/1FhzeQS80WqMoZw9OKInRVawe1tsdDel3KbBP4sjO4aF6vLDLx9JoWycfwUvRH/0cgexgdyKBGDbOwFJ9eB0mQfbQhvJhELHuBiJ8h7UNlN6Ja/ZEh6CAyLW9ZorwHC08pn70c0/CwJ3b4VAmq7TTC6mM3EF7l5FzsiWyK5JeiSW10VzC0RZc1y5uI1/I1fs3gbP8SOBjRfl+9BdjgadlluFkVLzh4y42aw//ai67ioUs7G3GJVoUWJIEPUmECFuZfpcCMfP5KneSd0zqx5EuETPFX/MCeHot01jbEIRlNnMPiz3Di1VzieQQt5Il0icCwUr1GVORo3rvtSy9OeP3jdllrezseXsQ6XCDPSU2xGivibHHNPgOso8B21mlHa6Ck3q0ulSsVtOT9KsJcYsz5YyuWDx1Ivlc27wgMlXCCUYmUsz/cge2+JpMcTjq3ExTdbo1+EYaO5AwlQD+ZGq6r7APSVICHionWrWh7NzQzM3m9E6Jv/VVfzhiZ/zlbkq5/D3jE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB7323.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(11063799006)(10067099003)(56012099006)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDQ4Sk1kOXNoakZ5VnppMXp0ckFUM3EweVhDY0FJc1dIYTFxTlFaL1d3MzQz?=
 =?utf-8?B?RDZLYUszUEsyZ29lTzFVWWlIN1U2RGdQNWRaQ3pTQytlQnJZMGc5OGQ2aXN4?=
 =?utf-8?B?eEVycVdnYktvUklialpWOTV5YUNNcnZlV1JOS2ZLYW5yUU9JbGZleUp3Z0dh?=
 =?utf-8?B?aGFJLzlvNXp2ZWRpMzV3cjRVQ29TQ2M0QTlxaFZESWNBMjIvUGx0WjQzdm9G?=
 =?utf-8?B?RWpaWU1PMlhQejJaM2N0dXNKY3FsREFxenNuR01kNWRYOW0vVFpPSXlwYTZt?=
 =?utf-8?B?S1VnemJlSnF0V1Z4MnVTSjFMa2lTaUVHS2VHdjJRTW5MbUx6cGw0Njg0d0dK?=
 =?utf-8?B?UTZXVitWUWdEUVVYUjFqeitraGQvRlM3TTF2a0VqMFY4eDNjelRXbDlsNEFO?=
 =?utf-8?B?Q1NMRm9wRHdTRkMwTnluWVB2TXVkNmh5bGlUc2xvTmVadlI5Z1YrcFBmYi9j?=
 =?utf-8?B?VFp0OWlZdXNkTjVqMmZhZzdZQWpLQzB0YW5zNUUxN0R5WGdPMC8yQ3JTTWNL?=
 =?utf-8?B?dmtnbjdXb2R2K3hseGdpOEhyTEdxcm5ocFRXOWFZcysyR25hZ1FoWHdvTThj?=
 =?utf-8?B?SlVDSkI0MmY4OUd1dUh5MlJzYjdXUk5vTDJXWlVuS2pBTTBGZWVZU2tETktC?=
 =?utf-8?B?dmx5WlgxanNDRWdSTXoyNWpzczQvNHYzS2k4SmtxL0hXQUhGOU4vNHBPM3F4?=
 =?utf-8?B?dUhieWFiOUNJcmpBSlNYbjRmQ2NRUG95Qmhab1IxQnF1cEZCdkRXT1JjdXY3?=
 =?utf-8?B?M1dlUC8rZjBOVTcyeGdoKzBMaFM1R1hDMDJ1Q1VkZ29PTHFCdytuVEIzSGhy?=
 =?utf-8?B?ZFpaRG9rOXQzZTd1QUxVelZIQlhUZERHcTcyUVErblFZSHd6eVN2dmNTSTJ2?=
 =?utf-8?B?TUJjRUFKTFIyWG1YSjQrNFVzV3kxUXdMRFp1cjhMa29VWWdMZmd3aFZzeDhl?=
 =?utf-8?B?YXl3WUt5WXZlYnMyOGNUQU5CK1lkNE5QSFVTMkNoMXlFQ0tsa2NuZ3FiUzY3?=
 =?utf-8?B?YU15VVBBbzZ4RTJPbm1Pdm1oakhOTS9kK3pvMk5qVG1aL3VXMGVRYVAzdFR1?=
 =?utf-8?B?N0VUY3RWbEVnMjNQYzRCczFneTgyS3cwbmJ3VnJQYWdqbUtTK3Q5VnZ1eDdM?=
 =?utf-8?B?T3NTODQydkFuam9MUkZiNnVZZWZBRThqRWlkYzM0YWVPUkZYdkszbmp2V1J0?=
 =?utf-8?B?cWE5c0tWY1BRN0xxVkIzb1g2YkZ3aEF4RXRZbFpZNWhLZlRmWHJUaGVyOWpD?=
 =?utf-8?B?cXYzS1hGRHRVOGRFZFpWKzM3RldCNU1LUWRuVnYxUVp3eVlNM3piYWZjWCty?=
 =?utf-8?B?ci9aVGcySDd5czRKUFBneUFqY1ZwSmc0YUViZTVjN2hqejdJMkdvYnRXMUtn?=
 =?utf-8?B?NzBCbjVud04yT3pqZHd3ckFsQWZKQjBabFdzSWYvYVpQRnk5czRoSTFNczk5?=
 =?utf-8?B?Yi9TNFArQ29scGlQVVZzRnZPSjl3Ymt3ZGhTeWFsWjZzUmw0K1A3WE9BbVRJ?=
 =?utf-8?B?bWQyNnRYVERSVkFJL1RRRDEzeWVPOUlON29xWkRqeXppQnV2OWZtdVFGVkxy?=
 =?utf-8?B?UVptbDBRV0NRQ1l6am9EdkdWUFpJUFJJUjk0VnVMN25QaEJacmNocjBJNGZk?=
 =?utf-8?B?YnlVaXZCS1VkNTdMMjdKUXBGSEY1QWtkN25jRnpJUzA5RHNFeUhqN1lDOUI0?=
 =?utf-8?B?RU9WcGtvb2hodmd5dEJBUUh0M3QzeE81MEZndmt0bWVGeWRiTWM3WE9VMzNV?=
 =?utf-8?B?YlBFcWd5cDBGWUhNRk1jUGFOMnN1N1Q1bjhpNStUbE1adGJnZ1ZPejFEOFBD?=
 =?utf-8?B?bDA4RE5mREQwR0pSRmZuU2dXWml2MjRpU25iTzJXejRvSXhVbWRsaVJTZ0l1?=
 =?utf-8?B?QmtmY2lWM3cvcklJb1A2aFNKekp5ODZSNTJQOTBOcDNxbHlkTVhaRXFXckJy?=
 =?utf-8?B?ZWtHRk5CaG1UUGpscWVsTjA3cGt6TVJoclFEQitSRXRsT0UrME9EeGQ3Y3FW?=
 =?utf-8?B?SlVYQkl3d05yV1hZSm5Wa2NjWlJiZ2RMYmE2aWNRZXRmcDJ0MWt4T1J6V2NT?=
 =?utf-8?B?Qnk4aXVUZE9jeTNxWXRNZFRodzNRRURSSTIrZDU3SUJYb2VzMUhpM3hnTjBH?=
 =?utf-8?B?M3QvdGxJZVdMVXNkRjJ6NjZiNU1GVzVPT3dHRVlTRVdianNsNnI0QW1pNHMv?=
 =?utf-8?B?a09nUUJQYTBFN3BJMXd6dHphSlZiaGJycDBwWTVETkRlVUJKdmpGZ3hJMEwy?=
 =?utf-8?B?cnFLUG1sU0hJN0VZbzVoa2o2bGZTeU0zVGU5QlRqNXFBZm9YV1h4TjR2MGZY?=
 =?utf-8?B?QnNJYXNXRWFlOE1oVUxWd0FUY1V1UFIwT1YyOHY1WFI2MFp3NTF4QT09?=
X-Exchange-RoutingPolicyChecked: B+DwKXaEONPWet3tp6ulX/UI3nOfT6XRWS4eyUlN+pJA++mAn9LLjjGe88REgBcSWoiW8qNzal6I0RrtdVQFtRZx0HafGCjCWapibMW99Hmsswf9vPc8WFxoSawv2/rz0SzmIOwaz5WbYqXiFOvtjg6y58vFdDPJKTnnAjO6qzEMdOgrR0oGTt74ROjyWfvc+koE3TYEfQVvuCc1J38Px8Tu2azTKUqX+lzV1hgAVlxsyHOAFdXFb2wIRtHak3Kkxvgi60QmlROC/svNMB0ekS+BirVoj4O+7OoUUBy/4JfczuOAhxN5L4dF6U0OEF3LlMwYzRv/YPmW4YVmIF4RPw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e9ea5415-ed5d-4170-cd13-08df10082c56
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7323.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 13:25:40.1607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 41gbZgpjvENQpciJ4ckv/DMuQcbzcgNNhUP/t2AzfS2t8eFFlGrDn+s/CPIk0ItZGkFt3ebjndZONYjj6w9/9uYzayZaGH4/SCvO8rKj824=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5215
X-OriginatorOrg: intel.com

On 9/9/2026 5:16 AM, Sheena Mohan wrote:
> On Tue, Sep 8, 2026 at 11:19 AM Jakub Kicinski <kuba@kernel.org> wrote:
>>
>> napi_id.py intermittently fails to start its helper on Intel and Google
>> HW runners:
>>
>>    CMD: /srv/netdev/drivers/net/napi_id_helper 3001::1 37569
>>      EXIT: 1
>>      STDERR: bind failed: Cannot assign requested address
>>
>> Either keep_addr_on_down is not set or more likely the address is
>> configured without nodad. Having to make sure that all tests
>> always wait for DAD after impacting the link would be a whack-a-mole
>> so we expect the env to have nodad and keep_addr_on_down set.
>>
>> Warn about both while validating the environment, and document this.
>> We could fail completely but most tests don't impact the link so for
>> quick local testing it'd be annoying to have to apply the settings.
>> I hope the warninging stikes the right balance.
>>
>> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
>> ---
>> Adrian, Sheena, please update the setups scripts for your
>> systems. Looks like nodad is missing.
>>
>> CC: adrian.pielech@intel.com
>> CC: sheenamo@google.com
>> CC: przemyslaw.kitszel@intel.com
>> CCL hramamurthy@google.com
>> CC: shuah@kernel.org
>> CC: linux-kselftest@vger.kernel.org
>> ---
>>   .../testing/selftests/drivers/net/README.rst  |  9 +++++++++
>>   .../selftests/drivers/net/lib/py/env.py       | 19 +++++++++++++++++++
>>   2 files changed, 28 insertions(+)
>>
>> diff --git a/tools/testing/selftests/drivers/net/README.rst b/tools/testing/selftests/drivers/net/README.rst
>> index c6bed9a985bc..3fe49bce4f3a 100644
>> --- a/tools/testing/selftests/drivers/net/README.rst
>> +++ b/tools/testing/selftests/drivers/net/README.rst
>> @@ -70,6 +70,15 @@ LOCAL_V4, LOCAL_V6, REMOTE_V4, REMOTE_V6
>>
>>   Local and remote endpoint IP addresses.
>>
>> +Tests reconfigure the device freely, including taking the link down, and
>> +expect the addresses to work immediately afterwards. IPv6 needs help::
>> +
>> +  ip -6 address add 2001:db8:1::1/64 dev eth0 nodad
>> +  sysctl -w net.ipv6.conf.eth0.keep_addr_on_down=1
>> +
>> +Without those the address is flushed when the link goes down, or spends
>> +a second unusable while waiting for DAD to finish.
>> +
>>   LOCAL_PREFIX_V6
>>   ~~~~~~~~~~~~~~~
>>
>> diff --git a/tools/testing/selftests/drivers/net/lib/py/env.py b/tools/testing/selftests/drivers/net/lib/py/env.py
>> index 25903f580b40..6262080a8bf4 100644
>> --- a/tools/testing/selftests/drivers/net/lib/py/env.py
>> +++ b/tools/testing/selftests/drivers/net/lib/py/env.py
>> @@ -239,6 +239,25 @@ from . import bpftool, RtnlFamily, Netlink
>>           if missing:
>>               raise Exception("Invalid environment, missing configuration:", missing,
>>                               "Please see tools/testing/selftests/drivers/net/README.rst")
>> +        if "LOCAL_V6" in self.env:
>> +            self._check_v6_env()
>> +
>> +    def _check_v6_env(self):
>> +        """Tests bind() to LOCAL_V6 and bounce the link, it must survive both."""
>> +        ifname, addr = self.env["NETIF"], self.env["LOCAL_V6"]
>> +
>> +        def _keep_addr(scope):
>> +            with open(f"/proc/sys/net/ipv6/conf/{scope}/keep_addr_on_down",
>> +                      encoding="utf-8") as fp:
>> +                return int(fp.read())
>> +
>> +        # 'all' wins when non-zero, see addrconf_ifdown()
>> +        if (_keep_addr("all") or _keep_addr(ifname)) <= 0:
>> +            ksft_pr(f"WARN: net.ipv6.conf.{ifname}.keep_addr_on_down not set")
>> +
>> +        dev = ip(f"-6 address show dev {ifname} to {addr}", json=True)
>> +        if not (dev and dev[0]["addr_info"][0].get("nodad")):
>> +            ksft_pr(f"WARN: LOCAL_V6 {addr} not configured with nodad")
>>
>>       def resolve_remote_ifc(self):
>>           v4 = v6 = None
>> --
>> 2.55.0
>>
> Thanks Jakub. We will update the setup scripts on our end to reflect
> this configuration.

Applied to the setups, thanks for noticing about that requirement!
