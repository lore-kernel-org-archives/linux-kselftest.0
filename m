Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012052.outbound.protection.outlook.com [40.93.195.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7393D0903;
	Tue, 29 Sep 2026 15:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790695851; cv=fail; b=ZruSlR/OkKBeS1Hu6mFkMt344Y92Q03sOilGYWp8GF4LxHacmwJulmBHkS976txh7Qr9+kXkkgeRqNgrahB0l+sXAD15wQ0tzB8WVnuxMtvS3jXjvEbWUHcecV8rc+yI448Y0DE2lbf75mDP6DZssw6+d0k7VFt4F/XsFzFFVu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790695851; c=relaxed/simple;
	bh=TsR9gRiDC1j+31KS997hJ67PWnyE3gg515J9eNzmKBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fsqcFQjAdkWHqMR/v2WipUPuKQG/AvTMLP75hNiyCELbmhTpQYYxUZhR+3QlPdNPH3esk+cYUI0D5nweUnQTuQDXd6+6xlbtrmKwCE2iJA9ttuMbLJFEfrvqRToohHL3N2OeMD4Mt5Iixrv/Ip2TiCB40Owzb4sIaNgFDOZoo7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CyFpg5+W; arc=fail smtp.client-ip=40.93.195.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CyFpg5+W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RbkFIQ7nBUm5Jfn9VYshC8QcyMqhc/0d9k/0kWXGHpFMmJMKPX7SHMcB1Z+mKKr/1V6sQeaRQir2Rj9RswcI+su5Z2/xvAg7KvoDEsJO+fzeAjF6wZrMQcep/72rcbKsTVnUqLlBkQLbSJZJjJYJ5SQs8YoBTho4WYxzf1egh/jD+XMTM7/+pKIOymBt2ZGvZIB5ac6numMJGqfcUaS4Yabw5yKR6Ouem/YGcMhNZOHB9NGpPTWHYg7l3xVpR+E35CXZzPqK11JK5ekWqDs7YERrA+Yao8G9qvQhHhfs1LxRsEfNIgIC9nta6Uszg/dqMP8yRI7cHC6+aZeBoEDQZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aN/iiDajVj+LLMWL5HSlHAuk28Y9qAnTxQWoMoVACd4=;
 b=ht/U8kuvJ75VSvrslwQZD1dpswl6JOntq5dIu8WZL9tkvIH+Om2788qwouYkBh9H3Jkvg78fQAZwzvX5shHtmL0LlKDVH3Z1E6/b6Xgf81sDSqbKtO0Et3oM7C/+0L1X1MChpGzQ7oDhKeb2DxwHiy44am0UDefG6nO32qFF+5FLZoMavzuRNvibNP/lHyImQVhEpDzG0ikv4/7JONDAwCJ5LnruSmIPH2qgF9xfK44yujpMYcxGahA6WZTuXrA3tZYSbZS0kgQn654BiIDCWbBIpWUg0YQ0jqcDOwFtH4Oo0XxP40yhhZyr92s3p9Nq2JKDCzftYX8Ue6+6Vb5+qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aN/iiDajVj+LLMWL5HSlHAuk28Y9qAnTxQWoMoVACd4=;
 b=CyFpg5+Waob/qMoy0uipM7vqJ0nk8aRGdot2ZE/2yXI99WFwSXUjJsmgeIwgUmn4o2DFL18UDUP84OguBABUC//lAvwDYlXbleFC3na+RmpWf0ysPiZgBLF0Hwiyb8W8TywPTOvKo5CpZ8UwOWYes4V+SdmbHV7jDUzMzeJj+UUR5DTCoNPo4jZC/KNwfHsJk7Naaysh9ReZlubz9t6l7JXO3kH5ZVW11UVB8ImcH1LCBBAHYDV4kAK0OFI4LZwpk3WKvPJvRTtrHHGvFz32lLQITQDkswsj62kefwcFCJYcfeVbaTN8sGsJpp08wUUdXVl/pYGiBdLKZgWKNnQoLA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by MN0PR12MB6004.namprd12.prod.outlook.com (2603:10b6:208:380::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Tue, 29 Sep
 2026 15:30:38 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 15:30:37 +0000
From: Zi Yan <ziy@nvidia.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>,
 "Gregory Price (Meta)" <gourry@gourry.net>
Subject: Re: [PATCH v4 1/2] kselftest: mm: return fail when child test result
 is fail in khugepaged
Date: Tue, 29 Sep 2026 11:30:36 -0400
X-Mailer: MailMate (3.0r7032)
Message-ID: <236634F8-80E1-4C8D-BA5F-87446F061494@nvidia.com>
In-Reply-To: <20260929-fix_khugepagd_fail-v4-1-2169c18f2576@arm.com>
References: <20260929-fix_khugepagd_fail-v4-0-2169c18f2576@arm.com>
 <20260929-fix_khugepagd_fail-v4-1-2169c18f2576@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MS-Reactions: disallow
X-ClientProxiedBy: BL1P223CA0029.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::34) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|MN0PR12MB6004:EE_
X-MS-Office365-Filtering-Correlation-Id: 5051faca-0e1d-41cf-0aa8-08df1e3e9cbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|4143699003|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2GTh5PiXPMjhF9UWRz9+NqNrmMuTmXKNz6feF2IdcdHTTELS0PIa7f6zCUq8zcWkL8DgdiGxS43+Vvpg3FBPq6ZvGuCF6ap7zicUKFjzR72+33Fg7fzb8VeKXQ5ZRGTuZgZYwDr+TlQKxPW7A/GQFIxuEgLlV4RVfKYFT99VlFzSiNW3gOaoKJGCzRTeJRKOcIdYSiBrWZdJLldmMBGRz0Aw1VAgebef4NTluL24mdBYG7XCPZkwQFgr8DGWXw4afnl6izPUsuIMx24SbuIANF2U/xOc2lTJkjX3mnXTHP2bPLoVsILAHG2gWi4BXu8TjrkuSd7NX5dcCejHu39PvGQzVxaDwhzaP4hgLgcyvbOt8/QpluEU+L5X0xQ1vhUJfLipSpvxiVhDeGYiBwLBXpL5qXKHlwiCzwqKAsEADsZ5TvyDerQ9EB13j8CClhHT+nTw7wYOyhxDv8DrLIMCmpAxWMRVPiZQkJ1jLPiXeTThZNYjbThWYLXjmi4aa/vW4QBZtWolkQqsPjMOCCh30LyFyYupHQak4Vzsb5BMALbmUIKX5i4gmGnqgnsm1KGdiDNE6EGBUzcJPFoJPFnkSvfkGuFszwpQvdmQwDPS3kpFAYrIusTTAIXZ1q3CYay1dH96qhrkyo7vlAS45gNpOpxV+7+8s29f+fE5ZtL4WNQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(4143699003)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXZNdlg1eXYySzlvVDVUYWVXZ0Q1NUpKcC9Wd1FQaUVLQXpncVpwMFBNUkV1?=
 =?utf-8?B?STNONU1HSDJDSTM5RTh2NWFBOW9ZdjdDb1BXcnlZaS9rT3ZyYXl3MU04YkFa?=
 =?utf-8?B?eVVQd1ZCRm5FdjJJNXNaMFBjbzVxOFZYMzJmTWFqY3pXRkVtNDZGbUluYy9m?=
 =?utf-8?B?Wm1pcCtlRzcyU3VjWnhNeDR0Ym5mYVdRb21GdWRvVGtWa0pzWTM5TlVOSGdj?=
 =?utf-8?B?SHFLNWdybThKZmVhUVJibmw1OFZycmt3NnJiSnhsOUVSR3BtR3NnV3JMT0lY?=
 =?utf-8?B?bldkb2xFektCYWtQTndnSGFINE9UWDJtZzRLdTY0bFVqWk5sYVJTMkxwVzhB?=
 =?utf-8?B?dytEK1paVWhtTXVHbGpRVHZlejd1SkdjL3RQYVFwa3RQRkt0TmxPbnpYdVIx?=
 =?utf-8?B?NHlnVUpMcDZCRjZ0YlJBRzRCTEZBa203dmUrdUxSbTFVVlFXcUJURWNJUlQ2?=
 =?utf-8?B?SS9aRzFiU3BMUXNTZk5zVE9HMytmUHh1U2RKdWozcURlSzdBSjFpZDl6N0J1?=
 =?utf-8?B?dFhWaUYrOUswLzdER1g4QVdxRVpZek5yOGxkMnAwdy9HRkQ2bmpnajZweW9H?=
 =?utf-8?B?ak1JTjM3TElFcjhBOVFXcCtzdytySlk1RVdSUVZoV1gzbXB2Ri9OS281UW00?=
 =?utf-8?B?Y25ZcHNscWNkTFkxUlgzaDRDcUljdy9UbEVzSG5Xamp6dFE3WTlNRW1LZWhj?=
 =?utf-8?B?VXBidWU4cGplZE0xODVFR090Lzh5TmFJUm5weEVCdkNGcjg4YytoYm5mUVlq?=
 =?utf-8?B?UlMwMVd0MWQvYVRRTnNRZWx0QlY5QURtcG16a3NLYklDMVExTEFOV3NwWUgr?=
 =?utf-8?B?NzlYeHJzRHJwMmtGRVc2bFBIRStJdjI0RFlrVXE0amFidjk5MkdMZUFGcXVP?=
 =?utf-8?B?YitwdklOclRmZVFmekZVdkNjUG54cTFaZVA3M1B2WjlFVVhqWEdVdHlhUlRw?=
 =?utf-8?B?a1hZVElqVnB0MDQ4QTEvWTBiWlpLK29UTzVNV1l6Y2E5Yk1TNFhuOUFJcXVs?=
 =?utf-8?B?QVB4T3BUSW9NYmNZOVdNeFFzYkRLa21JOFZJdzB6ampWS2VDNUNmMnhOZlhH?=
 =?utf-8?B?TDdlSm5aaXRLSTkzeFBSTFpYYlZzOFIxUDVMT3I2aVEvL1BGSDc5NWs2emhu?=
 =?utf-8?B?ZU9ORXJ3YjZERGJVT08zVDlPNUhhcXZpRHIzVGZQRXZKWDhJSWxoT0YvSTNS?=
 =?utf-8?B?VGpEeFhYMjZEVHBZSzc3aWZhUlNxaW9GbDVoN1FnUWFXYnNQdEVTWFpzYVVo?=
 =?utf-8?B?bHp1a0dMSFo5Y0VhNENBUzlEaXFpSmQ4T2dkN3JqNW5xSWU2NVpKRm92ODJ0?=
 =?utf-8?B?RE9FSVp3Y1Y3dVZoeXE1anpreXNXaldMVS92RWd6SmtXYnpybTRCQ0dmeXg0?=
 =?utf-8?B?MGN5bGx2YXlGdllXL2MyYmNteXRnNDc2UmkrQjFiQVlrQjFIdHg0aHZyNXVY?=
 =?utf-8?B?UitvODJ3NDJpQm9TQ28yeG5qam1tS20vLzE3UktpOUxkZUZtMjJCVUhrVy85?=
 =?utf-8?B?WERtTFpMa2g0cTB6ckg4Q0x1TGRhbjdUMDF0ZTFiYXNPZVZLT0pIV2YydCt4?=
 =?utf-8?B?cXZrV1U5NzY3ZlZ0SDdwWTNYSmY2L3BSeVQ2UW1Mb0lzTjdhK0RRazRoVW9z?=
 =?utf-8?B?YkdmV25UMENaclUvWSt5eTdNN3dRMUdWUCt3QkdDVnpUVkREeHZNNTArbjh6?=
 =?utf-8?B?K1FLc1lLUXE5UmNzRTFwNklpOUJTa0MxSytSTEhTeG4wOGJuSUJMbzc0UzZz?=
 =?utf-8?B?VmlwRll4ZHVMd1BhV0p2cEFBTTNtR0VMeS9iVlRxcGJPbkdxVmJLZ0dVeDRC?=
 =?utf-8?B?TTBLVVpnUU1xc2RxUm1LZVZFNmZNOUR3Wm5uQnNVelo0cDR1WmhmVVhtejNv?=
 =?utf-8?B?NDE0ejhLYnQvdS9UY0FxRjNsV0lyZTRGTytGeXNscVNGR3JhSzhiK1VZVXJz?=
 =?utf-8?B?OUphTWQwZm1DeFNXaFo2NVhPYWlqaStiMkhiL3V4U3RTL0xvZE84R3c2dGpC?=
 =?utf-8?B?am5vRDlUaE8rMlpyeE5VclNYbERYeVVNVENuV0JDVHBoeEdLVFhRaXAwWHZB?=
 =?utf-8?B?YzBiZ1pKS3llRXlUU3pjazBuVlhhekFHOGt6bW4wcWhob2FpNGs4RDVCWTZp?=
 =?utf-8?B?SnlJZHRad2hmWlhGZ2FmSGQrdVlmRjlFR0NGQk9IamdJNWlWOXBvWlVuTyt0?=
 =?utf-8?B?SGNTNlJQZmFzQkhSZ3oyY3FZMW0xUlAzblB3dmdtd0lPU0JoanNKa2Nkb2Zx?=
 =?utf-8?B?S1BJL0xUNzRqcVE3dEdDRzBKU1ExNTY5Q3VuVWg3NThrOFVkeG0xWG84Nm53?=
 =?utf-8?B?NENSaDFZMWYxM21zeHo2QXZJUTVhdUx1ZEQyRm85WEdndlNnSXhQQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5051faca-0e1d-41cf-0aa8-08df1e3e9cbf
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 15:30:37.8970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ls5KR5/+G+ZCQwifuCvBFw0bxaXZsrFoSlEYYt9ShoXE7l/pfyTd17FHiVf7XRii
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6004

