Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C500E350D4D
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Feb 2026 16:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771778177; cv=none; b=BQQItaMzdqYTqU0Mp8ZijM5GRFnrJBF0v+WgGEOF9mGT/w8qOm45LEFu/gRfiEopEY/mshfZ1UcIca+6BEqNIN/oLRJ0Py1wPBiG5PXOtkOv40MtCIJL3NKaZ4qrakJDXQVWnnR3QcfSN4CL6O6IQB6yvuOgGxm9JBI+5fjtfGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771778177; c=relaxed/simple;
	bh=j/hNrN8yCx2c4pErAxcUpIOPgDMVep0Bk1BF9TT9jNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GsfolJ+HsiX65YUFDo1zYVvt5TnqLMio6y8wvjwk5nYKrJUxxev7Ik4LAV6J8g9js2MpUVmC4gjNDPN9wIGCbxArO9U/FvOa8sMwm1H4JxDu7blFjbW6Y49zI+JRNTlXzdS/JOJs/eOP9ZRyQRl6llNT7EJm5ke2jw1M4T+6Zj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=kNOGYwJM; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b="kNOGYwJM"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4837f27cf2dso30178995e9.2
        for <linux-kselftest@vger.kernel.org>; Sun, 22 Feb 2026 08:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1771778174; x=1772382974; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7xS9l5mc+XFl+nwoapUNzADH+s1Zoh0SwLY8LpTEI3o=;
        b=kNOGYwJMAtMS26+X9ILfgpi0iEKPjK3lQX2VgC1oQGaKhUw2i7J9m7P1JVzdwBJFPh
         qC6hr/sOQOcgpWkEwErni8nJbtjE7eG/uO9JvSSa1Af3a1Zo1gRjehvQa9AEuhio5b9u
         oo57NTvyc+gpVKYuzPjoYbEnnSaBRm35R6LkEc3kQImTkZxZBFWWX7/jJ5jeIzJwtlE3
         fva2PL96LXuZ7ae3anAAS89GujtdwBu4HFEkemWsw/0v6UQmq0Pj1CJuN1nuCdxCU9Bq
         Tbm8tenil6jAOOHvFWYdB7N474E2GJNIPW5iBhZFH80RYv46UgRYRS6psCzk+zM4I6OY
         4K4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771778174; x=1772382974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7xS9l5mc+XFl+nwoapUNzADH+s1Zoh0SwLY8LpTEI3o=;
        b=o49Co59SfmIvtYpR+AbS3gFGBZBqvhlQQdKVIGXV/7cmJl8DiFhKI7rPI+Z8Oe0yTa
         V6rngx5/IBlvvIAPod1Uhdn54hf7H8FJ1OCiKP3A3OZrCe+34T7hDqVaVVKhe3ET96nC
         kU8BzDIbxX8oVTCaQXWNGb9xVvTKUE2w5REX+soYbdXGb2y/JZwyvMIy2zMfkJ4sN2UR
         r6h/lHLRa80kpZ6HHvxfdOwS+Yjp2/HnIaQaJ/o62za+H1LK8oCv1Zh3IWAl0PM7imny
         FrGM3Nm0gaRy/GOYmjFZu9CBTBO3YJsGXwZOp+OhpyIu1TUDkdkKv2FzCw4CJXTwEyTf
         B0cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPnodBJ8MDe2CoKFJlADnFwSrJHQl22TJnH5xmtU8wh1qWY2x+qN3Gp8YmMSwn9Yyrfp6ePSkQtaSh6Kpj20U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxinSV5LoemDEpLLR6Wyg9STju5InwCqX5+kyQqENIMployKSQA
	Jw4ik6f+gub9LghVblu5zRzQ993cI93itZntizdPiuoN13Mdiv/ji7uuu+3HjHhytLo=
