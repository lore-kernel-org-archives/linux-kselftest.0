Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F66E37CD28;
	Wed, 22 Apr 2026 16:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776873936; cv=fail; b=YlwMDn2aUX7UHbpT7etiBc/L/qTd2Phd/meadAH/oPbD8bJKtXRvz0vLlxhJXwpdIRP9WCohAzU1yJcArihLbLRyoHPRpSuG608Ng3/2ZwmYh7s4SrjHN96y7aSjvmOOFnGp/cDsbzvIZ/tOYKCu9jq+7voF45myF9K+uuBXHnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776873936; c=relaxed/simple;
	bh=vw9JdIbVayY0JHetUwOK3j1OsM61OLSXx9y6XXPtQGk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HtiCxBIopnaf66P1JeH6FynG5ZI8+tiHZRNw4Myi8/RCJvxhEpSMnfFx1j997YY90Xd2wCHFiQlwVftU9B92h0DX/eZz36iU+G7VadH0cEogqEksDnJfyxiYxqMeHMCQt7oEyIGQkH049GOLWVp14OfIsZDGb4pOMiINSCm+9P4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XFNbfpKs; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XFNbfpKs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776873935; x=1808409935;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vw9JdIbVayY0JHetUwOK3j1OsM61OLSXx9y6XXPtQGk=;
  b=XFNbfpKsZaL0/voqk0Mwa75gBl+WsghEWS0wrbecl11gaIn8buCTR0dv
   JLcmBirbzqT8/PS5j7ph/ccbW9wCZAPoviAEcBeAfG3slPXf9YSW4zVtQ
   OhiRnedyf/RPxEYnIE2HtbESVwgWsi6Dw4il22/BsFwRrs/fEXxOh+Rrv
   aGnTVjQ7jChBaDkQIg53blhk1ipYD5mkCTS9L8DMsTp9fhrKE7j4gZMxS
   pJOO8/MK5LMId/T8gGRmF1cziKcNSeG8sWCR0INmueXW7pNTsOVIYww95
   NGnTrV2b/FeMdTeSo16iNPOaD2RT4S072A7Pp+6KhgTdJYbR6kevT1PNQ
   Q==;
X-CSE-ConnectionGUID: kZ58JBTYSTejDMwRcPcOYQ==
X-CSE-MsgGUID: wZYwADQ6R6amM50yW6j0dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="103291608"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="103291608"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 09:05:35 -0700
X-CSE-ConnectionGUID: 1MEaYFvVQqKBN5K+fYo2zw==
X-CSE-MsgGUID: Y7NjplltQq+outcLKftN2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="231356703"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 09:05:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 09:05:33 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 22 Apr 2026 09:05:33 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.51)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 09:05:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S2cvivZS+XBiScZr4XaEwte9l85+f4ng3f+vGF6vuVUBmLScNERB5jrNG4EHVGsF7WyfG3OFYEkNBgCmBmeKhYTO6taEGaZPFlrzjjD2yig2jz5v6mHw+6j7F28irSh6gWJ1QakVMta7ZIbbhCOqxY6LzKca/Enlbx0VxV1idDyr3HOqZjIL6TwTikItCIkAJYzX42On+5JbOwrOqo5x/R1GsGoX8cIoN/ct0vTwltdLM6oXo2BSduy3fSZTzdriaRn64t1X8VFeoyogAvzInqbHIAp4LfzcG4ammywuP5ae5YzmEikaOMFq2TOxVt5BUSfG67gp9pgZc5BHlR+xZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sf6vHh4h5rDBSmStJgR2CD0/2G8SUNBOCnShKN4L0b8=;
 b=SjIN7m6NYIbxoM21HIRB6L+40qjdkerIpWk44+0o7/FbBYkRBQqV7QO2EnpNH4EXqxLz6EKhvrs+s6BHjMH1VnKgO8I9ezyzUU1Qrg9aEZLGqhb2sl9xKXR6A1CeaqT6f7Z2kqgen9fdj2TOAYGIvac5Tqk1E88S+KCElX4zimjJhdYLwF/HuOmTkqlY21I4NV/U1GwdmCQB+3YcVL1KEoFuUHL/wguOGC2S55ETT758nEOySl0C9gsOuiRlCO4sOLR44FvsmtA4Ua3bY/CmXB20deYjCfyzMT+n+ERm0N6L9vqom73wKCyAeOM7683KwKetudc8vCyHeeRS7i0BKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by EAYPR11MB9564.namprd11.prod.outlook.com (2603:10b6:303:2c1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Wed, 22 Apr
 2026 16:05:28 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d%5]) with mapi id 15.20.9846.014; Wed, 22 Apr 2026
 16:05:28 +0000
