Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793213145;
	b=roeuYDss7DequGV6mms5t8TxtSipdJUBmxqr0LBow5NP16iC2UEHpkF0ykNG43ErCZvr
	 8yikzH/zSBB/+A80JfyH35zP26epiXqJ5q/3PiqCyHn0gRSZI4obo1Dfw5ypyc/67U6hG
	 83OJCTzue1ELysRoQsxEqT36clnJnfDXDnyDbhvJYZrLGF1UPQhkgzkWqcI1M6EMujC0s
	 H4cOsw220XfT8eGgdDvWD2cp8zooieQIVbBKXg8cBu5ovXTmBYwtejF3ghwirKpCvT4qL
	 Fg+PJLu6em/Rm+EJkF/yeW3lYykPLl2boPQ0uusYK7iE0UPi0nCEu+WrLGAsyQux/Jw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793213145;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=V2Lw/IdD+1gtiumLvVHdflsk0jhXZcGiHz+yvzkZg08=;
	b=SnQGlUo3O8zuXzqBR+kQnPC9kVmLSfSmw0eognsCPKcAIFZjKlNW2ESnJcBG328eWbej
	 71jx4S6Raar5urIJJPiA451vwJa+inaX3d7S4IykDxCsFnEAByrJGdZxPy+71IoEpW0aJ
	 rKAH0D2zWZIC4DDKoItsOuwT3Ed1g/XfXr7LwEbPXR7xqCgatMaKivzBqXkJJbzoSLdKt
	 RL+QHhHA59f8HzhnACLcghBo3Um1jDkvZ3k0EbMSfEW1tQSbtxWjFH0RE3GMOrmxxkTCU
	 gVPQeFNe0xvOJzN9odq1rep1sdo/UrVZZDYv1FE69oPpdMmbRoqwD25UN7uqHZSMW5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qa3do1mc;
	arc=fail smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6BE606A327;
	Wed, 28 Oct 2026 18:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B6BE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qa3do1mc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793213145; x=1824749145;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=D+IhyGPbt/CXxmjexfOL2UgjyXrmT9vWyaqciHlH8Mw=;
  b=Qa3do1mcU8w0z7zcLDMEY5ltpJYaLXk8wrndcMB0rhsmJOOJiacTki2o
   VAyr2UZv3juzEF34N2wUdF03I85rKi+4spwbC4iH1yVmuoB15ulYzx0nS
   x90lqquNjW+CBv+tcXjm/caTVkXt41BeZ9MKNKJ3vMsJBcQJ8B2ERVZnt
   EMyNoRdUdORM7d7RbfgeHXKWPdbzbXrgRcOO5LlABXNVVr2oAOHQBUsrf
   VJxntn6/W7NfgMuFHiGmYnbEiy5slSa0yP/rA5RJ0jFLBjzCjNaXSthw6
   i9HTLT1HsSOGgyvLNpIM3lC1ah8SFMID/ZfESyFt+mfRxCU/tpWmbY3ov
   Q==;
X-CSE-ConnectionGUID: Ch2OqoDkRpev2eTnEkPjmA==
X-CSE-MsgGUID: 4UhOxOCwQKuid8JwQ0NDoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1936007"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1936007"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 11:45:44 -0700
X-CSE-ConnectionGUID: p1IzqA4RTr24+3ce8kuW8g==
X-CSE-MsgGUID: 0aDgSzsqQzCmfZR3vMLEPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5008994"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 11:45:43 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 11:45:43 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 11:45:43 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.42) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 11:45:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kx0OiStzoYRFCzLM5u8LhxLkQzw/9kR54+SsX8Ng32S589KKO9ofJgjh2QJZ6VQ97a2IAPHGJWw9wTiuOejeD/dDUbM1mS1NlqoMc1aIQGY2gU3+M9lnqba7m4DOpnnHCsmFiKEzN+Di4veZzhPhOPsQpE4Xyq0p3oD0fPxkiSkGq9vGM9xHPbSx2kA2jdEA7svXyQi6hFEP/UvqE2VZ0obG+KLVbV5p48GDHPZ43GPBRjrtn/2+R3NTMpBfIQTjwcfXsSZxm3GGN79sgdDT3AB7U+0vAVao1RtTHcANS67hINwAtO56W0fuy8A7uld4gdpr5nn97pPs2eHL0nrRPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2Lw/IdD+1gtiumLvVHdflsk0jhXZcGiHz+yvzkZg08=;
 b=ptnNM4wAyqpP5XqAl1uAYCPr0qu4yPOigvOaIim7awEfFw0zroTEy3YROpEZ0Et0HQiHZ2Tcm1PpkHv6A6JGKvDskVoInCt5r3MmWbiotr3pcAN5pKj266If4tM1IQvgl52bwuKF2fc7PxzyMQJk9MWT3j1ZH010jw005Ov9dawZ7VkTLZTdxLtkQSgknIkWoUphx5vThzm86SJYxfq5uzxilQyYYeiyVQC9HnKqGgnBRDy8U/pXumhhve2Edy1ftUGriDzwP8+KZhv23XsAcWxTNs4CN6bQvx7Tkp0I2G7vQEaUWLeWtZnzSck4yPO4vh9f5hkqgBKZlcWU0prUKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by LVXPR11MB9779.namprd11.prod.outlook.com (2603:10b6:408:386::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 18:45:40 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%6]) with mapi id 15.21.0546.016; Wed, 28 Oct 2026
 18:45:39 +0000