X-Gm-Gg: AZuq6aKM3rGqModn9MxfzjcEqdbWb1g/r1YKlC6wbnRGcq03yXqZnOtWuSK+B1eRbCh
	Ivfg1BLlkKYjcTDyVClXwEVXouUgc4hgu87FoJVVAf4sZnTfdl2ZKlticoSg9BjQy3rzqSf25Ry
	fBZmliMaE24JPWxBlNMV0npuIOTQGHlbctOnWotXaavL04pfy3KSiWCRECPhoVBUzm3tmY1m5DT
	T8VlirNFmZqf0O0R4fY1d2L2aYN9QhJCRQhrUrhPHbuAehG8/sVkuacHVe+p0ZW1Lycm6fyRYzt
	5As52XQeG1UJobFXpMRehToA7Q2WqgYPKANgJIasC1BPPORiyIwMefyHswM8+d4l1yC+FhXmFRi
	zBfbFJj3qsWw2qXTM+CUJlgLnuR7BErSDs6YP22Zcx0ePxmWmF0QHUvUyc3CgrnJZ7lhggxy+YZ
	/S3W7TkjUQueSELudY3MdWwJMWTelpQo0fkguDj4KRFSjifBbyPTcJ5OdJoA==
X-Received: by 2002:a05:600c:1e85:b0:482:eec4:772 with SMTP id 5b1f17b1804b1-483a963de9amr85845895e9.32.1771778173648;
        Sun, 22 Feb 2026 08:36:13 -0800 (PST)
Received: from localhost (176.111.181.192.kyiv.nat.volia.net. [176.111.181.192])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00e8bsm10865692f8f.15.2026.02.22.08.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 08:36:13 -0800 (PST)
Date: Sun, 22 Feb 2026 18:36:11 +0200
From: Nikolay Aleksandrov <razor@blackwall.org>
To: Danielle Ratson <danieller@nvidia.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	shuah@kernel.org, linux-kernel@vger.kernel.org,
	bridge@lists.linux.dev, linux-kselftest@vger.kernel.org,
	idosch@nvidia.com, petrm@nvidia.com
Subject: Re: [PATCH net 2/2] selftests: net: Add bridge VLAN range grouping
 tests
Message-ID: <aZsvj1Zo7msYRRCJ@penguin>
References: <20260222085338.3143823-1-danieller@nvidia.com>
 <20260222085338.3143823-3-danieller@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260222085338.3143823-3-danieller@nvidia.com>

On Sun, Feb 22, 2026 at 10:53:38AM +0200, Danielle Ratson wrote:
> Add a new test file bridge_vlan_dump.sh with four test cases that verify
> VLANs with different per-VLAN options are not incorrectly grouped into
> ranges in the dump output.
> 
> The tests verify the kernel's br_vlan_opts_eq_range() function correctly
> prevents VLAN range grouping when neigh_suppress, mcast_max_groups,
> mcast_n_groups, or mcast_enabled options differ.
> 
> Each test verifies that VLANs with different option values appear as
> individual entries rather than ranges, and that VLANs with matching
> values are properly grouped together.
> 
> Example output:
> 
> $ ./bridge_vlan_dump.sh
> TEST: VLAN range grouping with neigh_suppress                       [ OK ]
> TEST: VLAN range grouping with mcast_max_groups                     [ OK ]
> TEST: VLAN range grouping with mcast_n_groups                       [ OK ]
> TEST: VLAN range grouping with mcast_enabled                        [ OK ]
> 
> Signed-off-by: Danielle Ratson <danieller@nvidia.com>
> Reviewed-by: Petr Machata <petrm@nvidia.com>
> ---
>  tools/testing/selftests/net/Makefile          |   1 +
>  .../testing/selftests/net/bridge_vlan_dump.sh | 203 ++++++++++++++++++
>  2 files changed, 204 insertions(+)
>  create mode 100755 tools/testing/selftests/net/bridge_vlan_dump.sh
> 

Acked-by: Nikolay Aleksandrov <razor@blackwall.org> 