Message-ID: <62812cce-d57d-46bd-9550-826072e805a7@intel.com>
Date: Wed, 22 Apr 2026 09:05:26 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] selftests/resctrl: Refactor perf event open/close
 using linked list
To: Yifan Wu <wuyifan50@huawei.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<shuah@kernel.org>, <tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>,
	<ben.horgan@arm.com>, <jonathan.cameron@huawei.com>, <zengheng4@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
References: <20260410093352.3988125-1-wuyifan50@huawei.com>
 <20260410093352.3988125-5-wuyifan50@huawei.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20260410093352.3988125-5-wuyifan50@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0354.namprd04.prod.outlook.com
 (2603:10b6:303:8a::29) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|EAYPR11MB9564:EE_
X-MS-Office365-Filtering-Correlation-Id: d1281e54-ccea-4f17-d6cd-08dea088f8f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: wavMVNMFeNUijP2Gdj714b0pQB+Cua7B+n8wS9lapUv++uu6dxE/7BspNL0OSZF6uvbBGGj/T9w6HZ43QfvMiJw4pXi1vARJEXHvTjRkWTxKYNNyK0UuDvhmreHv5EzGb5i8qD7dz3sE3UfkDVjyOSmP+ilN//ohVm5RyKAzcF5qWPl1pXPf6mYq/DdTWbIis3ruwh6572SpHtbOcMAi0g4+rU+ngWZnMThCdWECj4EpEH6GSH1QoLJoXZ64hIZ6rQ+uwlW3LZtUcVdXgmIDL0KzsgNZiuky8n7ZO/M2W34k9Hx3jPnTcyIpnW12HktyQCBCaU0O62tljLFo0yEIdp/c4ArFxBcYXr7BTKj+dTjl4Y9u3+J5e5vhbEkFZipDNW+8wMfAegiisqJWpp7Vp0eZZ5hLOp3D+fI2CICfBV+l5qgwVYE+VgVgKheBVlf3lMNvKaAGUzlbjVu2qYjlVNHeGl8BvMt1J+aHX3eoOyEYjC+By8DdFJrEqmanpwizYEH4SvfaTFQPMOtioTbAwytP9jXocjd2Iway1a4K5n5zJWcZ3d5PLLAmpWrTwVm6O1i0/4rVBzljIAiv9RA21w9AYgNLtAz96EZj5xNffxg2d8R3kSlegbcIyVq9BlXa8jhk0mPcgfjbfjEvOwy8kn71mbccZ5vFPC6Q3tbNVOjIre65gYcQ77qMBfrdlP1+BKECswVm3dczmZ2HR0zngbj8Av+2yJZQlii896PtonC0k7C2ulpeQxJpktx71ve+gUpHiEu8i0566mVsS8VJMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1ZtcXJRemlOYVNkUXlEYklvY252STlVc01jWW9rZDF5eGtVblN5YTB4Qk5T?=
 =?utf-8?B?cmZHUnpHR3Rtek03UTRqZUp5SDZIVVB5bXBaTnc5K2FQaUpNaGJQZ3FOQkhw?=
 =?utf-8?B?b2ZwZTQ4a1ROekpmMWlVOHp3aFBtZHdsT3c2M3p3VXhOZWppQjFyaEt2ZnJU?=
 =?utf-8?B?NnVLK09hTDBnNnNXclF3VHdtZS9oL1RSa2VrKy95bUd1UzNscS9teFdPNTAv?=
 =?utf-8?B?bUsrZW1DUzZ4RnNNWCtKSGszUGFCWStlbCtuQ2Jhd2l4UkE1TlRxTXNpdmRi?=
 =?utf-8?B?dHc5VUJPU1UwYkc2QlBsUEJOZWVRaTVVUFdmZnpXRUhaUldheXdzS1ZLeis1?=
 =?utf-8?B?M3QzZi9NdDNDaHJjelZORTNoUWtLanJETWtPejFnMmVlSXQ3UzQ5UXFPNlZD?=
 =?utf-8?B?elQ4d0ExQXQrbWNXOEFXd3pXaTJ0UStBMGVhRXhVNjFuaWVLeFFyanBSZjFM?=
 =?utf-8?B?SDNpOHVNTXNjdEpBeUFEVFFtZHZ4OHM1dzh6L2dsRnJQL3JlczRUeTJEOHlp?=
 =?utf-8?B?RTIxb01kb3o4M2JEdVNSb09vdGYzTWU5OVE0K1lkRndEaXhoUlNyeUpPNkhI?=
 =?utf-8?B?emVyVWJYZFRPT3NtL3hHZ2xiZHdvOHJMSi9ROXBvTUhPVFZzSEphbWt0WEVF?=
 =?utf-8?B?U1o2bklPbE91Y2svMnhYR3ZjL1hjYXNMT1FyTWxzdkh5VnI0bXh6aUtiN1Fx?=
 =?utf-8?B?MnZ5TmVmekIxTkNkKzlJRmVTeE9hRHBzaFhGSEhGQnRMbFk0Ly9qZ3VOaW4y?=
 =?utf-8?B?UWVlQTJQNWQzYVNVSUZ2R01saHo5MGpDNW9SNVpxVXZnb1BONHFtOGdPSWtJ?=
 =?utf-8?B?MTN0VnZydG1CTjdHamFIcndvZ09ncmV2SC94Z3VlYXhRZTVEZnQzTFJsSGwy?=
 =?utf-8?B?YXBiTUpQZG9zSnc2M3gzK2h2VWZ2UXNxSVR2cHhVT3RoMnJ4YzZYVndrT2I2?=
 =?utf-8?B?UHl0eWdmanczS2VEZ0NEVHh0c25JUWMxd0R4VFozS1I5Yy84SFBLRVV0RTVX?=
 =?utf-8?B?cWhMaXpDN0d4emlFbGtHYjNzeFFkV01zcWM2WG1oSFhOV3p5Vnk1dUhVVXk2?=
 =?utf-8?B?bXFzZm9LbG9SN2FBM1ZQNHJ2L3NCaThqdGtkOUtoV1laNnFFMmo4a2RRTE84?=
 =?utf-8?B?d1lYTkZhaFdnT3V1amZIcVZIZmwxbG1CNVdkRFZ6dmp5V3djcDFVcUovaUZi?=
 =?utf-8?B?a04vb252cmovZXFMVGpBWEV1blc0YVpqY0hDYkFMcE5GMzc5ekFLeG1nNllp?=
 =?utf-8?B?NjRJcy9KMnVudW5saXR2K1hHT1NPNm9wVXF5eWlzQU5LY2ZBQVhQNDJhY1V5?=
 =?utf-8?B?anhHM1YrNWJnWXN5VUVxMVBQMktQam1vZVNXMEh1UnhvWWdWQXZrd24wRVNF?=
 =?utf-8?B?VkZLR3JCR3lDSDlObzZDTlV0WU5LSllLSkYxdWxpa00zdmpnWjF3TmlUaUN3?=
 =?utf-8?B?SzFvUHYwQkhHVy82RFF3VDlROFlKTG40U2c2V1U2TmNMSGhwUmJTQmtZUmlO?=
 =?utf-8?B?R2I1MDdYV1h1cGZwOWlhanRkMTBZUXJXWDBISXBaaG1LTW9oaTRkNGw0MEor?=
 =?utf-8?B?ZXFnSzYwaVVQVFVNMjFsQ01uZU1qMHFIU2RlVEk1TXpWeWdreFJJT2dyMUdm?=
 =?utf-8?B?RlZJY2NTejdoaE1GdkcycFlXbUdSMWc2U1NHcEY3N3VGRUllTTRMYU1XZDhh?=
 =?utf-8?B?M1h0Vkt6ZlRlMlBhNkN3UmN1MDNRYS9PZnN6U212NVVtOHh3KzNzeTUvQUdw?=
 =?utf-8?B?WUllblI1ZHlhSUxFaUxDaVlDS3c5cGJMU0hrK0FMRzVzRmJ0akhOalJNa0Vp?=
 =?utf-8?B?aWxKakFYc2xBWmFOR2x4VXVyVGw4K1FjaXF1cllMQU9waE03S2E4b0J6NGtF?=
 =?utf-8?B?citXRm02eFhQTjZLMGN0dHpNSmRHcVN1eStSVmpDUWFIaWFSMnkvNldZa1NT?=
 =?utf-8?B?Q1g4NE90UVp2Q2hSK0dkNGhoMHNtdlp0SkNUK1JpampqaGpJYStHcTVqRThk?=
 =?utf-8?B?Yk1rOEQzY0QvbW9BTHgycXhqUXZrQ1JudFJlVW9aSmZueFJaZFhvQ29Zb1cw?=
 =?utf-8?B?dDRuN3Ruc1pkejhUNzBmTnVRaGwzakQwTzZWUWpSL1RrNUVFK1ZLQ3JSQTM5?=
 =?utf-8?B?MXUwQldjUGF4MDV4M2UyOFB1bGViT2ZMY0Y0NDJ6Q3RQckhFQWEwcHVhc0dY?=
 =?utf-8?B?eGpkSnhqcjRWREZlQ1B3eGRnUjMveU9ybkhYRFRQK2E5RWUzZlRHeElWYXRj?=
 =?utf-8?B?YVlZSHRiMDBDRHNJUkdtdmVFV0dNNkhzNzRqSWEvRzd1SHZ6c0NzdHJBWkx4?=
 =?utf-8?B?SWNma3Z3NHRLMHFHSS9CYnh6T1ViOC9COWtReS9seW4xSEU0UkVTKzk4Ymdz?=
 =?utf-8?Q?rL8TzEP0TVfvaDJ4=3D?=
