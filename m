Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010062.outbound.protection.outlook.com [52.101.56.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D18642E8FF;
	Wed,  2 Sep 2026 10:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345861; cv=fail; b=umI+ThCgTSQx+c0cRGuHtw7ua1y3ZEPSZt5D5VnMZhLD/sTeI6cIdm0T8oSBiiGUFLuuo8yRHB8hblfAdIcMWccih/oHGHp2iORi2vHPk823YhgmVgmakRQOGgJ8Ng2y/0i/DBPsioFsPTY9JlA2SttX90bcjO4ihLswsEZ7ESA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345861; c=relaxed/simple;
	bh=SpGuiyE+wXOiODss1peVP6HTZE+1sXhOVxzHnqrH19M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KibDI9eYPj88U9Ka+cjP7zoT6y0h+fMOjmGU/oazHhu0v4Qc2lpMLhjPuZ10rBDIkTlU3G+NCyDWRc0CwN0txOpdczHhnbCoU1ZukhUHwRPFqjafVHJfFWxVLf+Eu0Q4ccB+5cIwRHfEMiR5KlF/5XYpFhqKb1L5AdJAzanQdK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VrUYSY5B; arc=fail smtp.client-ip=52.101.56.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VrUYSY5B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rExelTEzCYdFesGo6tui1kN3iGTNStND6bVUe+nJbMrQtQqXPWpQqKyH65ePgxHeAWIUoqMyi3BIn16I9hvLq7GXG8TKDoERwizyPl+Wsfl+dGWzv1YgtdbH/how75smFWx4yGVpcSvpRNIRJwJ9ntjmXqu6LwZ/DosLt0QJIS1lCNtoYzb1OhqpSpmOa0q80Dz6yC5WKHywV+PzRVZvXh5dB8WIjuvNs+YTzZSm5eRAyum95jy6GBth6tngtxqKaLudR6H76c4DoBnCja/k3E4kB+KvqsjxYeBzFMDFIXHKGYGXQeMnBY8afesvMBLLshM6rTa919WI9Y0U04zcIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65cKisN2n/sZ0Paqfhmjk3tslrfFu2lonPSslbB4DyM=;
 b=clcaOmJliXrDzWkdyj0WkNI+Jpw2v4N3AZWMVEbEvzjMD+AOjn75Dd7PZ9Vrq0En1mT1688g2/fsxDPqy4qw9MhikRFeCl1g5zZJjH0MRMtHavUbp+4tvg98sVpyEiLAw/3Nq1o+1OfGXYORmOfhvbwP+arJoNXJJoj+0zyXsKAGymiUeJL+cIuO+Ooebt+yLIKSIkfUx4Gddo75NXGANjiW1dWigegpEbCdE6OUAILJ1pdkvWr903VW96E27AvyBK6Z9JxpfkcROwXAvLWV9rUARenOWE21cjnX5VWphroP9AY4pKp5+CKnqGu4S/9XZ2wiilcvjVijYP4I57MnKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65cKisN2n/sZ0Paqfhmjk3tslrfFu2lonPSslbB4DyM=;
 b=VrUYSY5Bexlq9G+EJoKU379hJk3JatKL86Ff3f+ilgUMkFqOTlkiS0Ms6aPmPMQ2lKlq7QBE2IFJLkNrwq628RimycpAmtqf5zGQAeTK0l081T8CMTECG/vu2cwL9HDbKp0HPJ0bDMdVxvvHX0k1jKPRvuITSqiXNOxfEi6Wpqg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by CY3PR12MB9677.namprd12.prod.outlook.com (2603:10b6:930:101::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 10:44:14 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 10:44:14 +0000
Message-ID: <5304cc2a-5ef3-4b18-a02f-6cb051640b16@amd.com>
Date: Wed, 2 Sep 2026 12:44:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] kunit: qemu_configs: Add microblaze configuration
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
References: <20260804-kunit-microblaze-v1-0-6dcdfe12eb40@weissschuh.net>
 <20260804-kunit-microblaze-v1-4-6dcdfe12eb40@weissschuh.net>
 <5cd8df03-ad51-460c-9b20-3bf288831b5a@amd.com>
 <60d4618b-3620-4ecc-a2c6-2b382de68724@t-8ch.de>
 <40f679a2-fb5d-4d69-96dd-ab6c6718ac07@amd.com>
 <b48fee3e-d113-4551-aed4-100a089e33b5@t-8ch.de>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 xsFNBFFuvDEBEAC9Amu3nk79+J+4xBOuM5XmDmljuukOc6mKB5bBYOa4SrWJZTjeGRf52VMc
 howHe8Y9nSbG92obZMqsdt+d/hmRu3fgwRYiiU97YJjUkCN5paHXyBb+3IdrLNGt8I7C9RMy
 svSoH4WcApYNqvB3rcMtJIna+HUhx8xOk+XCfyKJDnrSuKgx0Svj446qgM5fe7RyFOlGX/wF
 Ae63Hs0RkFo3I/+hLLJP6kwPnOEo3lkvzm3FMMy0D9VxT9e6Y3afe1UTQuhkg8PbABxhowzj
 SEnl0ICoqpBqqROV/w1fOlPrm4WSNlZJunYV4gTEustZf8j9FWncn3QzRhnQOSuzTPFbsbH5
 WVxwDvgHLRTmBuMw1sqvCc7CofjsD1XM9bP3HOBwCxKaTyOxbPJh3D4AdD1u+cF/lj9Fj255
 Es9aATHPvoDQmOzyyRNTQzupN8UtZ+/tB4mhgxWzorpbdItaSXWgdDPDtssJIC+d5+hskys8
 B3jbv86lyM+4jh2URpnL1gqOPwnaf1zm/7sqoN3r64cml94q68jfY4lNTwjA/SnaS1DE9XXa
 XQlkhHgjSLyRjjsMsz+2A4otRLrBbumEUtSMlPfhTi8xUsj9ZfPIUz3fji8vmxZG/Da6jx/c
 a0UQdFFCL4Ay/EMSoGbQouzhC69OQLWNH3rMQbBvrRbiMJbEZwARAQABzSlNaWNoYWwgU2lt
 ZWsgKEFNRCkgPG1pY2hhbC5zaW1la0BhbWQuY29tPsLBlAQTAQgAPgIbAwULCQgHAgYVCgkI
 CwIEFgIDAQIeAQIXgBYhBGc1DJv1zO6bU2Q1ajd8fyH+PR+RBQJn8lwDBQkaRgbLAAoJEDd8
 fyH+PR+RCNAP/iHkKbpP0XXfgfWqf8yyrFHjGPJSknERzxw0glxPztfC3UqeusQ0CPnbI85n
 uQdm5/zRgWr7wi8H2UMqFlfMW8/NH5Da7GOPc26NMTPA2ZG5S2SG2SGZj1Smq8mL4iueePiN
 x1qfWhVm7TfkDHUEmMAYq70sjFcvygyqHUCumpw36CMQSMyrxyEkbYm1NKORlnySAFHy2pOx
 nmXKSaL1yfof3JJLwNwtaBj76GKQILnlYx9QNnt6adCtrZLIhB3HGh4IRJyuiiM0aZi1G8ei
 2ILx2n2LxUw7X6aAD0sYHtNKUCQMCBGQHzJLDYjEyy0kfYoLXV2P6K+7WYnRP+uV8g77Gl9a
 IuGvxgEUITjMakX3e8RjyZ5jmc5ZAsegfJ669oZJOzQouw/W9Qneb820rhA2CKK8BnmlkHP+
 WB5yDks3gSHE/GlOWqRkVZ05sUjVmq/tZ1JEdOapWQovRQsueDjxXcMjgNo5e8ttCyMo44u1
 pKXRJpR5l7/hBYWeMlcKvLwByep+FOGtKsv0xadMKr1M6wPZXkV83jMKxxRE9HlqWJLLUE1Q
 0pDvn1EvlpDj9eED73iMBsrHu9cIk8aweTEbQ4bcKRGfGkXrCwle6xRiKSjXCdzWpOglNhjq
 1g8Ak+G+ZR6r7QarL01BkdE2/WUOLHdGHB1hJxARbP2E3l46zsFNBFFuvDEBEACXqiX5h4IA
 03fJOwh+82aQWeHVAEDpjDzK5hSSJZDE55KP8br1FZrgrjvQ9Ma7thSu1mbr+ydeIqoO1/iM
 fZA+DDPpvo6kscjep11bNhVa0JpHhwnMfHNTSHDMq9OXL9ZZpku/+OXtapISzIH336p4ZUUB
 5asad8Ux70g4gmI92eLWBzFFdlyR4g1Vis511Nn481lsDO9LZhKyWelbif7FKKv4p3FRPSbB
 vEgh71V3NDCPlJJoiHiYaS8IN3uasV/S1+cxVbwz2WcUEZCpeHcY2qsQAEqp4GM7PF2G6gtz
 IOBUMk7fjku1mzlx4zP7uj87LGJTOAxQUJ1HHlx3Li+xu2oF9Vv101/fsCmptAAUMo7KiJgP
 Lu8TsP1migoOoSbGUMR0jQpUcKF2L2jaNVS6updvNjbRmFojK2y6A/Bc6WAKhtdv8/e0/Zby
 iVA7/EN5phZ1GugMJxOLHJ1eqw7DQ5CHcSQ5bOx0Yjmhg4PT6pbW3mB1w+ClAnxhAbyMsfBn
 XxvvcjWIPnBVlB2Z0YH/gizMDdM0Sa/HIz+q7JR7XkGL4MYeAM15m6O7hkCJcoFV7LMzkNKk
 OiCZ3E0JYDsMXvmh3S4EVWAG+buA+9beElCmXDcXPI4PinMPqpwmLNcEhPVMQfvAYRqQp2fg
 1vTEyK58Ms+0a9L1k5MvvbFg9QARAQABwsF8BBgBCAAmAhsMFiEEZzUMm/XM7ptTZDVqN3x/
 If49H5EFAmfyXCkFCRpGBvgACgkQN3x/If49H5GY5xAAoKWHRO/OlI7eMA8VaUgFInmphBAj
 fAgQbW6Zxl9ULaCcNSoJc2D0zYWXftDOJeXyVk5Gb8cMbLA1tIMSM/BgSAnT7As2KfcZDTXQ
 DJSZYWgYKc/YywLgUlpv4slFv5tjmoUvHK9w2DuFLW254pnUuhrdyTEaknEM+qOmPscWOs0R
 dR6mMTN0vBjnLUeYdy0xbaoefjT+tWBybXkVwLDd3d/+mOa9ZiAB7ynuVWu2ow/uGJx0hnRI
 LGfLsiPu47YQrQXu79r7RtVeAYwRh3ul7wx5LABWI6n31oEHxDH+1czVjKsiozRstEaUxuDZ
 jWRHq+AEIq79BTTopj2dnW+sZAsnVpQmc+nod6xR907pzt/HZL0WoWwRVkbg7hqtzKOBoju3
 hftqVr0nx77oBZD6mSJsxM/QuJoaXaTX/a/QiB4Nwrja2jlM0lMUA/bGeM1tQwS7rJLaT3cT
 RBGSlJgyWtR8IQvX3rqHd6QrFi1poQ1/wpLummWO0adWes2U6I3GtD9vxO/cazWrWBDoQ8Da
 otYa9+7v0j0WOBTJaj16LFxdSRq/jZ1y/EIHs3Ysd85mUWXOB8xZ6h+WEMzqAvOt02oWJVbr
 ZLqxG/3ScDXZEUJ6EDJVoLAK50zMk87ece2+4GWGOKfFsiDfh7fnEMXQcykxuowBYUD0tMd2
 mpwx1d8=
In-Reply-To: <b48fee3e-d113-4551-aed4-100a089e33b5@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI6PEPF000001F6.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::90e) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|CY3PR12MB9677:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b9a6e55-0db0-4329-bc75-08df08df2154
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|3023799007|10067099003|4143699003|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	PHxWXd62pR5sVe+DEO5jT8nGUmtwgmcvF3DjpoJ94Yw7T7cPV59kqCwaaCMICQxuJVbxNAJFoqXfyU1HfExx8MeXe3vIT17RCbPikzxzk6LgJj/NplczDJkeCjESxuPCjZNSERVhaxlywfY7PCiQ4z8XMs02M59A7q2sgKJ69kxjZijXEuq4LU2rfNXshNmlA4Fw0s1KWCqxoCLs9Ui1yVDcW1LRmg1mLldf3IBgPts1iiPAd6zGNfgxBs3dln82kwv01keXPt5CdX1tAO7tGy408eCUNSeiRMWRO3QPphrmdY9wA76ZdHBR4XWGm7UTXE5GHztDHj1Nas5OUNwRuWEOKplzckFtw/zNRGlU6CyjT3l+Spq/rlyg93q29lBalJuaD4YlGqwf7fwAGXfPcYd4uMWux0wrDvr+JZnXh11tn+4d0CtHqqYMH647E4slGP/1Y3Oy+lWvDCQcqzxbO/75PAEqsP9BaBEl4JWO6MY1dgMZbn7gt+O301qx2fXxQCr3N7zWHxkI9wJC5H41HoyO2knVwDeHdXyrJ2rTCXx3g2/qi99c6srxKGmJxRGajugG9hJWnQv8ks+rFKvsNmVVkcSPtCLNM5z1JqNBYxo5eNQsz6P0+1X40Hm2bhOsBoaqzHh+VRgQRclDDT8bOs3b8Bu9MT38sYFq3e3O8oc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(3023799007)(10067099003)(4143699003)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFVFWDFHTWcrZGJsV2t1T01NdWc3UTNERlFybml6RkhETWpuNVZ1Snd5Ykt2?=
 =?utf-8?B?R1lRbno2dnpSTkc3M2Y4QW9MS3FUSFFvTGNoai9Nd01kTlE5QndKaG56STF4?=
 =?utf-8?B?dW9vUUdRU1AxZjlmbEJoMzF4cWFxV2JvbHRLNDZwa2J6YU9mamVkS1hRZUlh?=
 =?utf-8?B?MnlaZFBHZDI0RGQyTjF2bFQ0Rm5XQ0JuR09iM09RWnNZYU54YitFWmQvdVN2?=
 =?utf-8?B?WEhac0UrbldZOUEzNVJ5aCtyekEybjQzd01zRVJXME5ybGFtckk2ZitHTFM0?=
 =?utf-8?B?WnhKbThoNklvTHhwcnlqMVZBOVR1YU4yQVJNM0pWeDdZRWdYVTN5b2hVSUxx?=
 =?utf-8?B?QkNYR0Uwc09XYlY1TnZDbVpieXF4WVRzU0g1SVpFQVg0NjhQZ2VjL1ZMTENH?=
 =?utf-8?B?ZmJBaGZkeW1GSjUvL2tNSlJlOHJHc1lXc1JobXFmSVk3VHBwRk1tNGlYRXNk?=
 =?utf-8?B?QXptM0I4d09JNENGVUZYczdMZ1JZWm0raUpuUmx5c3VORUNqRGRrUVNaUDZ2?=
 =?utf-8?B?UGk0VmVsclpIMDVGRVozR0JRa2VYWTJUV0syT3h2MWVXQStJcSt5MmNpVG5O?=
 =?utf-8?B?TjhjSG5lOUoxOXlCY1pjRW95L3NqTkxuekFsR2dKak05RG85bVlsSDNHYTBY?=
 =?utf-8?B?VFI2Q214cUpxWGJUZHhWaHFGS3ZQczFqTHI1N1RtNVh2cldKSE9tb3BBN0cx?=
 =?utf-8?B?MEM3K3FhbVUxcVpjTjZkaWdJejYrMUY3TkNjTXQwcFpzS2xoaXFNQU5sZ2hN?=
 =?utf-8?B?djZRV1pZbXpmaFRkRVM1M2cyaUt3eTVhdmEwTS9XTnlNaW5TRkFESVF3bkFw?=
 =?utf-8?B?NVdSYlJ0ZXZBelpqOGZVUGNDZEQxanUrTTA5Ny9oSmVEOU9kSnJVcWxNL0k5?=
 =?utf-8?B?a1hrREpuQWxmbnd0Vmt5ZzRRSVRQVCtXbGFxalcyWkV3K2RXRjJZNE04dkZt?=
 =?utf-8?B?NzJEWk9PL3I0TWNpVGtEenN1RStUUWc2OCtuSUJFQUpZR05TQzU5NlY0RVVn?=
 =?utf-8?B?aXJqd2R2SzVDNXU0Z0lCWFR0K1ZPazZOVGtSZHR0SWdYd1dWWXQxZENaQjU4?=
 =?utf-8?B?dEFVbVhkb2dXd3RsSFY0M0xsZ3VIZncxK0ZNaG56dkRYMkQ5dHk3RW5nZldu?=
 =?utf-8?B?NTZkRjZkZURwMWtpU2VaQUxRVWFDZWlRM1lGcm1XTjNWZjhMVTNNNFVNQU9R?=
 =?utf-8?B?Y1ZOUjcwdHRWbllPYzNtU0ZHUkFjYTlrdmw3cmVYSGcxelFzVzdxQnRSdkRr?=
 =?utf-8?B?VFN4Qmt4SjA5andaR3k2R004VmRqaUVlcDhyNjN5MzM2S3J1ZVZFd1JJMjc3?=
 =?utf-8?B?NWUrUWtpSTZuTFlQZ1VDby9YSGlQSEluS0R4cmZFY1dNUlVOWWhWUnZYd1N1?=
 =?utf-8?B?NWxub3kwWlZIcSsxQlM1MEdnUUdzZm1OYjZIa0libmJnWksvTVM3blJVQ3J2?=
 =?utf-8?B?aFB3YWx3aFJabVRCQ0NHWDdNZ3J3Z3Y0a1lKSGdoeTNJaHFWdDNld0R5S2NG?=
 =?utf-8?B?bkN2RVIvMU5yaW1NUXZqNEJOOGdWcXVOU0w4aU5jYjNHRlBlOU9EcStJcjY2?=
 =?utf-8?B?ODladTRXMXNlbU01TC84VDBMV0haeElIcS9BZlRHYU5mNm55V3AzR0ZtQ2ts?=
 =?utf-8?B?N1BXSE01Tkh3M1RBRzJmRE1YWnFVVHpqTGtzU2FYZnFsUmtqeEZEV2FINS8v?=
 =?utf-8?B?QURxRkdTYkYyMDFzV0FDcHJ6TEQ3SnJlaHl5d1ZaaUFtakwyQnRDakdNSDRI?=
 =?utf-8?B?WmlqS2UyV0ZqOFVaM1VUYml0M1FkMWJkN296b21nb3NkcTZTaURqRkgyRTZZ?=
 =?utf-8?B?STU5blB2ZTY1UXpkU3BsV09hUGlBbGZZQnBwMlIyWEhMSWZ3a05MVlp1aVNz?=
 =?utf-8?B?dWQzbWltY1REQWVOMUswQVY0WnYrOU1JQVVpcmdpdFdwWGpoM3dGaDlDOFJ0?=
 =?utf-8?B?UEtqWHVVd3h1Z3J0dnZVRjg0Z3QxVGNKaU9GU2ZoTWJVbU0yeWVPU3VCbFhU?=
 =?utf-8?B?T0dHTzc4QXVNZlFCWGJFOENwNlZXUVlLeGw5QlJiRnRQd0phSEtYaU1LaHNv?=
 =?utf-8?B?MkYyekdVRk9lWmp4MFZIakZMczdXdXpVbmJsQ1ZLRVRXTEZHSmtYZjVxMGVm?=
 =?utf-8?B?WGhQcDRwWTRXK3VnZzkydUdySVlFV0hrOHEvdm5ud0FZbWd3VzBPMC9mOEFt?=
 =?utf-8?B?WVBmbnVzZzdFMVdPVHJRN0FJckg5Q1NVYnBsblNPejFsVzVBdTNWYk9RamJY?=
 =?utf-8?B?dVBvYURFUmN2UUEyRHhieWJPdm5PRTBIdVJFcTIvK01VNUk0U1hLaU5tOE9x?=
 =?utf-8?B?N2IweUpiZTh5eU5ZNzlyRlBGZ3gvYVJwNUlUMVNrQUJ5RHEyNjA2QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b9a6e55-0db0-4329-bc75-08df08df2154
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 10:44:14.1354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zfEv9tIAd4mt9Sarpoq829wwb6ZUgJOldgXBK0tppBuOUv5SOYFEbMgIYvnEs+dn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9677



