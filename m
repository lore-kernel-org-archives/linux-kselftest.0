Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3138E3F39FB
	for <linux-kselftest@vger.kernel.org>; Tue,  4 Aug 2026 17:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785864852; cv=none; b=ZAC1OmZoqDoUbTiYL5xYYKugokpC4hhjW1Zt+IPmu/S5O2ZPnflNufqLfB9keN1AHsTaurmE/yhgXoyS4/TKnCTott32oTwFek0W73JIoqzgqcrQZybI1MTj2v0NKs8jH5igYWTgpc3Ms/smrZDQdTCjeF7YbcUpcjJIfz2CQkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785864852; c=relaxed/simple;
	bh=iAX2mZPsJFIlY7/TcdBe53KvOmZofj+ZPCzSXkrrIgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L32ApTjrNqFsMcgBFmxGg7JYxXCDtm90ddqENAzFNVJlVCIZDlEhMRcp0zin4Mdk1d2l+2gTrbw6L/l9zT94PJjozs07Q3OuWoxBRks230UPnqiAHth12805PGIXB++913UbdXxViajgzrAlrabshOQIGN3ak7iU0yax2cXlAN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rTGhvLh8; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rTGhvLh8"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38511175ad3so54601a91.2
        for <linux-kselftest@vger.kernel.org>; Tue, 04 Aug 2026 10:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785864847; x=1786469647; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mJZVCPW6aaT95lIDoaRsFoVQmof2m7B0Dm3vD+5MmzM=;
        b=rTGhvLh88TLq/VN8G65RTIgtM2zoQldCXrSE+DkV0738yVivDGs4tF7htoXUgucW5o
         UY2D010cRFMVIEzpYMCuZxtHWJ5nbdkoM5Io4a62gkGlq+Ov6+pz1eqquk81YuutFUAC
         hUq4pr+dY0GedaZJQthy78EB/UkShVtuxQn2VrE5ZUAWiaDkJTXcD0EsjnnEySblMTIN
         y70W8SZmwbmemzIOaVVn5ELWr5kau/PFIFVyHJUegg33CMvm2HMMdGZol4q9iHvkUaAg
         YnLeyfOJo+fbumC+IrJxHCTlfQqO15oieAR5mnjgIPIda+VAjqC2KYRFic76YzuCbiG/
         /CLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785864847; x=1786469647;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mJZVCPW6aaT95lIDoaRsFoVQmof2m7B0Dm3vD+5MmzM=;
        b=mCcwsM0XYf0qgu4H4adUFkDlK1sBu6960/1I/DzkK5ORavgKyIr/D+o50x4svhLYro
         sn1daErMprX0Yuf5WdNlK1PuCJLU3D6UHVsFUou9cL0DJ3++ArQXlr+kn/MwuIodP3zz
         D05xNxeMGpV8HHdTG6RqcuMX5anZD3yh19lFJ3XBOHH/96jrwia0mTvJsq4t+5eRZb9R
         pKvbbsLIM7robTtg89NrLIbTNZ6MniFZ5iv6xK9+Qsvjgci1vHjNntQwtugMjymDi+z7
         RMak7qcEUH+60r84pDNEf4AC6TmQdC6/CBUz/SOmkv/mUOcJKoVdzbWATGbWCZBtgq7p
         RpEw==
X-Forwarded-Encrypted: i=1; AHgh+RoebNgvxNLRY1hwowoStA31Ci3oC+IYKVHQB4KwOpppRQZaJk+9KHlIXlraDTHCvT5b67KgrQR1VdxND7rM46M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7C95hOMPf/tap+4UdQM5fYSKgOaMAiFW8c02DWq9l2F5YB39c
	LAwZXgxynVjZJKemCkEiRVAk2Ef6h+3qdWLJOYR9sbpHGPZnlIkn5/TE
X-Gm-Gg: AR+sD10lWDbky69R52/k3jvA3IQAp5ZTNwhxNOAns82X2s8D1+SrKPAqEd3l0ti67Id
	9AAr1QdgJl70s2DcxRnlvDoM9wNoGCom+R4U71Qx5XzjOXtXbKLkY9ebwyOiB45QM76TiOw0oKf
	JpIsE04EfEChAodhb0xsPPl7vAO1C3QowxUbsACbN9smb0K2bUrlzgcejkIY5SscT9lUlj76bHw
	GrVb/HHWJh6GnUzUS5pTSuzBM6wkm7o4xloOW04HSB5SwRfSaaJr4TBC0KqtJTvHTSTVG9dtjhf
	CH5LGnh7ALtmf0RD8QnnflKIrlBkhK6bzA97NZ8dju2YesOZw8uml9ZDuUoK1dWcAdRIjQ6lhNm
	fC7upzAVL95uOZuZqJNkiCiAnSTrPJykZE+p3ULls1J98jm/M48v0gCVNNfhY+/Adxuf9piSXDQ
	4njV0YG+h2qCEqakHaXP7nDJllI7ngKheu6RsEYJ8kekSNKwgM2si4U1xNwKy2cBtmbT9NPXebN
	Uv7pFa1YbtdZW3A3HWtB/LGKGcS9IfUxjat/OjlPBc=
X-Received: by 2002:a17:90b:2f03:b0:382:1aaf:4bab with SMTP id 98e67ed59e1d1-3903c6cc30fmr526351a91.27.1785864847541;
        Tue, 04 Aug 2026 10:34:07 -0700 (PDT)
Received: from ?IPV6:2600:4040:9399:4000:e553:72e5:7d37:c7ef? ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3903927c711sm255036a91.11.2026.08.04.10.34.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 10:34:06 -0700 (PDT)
Message-ID: <0b3278c9-550e-4b72-8469-00c86180c2ea@gmail.com>
Date: Tue, 4 Aug 2026 13:34:03 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next V2 08/13] net/mlx5e: psp: Handle HW-decapsulated
 RX PSP packets
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
 <20260804083535.2946459-9-tariqt@nvidia.com>
Content-Language: en-US
From: Daniel Zahka <daniel.zahka@gmail.com>
In-Reply-To: <20260804083535.2946459-9-tariqt@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/4/26 4:35 AM, Tariq Toukan wrote:
>   #define MLX5E_ACCEL_FLOW_TAG_PROTO_MASK		GENMASK(23, 21)
> @@ -25,6 +27,10 @@
>   #define MLX5E_ACCEL_FLOW_TAG_PROTO_IPSEC	(1 << 21)
>   #define MLX5E_ACCEL_FLOW_TAG_PROTO_MACSEC	(2 << 21)
>   #define MLX5E_ACCEL_FLOW_TAG_PROTO_PSP		(3 << 21)
> +#define MLX5E_ACCEL_FLOW_TAG_PROTO_PSP_DECAP	(4 << 21)
> +
> +#define MLX5E_ACCEL_FLOW_TAG_PSP_VER_SHIFT	17
> +#define MLX5E_ACCEL_FLOW_TAG_PSP_VER_MASK	(0xF << MLX5E_ACCEL_FLOW_TAG_PSP_VER_SHIFT)

[...]

> +static inline u8 mlx5e_psp_get_version(struct mlx5_cqe64 *cqe)
> +{
> +	return (mlx5e_accel_flow_tag(cqe) & MLX5E_ACCEL_FLOW_TAG_PSP_VER_MASK) >>
> +		MLX5E_ACCEL_FLOW_TAG_PSP_VER_SHIFT;
> +}
maybe GENMASK()/FIELD_GET() would help deal with this bitfield?