Message-ID: <befefa2c-6898-45ba-ba17-4944c2d47d97@intel.com>
Date: Wed, 28 Oct 2026 11:45:37 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] selftests/resctrl: Enable MBM and MBA tests on AMD
To: Swapnil Sapkal <swapnil.sapkal@amd.com>, <tony.luck@intel.com>,
	<babu.moger@amd.com>, <shuah@kernel.org>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <peternewman@google.com>,
	<eranian@google.com>, <tan.shaopeng@fujitsu.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<x86@kernel.org>
References: <20261022132517.46805-1-swapnil.sapkal@amd.com>
 <20261022132517.46805-6-swapnil.sapkal@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20261022132517.46805-6-swapnil.sapkal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0154.namprd04.prod.outlook.com
 (2603:10b6:303:85::9) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|LVXPR11MB9779:EE_
X-MS-Office365-Filtering-Correlation-Id: ba5d384a-02e3-456e-30b0-08df3523a992
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|6133799003|18002099003|22082099003|56012099006|11063799006|4143699003|261026121527099003|261021121427099003|10067099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: tL5Oj6s6NY732oVzhVVkaQ1HdIz3DsKZDYNE0naSoE7Ck23DNG0tRbTJ+Ij4PNPQh9DikArqDx/nSz7usJYWPlftc/yXmtB2e+be5Yb5tvfqPhd91YA1UtMPFHHWQkOuCQ4XgH/8mtJLK++CerfLUbrRFHiC4oqr10l+cT50fi7NgXqZ6Zsdl3qjLNMCldeFaii7zJ5bo++0PdavqHcPErkdblV9lk8wP+uE/HzgPif0yePM0YVPVQ45jZW9IJVkdVfGuhbonvkwWI3KgzmNwgxxN2ICIrhEAbThDCT7aeTOIu+1ipiXYZhmJ32GSQK57JcGec9xqBT69weJjx0v/i5GWuCSMc9uk5ydtenn7bfOyZntH+h/X29n6eosyh9BD8PLzBPs+biORKRQ6LXAbwXJvdUv8EKRZvUSInyCicPf/nOHPjPepF6/WfxAXc5by5v6z5hGxor16GBdxOyA0PALpuHRo2/9s2y4XWNVlHcSs/paXRwbG3fY8YQaLEX6fpo7AV2VbU7v0gKWm6CKcqp7Yh9wjAFZ0aFHceAvYDOTcKMCY57HD/1/UdZ8HdwxV4MitvTyNw+ZFHN6AlwQiL+EasNnvruUvRZrBfJ4mAw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(261026121527099003)(261021121427099003)(10067099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDcrUXp1T1N1MFpyeXBRVXljUENVZ2xMMDdkNUVpS296a2ZjbWVUL290elkw?=
 =?utf-8?B?bkdOeURIU2hrMHByblJMYVFXK3RyMjRTUnkwT2tRYSszRkJEalNhdnJIZmlM?=
 =?utf-8?B?SjlxSjcrc0lwTUQwS1YrNytFaE52SXdFQktlYmR2b0hiNlpQdWFlSUk2aG9X?=
 =?utf-8?B?c2VCQzdlZzZLV3R0WThNWWZJOEJxTk4zb2YwNWFwSnhHazZWY01KU29aSXJT?=
 =?utf-8?B?RnBEN1BWUmxtZHptL1pxUG0rMmZxd3dVdWhMRVFnaS81N0RqUGFhd2UxblVV?=
 =?utf-8?B?TTE2ZUdYQkJIT0NJWnVUMWJBMi9mWGFFR0ZLT2tnYlpWVmlhNjYyTHVVM1Zn?=
 =?utf-8?B?dGtLZWJ4UFBoSUU4T3VSano5bVMzeVlhSVhVaURjRzU0cTRLQnNpUFFlVXZO?=
 =?utf-8?B?NmI0cWZWcXRCN2E2eEJNUFVMY09mRUs2emt2cC9MZXpCVnZDcEd1eDN2RXlC?=
 =?utf-8?B?VzVkNFQwdVBmUmdoUkJZeHlhekpYS2dia0N5cmNuS0Npa3huTXNUbGNNUC84?=
 =?utf-8?B?Mi9xREs5UDdGaWJHeVFQT2NzaXN2OGVkUHZsSS9wSWVaKzhEWGtDVVVBOGR4?=
 =?utf-8?B?UE9GWTlwQTZXREl1V0w4cENzL3M4RmZBNVhHdDZDanY0bTJvOEMwT2tPQjVy?=
 =?utf-8?B?YzZtVXpScVoxSU1ONWtHWURxTkJrRU01anY0cXEySVgyQWNjeDNZaXNyMjJj?=
 =?utf-8?B?L2gzdVVHR0VPbHJDWmdmWHR0Z2J0bjhNRkdwcVd2L2VOWVdlVkw3amNIeERB?=
 =?utf-8?B?RENwZWJhUUFpZ2dvd3NMUzVSMVJTL1BEOWNQQUw0TFVId005RXppTE9zQzgr?=
 =?utf-8?B?VUFValZMeEN2QkFQaTdCekxPejJzT3BhZjRkaGM1U240Qm1pZktxWk43VmV1?=
 =?utf-8?B?TVlMMkZQN2lwNGxrMXFXSzk5OG0xamlPQlVJMXBiM3Q4Vmw4a3JzRlZibERD?=
 =?utf-8?B?azVLWXBrN1pEQUIzcmhUaXlyY3EvZk5mU3pyTXMwMmZCNVQ0MHcxYTBnOTAw?=
 =?utf-8?B?V21xRGc4Njh2RGg1NGZmUFF3T04yZGN6M2x6Z2lXR1dWUzZNcGY5dHN2d1J3?=
 =?utf-8?B?R25rcVU5cWNwVkY0YW9NNnMrNGZZNlNoeUdtZEsrcW1PaXRlZHRoMDBPZnBQ?=
 =?utf-8?B?eU5scEQ3NEdzUVp5WE4yNDVwSmZoanVTWXFRckN4L2YxYS81WWczU0VDQWxV?=
 =?utf-8?B?dVVSdEdSNm1DK2doMTRQS3l1VnBOeDIvaU9adHVNU3ZpVkhyTlROUkhOckpa?=
 =?utf-8?B?dTJqYUc3YW9vcmJ4OVd4OHY0R015bmgrVUdXc2Y5bUcvRGZoQ3g4QzQyb25i?=
 =?utf-8?B?dTR4ZmtyVjNFek5KUnlyK2I3UjJrOU1ydDZ5KzVtWlF1L2x2dXNWdFp2ZUFR?=
 =?utf-8?B?czlKeUhXMW1HUDJ3T0RLSjRkV25LZ3kwVkp3ZGhiSmpNekZFUllxRXVOMzlv?=
 =?utf-8?B?SEFUMTJTY2FNdktFaXBkdE04TmdGWVFKc0hSSHlyYTVDdGt6ZDRLcG9BNE1T?=
 =?utf-8?B?LzNJaFZNS0lDekUwM1F6V0w3TElzV3BqeFhkL29qZ2h3YW5EM1JLTnQ3anY4?=
 =?utf-8?B?OGptSWRDcERXM01IcUZGWXB0TkFVQnRqa2tZUGloZ1pqdHJqY2ZydWhzMmwz?=
 =?utf-8?B?TDRpaS9kZE9pd2NtY2szck9aQkxUbUNzMEtMVmZHZXdZbWRwWHVMQ0I4Z211?=
 =?utf-8?B?bVBuV1lpNmt0bGNQbkt3dFlleHVwb01HcU92Um1UK3UreFZpNERWeWZoUTY0?=
 =?utf-8?B?RDhvSWQ0SEtWQ1JPd3NIN1R3ZmRvN0VhaGFaNTVoSXRGcU9DVlRhWWduM00w?=
 =?utf-8?B?ZUozTktJdGpOMjJ4RUdDYUdIcDVTVEVYK3c3emJXWW5GT1plVkNNdGJzN05N?=
 =?utf-8?B?TkRWTXhHTUdBMytSUUpXNzl4M0pxMjVIclFSenZUbHZsSWVBQmNWYnFOU2tW?=
 =?utf-8?B?SkVqY05EOG9lZS81T0tyTTJRMDNmbXVHaVg2UXRsR1RUUlJsTnczVmJ2ck00?=
 =?utf-8?B?b2w1ei9rUituV0NtNjBITjRhRWZIOFVxQWNySHlmYXh5SXlOcVZzL3hDVkZF?=
 =?utf-8?B?RStRRnNuV0RVQ0p2bVFHTFNDS0dmVnplYlhZT3E5UWN3VU1pVTB4K2NUbldG?=
 =?utf-8?B?djA2SzlmQlZkN1krU3poaGV3dWhZR0o2ZURkVlIybmQ4NHdwSnRIZGh4Vjhp?=
 =?utf-8?B?NjY2dWRTZDZTSFo0d1JjdTRFQUdabUFrSy80MlNvanBNN3FYUDdGSk9WOXMr?=
 =?utf-8?B?dXF3MFEzRUVIR25wblZUOUczRmRTcTlLbDM2R05QUXVHbHg1MnVNYTdJV2Q1?=
 =?utf-8?B?emRjRlVldEZDdkdGbDI2N0hZeU9TR1p0NG5PWHU1d0UycXVEQ0dPUEhPQ3Vr?=
 =?utf-8?Q?CXaefzsk+8ltEne8=3D?=
X-Exchange-RoutingPolicyChecked: SQnSMLB0UdmmQS89q7yfSyW5ihcxi7kY2SSSG9x0eLjCNYoaif86xcLMk4W0/13J0Piv5Prw6DDULoYjVWugSOq2DMkn6+GqKm2aZI5Fm3PrjZNX1rdBS69+i1uVkcDjbHUoNl+VaARZ+ATQJ9Fz90H7/4sToN0DIv0Z/ZFbZED//BVrIQQ3v3GefYdEZt1BlwczrywmlFJnd+jTvkM5948p/wsK4WQIO42inPzCdBYaobXec+WeZh8AB82pqMV/GH12T0oUqmfA5nRkmPeIS6FuEIVR6AQzh68P52+mSd1739Ur/99+LrdbijV0TgN37jDevm0jygkfd1Oub1jmkA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ba5d384a-02e3-456e-30b0-08df3523a992
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 18:45:39.6165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c+cT3eKjkb05Mvb2hqEV5799dR4rwiGwtsBlpghHhbJ2KeXQbVw3b7OnT9d3NVZjsT5ACvMTKoWpZxMfVxfqM5Y/5ioOpy9xQ9su5mqaZAw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVXPR11MB9779
X-OriginatorOrg: intel.com

Hi Swapnil,

On 10/22/26 6:25 AM, Swapnil Sapkal wrote:
...> diff --git a/tools/testing/selftests/resctrl/mbm_test.c b/tools/testing/selftests/resctrl/mbm_test.c
> index e24c6237a22f..b2c5fd0ab8e3 100644
> --- a/tools/testing/selftests/resctrl/mbm_test.c
> +++ b/tools/testing/selftests/resctrl/mbm_test.c
> @@ -178,7 +178,7 @@ static bool mbm_feature_check(const struct resctrl_test *test)
>  struct resctrl_test mbm_test = {
>  	.name = "MBM",
>  	.resource = "MB",
> -	.vendor_specific = ARCH_INTEL,
> +	.vendor_specific = ARCH_INTEL | ARCH_AMD,
>  	.feature_check = mbm_feature_check,
>  	.run_test = mbm_run_test,
>  	.cleanup = mbm_test_cleanup,

The issue reported by sahiko looks real to me:
	https://sashiko.dev/#/patchset/20261022132517.46805-1-swapnil.sapkal%40amd.com

Reinette
