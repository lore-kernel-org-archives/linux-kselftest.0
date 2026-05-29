Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011033.outbound.protection.outlook.com [52.101.62.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AC0282F1C;
	Fri, 29 May 2026 02:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780021446; cv=fail; b=ri8U+zbIrIVlxfR08E/0xQBM4aYcRw68LjXF8JsgBxSU5TbgEUhw3D3svhdpeBJbqT/6hrw9fLQ9psO9Qay2X3XM3nPuNu9/IeQy+xNggLs1urY1589I2L4Fp8FG1tnbvMxZMXM+2kBnf+lujpx0OchxIxlPySq+uKyK6+Fn0jc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780021446; c=relaxed/simple;
	bh=RisC4Ff0x2MByyyl/e53fV5mqI4LmE1u82wesMnDD84=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=lTh7qnwjiQ+p5me0wsplnvD5tKrzMnF52/ZakmknjqqkZ9mpBsT7Cl/2tkXQ9L0qN0emhnsdcVaDD9NTRB4BRj/HxqJwBST4so3Rnn/CerO9usgba+urxMVFS+13L4tRX+FRhfWmChfYoecCCbzIVM7Ba2iQKW06svQi38JTPvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EXAuQOHP; arc=fail smtp.client-ip=52.101.62.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EXAuQOHP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uR4FV9GzNZSxL7ZEGXFXFSicJgSfCfmIA45/5DCei08izpdRWelRuWk5DHu67t4HQlVhz6/vOYKxjex/4WpNA0E5+/XswWt4EezPSdtV2f6JX0dgMjUWprZWGx3Dba0R30Yjaft9pYtxn1QMAxFJOe9B4CNkIdMOLiw8ReRABlXSQ8l1EmWkkPDOazKsioaN8bW8F8x1oKwbcxegdQSYLnE7X8u1+cRDt/up+CSTcF2L/BRZLnSbxueWKevJmhGtTodTi4/xK60BrBImLmDrjXUABikqmCH5mexQ7fYulgnotBL6e/wySGHc1l+t/sKIA6bicWa5/hPEgMWuR37xyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8WM5JZx0v67J6QH3N+x1WZTeWt5aInC4LH6lX0GNxnI=;
 b=zWRU/3jnLKWz39a93gIEFM1XSTOvlK2jLxf//iVIGKRN7naikqCoyNY9F8tdHRVtpb2W6EJ8zygZp9MusjVr2+nVNpPNBxyVi8x1c3FbI44txYzgxGJxsMHSb4LyCr7r98uIwqdZgIt+byxi+vzenId+hpUJ8GPY7ATJImuxFN4bZqXsXoPnandVGY/dsDPuIlMjwNNgNg2JGVLy4CN16MLoGooYJxzzaTgZG+Syb8A15qtedjMDjv7a2oK0v32nY6Xkb2Zgb360lHX7XucBYf8qjALZP7oMdvTuu4mgJzHC9Ca1lBXWNrkNnwX+KmwWqMNohK4cxK5crjEWKYOeBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WM5JZx0v67J6QH3N+x1WZTeWt5aInC4LH6lX0GNxnI=;
 b=EXAuQOHPwJHSVoOy6dkr9jKMXkl1yz7Emkt4s80m2JZCgLHqRcd7n/Yp+ct3ziMehdwRSKbslgXHcXTzDaYrhlZi75SgkwUN2NLPMVw4Xb6Si5Q2y40l8BlB62cPLT/XMJI6CBJzO/sejc5RUa4HR1+Ar5Dy0uBCCfaEBmY/CNtuXWbce+Gv3Cp0XVe2NZ+1jXpYv2vr27ECOuv+Hh42CCyce3Sht/i+iwTXg3WHnIukh64gKyU3IIr5dRbbn4BRJdDWvXL+WDr5ED1qR1nrOmLNlsACzysnxrIZP2KO+JRx5+CQzAiexWQDWUHUas/xOzeUSjDMpW3zTZ9GC5QzVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by PH7PR12MB6788.namprd12.prod.outlook.com (2603:10b6:510:1ae::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Fri, 29 May
 2026 02:24:00 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 02:23:59 +0000
From: Richard Cheng <icheng@nvidia.com>
To: tony.luck@intel.com,
	reinette.chatre@intel.com,
	shuah@kernel.org
Cc: Dave.Martin@arm.com,
	james.morse@arm.com,
	babu.moger@amd.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	yu.c.chen@intel.com,
	fenghuay@nvidia.com,
	newtonl@nvidia.com,
	kristinc@nvidia.com,
	kaihengf@nvidia.com,
	kobak@nvidia.com,
	Richard Cheng <icheng@nvidia.com>
Subject: [PATCH v3 0/3] selftests/resctrl: Fix resctrl selftests issues on aarch64
Date: Fri, 29 May 2026 10:23:48 +0800
Message-ID: <20260529022352.8308-1-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TPYP295CA0007.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::12) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|PH7PR12MB6788:EE_
X-MS-Office365-Filtering-Correlation-Id: 7da924cc-b44b-41c1-505d-08debd295751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	IKhdD8E6TEMNYezjAtNjH2XK817Hpd69bqX1XOVgehME0epJNaw5E2+upNaSm8tVacTtX121fal5Ag7Q+K0VMsQbqf02QAz4lj0sAbX9lBlhx5X0xxpZWdlVKRhqksjZG7qiJ11mopKNwyyGgwDlBc5LPemiZff4wIljmjkwQUJ3j0K9zVCfhD2OGUiX8i8bD6qXaxORLkWGI9kEfhfgKT8Mw6m+FMXaqM4TccSkdSyqW8z7K4Xu6hH1sSFkVx6RsNHlDS1vbpdOInBFOSyJBobWScKwpdSr1lQvrqWkiUhDO2f5cqYc3fnQbYwgUUfDIAcXACy7sxbTTuoq6ArVVJL6uhDWvY2nDV3t804o+hsHZrxArCQwMKW6cGrtXWmS1w7mxeQgRN0C13Vhv6bbRhRmkQxkLDmOaOX0o770GogWmwscSjnXcmsMaC25dO+FmXzBMAc3ElUbq6WiYLKRthYMYtoorZO55yyLN0QI3BLSzSnnHCKXi+jEMqsEZ5wgM9Gk936jSXq2mHPTptfeFXoayJXRyfqWlcxbk2A4anQDJL+wXx+pQiPktpo7xjMD5hJuR9jc1FRf0GjX/iVOlE7sAWZx6mAnhaSyJDtmjKu3Ay2LluN/r7uzpUgZFXyEEZfBBl0Tbz6aKzqYtpzaKpGNUO4bhEv9eogiY6mD/QQqFQtRufsDBIt0hFn891i9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXhqTkc4NExEc1hObTArWG56RTMwSlF2bjVBQ3Y1UkIzdksxT254SDl0N01h?=
 =?utf-8?B?VlV1ZmU3S0RqelZYcXliOE5SWUlISmFGYW9XRlBiaXZUQ1ExRDVrdTB1MWI4?=
 =?utf-8?B?eXFMR2t5TUZYUjNZR2RmMENKK1dXdXFqdWRmVFI1bDVaOGtYOFdkSXFmSXlu?=
 =?utf-8?B?UktTZjEzSzBHVzZXT3NoendCQmJVYkF5akxyMWhUTEYxa1dMM0dVRVA4ZEF6?=
 =?utf-8?B?VWUzbnZ2akkyTlBKLzFMR1VBT3k0TThKaXdGREN2MFNNdkZpa3loK3RYRStY?=
 =?utf-8?B?TGtPYi9MRGprNnZDV0JZei9VMm1vcUhkMnI0aUVIdlNSeXQ5VUlqR3VyQ1c5?=
 =?utf-8?B?Wk8wam5tdk1Vc0JhSjFRSElNS0FyWFowUDdvZGNKRUxjL2tHdFRUdHlBWW41?=
 =?utf-8?B?ZUZwVzJNNnNFSHJjdHZqanc2MWRjZ3pvSzdhZjNBY3ZJZFhIUytqNUJWeWJU?=
 =?utf-8?B?ajRZOE9BZUw5RFlmeDhjR1BtS2l5QlFsam90MkVFWFhVbWFUbUpteTFRaHRK?=
 =?utf-8?B?NGhwa1RQdGdXOVpkRUxZOG50K3g0OGVOcmdESWgrTUNYcmFWYVZ0Mk5nQnVl?=
 =?utf-8?B?bWtjMUNGVXVtVnE4ZDlwazJ0SVI4LzU3emdId0JXcGZCWEFPeVlPUXpra2Fl?=
 =?utf-8?B?dVFoY2pZM0hjcVpyd1A0L3hrelBSSHRKUG1uWHh4ZnZObmFmZ25JZkVKZDFi?=
 =?utf-8?B?TWcwQXdLbnpxc0JxWkZxeUl4NlhWVm8xVE8yNStyL3JyR05TeHE5d1ByaVFh?=
 =?utf-8?B?TWppKzBtQVpici85dDgxR1VGS2o1bS9xWE9NVlpxTVRzQXNkcGRpUkQ2bmEz?=
 =?utf-8?B?UTRmR0N3bS9YaVZwbjE2SEZlaUdNYUptMTd4RkhQUXFuNW9MekFBVVRQaDZw?=
 =?utf-8?B?bjBrUjIydDBXUHhKOEhNMUJpTDZMMzVNVnZCaVZkRFZRQ3huWVVJNzVBdTVm?=
 =?utf-8?B?K2NTa1EyQ2NGTi9RZWRmUEFiWkdvZjhPdVJSVHN6a1BWVlJHRmJ2aFA4SDhv?=
 =?utf-8?B?U2JCb1VVcHZnQXh5UDJsK2dpaXVVZDg1Z3NHWlpYYjQ3RDBXYXk5eUEyRnVY?=
 =?utf-8?B?ZkdzUGhkNm52OWpDZFgrU29SNnhjQ25IWkxnYVNPdDN6ZWdUbytnNXVXUTl1?=
 =?utf-8?B?WFFHbExjYmxsbXprZUt5a0UxQndzbFBoaERENzlpSjI4MkhNOHNFWCtvU3Rw?=
 =?utf-8?B?NFl3VWRsTE9ZeTk0TzJkODhUK3YvRytIQTQySTV3KzZEaFBnWWp4S2FzNnl5?=
 =?utf-8?B?NmNiWmRLWlhza1pkL1RzTkUrb01hZjNSc0U3dm4zTThKamN4Z0hmZWlaMTRv?=
 =?utf-8?B?d0Z3aU9BWjgxY2hqU1dzU0xMcVNJS054R0pNaldreHI0Q1Z5clNpbGwyQVUr?=
 =?utf-8?B?Q3QvcW1CdFZqL3UwMUpSaDJDU0lPQUlDR2ZSSklBa2QyNXBzcVNEOGR4SUR6?=
 =?utf-8?B?d2NrZWliaU54Z0JsMkZ6NSsxakJ6emRRT2ZpTXF2K2VFTVNZQW43UncyZGth?=
 =?utf-8?B?V1pWOE1QV0hHUGp2Vk8wTk14eWozY0hZOHRGaTUzZnFlOVd1WUxCQXkrV0VG?=
 =?utf-8?B?VHE4a0VSMnNvRjJYVDNhdzNMdC9IQ2prOXhwakxmeVJNeUdGa0x1MFgrT3l2?=
 =?utf-8?B?ajJGYW1CSklwSm9QeitpanBBYXVaTnZGdVJYbnFSZml5Z3dRTkRqMFJLbDZG?=
 =?utf-8?B?WFZydXBVMFZOczhiL2xkeWhEZnp3ZlJ5TzVRVEhTMHVIbUtnK0htRWErVXNQ?=
 =?utf-8?B?TnBVakVaWmxJMlFidlM1Wk9qQXVDUnZ3TTEvSENzN2hsUE9lUFFTZ2RkQWw2?=
 =?utf-8?B?eUFkZE1JR0NIZVJEcURLTDZmdENjcmprclNtNlZYVlBLV002T0c3VThSTXAw?=
 =?utf-8?B?aWMySmQ2clJxdm5iT1NVYVYyeFNvZWdIMWJCUGNuVXlmd1FwSHFUVnFjZFhM?=
 =?utf-8?B?VkppMXBLSzJIajRxVW1qTnZRekZFNHdEZkh5NjBqRmJhU3F0RmloVThSdy8x?=
 =?utf-8?B?WkdBQkd1ZUk5ZW5aQ1NMREN3dWUwTmoyYXVVdjM3c1VIQnp5R3RYWEdUT21H?=
 =?utf-8?B?V1QwaEswbFU4VnBnUW9EVE5FWVFxNDY1SHpwK2JUdDYvOEZuZjUxdFdmK1Zx?=
 =?utf-8?B?dVdBbmR2bFBWb296Z3VUQWNRMHBOdHl5YVZ5czk5Q3VUemVBbnBqbmtZZGg5?=
 =?utf-8?B?V1lLTnhMQ1RHMG5VTUJNUzJvNVdIdlB2TjdMaHZtZ0hnRmJ3QVRNeHhwWGN5?=
 =?utf-8?B?TUwyN3hsakFxRWhYNkhOQncvRlFUeFJ5NlhLR1czUGgvTVlPYjQ5QTJsamFC?=
 =?utf-8?B?VDBVK1kzVEtCR1d3UjhERm5sNzl2eUcvN1pSeGNwdG9Hd3QvY2pjZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da924cc-b44b-41c1-505d-08debd295751
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 02:23:59.7352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rjx6dZDifIddpHi0B1mIdlN9Ih9qgnel94hM+DpCgzkB0x/rQmascnhLLORTUsYyoWCIlYIgspPIRR8bPzJTLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6788

This series fixes numerous issues in the resctrl selftests on aarch64,
where they currently misreport failures.

Patch 1 skips L3_CAT at feature-check time when MPAM legitimately
reports every CBM bit as shareable, instead of failing the test.

Patch 2 adds aarch64 implementations of cl_flush() and sb() in
fill_buf.c so cache flushes are no longer silent no-ops.

Patch 3 teaches detect_vendor() about aarch64 (which exposes no
vendor_id in /proc/cpuinfo) and lets arch_supports_noncont_cat()
return true for ARM, fixing spurious L3_NONCONT_CAT failures.

Changes since v2:
    - Patch 1: add Ilpo's Reviewed-by.
    - Patch 3: factor the aarch64 check into a detect_aarch64() helper
      instead of an inline #ifdef in detect_vendor().
    - Fix the patch ordering in this cover letter to match the series.

Richard Cheng (3):
  selftests/resctrl: Skip L3_CAT when no exclusive cache portion exists
  selftests/resctrl: Implement cl_flush() and sb() for aarch64
  selftests/resctrl: Recognise aarch64 as a vendor for L3_NONCONT_CAT

 tools/testing/selftests/resctrl/cat_test.c    | 32 +++++++++++++++++--
 tools/testing/selftests/resctrl/fill_buf.c    |  6 ++++
 tools/testing/selftests/resctrl/resctrl.h     |  1 +
 .../testing/selftests/resctrl/resctrl_tests.c | 21 ++++++++++++
 4 files changed, 57 insertions(+), 3 deletions(-)

-- 
2.43.0

