Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1A24D9579
	for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 13:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790773413; cv=none; b=T0oESA4N+kYasCUBeucXGfRenhpbpkvG1N+n4oLsYfyAkLquNXEN9eIZ84i9aBmkTeGNNW4KGpkllobLjhWl48mZ4koGHE1ztGKUfHqqTpO4s9O4JWsslt3ZuJQvPbOEWuOIs9jLhzazxRiyOp9sV822M8D+AHGixCE/mRIthfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790773413; c=relaxed/simple;
	bh=H+DcAKtcxqYbxHPTih+Vv3PnTOLzwij99V2TWd7P1DE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eftqKW7EjEgamTNCiGgKIWifcgDixBFvC5Vb7zrAlCjnFXcjOosXqN0Lf3NxgY9qwQfZahbIU3lAHj80im1ixGrs8PJL+uw0Y+a4HLbteW4IlW85/oiGnHB2WhGEQX8p1eTGb/r+pW5/IvmACx9br0VaCM6Z1y5tk0MlqkmOOHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=MNV4Xz6E; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="MNV4Xz6E"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843178b1c8so568969f8f.0
        for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 06:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1790773402; x=1791378202; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=babN9DRBy5azMYxvib8SKBkZUslU6O5ONocKKc4sKc0=;
        b=MNV4Xz6EaMuv65MQ7JfswBlkewKV/SH3bn7+57KAcGCM4b6ycvIVU3dQ/HbSYg0xeY
         svh1pB1BuZblJ5zblhb7YmW4MrZXqCQhnaoQb+Xr8Qhsb+dmD4lFFiL2szvYtDsFdfPr
         AsIEXGsvT/gRVMP+tVUCVepsk7//eQq253ZoGEUiY4AgUB0W7cHKr932Td+8JKm9fTAa
         1Kgg4HxXiJX60ZLZ44b2/i14X4d6A8M7AUdJZcb1Xbhr+echJSg4HrU6ZCDJOEYKzZ1Z
         9dEoJfC12dbGBEp/m+GJnEGh6o0vJm5uIkp64KH4+pEC94moRP6ttlfwX0Bqv/P7LTYe
         VQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790773402; x=1791378202;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=babN9DRBy5azMYxvib8SKBkZUslU6O5ONocKKc4sKc0=;
        b=YW/ZV4n/va0Q5vx0qinot5BSAlb4HaFyXFYbvQC11UjcINa9VYg2TzNmUtfmAR2JSe
         R3DK5289hM12Wnlzk3Yza/0JerlFKkc/K0Uc0Z3x//s1J7Q1liemxgS7XK72/zgWqVNt
         0bs2sP71nI5buPcl4YAfEl3ZiawCk5TksoEDu32WpkUUD7Kcswj4T7VMQHnxfzrVZ0K2
         KnKwRajo77f46SmuEBwpYHCBC0ZvDIjT46lzFPk6HrUvi71MAJTD2UUjqjA97Tm0qAo+
         XXUGu+3WXGB+cAbeojd27QqOQxlRncoiv88iq/EtMVXedYu4uL1T8XEo4a852lkYtdgy
         qpZw==
X-Forwarded-Encrypted: i=1; AKwUvBwBJiyWzb4H881RbA1ei2UsSczs7BvfUPTSr+n5h8WsRzhp1gXH+Yu+khz2bQWoh4xLf+d692wN6vWui/rOKrA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKie8RdFtrr/7ND4L7DpJC7PtO0UoHI/RwZuC6zr4/FiNMA4YkG
	N8vfPIAYJrGbI5K4BjXmHK97GXDJsDwfY+d5VJtOI+aKYxd2TqbTGMRCGzkLOp8NPLs=
X-Gm-Gg: AYBFou3ij5xg1jD4anP+mCQp2KV3XK4BBvA0ErAARZXnbG/U8kIn2181TTuuKrtxbCs
	U19NzJYkdGKF0fpzrSth50RVTmHmDjOU4En/Y0a/qJX00HuSRuljzNeCHhQ9GqNUQVU88AjhK6K
	hYdj1Ci0Wvr45PKIAKbkF672jN+NwHWWD1Ji2TNujpAk1L/Nmk+raDlBDAzJNFCKS5Vcsc6NcT8
	kV7vrCyIRbhUlYHT5ip3JArBX4BPYT2LnQMZ0bdl7PgGx/cWz5ddT6W7otT+OqiNlc3Mk+AZuMM
	0I0ztErYKMi6iQLRQUkPhpngQ+oP4DEZ080dPC7GuI3zktbPoDveQVnTFbuyHwJeJZ2lIirv2cS
	I4ruYtITFzIvGIqb0V1iEfhZR4yYbBbY+ggeajqkNsTrlz7sDqfvGYMKxUqJ2OSm3zR1F9QpKja
	3oe/GhVEJfKD7MPEnOpD99udtHRPGF2RXW4mFkzzuYWMIVr2suqBl3Xx+HCjVjxhfGeRdRg0djJ
	TQtYDt7mASWTMlcxR6D9QF0QOnjU+XxbETixeS/zVthq/Qng0s=
X-Received: by 2002:a05:6000:18a8:b0:487:342:d145 with SMTP id ffacd0b85a97d-48b0245d2ebmr2617321f8f.2.1790773402155;
        Wed, 30 Sep 2026 06:03:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b02a0185asm3461189f8f.32.2026.09.30.06.03.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 06:03:21 -0700 (PDT)
Message-ID: <235a33c2-7138-4815-820d-793568757d95@6wind.com>
Date: Wed, 30 Sep 2026 15:03:20 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net-next v9 2/6] net: change netdev_hw_addr_list count
 through helpers
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Ajay Singh <ajay.kathat@microchip.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Ido Schimmel <idosch@nvidia.com>, Jacob Keller <jacob.e.keller@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Johannes Berg <johannes@sipsolutions.net>,
 Kees Cook <kees@kernel.org>, Kory Maincent <kory.maincent@bootlin.com>,
 Kuniyuki Iwashima <kuniyu@google.com>,
 Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>,
 Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org
References: <20260930112842.21323-1-sigefriedhyy@gmail.com>
 <20260930112842.21323-3-sigefriedhyy@gmail.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20260930112842.21323-3-sigefriedhyy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 30/09/2026 à 13:28, Yuyang Huang a écrit :
> The count of a netdev_hw_addr_list is changed in several places of
> dev_addr_lists.c and a few drivers read it directly. The next patch
> needs to account every change of the count of dev->mc.
> 
> Add __hw_addr_count_add(), __hw_addr_count_inc(), __hw_addr_count_dec()
> and __hw_addr_count_reset(), use them for every change of the count
> and rename the field to _count so that a direct write stands out.
> Readers keep using netdev_hw_addr_list_count() and the netdev_uc_count()
> and netdev_mc_count() helpers, the few that read the field directly
> are converted. No functional change.
> 
> Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>

If you respin a version, you can use netdev_hw_addr_list_count() in
__hw_addr_list_snapshot() also.

Thanks,
Nicolas
