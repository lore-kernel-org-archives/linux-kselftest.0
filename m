Received: from YT3PR01CU008.outbound.protection.outlook.com (mail-canadacentralazon11020085.outbound.protection.outlook.com [52.101.189.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76F84483B4;
	Wed, 26 Aug 2026 18:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.189.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787769838; cv=fail; b=IULf0FvLZFkAyL4nZAu3vOvWKbKYoIHLTiT7ji3ARDn8H/wDWuzDwMC9wEzsby4n9rQ1apjeoGaNfJpWnt8jYrDbsGDku+mMgCYy7dji6Qo2Y7NX6U0l3CTHSibvXOFZUUckToxps4i4417dZIWAjYLqPR8EU/uwscfMOtPBdI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787769838; c=relaxed/simple;
	bh=c5BHRYOV7Bn4vANJLnTH803nK9WdZTQjogNFIAl0t1U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mGUJTb+TAVP4WEBe9nabax9B4DeyYoVFZ2bb94vU44CO3WgDNhn047YlfWsLYVa+Kfa03CqJdzle8tw9COLHJjCDaCKpuwyhkZ7m9QNwxXRukRhLwnnXgQZkp7T8i+QL0SA4G4qLb6aN4uEwtCmgXlDsQ8dqrRnSWPbLciJDa4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=OtbWDSYe; arc=fail smtp.client-ip=52.101.189.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="OtbWDSYe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w+BoytD6sFCT9ot4mBWIw8fL3Qt7WmDVoaGEHP9o4NKoLPOuHrx3sLKy+NmMFDIxCTCe1bp++VnIZPf+Hn/4IZfPWLdt+JfNldG7us7lIl/zLdArS5nM+FvBWT3poMY5oSAJoCwWiR4Oe9DH4O2PWCkqX15siTkB84cSMs+meil4nw23R4oZVwO/co8Eu5/jGVSxrRpOMdCPvUFV/8VN5bdxmiVhStXoG49QkV+Kw4mjHFWrQUWKFFiBu+sU1ucHCYVwnCqYpS3GXLc6ioFhXgBO/5jvS/WA+ICWYmFWPxtXEoc13UvsSe1qxwn9D7XxOKr98AHuCZ7okwItqxJz0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDmTazo1yVm1Q47VZG/fSiocxzskAu450od4DT+oxZE=;
 b=ml/PWXraSX04Vam7i5JWxDGa9kgYygzfbqw0m1Ti419RDwA604mpOLQzG+RVUEUjUHtT5vmYso38CdQnhHJdIpYLpYLrC11r4bkiekZK3FwW2dnT3Rdmc7Zz0yeBlp0pOxJWmi9BvsIhg9VsvvXBVwSiWUgVrIVCYgIvF43Accj1l1/jarnw8TlL81Cu8jaZbXxO49ERUcxqI2+EyqPUtGp/JO2sDC+wn7rv/c+MIPs3GhySwb6+B1BbNtF0mQMm+AUuQlxxgeGSjrUdkZ7mMFA8DOgOsMrNQBrT1xaMvt26GQJDccaGsPOgVXTc4pZasJEJjU9vjS6UScq7gqa2mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDmTazo1yVm1Q47VZG/fSiocxzskAu450od4DT+oxZE=;
 b=OtbWDSYeCUXIUreiOWNXfEyUzVIzulADu+9yv9UHoxpkQUWJlthdpCcTxPWHuoP3mSrmt9gbqny5w8jXC2Ew4CKNmCjOmgf/iEB94u/k+qjISflRxQEqqoAGxItRXynkntnE2CcSs9iKG/zgSI1ho/FVKoVQItJ56tNo95xzykAdQriE5pQWRiYlDqNVGEKZtP3UnPKbuyd53o3yEY3frWTqVjINpwZQOP85YbBvGOOBwWihUFc98keHfZdJBH1jjolKD41y+CBiVzL1J4Rp3C6Nv8+iIxBC2zsi/1g5D4JAoSql+yg1LJMnt5DR0rdFGdI4+bga5W/tvkopGmwATA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB6451.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6e::20)
 by YT1PR01MB9242.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:cf::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.9; Wed, 26 Aug
 2026 18:43:41 +0000
Received: from YT2PR01MB6451.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::1ee8:6055:75fe:7c18]) by YT2PR01MB6451.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::1ee8:6055:75fe:7c18%6]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 18:43:41 +0000
Message-ID: <5e269b07-ba8d-4f48-a118-606bf211c423@efficios.com>
Date: Wed, 26 Aug 2026 14:43:40 -0400
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH] selftests/rseq: Fix circular dependencies in Makefile
To: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>,
 mathieu.desnoyers@efficios.com, peterz@infradead.org, paulmck@kernel.org,
 boqun@kernel.org, shuah@kernel.org
