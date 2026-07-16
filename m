Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F4F3A3E95;
	Thu, 16 Jul 2026 18:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784225707; cv=fail; b=P4qyKxnqfwVs6V11Urg+Rs4WJa9jWs865QK9KV5TOF2unrYiKHiL7AwEWepR27Ci+uP8dWphhurbVwYa0cnPBAbqYqXB61khRiowMXTTgApXUlNNC09Evsxaa2+n/CEapaLceeVDctt+kt1l9O2AfRzFFSNiSQzBAPHFOJLWjuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784225707; c=relaxed/simple;
	bh=1DSOsWGS8rBZzNadzq0cxZg02C1zkRyJ1r1cUOS6PR8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nl39SZxrgXXH7Gy3nD8Q6q8RyT13ssUjpwlCbPEIbRdT6aTTmeLd24VsmoGQmRi8RYZ1clexxWOx6DVX4Pq2fr2YbvTlTJgom05r0PIPciMGUAJxQmktFc7vFxxAUDU+nay/5RugbwptP4ihUQCdCuLMlbHBdOOcHgmPa+OSOlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=av2qHM95; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="av2qHM95"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784225703; x=1815761703;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1DSOsWGS8rBZzNadzq0cxZg02C1zkRyJ1r1cUOS6PR8=;
  b=av2qHM95/lDrLRtYn35pgUqYzo6F0Q0Z/D3G97vyDNzS1ln806yLNAs9
   uicXlxjW4pG+DUcDRXkoJc48mHbL5PYan5/K5aRHd0/X9Wnm2yJTxcutT
   xDQejWU/+8uV4Afv74OSnSAiDmeFsUFdAv9Z/IZX9Tr7/7ajOLG7UFTCh
   eL/Qs0r8oxUb0xlvyv9Ok0sn3mkJA06xPX0jVCeTAovWje31iNBTwAVEg
   OWuVbE0K1J3ShBRYfpArIhwZSYgRu/plIm2dOcERc9FtjUtf3SVJpn2m1
   Jey/iilM3StwiscuXviISPxBFnC2IMqlpHN7cnUXMf1DFesJpsIyOm4TW
   g==;
