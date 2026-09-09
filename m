Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011001.outbound.protection.outlook.com [52.101.62.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324993A1693;
	Wed,  9 Sep 2026 18:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788979180; cv=fail; b=W50hEoBUiew+rwSmAGO20NdvbKV1JpgT/SmU+B3HS6oer27CkiLbVtCfObUkoO+l8zU3IBxIaPnYC9tQbKqSGPlYkEtMaVMqRhbtPMd57seQnMcci/Pg760tysnaHvgHyH4iESyO7ox08mzyECXn991Vy3ztO+Ky6LiqOdmhACo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788979180; c=relaxed/simple;
	bh=KktRtJW7+g24qYqTmVH1RL3AM7DooywuZc5Z1hwjdcY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sXpXqkqjpD7A6CSFxKQa+n4L5KqyFEUFJrFo0mLg7xVwGtpsHWsIuuZENw3NMb3odztBcGQ3TbA4CXOTL5sJkhBU3/hCaAu/RJCQawRgj6b4XRIrhBGR94EVshmd8ZpQMmyfK5ABWxqnJhQBEwp1dD1XgoQpE8Ng0OozcaGhcTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CaS81V4/; arc=fail smtp.client-ip=52.101.62.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CaS81V4/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LkXNbNhimYIY96f23BtuVHihHx1NEbrIVtpvMEW5lnnmOtqR8zs4/ZrhHL4yJTQTPW6mQ7X6xUy65/2Uxgp+LZKJ+P+PkippA9gFKflGkPN45BmsNjIf9O40u6fpWKVIq7qHAnC/7okvp3xBeLcjXHkXTefpDxw742PDG6ihSUEOMGt/4koIshxj4opZOBFS6jqiMkAE8KukoRAMiMulPSaPC6WURV1HZah8ZE8MWX8g/R36zXx6a4acuw0OS8KhxpssG+RYQLh6ughLn4XJAQgjIZ6dUGllYqlBGNY0yN7jdl3/Q6bZdDq5FaTyA5T3sQQzIm3RLvvYM/6CZ92ScA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sb5oG7zgtJMVIyt7/zhUUBAEUuq5qL4SlmhfqetOaJM=;
 b=I9yBq7hwk07LlzA8NSCNNgJwAJjoi6wl1RTzAZzkXLKHtd4q0WSkau+wh0FHhJTQ4qywRjaDdt+wI4U5QCpyKqa4JoU2VdeIk8LhU9g6Hd0Woaa001pm6CC184B5dBKqIMjaSq7Z64fj7IyGKkuOTWhiTPChGnM4csN0Vcr+EZdwwq1rREWXcp5noU8tcQoWukqyPN9OWHUAVLl2xlWGqYHCYEEbo5Hvi4tQH3Byjdmrcw8lMgkN93LxSyXdo5TokJUX7F4M0kX1z65DbpRdMQmhyERjQ8hV9ZNAUduNAe83DHg6UKkUUTrBg0/q1QD3nsmoAKR3aWllkQjqKdHZJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sb5oG7zgtJMVIyt7/zhUUBAEUuq5qL4SlmhfqetOaJM=;
 b=CaS81V4/yLTQbaccM+DC0jJkqXtUCN8UbT9NQkJxbtgnh+DFb52Pcdk9de33gaq8BGQ/e/SFhlZrzhMUoiKJ2QdsLrIktCd4JTQZf7FmXNs0Q2UHgnzWptIsSLPqz/EdOqhBxT7lPodxzPrzcTDEZNDCEtPV1CACGBGG3QsahP+gJMreQdjBhhQH4BI/yKNuGxYZbaZbbbjask0QcF7wp273PwOxgjjTehm2TeC0cZNNMEKbzH8ZF2+U051B7xYW2y9d3ZNMwDPJADIhxevHa0IjErFqkkflo1LZWGMHIXHg3FlUV3Dv0hO0+7uAMmH28pbsxqQTkFHuMf3VF7DV2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6802.namprd12.prod.outlook.com (2603:10b6:303:20f::19)
 by SN7PR12MB6981.namprd12.prod.outlook.com (2603:10b6:806:263::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Wed, 9 Sep
 2026 18:39:34 +0000
Received: from MW4PR12MB6802.namprd12.prod.outlook.com
 ([fe80::51f4:a3d9:b44e:9587]) by MW4PR12MB6802.namprd12.prod.outlook.com
 ([fe80::51f4:a3d9:b44e:9587%5]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 18:39:32 +0000
Message-ID: <9683c9d6-50ea-412a-a066-42fb71ddf346@nvidia.com>
Date: Wed, 9 Sep 2026 21:39:24 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] selftests: net: add ctl_file_write() helper
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew+netdev@lunn.ch, horms@kernel.org, bobbyeshleman@gmail.com,
 shuah@kernel.org, cjubran@nvidia.com, cratiu@nvidia.com, willemb@google.com,
 petrm@nvidia.com, linux-kselftest@vger.kernel.org
References: <20260909180009.1894019-1-kuba@kernel.org>
Content-Language: en-US
From: Nimrod Oren <noren@nvidia.com>
In-Reply-To: <20260909180009.1894019-1-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0163.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::6) To MW4PR12MB6802.namprd12.prod.outlook.com
 (2603:10b6:303:20f::19)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6802:EE_|SN7PR12MB6981:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c603b6b-34a1-4cdf-1d49-08df0ea1b0ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|6133799003|18002099003|22082099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	1T+2aJvSFUQOGSUUIhiUERDNyG+8NYMSuoeJ68VBOmgQrzRXUzWWvf7Z6EdlI0tTqJ/6ujExRCw8aQe44SCqJ2cyORYqMVbQ7oNB/ntfVrrej1uN9KS77rvQpmrKyHGnLS8MqkMqu1zQCk+x1oYbLz+tzofZI6in+WMJdr7zwvZhTIpFyMBI1VFGFg11BF3UOFlYxvIqbhz5eu9LACku5TaGD79vjD6psQu8sWT3+iY7bYbkC7h9gix/QwTe+c3Qg8wiz3v7/bZ6nV+wc8PUSXqA/oZ23c66muGifwXCi5kNjuMesaTU5ngS8cVteKX2PV1TzWebQFEilKi8fY0PvmRLJ0Ae0NQesMASiM9ToHeldZFoFp8VB5ZMQDwH4RvLxXTc3C8hM6CJ6eSXXDq2/cwNDvWFH78IsOvBHHzOB9QRUtEriVjJ9T2IlafX2dnSHR8q59+22678FMyy+tqJxN+7vhg8L/3bpdBGvhe8c7C7l3RAMP2EoqReiM1ohzEoFam3JyqWlqDPvKO4b/tljMd1XmifjBVNCn6zp6BQ7o70fmuo0D4sjvHTVtBw0IaKsoZAg2dp3jlVArAtBlerjmAL9rfLn0yEn5E0EJaqL1UlV3x7i14HnpFt2/bV93b5zaI1AfBhdVbcw+y0DIq7+wNA8Mxcf2vnxE+5gieuv9E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6802.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(6133799003)(18002099003)(22082099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmRrTUNDWVJxOFY4Ti9WRDZOVms3NFZ1VitwSHRzTjRqYWV0QlQyVkllcjgv?=
 =?utf-8?B?V2M2Yi9hb3dBbnBMQllDWWdsZUF3VnQyRGtLYUhhQmM5UjRVaDZuSzA0UzN2?=
 =?utf-8?B?U1h1Y1dMZGRBeDE2aXZJcjA3ZFdEd1duT2o5MkJMZWpsbjhBaHBQVDZ3QkN6?=
 =?utf-8?B?UVlMMk5QU2djcDdyMTZLZWJwT3dVMWszbHhjU3RCRGRtWXdMVUxhNkpwTHV1?=
 =?utf-8?B?ckMwTUVHQ25GUXd1M2sxOWFUNklCVmZremh6S0NBWkpCblY4NmVLS1VzelV1?=
 =?utf-8?B?Zkl5S2pWOXl3Y2ZvWWZuSExTcCtxNnArOGY3ZXM5QVcyTmpUcm9DNHlVZXRF?=
 =?utf-8?B?RmdWbUY1QkxyNWJWczVjSlZvM25iNmlwakE1cVBuWVRNRUZQOHNCS1pieU9C?=
 =?utf-8?B?T010eUovU2pXQVlWQU5VZk01NVVqVzUrWVNuTjJZZ0xwYjhsa3NqWk1aMFdL?=
 =?utf-8?B?N1ZVdjJWOUw0MkxaSlJCTkdvTTVMUmdvZWJYaU9WWW9rTFdoUTdNeEdqMWRV?=
 =?utf-8?B?NFYzYUttRHhIY0NiWCsxaERVM240SENMS2w1UlV5SGE4Rkw4NHBhZkgwN2FQ?=
 =?utf-8?B?NkIzdWtFbnpGZzJ2UkhtZ0hLQ3lXTkF5ZEVUaTZ0QldlbVdqbVdnRTBQeW1x?=
 =?utf-8?B?WjJrcDdLU3VCSUZvaTkxVlE2NDUzMTZUWnRHZlNFclgzd0NKTk9VTVFjaHBx?=
 =?utf-8?B?OUNhZWtzZEoxOU1raWxRQjkxakllMXZTQmJYaHZweXVXVEQwcGZPNFY3amdE?=
 =?utf-8?B?VnlMSkJXemhTVlZzSkZ5N0FTTTFveWQ2dVZmakZGOXNrNldUQTI3TjBJMFF6?=
 =?utf-8?B?RnhTK1hoV25rV0tRTzVXeUxJUFJoTkRwQ0N6L1RzRzVqL2sra2dBUmhVZzVT?=
 =?utf-8?B?M1ZnMXZSZmlRT282T1UwOFNFMzhCUTY5WFJhMmtQWnVGeXNxT0IwUndzYkNH?=
 =?utf-8?B?TkVldjRHOVVHNU1pRFFmUFUzRzFsK2JJL0EwdURSMGRmM2JJTzlrTVZDZ2NK?=
 =?utf-8?B?SENjaVNoMzZDQ3NoSm5LakRYWDlMQU5KdCs0anV1R0doRzJWNTRyNlBwVUpX?=
 =?utf-8?B?MmJyalRvSVN3VXBaOW9PUWYrWGl3dURPSXRBdzcxTzEwN0J5d3NpbDBIbWNJ?=
 =?utf-8?B?dmhUSWpqR1dHVWI3NitTbzZkVmoxWis5UVJBZUdPZTdvb3Y0Qk5QUmhhenJo?=
 =?utf-8?B?RUtaQkt6Z2hJT2p6UUlQSDhvTzlWT1o4eGxRZ1lZSktPM2dRQVd4clIyejRx?=
 =?utf-8?B?LzB0ZGQyK3BFMXUrYXVuRG4rQWxQUmZMY1RTaEhMbmF6OVk2VnpNSk1lUFR6?=
 =?utf-8?B?K0k3VmVMUmZxMk1UdnhkZTI3dlFRTzA2NXV0V0xNWHVUUk1jU0NSWXR5di9E?=
 =?utf-8?B?MXVNejZUeVZWWnEyQnp3L1ZMUUpIdDhLS2IxQ2J1QjdPZmlMbHhYelZhd0py?=
 =?utf-8?B?a2p2MTdjRjlJNWRIVmtRWTdpUld0ZWdzaDlVcG5YU0FiRjZWbTI1blNuRjRj?=
 =?utf-8?B?RWxZMVYzZlFvdGJHUHF3VHRkWFZIZG40MDBtVmhCR1pTM0VJSFA2L01EMEkz?=
 =?utf-8?B?a2NNaGxaaDlBUDc3MEJxK0pRTnhwQ1hsMTRJVzdvN1ZNQlpFU3FUSmlQZE9W?=
 =?utf-8?B?Z1hMNFUydVkwaFc4eVZxby8vTVRPNzJXbytLeW0zMWYrWVV1aWZFMTdTMHJN?=
 =?utf-8?B?eGRFeXh4ZGdEYWFjZnhhY1JBb0sreW1pZDlQRVlNOURjZCtidTVKSmp5RWU3?=
 =?utf-8?B?U0hFUmpKUFEvbXU0MmQySWVCV2VtRUVES2dVRTl1WDB2bGJ0blgvQmx1ZWp5?=
 =?utf-8?B?eWVqb3lVK3MwM2RwdHNzWnRlenQ1cnpTNThqNkptUk9DSCtjNU44cGw5VEE1?=
 =?utf-8?B?eStMbUcvWGtVV0NGUkQycXdxSk8xdm9lWEdJU294VHFQMXlGUDQ4MXl3akJi?=
 =?utf-8?B?emVLK3J1ZVMzMHF4RjU2alhqUFpTRmEzYUx3dThjbno4MktiVDVUOHYwRTFK?=
 =?utf-8?B?NzM4d1lXL3lHVVpobit6N052dk1rUWJBVjZjTWxZZE1lOXNTK0NLd0NOd2hH?=
 =?utf-8?B?Um9GQUJESGlVQzZRRSsvcHRUZUxiLzg4OHZqbXZUQ3dOVWV2MlpFZnE1YWVv?=
 =?utf-8?B?VnBDM3MxTWMyWEhJNDZWL1NNM2xDYy9xbUhLVHNGelk1eVZWVmNnZkxNcWJP?=
 =?utf-8?B?UkljbGF2Vjl3K0JNTnh6U25ES1Q4bEM5RFpyT1lxRjQrUlRSTWF1RDlGQ0ZL?=
 =?utf-8?B?QmtyZE82UWVGazllRWZoK2VxeldDM0NiVzBNVllFYUlkMmt3cnFZTnByUkhT?=
 =?utf-8?Q?rXB5dcz6nwTQYKFBAU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c603b6b-34a1-4cdf-1d49-08df0ea1b0ab
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6802.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 18:39:32.8378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uSfjFfvgB6aG6vxJAP6PNypLo0zaa/okHJI3ZgRdpWi/G766LK/ftTQdlPUu8426D7XCZ1l0WmljRdHwTZA0JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6981

On 09/09/2026 21:00, Jakub Kicinski wrote:
> Setting a sysctl or a sysfs attribute for the duration of a test and
> putting the old value back has been open coded multiple times.
> 
> We generally avoid creating library helpers but this one is very
> common, and the defer is a little tricky as using the same function
> for defer as the initial write leads to an infinite loop (not that
> I would ever make such mistake!)
> 
> Some of the conversions are not identical, but arguably ctl_file_write()
> semantics are more correct.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> v2:
>  - rebase
>  - drop the irq.py change which wasn't identical
> v1: https://lore.kernel.org/20260904174134.3789400-1-kuba@kernel.org
> 
> CC: bobbyeshleman@gmail.com
> CC: shuah@kernel.org
> CC: cjubran@nvidia.com
> CC: cratiu@nvidia.com
> CC: noren@nvidia.com
> CC: willemb@google.com
> CC: petrm@nvidia.com
> CC: linux-kselftest@vger.kernel.org
> ---
>  .../testing/selftests/drivers/net/gro_lib.py  | 17 +++---------
>  .../drivers/net/hw/devlink_rate_tc_bw.py      |  5 ++--
>  .../drivers/net/hw/lib/py/__init__.py         |  4 +--
>  .../selftests/drivers/net/hw/toeplitz.py      | 10 +++----
>  .../selftests/drivers/net/lib/py/__init__.py  |  4 +--
>  .../selftests/drivers/net/ring_reconfig.py    | 26 ++++---------------
>  .../testing/selftests/net/lib/py/__init__.py  |  4 +--
>  tools/testing/selftests/net/lib/py/utils.py   | 22 ++++++++++++++++
>  8 files changed, 42 insertions(+), 50 deletions(-)
Reviewed-by: Nimrod Oren <noren@nvidia.com>