Cc: broonie@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260818155337.4774-1-mahad.ibrahim.dev@gmail.com>
From: Michael Jeanson <mjeanson@efficios.com>
Content-Language: fr
Autocrypt: addr=mjeanson@efficios.com; keydata=
 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 IZHa
In-Reply-To: <20260818155337.4774-1-mahad.ibrahim.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0266.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::31) To YT2PR01MB6451.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:6e::20)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB6451:EE_|YT1PR01MB9242:EE_
X-MS-Office365-Filtering-Correlation-Id: 31bdffc1-6e28-4e12-222f-08df03a1f2f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|3023799007|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	p6lusMC40+/gRyBhY6uJF8bUwAxP2N/OIIICk/vrxJib384tlYfbPhH7AVIEbWFx83W1cyRcv0OXPKQRwcGHRvZNFdwmauhviuKO61RdydcglPRfUyJmceybK3YJqehkD3vfBzW6Fxhm+gohp5XSP16ZSzchKbJXeq+docV8II/b6oElFH54V/7WaN56bYKZVjOZwp+m0aoNTIP70/olyi+syOODRStMeEyIneZpggwWrE+T4MR01CpvIyCSnfRBhnEYpKhoSbYxz9QLkKDH5gkd3Mc4d4c1/Sjv7dyXZaQ+54lYDk/ZIR5/ypt/hIGUip+B5AEeV5zdjyuW4D2X5L47MNUF6Yn5PCZVdR1GY25yIgw9bZxn2InHzOD7+b5blS+m3teSfscjGAoJQVCD5p/iQRra3C8rWzmWK05q42MjpT3/yFTfs5WPgShQkvcTBt6Sa3aBIKaV+j04Ih5Vugf8jmEh+lvSkGb0hAoU3IQQvLGmSLv+Io2OulAzzNnsRcDLViITVOM0q57iBFlEwfaiQ6pd0HSroPFqwLQvxrIpcHQmKoH3J+nLKaYwZmf2mN1i0ivZCH3ewLi3gOkcbROa1Vvw2YHY4YEfo0dOShZmj+PKZteTWRSl9oBdnq+Jn0WZrqC7nc2LOPmGKsLVZsV+lH7Flevn1zlnfU/Pd9E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB6451.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(3023799007)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjJOeDBvWFNZL2xIcytPWEZybzZIK2tMN2dld0U1a0t6NjFiTlU3dDNzdm10?=
 =?utf-8?B?QWJNaThaMkV1RHl5R3RiSC9TQ3JmUkk3UE05dE9FTS9kQWJTUzhUT2xoZE5p?=
 =?utf-8?B?MUMrR25iWnlFamdiMGdZeHBGekFFMHhYWlo3MG5WRzI1UHM2NnVabUcvcFdU?=
 =?utf-8?B?NWdxL2Y0Y2JMSUsrSXlpdFNWZnl4NXh0N1dlR1ZaakJDV3RVT2V2cWw2dytT?=
 =?utf-8?B?dWNzbWlKWUhGMVhUenZQRFZLNlFTSXpYRjBoNEc5Yjg5cEROeEFncnhFQ0ZB?=
 =?utf-8?B?ZjM0bjQ0WVhlWjZ5emNJQmpDblVKZlBxSUU5a2RhMkRWNElWSUFPbUpsaVZY?=
 =?utf-8?B?eXFBc1ljNWVBdFF3YnFRYy9kanhZaStQZ3FXODFiNFZEcmtTNm1QZnRVUnRF?=
 =?utf-8?B?eFhuUElDQWdSZlE3ZGxwMFJJVVhWQjFYeTJaT2VyV1U1NDllQW44NVh5WTdk?=
 =?utf-8?B?aWxVS2dKTlNkMzFZU0ZmSFJqRkdCRWh5emNacmNTaW95dWhscU1LclE4bUxE?=
 =?utf-8?B?VmxkbzNVMkdGeHNpNmxzMDhQSHlzSTNSTFlncmRmNEx0SnQ3NkZUdGVYdnhL?=
 =?utf-8?B?N25QdXZhRHJ5cmlnZGs0OFcvdzhqMVp5Y0w2ZzZOenhKd25Fb3g0RlJybzZy?=
 =?utf-8?B?NGtyUTA4UmlMc1prVEVQZXNqMmNoYjRpOXlLK0xIUldRUnh0THNPZFZVc0lt?=
 =?utf-8?B?M1FqSzE0bUx1UldQcGRQSUtnNTJDL0tHZDJuMjFYTjBwYWdINFFQWGJ6VjJ0?=
 =?utf-8?B?TkZCajY3VjIzSERwQy9DbzJ2aXFmZE5SZnIzcUFJNVlJSXdNc2JudHptSXVQ?=
 =?utf-8?B?U2lXdCtIRXg3d2ZjTUJUZFlXK3k3a3RNeVFxZkFUekRFOWZ2QUFNQkZHdVNX?=
 =?utf-8?B?UW1ZWDF5Zm51TzhYWXdybTYxNjJjZjVKNlF2T2J0NFRyeVFCYzc5L1FkRHU0?=
 =?utf-8?B?UHo5M2dBeFlKNW9EaGJpSmNZaFpEcFJTTGRqc0tGRWVzeWxBY1M1R2Q5aXdR?=
 =?utf-8?B?Y2pYdWtZVXhRRW0rbTBkdlFGektSUmtneExXNzFPMEt3cTN5ZzMwR1ZvUnAw?=
 =?utf-8?B?SytTb011cDl5aTlkOEhvWnoyLzBNUDNqbmJ3aEk4dmYrYXhId2ErU0tCeGV5?=
 =?utf-8?B?VXBGaUsyQTR4UlNOVXBoT0lHQ3BvUnZheWRNQXI3NDNLOXRmc2kveU5MamtG?=
 =?utf-8?B?bU5rcTg4VFYvU2QxZmEreHA5VnI5WFo3RVJaS0VNZmdpbzdJRUNDK09VNFQr?=
 =?utf-8?B?TzJBazk2d2QveHlkQlQwbUhQU0hLQkFoVEJSTTJNdWpqaFRRUGs2ekY5TUtr?=
 =?utf-8?B?bE4wVWFUYVhQTW94WnVJRUFtT3B1ZmJTZFhmVnVqc2laRjlJb05tTHQxWi8y?=
 =?utf-8?B?dEp5aVQvOWxYdkZWbFlHMk0wanhoMXFNQUw3aFUrUEt6V0ZDandaSksyOFpH?=
 =?utf-8?B?ZTdrU3pmRkdyMXpMN1pEVXFOaGoySkR6cG4rMmY4TFVndTFzK2ZFLy9DNWlz?=
 =?utf-8?B?VUFkMHI4akMyNTh1NDBKeTYxOUt1K00zVEhUUmNsY1pRMjFTU0RhaWJYbklF?=
 =?utf-8?B?TTE3clQvVG1oMlo3MkQ0cW9iYnhTUmdEY3dPamhveHh3SFJKY1FqeDBOSTIz?=
 =?utf-8?B?aHBacE84b1BUWW55UGJPSVR5Q3N6MHpSdHJoMzc5NWNBcHMyUHlnakJkMlFJ?=
 =?utf-8?B?TEpMbW5lS3VhZWtlOWNaRDIyanF3TXB0Q0NIUThzaExPWUxXbWZrVXpXclBH?=
 =?utf-8?B?dmZhaERPaEhkTmNnTkpsblkrL2I0eGtOM3A2SEtEc3NZbS91SVJNcE55ZWRT?=
 =?utf-8?B?bEJ0SEFQajhqUEdQSGpldUlFZ2xwaEVPZGlqRDNOeEE3bkJoNzR1OExBN1lG?=
 =?utf-8?B?bUh4RW9ISjNialE0K0FrZlpPQmMwb3VyOVhJbnllVUFOSXRBWDBCWTlnUkU3?=
 =?utf-8?B?WXNsVmN4cE5yaWN1WC9KSWhpdGRtMlVHQWFUaUV3MjgxeUdHbm5ndWROdkt6?=
 =?utf-8?B?MEoxMmFSZWZvTzNBQlA4clN6QnV3a042c1MrOW5CM1gyOTZKdlEzckF0YVhu?=
 =?utf-8?B?Y1dIVzBxNHdpaStrZWk2aURZYkFFc2M5bmN4V2xUWnc4MEE3eVZDQ05xRFVQ?=
 =?utf-8?B?NmZVTDRmMzl3SWtkVmt3aHVuR1Q5eEZ2UHUzRzVEU0podWdONFNkZVRGYXpU?=
 =?utf-8?B?MWN6QTVrWkpORmFOK25SWk5SSzcrMVJPRnRjaHoyT01KeVE3WmR4NHlMeUti?=
 =?utf-8?B?N1JPOU9oeGpnZzRMeXN5cE45TTBnaFNGTmtyUGVzVVo4OVhIUEJxL0xOaHcr?=
 =?utf-8?B?SmhrWmJQNGx2b0pRNEJtR05KU0lldk5wOUVpb2FWTXVlMjBNOEJWZz09?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31bdffc1-6e28-4e12-222f-08df03a1f2f0
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB6451.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 18:43:41.2267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YguERbfCs805VsoNZ0B/ZjJGAgK2mAm7TW3YIBTUytGG+GvIK8FkLeESr9u9U+ZuMNofTJ3hT8ZYfUTJ+xBtpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PR01MB9242

