Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794359279;
	b=nA5/rKQ+uSdEgb3rczDRsA5BgVe7reZ01xftVtfsp8P2+DcFI3AU7UBIbQf2wJO0r2MT
	 0uQCih+eOUMbtB61MxmGw2uyrTglK//wXUhC5EdUUxYUi5hbQWxR55RkEswzPBQH9AbgZ
	 dQTcsSgikqIdC4/6qvMQ7288/DJftp3tvKyLSiSNGssLu3jhoWQwpK/6Eo8kYW5HDdPhd
	 bqADEjyFU4HXsQd1XW6aj+L3sciXsj0Yro619kMOr/jDyhvfImVstF1ZfQhMwb+5mpsY4
	 7y7e9jF29Z/wEAfUMm36DoYXJ8rGXLNilGRqgc3lOYqEfQetPHnMQW9qWdufgNyAlvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794359279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=8MFwGdApl0d4OiJqtJrDFLzpxo7TMPDirGuojCnnp6s=;
	b=bCmw1+wWNnnTRrvOtxctbrwmhbJjA4+Y9aWe6vh3J0Npzt72CBaEZojnA703JP9VJYDv
	 snuRQbn5iJw/vlwOLsstL9BgxuX/liS6Q4DJM37SkB6/Rmo4VteRMZzMSF18PTOOxVMz/
	 1L65BbD7rI5wYDEFyG6WmwI+vBcJ6z0KX6yXOvdDBvSls6ZEbGqQGdbJzlDLwHz8bhuR9
	 9lu8ZzjdV4ILv/JhsSJ3bgnkJneLKO5PV9+nII7FXK0mqt/oz6iZSNKyYO2kD+iwCKegZ
	 Rw43nbiVH6tET+BykEe9DdwTnd5DTagShDvXcUwtqLc8C3iZ9HPMA+nF+iXU8ZFFr/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=EjLXsw8R;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBF8606A324
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 01:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FBF8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=EjLXsw8R
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6df5e315bd1so2070708eaf.2
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 17:07:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794359278; cv=none;
        d=google.com; s=arc-20260327;
        b=nSz59gBRMSRRhd/T/1s38tFngV8BPTctkRaH7tEmmZMxovqy01IjClN9pSw2lubpO8
         nm6hSY0WNTzl4DvOkVld+djafVWEAF0v5uEZwPX+POU5omvbo47zvYCBRDZGgHvT/zY/
         lofuW4HwNR9LK398Zi0qJOup/NdevNpS8WyO412hoJsUdyrWeYiPPqodSnuPr3BcjALT
         GkW76LU0HNSMqsq3gNz20Dkab6JurLehq6hiGTxx5xMEp24nWjM5SoRZzHYE1KHknzrp
         HvhECN/94JXjOHllN1RniuD1zGhPsNw/YGKqDQkCQFzINSMS/OsZ3PpHg7g4B7/7bJGF
         /L6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8MFwGdApl0d4OiJqtJrDFLzpxo7TMPDirGuojCnnp6s=;
        fh=5+cENgOjWu/JSuKLSXbBEFBv12fv0Lvq7zE5vBNixA4=;
        b=sLcd/iAjZXsbR1KdpSYASxBgRb0dROE/PnHup/7ELQGnyLY1cHBXDy2We2c+CMwKhE
         4ZdadHF/7UbfZp8nHlJm/N/GocADHqrtVl9ZxE5XtfklQkQgjVuv9bPPJBAA10k9vpv1
         NCKxmYJNOiasK7lz37XQ1JHA7roETN6JtKOMrR5vFg0W88VLMd7qV3GFPv7jiaferYAX
         bbDtRzMGnqAqchPpPsVAqBgzIuA1GlGlZw0jwdv+Mf/KmRVLnk7/jDt2x5GpNqCz+MF6
         IP6fHjvnYbxH6ePF5oWn+4yOdo1KP53Jry4ngRovbxh9mebLnZ2hmQ+qXvOyn7eTRSJG
         RCtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794359278; x=1794964078; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8MFwGdApl0d4OiJqtJrDFLzpxo7TMPDirGuojCnnp6s=;
        b=EjLXsw8RYK9LddS4DSnzgL5BG+S85ls0lQHexUCxrrgOE8c+nbSlDaIhvMJmh3Eer5
         vXDdlz1/G98drqKh2hlkTWXUSxGkTgmok0qV2/fAFr71FqSgI1rOfEqm9I91pXhGhN+a
         fGhndmMZH5sQtIcdP2A7UiHMpAinpCQNyPuX/7J16MOG6BqZ0YCXUzkwK1YtUfg0GrQp
         Di4IW2RD0lI82lG0B9Mjfd+WCIP8XIOqnfufvF5iAwcdpNhJDSJ67VHK1ubTbL/9PMK+
         e61eCud7B1dK+MmTSNY22IE2hj2vuMWWhpkIMajTHeoeI5K75VM17Y4BrNZH7Z8DDmLy
         3Hzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794359278; x=1794964078;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8MFwGdApl0d4OiJqtJrDFLzpxo7TMPDirGuojCnnp6s=;
        b=yI3F1h5h7x1DTGWrTqk0igHy5K3XF/N1dzx0MEb+4qG4i+OGIRMLX9w5EqHGLFuXIr
         +TFwbdkOX0RHs7Fe932KfIqN+g0GPTb9lO/KIm675inczguX/sc1u6hfJxjHNeDZHjue
         0o+H48vBbk55y2ykxckxvGnhSu1GJqBv5MSQRfPuBUBuPpGKZlQwB7oN6TYxqvnik2wi
         6jDBfH7Sy2l9XzlPkcvhyCFZkegxlI7hn5HTIcfdPa4wdDT5ChC1/UKcl+ufR61NV0fT
         uq9MCrTiylg2utlHtEtQJyPtVOHSAKn1bHlVe37orO7W1qx1vGLE/oEpWzA/5/5XG+6K
         O00A==
