Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248961;
	b=IzpfNqduWlFsUiDIzoACLPjVzvSwwjWIwFgpvTmvWOEZkxEuPKN7gnZoetyjrlwuL+hI
	 ygLLgKWCoCr6W6iendYZNyK7HsEe3HOJidPcX7bHTrC6MplYPZNDLULWpzmIpn6WMBIzE
	 h2syok+3bN+uk5LirtrAopYd57Hcom0khEEM2K1sV0D7aoqPsQNr1hJZSnkAyTHeU5wCL
	 C6Q1ENlkLhy69TolYaOL/wa4ctAff/MJOGJeVY6OS6kcebaschH8toMHALs2bO8XPkrf4
	 FaD2WJRuIf9nDGE9AjZ0Yk/s9zI1eNLdo4cK0WVL4pTMncIAOZGGvcj9UdGJ1ei88tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:In-Reply-To:Subject:Content-Type;
	bh=TyNlOaE6r53YabDf7NgKAHxeTjKkEmLPqy6LNOwpSOw=;
	b=mWvcg9WFMLVn7cKz240SLUXcW8ZECo1ik/O1iIKnhPIYsG0JkLc51DYKI1MBOmbYtpFe
	 11BNlSr5R7x0xCgiOg9IyxmFcydbYLCV5NYGBCgv/T+A8i7UAh5faOejiOne9BKmZBKN4
	 5AeKKms/Z4IOYuSTjV1Wzq4pXFE68vsLWcp8nfRfRQH86oNshWsS1YKNW8GItdJ5+gXb+
	 nBHZ57bwNZsYqyRBNX5IJTPXVXIfvy+Uu+5O1uYizB6beuqjbynW7FnRvceNgvJvebSgL
	 A9weEGX6htTa6Lz6kfH+oleI0yMAkMwNQ+8SImUagiGA4O0iFHGr/8y24ivUWfhqpAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wVPmauA8;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD18606A5C8
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 18:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFD18606A5C8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wVPmauA8
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36f936424f2so503281eec.1
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 10:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794248960; x=1794853760; darn=vger.kernel.org;
        h=content-type:subject:in-reply-to:cc:to:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TyNlOaE6r53YabDf7NgKAHxeTjKkEmLPqy6LNOwpSOw=;
        b=wVPmauA8OdLBNUi//iUcElADcRibZhBlYmRzMsqGWZwocRzhlB8pAEZUyTVONutmzP
         YHGl7m7d5gmKZ+kHy+amcdGR0AdGQnPC70uqhqLev+qT0zS5gLE0OQedk71PD93HuDHe
         d4AmF+8Op5QqLeFTRnHezx/ld31iyUN1GiwdR9gI83FoQB/p3kN+M6POA5UihECgoHE8
         nuCiIhx0et4FR8tdMwbyimQJYCdpUxlrmR1+YMHy6otayeUpxcz8AVkru0zzf6Ais/I4
         VVUtRfQ+Vg5feQX7YYsyKpySiIOvAMZA1iGgR5VhnDI5k3Uv8f3/btggB3XTDbZErZLZ
         HL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794248960; x=1794853760;
        h=content-type:subject:in-reply-to:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TyNlOaE6r53YabDf7NgKAHxeTjKkEmLPqy6LNOwpSOw=;
        b=c1H7iNbPF82cMK1ievSPqUSBGTD4OcT6tJ97/3Tdrfr8a+1NAVmJuuNj715u0zN9p8
         aDfWinkNo45pTKc5nk59WpnppzcTnJw3iyb2x6X65TlpBX+NLTo4/sI67bRoy4jsxgEP
         OPiKV+/Pd6IkaPLOZQMCDIznQO8EzExacFfo2hv67XuZA6xFlPV+tJ3I5+LgJgjGlhGB
         wxjj/6rCjqm1kV1Q60ZN/zORjUkUvacz8ZGReik01SQ/vE41Ul7qqwW1/RTOi/uTyCa3
         AKk8SLP0wwvL6H4ckI2SeXECEgTVDtNzgYoHC8xq/QpqXvWzc2X3zj7sk+a9N0GgOJfJ
         U1EA==
