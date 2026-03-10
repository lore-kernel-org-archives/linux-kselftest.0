Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011068.outbound.protection.outlook.com [52.101.52.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098B42BD00C;
	Tue, 10 Mar 2026 19:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773169686; cv=fail; b=m0hDz5awVGEIFqyuRk0NmGS0VdG4ss2Y+8An/3SgeU0X+EFODcLmQJYFzQTmoFE1wSPTr+OOYHorjjIMTckWFgx6AllbqinBR0kfdwHERqYnDTxhXE7DGF227kT/08YCl2gEPT++ecV8qYXL6Xo6zWmGb0Lb/eO5zEDhSvVYQys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773169686; c=relaxed/simple;
	bh=3sAD+2Lu+61zy2xOueBlfRdQ/RryITYL3pOmSQQkZ8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Hwbjq/Wm23yM2JzotCU+Y+BNj/kD9e843cCQSYa7ft81/lkTnSGy/WzADk5w2sf/1SjBI//oixh2mOz6AXkpUFVOcc2DJbFbkxuBjKXd+Xc+1xiSJzUZwKLukBH1CW2BHp/3a1m/jzOR7s7uOkLzbzpmS0fSDNIxVr13ADHFYPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=P2IWz91F; arc=fail smtp.client-ip=52.101.52.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="P2IWz91F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HtwlUvGjryUZH+vDK5wDwl3gdk1zm4eUYi5Va/KwxtesP4WnksGJTFkQKToLQSSCzcD2cV+dUhxpUvCmPb854eV43x7aHJC0V1DWMADO9AoyK4xrlVv6/cSoDVw/oaUoCevaAMnVYG0v3pRrx387tN49vB9kq0URaxC6Xw3AtDrJyLHwrz3y2Rp92StjlERP7ABujZf/xuQcyDnn/2BnEFX46x5wQOsyzg6WeDc5fvoCxPwps4nSCsvLVVVEOJhsWZFdPY32COZZATA5OFkXqAigvRqkhQmShA7hLq3qxGkiX4/M4/99YFJDUhDrAH6YJQVCXNhezt4gpGpJAWmnwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYrBl1bENsvdRciuhKBgt++3MpS4gPzZIX60FL0P3YQ=;
 b=WU4912bPwXJoi+kFa60E0M6mJuBzHNrqS78YYMl8lnR4arBviv5hLbTPsb39PpXzUo2XJr5uztqO3NX1oW4nuoN0Me9qGRKCwrepyUAAPdkb3yON3njBkQ0BSxke12bN5oBXQYARpa8YslBSRyNv1woDNdScJXC326+0T9itjNve7g4wn51JLmUSk6aHyAuw/aN16EagxXJHx1IEhVuXRV8GJVZlEU/N8zWpGd0ZDEajvWjE0KJ4zWRCI6k5sd/tK7mC499a0VNj9dA7dfXETspxD9ofRnR26BWZ8fgf0B0Tor5hS1dedfayvQx+zE5z0omzqYNtNHQ84nn5m1Eulg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYrBl1bENsvdRciuhKBgt++3MpS4gPzZIX60FL0P3YQ=;
 b=P2IWz91FCSvfhR8B+tZZ3ehcOV3TCMRGvVckR65/7a/HTfidAuPRhGnRzV7ujfq79BrzwMekgbv//9qLI0gaFfmTu9YvSn90UNnJ92yZBjVCAkIJfvHMY8meJ4d0Pzg4nr+cZOcNhV+FJYwFEnsIfhtRevWd0UKsIImuQINCF2ULeaZWJJuLmXW/0I76VQ3gCbmcNylD7SPv9F+ygYfv0MHFh/NI2M9WQSzN+USo8G/ToqcfimWqwHZRHvM1FL3YvwIKbitXV+FLZt9XGEkhzY8BYO4iyx4BinhupQXVmsciIh26q3rG2VGiH0b61+BEAa5RQfpvt9pAvEqgKANmvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL4PR12MB9478.namprd12.prod.outlook.com (2603:10b6:208:58e::9)
 by CH2PR12MB4152.namprd12.prod.outlook.com (2603:10b6:610:a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 19:08:00 +0000
Received: from BL4PR12MB9478.namprd12.prod.outlook.com
 ([fe80::4d08:451e:a51e:33a1]) by BL4PR12MB9478.namprd12.prod.outlook.com
 ([fe80::4d08:451e:a51e:33a1%6]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 19:08:00 +0000
From: Zi Yan <ziy@nvidia.com>
To: Sayali Patil <sayalip@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Ritesh Harjani <ritesh.list@gmail.com>,
 David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@kernel.org>,
 Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dev Jain <dev.jain@arm.com>,
 Muhammad Usama Anjum <usama.anjum@collabora.com>, Liam.Howlett@oracle.com
Subject: Re: [PATCH 09/13] selftests/mm: skip uffd-wp-mremap if UFFD
 write-protect is unsupported
Date: Tue, 10 Mar 2026 15:07:55 -0400
X-Mailer: MailMate (2.0r6290)
Message-ID: <9CFCE71A-7BE4-47F6-8E5F-172079508878@nvidia.com>
In-Reply-To: <afbe6bf8ca508d810bc1c9d749483711edae9751.1773134177.git.sayalip@linux.ibm.com>
References: <cover.1773134177.git.sayalip@linux.ibm.com>
 <afbe6bf8ca508d810bc1c9d749483711edae9751.1773134177.git.sayalip@linux.ibm.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0145.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::30) To BL4PR12MB9478.namprd12.prod.outlook.com
 (2603:10b6:208:58e::9)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR12MB9478:EE_|CH2PR12MB4152:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dbf5237-ab2b-4ff9-85c4-08de7ed858c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|18002099003|22082099003|56012099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	XtOb0g+nDw9YDEBzAEX/KEgvLvf7uGgr6rBwkyatobsOOL76+s4mcQJ88bEczql/ZL3YJ/1V1s1g2ijQtOwr7vN5+kR8lB/r3fDl/w9txLI6ToZIKqMA+qFRBUjjg32K41ZJep5GAOl2zzBoTVqVpIRVIJ74a+PUBLLx7J5Vr+yoVEUFjC71cwasa8r6FFSo+/NtdOdgI/hOokiknDPWDFEw9zhcBMr4nktZ45wJNaOxH+vJyPSeqwAhuXKUHg8RmtdcdDnuLcST57jUrXeD3BdCwUejdOKg8NDbSmmVGGft5fwN/QMX+7veGEfNleyRihrFGY5vhqp4ZKXmAdKUh0faapnWry1W7Ys+798vO3slCYKXO+cTPuPvDqE9cp+jXKhZ/8z6WoWDglrAQ+5HAMzjuG5oONhV6MrCr6OvJKAMw+YxwPinBneW6tCAlawbQtqMIY76CRAUjkQ8pq4Ywl1NzS9/Jhy3YKbPQWXISy68PnuQEgjT9aQ5r1qNuFPirCJYrELQv352TZj2r6pPiH2Z2ukC3NoOuNxQkhBlTdIbnxP8934I9g3vNBYapmPr1Mhlp5zxBjxJZHn8kw+Xk8lK+v5vXBbEEZytufGbvGG6ETxryWeBDth3+BIYNRLgywCh4Zw34cuVfR+BnVrjZ35+gv3prDQzIEv31+vErkObThke7ko2g4dJZGMhoo+kPyHOZXzSyGl5ggiDMnkfZmZkz2rS+r5GVGmAWoyia0w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR12MB9478.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(18002099003)(22082099003)(56012099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1Q9RAxEP4otEeflQl30Vv9x2qRir+cq5K0uTc5ZP9p7+txInUBkVzQgxPa3/?=
 =?us-ascii?Q?fA4hSiSHFS77klKNRsVzgRniUtLrkpY3PWAwlmgIbDRt+LdjtekxRnkRQ0lD?=
 =?us-ascii?Q?BRzi0wuM67XEylARXFTNOA0whsaRZIdNA4Lmp6oEDIdjKnmjX/WuNcQdLTZq?=
 =?us-ascii?Q?OMKNrjneyJDpvmqY7Yc1utMu2R7V6PyjLFouPLDBJorxOZ2F0fAkpVs8vgDn?=
 =?us-ascii?Q?UQjEQCzPePJ6qf1hkgqNpyvuSLp+O5oGmIu8txbTNuxK38xamTJfEXRVKr/3?=
 =?us-ascii?Q?VO2/fDu+OI8ZPlH29JVmV6RTWJnSPepPePMEkGfn4YnsZ1tAApHTIAgptrZX?=
 =?us-ascii?Q?XqtPLLWoS7qGCBKv3BW6doa6UR9Km9iIbL1XCF9i3f3gZlRcwQunaYqvqswM?=
 =?us-ascii?Q?Q7RhtauRbYabZ0Ql8yKDwyyGibm0VExxtBDAMgfjcC5D7s7UE+/16mSlAaIh?=
 =?us-ascii?Q?FubheCruU71kS/0LYI/MHr5nFrIVFhPSZMvilxlvqYznEuo0Ft06pG9Nmatq?=
 =?us-ascii?Q?NjnZNkxQKkpgcuqOTHQcdkyC6BMWeiekt3G8ni4rlc2hIlyJ944+HcbyJVcc?=
 =?us-ascii?Q?n0kMCB+GvTpme7YKrZ9B7JrRbZJphMcXcxkH17YxL2gGmQ16rxEj8NqFOGBI?=
 =?us-ascii?Q?quMkrTbYBZ3kv8+3KpOyyzcfXK7MKQ/OdmLQhcT5VCNDoDypYLb90l8FiUSK?=
 =?us-ascii?Q?6LmAvPPkWiASlOWC32jz8brqjLTPgbHBLG0u4myKzHOG8tCYw/60gCiZzoIz?=
 =?us-ascii?Q?TixAEXU9ntNRav0t6DLHNf9mt8Er2zW8WSokJO2ybBBUp1GFRwm2JQ9dk4ZR?=
 =?us-ascii?Q?9c8gquuBtnZ1esFEkHsrmu8zBpRGGg/ZR3NOmu0StUfjAbPOY4OfTNvFioKy?=
 =?us-ascii?Q?CbKpS11Y+mI0fiWXNiY72S9V4MPgACDbVH7wMmSUmmOFmNfquHY2kBeZptQw?=
 =?us-ascii?Q?GRd5PN/bj2vluL8m31c5oUVEY73ehS6N0gbryJus7gS7KP685rGJOj17c8iC?=
 =?us-ascii?Q?XJ1ynjmn3RTSy3eXe6cN1IoksZ1I3S9w6ybDgVwxa4MRsLQsbSe8UW/hOpGW?=
 =?us-ascii?Q?a6uWcGzhK0WxpxVrBx0EoyzH9uED3ua3I6liVfGAVbXel5juJyO52i8YYi4p?=
 =?us-ascii?Q?ZXiUR8V8wOZ4eU9k+b8OEEY/aK/27/A8g0PIOVxiTL4fMWGdzs/FqgPcIeET?=
 =?us-ascii?Q?I27qFtkYBzH15k4z3fTXKTviHz/Dv0NlvQvS57kMWuMlit6iyhw+T18IrJzR?=
 =?us-ascii?Q?MCP8rrm90gy+0Hua+Ehe9Mh2ViktEUnqcxHxIQKYJJxLElpwRxGX7xfDacHt?=
 =?us-ascii?Q?7zrKW1HG8fv4IzmCOfGPdgC+vA49zMYvn99neH2vh/x+FEkyfi+/sVY8q6Q7?=
 =?us-ascii?Q?TYtpDQ6MSGCo0fYHIRmwcE+aPF/xcFNUl2XSMmSBu4fpbsg5pSrMM+QVrq3h?=
 =?us-ascii?Q?7g7AEeUkhQlKgMLIfZGnISxR6D+1/VsSbU0PMzSosE6DUkUDQJovXYkNlZFk?=
 =?us-ascii?Q?kaco60GcXvkxjOjynrKBL7GfiKdNxEUOQQncVeAWa1kowCiO+XL9yyPq+JP7?=
 =?us-ascii?Q?zu53Z55JD3HxUjC6jd8c4mKAs1TLfe0C9vC9mVnaUy2I2EGuEpwMDLgR6PJ9?=
 =?us-ascii?Q?tTMFmeA2SGuq3RUjQVGWTxfdjP2ic3Api91Q0b7EcNWd4689GzPup/m9dZCl?=
 =?us-ascii?Q?byzrkWjl8nLHcRo3JN1D+Zna4i7/y2fcL6h+y48/akTVpd/nNcp0yzpSo9mF?=
 =?us-ascii?Q?yZiKeun7NQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dbf5237-ab2b-4ff9-85c4-08de7ed858c6
X-MS-Exchange-CrossTenant-AuthSource: BL4PR12MB9478.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 19:08:00.1687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6rBvAE7j1hDGvIdpCcYA0tx2JakjW0inWOAx31lbUxvfT9kdXgTeL5GRAE/uoO/R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4152

On 10 Mar 2026, at 5:49, Sayali Patil wrote:

> The uffd-wp-mremap test requires the UFFD_FEATURE_PAGEFAULT_FLAG_WP
> capability. On systems where userfaultfd write-protect is
> not supported, uffd_register() fails and the test reports failures.
>
> Check for the required feature at startup and skip the test when the
> UFFD_FEATURE_PAGEFAULT_FLAG_WP capability is not present,
> preventing false failures on unsupported configurations.
>
> Before patch:
>  running ./uffd-wp-mremap
>  ------------------------
>   [INFO] detected THP size: 256 KiB
>   [INFO] detected THP size: 512 KiB
>   [INFO] detected THP size: 1024 KiB
>   [INFO] detected THP size: 2048 KiB
>   [INFO] detected hugetlb page size: 2048 KiB
>   [INFO] detected hugetlb page size: 1048576 KiB
>  1..24
>   [RUN] test_one_folio(size=65536, private=false, swapout=false,
>   hugetlb=false)
>  not ok 1 uffd_register() failed
>   [RUN] test_one_folio(size=65536, private=true, swapout=false,
>   hugetlb=false)
>  not ok 2 uffd_register() failed
>   [RUN] test_one_folio(size=65536, private=false, swapout=true,
>   hugetlb=false)
>  not ok 3 uffd_register() failed
>   [RUN] test_one_folio(size=65536, private=true, swapout=true,
>   hugetlb=false)
>  not ok 4 uffd_register() failed
>   [RUN] test_one_folio(size=262144, private=false, swapout=false,
>   hugetlb=false)
>  not ok 5 uffd_register() failed
>   [RUN] test_one_folio(size=524288, private=false, swapout=false,
>   hugetlb=false)
>  not ok 6 uffd_register() failed
>  .
>  .
>  .
>  Bail out! 24 out of 24 tests failed
>   Totals: pass:0 fail:24 xfail:0 xpass:0 skip:0 error:0
>  [FAIL]
> not ok 1 uffd-wp-mremap # exit=1
>
> After patch:
>  running ./uffd-wp-mremap
>  ------------------------
>  1..0 # SKIP uffd-wp feature not supported
>  [SKIP]
> ok 1 uffd-wp-mremap # SKIP
>
> Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
> ---
>  tools/testing/selftests/mm/uffd-wp-mremap.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
LGTM.

Acked-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
