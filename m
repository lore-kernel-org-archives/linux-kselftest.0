Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012022.outbound.protection.outlook.com [52.101.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9289652BE5F;
	Tue, 29 Sep 2026 13:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689533; cv=fail; b=ZvZ4zXjfBuHITvDMuXPrwfBkclqoVOO9OK7l3jitC6XBD6UvoK0N98RpLVV7dsgxmWv7h4Vh3Zo3CI5QEQBKKnA8I6x8NsC+mmL3Ie6OH47HJ2CrJET7QpwlfIDydv1QsNcmRG0zw/g4E+KeMByFFuTeeBmJbEcSB/O87QF6wKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689533; c=relaxed/simple;
	bh=txwlHYzy+TU6bWP2xIriLNr/llMH0kxnhhSd/OnyJ8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dKWCTocsUazg/DlJs+ouQobgrOlIYt7N22687GO/v72Sro8xJOXLnz5uom5pPUf37RQfzGI1/snn1YQ1InGBMokjWTy3F1uXNH1+PCFkYABhbuwr3zfATyja6KfEbGWol2Hy/wRolmIpwCYbKDv/s1/Wt1djYgICs+vc/AOou4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hEYJcdZF; arc=fail smtp.client-ip=52.101.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hEYJcdZF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OdmtHO058+NzeFNhF+b8i43CQ8UHR+j2hekn6OpzcW6XX8KFiFF5PJ2F7Orimc6eO1wuY3qu2OGPoNIu2M09fTggDHTwRkRYOqdY2sHARbFcDk8uhBqlo6VE05cndDreqlAKjlGMPGr4x3woUy0M19RxQSIRB0WveAu2+exmBd2qAbClE38wYvZ/VgbA3OGpxVrMuqiSrrkUj0gw1JAu0XujcQzkw8SMJDKNSjoJK0XFxdKnyXBDtps5WiG6vDqxy8TOxwGJTjT1ribm/K6qAlZqsg8sGEGPebn19KWKg8C8AzHrwCiKvP6lEyjJezBi6V6HW6pcJSD6tYsu6En7fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvwHYLqezIZgrNiiB8EAisAF0bZyvs5BKjT/S4sI804=;
 b=A2zRtF5vZk9WTnvAYkdMYZJnTMy5Q1pc9fn5O52eL3YToSfpIABpcMWILzRJ0FAvbFWiXAIY4691SIqsYWrFa7ZewgsIH1/jjcJw6MntvJqqHtYEPzMc6xDqi8aTWbW9y+4PTpsGzlcxcIUxMCPWnRJ9xW5Qwo9M4dlkOvn1eLkGTSDDaX88LySxFaGq2UX03A75CPcxloyAXZ5BLAJTvZXzQY+4QAp1t8Y+TxhEbHKhhXUWQwqDrwGs58VgDyFsu45yc5cWuXP+T4xNL4YmjAwsCpQssSl9ap4hffkqcxqhltJ8DeGm6bUxZJypwF7iPOzsSDjHAP8T6LjgCpF4AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cvwHYLqezIZgrNiiB8EAisAF0bZyvs5BKjT/S4sI804=;
 b=hEYJcdZFvO7p6h4mqi3UfMFUH1sdcSvdQQNwHKN4LbJLM7a97UdalesR6zrxKVGNlsuXb14JUumEyDhu4nlca8srFZxvsVgyMNWNCuhN7S3jeXj9jB6dNQGkxb5ClhTF52w0wLCSSyZ+MNrcthw3SkY+c03ZEzQB11naBpbjgKMmeGyRIdI4umqXMpLfUIg4+RMsh9wKfAamoY7e+UIJa2nkXwNhYuMwVvcWdbt3gRPGi/jWqo89jnSAwVMS3lYdO7I1nOkjsqP+ewf5Nf4+ByjvjmCatkz7b2wEcEg8vKVC8rFqj5uW3jfOqWcLotive/EJa7dCVaBPL+KTrfQYIQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB7957.namprd12.prod.outlook.com (2603:10b6:510:281::22)
 by MN2PR12MB4469.namprd12.prod.outlook.com (2603:10b6:208:268::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Tue, 29 Sep
 2026 13:45:27 +0000
Received: from PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499]) by PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499%3]) with mapi id 15.21.0451.026; Tue, 29 Sep 2026
 13:45:27 +0000
Date: Tue, 29 Sep 2026 16:45:17 +0300
From: Ido Schimmel <idosch@nvidia.com>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Ido Schimmel <idosch@mellanox.com>, David Ahern <dsahern@gmail.com>,
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, Hangbin Liu <liuhangbin@kylinos.cn>,
	Sashiko <netdev-bot+sashiko@kernel.org>
Subject: Re: [PATCH net] selftests: fib_tests: use per-test return value in
 subtests
