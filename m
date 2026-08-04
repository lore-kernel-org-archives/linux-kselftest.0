Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E6646D09C
	for <linux-kselftest@vger.kernel.org>; Tue,  4 Aug 2026 18:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785866762; cv=none; b=t6/e/PlNsLXiDMCDSjW2kwjAxJObklCrKkbqaVxw1ip6Hn3wARY7zo5JI6cSbmOBJssQGaITziaQ98vsPGbJkKC8JAb4wQX3Mkx4NCcLOplYeita8O5hwqMIO2F7gkwH0eq1ti81UF1pRHCyYQVWoI7M+z3SEEMjgCwugjuKtAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785866762; c=relaxed/simple;
	bh=mukZbijvR09Qyb8O6a5zSs66Nc1Ea8eJ76KYS4fy0x0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y8HDwk1BIEed3MX2FrJVtXlbfZiPnsOBdtvOy0vTjy/Ko+CX9FmKp2cKQZUh84DgNSsxGSJh5uWEPql4QuqI1FY8NvuOnuCOsW3WkhQ4V+/JoRKoTSZyof7PRFaP/czuCxmeaNqeBGoRXx9UDj3VcXKDJMc09OxNNyvjN9qpbCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T/XJod1g; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T/XJod1g"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-92e7632b193so10466685a.2
        for <linux-kselftest@vger.kernel.org>; Tue, 04 Aug 2026 11:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785866760; x=1786471560; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PvFOPFIKv7IZLYV82VSUnHCVCbk2jO9N6jmpfHOfts8=;
        b=T/XJod1gvh20p2DW/AdAWJ74EQT6tre1gp5whPlqrYD3PiIEjglyZGXneLDTjxaYuh
         kfyggTEifzO1Epx13eyNGjHVTWHDsKXWH7X9Y+bE4JG1zVMdZF8EVdvRuvTtLKvJr/lH
         vHnivznxdcM2TXrBNQelgkRj6iZv+L/BfB7E+UKM+PUMTCoD/TufPWpJcgiqmfMKmx1G
         8e0ifEX+lXUADOzM/zVGLipW0fDsyVn6tBoIW6LSJ/DOtun8ixat62anId6TbOJgiOcb
         Wjbp+/SJtDyBdSa6rc2sdF6mJczvVYUkvL7CDlABZczuhp2VQ/yI1YNlDT/+i6Y1gt72
         EUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785866760; x=1786471560;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PvFOPFIKv7IZLYV82VSUnHCVCbk2jO9N6jmpfHOfts8=;
        b=JgNGCZXTpsn7MNZxx9jNt0sEM2Wq8/SkgghO2oTBVZOLM9H7F0C/SIm+W7+rJFfN5L
         h3EE+pmfvaZsNR5hAiwL1PEuVHycQdN2vjhTR7pSuPZRIIsn8o69JfnrFdEE4aW14sTz
         6LLsiGyH1uXAeIwZ16OxD7dMudGI/jjJ/jM0S7lVCCsPKDvSZvy+TJNUL4WbeiKOIER1
         b74FZOARJ5s8Ukn9iaYgNfS0QyIuFTvfOcADH8rFHRcJvwMbxUgFM4UPhaaj7i92aqc5
         MXTrhLHstTHQPUzxPQ2DByxsKK6jhw0tySfjM2iPgLf3jtWPYmSmojb1ea3NgyPc81ka
         HPSg==
X-Forwarded-Encrypted: i=1; AHgh+RrwQGZS3EZg5Aorw4gJ/TAb2a7BA+ui4pCylwFk0VystdH7drPPmIDzfjlvdhfCQt7pgybpuvVFN3ckoqkeqOQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdFpVm+mzpbmn8SMVCzbDUj4Ld1x6Zrwemow4YONwpqZrgCSUt
	A+1qx995MyXfjTl2F8R5Gl8iglY7CZ9PaYs8Ag4REkCAUJGW160iKd3n
X-Gm-Gg: AR+sD11upxBNYGHKoA828Je5yFadTYswsQpJw8q1bxqBfVFXtsWph87EclLQsArdLFi
	mLzHji3agEy9KuMhsLIDn1zhgmBhc+7bQXjQ8UIrhrRIw65vxg58KbxqNCJlRKjETvxtbknMkPS
	p7zzmBOoHY5JC43Zobg+7o6Sa9fV6otW2iZLXe/+YHawahZJGPOOewLiZgp0bN82wnhDz4zTrd4
	D5PftV+1irX7nbTb+xRcVJ+Ad/+INK2riGnDj4U2f2gm0ce3bYajNzUPpTdeAQ+e3VCDPPCc2kh
	6AldQxcu9+sE6Y8TKhv5sHRky/y77UPsJdb622JU+EOHy0v8Srl/JPbrZ0l9ceKzAhsaUt7b/Kx
	nwHO91hdwxsvAm4a65fg7Z/qJ6Wdcox07N6zEdsb6k+ZcLtX/mzn2RwbruMjzTnp1662/UyJ8se
	z4JtE3W3LRrDQRzY5QvWaVq0xNEUYzOTK0jOC1Ji2RChQd5nxyRj5asSv1nvz4kQPDnYsZcy3Li
	00cwS2gfSKpaUH79GclJnfq6KkaOuC2Gt7U3uYSio0=
