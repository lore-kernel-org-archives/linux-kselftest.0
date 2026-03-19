Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BD23A7855;
	Thu, 19 Mar 2026 08:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773907491; cv=fail; b=cPsNVY8NMGSmySFNSVIfrdjKFLxGtNW6U3ydAnaVOvc1ZhK3QUwke2kKMziRJwgBs0XLZYeWx9eK4vOsw4O0/wqP0ixcg3TPnPKvvqMDwhQ6fa5bP+Wiy2fti2XTbnwUFp/C0XH2a55Xkt1Wlq3WAEWK+gS49q11+YGJuAgI7/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773907491; c=relaxed/simple;
	bh=QhN/NOcCWUSqm55G9lxJhB9tnzwLv1qDPW7icDLNo8I=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=FKSwCSEPZukiImopEphtarUTYp5J9DXIveSgKknKyUnr2Gpv8evSdYnBl3+6NLLKD5j2dkNvnivbmrgzsqNRmBVjq69zXKc0L9hUxNVIuRkvjqq5Sjt3ws2vQl9Bg5Xnexuw8NUqX2QsT6IQ1M4MQ3q33ZvjoDIyUeloHl/hgwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ljx8dEpR; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ljx8dEpR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773907489; x=1805443489;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QhN/NOcCWUSqm55G9lxJhB9tnzwLv1qDPW7icDLNo8I=;
  b=Ljx8dEpRwGoDM9vx/lPryKBlj31Jp1tSkJU+imXZ5+GWKcQpBNj8GbTD
   2cv+1R/rsV7zmQQg6pW+kxO09H4bcQDN4EKNoEwt+D6YFR7uYe3gl+SXc
   +N+LVaFEyMDDvRl1fSrQpPJilFXKZjxE3oI4R3t15BfMjTUw7UNgtP0xL
   cX2thttrxVQYcGROxBAB02x8DNfF4lVhl+kWWRVJgx1RdvlzxfGa6zbl1
   tRwWkWKUE/x7swkyBF/RxddLwaUYm2bOFLxdMafmDpDTDRcRuanWs7kP1
   /XZvjQRlbdsGURWsrFEcE7TWxFChneeK3OKREY/mcYSNlu86m+bHLgEjk
   Q==;
