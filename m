Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F0E346FA2
	for <linux-kselftest@vger.kernel.org>; Sat, 31 Jan 2026 17:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769879939; cv=none; b=LQu4m+WmJBfu1n5nbV/bfH6LnrifsVGEzAIfopR9ZRBgLYjLegPLNhaRIBcpH+vxLPnfRbsNCSvavbxwMAM/i8rg2z/CyHvhjYvBZqKtoo5uNOML4U40B5r/4RStGyZADwlZ3HBYMQoybpxwfCNGPq84r/5TKaVFFTPBa8OgeTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769879939; c=relaxed/simple;
	bh=SRbpMgp//MlZoMroQOq3CCTxUaqu/v6YKoNy6fCQMoE=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=XRSn4QMof7PWycw2GlStl6EQcdJzgFeyWn87k8v4LDruI6Nc7zjYIP0oAdWXZUubhebCZkpTByLF9xDXaLzU3IBzIg9QJto+apdNXx0OZ+ga7i9swo9w9rZRzPWYYvl9FwEEyZPsk5KMOz1jbLmb2ByAU9HstbHwB1Xc57VEi5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVY8nC1x; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVY8nC1x"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6481bd173c0so2761798d50.2
        for <linux-kselftest@vger.kernel.org>; Sat, 31 Jan 2026 09:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769879937; x=1770484737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nf1H39GseXa0MaF9o3mhYXYnAWA6yd8MoMX3kBkjYXQ=;
        b=eVY8nC1xqm/DNSOrzzMhTrzIhfElUBvr9J37OkRa6RrmLJOZHOJ9PKgfeUzXV6kedI
         GubIHzkZgpy430Kf3Ph2gsvaVOCMrSZQUvQ+uzecHeM2ywz9WXiMHsMas8fMlV3krZ0T
         yu+EG1ySjNC1eE1nnYidKgd/5xZ6hjSQJSWvoAnbBlTF1m6IHHqDNFHl77oL6Zsa+rWx
         aNLRG6Z66gz85crgIYbUh/6u9srxbxESPe5Xz+2grzOwoOnhI1zpFbkpGCIqVn6o6SkD
         S3vwswfUNQAm1urkoGrnNn06HtrwdtCqbk5h5iWVIg7WhRFDcfdTPY5JqQUO+kEx+xof
         sRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769879937; x=1770484737;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nf1H39GseXa0MaF9o3mhYXYnAWA6yd8MoMX3kBkjYXQ=;
        b=Faf4jAXnv+40TyisQ7r6T6m+9v+I8T5U61AtbUxbvdHwxGkLz+FJmg0/PcibSi/Gtb
         mtZzVYQ20LuNsg4RmR75Mr/VqXKe1XzrKqM/rrZKOOSi9QheA4VesMRuVOmu9a4j+X9l
         azd4UcmgLEyeCJvoxzaxGO7DzhHm+2LQUdtnbuIMOkG0A+vLBvFi1OjqUQhflec+cc+W
         BO+Kl4iDHKSqtTupbjkeZnDCUQycekswCmVe4UEaKEEbzmzHweeUA/b9f9Jy4JDXx504
         JWtIJ66+03v9exe4a3Wi4ZYEL5n9e3VRKnrXfgQ3//vghu/xNGr61t4nWsekZNAf/kMv
         DQnA==
X-Forwarded-Encrypted: i=1; AJvYcCXw5gA9rkdS5Idh7WVpI8qh85zzaRwXizutl3INWyvIqPkdtneYuAMM7ISCH50yFJYt71Sik4k8ugXYY09So8o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFH/F3mRHA2FihAxPu2FklbmnAxzkKmFvNXDTxQyzzNmbw9ScL
	q1THNthuorbB6trdRBO1CG5T/sZTanRN9ZdC0S1yhe4sAasEtTUyN7c0
X-Gm-Gg: AZuq6aK0nYXMwgRj6if/i4UIs4KLa7yWVXjojUc2DOTauImJ9ZHqDFAHDtJmR0Vc8V3
	kP3Yd/bonJzKWDfJScAQ/6ADmG5RqAx8MqXN4SknrsxOpIJsoTU0cNTdIFxWXOpl9cyDXnKwdVU
	e/IT3hVoh209Jbx/JKG3IxEXtOpUj1kqnyuT3APOPlhTSADShjnsLkHKZXlCdrC/ahvPxqZU972
	Ub9ttaPq2p32mh1DOP17OKQxO25vkv6zaNm8mENx1y6fJ5XUt9Q/mV16WZ1VrjatsM76khBS6l7
	Lb0MsI+CQGzIkH0SrQpkJuZqyNZK3CXlFdVrs7X8cWbdHqOatMPmwx9SQQhTBnFMP/a2Yi8/JYV
	nbiVnwjWytK20p4oxfFDexrld+Yj3bqkih/Hk/wT4Ipy0PKIqaFN3U2ykUvkx2M6y29Z8bg+yMA
	bqQbsIH1C2wDiTuZSwpTEbs+HcMRM9d0b4G2m7HpHMRex+grGVSGmjTWx/FA0=
