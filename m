Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022135.outbound.protection.outlook.com [52.101.101.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F0E31195D;
	Wed, 25 Feb 2026 21:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772053459; cv=fail; b=MaMh3buVwN4skpbRVIjaDStOwP55C21Na+JtPgynjAnD7vo8dhXA5jLlxIWjXtkQBI5epAFM6fW07ktmEfxUteDfG5ERBkrMhhSfGOTAnWm++dzze0QnHz4A+FXAuaovimCxMGGQpUfmd4D/VggTBYVf4RWNgGSjkMo3d5vhWhI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772053459; c=relaxed/simple;
	bh=4ThcxnMsgvu45sWNw+HFI40OxBjg2dl7bYL0j0Rsb7I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:MIME-Version; b=tQr8T1TGx/BrnKXXvr1jS+GMZltvfMPFQGDGiRT+qLFMDG/4kC/PDMXw0H6LRWwOtVLQYauu85IhP/eRQIKapVmlLr+tzGN3wDD3TWD3fHIXBJ5y/e7+XOcRVddvZsQsf/O2LhvAK7gTGd+ihBNYjeagHt0b9v/L00UYXkRP+5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ruqkYkLM; arc=fail smtp.client-ip=52.101.101.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ruqkYkLM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OcGq/L3ijxonFCHPRq9zNZCvmeRcYfzrBl/KxSfT11cDBWIN+0ldEoWTEY9a/Rqd/UvNhuOEF5yj5Nvltqxi4NHUIzzEsOzdKJKPz62DuH4acCIMj4z3EmqQahRhGsS5qplwF7XZPw/naeMzz3TbnLunY+GhO+MKPNNw/yaZl11Qi0fTa8OVsGqWNm0JBSH/EuLVxl3ZuAbkabRZV2IhhgwOqPejBuw3UjZV6XkMjNW756n9fpb6hfwGxhFHOWp7y2+fkm/afYwgGUtfrgKEQrWul+HFfwep98G96m1o3Oi/wc82yqvYcOFhyJvMCoPeKZXQgP7d+r0Cej7q/fXNIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NN3gy4ew8r9WiXyIu6C1jwfemrXUApfaPsx+241nLcI=;
 b=BD4KIDx4Pt7bsOiZxuPGoD1z6HDapOoTx8pOS7KP7aDQrtNZfA/1UfcslzRKVq73KHiqC18NY04hanPZ4h4oP6T1vJ0bxcFSC1ihoBngb5Y5LxCL4mEQl4qFN86YIUSlRnoI+F0rwQRn8OG5PUZESVSOANDF5kHk4yuq8Ww3nycbBT0bxjPSzpj0MGiFJoP12t3tC2cOvdy1K634fywWcUIaMJsVHJvHhzwwDG07ke+XvFRVfyLmW3Twuq6HciNI8aZPN1Y3NSMOXRBLkmnkcT+NN/2h2ZyTDVQF+5QmC/BaQEHkA5nzTIJKk+hw4lxZBef27J41Qilx5pkapcSKGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NN3gy4ew8r9WiXyIu6C1jwfemrXUApfaPsx+241nLcI=;
 b=ruqkYkLMVo+BHnAKkbkFnNwBAlJcELQdaNPoYg+K4X834OEs6PvfQvDAGzfWtvT0L95k00JFi7UBaue2DOQOez5j+gHTKjAMz712IlOlqceJAK0Y7nOIuCM9c4MVxGhFXip2iLrWpboLLB/tVmKwQz6XtvvzLUKN0wTRSdmuPcU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO4P265MB7063.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:34f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 21:04:13 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.20.9654.013; Wed, 25 Feb 2026
 21:04:12 +0000
Date: Wed, 25 Feb 2026 21:04:05 +0000
From: Gary Guo <gary@garyguo.net>
To: Elsanti <santiagojoseleal27@gmail.com>
Cc: brendan.higgins@linux.dev, davidgow@google.com, ojeda@kernel.org,
 raemoar63@gmail.com, boqun@kernel.org, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: kunit: avoid retain_mut for test attr filtering
In-Reply-To: <20260225202728.2160793-1-santiagojoseleal27@gmail.com>
References: <20260225202728.2160793-1-santiagojoseleal27@gmail.com>
Message-ID: <13a713a8260f566386c724c49ecf8a34@garyguo.net>
X-Sender: gary@garyguo.net
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0290.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::17) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LO4P265MB7063:EE_
X-MS-Office365-Filtering-Correlation-Id: 094c295e-0b14-417b-bba1-08de74b169ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	YaKVh4hgzJLVnZVwdVOgrjEcYw7W7IhEj5jBRnasIDmiArmKR0qS0uGLy7bIUT9juwEOu2yf+W3rF0GnYtucBK68jvheaUeSbtc3NLbUaNNijWY9DaU9+f0mJMugE7I5yIuktTKiyfyXxjeJHSzb8/+K38OzpTXwX2OmOz+HfhAhIBMpKl4jtr7PFksDjZScor2fp61rIsbWYUkXeIjv/dUyU73LAt7Cpl73EPshDcPYn4lrUKkyGpnQ+B/9MlNC+i95tXQH6GfG51zZbvjlJlNlvMXdWu1ouX4zCvGDxusIne0mc5MV1C4Bj9eKmFJScAvX7A6F1wrBwgB65BEFLjllSE9wLpleueFWFelLJe8Y1cQAS/2rAk4LKAMZTWviIWcC3bCg6XIAUN9mXu6YQ0Jrj2zIQx4jUiXT36KRD6qmY3Y00z3LpB/QHTynn0s3I9jL3Yt3ZVJlYVOBW/vutM4Rlf45bmV/MYqCSjqd2QSb0sXSGx700zN0bXAgGmc1SHTJdyJBX2pdu0fKYyD7sfqWz3csdSrghPXFr/DLiI+n8Y4y/S1Wx/u3nZva6sMUxSD/zvOgQ7GTJIsh0DH7OPzwvGo0+dicBoU0MXD6ec0pwDxmKYmidiZmziJxo3npuocu5zU31gN6DWd06+t7O8YZHS1ASPEN1pc6k0y/Qh/pct1OLK+YvV9hCHrJexXPvRwS8WQIcryGlqUgbSX/TmVHqHTw6rh1WYESqVDavjQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EsiXw8JgToOm0MDQX1MRlca2+9cQTe+xfVPO2Nba6+Sh76l87cT/OmECbhg+?=
 =?us-ascii?Q?u+jYjl6hY5y+xdlgvpEItAPBoaN2p2Fil2lD8mpVy50DjENKFU9+HmgDBbkg?=
 =?us-ascii?Q?U6Xjp4IkypO08ORVj7IH4VyuEy/L+dmv4BhkUcQIzC27P2wgLnKWeT7lk+2W?=
 =?us-ascii?Q?jjJiX3+zciN9ka9EnElq75paHUNNLBTsXwlcBNWEEVrO4GQ+dxMtoMU3XZFl?=
 =?us-ascii?Q?IYmd6KF9TDDaqZhoGicRoQLkXKCLAyOc4VD4uMgopbDtNJ2YqXWW9yl3MOk1?=
 =?us-ascii?Q?f2LDvE74mvMEOeHWfStEH/3wJ4uLsh/QxCyQXqc7dcBM0iehNfG2Dx6KJ31J?=
 =?us-ascii?Q?1MSgYiZosNYH95m9xgWLFRV2IlNk/LiaKUCkJcEFOgpgaXrI8w6N72BncYnx?=
 =?us-ascii?Q?V9wECGxKYrXWfJEq4Uy2byysyDTnudoZja7TZ5dFtr5xVZ1qSLZpxYDMgcCK?=
 =?us-ascii?Q?pWncUQPyvmQ72K3qBW4izLIpaBBMKi37wOXGjE8K/g9P4Hvjt0kCvfbNJ8XB?=
 =?us-ascii?Q?O1zYChcQx4KN/suIsxlwgYjNiYhmtuWxMz0XMTB4eTN35PVftWMpdo46nAhX?=
 =?us-ascii?Q?znEuQnDjUNbchHVt4uaHFUageUHB4JAPgW9MlekutlEU7QN/8v+YdSuezGId?=
 =?us-ascii?Q?3mvdOnTLRTeAl32/6SCWMKg3RggqUinXhb+HWEOYCfGo14zMnJXB4QwFC93y?=
 =?us-ascii?Q?1Cyxx3LGi5I04Xi6DUnRpVYMrZCneQzSMVbN1sqW0zbkrPimTWUk9JRRhcJ3?=
 =?us-ascii?Q?kumyclp4Gz+eedwZ2Wrne1zBilcQXELMkN3ToL4jjd5qTYIt48fIRWjUBhjb?=
 =?us-ascii?Q?nDYcEevmo4fugfaqCGJ1lchP/YveepzmLyRoQwIzvfOSAXt/XWn7VfDyK9ci?=
 =?us-ascii?Q?tZTLY6f6jxdsFc7cufdA7p7NoCiUEgMHmFjLmRbVqhzAcyWX8M7FDEBL+PxZ?=
 =?us-ascii?Q?JMO0bUTlnJE3YLE4yuqbEcfEVabuYZckVRMKlpSui5jqLq/Pqwjc3BjNvI2v?=
 =?us-ascii?Q?k6R7UksQJQRTJgg6ESoazJPxV7L4hwSOgCVzu5Dj2IkcGhq4IFtIr+htPQLS?=
 =?us-ascii?Q?xuhuKQFjmQtNn7Pp7Fw82QV1SjkMNCMVUxbY43+zIc4ymjlOgNNiLoWL5/j8?=
 =?us-ascii?Q?mj401XSdz2bJy9lHGb/5EhpjMB6WpFHrcyb12k7BsXkdw+TO2B5nQWrzTGfF?=
 =?us-ascii?Q?iWrmXPGZoa0sspbGjs2gS3yXVcbB8aTAKnyAJLt7bW6HQcGMu2EPFr1VGMIb?=
 =?us-ascii?Q?9fOqnzqEWSHy++V7N++ILPaH7sIHZPaYugbI93Gf7YnqvqjFIggROnUfkli3?=
 =?us-ascii?Q?8+NrqxQegoGitFUuFWvl8Xtco3qJpGdfivHJCblbuvsSMCqQZQBPkBfaCB9q?=
 =?us-ascii?Q?BT+hOA6CAwuS/3RY5JLcwxAOqIpFToGmLl9uQmVPtiRqZzm2hpRaOSVRsvZ1?=
 =?us-ascii?Q?XISMZMQS1btk2xx/EsIMyKPcUvTGBxTFsAgm2/AxjDebzUQHuYz6i7vYde0q?=
 =?us-ascii?Q?llMe0GEYGEpq3DcQgsXwzL5XVLDLMa73d7Ie8cmPZn3hvKAhDAXsgADQjgj+?=
 =?us-ascii?Q?rV/zSqoRZVeyhYYZ2xjwRcGQoIxgtjuSv8Df41++cShhOonE+GpTI8IP6yvg?=
 =?us-ascii?Q?I9qvGh5gxPYb1hf+8PB5x+I/FKSXsx2DL+mAk2CyTFVzyFabaFX+d6Fc2/nc?=
 =?us-ascii?Q?Qw+Xom1k6hfgSy/tSbIUpZ66g0RHAXnha8xz1ewWTj1Yd6GoXEhSpXXVa8lE?=
 =?us-ascii?Q?cWhWPc5YBQ=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 094c295e-0b14-417b-bba1-08de74b169ae
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 21:04:12.5668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nMSjAQ+uLZSc0vX9EG38pwjGObA71BxzoU3sCSSvGPMylKxq9C/mXoMMM8pjIXFuEvEoloOsPTa47TTEPDjp3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB7063

On 2026-02-25 20:27, Elsanti wrote:
> Remove the unnecessary mutable borrow when stripping #[test] attributes:
> retain() is sufficient to drop test markers while tracking their presence.
> This keeps the logic compatible with the current MSRV and avoids extra
> mutability.
> 
> Signed-off-by: Elsanti <santiagojoseleal27@gmail.com>

New versions should be sent if you want to amend your patch, not a new commit
on top of it.

Best,
Gary

> ---
>  rust/macros/kunit.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/rust/macros/kunit.rs b/rust/macros/kunit.rs
> index e064419bfc10..083b8fe39e6c 100644
> --- a/rust/macros/kunit.rs
> +++ b/rust/macros/kunit.rs
> @@ -88,7 +88,7 @@ pub(crate) fn kunit_tests(test_suite: Ident, mut module: ItemMod) -> Result<Toke
>          };
>  
>          let mut had_test_attr = false;
> -        f.attrs.retain_mut(|attr| {
> +        f.attrs.retain(|attr| {
>              let is_test = attr.path().is_ident("test");
>              if is_test {
>                  had_test_attr = true;
