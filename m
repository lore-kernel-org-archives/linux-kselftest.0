Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793777483;
	b=atNTmmUxL4POWwq3Q5QskV5BSVOyqHQAYYJcpkrXj4cdGG+MLyL5XJDCkGBAflPJQqrP
	 1SK+2pszs0uNg9guGNlF51lL9DB35xPuHJD9OEitrwxaIo3c5Gw6OS3T6nvUD9E7uJ/IF
	 /hQ7dt4DKN82s+qeETimnPw+q51k0os7toSXjviEzamREqmBG16QqzRKoGfM53znTgfEl
	 TTUCEk4t1FbsUUOE2NsgsnQup3Au5s63CAmp34xVu2lHHsjzqPXYrbXFWVNO9t/m4MHkH
	 12sEpnLJqxFb/WyGCexWb1sdW2GTfDX4HSimNgfq3sP45ec5fx+i20Adro+9sZSaEJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777483;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Gf1SJ60wh6rt1cgDzJ1XsuN+6DsStx0G3H1EPBnHUrc=;
	b=Ph5/LlWHMDgvZibzmOArm/W4yPFSWaJa+ByvrDyKyyC3yeFC6SilGLSK8NJ2uzn9jQk0
	 bcnCNrRhYUo4xzW3SqFx8lpz1FCa82p5XrDN8cLo7RBdRPaZe3U3Q19ir2eMcUDFQ33vl
	 6aJAzJnytbPyQ+IDnJXfkIKUYHVL0EYoXstQcRcjSzB3YFTD9NJqtFsDNetnEqO1rMgVF
	 MmsOct9wCVmziCacxhT1ooqdzI/WpaXJA25YvSVLw4rwaK5huGZYBivhckWf8dRKDkuBk
	 kOI7OxI4A9jhBNdAIleVtUkBfLOTUflyDU4aWyzSksXmRUp0Fargs3nz2gZwus5zntQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bHveVmbM;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qPyUMYEP;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA55606A31B
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 07:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEA55606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bHveVmbM;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qPyUMYEP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793777481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gf1SJ60wh6rt1cgDzJ1XsuN+6DsStx0G3H1EPBnHUrc=;
	b=bHveVmbMboFoyV/JO0zO4CZHk0sykT/qOL2/fszQ0zblTFn2wFfP1dTCXlbULjVWuiQ6lA
	hkIAVs4LrV6RSWBM7l4BxUVp6sN22wBPRZbykFsWabZRsqW5MC/L5EyhBomu7kdPVQkQ++
	he3m5V8F58tqHZzmi38LORtin1KHjfY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-SpJ0TjeLMZGs47Kp1m8pJw-1; Wed, 04 Nov 2026 02:31:20 -0500
X-MC-Unique: SpJ0TjeLMZGs47Kp1m8pJw-1
X-Mimecast-MFC-AGG-ID: SpJ0TjeLMZGs47Kp1m8pJw_1793777479
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a211bff50bso2543865e9.2
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 23:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793777479; x=1794382279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gf1SJ60wh6rt1cgDzJ1XsuN+6DsStx0G3H1EPBnHUrc=;
        b=qPyUMYEPu6QMDw+ynFBXj+Jukdd/b7kY/MwSzggCPBbpqxVgSSKgaPVvCXHszLHMco
         DlChHW+HSdOND+z92arp08ItIKAl5SBxI6sb508qvBIMVvrx5D+CCApcPJ6w2U8LroJm
         r4b2JM0Z5YGcJCNO5bJoyhZPF2SGZUAU5HamlEA3FNIx58qghw1wsKgWyPu6gXbmqnQN
         E+gOashfTRRTa6fbRRxM9NEUCG+fzcXqMLRRTDR5xfCivw/vR7Iab+z/LJZmmRbcob58
         7nPyMK1EcwD+cvreIfJGyM9HJYnIuzgjJgn3rUsVj/grOtz2KJY44lsvT26XeYlcUWSR
         WrDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793777479; x=1794382279;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gf1SJ60wh6rt1cgDzJ1XsuN+6DsStx0G3H1EPBnHUrc=;
        b=cqLY1S676VhWf6L9WYxX8SHH/B0wgiMe59fVKKyrvDy2NRS3s40/8RzkOKEvyqDpNt
         N/ldPaiXcM3Xgu0V6z6IUgz6PDP1p+FiYco+8UEQhs8rbPbmcPleVy+OXMwoCmHbRBFJ
         lonhVdklhWWb0SjhAMwldYOpE9iu8AErsgC2nlVLH/mRYf4sSy8pipxrPOfo2GhCRlGy
         fI+dS/hykiY6d/aAjbPELXtL6N1NUSy26kOnAQkT0ELN70tHpiqQC3jRKld2su3dhdIy
         cTcZ7UbO2LVVH1kEM2VYZ5HBiC0kb49+jqT9Nqn1JLAcAcYxhlaPsYLZ4uHDqYH6Udld
         DiYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwV3s2PZw8sagM9d6f9qwQvzojcY/FZPTfNsLdjXQywsr6AIdK9fSM9kUI+vqYwEW07wFSom8tHY9HqNn6rziA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OZlNKPagxc94gWxZfHuK9RKj/gEmAj+7L8V+TZCWSONiWQSSK
	vDafUmqA/ulT1z7IMn0+bGYi7cCqC1OonIfoyTyGM7ghWQ2RD/nWqQYpw1IdORZSiXBUlQhQpb+
	BcMcuyI+6N6ClO8ZOimwLAVc599b65dREDDv/J5ncVIZUmjjwRDa3SzivH1BfP1RsSpTmEg==
