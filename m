Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012033.outbound.protection.outlook.com [52.101.48.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E08538553A;
	Fri,  5 Jun 2026 14:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780669815; cv=fail; b=ZYi8nQmdHJNfW+OKr/4AEJaqWJgRbatii7AdHUkb3DSj+xrVTFpwmAZ7Lrn83SJzenPsRXUDIEzxIvmOqZ8OOQxg2gMnQUZlYgQrVPIE0uUZXC5bLnPyzyH4QDJGfnQz1bKkvSXRVJprzLnu1Tl089qdA2BtgsdSjFN0ovgHteM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780669815; c=relaxed/simple;
	bh=a3eaNx6a/S1mal7CX50eVtkuQAQfKKvEcOluP6bL/EI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JngvRhlkMt3UYIlG7B272NEwC/LK+k4QzUa3YJCYibfA7rS1QYiHBJ6NTWjDVQOVUNVR6YsXh/fv1wOk3gJJoh2pRW/kCX0AFwMqTtqRt+pV2FflZNxLe2rB6A6Z0LsSqYuVdM6DNHTsj3mk4KbrLAhPGbKxp5UAh2jjHCiWASU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=L8bpfiu5; arc=fail smtp.client-ip=52.101.48.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="L8bpfiu5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n6GiW6EOgeiXrYHqg9EUTmAo4lG6DMfiDx12dUmhIOt4ZEgeUqyV1+UMqhdrZOeVvgSofWWZrhGo31TGgp3mWKXyyeWf8RllCV13hq+KzMF0Ug2r42Cnm6ATzpWHow2BuMTLW2WcWw7FTCFMAQxtF4+5FYirtrnk6deEy0zlpzMAWw9lzGka4XnEGkk6Kd020bdtrnC/F9DuL+hOEIu3W+9R+2j/EBno5PQktRbq1U0CbqRUzbXM8kYVXi/+/ld4ZK9a32hwkZsMQtM+vjAcxC/FsKpikJaTdtKBrFJGrkneXD/ZxEU5KzPlZqW6jsiXuuV8+FzxeEHcXSxMt3XR1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHpHHWNvS7RUCjJHAcGuPkTyBU3ms3HxQhO7xZxyNFQ=;
 b=V5XccQyvBwU3IkP+pwQOYG/FDiEwWlxX/tDakxIreESuW6fF0eFkOu1aqia+BLO/pNWtlFn/fKeFznU7vJe0ELNc4uEvBUu2heQRcGIjjl2EfhgCnBFCEiPthLAN+Yv3hXRtkwr1U20HWZH/yILO8L87Oo0oF2nMGG6yTQB/+I3Am5GtJWWZatb0jUrngTqLBCZs5XQRB4BHUgADZI1yiK2WnJYc3eUcnPf3kOoad8f00Cuq2KsF3w08lmkzfbxezf/E+hXAllb4axbOu02tUfgEhD3c6LkAU37rRufKXejMr4igFx3TQJ1Y1g58sqDISAuq8qoNkWE8y0r4GMGUlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHpHHWNvS7RUCjJHAcGuPkTyBU3ms3HxQhO7xZxyNFQ=;
 b=L8bpfiu5xKkcLxXODHa/Uz6qpsqyz12HQrpz5JZIQOHlOZsaFSa3cmZPCUWzjjcy8ZR4A+g9J1B8Gz5nRWP7nNwBK7s3lUiW0qUiuG/68RH1s7HI4zmVWTHFLM3m4EEFanK6Wz89T6KuzmSAHXKBs3X2QFwkTbY7Qr4vUwwMuNUEIovxz/1deAM6g4PHY97/sLfEvZB8EYLG3/aT1PGjYKUvEBDK0OE3Yl14nJwgX03TtgTmmKAJNi6ENUS3ZgREp6+2FFXZhruOILSz7qWsovEw3JtaZWIVJ2BzlpcLeICyriY1iJRflwDMYtW/DOxi3bGMxkOItsclWsUw2GPNlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CY1PR12MB9602.namprd12.prod.outlook.com (2603:10b6:930:107::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 14:30:11 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 14:30:11 +0000
Date: Fri, 5 Jun 2026 11:30:09 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: kevin.tian@intel.com, joro@8bytes.org, baolu.lu@linux.intel.com,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v1 0/7] iommufd: Fix bugs in eventq fops_read paths
Message-ID: <20260605143009.GA2685854@nvidia.com>
References: <cover.1780343944.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1780343944.git.nicolinc@nvidia.com>
X-ClientProxiedBy: MN0P222CA0018.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:531::19) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CY1PR12MB9602:EE_
X-MS-Office365-Filtering-Correlation-Id: c7e1c25a-99f7-402b-3e6f-08dec30ef309
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	eo+w8wJxc8fi9HG8w1m4DYgIIC9T2X9yYW4Na9DNPgnkEFHDtm0k9ivYcoTXL/Z+rKjIlHRSdfTg3P2cv/MmNmWYJjJSEZCGgglbhOccutdr+99GPE/40/OS4TikWkVgiQTsaXEFfxf3tMols3WncgUzyPnHAKZ4bcq3PKYz3QDbVTgFk8U1ZGzMo0ML7JbhtPcyYwA7bw3gjhHw7jBas71eOP/pKHuMij4wh1mxnHWjSpUrkvDceXVrUutTj0Omdn8d1eYe+E2na6j+BI8CHXI3UohuOSRUDxvV8WwwcoUxiRWSEXEVcul+LxZ+dVWRlPElXMckBE2pPzHl+3NHO0+X7v17sKYN8Ip3spoH0PrbT6VTm9rxh48xIfKI72FB75XVSSI0J8xoCP4kz4jRue7Cc/O5CUKenIFLlXumytfb0VHWx719/TFZhZwLMRRJGbJm6oXVZPL+ccmMofXH/Bq6ieSdUyb56kU25cKdDeg+iZkZf+UzSGbrwAuARaKH+H5Y5acLC0D/ybbZbKRjRVAkU9r4azh9ydWwV9a7dQ4sZ8h6TXOnumsbNTOQ+m4UNa5zbYOPIh1T+on/10hxxCt9RsrRX18d3vgdWUg29ub2u3AiLWnJW2f+sLUJFnPugnbPES7WL1JxfihPP6jddSxpNet/kOKlynpeP0UWUrVTZepclGnFAkOsw1xU9nF6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aeIdUBkG5YOV+3/Is0hbTToPFTg7q8foDhx9XPhom3DZMuHgrzbckOjFM7VD?=
 =?us-ascii?Q?Q0JDI8+aAMQsbmGtKhI+8OZhPLHMgJSvOhTWU3Yvq92NVw0rmzJzOKbbkvAF?=
 =?us-ascii?Q?2jyDknZWkc0E7cCbPsQbfSItUlJBeZzJkaWaMRJ7htfjUWFKazhAV+YUKyV1?=
 =?us-ascii?Q?UPUm0w78wMc9fCYDa8o/2Q72eNi2GO+krWW8Gen2q+Q+TlWjLsufuIscXZUs?=
 =?us-ascii?Q?1JvJzK3RSWBOkmobA8pPDRHKNpuhyuXpLCtYIK9X8Fr5YOPhcrcz5n2PfT/G?=
 =?us-ascii?Q?qyb63nc0XTXuava2l0PYP/TvPyE+NhSX/KG9SJbPTtYNkGMzotkXyJFWbcyz?=
 =?us-ascii?Q?NHiRuRT2u4cfVfgsPQ2Bmv5tI25+kiXpk4kBLtEBjs5EDlPoPwVRXMpgKlaI?=
 =?us-ascii?Q?CwhIdNdju7ulTv1w1uOl/npa60OAX5wG4gf7EZapLyIsZJjSLlPQSoaIU37e?=
 =?us-ascii?Q?NJoBSoYRe0WiB31qDjBllv7RCNY9bv2tnc8KXBC/9gHjTEfSDaRxPl7JLUNI?=
 =?us-ascii?Q?g8KZAYzOj9MIvjdeB3bmCL6hSvuQIfS692BYQ57ErS35lZJfQ2Ri0th16Rlw?=
 =?us-ascii?Q?eUdzK6HJf5WKXfryewUWLj11wakDOKEpKMSZ/20NUtBMyvEj4EcDZkrw6EUr?=
 =?us-ascii?Q?O7FkUYjM01FJRzsAR33GRntuFB/B3UktEv6N2vE/q9661Bk+nRgOtNYRjKQz?=
 =?us-ascii?Q?OZL/RG0NS/j7xDykYPlPE6M8K8LHt7+njN8UoCzi2Xtja0TMC57Vqyl4+nJc?=
 =?us-ascii?Q?tJM11vczMLZsfiN2ybQCRIA0/iRPI+0rkEk5T/TSlMTollHhvRP3kLL8/szh?=
 =?us-ascii?Q?t6g8WFFGMvDZT43N9V2GOzoDSExP+Lx9s+emooZ2Mh3b14c3TUAt1S+L0Izi?=
 =?us-ascii?Q?veM2pcknIbyOYubRdvE1xPZLy9C5W3+lTebBN1tL92fiX1c3UNexId/Uyiiv?=
 =?us-ascii?Q?L1SqYsadKGJsCm8+H76+fyCmGwAq3PVijmJHttowPhgcXREZhSP4Oa5f7HEz?=
 =?us-ascii?Q?zI8N/ydmmZXKelvBSZFkyWGBj+oU9Wr2D28hHCsgVtojmNAKArP6alMSzFNt?=
 =?us-ascii?Q?Vjo5tjXvnLHDQnv2VKMpHIHyS/mBzLhxEUpxqdtgV4hcOoU8Ggy18teiYV5D?=
 =?us-ascii?Q?BbHhmpNV+WimdRwqknxT6MviHDnbk1tQUvp3qvlSgl+mRbzkf25eSHFSjc++?=
 =?us-ascii?Q?nuEW4+OE4YG6v5J9h02lZQKuHxiNCy3GkhkOTZsOP7nXJSzR0MZmT/xNepen?=
 =?us-ascii?Q?mvt2rfjCMXHRcTQHwys3Rhx4K0mFtBw8MKU7t50xXqcK+F41GxfhBJisD0+Y?=
 =?us-ascii?Q?K8A01/2GfvlL1bhtALY0BpuYJtCVuf76+TaLmJT3rGvMLczZMuKMi99ZCFe/?=
 =?us-ascii?Q?80+Emuo0+avtHemAlrqivv2DcMPU/A0o8Fg2xnqGKAc20HVaQD/2jxEwBfLg?=
 =?us-ascii?Q?E/gG/QCFIQVwB9mEzyi6Oayes5U1ETksSKxZTpKazkR6dL4ZGuXOeu+zWPek?=
 =?us-ascii?Q?Bdzuq2NdnG/Fmu8i5Oc6HMp9tcCSnwAJJdRuaTkqkk9HJZlJPI3+CtrY5Etq?=
 =?us-ascii?Q?tpHM/z48aG3b2OV1egwerSQPjNZcVhV1vL2RRH079P4ITVwqR8/YLQ/XrAIY?=
 =?us-ascii?Q?cmD3SJg/P3W1IBB1GF8c/NeSEqCZ3ovI9Aw8u9I8xGKm9gLWU5MhKyg+3H+6?=
 =?us-ascii?Q?f6La3XpQKoISO4bXcQVzmakmWLnEFBW4k0iBlM1wlJi7Gth9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7e1c25a-99f7-402b-3e6f-08dec30ef309
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 14:30:10.9180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CNoX925isu1kxCD6WciikZokmA2EgVYmyuBMk+ZiHzsl8w84PIfkfOcsSNqC25Zh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9602

On Mon, Jun 01, 2026 at 01:42:31PM -0700, Nicolin Chen wrote:

> Nicolin Chen (7):
>   iommufd: Rewind header length in done if iommufd_veventq_fops_read()
>     fails
>   iommufd: Reject invalid read count in iommufd_veventq_fops_read()
>   iommufd: Propagate allocation failure in
>     iommufd_veventq_deliver_fetch()
>   iommufd: Reject invalid read count in iommufd_fault_fops_read()
>   iommufd: Break the loop on failure in iommufd_fault_fops_read()
>   iommufd: Avoid partial fault group delivery in
>     iommufd_fault_fops_read()
>   iommufd/selftest: Cover invalid read counts on vEVENTQ FD

Applied to for-next

Thanks,
Jason
