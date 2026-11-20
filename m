Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795167556;
	b=cfHd6eElx2tfOmEkJyLEdZLwwAfPQ8fJHMKAp+VgjO/g94RWXts+UjdBRtJQrb+T2CkS
	 jvUp2k6x3KiHsRWRzXY2sshwHYl+cD6m3hDC1Q+DEhp3mLFuhvG4B5XYQd8ycVcQ9mFc6
	 Vc7Ir0sjn+8T4+F3yj2gwf9qpiX91qsRZnoES0W4UWf+ijoz5EIRA04E+yhiNtnqeo+v5
	 VzAMFuaeNFzjp544BT1Suyvw1Jo4J/LXuOs8N2s5lbhiLqdesbhATl+tOivmHNRzMue9d
	 7Bm+fmFNcCCjLwk4+kPJfmfto4ttPBJr4bFjDq+QfBEhbJVPM05zqkUECEJbKJMKvCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167556;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=RPg5L2aIJP5wKjWTXoVT4LzSNdaZ8ZXfwuigBnp8hyA=;
	b=KS/iqlBpvcINN6yzRlv+XLGbDoWObCjgiJeXq3VExZ19ZG7M+iM0rg9ilQ7CXBhzXfu0
	 Hc9/lAgpm93g8aLe6dKqtRZqqmvwQFuf1WX9XC+zG4ZvhEi8qY38XpnVCmaJvntFLpCBo
	 wMAdx1HMCgjvOkVE3L3unjuTlCWbAhNBm36mdwWmRaekcYmf8oB7dLEw7mzGprkTX/d5X
	 lBAkflfZPw8MsiYi96+rpA+KgjN6nNRo6Ll6KqJcGokbmWDAtXG2H5rwU9YxZUbuJ2BxW
	 7qU6pZWGunXbEomogFV8ocURH/rnBQN8d0khWJpnEZb7sBizL4W7u9gSt+KrgN2je3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="jJE4M/PH";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.53
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010053.outbound.protection.outlook.com [40.93.198.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B0C606A320;
	Fri, 20 Nov 2026 09:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64B0C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jJE4M/PH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQ4At19iHnKlftE1YeMlhxl4t+AKoOdVCstMMyoboL7RaSfUbQZvPafZFLm7y3PB+ComvVGwaEZ00OeLvgM0AuS9iHTo46YlJ8+1f8SSyKIE1EjJ4l7Ce0gG0r/ZQ545ihoyqUs+UEcz+dCPpMAIHooLyZhVebJJKeylxAp2/M8u+oPHW3t9YDQGeCBRik3Dcxx22i5icnCFs+POfELBwm3TtL6RZ5nnZHvhsm30R4bLQchcNcIhNfz8wQ6j7Qy5fymL8QqDoMLJpJ8AGsKL7dfDJXyunzoJ4F21lABTdxZKJhHrKaRbnNQxM+JDNLOyknp2IjTDIwUe0nN/yvpZMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RPg5L2aIJP5wKjWTXoVT4LzSNdaZ8ZXfwuigBnp8hyA=;
 b=me33Rjb7V2H69y4nZ8puj3kVanhwEN9v042un6TnPz/js6RiCIZbxYx9E28KVQMF5U1WpIWSkHRxVy/7VqpjTRmgW/NPWYs7zb5v3ZISEbmK6Bf3hrBKmUCKfkx8IBF1NTDoeecdLqvFpsgb+7Ss1U6dWU0HtE2qQDpEVTYucNhcoLLi5i5XRgwkgDJcyWtzfvRrPjUwVmnoajuIi9FZtj7yT9vh7EaYgwbKa/2KdYxjhwV7SN3ukgk6AxuhdickQNbyOfht1/PIz/PBODbEfp9jLIdrAR/7LxWHiVMilv2tRdGVTuFKpPmDpAXw8tEfyLTyVRfTf46n4Y1xdYCvEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RPg5L2aIJP5wKjWTXoVT4LzSNdaZ8ZXfwuigBnp8hyA=;
 b=jJE4M/PHeWcYhwl2Xzwo7bl+FYcu4H4v1ZocetISb/boftJ4A8uL79crqvD4mmG25A7mWXfVcb+9J9dnfSkjcQ5CgRP5NDHm/BS3cyBdnqE2y3C8PSoCNKK0MwDe8FntMJFWo/FO9CxNyqfzhGIQwfQ5NxvmX1jhGckZDJnVAM+Zn6/9CuxtYF7S0ZGr8mHpQk7/uWAs4orCKeZ+qcHvZUICA0Kjo1o/GQXWFkvwyYb+KQQDGmJTQTTSJC03cssV2/7wL6QFWEf8IwhfjrfOH6pm3xGvMEuh+aVitkuh3ja5Vj2cy4weu7zZzTpIRdqAK0vZyyHHi5q1xFXWeHh6xg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by SJ5PPF0529573EF.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::987) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Fri, 20 Nov
 2026 09:39:13 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0615.009; Fri, 20 Nov 2026
 09:39:07 +0000
