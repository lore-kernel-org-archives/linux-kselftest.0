Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013050.outbound.protection.outlook.com [40.93.201.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A98511E70;
	Wed, 30 Sep 2026 14:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777361; cv=fail; b=cfiIrlofVPIGCcgeNc8OlWZjR0WbVjPRA6OXBiQgVDWvJmqC0PFpC26IvWM6Xnq9sdqN3wk2ORUtGOhHs5huv8FmekRKc8nDVYkjDf01erfF38FEMaPmgkts40SnhOwoznUbWfowP4z68n6pstpGZUnThJBrHpQt0aWZFykeH10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777361; c=relaxed/simple;
	bh=3kYDU8s9vbRmsU7LLeR2ihWapGcNrXeBO+aQKTdEJIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uVg0SU/UsmvAA+HK6c+ZWJ0gIKwCUZ8sYzDiswQEjGLxbOq2R7zyrph7YAHd4ByQaLwUmftpZ2ts/kFlfflCMRpZZzxLdQfx2miy/z52G0rDom3Rc4Xwg3QT/mnY7ZEPFtxUz8N+Ek1PLAddvJv0NOCygIUhNMLBfoRv+H63WqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Rmhyi9Q3; arc=fail smtp.client-ip=40.93.201.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Rmhyi9Q3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dN40OiRUEjhsdQVeOY+YIBIBE8RNeWGDsAtGSHFh5OIY/sk5o3Vcy7fj8EnSvSlKRgzdHAiS2MRQObMrO4Eg6rlCU5NpORYCzPMVlhLkFn4r+HJ5EMjir++zFXJdhSpfoDATu7dD4CObPx+ME38lGx0Pz+ybnvAPCD+AmAjkeGaZBS67pGWsR8Udaby8SWuQv5Zyxju5fCEHzzGyoTq6dPPIzzNX1jglmJqAGgvbNIr2tjVC4G4Kt3sFYfPwrOl5FBRC/mbmazJNTJ0CamslCgRaE6MBpS11aFx4G0fBUXWhvmEGrJLD74kqjxUbA/ZU6hWfk+wp8ejL1WESdrlV3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6QzNnkRT/36Kbsaqf9YYEG2h2JpbBxSW4//xy29in4A=;
 b=yrKGh13BT8wrviqMw08ZUmeOswS7PLhO9uNvjp97Uk/BE9zPB75/aUDxb+Qm581gj2YN7BtDdBWEiWw8aNe61XEwV6ACVEBzVn9pwVMH5fiaRVIjPyVvrAxb7tTWHam41CIJ0fE+SsUWl64dfLbib/BVgLEdgbpS0RKTSFF+oKjOxfFueDUPtFnyd2GSTkwIPXdY+HgQiI20gOPUUEG9GE+BfPC0Ya08k8RXRJFbHqZ4STc61b8+BpoA8KwJrAocPOU1H4Jq9gNvRhFa/X57P73AuocZo72J7TZl02b9xJujhaaMMkXulmPxmhFpF7waJNYSUOUTNwOBmfbfp2cl1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6QzNnkRT/36Kbsaqf9YYEG2h2JpbBxSW4//xy29in4A=;
 b=Rmhyi9Q3iA3Ipm2UsWX/OvX0OQCNxFjVm5a4U3Xy20PtJSyFlNquMQO3lMuRf6IL0VUN+0iGdh5hsptiwJr6l8AktDgIopwMauYuLACyJkyTxmwC4061XG5gAososQn7/JzFdmbsS5JqVvRY/vTfIzCYyyjqkpUL48liO/OhKcvsGjF1KIjbigIRWhRwbsIFfkSscv/VqLPcGRwY/lXrRrYWY/KVK1xRK5NeUAJlgo2wqSpjvgT+kAYqUWWP09juUuPyD6jVu9tCOhOYasxqFxXcUwE3AUn9eH7UofROr3LKwGWRqOALDbkYy2/btiye9UU6+vB25wdhU2PzYJz/2A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB7957.namprd12.prod.outlook.com (2603:10b6:510:281::22)
 by CYYPR12MB8856.namprd12.prod.outlook.com (2603:10b6:930:c0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 30 Sep
 2026 14:08:51 +0000
Received: from PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499]) by PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499%3]) with mapi id 15.21.0451.026; Wed, 30 Sep 2026
 14:08:51 +0000
