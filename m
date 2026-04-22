Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898484C6C;
	Wed, 22 Apr 2026 18:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776883019; cv=fail; b=bJOo39jCDv0JpR9xtBhCD+9GPuCfzHI28SfUou2vOhGiJSmd1cGOaUJ/J7W5B/U9Tvp1Wv7Pf2cVeKzkL4jhgO8vac8gRHdlXVtXaO53XCIZGH1CpPNnJQieuaueAjaFwCrMQ+DeUU40S1u7gOpCqyO583DBFCdYfeVpiN0HniM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776883019; c=relaxed/simple;
	bh=B0ZVWDcljAhq/gU9L2o8v5EvlCroqqWwG5iUe7zAm1Q=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Fr0GWd65kahKX4Nou5YWA7JHW4NEyVpGm6nC2l4FPB2ucn3ETOyf8PIWPFcP1QIp9pznzbZ2iAr4nNV6edQCFF7ENqj8w17YaXi1VHLg0njrr7v4OmAS5dSG2yPj6DbtN0+UFEuukMgD3PoArWXnFB4WhkSGnuA1F84rXnNCuD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uo2V+ATg; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uo2V+ATg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776883018; x=1808419018;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=B0ZVWDcljAhq/gU9L2o8v5EvlCroqqWwG5iUe7zAm1Q=;
  b=Uo2V+ATgIEyKbWjFTb9g/tN3qrE9MbHD6GShE0KqPM+vClZ/hWr7e4qD
   awAu5OY3b+iCeywmcMdcNiBAUMao78ge+puNcAmIiJJ8h8SyFmwlg/TBW
   WlT+jgrtAlRJJZkmwdnS2aEuPzN3tmuTxm52Ol69rDEc/R4ayUYuCWlDO
   BI/1XMAToOKLQY4ww3mME47x7KwsrPrceaMrLnMXSPxy+VM7DiHrUuVJc
   kXTyv0H7bhVlDJ5PLK3V9Fa1h3P8ENNx8O6zSb+U1XvAPR4dt9PwvszuC
   AhRGpnU8kz+lYSbxK5GbO+Meb+s3Z/sZDzX9rglCvojAa+irgjCy3mxMT
   g==;
X-CSE-ConnectionGUID: HnghA/41TQqEKKYHkaZByA==
X-CSE-MsgGUID: SzUEb9jnQ3inZ6da+HW0ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="65380346"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="65380346"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 11:36:57 -0700
X-CSE-ConnectionGUID: ajRdqWlcQMmcXjBH5qV1tg==
X-CSE-MsgGUID: iZjd9HbhSBGirX+q3sE5AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="229249408"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 11:36:57 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 11:36:56 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 22 Apr 2026 11:36:56 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.49) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 11:36:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c4PPiuxRAvLbPl+UBaHa8egCoOpRNwKp5t6vZiXAr1Q9aLARB+r2bVOMBCHlTMgj/mOHBjPV8tfk7leUbkmUtRCPrZakL8LgG62KKDt4SNYKMiidDjKOrksQuwnBdABEfC4Hwvvqm/IsmyVEz2kgq7Ccmr+dC9P5gmBi3hrwU0l02mBEuHMUjjZuYIapC/h6jtfikgu1zcOxR/PyZmd6BGMnbB80dSdUnsTIe7DA4P0uLu8ZIK2uUfVOsUdlmd6afop4rs4eqLUN11+N9Z4pT2wyVTssTrXNsVaAP4CJzWSA0CffCrBE3vKFfu9xVekv/wvpa20t1ej7mTL4fq8Abw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qFcOz4QA68E93C9r0kw1ZwV9TIRApPeqmdIfVlA82h4=;
 b=n/Dc9bSeRE7Sg4IVqauTCLTexzh1xVG92EsayMVOUpS/KIc7WeAlCXF2cHDE4SyMBCEfdDazrnwMw5TpEGt/BSnv06W3VDm5Ve1d+SXNAY4giK4+cCGezOArfpsEwQBfnlRDbnW9I8Wvuy1DHnHBO3HTLjsDmiaLqn4QCq1iVY8Ux/L5J1qnBxa2dC1qp5H4nJ6E+1wXzY9I1IN7WlJpsVisnIhA5AbkoYjQcy4pEwhP9nljRPOw3KdlUJ498Lu5A7fNUnSKTDqOlZPTmvxAye5FPam78ldluvyDOKbeSzinE0urdiRGwyb1GdtR4FpKhFBQuY17v+aAcNbT5zoo9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3282.namprd11.prod.outlook.com (2603:10b6:208:6a::32)
 by CH3PR11MB7842.namprd11.prod.outlook.com (2603:10b6:610:128::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 18:36:49 +0000
Received: from BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19]) by BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19%4]) with mapi id 15.20.9846.019; Wed, 22 Apr 2026
 18:36:49 +0000
