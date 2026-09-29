Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AB5550DB3;
	Tue, 29 Sep 2026 18:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790707210; cv=fail; b=kUrkrUVzMBltWPMpCoLe/8Z/pl3W4AK6rgraAHY/CqyiWOtVrLVPR0wMQGtwPiWlDXl3gmDVVzXDkDJd/wNX4XLpqA+xKRcg8H9ng2D61cwemgrnbNUDBHvJ3ph0HFpzty2xgJ+hE8OYH05buHeVBv58NmELlX/gsutzHMZ1OiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790707210; c=relaxed/simple;
	bh=+wTQYnGgc1q1Vx2td7gM1B56jPk4XGgWia6ZydM/rHY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MdOSLesSnoorCgK9PDwd9oiqQM7JVWDTQOhrMG7smY3mdTd0ZD9yKpgiyhcd85OhthPvFFfTTS+1l1PlU0SPHe1DKwuqzBgnsPRVuMKUz1znArJBRzE588+HEU1Bd/UH1JqcytoSjW1pxR/EywsZXcnzI6L70ffOPniA31CRC7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BvptmjJJ; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BvptmjJJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790707208; x=1822243208;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+wTQYnGgc1q1Vx2td7gM1B56jPk4XGgWia6ZydM/rHY=;
  b=BvptmjJJdageE/0s1H0TO5rB/0AYE+2UGj3zOGqVeJgPlClXo5jE1W5h
   jBdHdDzGTK5EQhaF59zJFKpGnfgWZapRqB2pU4pI67FaDh/y3qhhwgoJY
   1SnOGVegwB7zBW0FHDIPJ/7wqKGlwKe5uQeaRMbebceok4UHvvQPn4Ut2
   D5rLZZD30wjGbTKP1+yjhU9yRtIFfcXdHLE7Hit7PjJBzUO5wf+F3aCgw
   xXK7GOvZUJ5eMdTYtHBc3AUkyKEQ4rM+tq9LX4iCwDI9GizDrhJwvliAj
   lr9Ewq1AtU3OhjZVK4duhT7hph0n7LNBcpV1c3gYKXo/+lEw4tqxFo+8w
   g==;
X-CSE-ConnectionGUID: c+wCt+cLQaaw8VJnqijqrw==
X-CSE-MsgGUID: GjXdHTToSo6D1DAGtei5eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="91457506"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="91457506"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 11:40:07 -0700
X-CSE-ConnectionGUID: /KbR8q5pQluYWOpuXEbVCA==
X-CSE-MsgGUID: DV48ElzXQJu3aYInuCTKUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="274057008"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 11:40:07 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 11:40:06 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 11:40:06 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.15) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 11:40:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AZQ8LHRQ7Pu7fxYYbtnatpNPCRZiayfH88c4XzbR2CQ5mlB+MnnNQ+ShvJ16jGcbbcpkiIphp29efOWOolKHdWXXueNpPlK29dZF5uxKExODGA0g3ZswY98BY36fMm+3mqMLtJ7W/UmeFLLsnyQ0dUv/ClH9n+Yv32Zne75IUumzo521neDFCwtWVq6Fj17AOeW44DP6icIcT7evtsiiL0paMYlC8J2E7He4Rx4iMi1v4Lv3v5ogTgY+HVY7SAIhIrdC4SP9hDoWwtWvhoQ1pR1mXPo/afYjsCNDIbX/IAjvk4B5yUu4zxfrY7t8odcA4h/+ISDn+Igo8RJ5pxCf0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+wTQYnGgc1q1Vx2td7gM1B56jPk4XGgWia6ZydM/rHY=;
 b=JGUXP29RYyvj1syWk3yj8tuBMhhu5VJUQJNZq6yyDNh1+Rmk1v1kL0Ir00jeJeq+8G+Q6Mrjh252rGd256VJXckarW6s3kdf+uYsCQlXNw5toyn02SL1SJSpMVUE2pxR3e1tpwsqCGRUEVEq7CU6SNX69mHpoNvLviJ4hDahDhTm3Ec9oPpi8fxQ5A/SoGhdRWn7NzyhnXY5EgojesZp698AjhRM3E5O4lqH5ZiUrJniqJ8nVTnGa7FaycRS9WOHnqosM8FCYZAJJ3D+COFtxA6q1DPIQiYP7AQonOy9iTMadF4ijosOnkFtfOiL/6K9eKg3iSG2X6Qi5el1A8N11g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by IA1PR11MB9518.namprd11.prod.outlook.com (2603:10b6:208:5b0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 18:40:04 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0451.026; Tue, 29 Sep 2026
 18:40:04 +0000
Message-ID: <5193ca97-0ad4-4a3a-ac01-5b5efcbc249d@intel.com>
Date: Tue, 29 Sep 2026 11:40:02 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] selftests/resctrl: Add MBM and MBA test support
 for AMD