X-Gm-Gg: AYBFou2U0uly+mlg2ogy5KaiauzBVxtBHSTu05w8DxV5yq3C/B+1qzuQRgJG9iNLxuq
	Erzf9YpLofztk9L0zI3AL6qMJmDCsVNwO05UcrI7uxCEUFEAOuxUmxSbILjZYga+o+A+SkCD1g5
	h/nieAwyA1cl1pnCI3zcT1KtcMQBV+VeKwOhnq2q+1uQutam+05TmGL6YivYf0wTuUVofde1vfm
	85AxTmAa/tT9gyqaRnqgnG0DsBTzdjO+C6LPGiYEhg7/jA8bBH6aKKPvYKfihnpiXCECnkLW3ZE
	MENDVB0PtBVH2poKPD0WmvXgD3IWW39gCyqkFHY6cTseDH+ae8QKyR16RtVJiOqU/RkHDGC7nqp
	NScPXT3n2KvGH0osxWSAUimy63dtkxxWU1LnIvlht9IRb9L5HjToX0duAhV+9LVu2R4l+ca1FWA
	gCnhJrQyNUMESrzxVfJ7CX+3QPVxTLEdG5usJu2anNsSA=
X-Received: by 2002:a05:600c:19c9:b0:4a1:7c7d:8881 with SMTP id 5b1f17b1804b1-4ac182dcb6fmr342501335e9.13.1793777479230;
        Tue, 03 Nov 2026 23:31:19 -0800 (PST)
X-Received: by 2002:a05:600c:19c9:b0:4a1:7c7d:8881 with SMTP id 5b1f17b1804b1-4ac182dcb6fmr342500785e9.13.1793777478812;
        Tue, 03 Nov 2026 23:31:18 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4532916f2sm29117235e9.5.2026.11.03.23.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 23:31:18 -0800 (PST)
Message-ID: <a323799f-a817-4022-96dd-e6f376fb4d03@redhat.com>
Date: Wed, 4 Nov 2026 08:31:17 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/2] netlink: add an optional per-netns ROUTE
 multicast index
To: patrick <work_patrick@qq.com>, netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 horms@kernel.org, corbet@lwn.net, rdunlap@infradead.org,
 linux-doc@vger.kernel.org, skhan@linuxfoundation.org,
 linux-kselftest@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261104033526.2917590-1-work_patrick@qq.com>
 <tencent_1E208C03035DF063166FD46C1DA1978F6306@qq.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <tencent_1E208C03035DF063166FD46C1DA1978F6306@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/26 04:35, patrick wrote:
> diff --git a/Documentation/admin-guide/sysctl/net.rst b/Documentation/admin-guide/sysctl/net.rst
> index fe43e8595..0cda347ed 100644
> --- a/Documentation/admin-guide/sysctl/net.rst
> +++ b/Documentation/admin-guide/sysctl/net.rst
> @@ -280,6 +280,33 @@ checksums.
>   These messages are now emitted at KERN_DEBUG and can generally be enabled
>   and controlled by the dynamic_debug facility.
>   
> +netlink_route_mc_index
> +---------------------

The above breaks kdoc

/P

