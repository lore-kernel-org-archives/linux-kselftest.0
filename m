Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020090.outbound.protection.outlook.com [52.101.69.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C1C3624CC;
	Fri,  6 Mar 2026 11:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772797506; cv=fail; b=NwJYG5zAlYCZXOP+M0AES2sOUTMzjim4WsvpCdxukD2pinu0yWSruutNwYEhWdkMi6GcIBeZLll7kmI16epR2efzbYopmnnpx8YFXXaybiswiStfXLjTKQ9DBsuWcJKQfggFRviVP5RlKar28eKzOFmrXC+PmlWTPIjGwbX7Cow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772797506; c=relaxed/simple;
	bh=wqKi1p3MxUfFfY+mRJjzG0gLnPz54XJVCPvelfZayYI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Bn7Cu3mE8hUJsDE/ebM3fVONgZC4j4coPS1k+6OaHaaq13hwNR/Fd7pGHEb9+Oc4Z4T36uFEdMk9WQgZGFV5zP0VqHxDhYMxdYqfqSK3Gxo8Rk46sXzOTR3sTeGd7VbgZOBe5u/QTu9tZ+toRnWkRBzOBaPaEQoYwgy5QKAHEeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=YBhRWDWn; arc=fail smtp.client-ip=52.101.69.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="YBhRWDWn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eBrfQyBe7AjB133aecXtp83d2mrt3DHt56nB0o1nVZLhgps6+m8LD7KzpyNoLhM6GD2hGiPjJZ/uqsQYhbxuOUwczliNpaohvDtULHRiNoiZIk8SfbbVbtpLNVydT4yXjl6VPCl9Q7010kHXYZwj32TB2Yu0XtxCsiB24b+EJxYRPGiJ5i5DYIvBw059v3vZl07ND9AQuXYinigS+LcncmQ+YjsX0PVNrtQCifgf1hJUNQ+EdblFwZ4HX/6EVW3U5Bxd/Az9tEwV1sB4xavm1urts2YccL2XqfGf+PpUlcTXiDYPd4mUu+Qli5lANUU6B83rv9B6+AR96YJ4btHutg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Fg9GgnOeruS32F1uu5ykzeP7gPT/f7n0ODoWXU38zE=;
 b=Ga5DXPvFXrplpl2JvEAP4NYByw6swX458lflbCuDaN59eQ9WzKMZ5/7M2Oa3dIKo3cFjqRbUJZ5vTA1dTDAyxeFaAshvQXgjhLJnKc4Aq2WqCl1isgFHhw1S7LI3gt8NVcvgfcxNPjmcN+q2DWzGdPsfk7RztA33u2J+aEtGxhj25VsyiLtWgBfL4tucZeXGg3JZq8jFpGny7+VFj5EI8qnV8oV4c4A7FmmgAusmh0+lnT3kBLeqMO790j/wKOosryXR3blvsq2Lw1WsEEWKh5uCAC2hoVoxPZv5seG8fnhq3BdW0fHhXp5yh4UDJwJTWc/gi/aXFlW92NBch0yPZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Fg9GgnOeruS32F1uu5ykzeP7gPT/f7n0ODoWXU38zE=;
 b=YBhRWDWnpJukFnv66/Dcy67rFhf+DH5e5BzSuDfE/Y0eM3jOLr4PtNGJvAqTFCCnB5ovGpoirvJ7D4wbHj1e7H6e6zxc0T2lG1gr5soAdCIr2M+Ahzl04Kxa/QNrCvfOH7v/ib9Cftt3pGDmiY1teteqviXsqp1acG4GdpU5jfOviGfSUrRzp8tSEF9AeLmTpOdiIg/0k1dy6nwDNtrbCzwX7BJT7d0JnYXJlUidDqLP71t/VYVmQ8ZniWpNBcFFu8dcwc7K28nv4fBAQJygWfRYc4TPCvuMyqFNKZeNJKeb3pobMQlcvkoDeKyood17/+XF8rAh6o+Q8CLhJveczA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM8PR08MB6355.eurprd08.prod.outlook.com (2603:10a6:20b:363::24)
 by AS2PR08MB10011.eurprd08.prod.outlook.com (2603:10a6:20b:64d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 11:44:57 +0000
Received: from AM8PR08MB6355.eurprd08.prod.outlook.com
 ([fe80::79bf:15ff:6428:dea9]) by AM8PR08MB6355.eurprd08.prod.outlook.com
 ([fe80::79bf:15ff:6428:dea9%4]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 11:44:57 +0000
Message-ID: <f56506ae-5862-4abc-9066-76a46040067d@virtuozzo.com>
Date: Fri, 6 Mar 2026 12:44:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: sched: drop unnecessary rpath from Makefile
To: Shuah Khan <shuah@kernel.org>, Ingo Molnar <mingo@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260210185112.480000-1-aleksey.oladko@virtuozzo.com>
Content-Language: en-US
From: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
In-Reply-To: <20260210185112.480000-1-aleksey.oladko@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::8) To AM8PR08MB6355.eurprd08.prod.outlook.com
 (2603:10a6:20b:363::24)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR08MB6355:EE_|AS2PR08MB10011:EE_
X-MS-Office365-Filtering-Correlation-Id: 3240e4ea-2f62-413f-3725-08de7b75ca86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	+HKttS5mrGttVU1xwLnGLAPmiCmYJKEkH37g0aTRFQgZrOX5xaukTkva1SLRhMQvvGR8QS6gBuyjDVLhbSBKVC67COVWXhlgGbzpMw0Aiqc0V2WJ4dGToQGiq5mQU1Ld9meLP8Iy0KuYURw/ZewIW06dFihA8lGdNx67Aw7vzVKB+IQD/gHN1AxSpuZ5886DUfJJUl6Y+vjihRIhdpbXhjzcq2ngYK2rdrVYct5fcH8fBCWagDAZQRMbOgM8hpaBmHDVAH683aRlhgP7SqLJ4fW1JnKxnOsP3sdAvgC9+uf27xw5lc5e+L2FObOGisb0vNvDM1HG680Mvi/9lNe9LwXYFZYUCTesgg+bKY/aGktJLemwu7rOPTUrT8joutkH7sZE4WWgThuxT8X0Jbw8Cl6TbgO7tekduog8oMWqfz3SsxhPDBJunjTZ0OdUV/rVu+0biVOtnl+Pz90mzJdyY2grKebjmM9AXvxHnelBy7+5zbGkrH9dJpr6Vmn3xMdT1G9UeTOigez5fCoQYP2T8xIQfWKlWadubc3ACPkZWvWWyfCglBTF8NWLQ2066zJJcJAmKbUVD0yA+p7/P4aXYLBXNq7B8fa0a0qPKW5vcHR247eqMuLPPjv0iv+9/6VdXXEMKXckT8SGbkqTLgpPYA/JM2FRLjdRO32Fat3Xf+fO/aQ2VWErx6nqIhN4k/Y4/ENRka3ULmSRxTEgLRGrkzekaTnb90A8/VyaCO2MsnQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR08MB6355.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3lqNmdTZWNVV0diQzNkWWlFOVg5a2pRcFIzd3BFQUZodzFUUXc1ZSt2QUxU?=
 =?utf-8?B?RFRRK0NPVkxXUWZVMDlJeEg2b1E4TXJUejc2U3F3VWpNWUIzb0lKeHRxL3FJ?=
 =?utf-8?B?L2M1dVFDMkJqM0RlTVhFUHpqUGY2VC8xbmw4Y0t3ckdPTEZsRDQyU0diczM4?=
 =?utf-8?B?aW9Rd2k1d2FCVWdoR0Q5WXZQaG1DNlpLeEp4WWhERU1GWkdaM3RYUlVQa1hC?=
 =?utf-8?B?YzlYWXJSWXZSbFlFbHZ0RTJtZTdoSEFMbWtlelh6QWZmS1NQeC9Fa3VLMGgy?=
 =?utf-8?B?anBIRFNRaDBJRy8xVVVCRXpNbmFJc2Z2cmpzZWczSi9HbURwQ0pWUnlrbFNo?=
 =?utf-8?B?TGhtK0tNTFFNOXZ6RGlJRU8wQ3BIUGJIaCs5bDkramhNbCsyR0h0M0R3SWpP?=
 =?utf-8?B?eEpoa2ZqTDlkWE55UjJhTzI3cVBYSXFTUjZNb3dLMm1POHhaY2R3Q3ZSUU9J?=
 =?utf-8?B?SWVkLzJlYzdYM3JLdll1aEFENVBPRlI1TXc5Um83eFE2TkFyTmI0ZHBEVjY0?=
 =?utf-8?B?MVlocDNmeFRSSktqd1VNazI2VzQ2YS9sSGhGN0RaVGVhMmdpeXdhRDc0d29n?=
 =?utf-8?B?d2xsc3JOU2oxZmNCMlBmbVJCQUdBOW5BN1ZrWm9raE41dThITEJpZWZBMVFp?=
 =?utf-8?B?bjBBRURvbWpZUi9ZaE5HRWZvQkdUTU00M3VieFB4eDZIdGpZbjBXbWthOFcx?=
 =?utf-8?B?NlhwbTA1ekh2WWhmRDRTY0ovTlREWHFrRFhleTRYc2RQMUpqNCtYa3laZ1ZH?=
 =?utf-8?B?Z3FxTFJlZlNENkpwQlVQUy9mbkdFSFFRQi91TU9nU1ptcTVraE01L0NQQ1pO?=
 =?utf-8?B?WTRNaE44RG5vck93aVdVaGY1TndNV0FBa0tOYWxZdVBQSjRpWEM5UXozSzFL?=
 =?utf-8?B?WEVvWWRZRDFaQXNFaS9BeFdxMG1MeFovbEV6aGFGVTdYWFVhMEs3bVFXY1I5?=
 =?utf-8?B?dG0vcW82eVgrM3EyeXVMZG5UYUNMMjdiUjRHSDZjUHZmVEk5bDlJNjROdWl6?=
 =?utf-8?B?TUhlTXlJL2txclNuUFdPeXF1K0o4ejZ3bm00SnhncS8xSS85MVNxUlh3cTV2?=
 =?utf-8?B?S0Izc2ljbko0cnZNOVNEaEIyMVNUSjdCbW0vT0hqN0c0dkRGb25Ea3lFcTJZ?=
 =?utf-8?B?RU1nUDZXVUNWQU5LVTFEcjlJTjAreTlsbW9qVy8wbnNsK2ZBOXBGZ0Z6cGRP?=
 =?utf-8?B?Wkkzd0p1QkxKQVF0bDNldkFzZnhYT29YdlVFNmZCbTMzWnVoZG8vZFRiM2dZ?=
 =?utf-8?B?Ym5mSjNJNHdDZjd0eHlBaHovWTJyK1pZakJyZXBJUGRXSVgwc1FRaTBiKzFo?=
 =?utf-8?B?QVhzMmEvdVhIcE1ZeWpqcWl0VkZYM2tJeXFBNTJyYVRSQ1B5Y3FPWmdIWWFF?=
 =?utf-8?B?RmtNQWhjYWNha09qZjZpWCtKc2UwU0ZGMzdDUkdYZGdTMDN4RHMzM2RQK3h2?=
 =?utf-8?B?My9idCtlN0dsR0Fwdk5PV3FQQk5NTko4ek5wMWw2REVpQmQrTTlBKzRtSDJC?=
 =?utf-8?B?bjlxQUZKZW9iMEcrd2x1dUhHOEVJM3pkQzgybUVmTmNsVmpDL3YrekFiQk1O?=
 =?utf-8?B?N1BITEM4d0lRRU5TTmNBTTZCckpxTlNtejUzcHVRaXphT0NsR0ZVQzBndFJK?=
 =?utf-8?B?Y1dXYXU3amREU2RVdW1HcWxyRXd6bjVmUFZwMzM5RWcxMmNrL1BPT3llN3N5?=
 =?utf-8?B?VEtSd2xXbUU4Y05VaE1qZ0xyL3NVdThGM0pReGc5NU0wN20rT2NVNHpIcE0x?=
 =?utf-8?B?RnJjUTAxVXd0VnczaUNEQW5BU1EvRXlZbWJ0YTZ3SjFQSFNFVEFYdVpDdmRz?=
 =?utf-8?B?QUhocjNPQ3dEVVhzS0ZvdXc5ZkZLMG5HNDE3UGU4b0xidXRkNFVFVjZhLzVh?=
 =?utf-8?B?bWdwZkthek55MWkzZCtYUGRLTldkWWVvMHhCZVJnK3hrOVB2bllsZzRWSW9i?=
 =?utf-8?B?dTR6Nk10ekJoTTJ0SlhHQWhQb2pBaHJzVUp4VTRaT0ttc29OTndMUVdLSjlh?=
 =?utf-8?B?QUlyaU94S3BBMmNvMWg0SktmNzlPbkFkNTVyNE1GVHFxeDhhRk43NGpMVVVz?=
 =?utf-8?B?a2ZobGp1Q09vL2k2SU1BL1BUblc3ZDZEd3lDaDdpNEcrQmtDMjNBS0ZUdk90?=
 =?utf-8?B?NUhQd3VZbWZNZGg5ZG9PSE5jU1JVOXJ2Qm9vWi8wc3l2S2orYWh5RVhYYXda?=
 =?utf-8?B?dlV2U2c3OStPQnladHBtOGRQaXdpSGR3Z0V6L3hZQURYVHBzajM4Q3oxNGwv?=
 =?utf-8?B?SjJUMlVwUWk2SUsrZkFhdFFPNHRPWXlQOXdUVXp3OGlDcHc4MDlMcWtHNlJU?=
 =?utf-8?B?aTRFTlc3SktEeDJoaDc3emVjbXNQNEQ3VExwV0VwZlZOOHF4Z2VSMjJienRB?=
 =?utf-8?Q?uOPxqEFa449FM1NE=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3240e4ea-2f62-413f-3725-08de7b75ca86
X-MS-Exchange-CrossTenant-AuthSource: AM8PR08MB6355.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 11:44:57.3879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oBi9IXLzjjclCXY4a8PZYLXCTpd8plA67r/onTljcAwe0SitgN6b1j9QygOEVPXN7lnj1vrpPZMCtIJaCYHBLLqlxJdCD1Uw5wUm9VRm7F8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10011

Hi,

I just wanted to gently follow up to see if you had a chance to review 
this patch. Please let me know if there is anything I can clarify or 
improve.

Thanks!

On 2/10/26 7:51 PM, Aleksei Oladko wrote:
> The sched kselftest Makefile adds -Wl,-rpath=./ to the linker flags.
> This rpath is not required, as the test binaries do not rely on shared
> libraries from the build directory.
>
> Signed-off-by: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
> ---
>   tools/testing/selftests/sched/Makefile | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/sched/Makefile b/tools/testing/selftests/sched/Makefile
> index 099ee9213557..0e4581ded9d6 100644
> --- a/tools/testing/selftests/sched/Makefile
> +++ b/tools/testing/selftests/sched/Makefile
> @@ -4,8 +4,7 @@ ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
>   CLANG_FLAGS += -no-integrated-as
>   endif
>   
> -CFLAGS += -O2 -Wall -g -I./ $(KHDR_INCLUDES) -Wl,-rpath=./ \
> -	  $(CLANG_FLAGS)
> +CFLAGS += -O2 -Wall -g -I./ $(KHDR_INCLUDES) $(CLANG_FLAGS)
>   LDLIBS += -lpthread
>   
>   TEST_GEN_FILES := cs_prctl_test