X-Forwarded-Encrypted: i=1; AL+hErE0o770k5tpbcqSeKFu0m7RC6Kuv/dog+9Cex6vmZ4PdqOLeWYIMwZAHBqErEbpka8AEQgsW1fwFuzDgkJBpyw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jZVUamc8mhlWI3fWcFvaIIrbemQHd4KHKhkDFe2OZ9/gwhJrG
	eW5ealpgYjKCDhQSGUFFy8ZdLO73yL8M2+zIMBLKUAyeFR1mh/RfNdpX
X-Gm-Gg: AYBFou0tTscSWBgXBWovWWsJX1TIJbcCas2FWEXJUXrARNtoqwEamYfvDR/cXyniXPF
	iBnAUJkF4XmyeITWVDEU6EjzGBRolstN9sxn4dXw3AG7QJ8Za0zLT8SbiJ3e+UIe5tPaNL5Y4QX
	7Os//ge8BA+itt0GNOqqvZe65JWOKUdFjHDiram3MAQ611s8RbV7fiABh5C/RCQvvIMVNsgF6l4
	JzhkY7nwPbdhPaGE5wfrp7Du6A1dIJkFsX/mnKmKnvhIQr0MwZLg5PsNKRV2LlgZy7It0rEuWUj
	tS2FRPl8C2eZbnARack8KgyVCB5NX+CMFUAb9anzFgr1rVro0KRyXU/nzsDzYfOaCG50GdCxB+f
	i3th5I+XP0D3xFF+uPK00X41P2eyKVPJ73hIlD9NaoWUAoH9Lr9G/+3IQv8IYLJpdLP+a8671+1
	PXzb3uQjjM61YGpHOLF+PX+AFPVnaXx4uQLLAHUwpW9qDL7H4jORq2M4tDp7qzeIGsseirMj6/0
	AuIIRD6iGi8WmFctw2CtiFWJgzWGXNei+J9EL4nGu0X5dXs/eXcapLLuhCmhWnOIjAQYbLPjEov
	PVoh/F5SHNB7aAkvUBWdf/w=
X-Received: by 2002:a05:7300:e9dc:10b0:36d:3c0f:cc85 with SMTP id 5a478bee46e88-3751c82b5e5mr145592eec.5.1794248960011;
        Mon, 09 Nov 2026 10:29:20 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:41::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520512ec1sm99440eec.12.2026.11.09.10.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 10:29:19 -0800 (PST)
Date: Mon, 09 Nov 2026 10:29:18 -0800
Message-ID: <8025f6aed4bc33298e8be50280ab72e4@gmail.com>
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch,
 edumazet@kernel.org, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, michael.chan@broadcom.com,
 pavan.chebbi@broadcom.com, saeedm@nvidia.com, tariqt@nvidia.com,
 mbloch@nvidia.com, alexanderduyck@fb.com, kernel-team@meta.com,
 sdf@fomichev.me, dimitri.daskalakis1@gmail.com, almasrymina@google.com,
 dtatulea@nvidia.com, bobbyeshleman@meta.com, asml.silence@gmail.com,
 daniel@iogearbox.net, razor@blackwall.org, leitao@debian.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-kselftest@vger.kernel.org, leon@kernel.org
In-Reply-To: <179418738174.994134.464817117967884735@kernel.org>
Subject: Re:  Re: [PATCH net-next v3 7/9] net/mlx5e: lift the netmem TX frag
 size limit
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list

> [Severity: Low]
> Is U32_MAX really the largest length an mlx5 data segment can describe?
> The commit message says:
> 
>   TX data segments have a 32-bit byte count, so devmem TX frags don't
>   need a size limit.
> 
> Bit 31 of byte_count looks like it is the inline segment marker rather
> than part of the length:

[..]

> Would a value that matches the hardware, such as (1U << 31) - 1 or SZ_1G,
> work better here? The commit message would need updating to match.

Let me switch to SZ_1G to be 100% safe.

---
pw-bot: cr
