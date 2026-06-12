Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D930535C1A1
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 03:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781234110; cv=none; b=PkzSqNxigccyCSddttBxnl5ad7pVc0LvY/mvTHZzDtFkuXKPw1G+XIFGUlvwt3U6YivFyFqdBU0MTtgy/roA11w1C5q4wzcxTYwwK5Liut/z2pOl8GL8zFE3IfqfJhp+kIcGG4+9ef5dRKL9WPQEvHyIU1aBrsLKxo/mdEWSRlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781234110; c=relaxed/simple;
	bh=V05AsWAa1UWGRukEpGKz9sh81+TnR8w8ANVgPsPOj6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xiw46iH4z0nannblJANQZnboOwRtwZdb+0+no060H0xwKtAA6fybehZdLwuyFpCHpKa4yPo7nk03X257xwjg/31/6IiZ681DQy8IPS0khHlNQNkWNogbxgHSjRVQ1CJ/q3IepBTidKbbkLIdVRnG1qR5FtX3aFDi2HGlK2X+NNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I/S1rx1Z; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I/S1rx1Z"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2bf237e1433so5583425ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 20:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781234108; x=1781838908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V05AsWAa1UWGRukEpGKz9sh81+TnR8w8ANVgPsPOj6c=;
        b=I/S1rx1ZV07niCbP1Y8v/ASVKVilCUyueX8+bRakpf1i89eT2FkQth4bQb3ToSq/CP
         +TqRkahRLV4rj9bWQhu4FDMPex6x6G3ISAOF8X1OUtrn1kxVsFwUBR/rIHDC0fPeQz+S
         4LcjaSdEz8Of97ZtVhTYk3+sGIyOxdncxVZiCm0l4K6mrfRur06NrhJsDYDsbDNbXuhk
         6RjhH3aWNqP9IFUWG3I1pWx0aM4e5Izof5p6P6KoguYSCa7pOeCKcKzRcpAPS5rc5X7A
         5qSBm534NlExkHhxL3snmJjtYu2jWMH3pSJwVcNLJDbSL6mS4zKODsvSdwxZiEUj7KqQ
         PLAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781234108; x=1781838908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V05AsWAa1UWGRukEpGKz9sh81+TnR8w8ANVgPsPOj6c=;
        b=YQJg0bjI3M/x81Pg6xShNe591yAIn3b5xPM5oVWb9MR8EfbwH1oICvFwdKmQq2/YVO
         zjxrl0TLw2QqzTW2oyh+6XT3l+G2mPYJ1keyZOZnHyKMriYM+MRJP5Pz6pF/qmkNbMT1
         sw9/uSfQh8kt4gq1IZMHittbARwij4vrhFhkXrkMxzXrGR2OgFHSZ7gzMlh4eouwi23a
         u2KheCeUgbdotJ/9NlCfVV5DMVzE0atxmh6TUuC3CJpR6f0jNEjMDOqmdEcpz15Bg2J8
         7WU4L/VtSU1wvFFqmg/s9kwjpLbmeEpDvlM7wQjkiRk0B+lfYYEDR5g4m9D+nwHvdBxD
         bukw==
X-Forwarded-Encrypted: i=1; AFNElJ87wbadBIp0zRRnGWqUJa2Ml8KxlA0yIy/xM2CveVi5x32ooTSWmwP7J3sBUK8vq1+g7/T3CEJcuclnCU7QY2s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6vjFPWuV4l2gq66xf6L9118T2Vxx/9bT9ijDznWGlzDCORtaI
	bieUNaXGk45jMxX25xFJnxhSVRFIBYDZ2A7nAu80XoF6meKoKTHgyuy+
X-Gm-Gg: Acq92OEZ0JZ7kT4FbAZbEFpRanbswk68TK57rA02M6GHTkAWQgyIhAD1IbFNIRWlr+2
	a0w9xXBt11c8URwSx4xHyiaLq03Vno+OQNR0uvzLp6arnR5KbGHzrgWF9C589C1gATwdNBLxW69
	Z7QBp/1d3e4XSTb0RCdEeOI2HnXiQPbjsYDRMx9qzfuJ8mVH2jw7j5AXRA2wrP3yh3IMR8Ajz/9
	dmzPiAMUufuUgtVRlLQhGwxNSQOy/QyeN1GJcLpZmPMBoBjxF5YCHwfkijGgDxk0mtdprcxmtGp
	iShHAt03vJcP7JVlXVDVFZ8foxGF9asFqobneLlP15iXhEDtjeLEmfvmO/q/ufRNYmy1w0ObBLU
	ZxeFFIM+uEp2sgU9EhGw8+MtbDZQjb8exvA6D4bMO+hKo+hXJ0RiY4zvI420NDWQb9frlM9MGFO
	gdk0SYAs9FJ4yzcNQP