On 9/1/26 20:33, Thomas Weißschuh wrote:
> On 2026-09-01 15:33:11+0200, Michal Simek wrote:
>> On 8/31/26 17:43, Thomas Weißschuh wrote:
>>> On 2026-08-31 12:48:08+0200, Michal Simek wrote:
> 
> (...)
> 
>>>> If there is an issue with memmove implementation I can't see any issue to
>>>> disable that options to let it pass from the beginning and solve it
>>>> separately.
>>>
>>> Ack. Could you take care of this? I have next to no idea about microblaze.
>>
>> On little endian this is passing. I can add it to my todo list but big
>> endian is very very old and likely none is using it anymore.
> 
> If it is not supposed to work maybe mark it as BROKEN or disable the
> custom memmove() implementation there and instead rely on the generic
> one from lib/string.c?

This should be enough. Do you want to send a patch for it?

diff --git a/arch/microblaze/Kconfig.platform b/arch/microblaze/Kconfig.platform
index 9cf9007ed69a..2d7c21767215 100644
--- a/arch/microblaze/Kconfig.platform
+++ b/arch/microblaze/Kconfig.platform
@@ -10,6 +10,7 @@ menu "Platform options"
  config OPT_LIB_FUNCTION
         bool "Optimized lib function"
         default y
