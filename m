Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5B61DDC2B;
	Thu, 29 Jan 2026 03:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769658139; cv=fail; b=CD86YZFXwOJwBv5W7gz+ZvUqvMtA2mW5U5w7N2pwf8+yzLp6BabB3Owbrywd+klU3ZntXayr1moZPH2nO47DWshRXIrsYaGAR2VerhtvTgTzF5Qt9JgYSvdIjj0hl6PQHjG8lAcF98cKtSsaqdBrYXqvRCKoutK9AA2p/CXhaNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769658139; c=relaxed/simple;
	bh=n26tae0kV6pPSeJFpR+k2fV6xvGCYSbA7dL7YMH7JOw=;
	h=From:Date:To:CC:Message-ID:In-Reply-To:References:Subject:
	 Content-Type:MIME-Version; b=SrW8n2bKIS24ZVdVGUJXne67w4pWdJOk7qBxI95ZqG1R95SA5TUAT5WeX/rnM4taylU2jySg6ozT3L4eZimyMZOQfqp12aRvdx67RG4+GuZnHhC9sPM9IEd8m+/munhjQgJx+PiOqjBsePXnjocI5MIPH1DijDzGA13+9HVTkG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M/HVvI5/; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M/HVvI5/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769658138; x=1801194138;
  h=from:date:to:cc:message-id:in-reply-to:references:
   subject:content-transfer-encoding:mime-version;
  bh=n26tae0kV6pPSeJFpR+k2fV6xvGCYSbA7dL7YMH7JOw=;
  b=M/HVvI5/Knx+hHERRYmDp+fcNAel8qzQV7P2EQVG0DlsoFADsWgUCI4P
   WwleQEQtsEPaNf2JLeivMaYPDCWLPh+Nk5yWsVPhw4KxFs0GQaioN78wN
   0w2u5nbptNAqvrM44ELK/etve1uClHgeBdBXIcmWBUhPJoZ06/Z35VxFj
   Ci9EMZHXYtKENtyNCmSKG6WU0WS0X/VHCZ7WwVLpQVvkaXM4DGfISEpzX
   NLfI7Ds4q+edLtInGm3DOFp8MeSx4xbU8Qll5Kg75TSC8caHV/gtUueQt
   kWPVwawelu6wYz/2wWSwfpRi+63gWLYS/W4EWxeeRxm5urchO/2wutzjw
   w==;
X-CSE-ConnectionGUID: g/zOGqzaTT2PJ2lZowSwvA==
X-CSE-MsgGUID: 5QnC4Ue7Stik6y+M50/DpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="96350574"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="96350574"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 19:42:17 -0800
X-CSE-ConnectionGUID: 5IbOiGZnRfOYcX+8GNQgRA==
X-CSE-MsgGUID: ViawOndXT4qoXVRDsbRLfw==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 19:42:16 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 19:42:15 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 19:42:15 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.52) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 19:42:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A/fp+4Wbsn5lf1u8uv6xLzOLmGzQBo6isWCZT7r/pKxknLB1oa2n++uyqvjpOexlv56F108PiyiC8psI6vOg3Cu9kp7AUR0diFkgKR6WLiKjaiR5MSMjfvaYbHAvYLA97jYAKnEs6OinobWmqMVLNT118ek6fm6LXiCTb0jzwL1lLxfLGHNoOI7TovBd/+7X47vleqb7HxkY/RxpW7YaU/QmUp8D/GdkS62MHELVSBjKPPqFCkaNlDDkS88Sy6n1NUsy0DIM601jA/hrRPLix2Jjcj9T3m25KYqpv+DWYeQycPL4U3fbqKMsmhdTtYujXC+jILCA8gW3BVYISeDhyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJMvhSq/lohcUhDTdtxMmkKgu7s4RxlCNLFa0vw8EyU=;
 b=wtgn0b9+kKTiYqVoYNy8b0JfI9VdztsNgknLcptH9/Pv8XkweQffsM7EtnfJoKElPKbW0lcHmpsB+uR5+QmZbeynj5ecf/LxzTr31PPPIbHE1xCTN2HithGgmaTRb48EySPnfjFP8Gd+OQUDoxvqq4VSgKHGk+pqnc9gDPqvJeF+xOxRQ1tGxG6XnpjlsE5WBSMLTeh9TCavVKf7cWgHB6/G5kUrsIR3+l15wPNF7UbPJlXdweOaF0GpljNs+OevKkqVe5MzGApH1tFspVxFl1WBn9hm3rOkFEUi+jqGBlBxh9uDRdjEd4QtASHk4gDDkvYtc9ipNRMGaT8flqspGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Thu, 29 Jan
 2026 03:42:13 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff%6]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 03:42:13 +0000
