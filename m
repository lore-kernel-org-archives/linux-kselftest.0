Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E408636E46B;
	Tue, 17 Feb 2026 17:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771350770; cv=fail; b=HREqQEMK7/4szGn/gNH4o8okwMIXw5zUJTH/52H438Rt9qJAnd42ie53EhxfKZ2IR+kfAFmF47fCN/glD6PIGpFRzDm+3MvmOMPQasS/f4YMLAwx1AcCdZsBcbvBkzUnla13e+CYhdvV2OuorBYEGfu4WktOaT3uD8zJv+fhWDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771350770; c=relaxed/simple;
	bh=WVbFiiNnBFgYjByZpStaw+H7+vEjRnSoHnTh/7gZejM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rkeZBHYIl0c0MdrS72WhkIeBcxK2+IaklBhz08/8oeaxgcW+H3AARZhxBc6cC5291EmdfYJq+0f3DHngt6CkJ252HCQDeR5CDT5vsSvufJL7YxL/XQsOVaISoE6xY4HxXqOD06rR7ofwNYnFcC9m/vvydX2gxpS00RhcrU/sru4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c20DQU/M; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c20DQU/M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771350769; x=1802886769;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WVbFiiNnBFgYjByZpStaw+H7+vEjRnSoHnTh/7gZejM=;
  b=c20DQU/MhuM2huWmqfhezTq84dDRgqGvG1d0Dh1cv4U1YinwxOymTsIs
   TFDxjQxCoxOwjx4HujNZLvuZ0720RJqoeLBSQn+C0LZsCcUnXFz8I8Ik7
   UBXQ6V/hP0mOSTDdO8tTKbIs62YOIbsV1LnU9oL0jt+StswD0FfYtupC+
   C+M12v428jdbbNmdDILr++0dFe5+Ik8THB4YpJyV+peJqy2qPGeUvNckv
   9nLp5EZYxc56w3ZIS5o34x2LaKQEvr1uxtHQtgvoD7aIb6a/7r9x6eMb8
   4DqtwyJ5psMFsRHWemfVGmWPsF/44B+GuLRGOvTxuC2o8T2VnCqv1zmTu
   A==;
X-CSE-ConnectionGUID: OD6AelLZTsmNHZkd618Bhg==
X-CSE-MsgGUID: 5RofxeWYR7ydyo8ty0SsGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72472254"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="72472254"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 09:52:47 -0800
X-CSE-ConnectionGUID: CxiW/TZlRgyrlEqRdO0ESQ==
X-CSE-MsgGUID: 1TAZ1KwISLu23lTq2t/X1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="213194343"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 09:52:46 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 09:52:45 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 17 Feb 2026 09:52:45 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.49)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 09:52:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UcYNYQoCdd9CcnJqwCj+gldvfokFTgfDb2LYNc5h3kpNaDiXwty+I5x5IV0D0Nxbvtz5iOL/Fk3yZRRa7pheR12JafnuH0eDo/FiEnFRDHAvLWRd8WilpJhgRwMpAQi7/QifksVv2YO80X10Wi1vC/alW5STcC9Dsv4DBQGObnXgc2QwQK6nd4IisvTtkKXqnOzMZYVGcofn31MzjcfPzlCWoxnfWkcAn5zKl8CK/ar3DvIlFoNcVL0vuWWzukkAyxHe3bKGESDolczNTIvvOyxSygZZU2uMaU4k5Nbz6SlvGVDny27vLn/93zhP0J+H1DpBpeIovhaXRD9bUgjaug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQ4DEckJAivw080KWtFTktTFhAKflHEWEnzILOIDvOQ=;
 b=oquGxC8oQASC6lW4KPUmFo+/C9QYMdhluXFQRx0MqxkntTAGdvLiyFEReYqESS4K//op0zfmL4+o3KUgG7ntxHbylJnYWGlesUHO4/1OEgPKUR1//d/deqdnnYcldQ8+QOuqFMckneG/W/PyqE0fQg5iO6U8K16gIie2hj+gHT+Y4TMmlQaRKompHd+GtHtT+gAZTKpCmkBhPrAj/rrD5sSUgk/z1v0ENlO4gMY+vUMEP8HhTkvj6+FYLoQjgB/A7g5ySxuZO28lKOItpFddERS2NReCWjehlpxBygLuRW6UxuWumMODXUww+izTAkIIWad8YLzwdqwrt2vm4gqyFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by IA1PR11MB8831.namprd11.prod.outlook.com (2603:10b6:208:597::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 17:52:43 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d%6]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 17:52:42 +0000
