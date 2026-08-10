Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012062.outbound.protection.outlook.com [40.107.200.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0211417B505;
	Mon, 10 Aug 2026 11:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786359928; cv=fail; b=IdixgIBTA4s7z29/h2wvUda6H/38CDeBHr+3i1DLkMxZ5QW3GxZjdxrPzeNCr9icyY8mXjr222nr+p8l2f18TpExunYKrboxH07/bLnWh9ucV3J6FfsOpexeSFs9xWbqzj8erRQRmJQTK3XpAJ8Dxyv7iIFY0xgZQJRne7+i09M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786359928; c=relaxed/simple;
	bh=/Ru3lpXpj9XmQjFwRXuJWLRYQCbt6R3IpMXSGmRh4jc=;
	h=From:To:CC:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UwktauJDS9JideEW0JUC1VuCiMn7dIAhTQNxlbi2vc+eP0/L8/HWUrseqP1S4Dus2GdGn24JjmzJv1lpvlgvkHXsyiqdvRqHcP88Ni3/u3JkQumvaeTsJuFuHrorBLw+NtATXLwLxQUUbKNTVzyGgBeWM1XwuxwtlUkerBlLSbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Bbstk31k; arc=fail smtp.client-ip=40.107.200.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Bbstk31k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fMOAAYDOtuSjRzx8oZqP61gKklXzYL0jXkUn1AVfpSOPz1ieK2DLL7fJT00je/XB7gPy1JXltTSk2L3FKbJlK8JpFozX5HiAHDJHjCZqlZk/TWoiow+mleNK3sT8XXvl1ROhveKevlY1aR1ZtFxVUyMfiKxGW6DmAXSqSyD3OUJOvt7kYoUodHrSc0831ki9BH1TKC2a6FA45ziwBjLC0lAtLKjYk4/Q7Xj6JqGS/75Pmvaf6RDVye9qtJkR4xz196+pt2fRLC/7GFvG1ZE4avXWKa8tEb95kRIzcmcqz63sPw6w1NIha9gJ0sglIADYljaAG8ZR5gvvg52uJ+9mLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ArWsXd3uKiiRHfHHOD0AYMbTCwL2G2OGTXffteT+ooI=;
 b=tBQQ+Y46Ky9uABE7xjhB6HUJsj+cgJYCa9f7PR0WZKKCopE7RtOKyntsJG48axPeVDwIsmJ784+OPv1CWvMkplImzGe5u7d4p8hzeNReogA7kuq4nM9TQJka/dF9u2INliTzSDw4uh0wC63/ZNXmXqUZG1X8VdzK9ldfInJd54/+bEvLuTMZcT3A5pfXyvX0OUAngTn7gmV5755LDOEsev2S3EE+cmJ0lia66llEdpFygmt59D4MyU3dGy9nR12KMUwfh1pT/JbsmvrbniRLgCG0P+83zqiaca2A+dUUZodipw0W+mUaZqGx146XEQfoLyAkBk616ehuvLNnrj4vPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ArWsXd3uKiiRHfHHOD0AYMbTCwL2G2OGTXffteT+ooI=;
 b=Bbstk31kc8c6ht3eQKcqLDoxpHJawOC8RMlmXyVo5xR5BMs3CbAN8nQl+sI2RZofkhl8a1gZ+W4mTQAV+PwcWJVzYoXe/3j+dAzidQI49cJj6GdWWrJHXLSLI1C2Du9fes0XipylGQAEP4xAxw8ZwWVeWRKVMScLY/ZNbycL81FR37z1xACMOGDLx0eGIwpUT44McnEOE5PH8OUNJ5H+KgRC21xv2PlN2s/nUBkFZaMr1I1E1xfrgjV5ARBL1VzyExZcpWeC6oOM0AAXxl/J6JXAMQwAWg16iyk48msaHNZbX15qHOHc68RpgeHt3yockHM2IW1TnGduvEnGq7g59A==
Received: from SN7PR04CA0229.namprd04.prod.outlook.com (2603:10b6:806:127::24)
 by DS0PR12MB8293.namprd12.prod.outlook.com (2603:10b6:8:f3::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.25; Mon, 10 Aug 2026 11:05:19 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:806:127:cafe::24) by SN7PR04CA0229.outlook.office365.com
 (2603:10b6:806:127::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 11:05:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 11:05:19 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 10 Aug
 2026 04:05:02 -0700
Received: from tuxedo (10.126.230.37) by rnnvmail201.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 10 Aug
 2026 04:04:57 -0700
From: Petr Machata <petrm@nvidia.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: <davem@davemloft.net>, <netdev@vger.kernel.org>, <edumazet@google.com>,
	<pabeni@redhat.com>, <andrew+netdev@lunn.ch>, <horms@kernel.org>,
	<danieller@nvidia.com>, <petrm@nvidia.com>, <shuah@kernel.org>,
	<linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net-next] selftests: drv-net: hide the devlink
 port_split test
In-Reply-To: <20260808164843.2475226-1-kuba@kernel.org> (Jakub Kicinski's
	message of "Sat, 8 Aug 2026 09:48:43 -0700")
References: <20260808164843.2475226-1-kuba@kernel.org>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Mon, 10 Aug 2026 13:04:48 +0200
Message-ID: <87jypy9qy7.fsf@pmachata.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|DS0PR12MB8293:EE_
X-MS-Office365-Filtering-Correlation-Id: 9df85765-a269-4064-deb7-08def6cf4430
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|18002099003|22082099003|56012099006|10067099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	RR3UtKdY9NlICbuVFQlvsqVYDqyR/6pwOj026zoPraH+Rn0qYuqt2fox26bIXWpR43jlU6F0qgrmR4WsPlTKiEVix6NXNAlMA5mpvvRWUlWS7eNcpb4pTUaciPaT+xvGZfb3Vd67d9NXp0eXjazbFmpG8nC8fCxQiscPp+Qh4phr6IX7Cz0U7LLDWK3o4wmGAC6JwD7OHSlbCsOlIuQ8LFFTv6xBWsJT4AD99RILwa2+2c5K+zkIAHD17+6UXvdV8vIOLrFCDqNw5K3f4+Wa/19ijAiUr4FEcnK9AByWj+e1Lu7AYTBiL6x731FViM8uV4937opDQNeJ7GvwQ1lWUKWbvmU7wCuLxUVTQu2eZmN80yb5kq01Igik7S869bRg1zrdjU1c8UeNpdpkDtBlgzukXuovN8gTz4MI3HIaTKv4aJ5wMGvwZ0eU/law+XC68vNw8V51+9Xw5irtGPo230XLJ1q+1cgCa9n2hK+wuQSrU/0dEFuKcRYX/M7753mOsHh6wmrBI1IDxcqPQev8k316Ys79xkkJVjwg+1EdwwDZ6Liq8Ijh2CBCHg6MpOYU/2F846Ih9rv2GmM47/nTx44gZG3Z2EgaxyVEftSyQTnZTNdzXVJ8c8jzejcUMlQYjKIWZfhJ0kvXMb9l+mUjKOGefRMeOLl0PoGrFg6C/TBPrUsQebF+905xteurRvY6WgwYAtunixtOcSWpMD5EUQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(18002099003)(22082099003)(56012099006)(10067099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dS/sXPgSb/PRqiNgRoJT4fQNGkv226TTKXWAFQsqWDqkkkaau1GiYRvBx7h7S84pRZJcdHe8zpb8p1JpA5q1TIT1W6PGStuqvsobjAWaps27MNU8IawBwr+cIbuOnmcdJrQouyaG37EZldYff8uxSbLxtkOCHH/aLKYqBPuvdpsT89YjrEOzwBHBkKKN/9Olx2zUDbfUQuSZ58OYDkoDTVqTxU1INiBsxINI8MhKxHjnF5ErZlZhRMZcX437UJKp2QamiifSmi2wACq4jqkuqrTJ7TBifNZfQkQaQ0x2TZU6A7HJt9QXZbDFaunL3V/6FUoaiIcUrBDzwfAr1rBMQBYhPdbTDaBVgTg49jUeir2J1b6kK0//STn4vYYsLciPukIQPgk7ATdk5mIAQATzo/Sa1jwGnSam3TYGL9Gi3cNBwHTA8D9o0qj3IWdrrFrI
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 11:05:19.4367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df85765-a269-4064-deb7-08def6cf4430
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8293

Jakub Kicinski <kuba@kernel.org> writes:

> The devlink port_split test has limited applicability.
> NICs (as opposed to switches) require at least a re-probe
> to apply the split configuration.

Interesting, apparently some NICs require reboot after devlink port
split. Hmm, should I just move the test to drivers/mlxsw?

> On top of that the test is not compatible with our driver env,
> it just splits all ports on the system, not only what NETIF
> points at.
>
> Long term we may want to add some indication in devlink whether
> the port splitting is runtime (cmode of sorts), and fix the
> test to follow driver env. But since no (known) NIC driver can
> support runtime anyway let's just hide the test from the selftest
> framework by moving it to extra files.

Sure, go for it.

> Having this test randomly break unrelated NICs within the DUT
> makes people implement allow-lists for ksft, which then means
> their setups don't run new tests.

So I'm fine with the patch, but I don't buy this argument. People
presumably understand that allow-listing implies that only the, well,
allowed tests will be run. Presumably there was a history of new stuff
blowing up, or gradual enablement or whatever, otherwise why not just
blacklist the one problematic one? I.e. don't blame the existence of
allow-lists on devlink_port_split.

> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Petr Machata <petrm@nvidia.com>

> ---
> CC: danieller@nvidia.com
> CC: petrm@nvidia.com
> CC: shuah@kernel.org
> CC: linux-kselftest@vger.kernel.org
> ---
>  tools/testing/selftests/drivers/net/hw/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/drivers/net/hw/Makefile b/tools/testing/selftests/drivers/net/hw/Makefile
> index 234db5c2c90c..ab13f58d703e 100644
> --- a/tools/testing/selftests/drivers/net/hw/Makefile
> +++ b/tools/testing/selftests/drivers/net/hw/Makefile
> @@ -19,7 +19,6 @@ TEST_GEN_FILES := \
>  
>  TEST_PROGS = \
>  	csum.py \
> -	devlink_port_split.py \
>  	devlink_rate_cross_esw.py \
>  	devlink_rate_tc_bw.py \
>  	devmem.py \
> @@ -55,6 +54,7 @@ TEST_PROGS = \
>  	#
>  
>  TEST_FILES := \
> +	devlink_port_split.py \
>  	devmem_lib.py \
>  	ethtool_lib.sh \
>  	#