To: Swapnil Sapkal <swapnil.sapkal@amd.com>, <tony.luck@intel.com>,
	<babu.moger@amd.com>, <fenghua.yu@intel.com>, <shuah@kernel.org>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <peternewman@google.com>,
	<eranian@google.com>, <tan.shaopeng@fujitsu.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<x86@kernel.org>
References: <20260810184806.1089507-1-swapnil.sapkal@amd.com>
 <3bd1195d-35fb-44b4-bc96-4ec32c70e3d1@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <3bd1195d-35fb-44b4-bc96-4ec32c70e3d1@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0099.namprd04.prod.outlook.com
 (2603:10b6:303:83::14) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|IA1PR11MB9518:EE_
X-MS-Office365-Filtering-Correlation-Id: 39efe485-ece5-46ca-6393-08df1e5913bc
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|11063799006|10067099003|56012099006|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: 9/8/VwwLqmdiOnJVPXtMJ6KVJdmNoxJ+8b4OgAhyhXP0AtUVC/5q/PsHS5c/5Z7XwCJA25DgdSRxgAM5Ja9GmW8kEQ6kqrgLpE/UqC92oXhgvMbBtzQ3bxuy6/aT35LdURpoWL3DqveoJCCJ7m85HGpUsMlOwDBEDTyP7pXNEO4h3avrMQ7feIugDOZpllX9/AjnfLrCsUrtWqk9M1mylB3hB30o8Wfw9R6hnBWZHPrl73fAILx192kmviCRXBT20okECmk9R6cCZ9dsfwO/MBOTxujx28Z2M1Q0w2CNNF+HY9/XFmXD6356SAUnitVP0pEHC751Ei6fAIULwyVspqJCxvXRGp42CBxEyC5ECzP9nCSWcQ01III/yQmPRGEPk5Jr1YYM+blw6GL7O0n6cFyuLCLVdmAg4wMaSsUPz+bSD4ZOP25K2r6SBMWaEik1lu+aiWQJtrnAR/HcVPCLsRUzxjVZZy+UnPMUDSABrw8xBiLPnzXDhDHcQm/25oAh1twzWBQBYxy0AZ6QDqvz9AYblcyr8y+0Mn0enw50hltoVTiE9vuG8azvpTYaCpx4VJ3TSo99UDSydsdMpn73vRgNaDPk9l665n+fuwEQ/K4VuUkZJ+g4ywa96uYTZCjnFkQkdQt0PI6QuyBkBYwwpWrmp1X1S/71iFHjcKW1g9w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGlQUUlzL1NOZ25KSExXSGNHVkMrTVNwQWZ0aE9QMFJLUlJxc1BEUzBEM1Nm?=
 =?utf-8?B?VUpOOC9wRlVBejFSRDNPc3lrUmNHVHEzb3c1aXZnbklUSzdMNklDOHJxQ3Nz?=
 =?utf-8?B?aTVtZGttbDdOLzVlclJpd2FRekhwYVk1eDEwbzRORjlMRHdRNklBUXhndUJp?=
 =?utf-8?B?VUZmbWZwUWhEOVZ0aGtSU0ZJWGNoZ2xKdjZOdEd3VUR1QVdTU1Q0bWNzTjJl?=
 =?utf-8?B?UmVDb3k5SHVYZlNtR2I5WFBsNHkyRElseGJQWDFmSDNrc2t6VEZ1dEJpVlhv?=
 =?utf-8?B?TEJjRGJrNis1RXEveEl0NzUyK29Pb1I2eTlITHpyR2tOUThxQklvT0JEUDZG?=
 =?utf-8?B?Tm5sc1VSak1LUHZDRENzZ0ZNbzdsOFFkcTY1QlZqSGlIWE0xaUNtcnBzRFJz?=
 =?utf-8?B?WmppeTRhQ2ZZUXhicHV4QTNiVDMzRGI2ZmlubiswUUZXRCt1bVc1Q25ydGI2?=
 =?utf-8?B?NkllNk52WWpQQzNyZ2t6OXl4c0RoRldUS1lpc0xnajB4WURXSEtsZ09OdkhI?=
 =?utf-8?B?UHJla0NyUkJQS3d6emNQRHh5dUZ4dlBkM1VkMHFoWitxQisxOGQzNkdnaFUr?=
 =?utf-8?B?c3VjWlMrTGlqQkllVXNTZmQ4ZEFFZkZoUExNajBMblZkYkFlcXBpd254SlhT?=
 =?utf-8?B?Y3hSSGxDRFA2OXpaTVhaVitOVDNBWjBKZm5taFRoK1dyWWN3Y1haZFk2cm42?=
 =?utf-8?B?ZW1oK3lrZlRXRGxXY3JmTGdBVUZsNFEwV3prMCtSbmlWa1dqM3h2enhoVFht?=
 =?utf-8?B?dUZFYWQ2VURWV3JmbWNFbEpMOXAzR0IyWEZhZkZLbjZPMk80N3VWeExudlJQ?=
 =?utf-8?B?V2R1WkRXbytOOVNrYnF6M3JpSDFESzdhMGcrbFIxN2d3ZmFSYzM0MXp4V2NZ?=
 =?utf-8?B?djRXN0FxNlh5cStYT01JZ0hZdnlYaWx5RUx2YUtsSHg5QXVHbjQ2bTg2cmFr?=
 =?utf-8?B?Y1I2WGN1YmpzOXE2a3plRDgrV3dwT3NGdUpxVWczd2tpdktIUFZHM3JVeUhM?=
 =?utf-8?B?Nmx3akczazh3MVBwYStFbTdnNHpBbzJIZlBHWjdJNUF0WGhjV3Z0eVVxUU9V?=
 =?utf-8?B?RWFBQ2R4Zy90TmhzbVQ2TEtvNk1FdlBKb2NUQXBMQS9aVlZHYVJURm5uazZR?=
 =?utf-8?B?WHpaNUZVRUV2ZC9BZlJzUVpWeWloSkdNMm1MSFdDT3FERUlRaU9ybldTNGlG?=
 =?utf-8?B?UVI3WnFCSlZBMnBEa1U4SzA4TnFTWTBwd2o0dnZxRVVGY252aEpQdjJzaEU5?=
 =?utf-8?B?YVZob0F3bEo2Ly9XMVBoQW9hdTZ1NXpPWVVRdm9pMmYrNkpnUUl5M1RhVnJT?=
 =?utf-8?B?cWhDVlpOamV1WmE5YzNUa1doT21GM1VISGFKMWt0M3B0QWJ6ZDI5NzgyL0JE?=
 =?utf-8?B?eUx3bWRkZzRtV2lCU3NjRG5aajkxZXVISDNHdUQ0UElmVWtYTUtJdUE5NVhr?=
 =?utf-8?B?VlJsNzU1cDM3anBhSU9XcUdreWlqU2ZWclFxWlQ2VjhFR0hCTXJFUnN2YS95?=
 =?utf-8?B?Z1VCWmpnL2VnVEZHZS9XMFFoU2Y2QUFNdlVIZHJFZkQvZXpSUFMwTUUyV01I?=
 =?utf-8?B?RFhBSWFQSW9aV0p4L1VaMVVOSkxrbDlDaGhxYzhlVnp2R1ErQkkwS3A5MG1C?=
 =?utf-8?B?a2tLZnpYM2Fsd0p0MWhWa0JEWGZXeDJuNldqVFFoc29XTS8rVC8xVGVnY0Mw?=
 =?utf-8?B?eVQ4emxjZDczYzByZ2dBbEtORW5MQWFRRWRyNzRNd3c2Qms3RWIzSEwxYzBD?=
 =?utf-8?B?QzVIZy93dG1McWNKeUJhaTQ4cENvZkJCYktoY044VElyUmVxZTVPSy9rQ1di?=
 =?utf-8?B?eTBZNnl4UXJmZ0tUWmJmaGwzR0xDdFBLUFN5cEFBZ0lrRXpTYW9UeEgwWXVM?=
 =?utf-8?B?TlFYOXBFalV6TlJxRmYyOFVXYTJYc2hGN0Y5VTZ6VkxEclZHaEV2UGJUbHlG?=
 =?utf-8?B?U0dNTitBa1ZTY2FvbVZveHBvYzZwai9jOHJZZ0ZzeE1RK0RST1lvdm4zUjdU?=
 =?utf-8?B?aGh2QnFoUm1YOUlVOHovQVRDcWJ1N2NiWUF4am5oNktWYkdSZ0M4TEc5ZUkr?=
 =?utf-8?B?R0MzMXUvU0tYRkI2RnUvY1I0M0VkQnkxdlFvNnZxUHRXN2IrdnRQMjNGQjF0?=
 =?utf-8?B?RVkwYXo3dkJhZmVTQ2IyVTlwRFQ2cmY4QVYreDRzcFBCOEc1WmpPWHVQdTlF?=
 =?utf-8?B?d0hXOGc2YzRITEkxSUswUGRQUzZlS3lSb2szTWdKQll3N21pMEhwQVIxZW83?=
 =?utf-8?B?cUFHWC9seENGT3FMVTl2MGJDWGxxTzdSVzhkTUJnY09qSDRrSkp2VWtCTjNk?=
 =?utf-8?B?eGJ1OGt5Tm84RWVVMEVtck0xOFExZ2tPM2JCNnFqNEFlR2U4YUsyY21hcjdY?=
 =?utf-8?Q?GDX+VZDR9Hnyv3Sk=3D?=