On 29 Sep 2026, at 6:33, Yeoreum Yun wrote:

> Although the child process in collapse_fork*() or collapse_max_ptes_shared()
> reports `KSFT_FAIL`, the result is ignored because the test only checks
> whether the parent’s page was collapsed into a huge page.
>
> As a result, the test is considered successful whenever the parent’s page
> is a huge page, even if the child test fails, as shown below:
>
>   #
>   # Run test: collapse_max_ptes_shared (khugepaged:anon)
>   # Allocate huge page... OK
>   # Share huge page over fork()... OK
>   # Trigger CoW on page 1023 of 2048... OK
>   # Maybe collapse with max_ptes_shared exceeded.... OK
>   # Trigger CoW on page 1024 of 2048... Fail
>   Bail out! Unexpected huge page
>   # Planned tests != run tests (26 != 23)
>   # Totals: pass:23 fail:0 xfail:0 xpass:0 skip:0 error:0  // child failed.
>   # Check if parent still has huge page... OK              // parent hpage success
>   ok 24 collapse_max_ptes_shared                           // considered as success
>   ...
>   # Totals: pass:26 fail:0 xfail:0 xpass:0 skip:0 error:0
>
> To address this, propagate the child’s failure and skip the subsequent
> check in the parent.
>
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  tools/testing/selftests/mm/khugepaged.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
Makes sense.

Acked-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
