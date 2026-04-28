Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012053.outbound.protection.outlook.com [40.107.209.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487311547C0;
	Tue, 28 Apr 2026 20:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777407804; cv=fail; b=JF+khXnx5W2g0ElgOUNxYDOKACyGGOrVMsp5AxpMMF+j2qeoQ0Z6uBwsQrIUulQbiDxSL26LdI3CTAk5UXDmgc42UEcDlkT9nIye7XPBwWb3eecNQ4FVZRRIQ4GxYgIx3bTLRfI7OquvJuBeGSLTaOl1mupEJFLvWx0MWQ2w0p8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777407804; c=relaxed/simple;
	bh=Fh5tEkbivEcdfgpPAvLSDyqAHzNlQDUORSP5a8hME7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OXRB0eM9mNWtx2h1zPImWsy0wwD7rOipiQLqobAaEfACH6C07BB2Ej0xZ5jrgEVHWgTZsUHKr965DrwDT5NSCgUWNDer7ko9+5Ukvyz40fG5ugY8aUM7stWYBmOcNH0RIfVvhZhSbzF+mE6R51NG6FMcbBQ15d2o7uShAShSEKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HsBZ81al; arc=fail smtp.client-ip=40.107.209.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HsBZ81al"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dewtJuYTyO4dAFh22RWEUmS9RRWKo+LJjZDfQ7VHjeMGxLL2eRKZPBKZ8iA0ktG07OK/cOgPT/FmZSIkf9msoZ5xpUSLPWrhqSAOXRUVofjZPduDMxtLGOx5wDCxN1mMOz1jypb+OPH+h7PC1Djtf1WXwl6GT+4VaIHcBlEXvQgAkM6gZXAkWXw6kTNpwx83okdMvBa8DXaG6THLsY2Mb8cavtXYVwx1qHVWIT0kMO2W8qZkovWV0ogRQ9MOQgh0frS58I2K5q8rTPSjXZxmF2zlTZfKVDxxm2cSQ/2OwgW6baGB+E6sPuudQs1vCbsF3XYZeAEsTFx9Cg0YRhfLNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fh5tEkbivEcdfgpPAvLSDyqAHzNlQDUORSP5a8hME7I=;
 b=id5ffuSGkhfb4fogzsd6TTVjpiGAl06K3czN+LqSyaJCX7Sh0AiRqTcb39isxH/+EwE8xZQ2AWhO4clfSy007bOqtt+24HlAYzycABzTHNgSoEicOgow2Dk1acsJs7FG/qSFynHsEp+uLGelxTkab6sZ83ZU/qO0w5ixd95Ov2vQ06kegnFVNkrhK4jBryJLZvQbd7HgM2QB5awHIWlJ1afkM4oFb1TOAtt5rtOyAh9uxzYdds14IJ2mG/Tn45PjDNCPqornBr3MJ8WRSuuZ/e3GI1sFEKf+iREqldw3QYW66T2EZYru1wgy+nqlpTDaGBoac0DZvea4tgE6/jc+pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fh5tEkbivEcdfgpPAvLSDyqAHzNlQDUORSP5a8hME7I=;
 b=HsBZ81alHLlr5B/WRFVqR6ucrjEoJYagT1TPyiBN0eGYeKjBmEtM53baovIB6e3E/FVd14n0WiEIjU/a3WdGmdIODfakDuoSvo8hP0vTkAf697PQdkJ40z+UNdYKhhIf68z7RsbkZanV15Dv8fUcpP16C44EAft7PpP1C9fdy9FKHE1HNBPin7yp6cMFND7k0atkbTx7lD1aviWpdVNqoJugCzjUhDZUXTi6fP9M8Gj709vRekbuilutwHAWNAzTZPk8n0UClzyqDK6tiZSvl94eq50KoEKCehIPTAuHPJpH0m3YQcFk2D8yVxeYTf8VHz9zb5EYr6W/9GMgFmg+/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DM6PR12MB4417.namprd12.prod.outlook.com (2603:10b6:5:2a4::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.16; Tue, 28 Apr 2026 20:23:19 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9870.013; Tue, 28 Apr 2026
 20:23:19 +0000
From: Zi Yan <ziy@nvidia.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Vineet Agarwal <agarwal.vineet2006@gmail.com>,
 <akpm@linux-foundation.org>, <ljs@kernel.org>, <shuah@kernel.org>,
 <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] selftests/mm: khugepaged: initialize file contents via
 mmap
Date: Tue, 28 Apr 2026 16:23:17 -0400
X-Mailer: MailMate (2.0r6290)
Message-ID: <8D71AC0C-A10D-4B1E-B5B9-606422E0B99B@nvidia.com>
In-Reply-To: <83EFF919-7A84-4773-8C16-C51C15C3D987@nvidia.com>
References: <20260428133138.88802-1-agarwal.vineet2006@gmail.com>
 <583F8EE1-5C49-4250-A24B-0D73372E3864@nvidia.com>
 <95714cec-205e-4b56-b8ff-9afaf9408020@kernel.org>
 <0FA813EA-5EFA-482F-B8BF-FE65D4169C44@nvidia.com>
 <b4fad2c6-f2c1-484e-b6a1-97e763a39ba8@kernel.org>
 <83EFF919-7A84-4773-8C16-C51C15C3D987@nvidia.com>
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0052.namprd03.prod.outlook.com
 (2603:10b6:208:32d::27) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DM6PR12MB4417:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a2f72b3-2522-42eb-bc5e-08dea563fc89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	t3U3dYjXRY/ZF3/pgM5dZ2OYD+LC2eUeG+aCHx0s//KiQ/m05a85dD4+9ZYRWKiekTM1pQLzd3LaOFRh7SJqN7J4EdoOB8KQ5sw1CxgF4aUpjeSX6iLv4MQYTEdVxV9YP+pZA2esX/1bVs0/lmqmD8aimLU7+qrs0LAjPGs0HRNpnuIQiWXOuICMk/sx2affDi31wzuRGsWxpgQSPy9JnFo+rVH1Ucz9ZxQKYFjQh2EaZPqp57EVIcW15Un1lqQ450dBb/56uJoqjPK2zuBLk6S0sbgcifnPusyujBnHeUOt0smLrGbuiWb6z4buah7LWXrHWBeOnn9IHXMq67pBmCHCg8F8yyjp+N09obMflEYX6IaSXbgoflk/NCrMGS5MOzmfW4Ds2pxoMt5FkIvSChxA3yuWK+xv8zFXN3i92j5aJ+8AQt3ODHnn/Wcpu4leUgKVwYtu8QSnqyZ62F8hBDyNaYGeEEZ9DmoGhKPCSX2k8o511PW8vY33SAeKFc3qb65WA6QPMyIwQ5n9Hx6b4xHFEuwWRgTCmTAersG/eTRJWDuiAvMpz5AyAf7TSr2QZaOBBCH4YFOnK0LI9zqCJVxwUTGFK+nlj1hGSrFBt0HJIbDkKTb0aAZPeEzBrxPK+ET0Z0kocwaMyp/CNvlPXMQ0A/zL59fzcRl7/QllK9zEzqaK3xTropw2UvtnTl4ws7BLg0B9hGWNveAUTu+DEzS738zw02Q7L0pSJUFVUBo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/0eKCArtxCY0Dr9QtGQrl0oMyvYnJ6hX3v63gpNWnS+uyJq9Yp457T/w2i05?=
 =?us-ascii?Q?eQwFbbvmxzh+nK1Z2m2GpBADlioGy+tLcuhl1baF4cb8U9jgLdqd5r72aVtt?=
 =?us-ascii?Q?oTih6eV5jyD5yV0dseZ3v+p1HSu2HbL1bQ3y6N1nmsRq0Db0c+TvBvLSPy5V?=
 =?us-ascii?Q?iPu2M6aK3UNiQLFOTvaopkwiwWQlSBEjLzeC2fQuSs9Cnskvtpg7uyN47OCB?=
 =?us-ascii?Q?ghfNV+96GmyCFZaHUPNJ5bf6/1/7ReWaqPXX/3o+lmwOvy+g0kq5Ykj6TRMf?=
 =?us-ascii?Q?S7hLrHlZV9Rl6616PJO/exqTvKX+M62ycpcelIBJvXUEbvETxMj/Zh1ERiEj?=
 =?us-ascii?Q?jCUsdtemsD8Nek63RE4tdzfGDXkY27OPxMGgRNHx+DOlRCpwAkCQVzGKVUmx?=
 =?us-ascii?Q?WIenCoS7zqQFevoQ39GRiku9Ktg+00ky0scrc+I/63ndCHd7MVvlNG/lMFDX?=
 =?us-ascii?Q?4anq8G9rNaTGm2L4zj55bqQSorNBgYib8blSWqSRb8LUR5DPVIp4TY/sR8rf?=
 =?us-ascii?Q?VHgXlTd/Xv1ZBK1K/yCu07eqvfa+3FJ2EsuVPkCyOe0kAu/d/aheC8sO0e0F?=
 =?us-ascii?Q?NBReAnEyZhlu7dHavxb128u4aZ9jrcfBZraDm4Xb7FGB1DbZFZJtKWD4O2Pa?=
 =?us-ascii?Q?B4TiXMwYvVSVJGukK1J8Cf8aVF2mYpUUHmvdE3F9iHtxPsno2h/xgbIClQy5?=
 =?us-ascii?Q?nDkbobdnUBy9xj0zzG0T6QkHMiJw0fWahV4pm1MHQC1HttZDDrFsKTewX9tS?=
 =?us-ascii?Q?OJoWOv1yR+HEzmqDCrwCZ8m3DjRrRq7pKNGyqOVkv98JyWzClsuQOxiGWa/h?=
 =?us-ascii?Q?cZZ3JegLKLoVeaaaWVQqGKABcJFGoX6nNSkRed7PSKR9C00061w2XM2AjoTp?=
 =?us-ascii?Q?0FB3KS+fgEG7smpa0D9TBCFhIGN1KSC6g3x2qUS4Nv5ftQqAgJWa71PRS6s5?=
 =?us-ascii?Q?NwnjRXb9RtIyG6J0MPmCopudCjom07EVP72G9+xP0I2itUsg8ZOuPlcN/me9?=
 =?us-ascii?Q?H6d9yDWC/njrT3FA/FcX0mdf84UhEcXC45RDIo4DfiFetDWaMvpzAaac06xi?=
 =?us-ascii?Q?nTkK1uuy1pevhS40WIwb8EsJHQQS38JjymWi6YOlzMTEiAnym3dKWvdRjm3v?=
 =?us-ascii?Q?qkZrC48DLLr0RVr9XNRTLCTa7J7hbwJ6/LLlxkF5I7LhE7cDi8D4uYFpx1fh?=
 =?us-ascii?Q?czzqj9N9TMz0XfY2aWaWkMgCmxfuBOcyFDRnHgwmqhCZajiXcftDkbWOcowf?=
 =?us-ascii?Q?njZJL1oJvFOu0S3f9LPgnX/CDEMUOhV4F0lxRqL3M5r7KHiGKpADFNIcqktY?=
 =?us-ascii?Q?EUXztD5OWG7mRwabKZtxqXT6ZGPIDgOyP8ixJveo1K/OxiB5NnoyYprZyPVl?=
 =?us-ascii?Q?QuqhDcXu9JEyq9cn6rA2xdURMZsoAZTL3uIKirhAnUJDA9UAKLHY9INgNDGQ?=
 =?us-ascii?Q?Z/I23SqwK1lxzSyDNYWs7AMBu5UxxBLFxawoq+O1w1+YngZ0YpVuNoz8T4F2?=
 =?us-ascii?Q?ep7/Yw7Ry0RRQHTVvceX+0byanLJYta130hpDqdni7cFgqdXTpU4xCLRVItT?=
 =?us-ascii?Q?24hffnamKjei7wrRPzM+1lE7I+yLojKk5gqETCZ87Ke+I9TOa5CxRpTFpOsh?=
 =?us-ascii?Q?g2QaWXiy+T+DmS6gLAXcCEh5uJsKcB6qrGNoohOp+zBQ0jYdTAeyjmNaTLSE?=
 =?us-ascii?Q?dR1VQo8kJDrz+skQBlRwxw3aCoJ+840WHtDeMDjqadPXMLtO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a2f72b3-2522-42eb-bc5e-08dea563fc89
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 20:23:19.1710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JI84xAL+i8MVIEnYNa/sSiTWfX928lzYV4MG3bwE9PTBLiXlNX7gCoSKOpvuCyxj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4417

On 28 Apr 2026, at 16:22, Zi Yan wrote:

> On 28 Apr 2026, at 16:19, David Hildenbrand (Arm) wrote:
>
>> On 4/28/26 22:17, Zi Yan wrote:
>>> On 28 Apr 2026, at 16:07, David Hildenbrand (Arm) wrote:
>>>
>>>> On 4/28/26 21:56, Zi Yan wrote:
>>>>>
>>>>>
>>>>> This patch breaks the khugepaged test for READ_ONLY_THP_FOR_FS.
>>>>>
>>>>> When I ran sudo ./khugepaged all:file ~/ on ext4,
>>>>>
>>>>> collapse_max_ptes_none (khugepaged:file) fails.
>>>>
>>>> madvise() still works? Is it maybe because of dirty folios? (but that should
>>>> also be the case on write ...)
>>>
>>> I asked codex instead.
>>>
>>> Basically, mmap(MMAP_SHARED) makes the written folio dirty and the folio
>>> survives the later drop_caches. Adding msync() fixes the issue.
>>
>> But why doesn't the write() make the folios dirty? Or are we running into some
>> race condition where the old code just worked by chance?
>>
>
> The fd is opened with O_DSYNC, so the data from write() is transferred to
> disk when write() returns.

And the folio is clean.

Best Regards,
Yan, Zi