Message-ID: <ef8a9e9e-0d44-4246-ac74-0369b78f39fa@intel.com>
Date: Tue, 17 Feb 2026 09:52:39 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/5] kselftests/resctrl: remove unnecessary
 exclude_idle
To: Shaopeng Tan <tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>,
	<ben.horgan@arm.com>, <james.morse@arm.com>, <shuah@kernel.org>
CC: <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260123044034.141247-1-tan.shaopeng@fujitsu.com>
 <20260123044034.141247-4-tan.shaopeng@fujitsu.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20260123044034.141247-4-tan.shaopeng@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0307.namprd04.prod.outlook.com
 (2603:10b6:303:82::12) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|IA1PR11MB8831:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cb04a43-7240-4be8-3634-08de6e4d5946
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmNHMXR3aUlaMTR2RE9lSnExS0tra0tMVFpjdnhLY2hDQVluRmJkNXFrZXNU?=
 =?utf-8?B?V0RPeWhKRFl4Zlp1RHJZZlhWTWc1ZkYxOGRYdU5MZUYzdU1HaUNnSGs5Y2lC?=
 =?utf-8?B?LzJmWThaODFrZG9zb3lERjNmYWlsWXR3bW5NK200MzZUdGMzc2lERFdzVk9F?=
 =?utf-8?B?ZkREdS9KSFl1T0Z6dm5qMnhvUjVwRk1PaEttM0VWWjJBcWJlTW9ZaU9tWXpZ?=
 =?utf-8?B?S3ZUOTZReXI4ekE1TGMwak50ZG5GM3EwSEhvd0xJOGFhOVR1Qm9FYzFZUGhh?=
 =?utf-8?B?RWRGM1ZUQ2F4YWxUQS9TNWlWdUlpZGJPOHNUT3g5MTV3TmRLbGcveG5VcndI?=
 =?utf-8?B?bWRxWlhVV2l1ejZMVnloTCtKSisrd0pzS0lCd1U2UXUrSWgybjFMQm5tYnA2?=
 =?utf-8?B?RHdjQzhrMWdyRm1uNm1FQTlERlJiMDZ2UHl3YnJoemtwV3hZdDVZWHN3blhQ?=
 =?utf-8?B?OVFkVExqaUN1RmQ5WW42cHNYZ2xvaXNPSUJiMnNnWXBCcHhhNTYrcVcrQVFS?=
 =?utf-8?B?OFNaMndnWllhZ3FsbFdCNll2QzBrenQwak5UVzVBbDdlMWlaWW9sREl4enBK?=
 =?utf-8?B?TzhVTHM0NG0vZytPM2x6ajhiWWcyY2J0YlJPSStORGpoT3RZRDNIWmJKZ3Vt?=
 =?utf-8?B?TFhPWmtUUm9NbjB2Y1dLaG5LOXBVYnhWSlkxVzhUdWlaMFludUZaQU5DcnZL?=
 =?utf-8?B?d3VCR3RiOG9pZTRJTjQ0R0ZFWHVCSFFjeEpoQk44b2h3RVdTT1JZODF2b1Fp?=
 =?utf-8?B?SElVTWRQMncxcWw4OGNtNWhmcmNVRUlHbmY4blhEMnIxMm5nc3ltRkJJcUtT?=
 =?utf-8?B?NWRtWEo4MzFJYzQ1SWYxb25Pakx4enY0dU1vejMzVmk3QWtpcFVUa0lpemlZ?=
 =?utf-8?B?QmkwWXdvcldsSmR4VTNVdXptV0dQcHJpSlNXZ0JuMFRLZWIySFd5aERMMnRi?=
 =?utf-8?B?YkRETkNEbXV2L0toRkpzWFp3VzZlYmdIZE5FT0NxTlFERlV4US9XQW9RNnA4?=
 =?utf-8?B?RHFLUjhkcjI3NzF3dnE5RnVNVHZReDlSVDdYNDdXakVqTktESVljcG1POUhV?=
 =?utf-8?B?aC9ja1JkNldTN1I2SzNZR0xxL0hHNDc3OGN1cE04OTFGbzl2T2EzV2t0Uk5v?=
 =?utf-8?B?cDBtOG55NjJXU0llWWJ2bEh5WFFiVmNSSXZwb0k3QllBd2RYL0pDTTNqd1R3?=
 =?utf-8?B?bnBJMUQvU1Y1TEV5THBNc0E2eEs5UUJTbnNVQXgxb1BWRC9LY1BsTU5OQXVK?=
 =?utf-8?B?eFI3OHB0TGNXOXNQSzM3VHhSS3M5ZWJ0bGRDaldTQ0JGQm5OZXlZSUxYKzFl?=
 =?utf-8?B?ZDhTUk1WeDZJZVQwaVJHWFBBZGs3T2dDOXFIck5kZEw0ZHVOY0FYMEV4Smh2?=
 =?utf-8?B?TXI5SEUvUkR5OWc1Wkc4RldXVkVZV1lZb0dDSHdBUzF4QXhQa1I5UDNuUk15?=
 =?utf-8?B?ZVV3V2tscW5kdERzWXlGYnRqTWFBVlBFSkRnNzZhZUY0SGlsemhzVTlQY3pt?=
 =?utf-8?B?RDdncEQ2N0lXY0hzMDEzdFVaYnFROXh4cUJTZjQ4eUZpcFVPRThUYTVJZFM0?=
 =?utf-8?B?QndrT0tuNHpHQTdhZFVyK3MydW5wUUwyNXV0N3JpUXpXODllejJsLzc1Nko0?=
 =?utf-8?B?WkpMQzErUDhmUVFHZ1lxeWtYMU42UW80T2NnVWxaNFlUd3FlM0hvLzM1Viti?=
 =?utf-8?B?M2tMeFlzTlNwY00zVXFHeHd6VHRBTXh2N3ViM1R4S3haNFlYM1JEcDRHRUVS?=
 =?utf-8?B?SUpQakl5THRRYUwzU1YwcGt2cTg0OXZQdjhuM29MZGNRS0hjVmkwUWMxRHlk?=
 =?utf-8?B?UlFqWXZ1VUVNZFRpMmZHVEZzcGNTVkd6Y2JDenY5MnlOMU5RbHpWNkY2Risw?=
 =?utf-8?B?S2FiUDFFRFhWVVhTK3YyNy8rYU01dXE5TERXUVhmTTJQZXpMOUc3andaNDd2?=
 =?utf-8?B?bGY0eVNnMVdJZ29mS09icVdNWlp1OHpnMVdUeUM1QVp4VmdqVzF6UXFOdTdr?=
 =?utf-8?B?S1IwMVliUmFzekxrY0JULzduMVplbkZLS3pKeFNsWm5mVkRkSzZ6b2R3NzRN?=
 =?utf-8?B?dnRiVmV3M1BMRjh6bFZaRVY3VTgrWkFpcmNWVTdSSVdvOVJlMWRESnlvSVNx?=
 =?utf-8?Q?taAc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEt4VHYxbUVVL2FSdmVnWENqeVg4MHl3bzJGalhCQTF6aEU4NGgzdGd0b1Vx?=
 =?utf-8?B?V0tLcEdxbmg4dWE3NUNYZzVINGJkUHdqSXFXNFJTZWtYeFU5SXRuWmp3bXVS?=
 =?utf-8?B?VHJGc0dRYXNsMTFrZTJsQ1hjVU8rSTNRZGFoTmlXQ2RKZVYwV0hiQVB4bmFu?=
 =?utf-8?B?SmwwblRadENjTHR6SVp1cmcrVE8wYVo3STZiVDU2d21VczFsYjhqMldVQzdr?=
 =?utf-8?B?SmtMa3IxUEFBcnpoRjZ4aS9vZFdrVkp2NENwS3VBZ24rbHVuaFdPc3dIajRS?=
 =?utf-8?B?RHZkcXpLek1WNXpnZmF4QUtoMG8rVERtWExJRFNqNzFZaUxCRCtqTFZFdWNF?=
 =?utf-8?B?a2VqM0pPckZSbTVqV0dERUlkZE9WNTZVQXlPejJwTWZwZzhmdnliN0ZEZHR1?=
 =?utf-8?B?VittOVJBUDErcklIRjBUZjFiTXlid01pR08waXFwaWNEQzhyU0xOMUZ3UzRa?=
 =?utf-8?B?azNGVGJqczg2R2tKY01iRmhQYlBMbDFEMDg0VXpJcHR3SXlzcGJiMTkzN2Yz?=
 =?utf-8?B?Tlo1MFhqL1hiREJ3U0wzRFQ2OWtybTVUcTZ0VzhSWG1MQnRCd0tLYTRWby9F?=
 =?utf-8?B?WmRtNS9DWWdjVGs0bUdjTVdhOE1ZemM0N0ZkbW9Jby9lUHo5cnBDcjlLd0RK?=
 =?utf-8?B?ZzlxUFdmYUJYeFNtWndlWTFZRk1sS0xvWEIzM1crSE5jb05tQkd6N3M4RjhE?=
 =?utf-8?B?N1JKR2JCZnN1eGNJV0lzcDhLTElDWGs4OGllWldTMEdpVHZiT0NqR1VONDlh?=
 =?utf-8?B?MWRZamV0QXpqazcxUlNvdUxSQll4K2ZDT0QzZ1VYRGVGMDJYQ2JIeW5vT1F5?=
 =?utf-8?B?aFZjY2N0TDVFMjcxSVJYMlRpOUdvTmhVTEY4dDI5emFwUGh1d01lanZ0bHA4?=
 =?utf-8?B?ZHZLK0UzS0RrWTdPOGNtODcvN25UNFpQYXdKcVVPbHdDUCtySWI3SG1iOGJu?=
 =?utf-8?B?UFBHMEdMbEx4MTErQ1RwZER1Zlhob2FlNzUrUnlYajBLZHBaV2MyNEdGQk52?=
 =?utf-8?B?YnU0SHZ6ZEdSdkd1VFBkc29jc1NsakdlaGdQT1ZXMlJubWpiVHJNL2hNQ3M3?=
 =?utf-8?B?VDZhaHFvN2ZSNVF5eTFOMThYODJYdHIxcUc0anI5NTF1N2xRWFlEN0xIakZy?=
 =?utf-8?B?T2hkU1Rva082aUsrVEpxTE42WmtnZmszKzV1ajZqOVhrVzdaUW96MXpMR3Bz?=
 =?utf-8?B?anNNLzlUNEZZSDNOdGF4VFIzQ2xmNzJNYlM1TjBrQ3hXRGdQL29SRUd4NGdF?=
 =?utf-8?B?VFdiaGkwd1RrZ2RVUTdWaWl4bXR4MlZjeWdHT0NSUTNCTmVmcTQ2UU1XaEp2?=
 =?utf-8?B?bHJ2NURrNXREOU9SS2x1cWZ2K05kN1dQRW16WDJPUHNpZS9aMlBraEtGaUxH?=
 =?utf-8?B?b2tMUlpBN1FST2ZDajlQVVhmK0lEZ1h1NTBHcVNPZXUvVDNMM0IyUVpjbFlz?=
 =?utf-8?B?MWpvZzJ2bVFlMTFicGRXc1ZvcE9jaFFCYjY0RGRnMEhFaHVSRXdyTDJFNWVk?=
 =?utf-8?B?bDlNREVNWVYvanYyRVhJeGUrT1NYVXVpT0NYSjVjbXVCWWpRNzhlb2JUYXFI?=
 =?utf-8?B?bFZ1cHdOYlFiTVFjN3J5NVNXZTFCTmdRdHhuVHRxenV5emVpenJjem5mQzhX?=
 =?utf-8?B?NXpjM2JwWjRla0FNSzVsNXRXRmNEMkx5TTFQRnduYW1DRjlBK0VJdDRlb3ZD?=
 =?utf-8?B?RnQvcXRvWXBTQ053T1ZlbG1GdHpkM2pEalc5eTZ4Wmd1RHZFY2plMTdId3lJ?=
 =?utf-8?B?ZHVtNnJVVGZ2QWRhRXNIUnNwdWJHcHVlSHRnNzNLS3YzS2M5R0FVUWNRTVRO?=
 =?utf-8?B?QXlhVXVTaE9XUDZUWWVXaWM4NDR0TGc1UUE2QlU0by9iaXhvdytmZnJScVhl?=
 =?utf-8?B?N1V5RldaVDQ5VmIvSmw4TnkyamtLQ0FCNFFGVGVTbXFOOWtZTys4UVVuRnpM?=
 =?utf-8?B?SjB1TlUxV1c1RGlEZGFSUnNHMlhLaE9hY2dneU5sOW1WcTl4OHZhc0ZJTFpY?=
 =?utf-8?B?dEtqZzhNaEtqa2JrVXpzMGE4YW1JRnBMRjFXRmwwQks0V2ZYN0FoYWdtQUZF?=
 =?utf-8?B?VXcyZkNtY2E5S0UrL3c1TjFzVHprZ3JGU0VRSk9mOG0rcTlaeGNncmZJZXBn?=
 =?utf-8?B?YlJSWnhlNkdiSUt1MG15czFpa3E2VTJJM1ZnWDRSZlNoSlExWWY5T1hCeVlK?=
 =?utf-8?B?QzhqNGttMmNtNmVvakNEZHBKcVQ0Nlg2Uy9UaHhqZUdGeWFjZCt6YzRHc09l?=
 =?utf-8?B?Z3hwMHRKcFJhTmw5V25iQjdxMjlPL2puV2c3dmdOZnM4Zk1IemRyZUNRb3Zy?=
 =?utf-8?B?emtJeXRKUWJlNjlNMzN2Z21Md1J5VCs4b0owSzduSitLYVVObFM5M3JMWnpY?=
 =?utf-8?Q?vbFBLAJ+uhE6tQAw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cb04a43-7240-4be8-3634-08de6e4d5946
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 17:52:42.3859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YcIXQxywWY3vPJTk/obrF29O65AsBQdqDfwgH1+suea1MRfNSrnRjyGklsVizkx1pFeM5Jje27uFzGNOSMneL6BdJdMFadNus9a8ptqUW5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8831
X-OriginatorOrg: intel.com

Hi Shaopeng,

On 1/22/26 8:40 PM, Shaopeng Tan wrote:
> The Linux manual states regarding exclude_idle: "While you can currently
> enable this for any event type, it is ignored for all but software events."
> Also, it appears exclude_idle is not supported on Arm.

Just to confirm, does "not supported on Arm" imply that perf_event_open() fails when
exclude_idle is 1? Thus encountering:
	EPERM  Returned  on  many  (but  not  all)  architectures when an unsupported
		exclude_hv, exclude_idle, exclude_user, or exclude_kernel setting is
		specified.

Reinette
