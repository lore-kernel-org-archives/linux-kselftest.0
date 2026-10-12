Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2282110E
	for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 04:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791780809; cv=none; b=cA+BcJYJO2/1MpJpD30Rq2qeNT8mdVBvlG2xbrhLNrGIxtWHFTCFE6b39KoAlMssrnUiMF/szedbRlDiP+qA8gTQ6/NA4SJCoXbBa+OHhNindqr+EnlFnzhS9pNlGnzoScXfxtP17IV8wqglyQ5rlQUE0gA5xoqMzzkNfTvtZ4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791780809; c=relaxed/simple;
	bh=+zV7sFiMSvN0UbgFYqMAE/i3qFVYLZt2GxL4VcuKrGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SLtIcEXJ8mYQy/B6I+EM6QoxfrAvUvt0joWTppHL+S6Ei/kNY9vuHrFEjiZ4aiZZoJx3Y2A9Qi8EqtaTEfoN0m+8aybAkdAyK1qwlXI2Nb5cgotYsoSDOFdQaOyRbBHIfcod5yyQkfwG/EAM6G0aZBaOgr61v+0FSuPEm4K+OtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D84sYLaR; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D84sYLaR"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2dd76b1361dso8393215ad.1
        for <linux-kselftest@vger.kernel.org>; Sun, 11 Oct 2026 21:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791780808; x=1792385608; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q+hTqAW+4rixFX4ZbUNxn8AzXmHJNOSXE7y5h2vkHY8=;
        b=D84sYLaR4YuGJ3Tl+CCeHEOrE/swfnapvDTcgX/UlfMyrMB9l5Od1taZsXL0YYbE9W
         AA1bZaJuZ2l1tvvTcbzDsUBOa0vdQWoRWD8xs0u9G2kU+3CxN/sKFzeU0UVxOO7MssXh
         1dsj+HXLnPChNW5S7Zc8kkv2u0XMmZ1lFP2rhhAT9MMqE9tHmyLjyO9vmaOgtGIT6Rim
         KbN5YeG9UyVbejodzFAn8XNp+HHjxQTt/J5tHamoaiK0GQV4dlHAvmAPsCgvDBZA6bHN
         xPfh1kb/LoDqfvSc8RBRPCW+qYT05RptmKrRjb7Vgxp4POx8s6FD35EIyF0oFm6lH+Kj
         T02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791780808; x=1792385608;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q+hTqAW+4rixFX4ZbUNxn8AzXmHJNOSXE7y5h2vkHY8=;
        b=PsyeaODq1N4PqJibpvX47tRgJQ6DQ4x9K04s2LoRRAU4LuiHkOYud0XGr/HkBN5mdv
         DNnCH/xbv2AT1O6qNER0gy7FORuJxA2bRoojyCdYo/2c3CgczmhR5uMWly+iSs/VNRU4
         y1MedNzdo53T19Cb1GwwbNeYQvaP4HQHl+xaizScxLI/Q9aOl1Mn+Ngzd7W/mXcOKD3k
         W5nHZgq49z7agL8DnWCjYqoftELfAN10NHdvna3i1lWx+fIOQ5yOhv4uTjxIZnnMBsab
         gVRNCTcp0sIoDQNlUIbe+CIeZMPT71a4KOCDFiqlrRoOYEgVYvE+uKfKqc7WDggX7ggH
         X2+Q==
X-Forwarded-Encrypted: i=1; AKwUvBx/tWWqgIwysGEg1x85SJ4mgWYhLKqHd5ZF4HdUipeLn5pqEwK/rO+lJVuh84/1LFst6ayybTz0h7nIvQWlayY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLy+T5Lwq+/9dP9fYsALYqZq25wcDr5AnlU3IW2O8I/SwVNrS5
	afKDqycmfWVl/+HUeULPHO4nrtl/O1WTRb2fGxQaWGkT3RKrNN/zC5aO
X-Gm-Gg: AYBFou2T0iz0TWbjwfa7EpLn2Y0gBuNa0wgMGM9azsWd1wRFc9L5fIdE6+UVPfgrHWU
	0Bnn0HHLhlALVMVMlU+gu3NJVVgpfOnY9Ic2Ojw9G+LdNlYEa2OOlrNmv8FhBIaJKJrqzsE3m0S
	UGzVYYsx6WS82YgM58w6cfls63YFQQvWWU89QJnk+W5l2lmTxuWtIraZ8bdGI1cGq44ewuHOMB8
	lrt8/oA7Bb6j27HcgKAOpYdursakU/nH+yIJmPwB9SSo/P2MY6HPs+QmgGxQgMKSXzcZk6SNa8p
	7jovbohOp3lUyvVWu5M5KdaasJxLXuoqMB1Pj+U53VN9cmbpd/V7YDNu4vDDuwLSs30DdgnidsN
	TDMQ9HGLe6XpxadCXHAc8LltxxMlrXllWCgJcJzZUq3D0uzVn+3+8TGLUWEtflURhmrRFKh0ANZ
	X6th+AfyIJe4D5Gvgx3dZ0x+x2X0v9MIPMwaz4xsoXh8vpzjRbY76qVVc7+DEdL3RWj4cwEp8=
X-Received: by 2002:a17:902:d50a:b0:2e6:943:39df with SMTP id d9443c01a7336-2e842bc7e0bmr68793605ad.25.1791780808097;
        Sun, 11 Oct 2026 21:53:28 -0700 (PDT)
Received: from gmail.com ([2a03:2880:7ff:5b::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cb6sm38358745ad.60.2026.10.11.21.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 21:53:27 -0700 (PDT)
Date: Sun, 11 Oct 2026 21:53:10 -0700
From: Narcisa Vasile <narcisav.kernel@gmail.com>
To: Tianyi Gao <tianyi@cloudflare.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, shuah@kernel.org, toke@toke.dk,
	lorenzo@kernel.org, hawk@kernel.org, ast@kernel.org,
	daniel@iogearbox.net, john.fastabend@gmail.com, sdf@fomichev.me,
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kernel-team@cloudflare.com
Subject: Re: [PATCH net-next] selftests: net: veth: test own ndo-xmit after
 peer GRO toggle while down
Message-ID: <asxntk6HV+jmAlKe@gmail.com>
References: <20261010192914.83651-1-tianyi@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010192914.83651-1-tianyi@cloudflare.com>

On Sat, Oct 10, 2026 at 08:29:14PM +0100, Tianyi Gao wrote:
> Test that a veth device advertises ndo-xmit when GRO is enabled on its
> peer while both are down and only the device is brought up.
> 
> Commit 7a6102aa6df0 ("veth: Update XDP feature set when bringing up
> device") made veth_open() set the flag in this case, and selftests were
> requested in its review [1].
> 
> The block now ends with GRO enabled while the peer is down, so the
> aggregation check that follows covers NAPI enabled by veth_open() again.
> Commit c017800af5c7 ("selftests: net: veth: test peer ndo-xmit after GRO
> toggle while down") had moved it to veth_set_features() [2].
> 
> Link: https://lore.kernel.org/all/155aabf8b873bb8cdcafbd6139c42b08513e5fe6.camel@redhat.com/ [1]
> Link: https://lore.kernel.org/all/179165459278.434549.1711113374323842550@kernel.org/ [2]
> Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
> ---
Reviewed-by: Narcisa Vasile <narcisav.kernel@gmail.com>