X-CSE-ConnectionGUID: FxlPRW+OQkq43j4Iz55rQA==
X-CSE-MsgGUID: yQgt0SrvT9id6FJuKi9gxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="85601488"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="85601488"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 01:04:49 -0700
X-CSE-ConnectionGUID: ThtM4t6kRAuOgfp23L03QA==
X-CSE-MsgGUID: EWNQ22jGTiC3tk3bqbPlbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="245914522"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 01:04:49 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 01:04:48 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 19 Mar 2026 01:04:48 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.52) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 01:04:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cz+9OX5ijpuO81BGBZfNdaS8yak0mLKmlmGC3gvh25WBK1g0yFlJ1QxFt44OeX+5iqzD1vyrIxoU1F9beE46y7vNxYxi01sIb9pDkOLtBZp85tszAPLNXHaugzal57CZGsD6Bbo3gXC3kentxOYBqiHqGcHIv8iFpnF5EprEB05V6JZa+YGsLJocmR2vpEGZ8ivp/XsxsLXSbUyx4d458qeQ+ST5gJRd1jEN3f5f9LfwsF5cwd1p0laZo5ttWjlZozGy+EP2vRdoHHz22uOrNQzoDWt+Yim3v10XJKvzBdtryZuUfSFBMMH4mYy93OrNp+f4wuMzycAZypbtN2tqlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQD9B3UaddhvmUwzxzBv9BvV+VtRmUBK5Ulb0074h+M=;
 b=hDPwGWScGLdYVOQsRgznxl6jiz+Sr1UgOa/tkcJNgO2GGdYb5OfW0RQ7Ln2WgmsPti2KknBVWX6F0AdcCVPpo0eeLhH2OJNsVy4uEQp1sL2Su/T1VpFygebBiJcV6FI3MnV4QBlTE9z3EYK3+Kn2IvyMwazoA+6LqDIUSC+1nFIP2oORIHDxe5vtfDmuQJpn4tDfhfIBh/GcwQ/JpGmPOZsExvV81XfGfwJVBd7lrC/CJJAiqIgUaySt3FXZ2lZ/vw+3vTApvuH8K8MAJFwOC6SWCDRNCX9ogLgvq90tqCKChgbcI8stb3Fb38Nk1Wqu8eLOFH6KQBETkIA0xBIQRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by PH0PR11MB5077.namprd11.prod.outlook.com (2603:10b6:510:3b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 08:04:44 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 08:04:43 +0000
Date: Thu, 19 Mar 2026 16:04:36 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Sun Jian <sun.jian.kdev@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, <linux-kselftest@vger.kernel.org>,
	<oliver.sang@intel.com>
Subject: [linus:master] [selftests/harness]  6be2681514:
 kernel-selftests.user_events.abi_test.user.flags.fail
Message-ID: <202603191510.f2ce33f6-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SG2PR02CA0117.apcprd02.prod.outlook.com
 (2603:1096:4:92::33) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|PH0PR11MB5077:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f513266-c704-45bb-4875-08de858e2e13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: p9Pj/j8sjZnAKtx/KuFz5QUz0YV0D7qHRhqPhS0q6LN7vxxraPh92AJlIgyApbUTTV14BFHjo9kFlw5wZ0wfBDmfsf3zQgni/+wLeVbhcXXbDGOuj+dweCm/zfDqwJpNOwcwsfpTRo5F1UVxSTOXd0321jw7h2/ctWKhF6s/kBrHedd8SMJJ0JA/bpGV3viadtrZDXOZUTstE/275cGdjwGQ2f71SUdkgKdZAzuwG+tZpPjFkAM5lOzQGkLkbfbluKpnjBzQyQzyylYwzZzgFlNZBSZ2Fd7xZC8o40+H5jCL/Au54hH2g/KMnzvCElqNfEfdWhqmTT66kcBBwAmDOctxoG1Vjppo4lHsAAwB6OB8nowNx604vVhSupq05KUN8rsTv4DRyW9muKMMsP2M13fXprIO9UosPz4VUlIDpFPN5H1kpKIhmLjh917YjdGLgNgVk2nytWOXjYdFL4bQnveFiGQEfOXO6zTV6xwDPdWFTOs0vnrgiz5ED6by6oWghR4ulmqp4r7GyYCngxH+te/39SZsZ9woxIzeyyXsbTVi9rgCtkMzcXL9Zv6J19vh3XpNrm3ONCQcd5Uc6Nj2tJchvE+SfvdvH3c3m+xl5FdXam02yAmWaJ2C99zXOLBXpKwwZJRrLFnWZUZ/8o56SZoLhToCKzWpXvk+makT0oc/W0jODF9eY1O0owYM3PZxjLarQG2pmZheCyWnIQaB/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1W3nvAz0CaCXwpejmGLYikHz9gNMotrbav4o1JcNP98L+f3SJiGt4nU1WR8R?=
 =?us-ascii?Q?CbrbWJIarYXLuGGD0RWEkUSKt+SC0DJfB3RIPX08bn51ENphpIillmiBTKuH?=
 =?us-ascii?Q?bC40UR7L7h7Njy6ZRbe5zkye1c0Hr2q/jkWuKpn/Lis1OEhm2yn27F1YaMfn?=
 =?us-ascii?Q?ZuhSidSEiNWJ+Ia9ZaIzrw7uBPBtQrbKheIdn0dAukYHLnf0I6yyg5V/7haW?=
 =?us-ascii?Q?Zh8LdP6nKC1XnQyQLGaRszGwbhq95qTktVkdOefYhXnMuOSGpmUz+5rANnBE?=
 =?us-ascii?Q?9owYTyP2HZTZejHiTFZ5ARpafzj5uPu7eSc7rPUSbYM/K+ZHG6BkMTj1oNps?=
 =?us-ascii?Q?Ty4P7vI+mI5uQNXkMYOnm+d+TK8sI37gimQQJhR8FOnO0HjtNdc5HwpvUnvk?=
 =?us-ascii?Q?PRbf8IVO2aa1D4/4/5lBPbqOviie/YYO5Ssw4MlfXHZpTPq5jmCSw/4I3+wJ?=
 =?us-ascii?Q?AS+hdVXsSSTGXsOijCDpHZiiwn326k/4xr0tt9xm75nALB8nc67uNCslGKNd?=
 =?us-ascii?Q?lVUctmLHheqYZhfecFh4VDzuAb2Iz8LhCxaIqlX7yZgC5pJEVpuqIUu7Pqy8?=
 =?us-ascii?Q?mGHcMO7BQ/XvAHRqC7vyC/C/Gg6XbfgFXf86TtMv1GchTLYTEInyFFGXnN9B?=
 =?us-ascii?Q?9ATQRjIiZg8rHvYezRUIv2VFbPwtAOQGXMBFOk/xl7urX5dUuIGkiMgZInCE?=
 =?us-ascii?Q?t94f1ER4OEXKB8e9RTbLXDnzLTGPmAu2RXDqJUipkENGG6D/4pJmFd2LBdhc?=
 =?us-ascii?Q?28ymwZ6L6gKNWuT7cxhXr4MkVMxfeEOevJK5KnrkqpCq3ztXwedynXOfJpSK?=
 =?us-ascii?Q?PEF6Vxe8zHTDZDjxxyvxHhjtt9NNSzfYMb8Cp8zm0ht4iDz1+rjtbh73pAaO?=
 =?us-ascii?Q?UIRPwb8pnDdl6TFFRd2WVtEJV4eqh/sOb7jbQWX0naIOU3pAUAc16dmM6gfy?=
 =?us-ascii?Q?SbYFIPPfxAfRTTSMMTLcLjyKP0TD3CDZnsSnvia23Tnb3xabPQloWZplHeGd?=
 =?us-ascii?Q?F4Z8hczY5FCw+4c8GhYOyk3EzV/M1l2HgetYiVKBUaYZGv62tPkva+ORaepP?=
 =?us-ascii?Q?5ivmwq/O8wKxvEmV1+/i6lHTKaoxkGpW7r4rXDBleHW/eqTJ7TTDprvAamYY?=
 =?us-ascii?Q?xhHQwE+1+yBgl3Ers6w50xvj+XtswRnCruNAA2xazntc82nD4YOzB1NgfKmw?=
 =?us-ascii?Q?qMJHsAC2vdmxwDUXeG/VogTbgyinaSyfRmDjlK+VC///bCZrNo1TBETJG57z?=
 =?us-ascii?Q?8krYO2HgCObESO62YkDoxN9UWotFjv1IRIhMfLtt8bpkeZ3gbiqRHKWmIcqM?=
 =?us-ascii?Q?Ijj7rV4Rolvcfxl9PHDY33AfQjPjy/i0C7vp2F2K0TY2C+OkdGk9+EkPBVar?=
 =?us-ascii?Q?eBu/9EDPK48/umumf2ulFZmY+LmfkOqSmiv2EpURKGN19xm+osxfGN1IUINf?=
 =?us-ascii?Q?3qFLgkqzApQtMa9ZFgRN5ezlTEM9yFB0I/tkEbmPIsICk65GK9KGbAO0uNHc?=
 =?us-ascii?Q?b1LQYePQDXYi872ctBkhHjsdJC1CpBBX+M9dvV3p/lIlvkwjcoTa024FgjDH?=
 =?us-ascii?Q?2ITTc1LkYwXs2A+cpwW868y8nxP56Yo7QjJpkZnVyAAJEts45uDp8V3Kjnbl?=
 =?us-ascii?Q?MpU2EviH1Tbmgpa/mWtMMB/UsxKVK7RMyJ8avGBXdhFMGWo1Gs/j48Lfktmx?=
 =?us-ascii?Q?JES8a3dec7pH8kC4rEOSFSi5obEIoNFiuRRdjAc3mBcy8BwLeM8oPTEPPY9s?=
 =?us-ascii?Q?/ejOrmuzgw=3D=3D?=
X-Exchange-RoutingPolicyChecked: IZzrs1yIh1iEs+YhvG1fBgogAteX1x73wGXa4rGj07AMQlYeEmlbC8T06+V1aNngklXaj3iaI/FICzZdoLmu9KC+8tIIcyRipH2FWQzhz+lsxUpM4AdPKod6TFw6T4G8ZAk2N+N6f7Y20MPUymlBH3NI65x6A/ahB6qPHvzl/4ehgbA/y3FdzVe6b17jhHwYioarphfMOT6KrIOJCBnZ8Io7cpLO4fYTk0OSTnh8cCgYHhnTqJKHuRvtWefCBK9t2Pe9cBAJOfdKpo9Y6PNtPZ4v4jPuULyMfQRu4CTU/guHeKIks0aKrqIzYPosS8TWoEWmUpn8UZr/7RNBj6JCPg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f513266-c704-45bb-4875-08de858e2e13
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 08:04:43.9089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S4ZVlcm1FgV2Wr7OGJtvRpvBk2bmaci5bbo+BT6NylJ8pwh/2RavNcl8ZVLSw9srqRJ8BBYA8mEHyxq/kfqQdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5077
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "kernel-selftests.user_events.abi_test.user.flags.fail" on:

commit: 6be2681514261324c8ee8a1c6f76cefdf700220f ("selftests/harness: order TEST_F and XFAIL_ADD constructors")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[test failed on linus/master      2d1373e4246da3b58e1df058374ed6b101804e07]
[test failed on linux-next/master 8e5a478b6d6a5bb0a3d52147862b15e4d826af19]

in testcase: kernel-selftests
version: kernel-selftests-x86_64-b4f0dd314b39-1_20260311
with following parameters:

	group: user_events


config: x86_64-rhel-9.4-kselftests
compiler: gcc-14
test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-9980XE CPU @ 3.00GHz (Skylake) with 32G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202603191510.f2ce33f6-lkp@intel.com


# timeout set to 90
# selftests: user_events: abi_test
# TAP version 13
# 1..6
# # Starting 6 tests from 1 test cases.
# #  RUN           user.clones ...
# #            OK  user.clones
# ok 1 user.clones
# #  RUN           user.forks ...
# #            OK  user.forks
# ok 2 user.forks
# #  RUN           user.multi_format ...
# #            OK  user.multi_format
# ok 3 user.multi_format
# #  RUN           user.bit_sizes ...
# #            OK  user.bit_sizes
# ok 4 user.bit_sizes
# #  RUN           user.flags ...
# # abi_test.c:265:flags:Expected 0 (0) == event_delete() (-1)
# # flags: Test terminated by assertion
# #          FAIL  user.flags
# not ok 5 user.flags
# #  RUN           user.enablement ...
# #            OK  user.enablement
# ok 6 user.enablement
# # FAILED: 5 / 6 tests passed.
# # Totals: pass:5 fail:1 xfail:0 xpass:0 skip:0 error:0
not ok 4 selftests: user_events: abi_test # exit=1


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260319/202603191510.f2ce33f6-lkp@intel.com


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

