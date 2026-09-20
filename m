Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012069.outbound.protection.outlook.com [52.101.43.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69B23DAADE;
	Sun, 20 Sep 2026 08:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789891767; cv=fail; b=plyZuZQIrmDh3uXM0vMTR9+OG+mt9NBwQ0sHCtnQ3oFj2g6EQvbScr0ID/V3x/SVfT1JmouFRf6os1m4GOK8cWJAPWdusRL0tIM/M9llqZAAIidHVwVdARf+fJAU/YJ5uNzD0Os04shBL+i8G/JKeSJeGUasjH4bDedxLIza5CY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789891767; c=relaxed/simple;
	bh=IwJuQZGhiuE6rn/SlpiTlso+9IxPPJuCQnnUc4HRrzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SFEXmkCnvnFuA0SZ5rIfuzgTumBO8oRLXik66KNSAdmf2zK+nIK0Pe7/MjLGOTZp/xmEpwWfx1tV5hDUYd3z0Lst2qHyYCreFFJuzV3moSmSfMZ0LTr9vlAFpiLsnlfz0+2D12I/OoQbVXc+P1GbAGLqWzDL63ikfSzKr4nepdY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BRyHr3+2; arc=fail smtp.client-ip=52.101.43.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BRyHr3+2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bjHBsK9Ozo0htIVJwZRVn9UPvHCSlt7BHAhlXUDwVVAicXWWtljN9czw+KnHbILT/s8fXws/Vln/zX9qRyuMJkuh+vn4A7f4kuz7QvJfnAWJLY4cgAbG2cyA94mVZ3wk+9mqW77Hqc78oDxP0WOuXbi77uQuwUV3UuPHQpIvAEpXHsBrk0fm6t1I8lCdiM7dR1D/ofFooWfZbWvIsAOIF5Dd5dXEj+udduLJtGlZP/EcoNg1l0Z2O/TLZZNbs75MjCxd/p1EI8TCS7I2yefbOBM3cTz0d/x2IukS8MTdbZqHhKsQa0jUhbZdBDtPZ9oTQSUzFa6NrxSPgOZ9a0brBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MBj0cr0vwo4nsMKhI5O6Kdo+lSNNKDwmrRBsFqSvdGc=;
 b=B0tA84Z+NDjh4DWqU+bRuTDOqyWHZ3zYW+sj2grpbS45iqUVhnCOp3ltIryOI98HpvIIQK0VFrum5TN6NRnPMi8XYYwRhXitHOO66PIhtW3awYRhR3ErOkPzeiFvTMU+Lw9o6v/mvrJJso56/YnLjKXxL7COkWK0g8+pMkrnZm56iM0jdxAg5ZkXL8lHutWgJRqyKQU+83bDplvpq6/mkNvwiSt+0EkB0FwnIKzXna/7/zGbep8LCfMI2fl90KIQFP/4eKyZIBirSug+mIX/ciobfoK3ZfnPHfX96nhb4Yw9YhRyDOj3mYK0VlJqlcgNi3RtFq/3YHBJSKOxixpXCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBj0cr0vwo4nsMKhI5O6Kdo+lSNNKDwmrRBsFqSvdGc=;
 b=BRyHr3+2lLYpfXBtoZEfNqEjWir7SF9KPbHG7GxxjAxsI5U4SikEcijcoTAMsNs41jIHjeva6bIhI86henfN9pg0+U+2QCC5Ei/DudUn7VePgS/lOqzPK46COJRx1G2K9QMSVLwmHPE0sHurXIoicGy2y6XmA0lxdYP4d63MLYMmpb1jKQjaQx/gezluLZb0R2yl4/10Y33YDRLZ8pYQkXFbR+1WbS7SBtzg+eKEHdgl4Uk3Fnn9Pva8wO83B2nUTxtIjd6N2BcJarfapK+LijGejiCMsUegJ0knkDfHufpnybPuwuVjy1fa9lwiVWuYNPB3UdMUYHDH9ZgRbLaEZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB7957.namprd12.prod.outlook.com (2603:10b6:510:281::22)
 by CH4PR12MB231692.namprd12.prod.outlook.com (2603:10b6:610:50e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Sun, 20 Sep
 2026 08:09:19 +0000
Received: from PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499]) by PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499%3]) with mapi id 15.21.0406.007; Sun, 20 Sep 2026
 08:09:19 +0000
Date: Sun, 20 Sep 2026 11:09:09 +0300
From: Ido Schimmel <idosch@nvidia.com>
To: Lawrence Lee <lfqlee314@gmail.com>
Cc: David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
	Arun Ajith S <aajith@arista.com>, Roopa Prabhu <roopa@nvidia.com>,
	Jaehee Park <jhpark1013@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 1/2] ipv6: update NUD_FAILED neighbors from
 NA messages