From: <dan.j.williams@intel.com>
Date: Wed, 28 Jan 2026 19:42:11 -0800
To: Jason Gunthorpe <jgg@nvidia.com>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>
CC: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Johan Hovold
	<johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Danilo
 Krummrich" <dakr@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>, <linux-doc@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Bartosz
 Golaszewski" <brgl@kernel.org>
Message-ID: <697ad713ea124_3095100ee@dwillia2-mobl4.notmuch>
In-Reply-To: <20260129012322.GC2223369@nvidia.com>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
 <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
 <CAESzEGiA2DSp79pkjxBA5X-DWmSAAgyAF7usKn253jkGpYJMew@mail.gmail.com>
 <20260127235232.GS1134360@nvidia.com>
 <20260129010822.GA3310904@killaraus>
 <20260129012322.GC2223369@nvidia.com>
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0071.prod.exchangelabs.com (2603:10b6:a03:94::48)
 To PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|CH3PR11MB8706:EE_
X-MS-Office365-Filtering-Correlation-Id: 96117ffa-bcba-4919-4a19-08de5ee863fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|18082099003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3lPZFYvbU1oaHc2L2N3VkFrNUhlWnZPODROdnJuZVJFbllGZHQrRTdZRnZq?=
 =?utf-8?B?cGhHbkpWV0t0dVNtcCtaVXgwaklSMjZVOEppTnJhMy9uWWNXdlBxRWdtR1Mz?=
 =?utf-8?B?NWpJS0VtczhGTE5WQU00SHZqbEpEM0JFL3hUZWJqcUcvdW9aamFqQS9jOFpj?=
 =?utf-8?B?VlFiME9XOUsvKzZrY0FxVFNRV0NYcTJHRnFHZFB4aytLeEpRamQwVEp0cFNG?=
 =?utf-8?B?bUJyeEhnV1IweUZmVkhvQmZpQ1BsUDMzUnJSMlZrRnZLMkZBTHBTLy9BYi9G?=
 =?utf-8?B?QlJFNmlHL3lSMVBSR3p3ZlMyY3FsYTZEb0dYV2l1OEZybUxnZnFpeTRBMlM3?=
 =?utf-8?B?dnU4R1RzZlliSjFXQjJYemFaTXE0cW5neHJkVHk5eVNZdXJhY29sc01vUjhK?=
 =?utf-8?B?RU04dXJtTlM1ZE9aTVdGMk5IbHdzQzNlODFzMEZrbnQ0Nm9IVVNyOUFibXR6?=
 =?utf-8?B?bEtyaXN2WlBVdnVwSWlxcEY5MjZoNGFvNEc5MnFPampqOEM4Ymx6VGlVWkdJ?=
 =?utf-8?B?cHNnaEhTa0xFWldQME5nT1BqbWFGQytRR1pDaUJHb0VUL0tmY014eXRaZDh6?=
 =?utf-8?B?Zjc1SVY4WWRCb2Jmam9Wbll4cm14bVBxdFU5Q1ZiM1ViNDVmaVBxbnRpN1Br?=
 =?utf-8?B?S0pCajUxblBLVVM3SitVbjFiMTlVVjExQW1DVDY4WlhZVWZ2Nm94R0xYVk1W?=
 =?utf-8?B?RVRpdEhYSTk2SjZqZ1JMOUgvejUwTFp3NVM4ZFdhM2VHcmFZMTlCcFdVTUxO?=
 =?utf-8?B?Skh3MjV5MTFMdW5CTG5ub2c0dkNBdGt1ZlZkeW1QaEhVaVNjcC84eW1wbHgx?=
 =?utf-8?B?eTRTTUpETFhjOE1ZT1NFa0ZoenpRZW9rVG13UUFkMlUwdkFoUnZYSjl1Qnd4?=
 =?utf-8?B?ZjlMbnRmTVVUWEREWTZzaEFUUFRNQU82MlFUWS93Vm9jRjA0bUxGbzZJLzZt?=
 =?utf-8?B?MWxGWGt5U29DMVllWnVIdFh5VmMyTWdhYitpOERTQWloOVdNcnJWYVZ3NkFq?=
 =?utf-8?B?VzVMOTcrQUlNcGpqRTJpN1NtL2dvUHN5ZXZacTNmWlJRNEpmd1BmcDhMMW1B?=
 =?utf-8?B?TlJBV1c5QjZoS0s5aEp3UDZqd3AyNXJCRGtvbHBOa2l6dVpUUDNrMzdrTEYz?=
 =?utf-8?B?K29ZLzdKZUFMclRqVmZreU5vb2pUaXlYaUQ2RCtwZVhVQ2hNUjIwNW5FWmgx?=
 =?utf-8?B?YzJ1SU94S0dyaVJud3FCVVBrRGZrcWlRYUZKeHYzU0FIMnc1QlJHeEJrQnM2?=
 =?utf-8?B?Vk9GSWliV09LRzdpZUhQNnNpQVRRWllFT1AvZk9DeGVBQUEwaE1aeUpIVGNK?=
 =?utf-8?B?MVdGNmhHUFFlOTlxUmJQS2s2VjN6YWwvYkdYUHhETFEvSnlhWXVLWnJUTEtJ?=
 =?utf-8?B?b1I0SXgvQTNQUVNlS3FUTGtzQllva05lSXhwb0ZJVldOZ3JjWE9rWEtDa2pm?=
 =?utf-8?B?WlhzejNjaUtGMXBwVXJ6S0FQQ3gvRGJVRWtyK3h4blhZbmZmbzhEY2V4dk5j?=
 =?utf-8?B?QWFFQkI4UStScGUvYU82b2N2V1ZqVjJGeUYrRXk1WXFwSEpya0txZUYwU1I3?=
 =?utf-8?B?L2l0SjFmLytqTjQxb2lCcjV0L1U4RFltV0ZUVFBpRS9LOG5tdnZBY2RISnZ6?=
 =?utf-8?B?ZXF2SUlVdjhGbXBXSWdPNDl5S2QzbjdGQkpjYU1kV1Uya1IvMDVxck0vWmph?=
 =?utf-8?B?aFd3cTdYaTU5Sm1pMU9hbU5vcHg3R3o5QlU4aG4vYitMS2VueUZvdVNLSG1o?=
 =?utf-8?B?Szc1dGljdlN2RFFUcnJaS3ZvRHVOb2pyUHpTS0pJQm10VERza1Zyd0RoWVNp?=
 =?utf-8?B?MWNVWmU2WDNxWVorb1B4WjZUbE9UaEMvREk1QUdCK2dNbnlaN0dwcG53NWpN?=
 =?utf-8?B?dUdYY3Z4OXFyR1dQMlVya0dpV2U2dkFmK3Y0NkVVSWRDVnM5eTB1N1BueVFI?=
 =?utf-8?B?Qjl2WFIvSnN6bTBJdmRyaTBYd2tYUnc0MmQrNFhqNGlrQXNscDdnSk5CNFNJ?=
 =?utf-8?B?ZXVYZ3BsaDBMTFhxeUF5VmEyNUllUThIeVFURlE5VXhxZFZsZ3gxZkZEalUv?=
 =?utf-8?B?b1g4QlJJbkltWlN0SGtpTXBteVg3akdmNWVtKzl0YUtnTzFGcm0zOHBNbEw2?=
 =?utf-8?Q?imHg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(18082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVlrMEpZWUsrSmF1M1gwbm95Tm1yWmY4bkxwa2FUS0ZVV0hOZ2N4TnJGSjhm?=
 =?utf-8?B?SGhxMGpidUN1bVdDRy9NWWR4cDBvWTlvYnpDaXpqTnhvS1pNa1NoWkNlQU90?=
 =?utf-8?B?emxwc0tkbk9DSnY0REQ1Q1JUN2Z0YW1rbitpZU9tSGJodU1nSkV6WmIyeWVN?=
 =?utf-8?B?N3B4MFZBMjJvUWkva2t3aFJnQTJpUVhOdmg4VEhHYTR4QWNIcllYcWtmUGFk?=
 =?utf-8?B?ZHAwVXZXTXNnMFkzVk4zTUZzNmJ5bFR6dkI3aDk3MGp1TEtVTXpvZS94M1NE?=
 =?utf-8?B?bmU0enRIcGJFekNqV1ZweWdETm9Relc5T0hQTm1WNUJCRFVQSFV0R1Q3b1pO?=
 =?utf-8?B?cVJ2Rk5kdjZreXBHc0NYdzNGTWw5VmoyNUZubHhMUkxPQ2RwVm91RXo4TkIz?=
 =?utf-8?B?dG1zbmRxWWhLekluSHVDUDQ2RWxqd2Zzd1dqM2licUtQWE12Q2Iyek0zVnBV?=
 =?utf-8?B?RElSWlJUVy9POGRHN0Z6TXVYMUJLbnNJM05abG5BZ1d6ZndmalZLK2d1VWNL?=
 =?utf-8?B?eGkwaENoNFl2WE5jN0NYTElkK0RuV0l4NnJRTkFlTmV5dy9ETmRMc2drbEU2?=
 =?utf-8?B?Q2IwdFp4aDJ5MlM5QVBWM0FFWFVvVUVncmdhOUg1TmpkY0szYk9HT0YxSDVz?=
 =?utf-8?B?N2lPUnNTdFhwL2YzV2ZrRzF6YVhQWHJVR0hPWTBneWtrMk1sVVRkNFNmUThw?=
 =?utf-8?B?Zzh0QVpoSUtRekZlcldQNEwwdXBXbVEyNWd5cGx3NVNhRG80MU8wZk9uNE4y?=
 =?utf-8?B?Z1NZRkpGTEFHS3padXVOUXpZQ2kydzUxQUkzRVBQSk9GT1M1ajU2T21FY3NC?=
 =?utf-8?B?cWFnUFl2T1FoSk10Y2RxbytUS0oxYlFmdUs1VFY5ZU9PMURZK0MzMitLeDRz?=
 =?utf-8?B?QUQrcXJwdEl0aUc1WTZHQTcwU0Q3OVlxZUsxbWVFRnZQZUNCazMxM2Y1RUVK?=
 =?utf-8?B?TzhUQXU5dlBxdXlrZXlhekVYZFc3Y21CVjBoaDR2WWYxTnhDcmRyeXN6WlNM?=
 =?utf-8?B?TUppL3F5THU5QWsxcTE0RC9lUFZralpxbUlaYUcvanZGN2tzdnFOM2lZQzQv?=
 =?utf-8?B?T2kvR2ZyeUt6VlN4VHVPbHM1M2NCTHQvRkRyb1E2WU5VdXREblJkMWxwQUgw?=
 =?utf-8?B?ams2OG84TVNJNVV2cllLMzkyZkFWdk1BUDJiSzRxdWFadTVVWTJpTWxPMnEr?=
 =?utf-8?B?Z05KQnVrWlBWZ1VSQlBzNHVkVzlJOHFvYlYvZFN0NHIyZGZramF1Y3d3Snh0?=
 =?utf-8?B?aW45bEdPd29tVXZuK1N0NDdiRzhQSC9iNWExVWpkVlcwTVdPK005QmVra2VF?=
 =?utf-8?B?dVlXS3RMNTNsTWFORUR0bGJTZGRLb0M1aDRwa3RPaFdKNlRHRG1nYUg1OC9M?=
 =?utf-8?B?MkUrbnRuSzZmeEI3d2ZGNzlXTTd3OEh6cWRnYmZRdVZPcjE4ZXBiK0xBV29L?=
 =?utf-8?B?SGZicC94eGlTZnZKZnRDcEloTjBKUURaQ3VsbWp6elJtODY2ZUs1L1BWck5n?=
 =?utf-8?B?YTdsK1V3bExWN3JXblpIem1BS2pWb0xJSFhHdmNSQ0FTMUQ1TUE3Y2FWeEcw?=
 =?utf-8?B?OHVrSk1OZEYzanZGSVVSa2dDZDJzbjVnYm5McW1xTU5MR3F4c0lLNUFDYjl6?=
 =?utf-8?B?WGNxTHJLNHdlM3VPN21DN2trbVlZMWJEKzgvODVIYWwzK25ONHhMaVdCR1pr?=
 =?utf-8?B?UU9aN3lJcHdnSFBhSWwwRWg5Q25uSE9SWTdHdmJJRWpoM2Y5bmFkVDlWbC9r?=
 =?utf-8?B?YjRvdTZDSXdpVzM1OXVGd2lRbG42SVI2MUgwN1V4Z25KK0FhS1E4d2twekxT?=
 =?utf-8?B?aGpsUzdvaUhTNEFhYjkwdzBXcldFbUROcHY4VXFYUUt4RzZsWlZPL0dlRzVo?=
 =?utf-8?B?RSttRkNGdjFrYUVkdGNxTjErZFJzM2lIaWx5NFc5ZFRkZzFtYkFIYnFKelJv?=
 =?utf-8?B?djFpblZMeGFrczE5bGhXMGhZcVhJcjhiU1NiaStTeG5lbmVyNUZ6QzFVTC9u?=
 =?utf-8?B?RzdIbENQNDdUMm1IQytsanJaQ0ZudElOZ1BTaHo5aTJFZWliNlNJVEY1bkVT?=
 =?utf-8?B?amhETnQzeUhlbVFPQkhDL2swNHpuZ1E0OGt4cVRwWEJubnZyL2lNcmx1U1RZ?=
 =?utf-8?B?cHRTM3R2TXltWmx3VEZ2QWtFWFF3QWR3anE5Uk1LM01Bc0Y4QUp1QmpPeDBN?=
 =?utf-8?B?T0krKytYYUFRK1V0N0VjQzlPMzFhaE1lR2N4d1E3dGp4czE5cGZSeGxxZnJH?=
 =?utf-8?B?UzBYNCtPU2h3Z3dtS2tObFhJNDIvbUhWR1drU2Y4SWo1VUtxS1YxYnI4aC8r?=
 =?utf-8?B?cUFYcW1qck9kUjRyUEoySU1PdHZnb2Rqc0EyQXkraC9mOU4xU2VZWUZOdHhl?=
 =?utf-8?Q?egBtkGbS7yIe3UqE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96117ffa-bcba-4919-4a19-08de5ee863fd
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 03:42:13.7104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ScIQw5rROk4z9HgfXc4IE9aMmN0oyiixqHZJ1uFexZa1bNCJOYvSNTXVeaxDN5qBaK0A77GKaPaD1GWZoIm1MXmNMm0oV0uyCdO4YxFJkBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8706
X-OriginatorOrg: intel.com

Jason Gunthorpe wrote:
> On Thu, Jan 29, 2026 at 03:08:22AM +0200, Laurent Pinchart wrote:
> > > The latter already have robust schemes to help the driver shutdown and
> > > end the concurrent operations. ie cancel_work_sync(),
> > > del_timer_sync(), free_irq(), and *notifier_unregister().
> > 
> > One a side note, devm_request_irq() is another of the devm_* helpers
> > that cause race conditions, as interrupt handlers can run right after
> > .remove() returns, which drivers will most likely not handle correctly.
> 
> Yes! You *cannot* intermix devm and non-devm approaches without
> creating very subtle bugs exactly like this. If your subsystem does
> not provide a "devm register" helper its drivers shouldn't use devm.

I wonder if we should have a proactive debug mode that checks for
idiomatic devres usage and flags:

- registering devres actions while the driver is detached
- registering devres actions for a device with a driver that has a
  .remove() method
- passing a devres allocation to a kobject API
- invoking devres release actions from a kobject release API