Message-ID: <20260929134517.GA832345@shredder>
References: <20260929-self_fib_tests-v1-1-0eab6a3c3a3c@kylinos.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-self_fib_tests-v1-1-0eab6a3c3a3c@kylinos.cn>
X-ClientProxiedBy: FR0P281CA0261.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::15) To PH0PR12MB7957.namprd12.prod.outlook.com
 (2603:10b6:510:281::22)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB7957:EE_|MN2PR12MB4469:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c7957ac-a2bd-4405-e485-08df1e2febba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|11063799006|6133799003|10067099003|5023799004|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/vUCtoDKngO9rpfhuyayHKXvqvpNi2fX03krKVrp7ZmbXRDL+10qSL02CilXXPI0J9AopQ7H0WOUYA7rEjE6KK6bCLV1Nfdl03CooEeUm1bSmVNCxrsdCHKac4Y2bspF+LDGRoxZ+IcAcCTG96xlfxHFEBsDqvf4aji2SRDkCAPBBG1Djk9On5d1ZvQUeHfBlsWn2j9uPBGXqY0TZN9HTJAdRANO8+Pg1AMUn55MzrVlarWxIXDrh7LAA617usMPfFL3TgwKLMBR1rxb7pQ0IL4h2DuZLxP7mqXaKcoSyhg8BPek8oMUGgsPdLwWIFG7WaLTgafZS+KT7fyHfkYuoDuKy+u50Ztxj8EU5R0eXpo6AXwctwH1fz9qHA1aIhAB7jPJf6dbK/lYXR4GNHdreKq2Yh2kmeSJ91Mb6Xchfg7PT4G7DjpcqvDhOF1fioQsCngB7McW9/LDsZlhZDFSPd90PRUHN9aE48BiWiI5aDk71x4yZ4N+RsZ2wE5M9kFCdv/JG8oJPyPdN30HXUtHGDamolIskbd7PoObFirePkP65h/16nqX54dBCBkfF5pj212wiOQRb7CnxCXjMx8mh1EDfg2zx2JN+XjkDVCB2ZJwJtJJpeXRy0y7tynVOWL5Tmjavap2UHBS8ACVPBUIumCEImSykKkONE1Cb0V0SYo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7957.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(11063799006)(6133799003)(10067099003)(5023799004)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ThvKxoswdmrfyLvbtNQXegzAxnglr83gPKkp0CXLwc6DSIgOvaXSF8qsfZwV?=
 =?us-ascii?Q?7r6lz3Zx+/xIDap11cALB2nzfgqfh7kSjft7J/TijpSsGjsCzd93qDX+VVIf?=
 =?us-ascii?Q?XrXnoixUIw2a8ElQNG4Nwy7oEgVjYeQvNoR4sQDxCXNfMEcA7mE75KXyFFfj?=
 =?us-ascii?Q?9GzYb0/ICiZ6cqesA41f003SvNspyjr23nqMSOOrJenjLwAkmfkdKHcH5p9U?=
 =?us-ascii?Q?ijiPg+/CQsMomsYDeaGdSqw+FVYxtkfWexo1s154mBt7/u535EILbDAkGG6Q?=
 =?us-ascii?Q?Z6OXxi8NwASLtlQgGxctnGLF6pvqLBVnLZcqK4mK7xgqVrbcsYqZwxIx4gaj?=
 =?us-ascii?Q?QX1c7TUwddy2+ouuh1WCoPEv2LOaRZZrQHBtMSUfLoatQLjUM4gruNcZDpHb?=
 =?us-ascii?Q?Zn9ElpssmdM6ZUEpHXA3+L2msPbiRyM3J5tW754TwdPAUiNlUxtAzhXAX25u?=
 =?us-ascii?Q?ItQfC0o8TOmUqSuRGZUNa4bRIxSnA/OaWKep3YBUa0sFY561ozvn/Dw+AstG?=
 =?us-ascii?Q?P/yR+IlY0vSHnqHg+FeNAr7Jc2JVGmat29E119Em/zPx/kTYmMMaBXI7B6IU?=
 =?us-ascii?Q?DGwTS7zn6I1JdjQLZmM5mo/+0/GZqHGrk88hbnN3D62kLNRklizaRczQQAdN?=
 =?us-ascii?Q?MK6IXvavPV2vo3/eqhXipmEkQWK2oOe0Qmx6jmQh7Q8xyvVIxKg/IKYdORXp?=
 =?us-ascii?Q?b94dqw0duK0Ty8QTWkW7FrjqpIswn0xdNAkzfc/3FxzlMsh1pnODvS2BDVe1?=
 =?us-ascii?Q?gAc8u+JxRDazr0CIYYcBrgfQ83ygxw2piz8GZWJwS1QHDITkiURsR/vcPH91?=
 =?us-ascii?Q?iBCU1pdcDawpK1eNS1k46VIKd5kf6ds9dx7zUowKn+NvpJfwd6xNh/GNFKVD?=
 =?us-ascii?Q?tEvJFsBcT7u0nzCGX8XGwpHHplTR0EcgYUZkcYt7+C8nZkJJfK+tcR4NaTOg?=
 =?us-ascii?Q?b/v39ZPU2ajBHBStOMwVfo4vfaW0wEyVrqAA7kRmc5QJiRMiy0vDM2sJvyV/?=
 =?us-ascii?Q?FtHisXy23MUsdqUFbxD2UV5O2ArC1wjwmdf2a+E4pTXc4sd/vajlzCepByNP?=
 =?us-ascii?Q?xss6u0hp/jaRJTAMSrpXue8WZwdsYNDXIjWK+niM+ZfCXIoJYsy6VaWmKUzp?=
 =?us-ascii?Q?2uAFbB2jtYbUPZxUsEUtYgNCwNEENgZ2TdhRz2SJG1r/in8xcD+lg4vANLzH?=
 =?us-ascii?Q?faYx/iAY7wwgndcPET2fS1tqqdXVdaWi4UYz/rBpBQ52zK/fJH05d9aPBR/y?=
 =?us-ascii?Q?Xf6UdRfTz2V7/3bOO6hgHQjYbSUD3/Mz+xQ0y0Lp+cmFzuRyDcTXL82GbQwR?=
 =?us-ascii?Q?8Msy6QkH7U2EIY+4e+movv+68IBX7jjo5uPWhpPHAFP6wtcNONfhOMnmR/Ls?=
 =?us-ascii?Q?EvwYmKjzUASIJVsCeiXl6+LCUmViz59ktOSNxPpFuoyk3xTSNi2Dw7f7KwFL?=
 =?us-ascii?Q?78AqbNogqKoKePpeAYifsGpe3EHyRWo0Ct4ENA1+4LfH3EQApv1jcNCly+Ym?=
 =?us-ascii?Q?AJUQfWJe+0JYH64tgr/aLqwBA9JcHd5E/OoE1mb57AGTx7MZzNquKCnv9zEA?=
 =?us-ascii?Q?iB4hSiwmF2eyrm1fFHrvfm4F4gdpYmSOp2/lcjBU5Ni6dJQdrJasxsZWxVWN?=
 =?us-ascii?Q?FiudYFTFmPF2aivUtqh2MImm8gmh4sipRiGYtdu0Wse8QEEiL6NZ8xG+f4vI?=
 =?us-ascii?Q?5+nXuQlkx9FfEDhrzr79rRCveALvpqhS0S8GZpApXgrT2eHD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c7957ac-a2bd-4405-e485-08df1e2febba
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7957.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 13:45:27.8131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ed6wVMvkNFcxX5aTMl/4H9xprU7vTvQ25bx/yh5lhac8hRb6UHUO0uKaqeiAsC8SZS64SU7jD8IyGy3zbqAf0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4469