Date: Fri, 20 Nov 2026 17:39:00 +0800
From: Richard Cheng <icheng@nvidia.com>
To: Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>, tony.luck@intel.com, 
	x86@kernel.org, shuah@kernel.org, fenghuay@nvidia.com, Dave.Martin@arm.com, 
	james.morse@arm.com, babu.moger@amd.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kaihengf@nvidia.com, kobak@nvidia.com, newtonl@nvidia.com, 
	kristinc@nvidia.com
Subject: Re: [PATCH v5 1/2] selftests/resctrl: Implement cl_flush() and sb()
 for aarch64
Message-ID: <awATfnP93NxROsJa@MWDK4CY14F>
References: <aurOz7iGKInyjddW@MWDK4CY14F>
 <b94aa5e5-a4ab-4b61-a864-d10ff1ff2b63@arm.com>
 <auxM9hVAgp61Qbgv@MWDK4CY14F>
 <c58c397e-26e4-4866-be80-59d9bd861654@arm.com>
 <808923a4-0a6e-4d8f-8ace-d3573aa125e8@intel.com>
 <89549a38-4764-466b-b66e-98bab801fefc@arm.com>
 <0583dad3-f761-48d5-a9a2-f2ad39567a6b@intel.com>
 <7501303c-d304-47d4-8150-b1efc8554d36@arm.com>
 <avhZnuz2caJWIfLo@MWDK4CY14F>
 <f609e8a4-00bc-471f-90b2-1b6ef3154adf@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f609e8a4-00bc-471f-90b2-1b6ef3154adf@arm.com>