X-Received: by 2002:a05:620a:40c2:b0:934:aa05:f549 with SMTP id af79cd13be357-936491d3c8fmr16849585a.25.1785866759759;
        Tue, 04 Aug 2026 11:05:59 -0700 (PDT)
Received: from ?IPV6:2600:4040:9399:4000:e553:72e5:7d37:c7ef? ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93641592964sm148846885a.0.2026.08.04.11.05.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 11:05:59 -0700 (PDT)
Message-ID: <9460e089-ed71-4f3c-986c-5d29b87b3500@gmail.com>
Date: Tue, 4 Aug 2026 14:05:58 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next V2 13/13] selftests: drv-net: psp: Add a test for
 PSP with HW-GRO
To: Tariq Toukan <tariqt@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Sabrina Dubroca <sd@queasysnail.net>
Cc: Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 Alexei Lazar <alazar@nvidia.com>, Boris Pismenny <borisp@nvidia.com>,
 Carolina Jubran <cjubran@nvidia.com>, Chris Mi <cmi@nvidia.com>,
 Cosmin Ratiu <cratiu@nvidia.com>, Doruk Tan Ozturk <doruk@0sec.ai>,
 Dragos Tatulea <dtatulea@nvidia.com>, Gal Pressman <gal@nvidia.com>,
 Jacob Keller <Jacob.e.keller@intel.com>, Jianbo Liu <jianbol@nvidia.com>,
 Kees Cook <kees@kernel.org>, Lama Kayal <lkayal@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-rdma@vger.kernel.org,
 Mark Bloch <mbloch@nvidia.com>, Patrisious Haddad <phaddad@nvidia.com>,
 Raed Salem <raeds@nvidia.com>, Rahul Rameshbabu <rrameshbabu@nvidia.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Shuah Khan <shuah@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Simon Horman <horms@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>,
 Stanislav Fomichev <sdf.kernel@gmail.com>
References: <20260804083535.2946459-1-tariqt@nvidia.com>
 <20260804083535.2946459-14-tariqt@nvidia.com>
Content-Language: en-US
From: Daniel Zahka <daniel.zahka@gmail.com>
In-Reply-To: <20260804083535.2946459-14-tariqt@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/4/26 4:35 AM, Tariq Toukan wrote:
> From: Cosmin Ratiu <cratiu@nvidia.com>
> 
> Add a test case which attempts to send several 64K chunks over PSP,
> which is more than MTU, and thus trigger GSO on the TX side and HW GRO
> on the RX side. Verify HW GRO counters increase.
> 
> This required the addition of a new command in the psp responder, so it
> sends the data in order to get it reassembled on the local (DUT) side.
> 
> Signed-off-by: Cosmin Ratiu <cratiu@nvidia.com>
> Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
> Signed-off-by: Tariq Toukan <tariqt@nvidia.com>
> ---
>   tools/testing/selftests/drivers/net/psp.py    | 131 ++++++++++++++++--
>   .../selftests/drivers/net/psp_responder.c     |  49 +++++++
>   2 files changed, 171 insertions(+), 9 deletions(-)
> 
> diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/selftests/drivers/net/psp.py
> index 315648a770d0..9b899723a635 100755
> --- a/tools/testing/selftests/drivers/net/psp.py
> +++ b/tools/testing/selftests/drivers/net/psp.py
> @@ -16,11 +16,12 @@ from lib.py import ksft_run, ksft_exit, ksft_pr
>   from lib.py import ksft_true, ksft_eq, ksft_ne, ksft_gt, ksft_raises
>   from lib.py import ksft_not_none
>   from lib.py import ksft_variants, KsftNamedVariant
> -from lib.py import KsftSkipEx, KsftFailEx
> +from lib.py import KsftSkipEx, KsftFailEx, KsftXfailEx
>   from lib.py import NetDrvEpEnv, NetDrvContEnv
> -from lib.py import Netlink, NlError, PSPFamily, RtnlFamily
> +from lib.py import Netlink, NlError, NetdevFamily, PSPFamily, RtnlFamily
>   from lib.py import NetNSEnter
>   from lib.py import bkg, rand_port, wait_port_listen
> +from lib.py import bkg, ethtool, rand_port, wait_port_listen, CmdExitFailure

nit: agent has pointed out that this new line is reimporting bkg, 
rand_port, and wait_port_listen from the line above it.
