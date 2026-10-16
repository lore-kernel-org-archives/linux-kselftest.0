Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010043.outbound.protection.outlook.com [52.101.201.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FC82264A9;
	Fri, 16 Oct 2026 13:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157954; cv=fail; b=TxxbWx1JBAHJWrbxUJTHETLGl82yHTsGxWyhgNekR3ImhZi2uWTe5HpH0bxWFelQUJsAd+6GUGECCJiZy9wibWw+Dwu0XUzcti91ntwQYGAvgrAg4doB8O9pmXt/cZS02eoi/DBdkI+W+yqldywuGGRte8NeeOJi0b+wofSVw+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157954; c=relaxed/simple;
	bh=r3NBzRjbfZywm/hkzrb4+qIoi+NTdgGIhSJ2X0vtldA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E8VRbRJpsylIsXdL2ltKuQH4vKsKVS6kUyBCR6JSapWexPibHGRJvIljMUMcVzZXZaYc1vHUqvf5RhE1eIBe7FDHo71pIU+noznOOgZ1OP+q5OIglzUXlQJxmSKL64z85051ZKWk/707d92DJL1BEv1W6QR0chSgze6aRQ9dyMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OscIApnf; arc=fail smtp.client-ip=52.101.201.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OscIApnf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lyKeI/FnwrGar/IMHvRn6Y69ZcZcp/1LrodocCdyIGlr6j5Ebvxp/dO9E9k39CE3pAWFDo1n88V+4g5+OlJLIPCCzQN5H9bpQ0r8b/qY4VQkgcnUWtomNv1XHksgr/Q1DgbCy6QQw4IxKkSVZzldG+cmw54IWGms1YZoC5Ve39ckYPW+82C9xQ0es8jC/BBigF71SEGQ3Kw2xaJj5aYxsDCJMSk+GTWa1bEmCYq8++heZ+lTd5W9LTeEg/FeczeTLSBUZjs8P7gG32NqU+yzzVOla9ZxW0CzAFH67TF98fUASg2d5+0eDOppswHew2bfS6G8uutdZVkiTW8r8ANtbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQW+ZuwlXBHXYNpMxgv5y87dg+3DLIZFJDMY8h6gLwc=;
 b=rCm2tcGKWu1wTfJoTOsRZjQ0YOASs6xQCkl7+ZX7QKs0IzFHbENmP9EPVHgrBt7bNKTTULC08CN8o7i9E8SSLSyw8keKRgm8WbzHbHBiVCU/arfyu3BJdc4O+J14OIu0l1qwFuyMYUbDQ8VmbETTc7NJM6t3dCAtB0WfTcjlgYW+6ycWyP6ARFKWObhzWBWkauwzmz/YWPgCJksg/XZKu5EnkjFhg8n5XLelwhycRlVi3XDJkrnGazn748wOZq6MdzpGtxwKrVGi/WFc5MhojG4zhAN4CedhkQqqRjrVnItMFEHBnQ7Ym/filnakZxDb4RHp2pbBt82Gtb/RQhOe/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQW+ZuwlXBHXYNpMxgv5y87dg+3DLIZFJDMY8h6gLwc=;
 b=OscIApnfLFpVbSlAmJcLxA6Zkq9q1ynp2U5NoQNExMJa9LrHi+l13pvsA57sZlPBax2xLB4Y7M2IiICD4ECzDif/IdhA7j30cu+4X09q2KfuZI1HRoycKyqTlTbyJxe4P3lHL+w3Ho/JoqmE5/d3HimHPDiXYVbELZI3LZojYQeQD1ShLemay/qAcvtKEyKBWkUNHshHx9jTcfrWNhMFx0RALfV7fSgKRBlzKO2KoaZiA/mVqm4/akFZULxZX+EG4emtukh7GFK/Y91iNpzMKlv+rNUtY8TJ6zsJ+LxL4WBkxJL0CjLucal5SfkjZRC3j9e11WLbcDKq4VPpx/jd2g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by SA1PR12MB5637.namprd12.prod.outlook.com (2603:10b6:806:228::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Fri, 16 Oct
 2026 13:39:06 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0472.016; Fri, 16 Oct 2026
 13:39:06 +0000
From: Zi Yan <ziy@nvidia.com>
To: Qiliang Yuan <odys.yuan@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: load xfs before checking for it in
 run_vmtests.sh
Date: Fri, 16 Oct 2026 09:39:04 -0400
X-Mailer: MailMate (3.0r7032)
Message-ID: <014D7405-6C78-44E5-833D-6B38310DCD90@nvidia.com>
In-Reply-To:
 <20261016-bug-selftests-mm-run-vmtests-xfs-modprobe-v1-1-b97dfc79e97a@gmail.com>
References:
 <20261016-bug-selftests-mm-run-vmtests-xfs-modprobe-v1-1-b97dfc79e97a@gmail.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-MS-Reactions: disallow
X-ClientProxiedBy: BN0PR04CA0081.namprd04.prod.outlook.com
 (2603:10b6:408:ea::26) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|SA1PR12MB5637:EE_
X-MS-Office365-Filtering-Correlation-Id: 1331d334-1ee0-43a6-d75c-08df2b8ad959
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	LwxP2LPl99gDz0GKB0/pX0UcAnOKVvIqvyVu0/NuuLebfWjbr+MwLnO11KkrBHTwlBG0kOz70w6tv7/bPB6UFxJPtL0oN9kYLYaTnMcPEv8Ry4xWT4avpoR8LqjGfmbo9oNnWxEJ4DUPiZvdaWpO88aq/l2xQiZELCzmsbQyRG8ETkKhxOxbVk8pqBJ1B1VUWvBLGLXrzvBV+FfBZ0qIe8HhraSuFU7o7gxHU8fFxoRkcPwnxX2oLFOwZlc+PyNDIrRZk7UxV/iE4vxos87FpGZW17V/Wn7RjdI1OyLJxKvOOFRtz4dsN4tdKwWutJQ39+Wn8ElwEFp6+ZiKjGIoaV4QFXd6vsJvyU/4aLj4Dk8Fg68hxwjCMZ4rAeip7yW4IY3K/9WLXRG4vHvvfmOOHjosxSgKbSSDt7BJMz4m7J3UgmNYvkSrHS7EHfWHYuP9E40Q3ZDOXNZxnhtodvA/SCEKkx6d9zcF3RpY3At2fyMheW5p/8wyTS6PvboHQDA8GisecgY0dgcfxXBOJ3XPP6qanh9bhFjt6HAbxYxjtanbQMXZu32DlwSN/cIS07NybVCu8HMuu/08XGj5dWl2gbVSruU5CiUm/JoHoYHfWR7XCbFPFjYClWBmglrmZRCJ86bwmWJo6KG27Jkiu0kh8bgQYNLj/Y17VfBF/o1Vp5k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BpTqEirB4HfgnfYxfLbhdaouswV7ewMYqPzx0kITbY/5CPEaRbXOJyptDko5?=
 =?us-ascii?Q?xmLJCNee5ccxB0mFsGy6x8j/FGhzXmiUtuYFBUew6Lw6YCE1FcbY4wzTVaoY?=
 =?us-ascii?Q?WqwqRr9ObJCSi+2dYdbU6HpHpNJztWbrpjhUZ8Dq5kyNHFJbYSekzOLVV+jJ?=
 =?us-ascii?Q?xcIdqpvEK9V2AR27xYIFdHeCj4bur7GwFxxGzqRZLOvoup9uoWhyw9uZV8IW?=
 =?us-ascii?Q?DEQDEYVN4nmUf/5AN0uLYIxKlaIk7tf1qp2sqtcXAUWgW+c7In+p6jWA6DTw?=
 =?us-ascii?Q?MmlVF20Qv5s7T7G/OtjC/nzpf1XUVHh2Pq0yyCg7fe8MbQZZiU7x70dCpjpb?=
 =?us-ascii?Q?e1y9a1oifRXIH+iAHH88IP03lJZXWwXrrzA5J0/gfjqQktX621e247KhenbH?=
 =?us-ascii?Q?COHG/f5j8t65/LO+kmrIYWutdMKi/aOxEPf0yexQxHV2JMCkdSIKrKMCjtni?=
 =?us-ascii?Q?qyzJxODMUZ5jtTjgz8YRJCEWzbgYnNmPBwoJ9kyuuUqi0LtajmYOH9XgFgC5?=
 =?us-ascii?Q?PmdiSU+V9tjt5b3XayHRegF4nyorRfrB/PL0h1qs8FmmOCXam9yjkn4wJxQo?=
 =?us-ascii?Q?1Z3RA3c+1NetbomMyzFoZCwspbojVZEgofonNBuAo7xVh70kNNHbt2v2m8nq?=
 =?us-ascii?Q?DnerHUiDlb0HUO5BCwu6Jk1EqxkcD+Z5731xi9mJnirmgs3HMQ9ONEi29i6P?=
 =?us-ascii?Q?gMUhtQ14fOT5UOjzjhneyqgNp+tnOmS/BHQZ1Io03BS4o6Xu09XrkJzIuiUB?=
 =?us-ascii?Q?p+ph3ytTdIemIzFkQcuHCnDAWfeaOgHRJaZs+LSjvS9tnKdM1Sv96Mfgp3cb?=
 =?us-ascii?Q?GGlF2MTZp7RQf72FKU4H6sqSe2N60GZAF/O7/MUMY0v6QzionEuIqHeAk/ii?=
 =?us-ascii?Q?Qos5jfsov8kvowt+z0efjvIxwHmq2lsR+s7tUt6nkDgR7KC16F733nchu1Pg?=
 =?us-ascii?Q?E9fG3UhdVqlZP1Qepx57gu8LVE3/3qeKabIbqmNduZYIdbVipIRR5DRiGrc7?=
 =?us-ascii?Q?OGbrZimy3b5kGqf4WSXhffgFPZLq6VovlQ+MY+nFyjEJMgyWkXtZW0du35oo?=
 =?us-ascii?Q?d1si1AvgxOtIt8sGjf3Az7zC8FmxB5dxwCfCylOlBXQeeTHP76VvNXfoS9eG?=
 =?us-ascii?Q?DdYXnrkBp/PKupsazAKxhtWGfk+a672ibym54DWx5yeWs0PwZVpt9IKQe/q/?=
 =?us-ascii?Q?AeRSqrH4LIhedeSLyotSptETbu55As9JKWbGDmttxMXFYiv8AGQjnOk2rXXO?=
 =?us-ascii?Q?3s7y38bXEr7ZzrBs9kqdOuNgCsUjkqhWgf8UxbyY9SnVvKZEaJQSqPU+LdsV?=
 =?us-ascii?Q?aLwGdPNpjKZlzOgxzYCMI9kZuTbaXMecGtpqxhYyOzvQKQHmapjp8Us+yxXB?=
 =?us-ascii?Q?t6pVjvB9PYSCJ9qTnKeM7VEiUE51YOTMydmx4XXuSGM1kQD/FbiIoY6CiASN?=
 =?us-ascii?Q?UF1V51LMost2spDneFLoha/WteuMFG/aIfgl5qPbmuh91FyE7ItceVS7j3p0?=
 =?us-ascii?Q?0CTE2lx/LLoh2x8h03zDTg+QP6ZeOG9P5o1f+NHDGUB/3L6bFEJ+2/BnbBTL?=
 =?us-ascii?Q?CXtjZerfTSXFP64bmLAvr8M9PUbcguSkORs7fTFKBBKTAYVrE/iEf135UhIX?=
 =?us-ascii?Q?h5jPdxF9VvzxBgGIXGpgOD4songJ/Q+KdE5qmYuIckFgjUP+7cbAGOcfGzlx?=
 =?us-ascii?Q?rC9poGurTO6BsMQ/6oXWlHQgX8dKSdmoOCo3hLLe2B8pTT1bZgL3qyymibfO?=
 =?us-ascii?Q?u8kpqe31nw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1331d334-1ee0-43a6-d75c-08df2b8ad959
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 13:39:06.3720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PzzFdjUP4e85XTdtqmqcV+xJyMrsjtr9Gk8tDL9aV/blbuUpdKcQ2szwtjhYE4es
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5637

On 16 Oct 2026, at 8:54, Qiliang Yuan wrote:

> run_vmtests.sh creates a loop-mounted XFS for "khugepaged all:file" and=

> for the pagecache folio split cases of split_huge_page_test, since
> tmpfs does not give them large pagecache folios.
>
> It only does so when xfs already shows up in /proc/filesystems. When
> xfs is built as a module that is not loaded yet, the check fails, no
> XFS is created, "khugepaged all:file" is reported as skipped and every
> pagecache folio split case of split_huge_page_test is skipped with "No
> large pagecache folio generated".
>
> Try to load the module when xfs is not registered yet.
>
> "run_vmtests.sh -a -t thp" with xfs built as a module and not loaded:
>
>                                    before    after
>   skipped tests                         1        0
>   skipped split_huge_page_test cases   43        0
>
> Fixes: fc4d182316bd ("mm: huge_memory: enable debugfs to split huge pag=
es to any order")
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
> ---
>  tools/testing/selftests/mm/run_vmtests.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Instead of doing ad hoc fixes, it might be better to add some generic cod=
e
to load necessary kernel modules and unload them after the test is done.

>
> diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/=
selftests/mm/run_vmtests.sh
> index a1b45a3dedaee..6b754555d5734 100755
> --- a/tools/testing/selftests/mm/run_vmtests.sh
> +++ b/tools/testing/selftests/mm/run_vmtests.sh
> @@ -399,7 +399,7 @@ CATEGORY=3D"thp" run_test ./khugepaged -s 4 all:shm=
em
>  # Try to create XFS if not provided
>  if [ -z "${SPLIT_HUGE_PAGE_TEST_XFS_PATH}" ]; then
>      if test_selected "thp"; then
> -	if grep xfs /proc/filesystems &>/dev/null; then
> +	if grep -q xfs /proc/filesystems || modprobe -q xfs 2>/dev/null; then=

>  	    XFS_IMG=3D$(mktemp /tmp/xfs_img_XXXXXX)
>  	    XFS_DIR=3D$(mktemp -d /tmp/xfs_dir_XXXXXX)
>  	    truncate -s 314572800 ${XFS_IMG}

If xfs is not loaded before run, it should be unloaded afterwards, right?=


>
> ---
> base-commit: 437a7e839def0f505277022622fc59a8b071d6cf
> change-id: 20261016-bug-selftests-mm-run-vmtests-xfs-modprobe-de0697d4c=
4e9
>
> Best regards,
> -- =

> Qiliang Yuan <odys.yuan@gmail.com>


Best Regards,
Yan, Zi
