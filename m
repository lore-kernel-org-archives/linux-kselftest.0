Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642872571C7;
	Thu, 16 Jul 2026 18:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784225242; cv=fail; b=fAZ4WuroqgiSfRG+IY8nXSmhDJrLt3njubH1Hg/BYB2ftHVwbAudoN1arTS5a3oi+INh9rFjijS3Shuu6qSGmCbC9bH1xLpXesy7F2TTuapfZ6Dfawqd5Yy72bGDwbbkoxOpi7OEVxJ96skpHcxKskfZHNIwZjNMLsKGRwxIkLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784225242; c=relaxed/simple;
	bh=znWS1rXk0cbvgGPOR3Tr8ACGTxJzAnLRdm0P60aszCo=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qSDsESycd4wv3kK2EIGecHKgrT4X1FcR4vpu5hsThRmvuKJASjeAVTQ+kOgciznFvS9HlZoAcgVDg496yx3Ql078xGV4/dUXHwf4qOTrHpHe3VVlzavUgvF7oGkYwx4ZHVVHMKSWVEFtE8uw53FWFI+AT7/3KvvZJu/JlYHnFdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gXdP+GwR; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gXdP+GwR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784225242; x=1815761242;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=znWS1rXk0cbvgGPOR3Tr8ACGTxJzAnLRdm0P60aszCo=;
  b=gXdP+GwRFj3cs5rJcg4932zPTDJZDGsVbbzyX0Kg29sMFeHjCFwERt+Y
   H6d1htfYKNR+wgfMuE62fyu24ax5zrVgPaP3/6/xJShzmP4Q6uSBOM14O
   XTVnFSHQT8krX1PLdOVZyCfDq2BQK1MISmewlwf9t485wjSwndJmGXlee
   1eKe7DOttKMSXU9mX/NmooaNYo8PT2l3Hjf1Rjvl6AIcAh4N0WM7pYq4p
   aiTTMjGMaV0wcyPu4EvgmN6a3gz4eP63GmAqdcQYCj91UgBJdiZ3AqZAT
   UNgdpcSWKKeSJiVRMgLzXOqpaSKg3Hyz+AuxtOwHlyeTjhOwJUCyhPNRj
   A==;