Message-ID: <20260920080909.GA1826239@shredder>
References: <cover.1789734885.git.lfqlee314@gmail.com>
 <e5b7a4f8cbd7c436b463b3751bf283ce861fcfaa.1789734885.git.lfqlee314@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5b7a4f8cbd7c436b463b3751bf283ce861fcfaa.1789734885.git.lfqlee314@gmail.com>
X-ClientProxiedBy: FR0P281CA0199.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::7) To PH0PR12MB7957.namprd12.prod.outlook.com
 (2603:10b6:510:281::22)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB7957:EE_|CH4PR12MB231692:EE_
X-MS-Office365-Filtering-Correlation-Id: 50cefa86-ef10-4493-10c2-08df16ee7880
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|3023799007|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	AEJk1UqOOX4ouiMTw/EaEQo2ap5KfJTdbTcG4/PgX9D5AZkgJCavd4ncmmNEhJEqeubiDTSFL4WU18FEoV52Hjvs5v00Fn7qdzG6t45KMY+txv3Wy1TDVF55iAxgU0kNeMuksRc9vZMm2+/hiOQyjuZ08IBedkLnWOqwMLspRZD/yQgQmW4heU7nPuQWyj3E/NrqFvtJMXi9AusjuyquAjVOqtG+fztls3Wpgl5HX3BU/gljrp7l8JIJ3vfsAnSgRc6nvBu8N6LA4W53vJy89mkRaJUehqOb/ITcmRJ6Woe77zLR21vkD9VBYREGVOFk2bTfU0pnr7j0yRU1/Ft0AQv7xs98y04T7NfRSZygKG+9orlfCupWXggKdP/pQnf8BV8zj3Q+DddfHPixhut2eOna5Ushp6iBYc6frbxEYzAFXgBWB/QagluoALkeWTo1SoKqhePoZVZdXzCPe4s886dLZ6hUBjazvxTQJK0GlHiVza7eYL9OyocjTk904pOWtoaEi28u19t+jLAAdcdDPzn4ogqEoxn/pktkbOHq33TjVCw3vDY7FndovQrd9s/iuIda7a/aTr8egIFrsgk/Da0P62xxwK4D477BNOtSTQhJQepD3Xi4in+LU4pj9AA0yZA7+8eeKCRpD8lECoT3DSDYCJmhgztlSUlOsZUyVbc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7957.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(3023799007)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xcv4jpKbNxfOMZ7umHJs3elh/L9u1A3S89bpK7FjVC2ZlHAFcWxEkvLaJoel?=
 =?us-ascii?Q?bSockJW0hzoyTc6YxXuCkOnJA4YKoDMpIKn7YIjxloemLraPjc4Zqcges80a?=
 =?us-ascii?Q?I2WArN0WiQwcg+HiGSf4Eavfy9+J8AN2lWuc3/RklDEyaeenC+OMnMrbCflk?=
 =?us-ascii?Q?ePXXuuOOslfgKBgQvoUFHkARITUqiPxOjhWVXwdS42vjI0DctXUCx0qBHjnh?=
 =?us-ascii?Q?pNCKiPx0YY/PkCZpB6/n0QYvH9eFNHpO7gnyqmo/x+9f1cRO8+baacB5Ue78?=
 =?us-ascii?Q?LbiDrTIzahB/3ITgs1dfFqHtJ5o4IIYwC7Dyu71sOF+ODthFygNWaP4gGyE5?=
 =?us-ascii?Q?IkLrFkkUQth/bFnpfw6RFbo6RT/DffyeGmotjA5ZViBho4HsRSHzxU2PCWMH?=
 =?us-ascii?Q?XQj5uMKjbru4wxVTAxGGWYKfAoauJJm5rfKhyKDG1Gc3nO3N8asDniPytOXA?=
 =?us-ascii?Q?R83vOxNenTQ/MYRxn5DsKozpX7c3le6JXUQX1CjuKJ0yEz5FIKg65Y81Awz9?=
 =?us-ascii?Q?Ph8XsgOMp8IaTe4DJx7NhyiLAcDU7fYsQp1LHehlWrWz7X9eo7BwJ5yZuIjt?=
 =?us-ascii?Q?+9gN6dNWyTq3pxQ3P4VfCZ+hr9/qGoasdE7HlOeci1Ytpsv7Ab1s5FPgryvD?=
 =?us-ascii?Q?cTWgIjFdwe0X7YE/T0J0ZMbZqBfUWjmNBpBXpS0pQgyVs21g2y8Tp4jaFcHk?=
 =?us-ascii?Q?DpPrANUCO/6dgFHzmYoI9fgpazA/t2yFk98SqySy5xHpvH7goS1TDUxRLYRZ?=
 =?us-ascii?Q?eYMtgrkSU6LZX5YMxhksE9WemGLI5TPN0I4G/mYsZ3zBwhAKVzKlL3QfFiau?=
 =?us-ascii?Q?C36TFYCqwwQtHQK05oUIYGIfNLKflBgnKi6AbUcrgr6oxSb1SwEd0RScUqsw?=
 =?us-ascii?Q?IuPl4rM78PCaJbpQY0cCBexgjt3HJmznARjVfDiVDscgorsJJRfvE8ioBmgo?=
 =?us-ascii?Q?CLbWGCYR1UBJ9+AtOLpo4EGlkwo6+Dx/6QHfOOb5z3U0iFqwfwI45Ui54TpV?=
 =?us-ascii?Q?BMGDqirpnlft09gcHtNIOPcZUrnbGSbzVV125wGjrtHPE5UgQp0mhuxObeq5?=
 =?us-ascii?Q?3BPGnJ4JKRKkI+5pizZZfC8s/IOx+VwqRfCqjWm31kGVPX6GyrS22pRIaTAO?=
 =?us-ascii?Q?Kp/VDhA8AXGnDRR949XLUAhE2pRS6ciM17lIXkaD7sKs6EdPVfjH+EohftQ5?=
 =?us-ascii?Q?1vnCZkmBfU7cNcEsMytn/D+CMMyP/L9I29ndpf7GW/k0NP4ap7PZ2/clVJyH?=
 =?us-ascii?Q?VKanWsr2iCjUAO6rpjZitdYqTBGzSu4Je1SQkrqD2US3AImwqNKGLLoiBFm2?=
 =?us-ascii?Q?QVObDYdyErQpRbAdRjUL3aqvIStlYqvAUVf20nzbvonp8exFGobll+XRox2q?=
 =?us-ascii?Q?Ifh2Nuc2+5uEwfL/dxUMT82DReMGv6/go8WUcr6yZSxBNSS5IoGkDh/yyv2z?=
 =?us-ascii?Q?9hacapOsRhuojJrjIXgCKFlbfrih/dwa9yrEEEgsE+JeC4S0UjE/wM/DdX8/?=
 =?us-ascii?Q?M/+zZOD7EUp93H3xbD00YQcGSfRx7U3KJrIAESE3YNWHn6ko83vRVeFuAyl6?=
 =?us-ascii?Q?9MsBYRSKtp/0swEaV9FIGYwbWFe6jhogVvEAOl13DmrPceT8rqQvwgCz1HwI?=
 =?us-ascii?Q?lVT76V+aTxOc6qDFlR+5x2hrg/9FGBh9iorvNVWlMKkmoG0w/esrdn7VeA9I?=
 =?us-ascii?Q?gupy5BVK03lWKd1QcmLHU/Fwz3qhiQqpmHDcePXQ8Bj5BK+MVjePUDY7H3Bk?=
 =?us-ascii?Q?UVHchR+I9g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50cefa86-ef10-4493-10c2-08df16ee7880
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7957.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2026 08:09:19.1772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ieOVhBnsq7eSyu1auDVYrp+z1IXKXsSLp37e2j3rnZ2S7X5ioB9P+krBs3zfwna6fonNcpit2/jiJbq0ZeFiMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR12MB231692

On Fri, Sep 18, 2026 at 10:13:23PM +0000, Lawrence Lee wrote:
> Transition a FAILED neighbor entry to STALE upon receipt of an NA
> message on routers when accept_untracked_na is enabled. This extends the
> RFC 9131 accept_untracked_na behavior so that FAILED entries are treated
> the same as non-existent entries.
> 
> RFC 4861 section 7.3.3 says that an entry should be deleted when address
> resolution fails. Linux instead retains the entry in NUD_FAILED, so
> treating it as untracked is consistent with the protocol model.
> 
> Trying to resolve FAILED neighbors via periodic probing (e.g. using
> NTF_EXT_MANAGED) is more work compared to this approach which uses
> information in NAs that the kernel may already be receiving. Note that
> because this behavior in IPv6 is dependent on the accept_untracked_na
> sysctl setting, this approach is more conservative than IPv4 which
> transitions FAILED neighbors to STALE by default upon receiving GARPs.
> 
> Link: https://lore.kernel.org/r/20260813233344.445265-1-lfqlee314@gmail.com
> Assisted-by: LLM Sashiko sparse
> Signed-off-by: Lawrence Lee <lfqlee314@gmail.com>

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
