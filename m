Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793243484;
	b=bSslFPImOlWM5aYIFjjEEDOWHmrN+IFZ1uUgIhNEwQox2G8Cxh1rkWHkFDpnXgBB+Bmg
	 QjG7dTf6J9tuTPfUJyey7OMllC9712Q+nebUNY1xlvOUDTcWLPusg2ZbuZFhemyv3V+aZ
	 Uu7GXkrPey6GJHVNeQtatpqNSKqVndj4cizs0CoyCnApl0hnfgeapl11LznfpCz2iXK2b
	 qYaMzmZCsszjqx9fqNwSWhmvYLra+21waXx4pyz/VqrcB+BiphCLk4Z2IGixcTgLC2j1J
	 NKplKYZBesY3rcZfcAlT/edYagDl1yW1Pq5x/cElZoaljEdAFFoPGzS+jLhFL2Rn0MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793243484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sDis0WLx8KUE2I1kamC2CNbijidM52hUokuP0aR4tyA=;
	b=3eMZqZ1dQraHBoT0RS1K4D8iPa6T/GBhX2Z/tZH/7BxQk+XLaFTqNmnfW62URZjJyZjh
	 wn3VwN+HBVAoAYW/3JV1m3Jh6F6//els2QlKlzfVzlWILX4LOcBnAh1N7HB880/Nj8u1u
	 Pt10kBZvdWmq4FoK75xEAts0C4jr3l1J9x0+N9Y5/Vk6Zm7DosxvbQcW9quaks58EGLvN
	 9Bzo+cas1RVrlxV6DgETEfAU11R5bbuPWKPHmIxHRqnSSEPrQEwyywpMmdsMBE4ZIYIFf
	 m20kwkbzZz0mjx+2ldr1tNAGVU9xc5w+MFJjXC/iN3a3C8VUmDNao8prOZvjlINik1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=smartx.com;
	spf=pass smtp.mailfrom=smartx.com;
	dkim=pass header.d=smartx-com.20260707.gappssmtp.com header.i=@smartx-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gTQgqc7f;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB168606A31A
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 03:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB168606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smartx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smartx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=smartx-com.20260707.gappssmtp.com header.i=@smartx-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gTQgqc7f
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-14fc585291cso1502135c88.1
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 20:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smartx-com.20260707.gappssmtp.com; s=20260707; t=1793243482; x=1793848282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sDis0WLx8KUE2I1kamC2CNbijidM52hUokuP0aR4tyA=;
        b=gTQgqc7fe00z38xS5VGL17ODfWk/PlBu1jih7V9N5ixOOIh4suNWXgN1PLiPkzxYyF
         Tj5/qsjjHD6FC5/PvMl06NBmfZ3VG73HPxA0eyYrakmgTH8JTSdNOXbqzcoVGBvP6OKF
         +Br9NIZBdNisAFJmXMlzO11v6I6/eqTCKXnm0BOPfeU6wx9VVv3ohYiteBGouPAD8p9D
         fF8VfgggBcpIqhP1nxJy6Lu04xwwpAH9jifgcptedlpc6It8WTUWiJ7LZq26bSWtxmxa
         ks3Y2p6zCXc2kGkI363E0lJBSzkEhk8eo0Xau9J6aJIC1GQGSPhi7gTdrFsXhKy2ea8p
         30OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793243482; x=1793848282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sDis0WLx8KUE2I1kamC2CNbijidM52hUokuP0aR4tyA=;
        b=Z+TVy0VhPcN6+QsaJ+LF5GYqkPH3g77ogS17ZzJ02jDbkiWFtTFtBsCVkDhnLqSutd
         QY4nQ4Iisbh1KBZRvX9dqsFlPNTqqGdZYD9vd5u0KDU4R5IVZy1t2XlPkjp8UoTRmy4a
         ID/XXdccrODsZgfgIZ4hTNa4r0eepizHk4G33t+Y/VdDl+JtYZYTCkBpAoZfzRYQDLps
         vGMCYbo+fs7gpFHbHpOMRXM/km5ve4TTPyPekndrD3DEU6FD3sDVCmNfmS+iinw7SBgn
         wzyTgv2cU8aufU9R4lUJbg4RwLxi72OkqV1yXiVsnYAZYF+72dwm+xuW8LF8DXAuToHg
         BU+w==