Date: Wed, 22 Apr 2026 20:36:40 +0200
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: Sohil Mehta <sohil.mehta@intel.com>
CC: Maciej Wieczor-Retman <m.wieczorretman@pm.me>, <peterz@infradead.org>,
	<ryan.roberts@arm.com>, <ilpo.jarvinen@linux.intel.com>, <jgross@suse.com>,
	<morbo@google.com>, <mingo@redhat.com>, <ljs@kernel.org>,
	<nathan@kernel.org>, <shuah@kernel.org>, <akpm@linux-foundation.org>,
	<james.morse@arm.com>, <oleg@redhat.com>, <houwenlong.hwl@antgroup.com>,
	<xin@zytor.com>, <justinstitt@google.com>, <seanjc@google.com>,
	<hpa@zytor.com>, <perry.yuan@amd.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <tglx@kernel.org>,
	<nick.desaulniers+lkml@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <llvm@lists.linux.dev>, <x86@kernel.org>
Subject: Re: [PATCH v6 3/3] selftests/lam: Update LAM tag width and cleanup
 names
Message-ID: <aekU347Q78kEWkN4@wieczorr-mobl1.localdomain>
References: <cover.1775813245.git.m.wieczorretman@pm.me>
 <20687a8abed771847a4056e64aedbc073076d477.1775813245.git.m.wieczorretman@pm.me>
 <kCxy2FwmupTPQlbhfo2GM81mrAF1mi-lgOjEF-tcakXzhdbAWOI4m80BCUzktEG8oGESJKzrQ6aFnGifpHNlrg==@protonmail.internalid>
 <2e3c3288-4a82-4803-a0ad-5b931041a54c@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2e3c3288-4a82-4803-a0ad-5b931041a54c@intel.com>