X-Received: by 2002:a17:902:e812:b0:2c1:b8af:18ab with SMTP id d9443c01a7336-2c411d7a10bmr14275715ad.19.1781234107996;
        Thu, 11 Jun 2026 20:15:07 -0700 (PDT)
Received: from dev ([163.43.103.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327acab5sm3637705ad.40.2026.06.11.20.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 20:15:07 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
X-Google-Original-From: Yuya Kusakabe <y-kusakabe@bbsakura.net>
To: andrea@common-net.org
Cc: Yuya Kusakabe <yuya.kusakabe@gmail.com>,
	andrea.mayer@uniroma2.it,
	davem@davemloft.net,
	edumazet@google.com,
	dsahern@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	justin.iurman@gmail.com,
	shuah@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org,
	stefano.salsano@uniroma2.it,
	ahabdels@cisco.com
Subject: Re: [PATCH v2 3/7] seg6: add End.M.GTP6.E behavior
Date: Fri, 12 Jun 2026 12:14:56 +0900
Message-ID: <20260612031456.4164970-1-y-kusakabe@bbsakura.net>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260605032001.2f46e6a55f69896d29da69df@common-net.org>
References: <20260605032001.2f46e6a55f69896d29da69df@common-net.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yuya Kusakabe <yuya.kusakabe@gmail.com>

Hi Andrea,

Thank you for the review. The points shared with patch 2 (NF_HOOK
split removal, drop reasons via your prep series, reverse christmas
tree, the missing frag_off check, BAD_INNER scoping, the repeated
size-selection ternary, iptunnel_handle_offloads(), the fixed source
port, and the RFC 6040 wording) will be addressed as described in my
patch 2 reply and apply here the same way. Below are the
End.M.GTP6.E-specific points.

> SEG6_LOCAL_MOBILE_SRC_ADDR (the "src" attribute) is copied verbatim into
> the outer IPv6 source address. In patch 2 (End.M.GTP4.E) the same
> attribute is used as a template from which bits are extracted to form
> the IPv4 source address, and may be entirely unused depending on
> v4_mask_len.
> This UAPI overload needs revision.

Agreed. With v4_mask_len gone, End.M.GTP4.E will not take src at all
(the IPv4 SA will be recovered purely from the inbound IPv6 SA, see
the patch 2 reply), which removes the verbatim-vs-template overload.
In the new SEG6_MOBILE_* namespace I plan to give SEG6_MOBILE_SRC_ADDR
a single meaning for the IPv6-emitting behaviors
(End.M.GTP6.E/D/D.Di): the outer IPv6 source address, used verbatim.
The one remaining non-verbatim consumer would be H.M.GTP4.D, where the
configured address acts as the RFC 9433 Figure 12 "Source UPF Prefix"
template with exactly the 32 IPv4 SA bits overlaid at
v6_src_prefix_len. H.M.GTP4.D posts last in the per-behavior order, so
if you prefer the two semantics not to share one attribute name, I can
give the template a distinctly named attribute in that series.

> udp6_set_csum() already handles the CHECKSUM_PARTIAL + pseudo-header seed
> setup and also covers the GSO case. Using it would avoid open-coding this
> sequence.

Will switch to udp6_set_csum(), thanks. It is also more correct than
the open-coded sequence: for a non-GSO inner that arrives
CHECKSUM_PARTIAL it resolves the inner checksum via local checksum
offload instead of clobbering csum_start.

> seg6_lookup_any_nexthop() already calls skb_dst_drop() internally. The
> explicit call above is redundant.

Will remove.

> Nit: fc_dst_len is int in struct fib6_config (IPv6 prefix length, range
> 0..128); the (unsigned int) cast is not needed.

This check will move into the attribute parser of the new explicit
locator-length attribute (see the patch 2 reply), so the fib6_config
peek and the cast both go away.

Thanks,
Yuya