X-ClientProxiedBy: SI2P153CA0018.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::9)
 To BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
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
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|SJ5PPF0529573EF:EE_
X-MS-Office365-Filtering-Correlation-Id: 62cad226-1ecc-41e6-2c4b-08df46ea1f0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|261021123027099003|56012099006|5023799004|4143699003|261022105027099003|261026140227099003|11063799006|261022113327099003|261021121427099003|261022075727099003|261026121527099003|261028144727099003|261102123227099003|10067099003|22082099003|18002099003|261009223027099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	ulAXcIu5ktjgVE2CNanOsJ3Opfw/rf8Bt/DPfcuhP6pHqW+43/V5nFusQWuXXZOc06O13rLG++1edLfpHEIG/f0NG7dtR3d9JKXDhvkJa6GwmkXWMbO402TWfvP5ONdNdvLsaHQBsRl0CfSRdScJboh4+H2JreaHjfxIRagBv0zIZEX2AN2wBeOazlYl54QyHn5gFWqVcDV2yv7DsDt5l1s+0WZzn+RdoOfCGShZXAJVhAB3MescpLTqBtUZpKMezpxe6OKoy9vQRIV6Hil8fNEFuuhPPJK78nqh8QEbHUqgqyC/Tl/vkVhieO/AxQWOvjOsGpX3gdu92lZp5Tm1rl1Hpjg1/u84m776gY0cI1e3fh0mryU9+nuDK0jDRuhcVux59wjQfN88/X4DHV9aP0Yo31uBATwvl5a64mezVOqdfiRDk/8z/4dRP16kyVt/j9T5FZOj0CTNy3ZLL7UH3tpwFF8YNgin9O2gAvyWY3EZMOs7DXCVjuHJyLlHpOTxCbhWNtWCMGyM6xuplT0yhqU7t1MuBGA6b/ijoF62dka0h48DsKhPGPa6/5z2r0ti4n0rNX0k76IJNc0czj1GYQQq4TOLOtiFeSapdyz+XuGMHLxtwgd+LkNY+uVYS2UQGtO3/uG/gkRpS4KjPRffpwzS1FbW69ICvsqDPuiBdjc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(261021123027099003)(56012099006)(5023799004)(4143699003)(261022105027099003)(261026140227099003)(11063799006)(261022113327099003)(261021121427099003)(261022075727099003)(261026121527099003)(261028144727099003)(261102123227099003)(10067099003)(22082099003)(18002099003)(261009223027099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KiavMETz0ZpKxWd34VP1OHro/kTBvLD9gv/HbS0iOzh3ktAVWoha4kmceqfb?=
 =?us-ascii?Q?fX6HrE2rhSBKEdKbvY6/rGgdJe2W3ZKfdBCb4jofgNd26Y906V7emPHw1rrc?=
 =?us-ascii?Q?t9T2tPbALzFDark0UMRErlbM4aos/Ljk7bCJxKLzEWnQXV+IugbRjchPVC9S?=
 =?us-ascii?Q?1AOLadypkUJUWx/gWQJt+7FWWCW57qEVNG3rorlqDD2x7ZID82IE+1EA9Jg2?=
 =?us-ascii?Q?qqTMgCq7DsLqnekXWBOnihPshg59GLL9geyGRTjpz+bcQG80CCsNNki68Tlc?=
 =?us-ascii?Q?+LtXLH+hXuFFGgBcIuTDUJe3YQR5lS27y5ZEKwtbp2rBxrDIW/jWyJciYBC6?=
 =?us-ascii?Q?DaZQ9pPubdY/EV8HY8G4e+iojDk+5Z6mvC7huB3iQxp9P6gIhMrCgBFAMqRK?=
 =?us-ascii?Q?pN7TASZiGDz48/MtsgAgDSFbfeFbYabiqiJ5g8gSbstn9vndI937CsJvR83a?=
 =?us-ascii?Q?zqiz55PPPzeUh8D1rkL3pxA7uc+GLDXnykmP39ZGuKVybHGdHoCxDAuLQleU?=
 =?us-ascii?Q?MdU4YSKXHTvq0rf3gdfbH2oytmj+M4zz6T+6uhaD/8tZrs8bNNUJnRgjEgJw?=
 =?us-ascii?Q?dEW3Vqr/G0wKsIn6FvQVd8xqrp+a6kYAhOQwv69t68uw0NfD7qfR/2JBRUGC?=
 =?us-ascii?Q?+vtat0V+z87pmMZ3tjqCa+/6go42l4C+AhFPktdHDO2i78q1BlT8Tn8cqeH9?=
 =?us-ascii?Q?OLEUVZKXMyb8HlbfrXzdgtQiJPuFw14b3hqv24HDaENEeFQo/yXt6CScrLpb?=
 =?us-ascii?Q?hxsyNRrHYC8NSjwnsZ7yM9Cd/yD2GmLFmP6eMvkzUOUg6c+c1lzXMbhlbAKd?=
 =?us-ascii?Q?fgQrPpNv09n/4hjK/0lSCYwTjz1uVZQJLb8Lv2JBrJePkOoajPKvP6Lqej4z?=
 =?us-ascii?Q?j4n3C29GbTZfMxPB2hMSuu8sDLiHBOBztxN4HQKtVWG+NUiJ6ljatwFUjuZH?=
 =?us-ascii?Q?GV+mqa+mMEVnDVOzMDSMNEfHR+Cu7YIkoXEsmV+2Jlsj991t253w3YSUtrT8?=
 =?us-ascii?Q?E0OTFt7Q7rOaMGBYoP6VkvA6U9iTPt2tX+NhdYElGVh1nuFoAUckaujP/EMW?=
 =?us-ascii?Q?yHxTOuxSworuxP1w3haRxnn0jWP9biOYBjayrDSDofxMKdaBbG/obtiDSxoq?=
 =?us-ascii?Q?X20aldO9OsNGf1WUcF3u3JHPKTDPSoXv3QLyX86+qi8pffAvpuJ+10sWry5U?=
 =?us-ascii?Q?jKprrdrj6xt0I25w9fzmht56E3pvMO23Ay2ARDLMzIpr9MxDd9My8XAezSzP?=
 =?us-ascii?Q?DThwK6u+t0S2dkjG+94nbO5FWXZslcfEFZgeKl7WqIr2Slfq7gcCm9SOTP2U?=
 =?us-ascii?Q?FdP5t3m3H5xgTkI+3fgSeSOY2xqFrEHZA9oyDnrM4BGA5OKSiDGYdX53fEp1?=
 =?us-ascii?Q?syA1//7bw+nRSdXM6uituF8qpKlKCHpEzWYO3+cFu6P67Gsp75cWmbL6k73G?=
 =?us-ascii?Q?0u3kZVpCC+6OADms8I73nUezbQjR0+CDKumWzSj2xzx4+kLUUPwb96OzON2s?=
 =?us-ascii?Q?UX3N7LrSCSSeDLbB35jRbI+55z84p5XIGfEEqa32/ZfOtUDEWpsDBitnZaYa?=
 =?us-ascii?Q?sv2dkRv1IPsDEm5xOas7inPFTcSFoKjNPgeIDYsHDrVyor6HU2WCx+K38m12?=
 =?us-ascii?Q?dQ6WSBZAiktGz2m0LH9TzZvnjN/iljZj3MxtsklRtTnoAvp7eZ1tYBy+gPH0?=
 =?us-ascii?Q?ym0mhmBzxhRpiekLf4BJlKdfAlYJBjCKx0I6eSsAeZ1FI6qUf7a24fhZGLyz?=
 =?us-ascii?Q?cofjvUYZsw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62cad226-1ecc-41e6-2c4b-08df46ea1f0e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 09:39:07.1809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7W7oL6gd0/FkFt0y4rDu081VCdzYzyVMy47sQvzE2LREeceSNnraJzB/6bcaELrsoev4B6lMRGLplC2L/2wKlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0529573EF

On Mon, Nov 16, 2026 at 04:53:03PM +0800, Ben Horgan wrote:
> Hi Richard,
> 
> On 14/11/2026 12:59, Richard Cheng wrote:
> > On Tue, Nov 10, 2026 at 12:35:48PM +0800, Ben Horgan wrote:
> >> Hi Reinette, Richard,
> >>
> >> On 09/11/2026 17:01, Reinette Chatre wrote:
> >>> Hi Ben,
> >>>
> >>> On 11/13/26 7:16 PM, Ben Horgan wrote:
> >>>> On 07/11/2026 00:29, Reinette Chatre wrote:
> >>>
> >>> ... 
> >>>>>
> >>>>> If you do end up using a benchmark I'd suggest to make the checks as forgiving as
> >>>>> possible. For example, instead of checking something like "LLC occupancy needs to be
> >>>>> X when bitmap is Y" it should check something like "LLC occupancy when bitmap is all ones
> >>>>> is larger than LLC occupancy when only half of bitmap is ones".
> >>>>
> >>>> Do you think it's too strong to say that a bitmap with n + 1 bits set
> >>>> has higher occupancy than one with n bits set? I think it has slightly
> >>>> more utility in that all bits of the bitmap are plumbed down to a
> >>>> working control but I'm ok with a weaker check if a stronger check will
> >>>> just be problematic and maintenance heavy.
> >>>
> >>> My comment was motivated by the recent change I needed to make to the CAT test
> >>> that uses cache misses measured via perf instead of cache occupancy. Originally
> >>> this test incremented the bitmap with one at each cycle but incrementing it with
> >>> two proved to be more robust.
> >>>
> >>> What you are proposing sounds more like an enhancement to the CMT test that
> >>> uses cache occupancy as measurement while following the same methodology as the
> >>> CAT test. 
> >>
> > 
> > Hi Ben, Reinette,
> > 
> >> Ok, then perhaps it's best just to enhance the CMT test to also check that the cache allocation
> >> bitmap has some measureable effect rather than a new test. In the spirit of making the checks as
> >> weak as possible we could just check that the measured llc_occupancy is lowest for the minimum
> >> number of cache allocation bits set, higher when half the bits set and highest when all the bits are
> >> set.
> >>
> > 
> > Agreed. I'll enhance the CMT test instead of adding a new one.
> > Please forget my "must not exceed" idea, as you said there's still an
> > absolute number with the same accuarcy problem.
> > 
> >  
> >> This brings us back to the initial subject of this patch. For MPAM we need a new implementation for
> >> memflush() as cl_flush() doesn't have a direct equivalent on arm64. There is an smmcc based option
> >> but the kernel support isn't upstream yet [1] and I don't know how widely it is supported in
> >> firmware. As such, we need to use the writing of a buffer from a different control group. This
> >> should be distinct from the default control group and have all cache portion bits set, as the CMT
> >> test uses the inverse of the testing mask for the default group. The llc_occupancy of the testing
> >> group can be used to check the group is clean enough, i.e. the memflush() had the desired effect.
> >> All this does have the disadvantage of using the same features we are checking to to help with the
> >> testing interface but there seems no easy way out of that while staying generic across even MPAM
> >> platforms.
> >>
> > 
> > I think we can avoid the flush completely if the bitmpas are measured
> > from narrow to wide while the same benchmark keeps running.
> > 
> > Two reason I can think of to backed it up.
> > 
> > - Everything the test group has in the cache after the narrow step was
> >   allocate using the narrow bitmap, and the wide bitmap covers those portions
> >   as well. Nothing is left in a portion the group may not use any more, so
> >   there's nothing to flush before the wide step. Only going from wide to
> >   narrow can leave such lines behind.
> > 
> > - The first step doesn't need a flush either. resctrl_val() moves the task
> >   to the test group and writes the schemata before the buffer is allocate
> >   and init, so the buffer never wasa in the cache under another bitmap.
> 
> I'm not so sure. If there are cache lines in the cache portions that the benchmark will use that are
> currently in use by the default tasks then they may continue to be used by the default tasks unless
> we cause those lines to be evicted. The cache portion bitmap, at least on MPAM, only affects new
> cache allocations.
> 
> Thanks,
> 
> Ben
>

Hi Ben,

I agree with your opinion, espeically hot foreign lines can stay there
and we have no control over it.

But I think in v6's implementation, the benchmark removes most of it,
the buffer is twice the size of the tested portions, so the benchmark
keeps allocating in them and evicts what it finds.

With 2, 4, 5 and 8 bits, my machine pass the test, occupancy is within
15% of the expected value. With 1 bit it's 35% below, which may be the
effect you describe.

An explicit eviction step from a separate group would help if we wanted
an accurate absolute number, but as Reinette said we shouldn't depend
on that ?

I think keeping v6's patch 2 as-is if there's no other concern ? I can add
reasoning in the patch message in v7 if that would do.

Best regards,
Richard Cheng.
 
> > 
> > I'll work on v6 with patch 1 of this series, and patch 2 does not depend
> > on this so I'll send it as a standalone patch.
> > 
> > Best regards,
> > Richard Cheng.
> > 
> > 
> >> [1] https://lore.kernel.org/linux-arm-kernel/20261021224557.1827361-1-smadhavan@nvidia.com/
> >>
> >> At the moment the CMT test just uses a single cycle of a hardcoded
> >>> (unless user provides something else) bitmap with five bits set. Even with this
> >>> I needed add enhancements to make it more robust:
> >>>
> >>>  commit ca0ea39288c9 ("selftests/resctrl: Reduce interference from L2 occupancy during cache occupancy test")
> >>>  commit 7a214b4ec1c9 ("selftests/resctrl: Improve accuracy of cache occupancy test")
> >>>
> >>> As one enhancement highlights the accuracy can be managed better on a system that
> >>> supports L2 as well as L3 allocation. Not all systems able to run such test will have such
> >>> capability. Also, looks like CMT does not require there to not be interference as the CAT
> >>> test does but with MPAM systems having each cache portion as shareable this may also be
> >>> a big influence on accuracy.
> >>>
> >>> I am not able to judge if a test that uses LLC occupancy and relies on single bit increments
> >>> will be robust across all platforms of all architectures. Even so, I do see several risks
> >>> for such test to be reliable while I do not see how such fine grained increment provides
> >>> insight into resctrl kernel subsystem health.
> >>
> >> Thanks for sharing your experience on the testing robustness. I now see that being as permissive as
> >> possible with our testing is the way to go.
> >>
> >> Ben
> >>
> >>>
> >>> Reinette
> >>>
> >>>
> >>
> 
