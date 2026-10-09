Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012037.outbound.protection.outlook.com [52.101.66.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377FE4A498A;
	Fri,  9 Oct 2026 12:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791547833; cv=fail; b=pNFwYqUvloypZlotW3XY6ekZ1A+dfXv9A7Y/sglfK19wfHrbkpI/3lJ9TQ327AmQwcqfQLj6JbtAQyGev5rkMtp6+fqJK8sSL53SCLMnW9UeOKpev2vSVkXCOU+LM4YIFcBXbQsHMjx5fXR6UBOKyii6J6C4u/0JJv78RPg69ZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791547833; c=relaxed/simple;
	bh=cFbdo+ahiQoDvNe5sUAbSOse6Ry/a7EyI7JHe8gp10U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ENEHJ6XGesoiJAXUhbX1mingzlgwT8GOIJoB20nzX6DgR01xRH7BM7Z6YHYrkveEiY1/6Swt6W1+TlxwhKYFtMfDWT/7/PvsWKtXS7CnjrANB33fzY+qbs+o/EE8x0QE/yLrJ/9eVvigdNKr0e+4dDRNhQiFz8vtdk33JBtEdNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=vRSostzA; arc=fail smtp.client-ip=52.101.66.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b="vRSostzA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zi6Ggp3mpA++IIz6/uzHYZ8HWe7t9zFk26WzTeOgXg3pqZpE2BSzG+4jTTS4ARC85cgHB8/3ufQYIvqV+A3ktspJVcCTnfywhhzt2AdqPjOc7JHfgAgHm2Nd0mpxK7/iMDkfCSiIUKpg8wuoKoTWy97ZLVUYDt1WmN7vNVUjgVTsM42YsmW5FcCFsNy+FkILkVXpRvaFvFae0o/R5YyiviNayUF72unFVxiq3xGUHNfNY7Fs8a6Lh+/MpkeVFMxgBLBSvJ+sPx96yUGlqqmrn3LL/uigW/I0xPoQ7bu32L4PB9XMqcrIDny5O9z1FnbzhDNUkm0EIu1EMq21wwcaMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFbdo+ahiQoDvNe5sUAbSOse6Ry/a7EyI7JHe8gp10U=;
 b=tfMebZaLck5BBGDHfOnuyVxudkBUlg64BGGqFFRiSakCsUqxb09gt/6Sp4JKzl+24IdM0UelqGVa2wLw2gnP1TuqcN2tImpSNgW1EvlmtTa4duM6/EUusKz3nPT7TnwPMLIbZgOfkh9mpinur+6EeVSNR5+QCfEVtrxR/U1bVtQAVc+LdurrazhXhLHY2Eh2SqS78p7uQpFSwoIj5BE89GKcnjj5yJkhq6+XH65M9b8bH4Hns8Mfeluh+JwF8uti2J/0DJ+2Uk+em3MdrfHeStJuFcon3ck1WFpc9pvK/E9Eqr/fA04rr1vX0jl3wooEa1i7oRVdR96LnE+u7soeOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFbdo+ahiQoDvNe5sUAbSOse6Ry/a7EyI7JHe8gp10U=;
 b=vRSostzAfRxAgsFxpw+fHGfeWKOBWHT1Hl0d+f1AOObQ0x1f2DMwJIpb4Uf07xYFWeIeLClE1jj1J5NUsZAkuwJRuwrDAoCTBQQgn5rFrYsIPrLQt36dU3+sqsWZWUBKgvPJgmBNC6Wox/LgQL62g9CI/WySbafNocpszbnJDzifSg/CDA9OsqDzmTbt90Kc+8+qInRaZDAgPAkHoD1N00sKX+zk+JuQmS/R3jlJhFFvJyURWz9lAIBKoDKyFakRXHr0ZWhSF4SgMpelrXfyB4hUlxLV4F1wEaVbxXf/1UJyhkiYmeQtjV7u3FGyNHDgz59JTQ6+AjIXqjJ+IYKq/Q==
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17e::23)
 by GV2P189MB3056.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 12:10:22 +0000
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5]) by AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5%4]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 12:10:22 +0000
From: Tung Quang Nguyen <tung.quang.nguyen@est.tech>
To: shike liu <liushike123@gmail.com>
CC: "jmaloy@redhat.com" <jmaloy@redhat.com>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"horms@kernel.org" <horms@kernel.org>, "shuah@kernel.org" <shuah@kernel.org>,
	"tipc-discussion@lists.sourceforge.net"
	<tipc-discussion@lists.sourceforge.net>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>
Subject: RE: [RFC net-next 1/2] tipc: abort pending connects when the peer
 node is lost
