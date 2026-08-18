Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011040.outbound.protection.outlook.com [52.101.52.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4FE31F985;
	Tue, 18 Aug 2026 11:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787051081; cv=fail; b=nOcDtWnM/Sb9GZV6gPPAvzG0Y7i0JdWOnQzFo79svoHO4r25b0gEgJSIl+SoeNEZX1Vt77K5ExUfSNcDeC5ztKr/z7NtNPW0SnZwXKWTXFf9WLVmX0IA2yDoIfbT3oJPu/GdOfeo6iCfLs3KoC89vf2RAuk64Wu52ih9wytsea4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787051081; c=relaxed/simple;
	bh=2DBKlvKyTBGDkgQ6ygSSxJYfOr9H4Gpn3Qsvjb5BRpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ExL9nV1r+5A3ToDWIx7SK4jBVf2dOIXiIUj+ijruUVX865WRMX8tUPxLVrB0C4jAEO7YePjN+93KStjhW7OSYkz2QRRMA+hkHLFV/jNQZLt4b2PN0bgjIIG9FB/CIWsK2RBJD+fGkIIDq7BxPVorR9SfyjhGC3PRUf9rZQTN1uY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nAh2j1za; arc=fail smtp.client-ip=52.101.52.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nAh2j1za"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cNXcK0u3LON9j7TtobhpPFPpo1MTNfCUOaf2Y8P3d+PSV9+GKajNijk5QS6szisUUK3ChXV839sDD43YHWoKKkU1Pw3kW4wgFkVDYsZ7LRf6HhEsUObWpELUT04xoWGIt4FiXUK84HXX0gMkYYE8Nvg9GPuGYT6H9GQTdBD2C04BfdX3kwPmmthSZsCZiE6sbc9aEU720KCgTHAHpmQt4dSyEg0drDdlcJt0a6vFTWtLgqcKIC60Jll8EWNanZRcAgFpzICCCOetlI/v6JS1e9uo26HYkmME7bdk6LbNMnO14UZJ1JGHZq9he6bMZc3E0MWK3RwBiQpx8ErnfyOGJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZXAhi3zjSTB7v0aN+PI6byeud52iMvnotQzDfhhmZkw=;
 b=H6+5Mbh4q4rUaWny/5DmQXferVsTtD/9980E5BNYAuboEq9kYCAyGCjciAFs3UgbHUfXfJHR0YILkZRxxLjplnHXqNOS4Cehcqj+Reyz7iUJRhzhptIb76HEXWlFJlMe8Iox0g1k+JIWsGz5uJDl4+QDTAzN13Le4CsA9I9bc8oOGe+yDRfapW7B8JDJUBNTDa423Ky4RfNmWHQaO5tHJZmJbLCSQ9Hso+WvzgvGdYKyhTHdcA5m4N/1WOvWVHbsu7nLiv85iGPd3ckp9nPomsLGqVI7SzOOoxWpE7rIpK6k9vmBF+/E1PR1r/GZXf44J54+YQkekBJLWpBvU4LghQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXAhi3zjSTB7v0aN+PI6byeud52iMvnotQzDfhhmZkw=;
 b=nAh2j1zaKOT2i7Y8dg2ACAWgbMpH8ebZYxnVu1c73ZEoOZbKwxMcz7uEseWLadKh1UdmTOe6tYL0C4YX2qqZbxg4RTMg4MjrBjY5AgEpR6G3beHyKw2QNI6jevnsMzXHwVTdUIfiTwDaf0G5IYH5j0jVbJvfB7Bqw3oNPJW77R98/xKetInXBDtMGfEHE6XtbTVvZNFqV9IGA0tkMfoVPaCsAC3cGSV3t/URMFDxOEW5xrWZ0COBqV5l2sDcg79WFSO9E9AsVR2es4729GcChLudigCnNInSAYYDj3kCukE7VWU4R2UxwpDRJeKrL9469DWuQBNx8RoDaVFFHTsPVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by SA3PR12MB9198.namprd12.prod.outlook.com (2603:10b6:806:39f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 11:04:34 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0315.014; Tue, 18 Aug 2026
 11:04:34 +0000
Date: Tue, 18 Aug 2026 19:04:28 +0800
From: Richard Cheng <icheng@nvidia.com>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: tony.luck@intel.com, x86@kernel.org, Dave.Martin@arm.com, 
	james.morse@arm.com, babu.moger@amd.com, shuah@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, newtonl@nvidia.com, 
	kristinc@nvidia.com, kobak@nvidia.com, kaihengf@nvidia.com, fenghuay@nvidia.com, 
	ltrager@nvidia.com
Subject: Re: [PATCH 0/5] selftests/resctrl: Run the MBA test on arm64 MPAM
 via the NVIDIA SCF PMU
Message-ID: <aoQ8FC11x-_uqDDb@MWDK4CY14F>
References: <20260722021303.9471-1-icheng@nvidia.com>
 <0fe3a409-cce3-41e8-90ae-84ee3dd61938@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0fe3a409-cce3-41e8-90ae-84ee3dd61938@intel.com>
X-ClientProxiedBy: KU0P306CA0017.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:16::11) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|SA3PR12MB9198:EE_
X-MS-Office365-Filtering-Correlation-Id: bd429f08-2a23-405e-0d40-08defd187c90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|56012099006|10067099003|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	Ud6BU2LJ0w+bYQ3zHx6lCocEzMbPRGPo/9yK+2nA8kgGM7wwxICNjKRYt/ZJ9LUc7Fb4OBrgS/ALcJB32eUb3kRFYLkLd9KAVhkjDEYxm7u5ORg676QlxZBK68/wqdhzkN9HagyuqHly0jCqqKHEYjhlhRBAuZtgXo5COFlBOOBOv9k48Vtp2KyrGD0btvmNz+1gdlK+s/5RPi2d1PYMXmgtitM4fbNLEv0oMZFRnzLRKlrpO/1oCLIqvgxQlFfhitQ0iCo+UAJqlZp8Hr4RQoFhIzBkGuqShgT1Pp2OWV1YnLktPPhbsVqep7qOdKeQCp50Ir/z8w1CWXVFfG56+H+CQ8n5vaMm1OthBtLY1+XclzUTflN0+AqFEXc9iktquLjCOdzVQz1AIPZCrdJ7YcwpMFGD/MaK3U03+8r5vkDXfXVu64F53uGUTKUTROm1Udr5rB/DJQZ7oVQyNp2oR5176OzPcy1WjogjZ0P1lq3Jq/E1c0qJ0f+rZpBylWJIRxXjmdIdrVjWaMRNhZWTbEzeRfnp45KgfSe2B9yth2smiuOrV/l0wDfTRPqLwTQzfDIeQURjn9003u6CHlFbdmPDcRmZUxxwfaz7m0Tyx4M5tf6KCyzNedRMzuk39mBvAf3O0NlJdSfjbjsPLo4ZRsps6bZvvNYVOsSGNDdM3/0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(10067099003)(22082099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?COfETN9ihiFFfdgm5v95ZfzJ59Hqz7qAsz40iSV3MTxQfbLM2zTqMCOkIu6H?=
 =?us-ascii?Q?Mo0XYSRh84T9hz8EZLQn/TW8RqATth1drosBMVUjezZ+bl53mEdpXOKn9YQx?=
 =?us-ascii?Q?fOMOqh/f2GugCen3ezmzONCIPBa2S/Dpzg8yQHwwYDVEAc6n8kCKoS3zqNqp?=
 =?us-ascii?Q?fqHj427a0leJCLMXzT8XEMppjbebZAnB4n3iPmnlfFx/G0AyHQn0eapOb65p?=
 =?us-ascii?Q?wBqVDneNjf841j5krOJ9K0XMWPWHqLFcWhGhi1BQv8GyP3TsGW4KOiZYXyHN?=
 =?us-ascii?Q?myByiP21WrE36lYPei0QgsxTy/ukzz7d8klUCCaT4CP/NeWT9+0Pz1Y/ASCk?=
 =?us-ascii?Q?SRHdAykXI2o3NBcFU5sa1jyGkWasVTPo2ssnK4B8LLB8w74tz6Jd3iBcqHww?=
 =?us-ascii?Q?eY2jOii+pSOjEc7vfNxv4Of9iaTzRPw5q04c/YFFq3EZEPq5GT8nKkUQKQq+?=
 =?us-ascii?Q?4p0K/DgE9LuwNGNaMt9a6Gwh8uGuCCPi85Yf0m4KnHy/eqtM7L0wT/4vLk4J?=
 =?us-ascii?Q?bGbXx7YO9Ul6jv+QJe9mbpbtU3LRleuCHqm2YhsUfmedk716ZPIsp8zhGq1m?=
 =?us-ascii?Q?iDBez14xklXTynrAFwV82lrBgNLu2WmswIYL3CrcLL11igl2AuIFzYsl0a6y?=
 =?us-ascii?Q?JPm4EiHfEQmZVT5MTupDcjrfblbAGLw73TSricyxMSWApy8K1N7TOb0OQcCV?=
 =?us-ascii?Q?my8TVR/6sndXY/pOm3TdFoSPwidfgrpw6NYbI41vS+V6ekmumaQuEQp0wANv?=
 =?us-ascii?Q?o9xGp8jLZvmQ5nGWgCzQNuOCSv34neF71tEKGxL4p0OQmVuIxUQiVvWRmBkS?=
 =?us-ascii?Q?bhXEg32OcdCWyA6WJ1ZYwELDZBq6yFBGWituWeCK2ishZ3Y3bn5FmGhjrDe4?=
 =?us-ascii?Q?JULmtgbXEtQaieXdPz6gq/52nHsX2fClR15LL5vN21YVDsVonBGj2xZBtjkb?=
 =?us-ascii?Q?jRhO2kTrGtfJ1q9r3+Lwb3D6RuHVs52MStZcQ7DzBqASiKVehwBd4n8v91xl?=
 =?us-ascii?Q?qBylRe+/OUAlddVU+spprhKEmLlGajkNak7NXf+hlLbgapokGEfq/IQTw0U0?=
 =?us-ascii?Q?syVXt8Vrju9Ixrro6Iil5djSPiq+JEjEVuLA3KRGmeGfHvEKH4sQj1hy/ALO?=
 =?us-ascii?Q?qIfDxjL867HBYqrSoh+8BOrxNV0OEkAwOOHMfP2UIujl8pmXsu7xTwkk9mxC?=
 =?us-ascii?Q?Tqdg42CfJvvoo+hopXyNE438C0IxQMFH5YzO0qv13s66PrfMRk+5WLsDUh0K?=
 =?us-ascii?Q?+thOjfHG73GOTTseMF0264DoZ47It4J3cK75ACxES+lfoMBIrKBXQvyYxdP9?=
 =?us-ascii?Q?653COdhxoxJhS3WabB5dHUFOLBjAzYkvOSDcwCEjIX4hzljDNOwNMnnU0uXv?=
 =?us-ascii?Q?tkIz59ptcZjakF2b/u1SFJNrDcjngfe5+DGSWrIBRSWOpzxsKd+9kwOLkdTU?=
 =?us-ascii?Q?JzuMiN9vJSF6MYMdVEcC+2NvB14CXDXjNAbnBKNOKGkSfxI9GNtzeQyEQaps?=
 =?us-ascii?Q?ZMUj1ZLpBG5AyuEuTfRElURuN7oIa8QzmWJrNsk72LhiDcqD6SGx34wZ4I0W?=
 =?us-ascii?Q?LBptvIxvwXDgrs+VPFpW/UqPy886Ll2oN5xC0WuOVKVl1exGZ2opnh1T8gao?=
 =?us-ascii?Q?CDAob4Ib4YtXK5+6PZI5FAX+PmVeEn5bGrfE36+D1+5wpm39bgPDb5hgHIeJ?=
 =?us-ascii?Q?yiarX9GXsRJIjeWDBd1nkNZYJR4uXsyl2qaVne3V6PlJ/ncUntO093KDGk/H?=
 =?us-ascii?Q?BHU1n3Cdqg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd429f08-2a23-405e-0d40-08defd187c90
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 11:04:34.8344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PN+ik7sRqpC53rykmJUuyDFF2NHhWvAgRtv/9CMqytYgL9mDQexKh+aTi7VQZ0o6Lod8UQ+ryGI9bRqz3lElCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9198

On Wed, Aug 12, 2026 at 11:02:57AM +0800, Reinette Chatre wrote:
> 
> 
> On 7/21/26 7:12 PM, Richard Cheng wrote:
> > 
> > This series applies on top of the
> > 26.04_linux-nvidia.glue.others.cpu_less.hardlimit branch of
> > 
> >   https://github.com/fyu1/NV-Kernels.fenghuay.baseos
> > 
> Appears to be another [1] escape?
> 
> Reinette
> 
> [1] https://lore.kernel.org/lkml/b2928db3-76b1-4556-b0fd-8278154ddf2e@intel.com/

Please ignore this for now, too.

Thanks.

Best regards,
Richard Cheng.