X-ClientProxiedBy: DU6P191CA0043.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53f::29) To BL0PR11MB3282.namprd11.prod.outlook.com
 (2603:10b6:208:6a::32)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3282:EE_|CH3PR11MB7842:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f5d1b31-00e0-4ab0-a1a1-08dea09e1d9c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: Cz2+zyoKpEFIj3g6V5MzLKPp4SllXqCqRZz4rinVwpQFiNj8wpoSTgi8tIGZCRLKGCS2yJgJbfXzIbEYW7NgQF1XSLsSRhxjE6glTqCHvLyVEY6DaKmGgQRxOl9wzfeTE/SaDYiuDr+NpU6a1S8i2p2U8TAWJ6f7k0yLbbVK2SxVzjmq96EJpFTGGkHDbr7qZATy2Slh3tPN67wH7qtKFbWcD3HXNRxoy/ckClLVvmfTU8CuBkBTQ1So9GLeC5PZK6QygrTZ7IIollDy2c8OflTwvw5qAcjmHV5+BZzUkvgyP9DjwjctyD/hf2QOZKon9qbfd5v7KOak6fCrOGUkh6Sd9LunlJkVm2ELxXRQt/+lGBQfTr54os8DZpQHRrH+tb1S8xcvBUb1kqxNCVfO/iQqs2cH6YTv0TaZsqMXvYM+Uu43DCjw27V+0cvjpJ76hp8mCMJHJyFtvNGKAufh8ye5KJ334v9jlX2jvpbDNNJZ+xjuwXrWPcPOs8zegE+JPkhBM6b6K14xAEAGtdUtNhbKxPRLR1mIHItX6tHdu6nb7kG1YSEBFkb8G+6RT7Yd5hEFlpQBQ5KTasOEqpJEhjBUYqtP/bkClzojoPlX+iwOjiWPlepRVyFq5ZVwPFUzzQFoZc6QRxZ8Lx3rLGrdPIfRvxKjw+xMo3gmSoH5/xdH9dJsQl0etUWT9shUMczvDqNnl/LNzlR8uwVTjXs7sstsPi+h1wf9/frQnxxa2eE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3282.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?gPemm5WP6uYsYB5k9rTBJkbJL+jnP3CE+mKG7TPt39iK5t1+8i3ocUunf6?=
 =?iso-8859-1?Q?tc4BTmRRIRLg3l5Nd+FzzzHSeuAEOFkwSuWPbuBXgDE5YlDQgEAbfu8s/y?=
 =?iso-8859-1?Q?pbAYlNT7xU83FLWF1bncsRe0rXQhDJwpkTpjCPb/DtZ8gKloD5yqzmVRmR?=
 =?iso-8859-1?Q?Hrj1IrxkK7mpuZdEPWQ2TCbmqOKjjZZOjH2R5koSjpmKNlHPUL6QD8WiHe?=
 =?iso-8859-1?Q?DZEH3Jb6XNWdzMvp+92hPZzCG3OYml4zkejaAI7UEcmWNzSaIrkmsktWp3?=
 =?iso-8859-1?Q?NQ9yxC4UN6ZA684366KvdZzZTVQIwdEDfARlHE/5rsjN5bSoxsiElfbYw3?=
 =?iso-8859-1?Q?ZLFrDS4tFnZGMQM88h1juaTo87oNHkOt/YQ/by3Ob2mXx4Fqxz86RyFYAL?=
 =?iso-8859-1?Q?nqIUaasz1BbIWEIRf/lB83szpzjDSMIVbEwWURRNmhR7JNYKmnTFOCbEZf?=
 =?iso-8859-1?Q?czh+Sg1LwcuKVTPyFojJXBMUOqBb+tWIEq0kr5Y4cVX39vKtZJhKEIwXP0?=
 =?iso-8859-1?Q?lF7lSv6WNJKJ7kvzs54scJpK48M8twl6GFY7GTjju22mZL4+cGQfmFeB6Q?=
 =?iso-8859-1?Q?GuMZo1+HQZcV7pqt+p1mP/Q2rYFGIyy4Vpos/m8T7Df+9rd9nRnCmOpCAV?=
 =?iso-8859-1?Q?DgZpd/ggfg705s27TJYUO0npu0anA8RK6GCRu6huTRuOIRpGEXUoidesZL?=
 =?iso-8859-1?Q?tDVJJm/gCq3NsUl1kio/E4ZT7IO9JUV5Sft/odmlFacRJVMEo3vMHPd+39?=
 =?iso-8859-1?Q?VLdx4PhCN5f7s8G5jD/39WrUxzXVX+ISI5OpJd+asBYBz0TAMwsX3f30AI?=
 =?iso-8859-1?Q?ZCm7HzMEVsxdVYmDUClQeflAusAYnCoKu5nhZ8lgWU7GrhmH8Eh6d2Ak4R?=
 =?iso-8859-1?Q?TnMARrmbXPt6I1JotPyPH3o7HPzsQqr7by8IlCEkL86OuqPMUAkKXCvie8?=
 =?iso-8859-1?Q?mCK5vBkw3ZwySp9rq3A6aCein+Yy83WrpLHp4AqLNpyWQGFbKXKXsbxfwB?=
 =?iso-8859-1?Q?alHElbKNAT+cgeddgj7o6nKjmosvs36nOkEszsh0BHX4ma2LNN0IZ6bL9Y?=
 =?iso-8859-1?Q?2Z0NlUlQO4cI9r2JzUUiV82ztylv16vIbYlzmHbma8OD+QeIsHjlALklHv?=
 =?iso-8859-1?Q?J0HLJQRWi9NbDayp2AV7CLbV2Q2Vb98j6IhBtF0J3Z5LXXeNLFIXcu575h?=
 =?iso-8859-1?Q?KnZxGGRYHQ1/x9v1ZXaA4/9xT+c62UIcQ4PxqmxKeUlHD5N3g1i53Lzuya?=
 =?iso-8859-1?Q?3VYeI2qsVpEx7TQB9PrpcYOEVOT+xVecln8UBt0qQHdCV83VSB5cWAGlDN?=
 =?iso-8859-1?Q?9qbfcHkgujI0HTpEhPUb8U+z4z8Xo/GDIXO5xIvV0oU5m8z1iTlpq4f+kg?=
 =?iso-8859-1?Q?tNdZ0FIrYhSo/pVHIe1ry9ow7JSN4d9OIGiXi/MyQKdgfSUSu/DhPRZxGN?=
 =?iso-8859-1?Q?qwOPWsyZ+lxJLaANX4vDS4ykuSlwsC/UdUemEFFZ95hoIb4XsAhK502YiP?=
 =?iso-8859-1?Q?f1qsPCpMyzh01RjLdHsf9JWF1b7ajmw+j7F731j858qfjGCIePn6P/0mk3?=
 =?iso-8859-1?Q?QJdcU3O2n03C8WOpOIv59Cj3mi/8cgjS0lP5tNrm8GvebEcwy0HVznhdp1?=
 =?iso-8859-1?Q?hc1XBDvFf6PduZ1m8ww+GtLcq4rlmcg+svZBsYaSeS/AjILauIj8g9kHWD?=
 =?iso-8859-1?Q?AdDidZ1sJA+0GSkieBWrXchhGbV2MIkxsZZf5p4vwAgN3ynNJiuaCcT0TU?=
 =?iso-8859-1?Q?s6oa6pZSqUatbYDFzIg9bAsDcHYrqAv2lltc+IYheelLiXlHXViPH+l5mb?=
 =?iso-8859-1?Q?5adiIOGnUowIcHdvJG0kPFJZEoEa28i5xAcSVUJokDCgIH57VnOz?=