X-Exchange-RoutingPolicyChecked: wjIoA9nTQksNivmTLgp7eTWrXGchxAr1cTZxCUy6EJLWBOFtj0H5ga609bWgipTMI6K6jK7Hz0NjNf0OkQdWWVB0g8GMZWjE+hX/0azXNaRb4rDaPv/gmOS7ebi4eckoVkTbLGvYZ23l29lkOD3Fn/pu/ldxD9I+OStl9Sqsfhd9Yed0iMjIZfm4T+lKuFWVYExut4RlmuRM/mcVotDj+ZfsEDw0VXstEtPzbw6LloVIW08mTGh7tMjz7bAXVI/87LYMqZ1A1m6qx4nNdkw1vciCuazdr2bQntpk1gTSCEkCGIgt/bMIWBRud0RMEwBGyPyLhnRIDxY09Bb1NHKUOQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 39efe485-ece5-46ca-6393-08df1e5913bc
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 18:40:04.3885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a7fY/hQ0bCT5PRvDh9miQ2KUfxRbbtcaPfjhZrzpVUBmm5vGy4BY+oYf1XojxYojAsSXkRLjpP7UdtKN4n+DGrO2gwUJUteX4tmJ3uiy7w4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9518
X-OriginatorOrg: intel.com

Hi Swapnil,

On 9/28/26 9:23 AM, Swapnil Sapkal wrote:
> Gentle Ping
It is in my review queue. Unfortunately during this same time resctrl received
many contributions (including a couple from AMD) on the kernel side and I prioritized
that at the expense of this work. Others are always welcome to take a look.

To help with the review, could you please take the queued resctrl selftest
changes into account by rebasing this series on top of the "next" branch of
git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git

Thank you

Reinette