On Tue, Sep 29, 2026 at 09:57:01AM +0800, Hangbin Liu wrote:
> From: Hangbin Liu <liuhangbin@kylinos.cn>
> 
> fib_tests mixes use of $ret for both per-test return value and global exit
> code. If an earlier subtest fails and a later function sets ret=0, the
> script will exit with status 0 even though [FAIL] lines were printed.
> 
> Use RET as the per-test return value, as already defined in lib.sh. The
> exit code ret will only be set in log_test().
> 
> Fixes: 607bd2e502f5 ("selftests: fib_tests: Add test cases for IPv4/IPv6 FIB")
> Reported-by: Sashiko <netdev-bot+sashiko@kernel.org>
> Closes: https://lore.kernel.org/all/178961184152.22033.9267194009793243294@kernel.org
> Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>

Please target the patch at net-next and drop the Fixes tag. The patch
doesn't fix a regression, nothing is failing (or passing when it
shouldn't) because of it and it cannot be backported cleanly to old
kernels anyway. I targeted similar patches at net-next in the past. See
[1], for example.

[1] https://lore.kernel.org/all/20250908073238.119240-5-idosch@nvidia.com/

> ---
>  tools/testing/selftests/net/fib_tests.sh | 40 ++++++++++++++++----------------
>  1 file changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/tools/testing/selftests/net/fib_tests.sh b/tools/testing/selftests/net/fib_tests.sh
> index b338bfb196a2..9ce5623b049c 100755
> --- a/tools/testing/selftests/net/fib_tests.sh
> +++ b/tools/testing/selftests/net/fib_tests.sh
> @@ -369,7 +369,7 @@ fib_carrier_local_test()
>  
>  fib_carrier_unicast_test()
>  {
> -	ret=0
> +	RET=0

Looks like this line can be removed (similar to fib_carrier_local_test()
above it) given that RET is never used in this function

>  
>  	echo
>  	echo "Single path route carrier test"