X-Exchange-RoutingPolicyChecked: WeOCwcutM3a2byQIGDz7b6o7wI9NJrXjrMt0C/rbTIooK9IDIkhjtFN1Rs6Uxq86A+Ku6mMTyeEuBokkoD907r3CvLgNvtzcxDoiVwZbogiCkTGRCrQxyCdz4lTWXdenbNuSe0HayFa9rXhb+/REcrNbMkigH7I9CRP++zRmfeTVPYoj0koPO/yHVQPeJXyOOwM96zUzy8rm3xrc+3WoRA/k2q8Kf/S0tBKABthrinQlNRmJGxg6opPnON0G8w2lOXfgQL79jO67J6gNqt9WFFm94p704s5nwkdJDXnTiW+28wPgg40HFTDv3NfhSd++oL0NCrhMJ+Ctj/lhAT9PkA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d1281e54-ccea-4f17-d6cd-08dea088f8f4
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 16:05:28.7902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ef8o4daRpfwp1cGhs8La6oi/avI7qr7gbJRB2Ad9VHlJ9kqFNj+HHcRXhy0p52UVavGJ2shLK348hpTpe5xZSQRLa0WQVJlxK22galipNWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR11MB9564
X-OriginatorOrg: intel.com

Hi Yifan,

On 4/10/26 2:33 AM, Yifan Wu wrote:
> Using linked list when open/close perf event.
> 

To make this easier to review and avoid breaking the tests, please split this
patch with changes to open_perf_read_event() located in preparatory patch and
the rest located with all the other changes to switch tests to the list instead of the
array.
Please similarly split the similar patches that follow.

Reinette