On 2026-08-18 11:53, Mahad Ibrahim wrote:
> TEST_GEN_PROGS_EXTENDED lists the binaries which are to be built but not
> run. However it is also listed as prerequisite for every generated binary
> to link against; all binaries only require librseq.so.
> 
> This results in the following warnings:
> 
>    make: Circular .../rseq/check_optimized <- .../rseq/check_optimized dependency dropped.
> 
> Such warnings are emitted 36 times in in-tree and out-of-tree builds.
> 
> Additionally, the generation of a single binary pulls in all of
> TEST_GEN_PROGS_EXTENDED as they are listed as prerequisites for each
> other. However since Make drops all the prerequisites which form a cycle,
> the build succeeds, but results in unintended behavior. For example
> building a single binary like check_optimized compiles 9 binaries while
> only 2 are required.
> 
> Fix circular dependencies and unnecessary compilation of binaries in rseq
> Makefile by isolating librseq.so and headers into a single variable which
> is added as the prerequisite.
> 
> No warnings are emitted after the change, and building a single binary
> only compiles that binary and librseq.so. Verified in-tree and with
> OUTPUT= set to a separate directory.
> 
> Fixes: cb48828f06af ("selftests/rseq: Don't run tests with runner scripts outside of the scripts")
> Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>

Tested-by: Michael Jeanson <mjeanson@efficios.com>

