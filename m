Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012068.outbound.protection.outlook.com [52.101.43.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C4237A831;
	Thu,  1 Oct 2026 13:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862922; cv=fail; b=SexG5eRuuxXNXXtgHM0B3MIFuPrE8wA94jW1hcMoyySKBiTW1lqL4wX+rHVwCjh5NVys43uMg3yvpEyC8VWd8QYvBQ4lGACIHlnSPh+36RuaWD9AnSp6H6l/a/cynRk41MivBT0R0eVxEOco/xYULZm9MjHmKQ5vaflsstKFeZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862922; c=relaxed/simple;
	bh=OTwX3E4lPyMNwQeDfn2T0hskA/1x2RSI41STJRof5qw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=L69p1dgVjG6HVu3LzhkQ3KnwOYRP9Lkrj+v0Ep7G8NM4pyxEsbkWcRIv3HUGR+DlazEy+st5HGXgjDAN8n9ndoBdq7d7+hVRqYn8XTZqcaFyUKKC5yAMg+NbWHDqyIVPASosC516eLqIi0z0JhosRF/JiOQe1zyK5dQOJU/nGpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=q6H+LFhc; arc=fail smtp.client-ip=52.101.43.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="q6H+LFhc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pD0HYF6Sr0nejyw7mtmCzmrRQeUzSzEbEnAohA8aqNvmuqA9dMFmOoIcY0YePmTpx9wNF4s/8mHybhWDmk0Z8BEwmC7oiES6dCj+buHF4lQsJE65SINQxIVvMYcEuk/swD8P7vzLldC2KniAdRhC7UUpkLYxQEqrhGpOJqaIhfNRzCHJfgn2l9rmtEIJ6CAyrmDw98Z0Waq5l+FWYOJ+iktShzq6zBjeWDm40G3lt7GTGP8k/9Ilo50TmTfsWUqANJFpxJNQd0wt8AVX33Qhi+Y5cWeVZhQ+EFb7Ft24qKi+mILZKPwI/2o2UK6QXMkCHmLA/hGz7crg7e5y9/eMag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3siXg0IhTY//Sutc/x/nP5WRti7EKsOTdiA3nQA1VbQ=;
 b=jKbTTWYpWuYnbjGf+vRxU/ZCwcbo1stR1hezElhp/maDScnA4YKBDdwJzskzg9uv/F4BKV9oCiIvCmW8+I+xl+rhaMVl9lYrpNF5RsxK3KcT/pl11pzh8vO2d6YOZPNXYvM+8HcI3bnSWdsnA/v5pt97Ms1hnfHU3UFrZkvjf89fQ2g2oXm5BceRfwvwGrIlpqOpGAy1ZtsDsz66AIszheEVWdbHxTMfu74tx8/xfdwp9CJlwWAuU4JBt6nLolOK1vH52Qe+2p4UrshFl9a/rSKyWrCPItM9TUgZPV3KKComtfmdl7rssLPaNJX6N79cd71c73iHPUaUxjV5WvQnPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3siXg0IhTY//Sutc/x/nP5WRti7EKsOTdiA3nQA1VbQ=;
 b=q6H+LFhcoUMnNa1FMxW/1RkyWTd0onQaLk2MgVX57Z8PWTPUBKHVACro44ykXAfAK8LxfJHi8P8G7eiZlibuPh6Co3aCTcJCQgZ+fEQjmvawxyl37vwHIVBfISoJauUDG0/yNHXmEfXbh9it2daPGiKMaqVcq3zZa8gw+wgEp8y3mH3Ku+Vz5Tlpjmj5F9iMNDlyRwXOiDlyMNUDTKq3E3sbkIlwhi4vvnXo0Xapcc87Nx8A1gJV9wzJwIKOhajNryaa0yC5h7QqtS9jjnWjCFFi/vXsl0XdzhfFhaY7kRtcksGQsK4XDfmrH+I1e6FIAAK2sFVLxdIKq9Ptlsm9vA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB7957.namprd12.prod.outlook.com (2603:10b6:510:281::22)
 by PH7PR12MB7307.namprd12.prod.outlook.com (2603:10b6:510:20b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Thu, 1 Oct
 2026 13:55:13 +0000
Received: from PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499]) by PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499%3]) with mapi id 15.21.0451.026; Thu, 1 Oct 2026
 13:55:12 +0000