Date: Wed, 30 Sep 2026 17:08:41 +0300
From: Ido Schimmel <idosch@nvidia.com>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Ido Schimmel <idosch@mellanox.com>, David Ahern <dsahern@gmail.com>,
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, Hangbin Liu <liuhangbin@kylinos.cn>
Subject: Re: [PATCH net-next v2] selftests: fib_tests: use per-test return
 value in subtests
Message-ID: <20260930140841.GA1223214@shredder>
References: <20260930-self_fib_tests-v2-1-3053e649d341@kylinos.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-self_fib_tests-v2-1-3053e649d341@kylinos.cn>
X-ClientProxiedBy: FR4P281CA0422.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::16) To PH0PR12MB7957.namprd12.prod.outlook.com
 (2603:10b6:510:281::22)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB7957:EE_|CYYPR12MB8856:EE_
X-MS-Office365-Filtering-Correlation-Id: 82fd68f7-9199-47fe-e87c-08df1efc5aa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|7416014|10067099003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	DE0wuHxVaxx+o79SLm5vE507AZAA4tiZt+wfitd4V59ZYo63OBMPS8nCzGrcmWe49CcjGAEGJVYYwI6lXAb67n237+pkHEYjrrER6xNxKExp+R2fpmX3xErOnxQCIcNLcOJNgtDvPRAK/YhA0Cg2w4oPe4GaqjSqOIuOy6ErJgI5rQwUU0ApyWa7KP37+2TSu9ksPB2vdNQm0CMtH+sJyRffcmUO3nor/urVL5NSh0otAGapJ3spqXleVFWupoaAWcXwm3a727di867dhP7WQydPo3Hun3yTN5jCCCYP7rmcnZnfMt8mHuRc2/rxwhSMHPyTxRMZYjJ+Rarp7uNKxA8/WvJPXi174leubTEPP/3c4lCLGf6QwndQCbl0PURtMIe7+Gtw+VUEZSZMi9qbGC/M3KOrHLgl/Hv2AElURfElfRV4qkd9iPtlV05Xut5wL5w8BdhKksafFLC3lxdsp7XMG+3M/qjEVhopa4YtUj2+LpEXFELfYL2IcCSB81Lo9b5UPwkYoA4kosid4mOWVBqC/9S+foVHexoV3jywBdDb+KfSaRLCaKvBKSui3JsqMz5WEVxGnXlLUH08foC7aRGxnYb68u0En46zMtZWyc9LgwEu6vk9IKjrAEl+0WE2+6hQTVrmKPAiNouinyEs3EH0i5y+/WDxh7SHFMiu+0s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7957.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(7416014)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+y55B5OrEJJJFR8BvKfjbqFnX0MjG9ZMI6qLybp0rCqZVp8HyW6s308EUN5q?=
 =?us-ascii?Q?/m+6CyMHH5kcVKOuyg37kJxEuYTxlry/ZDJ91CcJLQb86udMDFN2IGIvuvWa?=
 =?us-ascii?Q?QUOXvvZjdc9kRdo//3d1qrq51Y1jsgqd3AYZLXNRPH7StC7dcWezPA2dhMns?=
 =?us-ascii?Q?BDloF0sUeMAHX8Sq/lTlBoBz3Up+/J+WYHmCInNtnrmWP0Qmat0hevyw4I05?=
 =?us-ascii?Q?7SXY+gu/ilAYuzQPiz6av4iGq0pg+1ReCEbxs39JnrfK4XGkgRnS5m5Spjpm?=
 =?us-ascii?Q?l/P0/jVAoUxuEOGTbUfa+pM1ne1k+3TfDBxH6JLcE8oe9MsdK1+l0ixS37Pv?=
 =?us-ascii?Q?LkilXUBsK5GxecCkeMgueh0qKC8RdH767CGbikVXZr9gp0gVbyPZd925gln+?=
 =?us-ascii?Q?CArc3KlfSmXbzVfm6jZ2PJQjd6tvQFAb1F30I387ILLRLUPsXqCAp9/jLPJT?=
 =?us-ascii?Q?HkJvN/RJ3+fOo6DPVEMT7G0pnaHTPltcgdv7TSF3C2dDiYpBoHoOY4vbjdO9?=
 =?us-ascii?Q?9n4SOM7dZscH1MW7ccA5Uz9MpRNjvfDm1zs9Wf0ZaAVHQaucSupdUNXgWA3o?=
 =?us-ascii?Q?N9bvMoiRDAxW53WXItBwQOrFe8tiBDcj4f0/pfnrSo+ozKvngxPjbCFpWmKO?=
 =?us-ascii?Q?H83Bkx/0JSc+XGi8tiNTC88/hNsO6eztmtEzar2YGYsVEA6LUKcMyMbJDX+Z?=
 =?us-ascii?Q?eik1YUomsbDrApCCs5S0Av7b1Eq7ebzCs8FqX6IAc7uHm2NMua+vie5gc8FJ?=
 =?us-ascii?Q?UeVZfApRNbhZ+gKXw0bETCMIndoIwJOtLwt7QNGenNnOspZNSG2jeIk6YgL1?=
 =?us-ascii?Q?MRMoBclYg2/AkaMTsr7LhJ5mK6gFXah497bH/cE1Y4gqfsjMbTIwd4zxuNxl?=
 =?us-ascii?Q?E/D85f3Wwa/UxFaWG+RAHwKmnwk9XbpnNqWszNV8yFfyXP7nws3MdGVW3p45?=
 =?us-ascii?Q?MpU2Rzdspy2m/Xqfx2IBOnOH3yMNuQ/wlqNEgVb0v5yDyMFigvKuNkCWNebp?=
 =?us-ascii?Q?DWbr4vqJTOjORTsWB553/ly/xgZdJ0Ea9Hwt22XGALN4uqZFWpkhLid30Jx8?=
 =?us-ascii?Q?FHQuvow/FJXZAJEuYiswyonBkc4N9TnnFGsRYRJPgtOzFi5q+qjprJO17BBL?=
 =?us-ascii?Q?HxsiXhkVbWmIW1aJMpHmRV6kVs6rceMRJ6/Y/BZ8CehCHeDMlzEKYI6wb4NB?=
 =?us-ascii?Q?pU8QEeHJlB8WD5oOAButP6uwbbGd9By/Tu6r0ytw+9P7UqOP9vfrSD5CaLOa?=
 =?us-ascii?Q?l23NcPSTAWceNay7lC8zTv6I9CU3WwDRhyW27DzvuWtqyE3etSkR9x9Xip4P?=
 =?us-ascii?Q?jCB5lpC0TmYXjOVT7GdC5Ixq6KUirKGne819Tl69aP4XsyOc1365m+SjZaAX?=
 =?us-ascii?Q?HrCsGwRmWccuHzduF2rr16q1bAjYhWr+5fpC6AyIlvjiTPL8bAyVxSKsMBQi?=
 =?us-ascii?Q?NTm079xgR3bNXNSh+qObZyR58rZcbLR/qDsnLMUpnqsF1kXG5iEPJXmdiFnx?=
 =?us-ascii?Q?d/l9tqjMgqMxrRXrG+nkxx7E+ooaQg4+FVI+BAim2+sdqEr4igLWf5cz1eo8?=
 =?us-ascii?Q?9vdq8rNh7j7LzFY2o9BNMTuL+kLJSa7VgZGtn3qFvXnkBVzoTIX58JJcKtn/?=
 =?us-ascii?Q?BUoUjvMMI1sFck0SOzFd/1BbE4E7BF629Jb0SmVHEZ3NEVuUvfWIeC0U/hyA?=
 =?us-ascii?Q?h4emNs7uDl9dyb22fjCt0ZZ2dgo8hoHpattam+xNqvWhs7q7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82fd68f7-9199-47fe-e87c-08df1efc5aa7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7957.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 14:08:51.3120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XnCFdLaips7K8SRqzIhlESlsmlm3l2m/RrQFspyF2VEGNDrd5MA5vLir8uVHMT0/ezCGeZVo2QKSNUKZ+X/lUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8856

On Wed, Sep 30, 2026 at 10:06:24AM +0800, Hangbin Liu wrote:
> From: Hangbin Liu <liuhangbin@kylinos.cn>
> 
> fib_tests mixes use of $ret for both per-test return value and global exit
> code. If an earlier subtest fails and a later function sets ret=0, the
> script will exit with status 0 even though [FAIL] lines were printed.
> 
> Use RET as the per-test return value, as already defined in lib.sh. The
> exit code ret will only be set in log_test().
> 
> Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