> ---
>   tools/testing/selftests/rseq/Makefile | 28 ++++++++++++---------------
>   1 file changed, 12 insertions(+), 16 deletions(-)
> 
> diff --git a/tools/testing/selftests/rseq/Makefile b/tools/testing/selftests/rseq/Makefile
> index aba6317f6cb8..9c369e59bb2d 100644
> --- a/tools/testing/selftests/rseq/Makefile
> +++ b/tools/testing/selftests/rseq/Makefile
> @@ -37,41 +37,37 @@ TEST_FILES := settings
>   
>   include ../lib.mk
>   
> +RSEQ_DEPS := $(OUTPUT)/librseq.so rseq.h rseq-*.h
> +
>   $(OUTPUT)/librseq.so: rseq.c rseq.h rseq-*.h
>   	$(CC) $(CFLAGS) -shared -fPIC $< $(LDLIBS) -o $@
>   
> -$(OUTPUT)/%: %.c $(TEST_GEN_PROGS_EXTENDED) rseq.h rseq-*.h
> +$(OUTPUT)/%: %.c $(RSEQ_DEPS)
>   	$(CC) $(CFLAGS) $< $(LDLIBS) -lrseq -o $@
>   
> -$(OUTPUT)/basic_percpu_ops_mm_cid_test: basic_percpu_ops_test.c $(TEST_GEN_PROGS_EXTENDED) rseq.h rseq-*.h
> +$(OUTPUT)/basic_percpu_ops_mm_cid_test: basic_percpu_ops_test.c $(RSEQ_DEPS)
>   	$(CC) $(CFLAGS) -DBUILDOPT_RSEQ_PERCPU_MM_CID $< $(LDLIBS) -lrseq -o $@
>   
> -$(OUTPUT)/param_test_benchmark: param_test.c $(TEST_GEN_PROGS_EXTENDED) \
> -					rseq.h rseq-*.h
> +$(OUTPUT)/param_test_benchmark: param_test.c $(RSEQ_DEPS)
>   	$(CC) $(CFLAGS) -DBENCHMARK $< $(LDLIBS) -lrseq -o $@
>   
> -$(OUTPUT)/param_test_compare_twice: param_test.c $(TEST_GEN_PROGS_EXTENDED) \
> -					rseq.h rseq-*.h
> +$(OUTPUT)/param_test_compare_twice: param_test.c $(RSEQ_DEPS)
>   	$(CC) $(CFLAGS) -DRSEQ_COMPARE_TWICE $< $(LDLIBS) -lrseq -o $@
>   
> -$(OUTPUT)/param_test_mm_cid: param_test.c $(TEST_GEN_PROGS_EXTENDED) \
> -					rseq.h rseq-*.h
> +$(OUTPUT)/param_test_mm_cid: param_test.c $(RSEQ_DEPS)
>   	$(CC) $(CFLAGS) -DBUILDOPT_RSEQ_PERCPU_MM_CID $< $(LDLIBS) -lrseq -o $@
>   
> -$(OUTPUT)/param_test_mm_cid_benchmark: param_test.c $(TEST_GEN_PROGS_EXTENDED) \
> -					rseq.h rseq-*.h
> +$(OUTPUT)/param_test_mm_cid_benchmark: param_test.c $(RSEQ_DEPS)
>   	$(CC) $(CFLAGS) -DBUILDOPT_RSEQ_PERCPU_MM_CID -DBENCHMARK $< $(LDLIBS) -lrseq -o $@
>   
> -$(OUTPUT)/param_test_mm_cid_compare_twice: param_test.c $(TEST_GEN_PROGS_EXTENDED) \
> -					rseq.h rseq-*.h
> +$(OUTPUT)/param_test_mm_cid_compare_twice: param_test.c $(RSEQ_DEPS)
>   	$(CC) $(CFLAGS) -DBUILDOPT_RSEQ_PERCPU_MM_CID -DRSEQ_COMPARE_TWICE $< $(LDLIBS) -lrseq -o $@
>   
> -$(OUTPUT)/syscall_errors_test: syscall_errors_test.c $(TEST_GEN_PROGS_EXTENDED) \
> -					rseq.h rseq-*.h
> +$(OUTPUT)/syscall_errors_test: syscall_errors_test.c $(RSEQ_DEPS)
>   	$(CC) $(CFLAGS) $< $(LDLIBS) -lrseq -o $@
>   
> -$(OUTPUT)/slice_test: slice_test.c $(TEST_GEN_PROGS_EXTENDED) rseq.h rseq-*.h
> +$(OUTPUT)/slice_test: slice_test.c $(RSEQ_DEPS)
>   	$(CC) $(CFLAGS) $< $(LDLIBS) -lrseq -o $@
>   
> -$(OUTPUT)/check_optimized: check_optimized.c $(TEST_GEN_PROGS_EXTENDED) rseq.h rseq-*.h
> +$(OUTPUT)/check_optimized: check_optimized.c $(RSEQ_DEPS)
>   	$(CC) $(CFLAGS) $< $(LDLIBS) -lrseq -o $@
> 
> base-commit: 0f23d56f17fdfc7db69d51f64c8b91bbab947aa9