X-CSE-ConnectionGUID: j6VKUQxMSyKlgNO2B18f3A==
X-CSE-MsgGUID: H/cmCqHdQxGOsWR6fmWGsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="88571667"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="88571667"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 11:14:58 -0700
X-CSE-ConnectionGUID: bMui81PsT22MM9/feAo9Hg==
X-CSE-MsgGUID: yvn9v7OxTPexVb9vKSf0bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="260858511"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 11:14:58 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 11:14:58 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 11:14:58 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.16) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 11:14:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gCMi6Hqk2+1k8V2KNkLgux6Yak8338Kp3Fm3EG6+XycuEyk+WoC8eXnVFXpkJE+mXdmmySW2z560U2SReMgAr/pM4uyZL3EtVi39Ll46VkrqGMVIlGXSVeDsExs+dhtqIjKl0+0Bsy+md9hBfjbh5fABL6h2hBaVqjRwmhKyrOjd5CaBO69kyKcD9I0ll3DGShsRIdZcZyMTnGnPI0G7eGUcDvlVfQb+PYgvXNQWpY9NXchvbOkY0dw+nhJIIcarAYCRmAdAftItwhkBzg+8UYlawsLfWCN/8Ijceu7C08Kj7FB2NU/HDjR5B6ZLT7zWgC/kszPJa4BlTOzm+4s8uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XC8El7mrLw9MtCTsZujbRUDlXhe5I2yKzGVlL8UsMEU=;
 b=mPR3D2UhESHlkk9+92fu7xMpArowFvb9Z9k5Oo7kTt0ZyNQY5Vu0aM7GUIVruSa6qjBO6u1xgBZsIWwLhO+MZuWjlvfmpSAlZoNwqSuJVz27eILbwdqIrSsTPfeWVC5K9tPM1anoZctpkH+/CwCl3RTSMroiA0nXrC0ntCJcHRx7DYgk3Dut8j5CkrGR+UyyueKG9Uoy4AdWcKMXAG7L+yvN+4HB6W5wkh13SV/9BkuaTi0gDzJqQIA56vpmCRv9QoqSVdMV9OFWpcqtkPHRV4wuLLyowPyd7jpMiIiAz9iGuIvpY2LNpkDCMZlKvI77EZDWdr1bXlWNtn76v3KvbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7381.namprd11.prod.outlook.com (2603:10b6:8:134::14)
 by PH0PR11MB5157.namprd11.prod.outlook.com (2603:10b6:510:3d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 18:14:54 +0000
Received: from DS0PR11MB7381.namprd11.prod.outlook.com
 ([fe80::4c39:dfe6:d6dc:6f58]) by DS0PR11MB7381.namprd11.prod.outlook.com
 ([fe80::4c39:dfe6:d6dc:6f58%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 18:14:54 +0000
Message-ID: <79bbb277-e396-461e-8104-a9d62d47c299@intel.com>
Date: Thu, 16 Jul 2026 11:14:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 net-next 1/7] ptp: Add ioctls for PHC timestamps with
 quality attributes
To: Arthur Kiyanovski <akiyano@amazon.com>
CC: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
	<netdev@vger.kernel.org>, Richard Cochran <richardcochran@gmail.com>, "Eric
 Dumazet" <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, "David
 Woodhouse" <dwmw2@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
	Miroslav Lichvar <mlichvar@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	Wen Gu <guwen@linux.alibaba.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	David Woodhouse <dwmw@amazon.com>, Yonatan Sarna <ysarna@amazon.com>, "Zorik
 Machulsky" <zorik@amazon.com>, Alexander Matushevsky <matua@amazon.com>,
	"Saeed Bshara" <saeedb@amazon.com>, Matt Wilson <msw@amazon.com>, Anthony
 Liguori <aliguori@amazon.com>, Nafea Bshara <nafea@amazon.com>, Evgeny
 Schmeilin <evgenys@amazon.com>, Netanel Belgazal <netanel@amazon.com>, Ali
 Saidi <alisaidi@amazon.com>, Benjamin Herrenschmidt <benh@amazon.com>, Noam
 Dagan <ndagan@amazon.com>, David Arinzon <darinzon@amazon.com>, Evgeny
 Ostrovsky <evostrov@amazon.com>, Ofir Tabachnik <ofirt@amazon.com>, Amit
 Bernstein <amitbern@amazon.com>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <shuah@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Simon Horman
	<horms@kernel.org>, <vadim.fedorenko@linux.dev>
References: <20260714020340.25014-1-akiyano@amazon.com>
 <20260714020340.25014-2-akiyano@amazon.com>
 <e58af0ae-ad06-4f77-8ebd-f3678d6dde66@intel.com>
 <178418934680.25423.291292029139415698.b4-reply@b4>
From: Jacob Keller <jacob.e.keller@intel.com>
Content-Language: en-US
In-Reply-To: <178418934680.25423.291292029139415698.b4-reply@b4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::24) To DS0PR11MB7381.namprd11.prod.outlook.com
 (2603:10b6:8:134::14)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7381:EE_|PH0PR11MB5157:EE_
X-MS-Office365-Filtering-Correlation-Id: b063bfe2-1de5-4d86-f0e1-08dee36622e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|18002099003|22082099003|10067099003|5023799004|4143699003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 5MKZxSuCPHtlcFdmthZ5O+k0yW4SS6n03sQcdNUEtm1Ds8uyUC95KfU4zXDEvDGSg87sUp2XbWgKyXobr5QDcxtCJDD2m4xKSRCRDuehZRYjUm4+561/8vU7oP0qWKHB4u6GlISTTesKW/jREstYLER9HHEpYLYR9q59lvlwWD/HY7XKrSXaN/7APqYbY6HjZXQHnhq/o3QRjB0THxeA31HF8smI7qnSCdn9JqH28Ptb3arDwPXictIFCYdKGShi2GaUy7RPD5wakR94JV9LT5tRx6x4hInXnhYZmUN3CdHybtWCXiPBtpzGZjrDi5Dq6K2dLFvZYCtNOoukK757NsAl8ub7xG6hSTtiS4N0mjG1ThwQJ9Ya1EW8C8rTqfv0IZtD9mhoxziMGa0gGx6+3dWEccWfaojhyXtRNommo/yvxKWHHsL+RQcE0wuQmyVbhyP5lfz6Z/GNuWrbVIenoW6yA2XaCFVCtlSb45vt67jNxlRgsJZIekMtHWGRLtwlVGKRvyKO1wRsgnu/S2gWrpv3rLHRZSX9gMpLnVrWep3BuNBc1YW67DjMVfrU+ryayqJJgI1L4a+LnWw/JV0lmUxkG911CT997keKqQY1d2TV0LNB5RceS7qFVzFArHnruMmQZS17NIKHNUApIUl/jb5/PIRaKUF4YTWO9n93gfU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7381.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(18002099003)(22082099003)(10067099003)(5023799004)(4143699003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWYvOEs3WVBuZnhQd3Bnd0I5MHgrWXJrZUJ3UkZOVytWVm5HREFMeHg5YmtJ?=
 =?utf-8?B?KzE5aEhWK05nb1pKaUVqTmNadWd5aFVXZk1Vd2lkMnRVamNwcDc4NXZCMEVy?=
 =?utf-8?B?eDBuNU12ZGtBZGVadDlYc0gvNDZ1WmNVYkNGN2ZwNXhKL1ZqblArR1JBT0VF?=
 =?utf-8?B?Yk1BRkJHWnFNaW1vdUhFdmUzbG82SjVNKzI4blFJRTN6eXRjTFFkWG5SaUlh?=
 =?utf-8?B?VWZ6czZnZlNIb296dTExeVRNVlExZkJyRHRCdzk2K1loK2h3R083ajFkRGxP?=
 =?utf-8?B?U25QMm1DbWtDZlA4YkhCb1Zsa1lkd2J1T1kxbWhyeUhwT1E2bzlQRHcvVU1Q?=
 =?utf-8?B?eWVKVW1CaUZmakRGYlJHU2M0eWhIbGhDdUpMOEVEUGl2QWhnWU9INkIyMzM4?=
 =?utf-8?B?OVJaeWVhaloxbk5oSkZsbTFHLyt2S1UzdmRmWjh6encxSjBNb1RFaEtrZVYr?=
 =?utf-8?B?OHVqR2VtRkZ5MlpabS9jcUlsVk80Mi9KUi9HNEg4SGk0TG5hUHlldGx5dHM2?=
 =?utf-8?B?cTVkTW1OeXVqd0R2UDA0TS90NE0yRyt6bXd5TVBPdEI1cmxsc3liUHVjbG9P?=
 =?utf-8?B?OEE1eU9JazNCWFpmaGhxcEZsKzRKUWhuREM4WlZ5VDloajhGb1ZkYUJMRmFE?=
 =?utf-8?B?R2g1TGxxY0Zhek1WV0IyUUwwZXBvS3NYaCt6MHZ3eGY5a05yZ0Uzb3hHdExp?=
 =?utf-8?B?SEV0dkJYd0wxSUZzRU9nck1ScW1EOFdVaEpMZFBPcEF0anpFKzN5bnNBcGpK?=
 =?utf-8?B?K3J4SXFKbTIyMXU5dkZ1RnZobUg0dmp3eDU3ckY4ajBBZllVdkFaSkxrdzVH?=
 =?utf-8?B?cG50NU51US9objZYOGNsZ1BZVmRzeFVMSFAwNDdZQXpvemprVHlWNkxYRDZ0?=
 =?utf-8?B?WnMyQjl2OVFlanBrY1o5cHFJa3I5RndFcC9vZFRRdFF6UDhuR3pKZVF1YUUx?=
 =?utf-8?B?ajVsWkFZdzd5NVB4N1RNdTF5NDRud3N0OWVXdUNNamFPQVBQdWdSVmp3YVdq?=
 =?utf-8?B?eWYzTk5lT3RSZC9EazdyNVZjLzNUeGFZMVhXaGxxYVd0TGtOV3hRWWN6MXdv?=
 =?utf-8?B?NFU3NERTcTF1bGlpT1gwWkVmaXRPSVF0cEtmYUh2ZTR2Z2xscHZtNkJLa1Vu?=
 =?utf-8?B?Uk50V052dWdnY0ZVdFNtd09SUU9GQ3RSNUphZ2VvUnRpWU9way91V09RWlp4?=
 =?utf-8?B?TWdhWUFkdU1WQWl0T3lFUlJTeVYzUURjaFNGbmh4TU42ZlpuL05xWnFTcWRR?=
 =?utf-8?B?NENSV3dqSGJUblNHSTJLTHh2WHZrUmRSR0JqNDZNNERpQlZwRi9raWpCam1t?=
 =?utf-8?B?djB4eVNRdWZTdmRxVTF1dDVvdEh0REhRL0lsR09Wa2tUT2VKVTdPRFU3WFJD?=
 =?utf-8?B?ZXZvZDJJZWNLaDhYcS9vQVpBNzdJdi85dzdUclM1MDY0RVF2ZkYyb0RJMTB1?=
 =?utf-8?B?SklGQ2lvK2c4M0RmRDl3a2oreFlzeWFrdW9Ba2dZMFk0T0Q3UlFKMW9nVG5y?=
 =?utf-8?B?VXFkdmp1cXc0NTY0MnlFM0pKTE1oZEFCNGlLVElhWXNDRU5KdXlRTDBWTW93?=
 =?utf-8?B?eXgvQW9Id3RGU3g4SnhwNGtORktTZDQycWN2cWFaUkN3TU02dE95YVRndXQv?=
 =?utf-8?B?Umh4NTBVR0I2dFMwVGtLaWE1NWpZaWp1OHAza0JBanRhRHF0UnQwcFc5NUF2?=
 =?utf-8?B?UlR1QWlUU0ZjdzIyNTFTby9QakVwL3F1eDRtMzNGM0xUekNxclBvTmFnbVdy?=
 =?utf-8?B?c1JvNkJXYStyNVVMb3NWd0d2RUE0eGc2eVNJazVjRnNTaGhDaXM5RzdQdEU3?=
 =?utf-8?B?dUVBWjdweHhFc21wUXBIbFg0SXZEbEMvbU13Ym02WEt3ckMxc0FvV3h5a1oz?=
 =?utf-8?B?OHIrRGZpZEJ2N3RJZ3BPNGlYWHlGZko4cC9rQlhGd0lUSTdxRE5taDlsZktI?=
 =?utf-8?B?S2JWRG85QTJwMjF1VmdRZWYwVUFRd09YdE5kTkthY3A5VjZ5bFAvdnNxbWJh?=
 =?utf-8?B?THErOC8wZXpKQUl0OURFNUpOQW4xdUNJenM1b3lJcFk4VkVuS1hmQi9YOVcy?=
 =?utf-8?B?OURsNkdScWloTTY1eHZoS3EyOXBpV2k4bmhXUnV4REhlN0JCMHFYVjlQU0gx?=
 =?utf-8?B?QmlSNHhUUHNQaEVVS29mNzRMNWc3SDV6QUtPN0lQN2liNUI1ZWJqSlA4UTJk?=
 =?utf-8?B?L2p0L241SlI1cFdyL1czRENoSFNNdEZLM1R5OEVxc0l4Tk5TM2RqMGdwTHJ1?=
 =?utf-8?B?Vnc0MzFtUHVWa3FvVWROUVhLYk1IZDN2cU13MWN2N1lCdzZma293UkNYeGgr?=
 =?utf-8?B?WkFyU05BQ1BuMUhyY1NCRCtNWlpKQ09JMHIwUXVmc1VLT2FwQ3ZLZzJiajdH?=
 =?utf-8?Q?VaeT8eyy6QbOCFeQ=3D?=
X-Exchange-RoutingPolicyChecked: dj8Qek7tq3uy7I+h/EldGwwEFT0/UivGZXtGY/xdCIS9/UW+TlmIR02V20wVV3PVwjfbdRta06YFXNSTV08QfSdgSiky72NlD3E70ZER9/PCOqN4bCWfZ3yYKkFMCS86gRvA9KsblG/ET4MIzv39qRPfWLufxHEiv9kJBbjqWTzmVjwr5goitCK8g0QtLDTb3g8Z6UBguicrNx8WadD3iadNGLGpNUnLF3xAuCBfyg3Tlggb6AHKbuoSHDk0uwzSfLKc9ETbKA+RBrrsoAmEFRJ7XA9jZeTy4kTk4bxhliA7y443IkIPKVK6fpPz0XzaM9q2m465DllmXzrDZOb0dg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b063bfe2-1de5-4d86-f0e1-08dee36622e2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7381.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 18:14:54.6248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O+d9rd0TKK7Mf+hblBrCijVZS/HzoBvRjTfrO5Arvqb9+cbyKWT0yCNlinNyjkmCtKAlrPtXpGvQbLdZQpvjHYdJbQbrVIQX6SjCgLEw6eQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5157
X-OriginatorOrg: intel.com

On 7/16/2026 1:09 AM, Arthur Kiyanovski wrote:
> On 2026-07-14 17:45:34-07:00, Jacob Keller wrote:
>> On 7/13/2026 7:03 PM, Arthur Kiyanovski wrote:
>> I'm also wondering if this can expose device-known error bounds on
>> timestamps even for devices which are operated as synchronized by ptp4l..
>>
> 
> The intent is for these attributes to represent device-
> known clock quality information. The mechanism is
> deliberately synchronization-agnostic: drivers may report
> any attributes they can meaningfully vouch for, regardless
> of how the clock is being disciplined. Thus a device that
> genuinely knows a hardware error bound could report it even
> if the PHC is being adjusted by ptp4l.
> 
> In practice, however, when a PHC is disciplined entirely
> from userspace the driver often has little or no visibility
> into synchronization quality. The valid bitmask is designed
> for exactly this case: a driver advertises only the
> attributes it can populate, so anything it cannot determine
> is simply reported as unavailable.
> 

Right.

>>> Timescale definitions use a Continuity/Discipline framework to describe
>>> timeline properties and steering behavior consistently across all
>>> entries.
>>>
>>> This implementation is based on the original RFC and the UAPI design
>>> discussion linked below.
>>
>> Not a dig against this patch set, nor a request that you work to
>> implement anything else, but I am beginning to wonder if/when it would
>> make sense to transition from ioctl-based implementation to genetlink or
>> something. We did something similar for ethtool ioctls a few years ago.
>> I know the maintainer for PTP has some distaste for netlink and prefers
>> the simplicity of the ioctls.. but I think we're moving past where the
>> ioctls are "simple". Now that we have ynl tools, it has gotten easier to
>> implement properly. It makes extending the API much easier for the
>> future vs the array of ioctls we now carry for legacy implementations.
>>
> 
> That's an interesting direction for future PTP UAPI
> evolution, and ynl does make that path easier than it used
> to be. For this series I've kept to the existing PTP
> userspace API model and extended the current timestamping
> interfaces in a backwards-compatible way; a move to a
> netlink family would be a broader subsystem effort and feels
> separate from this work.

Absolutely. I don't think that should change this patch series. Its just
a thought that we might want to tackle this at some point as the ioctl
interface is clearly reaching its limits.

>>
>> Do you have any thought on how ptp4l synchronizing the clock should
>> impact the clock status here? Is this intended purely for device/drivers
>> which have their own synchronization and not for ones which expose a
>> clock that is synchronized by userspace? Would it make sense to have a
>> mode that is something like "this clock has been modified by userspace"
>> after any call to the .adjtime or .adjfreq is made?
>>
> 
> Regarding a "modified by userspace" mode, I wasn't
> planning to add one. Whether adjtime() or adjfreq() was
> invoked does not by itself describe the current
> synchronization state or quality of the clock. A clock
> disciplined from userspace may still be highly accurate. I'd
> prefer to keep clock_status focused on clock quality
> information that the driver can directly determine rather
> than on how the clock is being controlled.

Makes sense. Leave it up to userspace to coordinate and combine relevant
data from the device/driver and the daemons together. Ok.

>>> @@ -106,7 +350,11 @@ struct ptp_clock_caps {
>>>  	/* Whether the clock supports adjust phase */
>>>  	int adjust_phase;
>>>  	int max_phase_adj; /* Maximum phase adjustment in nanoseconds. */
>>> -	int rsv[11];       /* Reserved for future use. */
>>> +	/* Whether the clock supports extended timestamps with attributes */
>>> +	int extended_attrs;
>>> +	/* Whether the clock supports precise cross-timestamps with attributes */
>>> +	int precise_attrs;
>>> +	int rsv[9];       /* Reserved for future use. */
>>
>> I do kind of wish we had opted for bit flags here given the number of
>> ints being used as booleans.. :( A lot of wasted reserved space.
> 
> Agreed — a flags field would likely have scaled better. I
> followed the existing ptp_clock_caps convention (one int per
> capability) to stay consistent with the current UAPI
> structure rather than mix two styles within the same struct.
> 
> 

Yep, I agree that it is best to stick to the same pattern.

