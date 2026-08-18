Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013067.outbound.protection.outlook.com [40.93.196.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161883C109A;
	Tue, 18 Aug 2026 10:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787050477; cv=fail; b=GwPNgnhdlPBYrGeRmVVKGtGAD4OIDpYt6JOK7jzirPWjJtNTXOuW5XQFLU+/Gmexy/lfvA8XSQ4yfrbPyW9Jjd2Egjk6pPSErMfwV335ivxBDgBJOFYutYqb78dLswHL35eyKomswZdfrHXPlVVB+FJ0hXiMGDkogpHRDCU2q5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787050477; c=relaxed/simple;
	bh=W15w0M4wfB6xZ5QWgk0JYvULQ4t/6xKgy4xCaZDJFys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rJiahDOx8jUCFzso0ytuzKTfscN/CrSAFNPtKliF5CVNYXPu2+Hh5n6hHybxr5t1ZJr0LDiHFXQgfED2OGLaj3wV3LalNNsQfRgCPu2VH2aq5XNLDLSg3ncRk66JGDm1JaVqKvd71Cl4SKdh+dPJNmsZZfAWFFECHoOlZYOnzIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=fail (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JsjfWxxz reason="signature verification failed"; arc=fail smtp.client-ip=40.93.196.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JsjfWxxz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D4dxS6hq7po9P+p6v8fgBvRg6ifBE67j/x0s1pp1GLDoJIr8h3u4iVZYTVzp4tUfhyVzTbUiQ8en+g4Ctgl2YRTa2Gj2ItSEKcs7QskXG0/xmsmtr2nHRYMm7RBHz+bpY0yvEKu9lHy7Qnf/9FSchzBs9jI7YW5UvQtKITyle77U1Zv6J/jr3MWX1u+FJPYJ3CY4mb3wHdaSbHINpVXI1mWi02w0s6Q96OoM7IG5Pl+R0Lxm4Rx+pDq4gGc0XzdNK5+mrIF7GvoMdQq2qZs1E5fHto7MKhKVzeqT15lJPT10RQggwN97MGfzscQ6wQ2nHmDu5Sx0hIFIFVyFF3FftQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VwJnVkywiOJ5jL5yebnFKknAe4q8eQPIz6afQlDKW9U=;
 b=Za+4QgOpOG8b9li5BOSxhC3WktY1Y3C/g2QtEgXBIuvJz+3ecw2moqB4iL73oL8Tqvtzl6G7FLYPuwqrI4AwrhMtaZTahLj85iPPXTX21RMgPixddooqj+DDXCemMCCsLe44+QOfacneFwIauBp2qXerW+M1aZP86xtR4ScenoiWo9e6IHNM4KKEAkq+OV3MZQFjk5WCKEaAB0XWcU+Eh+i9u85sR+Y/9U+k831b9g0WfVmnaB9DpSkWpSPbTfcYfEOgyYAAgimg/emdAMLCrRAyFL9/Tm4e3xaYNMTFXncN8FhU54CkOw/qqh2Pgtbl4aWB7QUoWJIq4sSnDvh3KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VwJnVkywiOJ5jL5yebnFKknAe4q8eQPIz6afQlDKW9U=;
 b=JsjfWxxz85xDNB0meMgOtfpOX34H/34wKh7SSeFSD+G5s2WBUsrnZw6eK4x9FF/3igF/yYlCDyWMQwU1TAIYXjUyEXkSccrHiO/M37ia4YqQKq/w3odpAj4C++Yh+4oIM1h8KBMWWFnVAPDA11bn8wHvjcp4ErL1OBZQFkoSDnVCVsgoKv/2qM9VhoglEvxrjsRkz4KInDlcX8dUjjstJSQqL+M6oBDuATDbrpGA0wIi6FJ9///NSFshi94Iyt5JKPMfODjv+JeWbf6HFrhMXoOZE9/9+a65N5nrAcaMtdZoa7Rkya4kqNXiEe0PT45Veju12NuOlurVgHsBcrRi5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by IA0PR12MB8325.namprd12.prod.outlook.com (2603:10b6:208:407::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 10:54:30 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0315.014; Tue, 18 Aug 2026
 10:54:29 +0000
Date: Tue, 18 Aug 2026 18:54:22 +0800
From: Richard Cheng <icheng@nvidia.com>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: tony.luck@intel.com, x86@kernel.org, Dave.Martin@arm.com, 
	james.morse@arm.com, babu.moger@amd.com, shuah@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, newtonl@nvidia.com, 
	kristinc@nvidia.com, kobak@nvidia.com, kaihengf@nvidia.com, fenghuay@nvidia.com, 
	ltrager@nvidia.com, Chen Yu <yu.c.chen@intel.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v4 1/3] selftests/resctrl: Skip L3_CAT when no exclusive
 cache portion exists
Message-ID: <aoQ4hFvcOkU-44Ot@MWDK4CY14F>
References: <20260722035943.32337-1-icheng@nvidia.com>
 <20260722035943.32337-2-icheng@nvidia.com>
 <1eb20140-66e6-4e2e-b6e9-5172cfa29bbc@intel.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1eb20140-66e6-4e2e-b6e9-5172cfa29bbc@intel.com>
X-ClientProxiedBy: KL1P15301CA0049.APCP153.PROD.OUTLOOK.COM
 (2603:1096:820:3d::6) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|IA0PR12MB8325:EE_
X-MS-Office365-Filtering-Correlation-Id: 758c6aa5-6203-4c59-ee40-08defd171375
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|23010399003|376014|366016|6133799003|10067099003|4143699003|11063799006|5023799004|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9xOsFFgUGojZ2fd1VGSoA6n6UR1gFBWYZ1N9u6PZSe2qVquKSIN6f9usH9VM8iQYPD61/KmkXqABRUwVyuC4yXqZDwvvt76ZeXfwv1wiQkMeuNb0S/uE1HQCdzGavzXIIYQlDFTDuBv0nwWuQLHc3lypALKWR56CbyQmPr0T9n6R9OdNWEWRgvcUJ2Q66p/fq3D97rIwieGSGi/igbHrkacWluyGfHkvaYDg8+ucoicL2zMinDFZVPxJ7OYWaXGjlY4t23/3M8/NZPK7fBg62qN0d6byx0+aYeOVbyqkyX4OPFjkRrTHvWM9Sj3351qqfDcBdITDA/GkBAlTdVbpOpd8y2CO+8J/tRDeAnuinSOdwnTxBksmW6AoJ4ttQUH+kyG8D/u/caSs5yJ06fGVnaj2owPE7ZlNdgvFmPA/M2o17znzEl9Kdts4OpkI3wNnXxe19bORWnGHnajocxfgFHKM/WmPlzLX3j3REsrWhQg3jPMsQQL5BMA9XnENsz8RxxH2QAkxiqynO9zr7DlrlPN9g9IrYR4yFrn9BKM1i6FCW8+RwzQzxhJkbN8/hIigZgFKGjylLaSuKBHO9b4oR0L62CICrNiGgKI8eYoI4cqPoyQlmsCXpsEoCseKXg1qcu2Hv9/c7+t2EYItvDQUdRPPYrNK/kfkT+LSVn4StqQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(23010399003)(376014)(366016)(6133799003)(10067099003)(4143699003)(11063799006)(5023799004)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?r7++o+e2we8IBnTK9muogwqivtt6b0HWaWPvXO6U5CYr8Iytsym7W2wifl?=
 =?iso-8859-1?Q?AkNu0XBbsl4mfCGDbJkWV6maEh2zMk+E3famfQ9PdD3u44ejbeZ8EKV0E3?=
 =?iso-8859-1?Q?sE/zfOHnD4koiwu6Zn0LvxlUYcjEQq3DDYPWEQAnmXQ2djXLDIm1kBtN5E?=
 =?iso-8859-1?Q?ljQwbzaUSPC2v48WVbK0iHkcXEh1tKNCPqakSPrk2knBz+h0PKNnZ4L49i?=
 =?iso-8859-1?Q?tk2nZhnHUYLKmVIq/cnDq6HaKFR8Yjq4OZboytouszlvpNvwAstyHOzKHw?=
 =?iso-8859-1?Q?GPovhCSf0cwSphIAnpoPxRWto6+CSsnnQXliwCDWHpdfQMQ4oxpR7OK3Re?=
 =?iso-8859-1?Q?/NUm5tNQpJLED3MjNpxGgGeUSaawwdRuUy+DQI3WFncQIQbe6MidYx9kP9?=
 =?iso-8859-1?Q?Sc7diIwlgX4VMJUQ19St5mYWSiUS5Fj6Ng4aEfsuSPDwx68gDag16OVVUb?=
 =?iso-8859-1?Q?5C2nAZ1uRwVkhp51J6qSOEaLxuXUzQV0FXySMHhurCSadFdwpo1nS511rQ?=
 =?iso-8859-1?Q?aC2FLXE02sj6OpyrM8/Y/FhN3HKjmQkVj6ObiyZxrPfzSPQsDb+2eYoCQm?=
 =?iso-8859-1?Q?mjJM/tMWE2WfDrv0IRniACh1qF3tFo8oPs65Wg8DWa3DeHus48oT1D/FQq?=
 =?iso-8859-1?Q?ao9vNR8mUeSMyShtFg9uZcikynTX5y8FIHt73DrupPQxf4Bn2AIm/GEcPX?=
 =?iso-8859-1?Q?DBgnBXsnqAq9/zahZ5XWqyXgFuJ7IMk8ZXGV7deiEY44GVJObGv8m3gljg?=
 =?iso-8859-1?Q?W3/UfiID4Cw/fMsb3pIdl0qKDhOPfYJSsnLdealMaYN50QZqYICEUBqNJa?=
 =?iso-8859-1?Q?gys1PxahtvShQELGO/ZtRLFXRYeGiCwQau5Vp9EbN3bkHTgQDq6kCzZomY?=
 =?iso-8859-1?Q?XnPWxKoHrSmQxXxdfeKWqSYyLfaI72VA3ZKbLab2ZXfpr3uA+hwT1NR+/Y?=
 =?iso-8859-1?Q?Rsc8CQpNX0lDKm9tyeJ/ta5BNBa+jgyk4yvXecce6xjlxkra0UA2Nztceg?=
 =?iso-8859-1?Q?oE0JSLY1B3Ryw3CucBcrw7PIbwqyQF7uPJ/jzn6fuKfvaaYBZWDA5GT0Hk?=
 =?iso-8859-1?Q?TBLPxm5u0TWZf6g5I6mOGAmXBWSPIlNE40PMs/0WeYrSYHn8xbipZkxywD?=
 =?iso-8859-1?Q?63mhQwY1ALNVsQUllw0gJXDU/bIHvcVFbBdIlor0aJRgjBspUU2mmw6KND?=
 =?iso-8859-1?Q?avnqIee12t7Bj+RDLQXZAezFMLDokngC5MNPi5ZPbpspQx2sWeQ/bepn6H?=
 =?iso-8859-1?Q?LlHF5foOXZgFMeT4RQ1vcF2unC64r4AJj984hmj1CcaCSKcN6QQCaJOwva?=
 =?iso-8859-1?Q?w/HEo9suN5YImsYeYZ3AX3n5iaShOrlO9onASeU6AMphWaurMZlA9bYbYk?=
 =?iso-8859-1?Q?M8ss7RgdyMY3NWWTjhjjg8JXn18SqcSJdTElkbGPrbQiFyg+MljPAhYjeg?=
 =?iso-8859-1?Q?mnRRDmH3FltWBFRLiPNcY9HGXXH3OWUMFyPavw+i/v/KAwcrVcZF5z89lT?=
 =?iso-8859-1?Q?3kP254Y+g0jS+1qUa4k4wuqDBsKR1FqFUUWfTBEjH+M3jQFlxyE6ZnqhtZ?=
 =?iso-8859-1?Q?xUpOAoAG7xdU3n7aZmTSyOOr66x3N7+VavYKBxKldAgKXrhhy0eyBF8rTi?=
 =?iso-8859-1?Q?N4j1+WHkh67nXOrRbjRK8F0PG2L9xhaHmA9gk+oBLUFiIQ89Ec19hm3Hq+?=
 =?iso-8859-1?Q?FZpGkFXXM6e5Nm6pbiaTksqpgM/xbEf30BWmyyOUSNi6woMWRy7s5dNAEu?=
 =?iso-8859-1?Q?DKVfwDxj1LOff5VTLCzMoaZ4YweIe/tmDjQvn6qq6qqPd01UJbb/Dztpi4?=
 =?iso-8859-1?Q?+6hAjvaFGA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 758c6aa5-6203-4c59-ee40-08defd171375
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 10:54:29.2076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jO7KT1PAYWyIs+GZLljQLtXalID3l0U4mIQ82N7d6xplMgsGluX9zXqh9l6pkR2iP+ODhGm0iJzgq+IT011l5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8325

On Wed, Aug 12, 2026 at 10:22:03AM +0800, Reinette Chatre wrote:
> Hi Richard,
> 
> On 7/21/26 8:59 PM, Richard Cheng wrote:
> > L3_CAT measures cache isolation, which requires at least one cache bit
> > that is not shared with non-CPU agents, i.e. cbm_mask & ~shareable_bits
> > must be non-zero. On MPAM, shareable_bits == cbm_mask is a legitimate
> > state, so there are situations in which no bit can be reported as
> > exclusive.
> > 
> > Previously get_mask_no_shareable() was invoked inside cat_run_test()
> > and silently returned -1, which surfaced as a test failure on arm64
> > MPAM systems.
> > 
> > Implement cat_feature_check() to perform the same check at feature-check
> > time. It prints a diagnostic and returns false so the test case is
> > skipped instead of failing.
> > 
> > Tested-by: Chen Yu <yu.c.chen@intel.com>
> > Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > Signed-off-by: Richard Cheng <icheng@nvidia.com>
> > ---
> 
> This patch is unchanged from v3. My comments against v3 still apply:
> https://lore.kernel.org/lkml/5d76e776-82d3-4f02-8384-a890349ae96c@intel.com/
> 
> As noted there, this issue does not just impact aarch64. Could you please
> split this patch from this series? When it is ready I would like to make a
> request for its inclusion in the next cycle.
> 
> Thank you.
> 
> Reinette

Hi Reinette,

Thanks for your patient and review.

Just to confirm that I understand correctly before I send v5.

I plan to
1. Split this patch out of the arm64 series and send it as a standalone v5 patch
2. Keep the code change the same, and udpate the commit message to make it clear that having no exclusive cache portion causes
   L3_CAT to fail, and simplify the desciprtion as you suggested
3. Change the in-code comment to platform-neutral wording

About the editted commit message, I plan to write it like the following

"""
selftests/resctrl: Skip L3_CAT when no exclusive cache portion exists

L3_CAT measures cache isolation, which requires at least one cache bit
that is not shared with non-CPU agents, i.e. cbm_mask & ~shareable_bits
must be non-zero. Some platforms legitimately report every cache bit as
shareable, leaving no exclusive cache portion and causing L3_CAT to fail.

Skip, rather than fail, the L3_CAT test when the platform has no
exclusive cache portion that the test can use.
"""

Does this match what you imagined ?

Best regards,
Richard Cheng.