X-CSE-ConnectionGUID: rcXUpuWIShGRp0wCRVM69A==
X-CSE-MsgGUID: Qnsl82oZTOOSkDRQIrXSKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="88570929"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="88570929"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 11:07:21 -0700
X-CSE-ConnectionGUID: 9pO8n9yOR02QWqDBoiKzJw==
X-CSE-MsgGUID: tMI4MnyGTA28mtFHYSJcRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="260857207"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 11:07:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 11:07:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 11:07:20 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.16) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 11:07:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=emfKDKPWYQ17dDu6Q7eg7smDIlTT6b7TQJ/INEoTTcSjnq2NA1V9tG0INT891M5cZY9MkE77l5QJ7gLD6Mj96OzhhbhDDIcr7AhTOMXx/nDzaCky9vc8BzVQv43plYDi1B+Jcp5u/tzqhvN/Fhe1XAHUbyNpXHDhMI5C/5tRqH8/JSJO5NeRAT3JyPpan7w81DAaEgrdsh/hc6ojklbvUam0H+6HyZobJiDiRMDcJOGX2FkiLgWn04S23kdjNIFkmvZ8kifFXEXV8e5CoACtwB4qnKfGIqDvu9wfxCeiPLjRWIETEOy7OlgISwy9aX3wlXVyl63XgFruueTI7cSMlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wh3nMmHa31piB/bI65UhfyP3/DD1U8dravdotFD8fXw=;
 b=c1b4NsrxtPMpQXH3TJxAtuj4d2TPA5t2dGWfRGioS1QJ8EWMjEHg/sgLsQdUM2NimRkr1TmX8AVfXS+vWV+Cv+3xMHGwggIE4W4IPwWXNuBlh/9HBoSInkR3x47H7dHIrHg5Toq7YExmakEMNfBnCS1D1ixOZSCm5+3lLnH+5dZI0gjQ8FybpY8kYchs3L7tJ5ygmZt4dm0awnDK38mtoKyWWChsPWxgwrTCJcM++/8UH0lxfA+UDKV590UeUrTLMKRcRDW6wAEGtQRGrfhqX56T6HWCJTceKN4N4SOd11vhyixsolaWNc/EAdckEEfb3N7oF3E4By+eCKtkIrVX7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7381.namprd11.prod.outlook.com (2603:10b6:8:134::14)
 by DS4PPF2D9C959A2.namprd11.prod.outlook.com (2603:10b6:f:fc02::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 18:07:17 +0000
Received: from DS0PR11MB7381.namprd11.prod.outlook.com
 ([fe80::4c39:dfe6:d6dc:6f58]) by DS0PR11MB7381.namprd11.prod.outlook.com
 ([fe80::4c39:dfe6:d6dc:6f58%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 18:07:17 +0000
Message-ID: <1867c1c2-9a78-4519-9446-c675c418a57e@intel.com>
Date: Thu, 16 Jul 2026 11:07:12 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 net-next 7/7] net: ena: Implement gettimexattrs64
 callback for PTP attributes
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
 <20260714020340.25014-8-akiyano@amazon.com>
 <f8974bb1-e27d-480c-8f88-6aea3ef41ad8@intel.com>
 <178418947570.25423.8298339939975321346.b4-reply@b4>
From: Jacob Keller <jacob.e.keller@intel.com>
Content-Language: en-US
In-Reply-To: <178418947570.25423.8298339939975321346.b4-reply@b4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::17) To DS0PR11MB7381.namprd11.prod.outlook.com
 (2603:10b6:8:134::14)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7381:EE_|DS4PPF2D9C959A2:EE_
X-MS-Office365-Filtering-Correlation-Id: c0e34b3a-993b-4f5b-4e54-08dee365126e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|11063799006|3023799007|10067099003|18002099003|22082099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: SPoZ+v03JlV54hp43Gq/xvngtdoESODRKz1CxPb+MSyJQAqYNO/pF+NVcpL5vjHxIYhR8yoGLYEpO31Xe+qlZYUNXLXGY0m6RQEEWWIwefmAU2Upt74Tv1BVKAnxahpZeIT2eCwjsPncJWJG65SgJSmCNuAAUxqCDVatpKoEETyyUnC4+75gYY2wMs+h4obzbi9KZnZlzEJj+K47wAugBJKm5NFyCebfyDkhnb0iT2zaeam+I8OFQwpm+isyN/8roQFQYSViGe3kJD15lvkd18TWqMf4sLVv9DmwXG3mWB9VQZiABwyJZy4FJOrW5YEdkrnlb7qatecJEPsRay8asNulen4LlIGxdOfSoHp0ZrPUpsI0OIVMbnJ8ijv0dTH4nscAt/DV2ml4isXqG4roM7Zjs/atCIqszEKXoEHmSXnlRF/zrpIl6cCmCkHEuI/iW7sJW2O73kCTIWEl+motYY59Wvf+CCiH0sT/EquuDlzYMF6BPVY4rMGY6QY1ONACM9+Oix0Tp6jQ++0kYpe9Xzx/QUC9F8TIPczaGF2l9bEDR0dqt0+T3HrRkHFq7SEaP1hdHsDzkG7T8KLZ+XWU/+JfR/geivxUadaQAXxzI4P1BsMxeN7rClIrIuP+ra6nhsNeNQ/XXlADHYL4qfX+8hGJel1X9lbIopcw7KDpQt4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7381.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(11063799006)(3023799007)(10067099003)(18002099003)(22082099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NC9YcENXZ0dZbXNkWk9ROXFza1M4TEpEeGMzRm5hNy9SZTZuYzhPbjVEZmJt?=
 =?utf-8?B?VWdlRWVWTXFwb0RZb3kzRVE3NFF5SFBZVnl1NmFoMTdIWEt4dGxxcHdTUkpY?=
 =?utf-8?B?R0dJQTJMU3dQYW1qOFAwUXlnYXFpd1FCenhuZG5BaVQ3WVM3aTRYalF2eVFC?=
 =?utf-8?B?NVdtcHZSVUpJSTY0SFF3YVBsQzFlSm9yL3R5dDA3R090L1dkMFVZbVU0WEdL?=
 =?utf-8?B?eTJEOG14eVNEQWNJeDdCYi9kR2p3SjZjeUlLOWRlSmpvcERUSHdIMjViaU9M?=
 =?utf-8?B?dFBIN1F3bldiU2dmWnFlK1VoVVN0VFZKSTZXaWFVUW5lUHBmREZDdlNaeVJH?=
 =?utf-8?B?SUtYa0pxRENIa0k4b1ZDSEZuL1NEMnJ4bkF3NkUvYkxad3U5S0ZDUVErc2Fu?=
 =?utf-8?B?dk9rTzNNNytsZXdtdnNXQjJiWE1mNldCQitieVNlcGJEbDRLRUhNRHM2OUh3?=
 =?utf-8?B?WGtTbXNjcEtCKzZISG1ZaWpOSjVKVEZRenFWOWhqRVNhR2duZ1lqelBZaVAz?=
 =?utf-8?B?MEdaQjhBWUs3bVI2MDdvcXljNzJEcEJtT040eXhjMk9QR1d0emIyVFRleWcr?=
 =?utf-8?B?ODNqdUZMVWZOTFA2V2NUVU5sL2RQaHpVNUxkdnNPTjNJWGdkVmRKWGNiQ3Q2?=
 =?utf-8?B?WWFaSkZ4U2NMSFJNNUhoUWZwN0g5UGlLRjJRVkdaSW50eTc4MXFyR1FpNGtx?=
 =?utf-8?B?Wi9vK1RVRWpITHFqaTFZMWhiRmhwZ2pwQ3hOcFdaOXhzVVZxcVRGeW9XYkxm?=
 =?utf-8?B?emZOeHNIQldLVFdlTHQvOUc1VGRGYWl0eTNkaDdlYVgyVmJ4aXEwamc4Umhr?=
 =?utf-8?B?cU14SUkxS2dudytOV2c5eTllK21COWFEVllzRFJTbGxacHlzWUhweWRXVHdn?=
 =?utf-8?B?cUFtYnNmYzk3bzVmRDNRMisrLzFKc2o3MEp2TFV6MVhCWFhJaXRjVW01SFZL?=
 =?utf-8?B?UTgvdDZzemwxV1hOWVEwcDNXZHN5cWpHODVzU3NZTW40VWtNc2JXVmFwdk1u?=
 =?utf-8?B?cDZHekF6WHgySHdPSGlxWEVlZHljSFZMOVFiUXpuYmhTUC9URzJmbm5Teld0?=
 =?utf-8?B?cjZoampxK2VXZXFRN212NXdoNjJjQzhzTDVJeHNxRUd4aVp5VmcyWUQ2cjc0?=
 =?utf-8?B?dmRkY3hpOTZGWHB6dExjSlVkY012Q0Q0SlN6ZFlTTnJrQmpRbDBRSnFiUm40?=
 =?utf-8?B?M29za2d3dENRaGx6VVhOaUN5NlNnSnZXWmJhRlpjUkdjbDlONGRSSkRKWi8r?=
 =?utf-8?B?NGZ4ZVlka3JNeUlZVW9LWlJndm9EU0NpZ29EdzdrcDVUd3Btc1FDaXk0ZGNE?=
 =?utf-8?B?QjhMM2xnUmNnY3pnQ2tmdUJVM1kvZlNVRCtYUUtQYWwwc0FQRzRYdnlOSGtt?=
 =?utf-8?B?R2ZSdjNCUE1PVG1HUTltMEV1bndUOG5yZ3Awa1YwV2JnajFCMmFkc3NIemVs?=
 =?utf-8?B?VXVvY0JmK2N5eTJpa3lqL0RBYlpJMGg3ZklkZW00OE9hTjJSL3E3ZUx5ZDdo?=
 =?utf-8?B?QWJxejFBMm40ZnE2YUovQ1g1K1JlaGpxaEMwYzE0UzlLdW90WU5RaThhMG1w?=
 =?utf-8?B?U0diaUhVM1M4V3VYNHY5TGl0QjNMU1U4bEpsT3cxR2VzbWdlODAxb05KamNZ?=
 =?utf-8?B?a3o3SktiTkR2K2pzUnBqS2FmYjcwY2RncUh6amV1NkNFT3c4cGNERnc0UDRj?=
 =?utf-8?B?Yk91cGdUOE9wcEdVbW5kMk5tUXFoZmZuRlVicXpCVVgxOWlyZHVCZ0ZhUlVu?=
 =?utf-8?B?WVdsdFFRbnRtMWI3Z1k5VElkRGlFQVlqY2k0M1dEUjZCaHk3L29odnFyVWw0?=
 =?utf-8?B?SDJ5dU9EWXZWS29EWmhiSlJpQUtxVUVJc0ZVZm43SkltRlRhbkU5czUxZncw?=
 =?utf-8?B?R2kvblQxSGVLV3J2aGJ5SUtETHpvZ0tvMzJTZlV0VVdkeHhpa0RqSTZ4alRy?=
 =?utf-8?B?aTJkQjR6alBQYVpaUkw4UjNEMkV0bDFFZlRUT2ppbnVTTjlJZ2cxTXJUaEZG?=
 =?utf-8?B?djdVb1lmWGdHM05iTTZzRE54ektlVzdld0VRc2xnMEdMS0NpTXpTRDc1TGlE?=
 =?utf-8?B?WnUxZ25UUzE2NnYvaGQ1UXZiV2FXeXllN2dhNXpMckNMQjdHUDdzb2tyT2x0?=
 =?utf-8?B?bXltL0N5TUFjQW50ZHNkWkpLUldMSEZobHEvbmZ6c3l6eXVkQ0ltQ0JYckZn?=
 =?utf-8?B?bzV2SjFrSVlRS241T2JGMStDOWpxaXNsU1ZwWUlPOEdxcVMvb3czc1lMV0sv?=
 =?utf-8?B?UnFjT3IwVFZxRmJscnRudXUzbVptdXJpYUw2NFUvT1BwamptMDRlL2NBYVI4?=
 =?utf-8?B?RStYbEtraml0Q1JYb0ZjSXdIUUFNSCszUlpvL1dHVU5EUGJBZ3J1Y1RKc3FM?=
 =?utf-8?Q?WWYLNamziUui3WP8=3D?=
X-Exchange-RoutingPolicyChecked: fQYVAKRnhL59rW0VWHeiAXqGJpI0HVyfAsaUrDEGpdDn9e4PrrZzaJRxQ5lxV+Ca22v/LDAIoejAlSCTNNhGvYo2tMbNgVTolWGB3amcIQe0bcpnT1dDPbXvFwv2CQ5rUkk6oI+UJTz5mrYNJttPlU+IqVKJBEfLTokNGjTxgFCzxIfuiaWfOotnA0Rzhqt1lKbBNRYX6JSua6qfRazroCJW3NyydIUfuTYSJZ54fPyq3SKTQIdA8haqj4EpI0JoJbApUYDiSbGlRh7bPXP+AUarESbvpfRb/y/o1XlJCQp12MApDKDxm4QmRjz9gHBSAbctb59KiduH0+tganQuZQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c0e34b3a-993b-4f5b-4e54-08dee365126e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7381.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 18:07:17.5504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h8Ot8jFZTf/iwneeAXt9qVQBHUGaHGjRPy6NAtSixlXF5pjU9Zxdw7kM4wsOpaWRvBb4s1tGrLr9lNcmaI5Pl+hbnBamdX1JiWCfPLFELKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2D9C959A2
X-OriginatorOrg: intel.com

On 7/16/2026 1:11 AM, Arthur Kiyanovski wrote:
> On 2026-07-14 17:47:35-07:00, Jacob Keller wrote:
>> On 7/13/2026 7:03 PM, Arthur Kiyanovski wrote:
>>
>>> Implement the gettimexattrs64 callback in the ENA driver to support
>>> the PTP_SYS_OFFSET_EXTENDED_ATTRS ioctl.
>>>
>>> This enables applications to retrieve PHC timestamps with quality
>>> attributes through the standard PTP ioctl interface.
>>>
>>> The ENA device currently reports only error_bound (valid bit set).
>>> Other attributes are not reported (valid bits unset).
>>
>> Typically it would be a policy not to introduce new attributes which are
>> not yet used, and add the other attributes once a user appears. However,
>> I think it makes sense to have the full set of desired attributes
>> especially given the ioctl interface limitations which would otherwise
>> require a lot of reserved space or new ioctl numbers. Especially given
>> the uAPI here has been discussed and changed heavily from previous patch
>> iterations.
> 
> Thanks — that matches the reasoning. We defined the full
> attribute set up front because of the ioctl interface
> constraints you describe. The valid bitmask ensures that
> userspace only consumes attributes that a driver explicitly
> reports, while still allowing additional attributes to
> become available in future drivers without further UAPI
> changes.
> 

Yea, I think that makes a lot of sense.
