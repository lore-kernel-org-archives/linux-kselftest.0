Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012045.outbound.protection.outlook.com [52.101.43.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AAC35C19F;
	Thu, 12 Mar 2026 14:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773324685; cv=fail; b=RhVPrfWxsQ4I2T7NWQqZCnVXy4aN+FlDcqA1MH3tC+j3zI4+NTjvU0l/c0N2VIbSq+rhBVzYhEAWzqDboWTfPbiXtDxBGhPLKbz2XBs5pMzDpP6YW0dJfmEdBXOzbJAjN0xmi/XZ9j9zEOUd2Ow6QaMRHvVyGuY1P7JPM9DZGmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773324685; c=relaxed/simple;
	bh=bVOoFFL13TMf3ysbF0EVEEsfGZHiWqiWCCy3oRJvIWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=usOrFdMxAcWHfIDvAyM4Fkw0QgrU4AlUbUuo4u8h7SG/ebw5wmFcxhBYdZcjbqchhkLkB+/2feWgEysdG3Vmyy0+9T3BTp27ESKyml3sEpqJ8GM7BXBwzu85SrSdYVv1f7hskgI9T+kUv0SGzZvWg0nC0E4hLvvy7r5v9JFgO9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qXOsBXxG; arc=fail smtp.client-ip=52.101.43.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qXOsBXxG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N2IecqBl4mLAfbn68XUUTMv3Hxcjtk0xLoFdKu4zsuzUgQAu3/g+I/vAvGSzSBWOFnzrbHpXKs6r/ZPn0xHYr1CofU8ASKqnjILQ8iox+bLRmDQYgXH6WMiTwUgDYV99JojtZmTvAJQlVlIAvsr7etqdZKV9d7QvztT2MWQ5CjNcWv71qvTRHJzw9aBr9qZXxYRQiQ6MuBjYBXJUrcV3sBFvrZGrnQkcgf9AsMWUyH8SxomIg6obEJyzBkzTdwuxpXoUZ9/d+1FIFmrc2a+AzglVrXVYdfqf4gLgZ3XwAIcUbCesh6WtQnAfJIxlwtRsKfTR4fpcagx5iCE+29aqEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O2girab6YkRlQGhMUxiDMFvkReqLiXRqwpbr3Qr0s18=;
 b=JMV9LVPzbhhSTEKqJU1wU/NbZod/JCiOYH1qmZOGnhDCAMZNoV5sLmYMcdR1SzlJ9+AI9YTIus+bgmkypeI2JtUN81P4TkVxyYds03d1uIb/s9PUySj16ntZoQR8024EeBvSEJIq/oblutwQsjFl4Nqc13wWvo7ZQXotktyEbjMNLoNqr7mqsHCg9hA/kBd1UEhtkuWAcEMWoK6SMkhro12k7RiCxCFKGHv9wfKahiw08EQF8IF+MQMwIGtVh5wLWMZieQSQB+6lIUPeWaT7/ugEyl5NQ0YseqSSG53aSyB9CwyCL1jbKECCHkXvDrv0cuP4/oWAXdiaapaKdRL/lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O2girab6YkRlQGhMUxiDMFvkReqLiXRqwpbr3Qr0s18=;
 b=qXOsBXxGjgnfK9EiNwxlxLJOy+Awqthx+lyMIa05zcJ79ueInlkb5z6BYOfxN+5s/MZLPprXahodwI89dCKVBZf2re/3BPMx0cZwn4YX4g7dU3Tf1kgWYbdiOygiOxiz8uEJo2VgoaBrRuZz4niDod7VHRV83tWIvG3KnF4MHaOMK+O0kuJ6KfvkNX069J9dqN894Vwiw/SSQgecdMBHASNrSpKMBE6qDCE+suBH+xIlT+rFxWQgys+kVFo+nmN+vQ1e2KQ1XoNX4oxvAOOQbZM5N+/nzMGDPSlgew0o4thYmYdZ9C5TgM548htCqwsL5koTjGVrP65o4hrQ1nkiTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 LV2PR12MB5944.namprd12.prod.outlook.com (2603:10b6:408:14f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Thu, 12 Mar
 2026 14:11:17 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9723.000; Thu, 12 Mar 2026
 14:11:17 +0000
From: Zi Yan <ziy@nvidia.com>
To: Chunyu Hu <chuhu@redhat.com>
Cc: akpm@linux-foundation.org, david@kernel.org, shuah@kernel.org,
 linux-mm@kvack.org, ljs@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, baolin.wang@linux.alibaba.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 lance.yang@linux.dev, Li Wang <liwang@redhat.com>
Subject: Re: [RESEND PATCH 3/4] selftests/mm: split_huge_page_test: skip the
 test when thp is not available
Date: Thu, 12 Mar 2026 10:11:12 -0400
X-Mailer: MailMate (2.0r6290)
Message-ID: <CD772D2C-F489-498D-A61C-9EA0D377B174@nvidia.com>
In-Reply-To: <20260312114027.634559-4-chuhu@redhat.com>
References: <20260312114027.634559-1-chuhu@redhat.com>
 <20260312114027.634559-4-chuhu@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::31) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|LV2PR12MB5944:EE_
X-MS-Office365-Filtering-Correlation-Id: ba458085-7c3a-46a8-3e3c-08de80413a23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|17002099007|18002099003|56012099003|22082099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	YeecLDhyk3hgYMlTirJ6SH1UinDfop9ULupHeoVMb7UuTgefFDFJnT/VqNmM2xwNPusupN7g5ZChMDWnQ81zMqr0UH7HuDq/lOJEdfbPkMk8qY2M/UEpTBAxa8SnfSxmIYA5IzYsteQI+toEK95ijrXqErz47CpdennLbRqqv9pmOqGUZgsYG4Vkp0aenlBRUm1Auiw7eMOaIzXnAD6+x4AkMpmxo9dzEc8F8fQ7uF2KJ2KwnzRlj6+e59i2k+TmTPY9FR3sB1x7cFi/3wMxW6OPnenekOaWP4877/0+C+P6nKj4zrr4Za3KmiKXeJGxi03DbLbuV6+W2UpeIHdgcsYj2nq5RB0+6RdJPOm8ff7bbLXeteOEKHlK08GCgbKQjfb445jN8wVzGUs/ixhJDCZW8VRy3BXJbQZaoUPLCjN3Esu2/ifwp3MU+WmzynseqVpxRCgxSofkGARY0A361+VF8pS6ElLFT93MO17pEPvu4D6Xx8w0czgPHEu7bUJCgE79ImLYEsdBRwtRBMnhAZHVHIg4z3fhdarW9z0QILkCmkzY+aJudx+PDTtBRlYtG95j/+B3z4pjK6woRwOftlk9nA99QzUVXSjJbFhkwaj0QilZCEQiFjkkPYJHE3iJAMvTjxmxBUqtR1N/kD2MbdpPDTRw84YBLjkUNivQdoMgDgYbUEtYbPPVoxh4CoCpRLQgW4bUk/6vUGfb+Is+NGQFABYLlWTVCVEzXQprhbI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(17002099007)(18002099003)(56012099003)(22082099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkxzMFRWNUhWSmRvSkxzVys0TnVPVXY2R2R0eEZmTHdEZUdNNnkvL3RLQUcz?=
 =?utf-8?B?R3dxd0VNNlJZcVYreDZoV0Z6aCs0MlhESkxvTGNmREg2RTM1ZHpOdGVnUDVH?=
 =?utf-8?B?bkJXZHpBMzlmbzFGUmU0SlNibGQyTXo1b2lhR2h4bzZjMmJ2c1lZbExVSmN3?=
 =?utf-8?B?anJUc2h3Q2F6RUR5c29WK3RXZzVFVnFaVENTV3pyQjRaMlM3cGlJWjM4bkhz?=
 =?utf-8?B?QnZLeDM5Tit3MDZoenZvZ3BkQkJlcVVWZkYvMFB1dER5bklNbmpYOWt6Z1Ar?=
 =?utf-8?B?TmI5RjFlVk1ubVcvNnlUL0tRUmV4bmZYNEhlN2xtRGIzektHcjQwRWl5b0pR?=
 =?utf-8?B?T21IUDFsbFBETWtFWmFVRXZNUmRObjl6MUNEM1lnYXZQWFVvd1BQemhKS1Z0?=
 =?utf-8?B?dTI3eEJ2cjA4Zk9lQ1JJM2o0c2RiZGJnTVVqUnBSbDV0S21Ib0I2TmcvZmcy?=
 =?utf-8?B?Q0hOZVpVOWV0ZkY3ZUhoWjZYU3IzaFh5QmNVMTdpMUp6dU5zMTgwN1c3ZDEv?=
 =?utf-8?B?THYyc21kSkV4QTJLRU9BUzlmR2JnVzk4eHVINTFyd3J3cm5nbU84akF1VThw?=
 =?utf-8?B?VHl3MXFqd0dYcEd0aTlNZnV0MktMRlZxeGNZM1l5MFhxbTBGdmNuMlhpR2ds?=
 =?utf-8?B?K3d6R0NiWmU3S3M2TDVCVVhaNTV2Z1M5VGdBVFR3bk1aTldEdnAvbktBYVlK?=
 =?utf-8?B?YUMrZkxQdEN4SUkraXRjUUNHSWRid3hKUllzRWpPTndxTnhjSWJmVFREKzRz?=
 =?utf-8?B?ZWFoeVB1V3ZnSS8xVC9xUmpwOTZ4bCtpUk51c28wOFJONUZVb2M1SWYzcXA4?=
 =?utf-8?B?aGZvM1o0OGtCOUlBZUdDRWFnWGdvRXFONmpjeXdyK0RSblovU3hiL3J3UERG?=
 =?utf-8?B?bGp3UVJlZ0daSk9JdlpDOWxhV3dkY2lGQnVPNUpORHd3bHFlNnJxUHpwNWZ5?=
 =?utf-8?B?WEpnNTRERFppMTJBZ3RGMEtNU3cramJ6VEZrMDhCTjRSbmo3WkF4d0hmMVNE?=
 =?utf-8?B?Z1oyVDFub3oxSFZTL21Ndnh4RXFablBmamZYbEIyeWFKWGIxUkRHN05tWDRo?=
 =?utf-8?B?R0N5QUg5dGR1ZjZDN3BLNko2aGJOWm1tOHJzTmFCcFBsUDhaKzBhZG9JU3Ez?=
 =?utf-8?B?akJxdlhjMEwxTzJ1OHlNRG43a2JNOGVHd3V1emNyV1c1ZzdhN3BKVmxkTzNZ?=
 =?utf-8?B?T3oyWVY1aGdUQUt6L2tkVHQ5dE5Uc21QNzVUenhsN2MzaUNYQStwaFFlY2hu?=
 =?utf-8?B?bEhiTXV4OWVjdENyOE1TTTRmek9IdmhwZ1paQ2ZLSUwxbHNpK3E0c1dER2x4?=
 =?utf-8?B?cVhIN0FwRkh0S0dZakk1Z0M3dFlETm9sTzJpNWNITEhuRklPV0RJRFRhWmhx?=
 =?utf-8?B?Z01EQzQzKzY0WEZuTFJvQ1ptYUtYZDhWTWc1U3NzS3VORDg5TE1kYlNaRFRN?=
 =?utf-8?B?VnNHcDhRUldONmZsY0hUWFNxdDE0NGlrRXA0akpPSlEwRHRlbFE4V2hkMStK?=
 =?utf-8?B?WEZudFd6Y3YvTXI1MlMwTzQwT1J1bEhXbyt4ZG11NytKS3ljY1FBaHJBeDZN?=
 =?utf-8?B?VGFPaUQzNzF6ckl1L0pXRlFXYTdJa2RDU2JsNTRPb2dueHNpT0prMUFlbCs5?=
 =?utf-8?B?YkJ3UUsxbnVxcXE5UWZBSUNDbmU5TjREUmlCa1lKZ0N4RDh1N2p6MGJMU3o2?=
 =?utf-8?B?TEROTlRpZUtIWW52YW1ZcVNQSVhhQm1vWk1PQzd1N0FSbUIyUlVBUmlhSWYx?=
 =?utf-8?B?SGplYmcxZ0ZTTkYxYTJUczgrL0owZm1jeDB4VC83NzNmWVJ5VW5pQlgvNHJr?=
 =?utf-8?B?c055MUR4L1RpOU0zY1doYkRSMG9NV2lsZ3VlQ05sbFdxWSt3S0VjdzhuUTVt?=
 =?utf-8?B?NWg5bjFyRzd5MnNlOXR5UkFESE11dmtPY096Nkczc2NOazAvd1hXS1hLRDZj?=
 =?utf-8?B?bksxUUdGMlEwRE93MFZsYitOUHQrUjlkR0Uwbk1KYTdUYWI1cEx2dnRQTkE1?=
 =?utf-8?B?RGVpb2VNa2sxWDZMaUN0NTVCWmpSZDlmUklaVzFwUXJ0L1F2YnNUWlRBQk0r?=
 =?utf-8?B?VnlPeUlVOHI4dDFaSkJ1eFkycW41UExWQy8wMTBpb2JzOUU2YmRjWWxCK0RW?=
 =?utf-8?B?N2V1THNEME5ERnVMYnVEV3VyYlZLdHd1N2Rpa0ZDZzJxcnhheXFINUJQNko2?=
 =?utf-8?B?bFVYN1VNbXJXNnRFcXJIK2VIa3FqRTNuMVhtdlQ2VStWdlRHK1d4NTJIZVJw?=
 =?utf-8?B?aVFhMWtGTGlSQnkyNDFOaWR5TUxNalFjbTlJSHV0UzJESUx5TEdOMTVKUkJr?=
 =?utf-8?Q?IKdTzfY1YnS7CTYzE+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba458085-7c3a-46a8-3e3c-08de80413a23
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 14:11:17.1776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ornzPZI0MFfsajDeOtPBR/PzqmuU094xSS5bqmPMqn/JnqKoNRPCVqW2Xj/xzq36
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5944

On 12 Mar 2026, at 7:40, Chunyu Hu wrote:

> When thp is not enabled on some kernel config such as realtime kernel, th=
e
> test will report failure. Fix the false positive by skipping the test
> directly when thp is not enabled.
>
> There's a naming conflict on write_file() function, both thp_settings.h a=
nd
> split_huge_page_test.c define it. To make use of thp_is_enabled() helper =
in
> the thp_settings.h, rename this local write_file to safe_write_file to
> avoid the conflict. The reason to use 'safe_' is it does some error check=
.

Both write_file() do safe checks. Actually the code of both functions looks
almost identical except that the thp_settings one does exit() instead of
ksft_exit_fail_msg().

Can you rename the split_huge_page_test=E2=80=99s write_file() to write_fil=
e_local()
and add a comment above the function like
/* add _local to avoid a function conflict with thp_settings.h */?

With that, feel free to add:

Reviewed-by: Zi Yan <ziy@nvidia.com>

Thanks.

>
> Tested with thp disabled kernel:
> Before The fix:
>   # --------------------------------------------------
>   # running ./split_huge_page_test /tmp/xfs_dir_Ywup9p
>   # --------------------------------------------------
>   # TAP version 13
>   # Bail out! Reading PMD pagesize failed
>   # # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
>   # [FAIL]
>   not ok 61 split_huge_page_test /tmp/xfs_dir_Ywup9p # exit=3D1
>
> After the fix:
>   # --------------------------------------------------
>   # running ./split_huge_page_test /tmp/xfs_dir_YHPUPl
>   # --------------------------------------------------
>   # TAP version 13
>   # 1..0 # SKIP Transparent Hugepages not available
>   # [SKIP]
>   ok 6 split_huge_page_test /tmp/xfs_dir_YHPUPl # SKIP
>
> CC: Li Wang <liwang@redhat.com>
> Signed-off-by: Chunyu Hu <chuhu@redhat.com>
> ---
>  tools/testing/selftests/mm/split_huge_page_test.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/te=
sting/selftests/mm/split_huge_page_test.c
> index e0167111bdd1..615b75ca62cc 100644
> --- a/tools/testing/selftests/mm/split_huge_page_test.c
> +++ b/tools/testing/selftests/mm/split_huge_page_test.c
> @@ -21,6 +21,7 @@
>  #include <time.h>
>  #include "vm_util.h"
>  #include "kselftest.h"
> +#include "thp_settings.h"
>
>  uint64_t pagesize;
>  unsigned int pageshift;
> @@ -255,7 +256,7 @@ static int check_after_split_folio_orders(char *vaddr=
_start, size_t len,
>  	return status;
>  }
>
> -static void write_file(const char *path, const char *buf, size_t buflen)
> +static void safe_write_file(const char *path, const char *buf, size_t bu=
flen)
>  {
>  	int fd;
>  	ssize_t numwritten;
> @@ -283,7 +284,7 @@ static void write_debugfs(const char *fmt, ...)
>  	if (ret >=3D INPUT_MAX)
>  		ksft_exit_fail_msg("%s: Debugfs input is too long\n", __func__);
>
> -	write_file(SPLIT_DEBUGFS, input, ret + 1);
> +	safe_write_file(SPLIT_DEBUGFS, input, ret + 1);
>  }
>
>  static char *allocate_zero_filled_hugepage(size_t len)
> @@ -772,6 +773,10 @@ int main(int argc, char **argv)
>  		ksft_finished();
>  	}
>
> +	if (!thp_is_enabled()) {
> +		ksft_exit_skip("Transparent Hugepages not available\n");
> +	}
> +
>  	if (argc > 1)
>  		optional_xfs_path =3D argv[1];
>
> --=20
> 2.53.0


Best Regards,
Yan, Zi
