Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F58C3EC2C2
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 14:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773758473; cv=none; b=tt7Z7XFCIRfZFKoWromErTrACd+xUPeBvfF24CMUHira8LFJSHfH67xuRwsYMMg/BRNaHX0x6sGNsljKnbnF2AD7TCV4mYfBgbFtxrpow6N82NwsmStpEsKUuFwZKihaW7BVsPsc0AsPojC9ywWzRUssNOI1v4z185gqHKqNmqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773758473; c=relaxed/simple;
	bh=Xec3Bnqs8cOPFzLKCllX85qxRCNRZ4+RoA71Mx5laDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c0G004ibfgqaqbm5GJBV9s2d8yRW5sEc3FQJpGcYzagjQlgSH1TVsSZod0AcxX34OUticgEJHaHVoPASGTNePrykoExeOs0Jgtwj8SU4ywwuybvU7FKVMZ8AKKgMSEp5UUSlaVqK5eGb+Z4Aeu/cZudeCUdOHGAeX0LG3oJimHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gEPGIAi7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=WG0++1L1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gEPGIAi7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="WG0++1L1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773758471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oqu0XWMuuVA5H9z7yGNPz2Wm4cgx+SYtal3EMhGWndY=;
	b=gEPGIAi7o2ng8GtasCfQWzW/aGk9OdZr36y/NGKl9OgH4CzoQ7Bksl2cmhQaEwe9M/E1T2
	LckqQNUS1IFFGNOsIkyzG5Zv6vG0u2Etu14O5HmRISBcjlx9nle+880q7c47MzNw9QndXe
	Y0uh9C4ZEcEG4IzdqkP2IM4gifs6cwI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-RZyhL4-bM2KqIevMncDHGw-1; Tue, 17 Mar 2026 10:41:09 -0400
X-MC-Unique: RZyhL4-bM2KqIevMncDHGw-1
X-Mimecast-MFC-AGG-ID: RZyhL4-bM2KqIevMncDHGw_1773758468
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-48542d5aa9eso47289085e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 07:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773758468; x=1774363268; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oqu0XWMuuVA5H9z7yGNPz2Wm4cgx+SYtal3EMhGWndY=;
        b=WG0++1L1eJ+K+WollAoxNY0IvNCOkHl8MTu5IUk2XEXne0hF+bhL0zlZAsloN5//sJ
         aR8i/KD8c/pbmwNMymLN/pIIjdY9Mg/A5riYsUTRPBnGKQ3N2xqgpQ/iQW/NHBnEuvum
         MHxRe3kNV2PE47ZV7MU8G4SyRk7DQGmKftWuYRLcVPo6KjhdowfO6HrvZxEq0XL3ZDX0
         gbAqDWbbjBkETbeleliXwNVwNe2GERGbDB8IHAAdm2p+aveqSwZ22NzijIsXLY3+e0qE
         3VS6j/AdV/Ps08Ztt+zoYMj1wu6GheW9S3Ss3oVU51vA3Fg2G0B93ivEDPq8aGRH6v3Q
         Ts0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773758468; x=1774363268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oqu0XWMuuVA5H9z7yGNPz2Wm4cgx+SYtal3EMhGWndY=;
        b=L7fkpzJ4GwZ00RO18xURSxORafKhemkg30rqEHAtFHDVaeac5TP2ar1eqIw5/evfZw
         5qs/yWSCh2PhzHsr6ddDgzfpVT6zNN6UADejYjxVTuv91E9gNyrkmfXkqKhMObMdyAp3
         hZkyhBZ8ww6ABHRmNl85XJ+va14VE2jsDSIz+C5qAm8yYp9Q/vOZ+pO4j/6Jx5XJcFfv
         oOoo6/dw1MUogEdYJJ9ynAQSzAmFLZcyTfjWQdubXS1rq0nY60Cre5zTFvUEmu+4qZrF
         WyYjyjHdXYSvOprYVtZbC3KZSAVNsaye++hAgQnxncA5RlF9Dez2y/j1qIicjzRsOQtf
         PtTA==