+       depends on CPU_BIG_ENDIAN
         help
           Turns on optimized library functions (memcpy and memmove).
           They are optimized by using word alignment. This will work
@@ -21,7 +22,6 @@ config OPT_LIB_FUNCTION
  config OPT_LIB_ASM
         bool "Optimized lib function ASM"
         depends on OPT_LIB_FUNCTION && (XILINX_MICROBLAZE0_USE_BARREL = 1)
-       depends on CPU_BIG_ENDIAN
         default n
         help
           Turns on optimized library functions (memcpy and memmove).


>>>
>>>> This should be fragment for Little endian.
>>>
>>> Thanks, unfortunately this hangs for me with my distros QEMU 11.1.0.
>>> No output, 100% CPU usage during boot. I am using qemu-system-microblaze
>>> instead of qemu-system-microblazel, as the latter is not available
>>> anymore, but the former is documented to also handle little endian
>>> automatically.
>>>
>>
>> I built the latest qemu like this
>>
>> ../qemu/configure --target-list=microblaze-softmmu,microblaze-linux-user,microblazeel-linux-user
>> --enable-gcrypt --disable-docs
>>
>> /mnt/projects/xilinx-new-git/qemu.org/build-microblaze/qemu-system-microblaze
>> --version
>> QEMU emulator version 11.1.50 (v11.1.0-779-gd2e570cc0f97)
> 
> For me it still doesn't work. I am using the same build of QEMU and GCC
> 13.4.0 (or 16.2.0) from crosstools.kernel.org.

I am not a toolchain expert. I do use toolchains from Xilinx design tools and I 
have also tried toolchains from buildroot.

Linux version 7.3.0-rc1-00017-g139833dc9bf4 (monstr@monstr-desktop3) 
(microblazeel-buildroot-linux-uclibc-gcc.br_real (Buildroot 
2026.08-rc3-13-geaf7a45ddfdc) 15.3.0, GNU ld (GNU Binutils) 2.45.1) #1 Wed Sep 
2 12:39:02 CEST 2026

But keep in mind that there is a need to have v15.3.0 or 16.2.0 toolchain fixed 
by this
https://lore.kernel.org/all/20260902040121.1583600-1-neal.frager@amd.com/

Thanks,
Michal