Thread-Topic: [RFC net-next 1/2] tipc: abort pending connects when the peer
 node is lost
Thread-Index: AQHdT96DnkPftA1FAU2pW0pohXPOybbzPzzQgAFPkACAAJmbQA==
Date: Fri, 9 Oct 2026 12:10:22 +0000
Message-ID:
 <AM7P189MB113775D0F9D5E892C615FE81C6922@AM7P189MB1137.EURP189.PROD.OUTLOOK.COM>
References: <20260929064742.576651-1-liushike123@gmail.com>
 <20260929064742.576651-2-liushike123@gmail.com>
 <AM7P189MB113766407E77EB2982690B06C6932@AM7P189MB1137.EURP189.PROD.OUTLOOK.COM>
 <CAL9mPHtH3Uy51MROGgNC8bpRisodf4_xoAiEqw=oK9Eayc_fPw@mail.gmail.com>
In-Reply-To:
 <CAL9mPHtH3Uy51MROGgNC8bpRisodf4_xoAiEqw=oK9Eayc_fPw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7P189MB1137:EE_|GV2P189MB3056:EE_
x-ms-office365-filtering-correlation-id: e8a79c40-2ae1-45c6-144d-08df25fe4b54
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|1800799024|376014|23010399003|38070700021|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 Oq84MsbI6ZSf06DmjwXu8j93c/nV5RUPYvW+z0GWSV3+693ip4oohDNFc2ZgsYavLcrBsUVqR8TZeiNeFkZ6SsrF1JFz+vY+qQQF0frva03G1ii27nBG1LI1iD8OxpLEEQ0+dAte5lCWAqz5dJ9sfa60rs1zQhA1ayRBrK+QiyVBP94Ytl94c2BOW3ZRufyuGPjsJBmMogs1jN+jFeSUjnQ4ps9u8rHeIpE5HSd3OateNotKwDtnz54N1MLeX1iHMwKNQsFptp21oZPpCSR4btiZilVoW5DhxIawamktb8LFv+Vy/rOTVgcJriJDdMpfPIjXjilMgsv5IoyGVXCUmLB6Wgpw330i4cu9mieuZK91JzueA9hdyYN5n99RizSarLQPAorTTO491efh0xFY4KroHdHt+uYKHhwT+unqjfXDDd6D2UQBBvx9SN2IWKd7aoLlfSyKP+R9wxVG8i5/dCSEpLtLROa0KbTrQ2Hf9xatMA2Fq4OHceAsIGFkpt97yypv7cgWqYD3us/4chn4Ak4rGUpCLajL8cH1cl8UXflAWAMfDaRvfX5XBBUmG5joPeQjC8p4tUsRh5auPkTUe/FFmvStXArbyTTsDgJfFhEGyFig+8QZpgxq4Z38jeDmg0ST1kb5Bq2d/xbCKSQx3i9R8O1IRJt0F3JtNUH6fAlP96V8vJYKBD0pf+VchxdT3mbz4drnvYjUEkAbEESSQBDymaKVVTe+mvppErcuBTs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB1137.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(23010399003)(38070700021)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NU9VbWZGaURlMk8yemVIZEM5QWdXY1VxSnN2eHIxSDBtVmtVV0JFd3VRYVJV?=
 =?utf-8?B?SE9iU0Yrb1BnbmRyczgvQVF5VHlGYnRrdFlGTDkwSmx0T0RMWk0yd05NNUZE?=
 =?utf-8?B?RVZMc2lMMXowWXZodXJnK0lab001LytndFR4SEpjUkRYVmQ3WnNEOFJqblBS?=
 =?utf-8?B?UzU3ZnZ0Z2FxRWxOdTI0TGUzOWNqam1OWGNTajZSb2grMkFQVmVDa05BOW5X?=
 =?utf-8?B?d1hqSmJBZDhzK2hHbFpxQ203UWl1Z1h4TFNCK1ZRRnNvMFZiai9uRVZpQXZO?=
 =?utf-8?B?RUk5TzJJc3JUcUxpL3pEUXlpcnZTbjBVazNrdDhlMWlybmlBb3FkTEtBRDJ1?=
 =?utf-8?B?Yk0xYVpuZjEvbWlIWUNVSlI4bFJBLy9JMS8vcDROR1U3emorUHhpMGhsb0hC?=
 =?utf-8?B?aGNYWllVRkRwUzgxOXlPNmFCZkhlVkt5dk9DeTV6Q2JPZE13YW8zNEpNT0N0?=
 =?utf-8?B?TlcybzhFUnAzUDIrRzZMcE5UK09NMXZQSmVyZFpJSllOUW5QWkd3Z1VZUC8x?=
 =?utf-8?B?SGUvMWppV1RnN1ZIK1l1bENiWUtockZmRnM2VGhEUVU2dFZ1VFZ6YlVOL1ZT?=
 =?utf-8?B?RERxR3g5UE55K2xVWk9rNjQ3L3BvczJQdjdPVWo0aFU5eDF6L0s4cTVBcmVi?=
 =?utf-8?B?ZTluQ1NRbG1rV0N6ZTFtUFdVYmdHU3Q3WVN2MHJpMXBxTTE0VytIQkRPMk9u?=
 =?utf-8?B?RU5ZZlpvNGVHUVdIRTVxMXdodU0rSGpXTXhHckpDL3d2RXlIU05ZYzNZWmRH?=
 =?utf-8?B?YUgvWFNDVkdvNnVCUlZFUFAyZ1RROUR3OUwwV0ZPTEJkanRSVGVQMHdTbjZD?=
 =?utf-8?B?cUc1ZkNyVHlZbWJEYmo2SDlZOElVODJNTUFERkk4MUtLMTE5dWZNMXdkeTlU?=
 =?utf-8?B?c3FXRmU4RkVPVDdGc3JIeFFHNFJNRGZBUTNCWFM1aklnMzhHOHovemV2SmYz?=
 =?utf-8?B?TUJraGtweU5qVGUrUlZReU0rTGQwRW5IbDQzS2Q2V1ZYVDIwMk0yUG5XZ2tX?=
 =?utf-8?B?VWRQc3Y4VDdDT3RiSWFNVzlEQ1d4dko1R0VmaTk2elNuY0UwUUpnRzQrS2g5?=
 =?utf-8?B?NkFxYjFMNDFJclpuNUFGTGdZN0p0bkNxY0dYK3ErMXp2ZVd3S2FkRkl5NVp1?=
 =?utf-8?B?WFhpUTUydDlGcVdzeXlSYlI0ak9jUVorck1QR1RPbzd4YWJkRDF0NUZmRFJG?=
 =?utf-8?B?S3JPMlJRQWM1ZXR1emFLdmtXaFhxQ3N2RzRONHdxZGtsNDRzYXpyOFJLL3Ex?=
 =?utf-8?B?K2s5Qm1kYU1MdngrdVZrZmk3SUhlRVRCZ0Z4LzloZ1BMME5TbkxYejlTYUl1?=
 =?utf-8?B?cEdWbUxPdjFHUU9mUVp0UVEyaU01eW1aNzR3cERrc2tCK3FRdjZnYStzZXRD?=
 =?utf-8?B?T29wUWtSR0oxQjBGM3NnQS9XcFlreXIxNHFYeXlQYld3VjRidnJoYUg0WG16?=
 =?utf-8?B?THVPby8yZDVTRENxOWJ3WDJ5MjZUL1Z2b0RvTGkwUmZtMURzdFd6T3Y3NGN0?=
 =?utf-8?B?M1IxQ2x3c2tRTjVQWDd3OTZ1QjU2UWlaam4yQWN2SVVtMDJkZko0bXRFdzJs?=
 =?utf-8?B?SkYrbDJQSm9raE5BYzB6L1VCbzE2bDZabDFMWUZIREh3aTVQazlkMHl2a21J?=
 =?utf-8?B?V25SdVY3YWxkTXVvMG1MQXJmbFBlbkpwS0tpcXVwWVhsNXBkUlZnYjUrL1NZ?=
 =?utf-8?B?aU5oaUcxTE5UTDkxR1NMY0lzSU5vOWpoeHp3M2RsWlFCdzIvVkVRZEMvUSth?=
 =?utf-8?B?YzVLbmJrQ3B2U0EzQytueC9ZMHBKZEJVV3lCQ3l2UEhCSy9vQW1VVHlEODhE?=
 =?utf-8?B?dndZdUo5ejU2UGVxMXJEUXFaTWFYNTZlVjA0VGJ2eVcrYkdha0RJMDhLdFBN?=
 =?utf-8?B?dS9rS0NKeDlJelpsdWxnK0hZR1ptWWZha1BGc2NHdFVRU2xuSHd1dG1tUVZi?=
 =?utf-8?B?d00rMytOTmx2ZXBQZFlUQTB5M3hqY0hweTlsUE4ycjN6MzN3Wjk3ZG4wMkVP?=
 =?utf-8?B?MFYyWnltdHBJVnZLd0g2YVRRZXNGVmhOT25QMUxXZjFVVUpYakh6RG1sTlg0?=
 =?utf-8?B?c1RGdmRQSFZtK3JxbGlqVlhuZURKZ242dmJIcUx1WTY4SUYzajhWVURmcEdU?=
 =?utf-8?B?Wjg1Q3p1d1hCZm1CdHFIL1lsTjhQRWVwZkl0NURuUEFXTE8wdnNBK0lLL011?=
 =?utf-8?B?N0tEa3lHM3NGYjdETmRVeVdJSkd3TGltdDlnZTdIemJWRldYRTBGN0x4eVg1?=
 =?utf-8?B?OVlISHh0QncxYmRLMkoxMzRaMkVpWXVTWUJjaXErOVBRRXBrRXNUZjJPR2NN?=
 =?utf-8?B?Z0x4RDF5LzZtVWN3UTZ0djhWa0pRTkFMaDArZU5peGpPSEwrNUJxQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e8a79c40-2ae1-45c6-144d-08df25fe4b54
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2026 12:10:22.5599
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4fI8FunTREtVUxpsBYWrUASIFVgGrMavLpa5iJSydQ836VpIOe03OyF+eyu0yLRXXDShPKZaJ0fF8p2p8fXV+IDxkPFIE29Z1YTcbNwlzkg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB3056