Date: Thu, 1 Oct 2026 16:55:01 +0300
From: Ido Schimmel <idosch@nvidia.com>
To: netdev-bot+sashiko@kernel.org, hangbin.liu@linux.dev
Cc: hangbin.liu@linux.dev, dsahern@kernel.org, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, shuah@kernel.org, idosch@mellanox.com,
	dsahern@gmail.com, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	liuhangbin@kylinos.cn
Subject: Re: [PATCH net] selftests: fib_tests: use per-test return value in
 subtests
Message-ID: <20261001135501.GA1567272@shredder>
References: <20260929-self_fib_tests-v1-1-0eab6a3c3a3c@kylinos.cn>
 <179083069319.434549.6042480426596220206@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179083069319.434549.6042480426596220206@kernel.org>
X-ClientProxiedBy: TL0P290CA0005.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::16) To PH0PR12MB7957.namprd12.prod.outlook.com
 (2603:10b6:510:281::22)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB7957:EE_|PH7PR12MB7307:EE_
X-MS-Office365-Filtering-Correlation-Id: 365be658-ccbe-42ec-359f-08df1fc39d0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|23010399003|376014|366016|6133799003|22082099003|18002099003|10067099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	CzD7LfAFQWOrAUvPk5SXT5t++BgJaQigenYEDyfxNeM2mZOyRWo0HrxituC58Hc/u5cFwzrW9Bj5ds37rLJ0y7g61Vs1oXF12GFL56qfbBEXQFgnwcO3uTrP1ox9APLipwEPyrUI5Bm7kFnhSe2em5VBUZqxWun8QXhRKrKkzEBb3lLo9e+v64ZUWmeyyF1tqnwuy3CE42v0nvowiAL1GrX+1PNPy7VmKtLg5gAK2EmKHUzq1ZbVqlq4M1VI7vnUE1Zh1SfCvWvzzkzZrguxn/anRzk/Prd+dtMb3mcUBZ/E91sEMcGLjRB+QeXj7NrOKIkjzlSg6TT1mKjbUJESr58JRr44XdQKa5v6sAOmU7/5thK8NBNxC3neD7YhU6sZr0BMCf6SsnHBPc9ieqU07y31Qw+jWQKK2OzjdHk7LwBnHnOvLZDNvuMGiLoje7USFKou68YPbWmT9Sm5/2lCFIHBfTHek/oobDNSKwLy8vCg/kCfsi+0fgRRMKYMeuIs1oryg8HyL7JwHrR1ZYlNYIFSIBov7R+/zTxxSZZNcjCLDyPmA4c+zHkUU4ndZG5RT6aO3cwy5pYjkWPp00sJhO5x9Iel8LLdggJJGOl/+yiJNdeYJwdFeZRcdrJz8PRdl5QhhaBUHKHgRtuteDeokQ/mlOQG6LcY3MPuauPuMd4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7957.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(23010399003)(376014)(366016)(6133799003)(22082099003)(18002099003)(10067099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R09MYmFqZ3diOVliWStZOVRqWk1jS0xHa0F5ZFpxcGVHb0lrUS9qYm56c2U0?=
 =?utf-8?B?ckliWXQwb01JNUhWKzJCZlVmbzVHaWxmanZtR1h3YUFJQUQ1RTRCUlZjMHlX?=
 =?utf-8?B?Z2IrSjRmZFFMOEhqeWw5QUlHR0c3UEVLbkQvNlhacGR2cDJsOXNKZlFIM2lu?=
 =?utf-8?B?THVYVDRmY2k5SlF0WEVrb2dTZjdJaVZzQVNuMldkdUg1OEdIYnlOWEhZQmdU?=
 =?utf-8?B?QUNNekxBOXFRTDgxQUI4SkJ6eEZ4SHc2aWVQMGt5UGtzU01qcGRNZ3VIcmk2?=
 =?utf-8?B?YUV3YjFWajdwWXpPU0xIak9nWkk1TktpbnBSTXN3bXY2ck5YR1lxVWxjU2xl?=
 =?utf-8?B?cktmMXVta2FHbFJSUUxWbmo2SlBIU0tuaFd0cTlLS2wwT2JtcHdILzh2dCtE?=
 =?utf-8?B?NkhhL1FHREdPRXp2VWw2azh2WkhYTkpOU3p6M2NrQ21NQkZjVnRIWkVCNlVT?=
 =?utf-8?B?elhla0puMk9yVHE4VXQ4L2k0SUw0cjRNVVZVQW03YVp1Rkp5K3JMZldNUGY5?=
 =?utf-8?B?anVuUWxZOUcyMWQ1cXpIYnY2d2dyaGhXVzVVVHZiL0dzZnUvd3FjbGN4Szhi?=
 =?utf-8?B?aEEwRHo1T2VlNkxSdnZ5Qkl0NDZGdWdNMEFwVkg0YnV4YWFWNUM2UE1SR1I0?=
 =?utf-8?B?VHV1R2NDSWdiYTFPRmZIZVRDcWFWYlJWQWNZK3NvVGl0ODdpVisybjU2MHdo?=
 =?utf-8?B?VW1STisydTRESGpPMUN2VEJtbnc0T08wQ3BhOUM5eDAybjUzaVorckgrampJ?=
 =?utf-8?B?VE84SDNNTlkvL000L0tmUFFOMHc5WWdlMlFuT1hpNGgyejcySUFnYzZUYVBX?=
 =?utf-8?B?aXN5eWx1NDFiclA2djkvZ2dZTDQ2OFNCcFZxN2p1NEc5YXlOd2RTRjRhbEdP?=
 =?utf-8?B?RmIvUHN2OTdKRVdQSDFJWldjQjM1QW1xVkxON2l5Wkt0aEIwaXBlUVcwWlVY?=
 =?utf-8?B?ZityY08xK0gxc3Q4OTlvVkl5TkVNckdKSTBOdFdueEpVTFBIU0pMK0xBYUc2?=
 =?utf-8?B?Rm5laTdqeWpRS3JZZEl4bCsxb2JVSHJyZVdFSFgyenZPYVl0WkZoZkFWb0RV?=
 =?utf-8?B?RWJLQzd1aXMrVWlsVkJKalVOdXVKdmZkME1rWEhxQTZvOHplSTZoWXJSeHVH?=
 =?utf-8?B?YThkaHF0N2twemJaVnZMQXZ5RmZRWXYwRHZsM1BISlBuSzhnMFpMaFc3c29J?=
 =?utf-8?B?QS9PRUdVUjluRGNNQWVDejVpL3ZUMWJnUExIeVZPS21BVGdETDZaOTFUYjRN?=
 =?utf-8?B?MG12S3RXN0ZOZng1ckZMemJLNFlIK0ZDUjdiN0phSEpudTIxK1ZrdUdiMGlt?=
 =?utf-8?B?S0d6c0xONWZMV0JtNDk2T2wxZWt5Yk95RDdqYnovTDBPbkp0MTJQbEFBT3NN?=
 =?utf-8?B?K2kwZ1JKeDNGL0JtVURhSnZjL0JVVzNBVFprbHdEd3lGemRoTm41eXZjb0gv?=
 =?utf-8?B?UEhMK3BiQ0ttc0YwajhHTXBxNWVwcis2Z2oyQWNFM1J3Z2Jzd21FR0Z5V28r?=
 =?utf-8?B?cS9hOURBalVIb3MvRnBSUi90Y1JjWUVsZlc0VDduOUkvL2J1SWxBLzZCSGV4?=
 =?utf-8?B?Qjg1WEJNcWI2RGpST1RYdnQrcUxoY05BeUxxSUNQaXVGeHRsQmx4Y0xrWHJT?=
 =?utf-8?B?SWF2cDN4eTJvSWtCS1drL09XR1pvOVBURXFPak5BUGdqR05XRUFVcUl2bU81?=
 =?utf-8?B?UjZLbXRLZmt3UHBFamtNdTdMbm9MR0E0ck9YVHplNkh5c3U1VDVnNVk4Uzg2?=
 =?utf-8?B?T3c0ODZJaEt0a3FGZ1ZGN3JlK2s3ZFd0b2IxNFMrOUVZUGg5T0d6aU0rYVpy?=
 =?utf-8?B?dStaZVppNGRGUUhKTCt4cEZSZ1Z0RmlBUHo1MndLWXBZOG9peFhRcGNrd0Ur?=
 =?utf-8?B?N3hDejFRQzNDNmhudTZzeCtycnJKVDNtTTZQQkt5bDh3S2JoZTFKOStSOUZ0?=
 =?utf-8?B?TTBJQU94QXJESXNiakxybU1sRS82QUhSUXEvQVc1V3BXUHhJRFJITTRacURq?=
 =?utf-8?B?TUZFcERNZVpoMWcxajJrT3lIM1ZmZnVadmsvblZTUUkvZS9Nb1pyazQwODli?=
 =?utf-8?B?c1BNajBQZzFjNDc2Y3BCOUYwaWVuSFRhRUR4eHc3aStsRW9YTHJXQXprV1B1?=
 =?utf-8?B?VE9DajEyVUtWZ1lTSnJ6di8wOWRWbjhiYjlFQVRnTGEvbldtdXpMWlY4M3ZP?=
 =?utf-8?B?TzVPNExVVkdJa1JkZGt6Tnk4dTB4TVhsdHBFZFNPb09wVElMaXk1NzUydU9l?=
 =?utf-8?B?TU96L1pOR3BuMFZiK1RaalRtNEdkbWVFSHBjNU5UKzlLeDhESWxjS1E3WGRC?=
 =?utf-8?B?VFZ4a21seDlTdW81NmlBRTl4dURMUXdiQytqTjVNM1MvcHRyMXYrdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 365be658-ccbe-42ec-359f-08df1fc39d0c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7957.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 13:55:12.4646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2aw2P6aICvHKwu1zrnIoc9o2XWMdk1HmOVKZeejirQLeSh5rzbPoZYrc9R37JFWRVD2WXLdQS8n8sdGJu/9pIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7307

On Thu, Oct 01, 2026 at 04:58:13AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] In tools/testing/selftests/net/fib_tests.sh, the patch
>   converts check_rt_num() from `ret` to `RET`, but the helper still sets…
> 
> --
> 
> selftests: fib_tests: use per-test return value in subtests
> 
> This commit changes fib_tests.sh to use RET, as defined in lib.sh, for the
> per-test return value. The global exit code ret is now only set in
> log_test(), so a later subtest can no longer clear an earlier failure.
> 
> Closes: https://lore.kernel.org/all/178961184152.22033.9267194009793243294@kernel.org
> 
> > diff --git a/tools/testing/selftests/net/fib_tests.sh b/tools/testing/selftests/net/fib_tests.sh
> > index b338bfb196a27..9ce5623b049c1 100755
> > --- a/tools/testing/selftests/net/fib_tests.sh
> > +++ b/tools/testing/selftests/net/fib_tests.sh
> 
> [ ... ]
> 
> > @@ -763,9 +763,9 @@ check_rt_num()
> >  
> >      if [ $num -ne $expected ]; then
> >  	echo "FAIL: Expected $expected routes, got $num"
> > -	ret=1
> > +	RET=1
> >      else
> > -	ret=0
> > +	RET=0
> >      fi
> >  }
> 
> [Severity: Medium]
> check_rt_num() still sets RET=0 when a check passes. Can a later passing
> check_rt_num() in the same subtest hide an earlier failure?
> 
> lib.sh describes RET as "Per-test return value. Clear at the beginning of
> each test." Its helpers only ever raise it. For example,
> ret_set_ksft_status() does:
> 
> 	RET=$(ksft_status_merge $RET $ksft_status)
> 
> Several subtests call check_rt_num() more than once before a single
> log_test. For example, fib6_ra_to_static() does:
> 
> 	check_rt_num 1 $($IP -6 route list |grep expires|wc -l)
> 	...
> 	check_rt_num 1 $($IP -6 route list |grep expires|wc -l)
> 	...
> 	check_rt_num 2 $($IP -6 route list |grep expires|wc -l)
> 
> 	log_test "$RET" 0 "ipv6 promote RA route to static"
> 
> Say the on-link route still has an expiry after the static address is
> added. The first check prints "FAIL: Expected 1 routes, got 2". If the
> last check then passes, it resets RET to 0. log_test() prints [ OK ],
> nfail is not incremented, the global ret stays 0, and the script exits
> with 0.
> 
> The same pattern shows up in two more places:
> 
> - In fib6_gc_test(), for "promote to permanent routes": three check_rt_num
>   calls run before the final "check_rt_num 0" on route list cache.
> 
> - In fib6_ra_to_static(), for "RA route with nexthop do not merge into
>   ECMP with static": the "2001:12::/64 via" check is followed by the
>   "nexthop via" check.
> 
> This looks like the same symptom the commit message describes, only
> inside a single subtest. Could check_rt_num() set RET=1 only on failure,
> with RET=0 cleared at the start of each logged subtest?

This is a pre-existing issue and should be handled by a separate patch.
This patch merely renames the variable.

Hangbin, can you follow up on this?