X-Forwarded-Encrypted: i=1; AL+hErFKJNsJTjAMek90eLcGrmcPf4CWal3HL5eCVP2+nVsF5nqANzXyQiPvZ/ce8z/yo8ixm+SKnrBxGNQ2+UZkre0=@vger.kernel.org
X-Gm-Message-State: APuU4Z87CyS5Ykq+Loog2FUt11UZBSm2UIUij2HazW+SlINSeN/bGr6F
	d+hdsok9Fue7zNqqwjFNB+4CGvqxp7/D69bWl5JWn19NKApXB+yEQo/myw62BhBQ27YQrfUYb32
	Y7taWLWx4Zyn01xxeMb+FdZMS29UDwxe7RhpET96lLA==
X-Gm-Gg: AYBFou2j5O9kcvXS00d/OvS/2ZjxUKAi025WhZDXsc+mNiUgwfJWpWBhI/EeDRcAiy4
	siNRerpErssva7oHHmvckYz8vtWybP/EjdN0Ghh7kI00eUrx3T6feR1I2JZBw+lRmq5j83DwvpY
	KLkdbMqASem+82hP2/uH39WanRHZt8g3t9Hcky1eEP/E9H+H5LJFoxDNJLoOnaabQowqxsz9qsb
	Qw3065FATORJb7t0m9gjPvXcLxkWNahmBrBoAvonZt7R1IUm3l6uYt7FTmdvlc0wQ+6X8ro2tpM
	cdyCO4uXSBNTcj2hjsuaY8mo89DGHi2inmR2zbS3sMOvQ7Zj5DRqkKkAoBb6kOCJ1n5u760y+Xu
	j9RhS+7CWHh3QYBCHJvY7QApj/ZZOpVLdFVWD35Oto4GFmADdhR82olpwEyiPJAKYwk68mSXKMu
	kdhjfKeuO09Q==
X-Received: by 2002:a05:6820:16a9:b0:716:c04a:4771 with SMTP id
 006d021491bc7-71917858218mr598043eaf.24.1794359278033; Tue, 10 Nov 2026
 17:07:58 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794281983.git.tianyi@cloudflare.com> <avOvI8xrHI0dwyHj@devvm16445.scu0.facebook.com>
In-Reply-To: <avOvI8xrHI0dwyHj@devvm16445.scu0.facebook.com>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Wed, 11 Nov 2026 01:07:46 +0000
X-Gm-Features: AclHuK9OIHzq1A_ViLb9jLKzo-flUIoCHThbTHbypb5m7BOmw6IeVMdp_ZFoAAw
Message-ID: <CAG4wq-egD55NZDw+OKVKTKN2tQJ9oKEC504wFv=xoMXyJ-0z4g@mail.gmail.com>
Subject: Re: [PATCH bpf-next 00/15] xdp: add SKB core extensions to keep RX
 metadata until skb creation
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: bpf@vger.kernel.org, netdev@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Jakub Kicinski <kuba@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Vladimir Vdovin <deliran@verdict.gg>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Donald Hunter <donald.hunter@gmail.com>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Magnus Karlsson <magnus.karlsson@intel.com>, 
	Tushar Vyavahare <tushar.vyavahare@intel.com>, Jason Xing <kerneljasonxing@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Madalin Bucur <madalin.bucur@nxp.com>, 
	Ioana Ciornei <ioana.ciornei@nxp.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Chris J Arges <carges@cloudflare.com>, 
	Jakub Sitnicki <jakub@cloudflare.com>, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
	llvm@lists.linux.dev, kernel-team@cloudflare.com
Content-Type: text/plain; charset="UTF-8"

Hi Stanislav,

On 11/10, Stanislav Fomichev wrote:
> Awhile ago we discussed the alternative of adding setters for xdp
> metadata. Then the veth (or whoever turns xdp frame into an skb) can
> apply whatever metadata it needs (and there is some magic behind the
> scenes that takes it into account when creating an skb). That keeps
> the layout and most of the code outside of kernel. Have we considered
> that here?

Thanks for the reminder. Yes, we considered [1] and [2], and took
parts of them.

The alternative setter model in [1] requires a program on veth or
cpumap to call the setters for the RX metadata. We want to avoid that:

- On veth, an XDP program removes software GSO from the peer, limits
  its MTU, and can copy skbs from the peer.
- On cpumap, each entry would need a program only for this.

This series achieves the same with only the XDP program on the NIC,
which stores the values with kfuncs in the skb core extension area
after the xdp_frame. cpumap and veth take this area into account when
they create the skb, which is the "magic behind the scenes".

[1] https://lore.kernel.org/all/20250616145523.63bd2577@kernel.org/
[2] https://lore.kernel.org/all/aGvcb53APFXR8eJb@mini-arch/

Cheers,
Tianyi