PlRoZSBkaXN0aW5jdGlvbiBJIGludGVuZGVkIHRvIGFkZHJlc3MgaXMgYmV0d2VlbiBhIGNvbm5l
Y3Rpb24gc2V0dXAgdGltZW91dA0KPmFuZCBhIGNvbmZpcm1lZCBsb3NzIG9mIGNvbnRhY3Qgd2l0
aCB0aGUgcGVlci4gQSBzaG9ydCB0aW1lb3V0IGFsc28gZXhwaXJlcw0KPndoZW4gdGhlIHBlZXIg
aXMgcmVhY2hhYmxlIGJ1dCBhY2NlcHRhbmNlIGlzIGRlbGF5ZWQsDQogDQpUaGF0IGNhbiBiZSBh
ZGRyZXNzZWQgYnkgInJldHJ5IiBhcyBJIHN1Z2dlc3RlZC4NCg0KPiAgd2hlcmVhcyB0aGlzIGNo
YW5nZQ0KPnJlcG9ydHMgRUhPU1RVTlJFQUNIIG9uY2UgdGhlIG5vZGUtbG9zcyBwYXRoIGhhcyBk
ZXRlcm1pbmVkIHRoYXQgbm8NCj51c2FibGUgbGluayByZW1haW5zLg0KDQpJIGRvIG5vdCB0aGlu
ayBpdCBpcyBuZWVkZWQuDQpVc2VyIGFwcGxpY2F0aW9ucyBjYW4gc3Vic2NyaWJlIGZvciBub2Rl
LWxvc3MgZXZlbnQuIFdoZW4gbm8gbGluayBpcyB1cCwgc3Vic2NyaWJlZCBwcm9jZXNzIHdpbGwg
cmVjZWl2ZSB0aGUgbG9zcyBldmVudC4gVGhpcyBwcm9jZXNzIGNhbiBjbG9zZSB0aGUgd2FpdGlu
Zy9ibG9ja2luZyBzb2NrZXQuDQoNCj4NCj5BbHNvLCBmcm9tIHRoZSBjdXJyZW50IGNvZGUsIGEg
Y29ubmVjdGlvbi13YWl0IHRpbWVvdXQgbGVhdmVzIHRoZSBzb2NrZXQgaW4NCj5USVBDX0NPTk5F
Q1RJTkcuIENhbGxpbmcgYmxvY2tpbmcgY29ubmVjdCgpIGFnYWluIG9uIHRoYXQgc29ja2V0IGNv
bnRpbnVlcw0KPndhaXRpbmcgZm9yIHRoZSBwZW5kaW5nIGhhbmRzaGFrZSByYXRoZXIgdGhhbiBz
dGFydGluZyBhIGZyZXNoIGF0dGVtcHQNCg0KVGhpcyBiZWhhdmlvciBpcyBleHBlY3RlZCBhbmQg
d2Ugd2lsbCBub3QgYWxsb3cgYSBmcmVzaCBjb25uZWN0aW9uIGZyb20gYSB3YWl0aW5nL2Jsb2Nr
aW5nIHNvY2tldCB0byBhdm9pZCBidWZmZXItb3ZlcmxvYWQgYXQgbGlzdGVuaW5nIHNvY2tldC9z
ZXJ2ZXIuDQoNCj5UbyBjb25maXJtIHRoZSB0ZXN0IHNjYWxlLCBkaWQgeW91IG1lYW4gNCwwMDAg
Y29uY3VycmVudCBjb25uZWN0aW9uIGF0dGVtcHRzPw0KDQpZZXMuDQo=
