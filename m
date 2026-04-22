Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023091.outbound.protection.outlook.com [40.107.162.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED813E9F88;
	Wed, 22 Apr 2026 13:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776862821; cv=fail; b=CR3pg+O9FtgznXbk5xs/B0HUqI+WWHktbOhtzkfA85lNcFzpTGmVcWe6LIgyMaee2125aS+54L652tKA/VDBXFRHhvkdlg5RgbUG29WWLkdg/DH3OkLmqOgOXWkQVzXoDrYm/iAs12NBzPuRaQa/DyowO+JB0J+BSvu+oq/Q4f4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776862821; c=relaxed/simple;
	bh=rmVaG2OYE11q7aG+oZnac80MLe3ritQRphJVTys1iqs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BvgGppytPrpOFp6vcAAegLsqeAoNY7jKWiY8NyDOLH6hZl6P0PGbwqM0E1ZMyM3HU3ifgYUYpfhENw5mFenPF9Y3snIKi6u4DeoT1wQD3cIz/eq97k94juctFsKwqj8ab2s2rSXuxLMpcSrJ6k2Qw3TitMWYDlE3WR5U05/0gzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=pEtHNl9N; arc=fail smtp.client-ip=40.107.162.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="pEtHNl9N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YtHjRlkdM79E9GlG8bs7re8zWAZswe+3jIme49gN9EI+hedTdwUVfYaErvGOShLsTdp22xsJYMFnK4Gl+pMT4ebhol6j1A1h+RFCeDX+njVs1R3mr34Tu2UJVaO2OggEr9njeNCkyE4of+es9vMGenO9oMScPQRK+bLFLjZcjfhG7rI1zceqw1disUbTcVtKniS/Y0+4BRlFPwQ4S2EmeR6y4WWI5izhGl+4b3J3Xn45y4VU8qqf1sjfvGPVWuz5xWWEastLJwSikhgwpEvo4wXMJrCJRiwVzwDmcbqdRwONff5wzkvYslglWB0gw96c6212NG0Dy/spmUjFC4vJow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l4yRQ6pgpCP9DO3x4TC9QGNrg54cuDjS+d4TrspuK+c=;
 b=KDtWBqp0U4hAdl40D2jBHNH90cibj8R5BvstsY6/d5EWcK31vo+x3pRaDJej4Mbe64Hsk32diJ3udtT4p7TnDzNt8xQuQqzhI2seXxzze3WW9A/Q/fTCpnN8FrZDevPE2uNQVKbSN30N1ftCMOxJb+gIkkG3rszJkqPZeb2K6pHk4AVYibduMqlQyRk/DMGlT4DCleQ1kNlFYq+7Q391UOjFmrFl3an0eEzUmbjkUY49NHdTxBWbDCLI6eRcz5Ff/VbhlfCQivgsz+GoAU81NBWHdrLKfdSBfYvf707PWi3Wp7IbGEzbzx3W5meT9G835H15m2dL4fUMuHVBgXcSNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l4yRQ6pgpCP9DO3x4TC9QGNrg54cuDjS+d4TrspuK+c=;
 b=pEtHNl9NcIQtzO3jTEw+ig0x6Z2xS0lC7PUM/qannafQFxLeLBUaoIEfHLz7EhNLIgqKRWp/aOUlu5hF5Brf6t2fb019/d3hUxUvY8Ouuawa05B9TVyDE0bl4mVLBOH4AeC9qxpNyW+zv3yHQLWjLDMRgirUwoQIku2mLIIVorHayG7iMqDNFpcdJBym9IZ8yRhyp9QMepSL70otfXFQ0OV0hTYS5R2lAYVmb5tpCGOVgFeXwPJRGHRswWv3ZB7cD8WkcviM/6A0aMjpe8qYg+duX87XGcANGfQ73Z1gfZnMVch6vs5xI+2IXesZSfGMo0abW/H0t3lksG+NzGGtyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DU0PR08MB9003.eurprd08.prod.outlook.com (2603:10a6:10:471::13)
 by VI0PR08MB10683.eurprd08.prod.outlook.com (2603:10a6:800:208::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 13:00:14 +0000
Received: from DU0PR08MB9003.eurprd08.prod.outlook.com
 ([fe80::3470:51d7:36e4:36d2]) by DU0PR08MB9003.eurprd08.prod.outlook.com
 ([fe80::3470:51d7:36e4:36d2%5]) with mapi id 15.20.9846.017; Wed, 22 Apr 2026
 13:00:14 +0000
Message-ID: <301ac97e-3f7f-4979-92b0-d5124ff571a7@virtuozzo.com>
Date: Wed, 22 Apr 2026 15:00:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/pid_namespace: compute pid_max test limits
 dynamically
To: Bjoern Doebel <doebel@amazon.com>
Cc: Christian Brauner <brauner@kernel.org>, Shuah Khan <shuah@kernel.org>,
 "open list:NAMESPACES:" <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
References: <20260421194344.2981537-1-doebel@amazon.com>
Content-Language: en-US
From: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
In-Reply-To: <20260421194344.2981537-1-doebel@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0321.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:87::18) To DU0PR08MB9003.eurprd08.prod.outlook.com
 (2603:10a6:10:471::13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9003:EE_|VI0PR08MB10683:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d34b6ae-860c-4ad0-75da-08dea06f1823
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|10070799003|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	lKKMlyNZVBOj/xh7eF6eTkloCr/3C1YOAe/I+x2zoCQMHBC0FbfGttiprcROx3x0XmN1b8meBekFymklWcQMVkgbeShpdNTW2TY78LwrF8BS6YclJ+O9c7peQtZHUBBpqA5/qw5aq/C+wgb9hf9KjtPswjL9vb41mSqlaapp2xxAp4h72CnV6JGc9jzmXdUW3fcZ0GW2xuE5Sgb3hloVcM5SG7vOy0KhGrgnavXbTfh3IAeR4/rKZp4FHE+8e8i5NMTLI4hBLQjuS2M0oA2xt2+0HjSIBRhfyJpkz31561fTm6Gv+ScwyCspp30PCqOhnEfLIBUZ7F7pM48IHjVCGa76z+rOUOokcm7pXfBaMKZUsvI9X/p+2SQIXy6NxVkZTXKrJ/2k0vNPzsoWlhBRXy7zeTDBM3BKt5MP9YWQYNk1TXjdm+TaeLixVX4zdPHEastdJKL7gclVx+NDkwqfp1sqU+e2TKkRhWHljYBtJr0YR6ybjUcNPBnILqXnWrQic3UmzXnC8t7laaGdppeiLABRZQAFUue3HmzB48992rmPL7C0I8ooWJNyrF+3uegXHND4EdBYt1zliawTAuzJDY6lUC4I0lhmgkZzQSMgbLKOB8xVtnd1McSbyT60GKdnok65lizUzbRYktjm5JMU23WnIB7muoS5K2Wu8PH+3G5Lt4WKz9tKRZ0j6nBCSnRi5eaxQDSi9g25/S6RSz227X7fcL/YxbKvo+CfdxDIaME=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9003.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0xib0IrYTA1cWpWeWdnSytUQldaQUIxVXFRVm5MbWZVNlU0em5LazBMaFE5?=
 =?utf-8?B?V0R0L3RQNXZMeG1KeEFDdk9sb2FuUXdBNzNON0xEQXlqempla011bEFLQkF0?=
 =?utf-8?B?RUk5b0QvZ2JQQm1MVmNRUmlyc0dST1hyNFlCTU5LSngwVGRvV0VMdHZoQjJV?=
 =?utf-8?B?Ni9CcW00cjIrald0Vmp1YlMrWnErY0FnVnJRV3dscm5Ia1RNMGJydndhcDNZ?=
 =?utf-8?B?VENYek9SaTdHSDRoWDRSYitLVENVM2RVajUwbkxTTmVGR1c0OHZRQitwYUp4?=
 =?utf-8?B?dnpzTUI0TkJ1SmhZUXlDWk9QUE9RRmxNOEU3TXAwQ21memt2dHd0OFlyNUNp?=
 =?utf-8?B?YWJBaTRZMXhpYU12ekQzN0ZYMEJ2QTZKVWd0UWNSTTZDQjhnbitRenlzM1lG?=
 =?utf-8?B?ZzhRb0lIcU9CMEJJUFdDQ21WV2gvMzJqYnVPdHN3RW9QUldNdXNNTk9MZzRT?=
 =?utf-8?B?SU11dmdTOVFib1NDZERGNzhpc3pKVm5HTGtUZ2tYbDRUcFVKSmZJVzFNbFlH?=
 =?utf-8?B?R0N6NFMrN0hKRklPUUJJS0lFZ1pwbEl6em5mdTJoTTlPVWR4UHMxUTliMTRP?=
 =?utf-8?B?R3hUQnA2em1rU250d0lOcWFIR3FMQ1VtaE5YQjdObEJDUVl2TEVvemhETGJR?=
 =?utf-8?B?ckl6cFI1MWRYMVlnWmQrYnQ4VWlEMGFHb2ZoVzBES3FEK3hhd3pQY2RKNGZZ?=
 =?utf-8?B?M2p2NW5PZmtGeE8weTUyaXpaNktIdDdTMHdJMSt6NFE4QjE4TGVDOUZtSmxw?=
 =?utf-8?B?T21hd0F3SUJzenhoMmpCTWRHS0RHZDZsYWpmeVF5ZG9rVUluOCtvaHRkcjU4?=
 =?utf-8?B?TCtsUmpuWGxhbWQwWDBrbVQrd3QySkFTWEt1NzN2Z3BnNi9NN2RTKy9pY0ww?=
 =?utf-8?B?YWROZG5ZMnpWU2NTcU5CWU1iaFdLWU80YnBxUFlYZmFobEJIV21DUUZBVDdw?=
 =?utf-8?B?REcxQ0pUODJqcm5BUkZuenYvY014ay90b2YwS0VjR1RBUnVCUjdkTHdoQ25H?=
 =?utf-8?B?bmliK0xFSWt4N05vZHlUamliei9qRHBSSXg3SG9MNWNod0hqQ2JFWjJ2algr?=
 =?utf-8?B?MmRvMUV6Y1VlZ2wvUnhNdlpTc2RFUlNUVVJxQ29vRFY2SFpmcE0wV3JHQXRw?=
 =?utf-8?B?elJ3Z1VXUldJQU5DR1IwQWp5WnlxRDRmdWxUR2lOZUJqU2IydDZJZ2N6dEs1?=
 =?utf-8?B?akM2bVZ6NGxwWnMrZzVJWG93QzQ5VzZwSWsyMHQwcVBPK1hSMUJuSmc1dzBX?=
 =?utf-8?B?ZC82S2ZUaktYWFlHN2lycjh0U0pGaUpYZ1M5L2NNbTc3bXNyWDF1ZlRXZU1B?=
 =?utf-8?B?bWtpS2F2ZlFxS09wQ1pNekFoTE5FRFpvSzJYN0hSUmRPMFl5ZDRZdWplb1F6?=
 =?utf-8?B?b09RbHBaLzFFcmEyVzdJdlB4dmRMV1EzRXU4RUtOOVJmQkNHaG91cUpJL2Z3?=
 =?utf-8?B?Y1R0T240b0NUeGM0STZzcS82elJwRW5ldWcrNjRKTDE1bSthMFErVDNVSTlY?=
 =?utf-8?B?aHNHY3JPd0RUaDFZVEEzVitZa3lBREliQXZQbmovMkJlVDlLVnRUTnFFU1k0?=
 =?utf-8?B?ai9SQ1NsQk54TmRERyttaXJVMHNQTVpKM3o2d3BsRHlzT3haMWhmUnlzeE1z?=
 =?utf-8?B?VnAyM1RjNFhPcEcyRGF5SW9mUlRrYlM0bHk2a0Y3Zm1rNmNPUUFxUE9NcGoy?=
 =?utf-8?B?QTJiM1dnbmh4aCtYeUsxZWZqdEhsVDM1VmNaeEFXQ2F1RkNNOUoxZ25GT29m?=
 =?utf-8?B?K1daQURIQnN0ZTNhUk1BTkg0V0EvV1d1SkRuWDVmbWdZS3paL2pzSFh2VmRl?=
 =?utf-8?B?UElZVFk0Rk9QTFd6UDc1eXgzbjV0a0JoMHZlKy9qeG50TWpIdXViRTYraGRk?=
 =?utf-8?B?MzR5NW1nTDRTVWpjaUROWWs0YlcrMnN6WDR6TWhFL256MnRraUVrQzNnL1NY?=
 =?utf-8?B?SGw3cW1UdTEvWkQvaHBJTjFkTmNtcjhGak5xbXEyUjdEN3FSMHhzelNTTEZY?=
 =?utf-8?B?QU9Ebko2dGM3Q2JHZjEyem9aTGhWbU9XaVZNZFVjUDY1MS9oWG1pMm9LZS95?=
 =?utf-8?B?RVFieFg1YkZROXNYdy9rYkNONXV6OHJKL2UzeUt3MjdlODFIb09DNUxlNnJI?=
 =?utf-8?B?RzNVTWJKT0dZU0ZvUDhSQVdEYXVWOHpmSk1tTG0zODNNYnVNUVJjT24ySGZX?=
 =?utf-8?B?UUxpWkJVbUFRekkrc2tta1FEQ3ZPZ3JpMDdFdGxNdmlOUDJQVDhobTNJaUdz?=
 =?utf-8?B?b3pydkFkYVdjUHVMMUY3UmJ6OUNCMWRpM0JqRFBPRm0wMDBkemlTT0FRYXJC?=
 =?utf-8?B?U042QTkyWDNVZXF0TlZ3b1pZNHVFK2V1Z0c4WnhhZDRRYVRKazAwRHpUSTQ1?=
 =?utf-8?Q?khAPdtT0PRxUDtp2vMKX5xBq2mZBszn/AfqyTYfv6dycM?=
X-MS-Exchange-AntiSpam-MessageData-1: HbkjvLXb9zqffxuzXf5Jmx0KuHH1aNOxp4A=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d34b6ae-860c-4ad0-75da-08dea06f1823
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9003.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 13:00:14.1736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pp0CwED+9r5k5qUA/19TVzHYnKRMCU7rhPTMmGp5ZjddpQNRAo2C26PBE7Yap371L7H8Oy0Gb2y62r19SwvSnOFYziO6Nl0IyedqDPz0t8M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10683



On 4/21/26 21:43, Bjoern Doebel wrote:
> This is the first email you've received from this external sender.
> Do not click links or open attachments unless it is an email you expected to receive.
> The pid_max kselftest hardcodes pid_max values of 400 and 500, but the
> kernel enforces a minimum of PIDS_PER_CPU_MIN * num_possible_cpus().
> On machines with many possible CPUs (e.g. nr_cpu_ids=128 yields a
> minimum of 1024), writing 400 or 500 to /proc/sys/kernel/pid_max
> returns EINVAL and all three tests fail.
> 
> Compute these limits the same way as the kernel does and set outer_limit
> and inner_limit dynamically based on the result. Original test semantics
> are preserved (outer < inner, nested namespace capped by parent).
> 
> Signed-off-by: Bjoern Doebel <doebel@amazon.com>
> ---
>  .../testing/selftests/pid_namespace/pid_max.c | 153 ++++++++++++++----
>  1 file changed, 119 insertions(+), 34 deletions(-)
> 
> diff --git a/tools/testing/selftests/pid_namespace/pid_max.c b/tools/testing/selftests/pid_namespace/pid_max.c
> index c9519e7385b6..8bd600f55421 100644
> --- a/tools/testing/selftests/pid_namespace/pid_max.c
> +++ b/tools/testing/selftests/pid_namespace/pid_max.c
> @@ -12,10 +12,76 @@
>  #include <syscall.h>
>  #include <sys/mount.h>
>  #include <sys/wait.h>
> +#include <unistd.h>
>  
>  #include "kselftest_harness.h"
>  #include "../pidfd/pidfd.h"
>  
> +/*
> + * The kernel computes the minimum allowed pid_max as:
> + *   max(RESERVED_PIDS + 1, PIDS_PER_CPU_MIN * num_possible_cpus())
> + * Mirror that here so the test values are always valid.
> + *
> + * Note: glibc's get_nprocs_conf() returns the number of *configured*
> + * (present) CPUs, not *possible* CPUs.  The kernel uses
> + * num_possible_cpus() which corresponds to /sys/devices/system/cpu/possible.
> + * These can differ significantly (e.g. 16 configured vs 128 possible).
> + */
> +#define RESERVED_PIDS		300
> +#define PIDS_PER_CPU_MIN	8
> +
> +/* Count CPUs from a range list like "0-31" or "0-15,32-47". */
> +static int num_possible_cpus(void)
> +{
> +	FILE *f;
> +	int count = 0;
> +	int lo, hi;
> +
> +	f = fopen("/sys/devices/system/cpu/possible", "r");
> +	if (!f)
> +		return 0;
> +
> +	while (fscanf(f, "%d", &lo) == 1) {
> +		if (fscanf(f, "-%d", &hi) == 1)
> +			count += hi - lo + 1;
> +		else
> +			count++;
> +		/* skip comma separator */
> +		fscanf(f, ",");
> +	}
> +
> +	fclose(f);
> +	return count;
> +}
> +
> +static int pid_min(void)
> +{
> +	int cpu_min = PIDS_PER_CPU_MIN * num_possible_cpus();
> +
> +	return cpu_min > (RESERVED_PIDS + 1) ? cpu_min : (RESERVED_PIDS + 1);
> +}
> +
> +struct pid_max_cfg {
> +	int outer;
> +	int inner;
> +};
> +
> +/*
> + * Outer and inner pid_max limits used by the tests.  The outer limit is
> + * the more restrictive ancestor; the inner limit is set higher in a
> + * nested namespace but must still be capped by the outer limit.
> + * Both are derived from the kernel's minimum so they are always writable.
> + */
> +#define PID_MAX_CFG_INIT { .outer = pid_min() + 100, .inner = pid_min() + 200 }
> +
> +static int write_int_to_fd(int fd, int val)
> +{
> +	char buf[24];

Why 24? Since val is int and longest int is INT_MIN, which has 11 characters, so 12 should be enough.

> +	int len = snprintf(buf, sizeof(buf), "%d", val);
> +
> +	return write(fd, buf, len);
> +}
> +
>  #define __STACK_SIZE (8 * 1024 * 1024)
>  static pid_t do_clone(int (*fn)(void *), void *arg, int flags)
>  {
> @@ -37,6 +103,7 @@ static pid_t do_clone(int (*fn)(void *), void *arg, int flags)
>  
>  static int pid_max_cb(void *data)
>  {
> +	struct pid_max_cfg *cfg = data;
>  	int fd, ret;
>  	pid_t pid;
>  
> @@ -60,18 +127,18 @@ static int pid_max_cb(void *data)
>  		return -1;
>  	}
>  
> -	ret = write(fd, "500", sizeof("500") - 1);
> +	ret = write_int_to_fd(fd, cfg->inner);
>  	if (ret < 0) {
>  		fprintf(stderr, "%m - Failed to write pid_max\n");
>  		return -1;
>  	}
>  
> -	for (int i = 0; i < 501; i++) {
> +	for (int i = 0; i < cfg->inner + 1; i++) {
>  		pid = fork();
>  		if (pid == 0)
>  			exit(EXIT_SUCCESS);
>  		wait_for_pid(pid);
> -		if (pid > 500) {
> +		if (pid > cfg->inner) {
>  			fprintf(stderr, "Managed to create pid number beyond limit\n");
>  			return -1;
>  		}
> @@ -82,6 +149,7 @@ static int pid_max_cb(void *data)
>  
>  static int pid_max_nested_inner(void *data)
>  {
> +	struct pid_max_cfg *cfg = data;
>  	int fret = -1;
>  	pid_t pids[2];
>  	int fd, i, ret;
> @@ -106,7 +174,7 @@ static int pid_max_nested_inner(void *data)
>  		return fret;
>  	}
>  
> -	ret = write(fd, "500", sizeof("500") - 1);
> +	ret = write_int_to_fd(fd, cfg->inner);
>  	close(fd);
>  	if (ret < 0) {
>  		fprintf(stderr, "%m - Failed to write pid_max\n");
> @@ -133,8 +201,8 @@ static int pid_max_nested_inner(void *data)
>  		return fret;
>  	}
>  
> -	/* Now make sure that we wrap pids at 400. */
> -	for (i = 0; i < 510; i++) {
> +	/* Now make sure that we wrap pids at outer_limit. */
> +	for (i = 0; i < cfg->inner + 10; i++) {
>  		pid_t pid;
>  
>  		pid = fork();
> @@ -145,7 +213,7 @@ static int pid_max_nested_inner(void *data)
>  			exit(EXIT_SUCCESS);
>  
>  		wait_for_pid(pid);
> -		if (pid >= 500) {
> +		if (pid >= cfg->inner) {
>  			fprintf(stderr, "Managed to create process with pid %d beyond configured limit\n", pid);
>  			return fret;
>  		}
> @@ -156,15 +224,20 @@ static int pid_max_nested_inner(void *data)
>  
>  static int pid_max_nested_outer(void *data)
>  {
> -	int fret = -1, nr_procs = 400;
> -	pid_t pids[1000];
> -	int fd, i, ret;
> +	struct pid_max_cfg *cfg = data;
> +	int fret = -1, nr_procs = 0;
> +	pid_t *pids;
> +	int fd, ret;
>  	pid_t pid;
>  
> +	pids = malloc(cfg->outer * sizeof(pid_t));
> +	if (!pids)
> +		return -1;
> +
>  	ret = mount("", "/", NULL, MS_PRIVATE | MS_REC, 0);
>  	if (ret) {
>  		fprintf(stderr, "%m - Failed to make rootfs private mount\n");
> -		return fret;
> +		goto out;
>  	}
>  
>  	umount2("/proc", MNT_DETACH);
> @@ -172,27 +245,27 @@ static int pid_max_nested_outer(void *data)
>  	ret = mount("proc", "/proc", "proc", 0, NULL);
>  	if (ret) {
>  		fprintf(stderr, "%m - Failed to mount proc\n");
> -		return fret;
> +		goto out;
>  	}
>  
>  	fd = open("/proc/sys/kernel/pid_max", O_RDWR | O_CLOEXEC | O_NOCTTY);
>  	if (fd < 0) {
>  		fprintf(stderr, "%m - Failed to open pid_max\n");
> -		return fret;
> +		goto out;
>  	}
>  
> -	ret = write(fd, "400", sizeof("400") - 1);
> +	ret = write_int_to_fd(fd, cfg->outer);
>  	close(fd);
>  	if (ret < 0) {
>  		fprintf(stderr, "%m - Failed to write pid_max\n");
> -		return fret;
> +		goto out;
>  	}
>  
>  	/*
> -	 * Create 397 processes. This leaves room for do_clone() (398) and
> -	 * one more 399. So creating another process needs to fail.
> +	 * Create (outer - 4) processes. This leaves room for do_clone()
> +	 * and one more process. So creating another process needs to fail.
>  	 */
> -	for (nr_procs = 0; nr_procs < 396; nr_procs++) {
> +	for (nr_procs = 0; nr_procs < cfg->outer - 4; nr_procs++) {
>  		pid = fork();
>  		if (pid < 0)
>  			goto reap;
> @@ -203,7 +276,7 @@ static int pid_max_nested_outer(void *data)
>  		pids[nr_procs] = pid;
>  	}
>  
> -	pid = do_clone(pid_max_nested_inner, NULL, CLONE_NEWPID | CLONE_NEWNS);
> +	pid = do_clone(pid_max_nested_inner, cfg, CLONE_NEWPID | CLONE_NEWNS);
>  	if (pid < 0) {
>  		fprintf(stderr, "%m - Failed to clone nested pidns\n");
>  		goto reap;
> @@ -220,20 +293,27 @@ static int pid_max_nested_outer(void *data)
>  	for (int i = 0; i < nr_procs; i++)
>  		wait_for_pid(pids[i]);
>  
> +out:
> +	free(pids);
>  	return fret;
>  }
>  
>  static int pid_max_nested_limit_inner(void *data)
>  {
> -	int fret = -1, nr_procs = 400;
> +	struct pid_max_cfg *cfg = data;
> +	int fret = -1, nr_procs = 0;
>  	int fd, ret;
>  	pid_t pid;
> -	pid_t pids[1000];
> +	pid_t *pids;
> +
> +	pids = malloc(cfg->inner * sizeof(pid_t));
> +	if (!pids)
> +		return -1;
>  
>  	ret = mount("", "/", NULL, MS_PRIVATE | MS_REC, 0);
>  	if (ret) {
>  		fprintf(stderr, "%m - Failed to make rootfs private mount\n");
> -		return fret;
> +		goto out;
>  	}
>  
>  	umount2("/proc", MNT_DETACH);
> @@ -241,23 +321,23 @@ static int pid_max_nested_limit_inner(void *data)
>  	ret = mount("proc", "/proc", "proc", 0, NULL);
>  	if (ret) {
>  		fprintf(stderr, "%m - Failed to mount proc\n");
> -		return fret;
> +		goto out;
>  	}
>  
>  	fd = open("/proc/sys/kernel/pid_max", O_RDWR | O_CLOEXEC | O_NOCTTY);
>  	if (fd < 0) {
>  		fprintf(stderr, "%m - Failed to open pid_max\n");
> -		return fret;
> +		goto out;
>  	}
>  
> -	ret = write(fd, "500", sizeof("500") - 1);
> +	ret = write_int_to_fd(fd, cfg->inner);
>  	close(fd);
>  	if (ret < 0) {
>  		fprintf(stderr, "%m - Failed to write pid_max\n");
> -		return fret;
> +		goto out;
>  	}
>  
> -	for (nr_procs = 0; nr_procs < 500; nr_procs++) {
> +	for (nr_procs = 0; nr_procs < cfg->inner; nr_procs++) {
>  		pid = fork();
>  		if (pid < 0)
>  			break;
> @@ -268,7 +348,7 @@ static int pid_max_nested_limit_inner(void *data)
>  		pids[nr_procs] = pid;
>  	}
>  
> -	if (nr_procs >= 400) {
> +	if (nr_procs >= cfg->outer) {
>  		fprintf(stderr, "Managed to create processes beyond the configured outer limit\n");
>  		goto reap;
>  	}
> @@ -279,11 +359,14 @@ static int pid_max_nested_limit_inner(void *data)
>  	for (int i = 0; i < nr_procs; i++)
>  		wait_for_pid(pids[i]);
>  
> +out:
> +	free(pids);
>  	return fret;
>  }
>  
>  static int pid_max_nested_limit_outer(void *data)
>  {
> +	struct pid_max_cfg *cfg = data;
>  	int fd, ret;
>  	pid_t pid;
>  
> @@ -307,14 +390,14 @@ static int pid_max_nested_limit_outer(void *data)
>  		return -1;
>  	}
>  
> -	ret = write(fd, "400", sizeof("400") - 1);
> +	ret = write_int_to_fd(fd, cfg->outer);
>  	close(fd);
>  	if (ret < 0) {
>  		fprintf(stderr, "%m - Failed to write pid_max\n");
>  		return -1;
>  	}
>  
> -	pid = do_clone(pid_max_nested_limit_inner, NULL, CLONE_NEWPID | CLONE_NEWNS);
> +	pid = do_clone(pid_max_nested_limit_inner, cfg, CLONE_NEWPID | CLONE_NEWNS);
>  	if (pid < 0) {
>  		fprintf(stderr, "%m - Failed to clone nested pidns\n");
>  		return -1;
> @@ -330,28 +413,30 @@ static int pid_max_nested_limit_outer(void *data)
>  
>  TEST(pid_max_simple)
>  {
> +	struct pid_max_cfg cfg = PID_MAX_CFG_INIT;

Maybe we can simplify things by using global variable instead of pushing 
argument everywhere?

There is also FIXTURE_SETUP/TEST_F which can probably be combined with global variable 
too. Plus you can try to avoid calling pid_min() multiple times.

>  	pid_t pid;
>  
> -
> -	pid = do_clone(pid_max_cb, NULL, CLONE_NEWPID | CLONE_NEWNS);
> +	pid = do_clone(pid_max_cb, &cfg, CLONE_NEWPID | CLONE_NEWNS);
>  	ASSERT_GT(pid, 0);
>  	ASSERT_EQ(0, wait_for_pid(pid));
>  }
>  
>  TEST(pid_max_nested_limit)
>  {
> +	struct pid_max_cfg cfg = PID_MAX_CFG_INIT;
>  	pid_t pid;
>  
> -	pid = do_clone(pid_max_nested_limit_outer, NULL, CLONE_NEWPID | CLONE_NEWNS);
> +	pid = do_clone(pid_max_nested_limit_outer, &cfg, CLONE_NEWPID | CLONE_NEWNS);
>  	ASSERT_GT(pid, 0);
>  	ASSERT_EQ(0, wait_for_pid(pid));
>  }
>  
>  TEST(pid_max_nested)
>  {
> +	struct pid_max_cfg cfg = PID_MAX_CFG_INIT;
>  	pid_t pid;
>  
> -	pid = do_clone(pid_max_nested_outer, NULL, CLONE_NEWPID | CLONE_NEWNS);
> +	pid = do_clone(pid_max_nested_outer, &cfg, CLONE_NEWPID | CLONE_NEWNS);
>  	ASSERT_GT(pid, 0);
>  	ASSERT_EQ(0, wait_for_pid(pid));
>  }

-- 
Best regards, Pavel Tikhomirov
Senior Software Developer, Virtuozzo.