X-Gm-Message-State: AOJu0Ywy0R7o8AzgWyjvFrZ3uwy1cYc12HEA0x6H0Yr1OHoIzVWzo0TK
	RX3uCYfZbe960aF9uq9lG1eOIx6BA/4/vKES1o12T37lvfz2POyqBbiIH9HwGqbWaMioXJyvmov
	II7Oa+zXVkVVLeQUfXF6WaKKtOlcJPbmo4UVzrsqYMicVAF2ERAsjBmf4Q/VZFG26s0Cmrw==
X-Gm-Gg: ATEYQzwXl4UGVtAfTO2LP0QssUuZ6a8GLFMDf+8opQF17tSCR7Hwr99ZxMikI3lbdHd
	N96p15JMHq+AOu+7trti0wBMu/jEQnJQLLaN19EVhMz1PhKET0pIzpf15DAv1y3A9A5Zl9JRg+U
	bVTaU1Xee/2ilN55mGMWRwjL5AvO4FhbosUsXc8sZbm8PADlcD27p9rOqrM47w7W2VDdaRIsYTZ
	NbmHPE5ufF/zApvfQYQiF0FlizATBH/09Z1Mvu2kN+oZc3RYvLFtELxcMLHAU+j20QfhMMDUiZD
	O1YKQdMV4KgCTc2j808o5XC+3HIuE8RJsCjY2b84gMXOiE87z+/yHb9NxzzUSieBsKpkmsm/C5T
	CAsR8p2bRJg31954cWhJcQ6rHnr898TJYsLFDBm3pZGARn34XHScQnM4=
X-Received: by 2002:a05:600c:35cd:b0:485:ae14:8191 with SMTP id 5b1f17b1804b1-485ae14864fmr48934175e9.5.1773758467683;
        Tue, 17 Mar 2026 07:41:07 -0700 (PDT)
X-Received: by 2002:a05:600c:35cd:b0:485:ae14:8191 with SMTP id 5b1f17b1804b1-485ae14864fmr48933695e9.5.1773758467265;
        Tue, 17 Mar 2026 07:41:07 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.11.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2186e3sm57258205f8f.26.2026.03.17.07.41.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 07:41:06 -0700 (PDT)
Message-ID: <728fc0aa-4c07-4092-91bb-6b9f76c2f3eb@redhat.com>
Date: Tue, 17 Mar 2026 15:41:05 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v1] selftest: rds: add
 tools/testing/selftests/net/rds/config
To: Allison Henderson <achender@kernel.org>, netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org, edumazet@google.com,
 rds-devel@oss.oracle.com, kuba@kernel.org, horms@kernel.org,
 linux-rdma@vger.kernel.org, shuah@kernel.org, allison.henderson@oracle.com
References: <20260316235848.2395654-1-achender@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260316235848.2395654-1-achender@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/17/26 12:58 AM, Allison Henderson wrote:
> This patch adds an rds selftest config.  

Why? what improvement produces or what issues does that address?

> diff --git a/tools/testing/selftests/net/rds/config b/tools/testing/selftests/net/rds/config
> new file mode 100644
> index 000000000000..103f9d941d10
> --- /dev/null
> +++ b/tools/testing/selftests/net/rds/config
> @@ -0,0 +1,5 @@
> +CONFIG_RDS=y
> +CONFIG_RDS_TCP=y
> +CONFIG_NET_NS=y
> +CONFIG_VETH=y
> +CONFIG_NET_SCH_NETEM=y
> diff --git a/tools/testing/selftests/net/rds/config.sh b/tools/testing/selftests/net/rds/config.sh
> index 791c8dbe1095..7cf56ee8882f 100755
> --- a/tools/testing/selftests/net/rds/config.sh
> +++ b/tools/testing/selftests/net/rds/config.sh
> @@ -24,7 +24,7 @@ while getopts "g" opt; do
>    esac
>  done
>  
> -CONF_FILE="tools/testing/selftests/net/config"
> +CONF_FILE="tools/testing/selftests/net/rds/config"
>  
>  # no modules
>  scripts/config --file "$CONF_FILE" --disable CONFIG_MODULES

This looks wrong?!? The script is going to update the config file which
is under git control. You probably want to copy the default config in a
tmp file file, edit the latter and add it to .gitignore and EXTRA_CLEAN.

The issue looks pre-existent, but since you are touching this part...

/P