X-Forwarded-Encrypted: i=1; AKwUvBzFOtIKZgkZ3WOns6QGpLiKbDILY9/Ozpxu0Eb2jO5Eu5WS3zs5ZPhI3mhy8QGT4zW0funbQTVN/pz8GWNG394=@vger.kernel.org
X-Gm-Message-State: AFq9FYJORsh+3vax0batlbixt4GFmWR/mC4kwlUs4HBHspduiSOaaKC1
	b2FKQfiZifVesR5HENwicGmWvwYFvXSrdklMhTeMbQPHQrPZggcfyxD+cPV7bMxm5IDuWHleZJk
	wX+CQKsOfNQ1zIkjiuPlQnppxYEWEt8ZzHMownXgxEO25xL7WMObzkuOyujevorA=
X-Gm-Gg: AYBFou2H9DR8szKTERfjQGXMQo/3y9bqSf5y3shKgr5ABAA6in9at4JBeYirk3X63ha
	4QTLNdnqn+kSmkB5KwALWYO78DtcGfBevRArcQJdlUS0omxTmqfq5v2OVDjxH2Jyja39+HcN1lI
	bNmDUgOL9+wWVwz44qbFwhbmIJ+U9rXQjh6fHGtbAF4T2f+12xpEZe6KllC4NWMmb5B/D7C5ZD4
	24iEr761EiX5ntpmzPVoPbhNz7p45c9g5RfNdfuM1WM4uy6nyerJD5eOnPlSgrrQeYoErYouRPE
	EqmhWHpSYLTR6wy/n2EvLfT7spG2tX0LgtVdY6I8Ga6wCGpJsE/mba0BVW3FPjTzbWMj28weNrL
	Px7uehlVl7Y8+jmegIyk6A1vBVDeGptgPqHZt6RztdqfZK01E5wnBJCxwBIuMQqT10nIx6JiykI
	9FDIftgU/YrZhp+06VQ7ljLdrQ3jlUFEKqWsFgA1Xf6jfyzJvwtKncSXbgw+DTyYlsBMQJsnPSa
	Snbpv6cjwWzJPxwXN2lcISVRP24ldNtemqJBwp23zsuXRulHggCKEmS5IHBFcf34rv9ZGDfBKVq
	xy5AVS2rwakFwecJCHtyw9U8n66gp7zU3dYylVbmhNYeCxk7YcjEDugj4o0sUMCn
X-Received: by 2002:a05:7022:c89:b0:184:329d:eced with SMTP id a92af1059eb24-1a6ce4ea23dmr5028701c88.25.1793243481131;
        Wed, 28 Oct 2026 20:11:21 -0700 (PDT)
Received: from localhost.localdomain ([179.255.112.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75f51bdebsm11705549c88.17.2026.10.28.20.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 20:11:20 -0700 (PDT)
From: Wang Zhan <wang.zhan@smartx.com>
To: netdev@vger.kernel.org,
	Yingjie Wang <x-professor@outlook.com>
Cc: Wang Zhan <wang.zhan@smartx.com>,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 1/2] net: preserve rps_default_mask on failed writes
Date: Thu, 29 Oct 2026 11:10:36 +0800
Message-ID: <20261029031036.1133374-1-wang.zhan@smartx.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <7fc32d133404c078352f0b8fbcc80a67861bf2c3.1793199118.git.x-professor@outlook.com>
References: <cover.1793199118.git.x-professor@outlook.com> <7fc32d133404c078352f0b8fbcc80a67861bf2c3.1793199118.git.x-professor@outlook.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 28 Oct 2026 14:52:09 +0000 Yingjie Wang wrote:
> @@ -105,27 +105,29 @@ static int rps_default_mask_sysctl(const struct ctl_table *table, int write,
>  				   void *buffer, size_t *lenp, loff_t *ppos)
>  {
>  	struct net *net = (struct net *)table->data;
> +	struct cpumask *new_mask = NULL;
>  	struct cpumask *mask;
>  	int err = 0;
> 
> +	if (write) {
> +		new_mask = kzalloc(cpumask_size(), GFP_KERNEL);
> +		if (!new_mask)
> +			return -ENOMEM;
> +	}
> +
>  	mutex_lock(&rps_default_mask_mutex);
>  	mask = net->core.rps_default_mask;
>  	if (write) {
> -		if (!mask) {
> -			mask = kzalloc(cpumask_size(), GFP_KERNEL);
> -			net->core.rps_default_mask = mask;
> -		}
> -		err = -ENOMEM;
> -		if (!mask)
> -			goto done;
> -
> -		err = cpumask_parse(buffer, mask);
> +		err = cpumask_parse(buffer, new_mask);
>  		if (err)
>  			goto done;
> 
> -		err = rps_cpumask_housekeeping(mask);
> +		err = rps_cpumask_housekeeping(new_mask);
> +		if (err)
> +			goto done;

Please consider parsing and validating new_mask before taking
rps_default_mask_mutex. It remains private to this handler until published.