X-Received: by 2002:a05:690e:4106:b0:649:6a9b:9902 with SMTP id 956f58d0204a3-649a84e05bdmr4993542d50.65.1769879936963;
        Sat, 31 Jan 2026 09:18:56 -0800 (PST)
Received: from gmail.com (21.33.48.34.bc.googleusercontent.com. [34.48.33.21])
        by smtp.gmail.com with UTF8SMTPSA id 956f58d0204a3-64996105c96sm5135603d50.23.2026.01.31.09.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 09:18:56 -0800 (PST)
Date: Sat, 31 Jan 2026 12:18:55 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 davem@davemloft.net
Cc: netdev@vger.kernel.org, 
 edumazet@google.com, 
 pabeni@redhat.com, 
 andrew+netdev@lunn.ch, 
 horms@kernel.org, 
 Jakub Kicinski <kuba@kernel.org>, 
 shuah@kernel.org, 
 willemb@google.com, 
 linux-kselftest@vger.kernel.org
Message-ID: <willemdebruijn.kernel.29ba7c9e89f32@gmail.com>
In-Reply-To: <20260130192912.826454-1-kuba@kernel.org>
References: <20260130192912.826454-1-kuba@kernel.org>
Subject: Re: [PATCH net-next] selftests: drv-net: rss: validate min RSS table
 size
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Jakub Kicinski wrote:
> Add a test which checks that the RSS table is at least 4x the max
> queue count supported by the device. The original RSS spec from
> Microsoft stated that the RSS indirection table should be 2 to 8
> times the CPU count, presumably assuming queue per CPU. If the
> CPU count is not a power of two, however, a power-of-2 table
> 2x larger than queue count results in a 33% traffic imbalance.
> Validate that the indirection table is at least 4x the queue
> count. This lowers the imbalance to 16% which empirically
> appears to be more acceptable to memcache-like workloads.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

> +def _test_rss_indir_size(cfg, qcnt, context=0):
> +    """Test that indirection table size is at least 4x queue count."""
> +    ethtool(f"-L {cfg.ifname} combined {qcnt}")

Remind me: does this work with devices that advertise RX N TX N rather
than combined N?

> +
> +    rss = _get_rss(cfg, context=context)
> +    indir = rss['rss-indirection-table']
> +    ksft_ge(len(indir), 4 * qcnt, "Table smaller than 4x")
> +    return len(indir)
> +
> +
> +@ksft_variants([
> +    KsftNamedVariant("main", False),
> +    KsftNamedVariant("ctx", True),
> +])
> +def indir_size_4x(cfg, create_context):
> +    """
> +    Test that the indirection table has at least 4 entries per queue.
> +    Empirically network-heavy workloads like memcache suffer with the 33%
> +    imbalance of a 2x indirection table size.
> +    4x table translates to a 16% imbalance.
> +    """
> +    channels = cfg.ethnl.channels_get({'header': {'dev-index': cfg.ifindex}})
> +    ch_max = channels.get('combined-max', 0)

Same here: not all drivers set this.

Perhaps we should skip if absent?

And does combined-max mean all queues across all contexts, or per
context? The test seems to imply the second. My intuition was the
first. Is it clearly defined across devices. per ethtool_channels,
seems per device?

  * @max_combined: Read only. Maximum number of combined channel the driver
  *      support. Set of queues RX, TX or other.


> +    qcnt = channels['combined-count']
> +
> +    if ch_max < 3:
> +        raise KsftSkipEx(f"Not enough queues for the test: max={ch_max}")
> +
> +    defer(ethtool, f"-L {cfg.ifname} combined {qcnt}")
> +    ethtool(f"-L {cfg.ifname} combined 3")
> +
> +    ctx_id = _maybe_create_context(cfg, create_context)
> +
> +    indir_sz = _test_rss_indir_size(cfg, 3, context=ctx_id)
> +
> +    # Test with max queue count (max - 1 if max is a power of two)
> +    test_max = ch_max - 1 if _is_power_of_two(ch_max) else ch_max
> +    if test_max > 3 and indir_sz < test_max * 4:
> +        _test_rss_indir_size(cfg, test_max, context=ctx_id)
> +