X-Exchange-RoutingPolicyChecked: JBWtDzprtXaSUOUgyo8cvwaUSZIe+KOBtG2K7l4jGyqADgm85xk/OtPCGGgjkqIJwAUaQtVypIumoI5/xD3RxYZ3qyo8MuZ4f+AMYNDiQLmGih0hplWLbIPCbHoYI2F4ePIqHK+gX6hY06dK4HHtkxE3S6QcyAmmgOY9TNryyxoxzMnxY7Uu72bztYF1ezcCdrt2R672AilWoD7YAMGmPT0FH2iM/CNRCFmQe6Xu27wclF8Od+r/6qHUWvubgtfW/Ib/YJvJb+bzNLM+LuSTSHYREtt1a/6iPZ4NAxoGvmff2t5Q6ek6+VVNQ4miLjt5/YXk1m/vJ3d3YWmtAk0GFg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f5d1b31-00e0-4ab0-a1a1-08dea09e1d9c
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 18:36:49.7742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6kX+GUDlzv0eLHmaI4sCb585Q3Zpju1Sd7Kzk0qpyikFEZwpddeOAjmWtD3/RUIZeiXILGIPoT3hWXNWTRT/oYrPV0lD8rVmk3o/UIwAsc4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7842
X-OriginatorOrg: intel.com

On 2026-04-22 at 11:11:26 -0700, Sohil Mehta wrote:
>On 4/10/2026 2:55 AM, Maciej Wieczor-Retman wrote:
>> diff --git a/tools/testing/selftests/x86/lam.c b/tools/testing/selftests/x86/lam.c
>> index 1919fa6daec0..f14600e74d8c 100644
>> --- a/tools/testing/selftests/x86/lam.c
>> +++ b/tools/testing/selftests/x86/lam.c
>> @@ -24,11 +24,15 @@
>>  # error This test is 64-bit only
>>  #endif
>>
>> +#define GENMASK(h, l) (((~0UL) << (l)) & (~0UL >> (__BITS_PER_LONG - 1 - (h))))
>> +
>
>
>Did you run into any problem when including linux/bits.h? It would be
>preferable to avoid redefining generic macros. I see the GENMASK defines
>in tools/include/linux/bits.h and include/uapi/linux/bits.h.

Yeah, including it breaks something else in some other header that's included.

>If you are running into issues with the x86 selftests header includes,
>the uapi one should be safe to use.
>
>You probably just need:
>#define GENMASK(h, l)		__GENMASK(h, l)

Okay, that is a better way, thanks :)

>
>>  /* LAM modes, these definitions were copied from kernel code */
>>  #define LAM_NONE                0
>> -#define LAM_U57_BITS            6
>> +#define LAM_TAG_BITS		4
>> +#define LAM_LS_BIT		57
>> +#define LAM_MS_BIT		(LAM_LS_BIT + LAM_TAG_BITS - 1) /* 60 */
>> +#define LAM_UNTAG_MASK		~GENMASK(LAM_MS_BIT, LAM_LS_BIT)
>>
>
>Same comment as patch 1:
>#define LAM_UNTAG_MASK		~GENMASK(60, 57)

Sure.

>
>
>> -#define LAM_U57_MASK            (0x3fULL << 57)
>>  /* arch prctl for LAM */
>>  #define ARCH_GET_UNTAG_MASK     0x4001
>>  #define ARCH_ENABLE_TAGGED_ADDR 0x4002
>> @@ -51,8 +55,8 @@
>>  #define GET_USER_KERNEL         3
>
>The rest of the patch looks fine.
>
>With the above addressed,
>
>Reviewed-by: Sohil Mehta <sohil.mehta@intel.com>

Thanks!

-- 
Kind regards
Maciej Wieczór-Retman
