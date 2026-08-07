Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013008.outbound.protection.outlook.com [40.93.196.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23151F936;
	Fri,  7 Aug 2026 14:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786112297; cv=fail; b=Ohr8D+m40c5ljfmLCWjl0QkkmzdPLZpVGjn++8V83cPU4cxk1HGPfVHbj7al4GJuTDpq8qKJh7haB0AE+8ZK1vGlki9HmKOHD/+EoBOrvwEIk05pKb70jNG0Ez+/PtQkOvy4DC+79m8WltBRXwe5VX1VsmxLZeVP3JNy+sswiq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786112297; c=relaxed/simple;
	bh=Uut152AN6gXgVxLfOpg++MeL3hz9WFw+JXx2+UlFhCU=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To:MIME-Version; b=EQ8kueUwlNqlBW86eIEfFVn3Z9Tk3GRg6l46GziEnC+GmX8a8Btw3d/ijmesnn6d/c2xQ5+THZa0fWrtmVPGf0/AvTimo8BrkwAy7LaL+wpyQHsUZBYEb9tr5EKtoDzmTIrWTRjerntfNuGBqFZ03piJN4lSEZ1+tWMFPkyk8UQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ql1VEk/f; arc=fail smtp.client-ip=40.93.196.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ql1VEk/f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H6x+Ox4aaTy/SQNvwHsLCpci1nove8Y8OWO04OASLACQD9tURxmJYQuhBgOUSyxJhjUBT3qbnGfrhM/YM0Jjych4Y4fQMkMDEkQnUi9GddydtGpM7quSQY7iVDI5r+xYyS2EUl7lbzzXWZ7r++JJWfKIJ9BVCjZrlwmMEL4IHRI/0ucBmekJMrIxYEBbIKep33ZWGW2h5YtT73dGk6tK6twFeD2oh+4xwIXfCGgMNLG01JBFoq0e8noM4vEBRuEO0ARn2FcY96oSD5gCXsB3q5L4IqW8IQYxjiDfjk+PZVocnSkQDaqgfU9oYIKea/e0/trBUfkDRTGCAE4kIJQSLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uut152AN6gXgVxLfOpg++MeL3hz9WFw+JXx2+UlFhCU=;
 b=BxbPXqcO+UbCGJZ5NhglsD0Acq6rhE8WDLwHGY8LNCJZA7p/uFxGUMuGqazMxcxJC111HUaw3gQCkEUgmPYBNotJquzgJU9uDGFyiaEzoa7Tw3wQqJmJsKLzmLFhFTyp1H5q9zuAN1SWMIgqg7Hytgc6XvgaWdK9EewRezaC0hY0OmnvQ4caFrcxboi10O7ysNgA9zXCat7uaUCRsIhVkTfpXvGYwaUiLNYeo6UnD5nq9zXnqJ5aHI5zMq7W2IbIHurlx1pBAfBjX+shohM66lZI6eZ1sOpJRNBV4957gcMYGXP/UJblgI+4GRHKCG892FFJlFxn9YMEwvHvCCYdUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uut152AN6gXgVxLfOpg++MeL3hz9WFw+JXx2+UlFhCU=;
 b=Ql1VEk/fIH3+Ktl18uFxu/MVUHxVfh9mK5tH6z4d9P6SAoYeqQ9/nUvhdxxT5WCDGiQ2lKSSSNPc4/6qfPpJp34EsNpp8HXaOwWfV5Wy1IKHpUA4cu93tzsyg9lyjedQnQg6F+3TKZjMO2d2hR318NqbpoO9kyKcJywwkyM3iE+SKQ0iXIiQnAXlh05nVdIXBO2/No7D49tobN8x+7nm3GhFGLv7L39q0wOMM0TLtBaaYlAgXDHfR5rPHDzrLIb41allrnUCBJw26DAhGV0LJnmRVvL2hOTQPnoUFWI7kTu+McwG3ysEbG0ICcd5pKWzYa1EFiviy2mHo2OSK0Q3Tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by DM4PR12MB7600.namprd12.prod.outlook.com (2603:10b6:8:108::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Fri, 7 Aug
 2026 14:18:06 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 14:18:06 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Aug 2026 10:18:05 -0400
Message-Id: <DKIRYOJXLIYN.32KI06POZL7SY@nvidia.com>
Subject: Re: [PATCH 0/3] mm: support splitting mappingless swapcache folios
Cc: "Shivam Kalra" <shivamkalra98@zohomail.in>, "Kairui Song"
 <kasong@tencent.com>, "Andrew Morton" <akpm@linux-foundation.org>, "David
 Hildenbrand" <david@kernel.org>, "Lorenzo Stoakes" <ljs@kernel.org>,
 "Baolin Wang" <baolin.wang@linux.alibaba.com>, "Liam R. Howlett"
 <liam@infradead.org>, "Ryan Roberts" <ryan.roberts@arm.com>, "Dev Jain"
 <dev.jain@arm.com>, "Barry Song" <baohua@kernel.org>, "Lance Yang"
 <lance.yang@linux.dev>, "Usama Arif" <usama.arif@linux.dev>, "Vlastimil
 Babka" <vbabka@kernel.org>, "Mike Rapoport" <rppt@kernel.org>, "Suren
 Baghdasaryan" <surenb@google.com>, "Michal Hocko" <mhocko@suse.com>, "Shuah
 Khan" <shuah@kernel.org>, "Nico Pache" <nico.pache@linux.dev>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
To: "Kairui Song" <ryncsn@gmail.com>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260805-b4-mappingless-swapcache-v1-0-b1d78ba257ca@zohomail.in> <590B3189-5B66-4ECB-84CD-7B7EF18C0E54@nvidia.com> <anNOroQdjQh7xmU9@KASONG-MC4>
In-Reply-To: <anNOroQdjQh7xmU9@KASONG-MC4>
X-ClientProxiedBy: MN0P222CA0025.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:531::33) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|DM4PR12MB7600:EE_
X-MS-Office365-Filtering-Correlation-Id: c022cc04-c775-4a05-a04c-08def48eb35e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|11063799006|4133799003|4143699003|10067099003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	aBF5Feo68Y2LFHHOHDmCzbIjYHUSDJUwNK2E+z+oHdnMwaBPMXENIdijvF/XgJF9fXEzxZcSvefoDJMwMA1K48xl6k7dk/mzFmGPfw2TLBSff+FNwAaFU5AOT6PtjiRYqDrGBFUcqc+6Vj8p7hk4yF5hkaQMqbnZud3YL+puA3ycyqHrF118A6tLVRmXFT2hxc+y2l+TRBeCzmbLTgc9zKc4rot8ceVgkvoT0RUqHWJrqEX5kXufuojHpQST3T6hLl9tXWXURm/gcUNOzRsFQ0mY3f6K3W8ihmGl6P+PrC4VzQyy/9YJwpk2oQtQhUbgAOe0Sr+/T8CaYZOP9ev+F1sFno87unf+gCqXKI+xHirqhpE5TWmwPYh8viYmVK0WcSjiP1XEYGaFijHF1M0Ovp+HMRlY8V8GXinIweID4+Se5v7nx29Wwy5JVMSaJuuUp4ugAkmNF0Ws3+IILsDbdZ4eagp8BYi4QfuToEsktV4688bPJmmv07q5xeIR1YJQph3K9IkRcpcnBt7YAgXqKsD9DhZ7HU7BlJp/aF7E0SyhS8rnxVXGiHzhc2aHlEnqJj82zvr/6H1Id/cfubWeRU7NO34T03lOb7RpGelzjCm9u6VOzR3JR298LdVdbdWAhjFpYCFEqXCm0UvSAIMpla5ffIV7QsDZG2Dd+dtfM24=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(11063799006)(4133799003)(4143699003)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTA3RFkvaWg4KzBxaTNIalRpdnFKVXBSS1lQbk1JWkN5ZEhDcWVuNTlra1JQ?=
 =?utf-8?B?dDlHSGFHbnlpZUJWYnVjVHhjMVNZZjJyd2g2Z1V2dzk3SGlrb01jUlNyVVpZ?=
 =?utf-8?B?eGtpc2s2bWltU0o2MEFVdjQ2N1pnMmF2cWRGUFJ1dXlkdjBVN0hGR1JFaVRK?=
 =?utf-8?B?SWdjNEFlQ2lyZkZxRlZnWjZYZllPT3hhUEtTZDhCamVPcW1ydGxsUlkrVHRT?=
 =?utf-8?B?bzhFZ21LdDMrQTJKcWdCcFdyNW9HZ1hYMjZyL3BhbnNuVkYyejMxUkNPMzlB?=
 =?utf-8?B?SU1DWDJKdVlDZWxvNlE0QkdMU2ZidlVwbi9MbHRCQTRHV0pISHdsZ0tZMGFF?=
 =?utf-8?B?SjZtUXZSbko1THRDeXAwMzlSZWlrVWRKZ0hSenhlcmx4czU2WUljY0gvaUY5?=
 =?utf-8?B?bWY5MnhVVnM1YW5tNWRSdFB0U2R0U25HVHRpSm1rZ0ZjWFRtSG5icUsrbWlL?=
 =?utf-8?B?dEtpUWNqZTRzQUwvMkIxT2pBWURaaExBT2MzTi9aR1BYZ1hxcEZ3K0dyeXZV?=
 =?utf-8?B?UVdhSGw4c0Qyc2tXNFNkSGJmNWxEWU5rM01UQmxaTEx0RG9GQ3ZLc0I5YmJ0?=
 =?utf-8?B?M3NGKzkzdy9PRVhwbDhTSDViUEIvdmtpZitXTHp2eXc0S1lTb3FXaE0rTXJ6?=
 =?utf-8?B?L01CeHE2VXlmc0Q4aitLOFl2S2xOSGIrNHVWblFMLzZZNVJqMTVTR0lvN1dj?=
 =?utf-8?B?Ull4N3VHM3pjdWNyeFdyTWErS1kyVHIzcWVhQm1MQTh1QUE4RzF1ZGlMTDNQ?=
 =?utf-8?B?azlKNDZ3VUVXOEp5SEpVS2djVzE3M254cHZmakdScjZZWDBZQ0lEdEU2a3Rq?=
 =?utf-8?B?Y2NCeVE1WlhDdTJQWGtsMWFoZEV2bnl4OGRIem90YXAxQUJaUktNRjNDeEhx?=
 =?utf-8?B?aVhDQVJHMFFxN3ZZeGFNbXVzQTJyOGFabEFRc0JKMWp1WmVnUHFpbDh4bEZT?=
 =?utf-8?B?TU5yRGxjcnpDckF6N0U4ekl4SjFaYUMyVFcvTGZSdFRnM2VEa1V1NE5NMU5t?=
 =?utf-8?B?d1MzaW5sZnVNNmxwTjdZS0F4UWtUZklLUlhQUWoraTFpZDVXYU1CRmJ1Ylpx?=
 =?utf-8?B?d2xyakZpenlHSG9PTzl4VExXUXVBb3JDVUw3dW0xeEdhQTZ2UytwTzdzUGxk?=
 =?utf-8?B?VXFEcFp6amUrcStDcHZPVW5lMEpvbTNYTDVseEFGT0w0ejQ0WVpuYnk0MlVu?=
 =?utf-8?B?K3FsbkZFejFMZWI4UTZQaGZEOTQ2ckcyWWhvUE04MEpqZGNzM29zeHp1c3Y4?=
 =?utf-8?B?dENSRkYvaEhrczNTcHMyckNoc0o0RjBKdHpLQTQzcXBtZUsxK3NFSjRqRS91?=
 =?utf-8?B?ejl1Q2lRaEhqK1VnR2hiOWNaYVNwMHViTXh4WElzWGorWlBPYTMxeTdLVVYx?=
 =?utf-8?B?c0NjenVxblEyRTBBVzIzMExua0NVM1R2MnAraWRxeFdSRGh6ZFQ2cmFGd3lB?=
 =?utf-8?B?ZHJMNzR1UTE4dnFndVRSVlVENDlrOUpBd3BOWW5uZHZvUTBkMEU1dmxyYmYz?=
 =?utf-8?B?ZmFCNlpVWWh2Z3FTMFdIeGxIVm1iQ0V4WVEvcllBUEQrTEhqTjBOTEhDYlNW?=
 =?utf-8?B?ZnB5clRnTGpZK3RublRkYzV1WG1DYjFuNHRlT1dPQy9pZ0lOcWxvd3FVbkZQ?=
 =?utf-8?B?L2xHRDJUcUtqWnlIWmlLdW9rNlVzUmdydy93ZlhtelJ6dnNmYWR5bE12UlpR?=
 =?utf-8?B?R3JoVUpDTkJCWDIyUzNMMDl4R01ha3JtcU1qOTU2RmwxRlVNZkJGT3RFYmxU?=
 =?utf-8?B?ODcyakZjTklQb0l4eFozQlROWXU4SmQyT1lORFRtVXlxcWR3Wk5RU1ZWWG1m?=
 =?utf-8?B?SGQwcHhVSmF3dGlUV2tQSnRUNnljbDRJdXJROWhJMUFYdmFUTmcvMXdCZ0FW?=
 =?utf-8?B?clhuckh5RjdMZ1ZjTi8rQ0tVUGVMYk5QNEhyMjV3Z1VHc0NvQ0FRWjRxWnpu?=
 =?utf-8?B?MzNZM2pvaW8weXBtYytxUUtVVFdCSTNRTWU3UzNTRGlvRlFVQ1Z5K3l4aHkr?=
 =?utf-8?B?b0JyK0tSQkFTaWQ3N3c2WnpoWnB0T2hGTXNlZkRtbDRlb2NGbXF5U2Q4Ylg1?=
 =?utf-8?B?RkFxbTM3M0JMbFFsYkhVN0d3L1hKNXdHbEZ3ZEkwQndUdGxlNmRXRUhlSWxJ?=
 =?utf-8?B?OUQvMzZsL1RnTFJjamJGVXBZbWd3UEdIdGYrbG5PL0puYmEwUXI5WFF4bTcx?=
 =?utf-8?B?Z1h3NzZER1ZCWVhLM0JqVEMvRFJXME5KWVp0eVl1dXo1VnlNdlpaUm9CQWpI?=
 =?utf-8?B?ZEdHeXdvMEVrRnhySjgxVWdwa21aaTFGWjlJS21NclYwTnMzYXdNaFY4c1lX?=
 =?utf-8?Q?vBUBdQoNwRaHYY8EoX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c022cc04-c775-4a05-a04c-08def48eb35e
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 14:18:06.7103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UPKMOrkOQEeMGKOaTNRR1ok0MA4Y5BQumF6pTEO4RUOcUjaBT1wVOn5EZYO2PfDm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7600

On Wed Aug 5, 2026 at 11:54 AM EDT, Kairui Song wrote:
> On Wed, Aug 05, 2026 at 08:03:33AM +0800, Zi Yan wrote:
>> On 5 Aug 2026, at 7:18, Shivam Kalra via B4 Relay wrote:
>>=20
>> > Large shmem folios lose their address-space mapping when they are writ=
ten
>> > to swap, but remain valid members of the swap cache. Folios read from =
swap
>> > but not yet associated with an anon_vma can have the same mappingless
>> > swapcache state. folio_check_splittable() currently mistakes both case=
s for
>> > truncation and rejects the split with -EBUSY.
>> >
>> > Implement the longstanding TODO for this state. Allow mappingless
>> > swapcache folios to use the existing uniform order-0 swapcache split p=
ath,
>> > while continuing to reject truly truncated folios and unsupported
>> > higher-order or non-uniform swapcache splits.
>>=20
>> Thank you for your patches.
>>=20
>> As Kairui (cc=E2=80=99d) mentioned in [1] (see =E2=80=9CA bit more detai=
ls on this=E2=80=9D),
>> we might not need to implement this split. I will let Kairui to decide
>> how we should deal with this patchset.
>>=20
>> [1] https://lore.kernel.org/all/CAMgjq7CHDG8JhesSPMkn1kzG8jKb0BXO756BvxM=
QC_MCn2eTyA@mail.gmail.com/
>
> Thanks for the CC, this is actually not hard to implement as shown by
> Shivam, I just found the code more and more hard to follow and fragile
> as we add more logic to it. And we don't have to reject higher order
> split either which can be seen easily if the code is cleaner.
>
> Personally I think doing some cleanup first is better, I haven't post any
> code as right now there doesn't seem to be much user of this. It will be
> needed if more clean THP swapcache begin to show up due to things like
> THP readahead for swap, which isn't here yet. I think I can send an RFC
> tomorrow just for reference. I'm fine if we prefer to remove that TODO
> using this smaller change first :)

Thanks. Can you also help review this patchset? The changes looks good
to me but I am not sure if I get all the details about swapcache handling.

--=20
Best Regards,
Yan, Zi

