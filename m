Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793651482;
	b=ktfuY24QL6sYMu0UFovEOl50vGYWI+K1uhkf5rNywb16oRnvPQXx/+sYk33g1SJJBGZe
	 H59swDMH8tBHHcV4M3Snbto2hBxCAM/wPg24fDFmcD1WnfOUMrmgKT7Lr8+RZsBv6fasb
	 rMsUFtjdne6Z7L8fDftMDpicheKsAbDanTK+OXXhDtp47YMtvZeXj6GSjlnluqnWcoap8
	 jq5yuVsGjZdXE6Ce+Ky+ES8lzysXcXOfCbY62G4OWU8nrb++2vBg4YhboqaXFpT8S5fwU
	 O5mQv+kkOI092BXyftm5pzAx4D0rUphKZH94wTf6O1fjgb/vCNBlFLEUbu8QaCswlIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793651482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5RwrqFV+JAK3ySp9u6e0Zx2PkbN0JduCY8deT2c09So=;
	b=Y1pp8MnUlqm3tC8mOcbuS2qIyD9w0fDZEn+1qcAArFv4qg4Vi5gK0xMrpZtFUe3Y+baI
	 J5F432bqTgxl4aqi9VuCrjOkgne2nMGwSZrU2mKxsESL88LlMEaQBXIcGLCApxx5KFqaO
	 soEfJ+ahCASdKCnHZZNuXH8pLUZvNgl2yz/TWvMcApWFFG8ZPRYVwXSsCj7sHdULJJJHA
	 kV+WDyUdR39QHCnpoXuk/UqEzbiBglLxzXjPmJDlj+cq/HDPnq0WmcuAyowj26DXt3Q2O
	 oR9pFF0lrzLos2wneXADDDe+hCes7d7iYjiCzXrLZUnPeHwIwLSmUdiZkT1AdHDtSsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RHJlzlK9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D34606A332
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 20:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81D34606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RHJlzlK9
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso2117a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 12:31:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793651481; cv=none;
        d=google.com; s=arc-20260327;
        b=DsAeaoGaFcrwE4N3d/JmuYiLgXNxSrvKs9CqCW1EHdGhAJaokwrsnpe5qXhiVP/a6L
         WWPnTZDs+baC2WOOa6r/Y1/DGd/xUdMrPxy+QPSDSAyIzhqimQVI3BKKwcMEbaNIRuYy
         ZQVRaMBfX5mSjIKZUYfWb2Lai+vxvu3lsYXyWEOFu1cP+/G6eYbMr4bXiv8CWK2JxdIZ
         Gm0wX/QEed0foE1CfrJyEfvpQ8J8uzRQ2Q0lGnYbThMmsEvn7UJQoNNAL2C46xI26s/V
         /xW+f6hvnlXDqzwf0sWApjXkprzjsYt6J2J8cV6NClrtBf4WREUuQ/V6jtD+e4rwfw6V
         bGKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5RwrqFV+JAK3ySp9u6e0Zx2PkbN0JduCY8deT2c09So=;
        fh=r4RVNp75YyYJ0tAXFNFI9VYzvi1jkHZHEOWn02uwb+k=;
        b=DCZZWh1QQuy9XrZ0KjYbJ5nh8XDS6iztKn/jqMdMyyYYqtBjS/FX9alFqtFGzRcRye
         a40cUYU5qqpFiKVAue5RoJ3SSqZRdyywlMolivpjbsgKY8REkzpRAyhYld30oTu8s93Q
         hYnfRb6pH+TIvjzwnWnN/f/Mvt3AsIEqms0rr7JW0aE3qCzDDhUTB6q9YbctCPpF4UHr
         xhvYsLdLb9ma8JJecTD2rDXjcUKFS0e0Ndk3Sen7SbkWdYQWnKXd+qgo2WhZSdZZTbCR
         ggOGyXu3M3S/Xgu9PdQ4zoG/KlkiR2wQ4qFVEwj4FsNsfNaZxIz3j7jkOClx4w+ToBP+
         Cu6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793651481; x=1794256281; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5RwrqFV+JAK3ySp9u6e0Zx2PkbN0JduCY8deT2c09So=;
        b=RHJlzlK97bzgvXNW3xL3lDaxN4w+2qFJE1LvMY2LQLzINz9zP/BXIKEYZFP8bTVh+A
         EuulrRQH2guD6Utn/XukATUgp1NTEYUsdzmamqkRjQqZiDi9K2SIsNujmk46Qm5y6JZf
         uIFSGrR990BOymBXHS1Tszzj4O86/1RwSR8bRNWPN2MZgA6SHuPNrcuPBptrZ5rhkepq
         lFcQtooLnqodgchqyzmjsOI+7faMvfesXvFaJ8Al5opVkj1T7uoos8Pe2du1wsPrZi1t
         w5DMRvVWUzkOF2Pn1RzYh0i2fUWXYvngpVGHQ4W8qiTOWH71A2iNPDwDZ+DiK4LqnDDM
         h3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793651481; x=1794256281;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5RwrqFV+JAK3ySp9u6e0Zx2PkbN0JduCY8deT2c09So=;
        b=K7sLwy4drmumVCWahT5dcY7O6KvI+Cklca96tlobLyYHEPZjQ/ph6TddDOHjOcD+pv
         phrqSzqQwaCQz9w74rUatpx8gLrB6JIOabtJm4KPWEMQ6fEAoC+dUOfi+fJz9B7XtCYC
         Xaq4DAOnJKK/Ux24yhmLmChDdpt0+Q57MxF4uG/ZeeiVBJEmPROwul0Ih3Bwwoc/SeoH
         aGXgyoI1SvsgXesH96cA/0G3giucvufoH6cmlrinoTd1B98g3qOQgcQAUX8S8IziOsRq
         YFmBWm2FpMzLS8KaaVyUNGGwsueR/eWgKPOlRc+hlkHZ+HMZMXmvft1xNVZhTIc5Jk5g
         MJhA==
X-Forwarded-Encrypted: i=1; AKwUvBz+wHg6hrKV5jfD51g6GVJytFYesXMwgbyrZTu3GbMW109njzfkbcjxvnwuPd6ynCJhJbPeAFZfGnep14gCREs=@vger.kernel.org
X-Gm-Message-State: APuU4Z96S33WL21+hSszcr7km8MDwLSBOEFgKfHc4ASq9UEawg0Qx/eO
	/3HXfYNkEq4OmoTLzklBZaPAelkfJ1Xicd9yYMe7okmlst/7SJc1uiX2Wr3XD+opVePwgTigxQe
	4tvhwGnX+ODZh5Rj8HaWTL7a4kwLrC9NPUXknwF+3
X-Gm-Gg: AYBFou0xRbUMDsZcb6YM+77aG3eubDn+cFKU+9Rj+3aXt1gg4DzYiDGuQ7o4M7NmnjI
	rrtixaEdsPI7Lcu+vM5VJXs1GnIoVM2qAuU1dg/m2NZkgtaZWkfh8o+ZoJXqZtFURy23sJSRzKX
	ok3cEJZV0DqZbF0FTktty9NrR7EySxFrmGSuQTa+0Y0AKRVEs8tIDwxJeao/HQhlx+HpVnmvCqB
	FindwD/+lhoOT05/iYMGKHULiaSGt7ImtijKMhmufN8vbWTB/NCIznN1eRcLV6ymGdFvSceK9nE
	WFkyXDX0zr3zi61wf9QMfimVt2FgpDIH6JZRKf2/j8PPnAB0OaybsOYf/62DI5gEIB8UTjqsL5C
	ka4Hrb6bufrKBeXudlYu4IQJ0szkonZ2/PJk4AovZ1jmAyoV3f0LZiMZ9kgNBTOEwA6k=
X-Received: by 2002:a05:6402:20cc:10b0:6a6:7dff:61ab with SMTP id
 4fb4d7f45d1cf-6b4b42b3ef0mr308863a12.15.1793651480477; Mon, 02 Nov 2026
 12:31:20 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102191438.1059771-1-sdf@fomichev.me> <20261102191438.1059771-5-sdf@fomichev.me>
In-Reply-To: <20261102191438.1059771-5-sdf@fomichev.me>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 2 Nov 2026 12:31:08 -0800
X-Gm-Features: AclHuK9XRqRq9bYvRVLxJXUkdgt5z_NPqmaDip-9Zrh7UQsi494jQFBIdl60e9Q
Message-ID: <CAHS8izP6BmNJLUdKR0DpqieOVXreR7ycKWmVbtbBtP-kHy7HOg@mail.gmail.com>
Subject: Re: [PATCH net-next 4/7] net: devmem: add a per-device netmem TX frag
 size limit
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch, 
	edumazet@kernel.org, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, michael.chan@broadcom.com, 
	pavan.chebbi@broadcom.com, sdf@fomichev.me, bobbyeshleman@meta.com, 
	asml.silence@gmail.com, daniel@iogearbox.net, razor@blackwall.org, 
	leitao@debian.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 11:14=E2=80=AFAM Stanislav Fomichev <sdf.kernel@gmai=
l.com> wrote:
>
> Devmem TX frags are bounded only by the net_iov size, which is about
> to grow up to 2MB, more than some devices can describe in a single TX
> descriptor.
>
> Add netmem_tx_max_frag_size, U32_MAX by default, and cap devmem TX
> frags to the limit of the device the binding is attached to.
>
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>

Abstractly LGTM but I'm not sure why this is TX-specific. Didn't we
add non-PAGE_SIZE rx net-iovs? This should have been a problem then.
Either you know what you're doing (maybe document in the commit
message) or we need some more alignment on RX and TX.

TBH I was dissapointed when LLMs started reporting that
binding->vdev/dev are treated very differently for RX and TX and I
have to write a cleanup that consolidates this:

https://github.com/mina/linux/compare/devmem-teardown-v4...devmem-lease-bin=
d-map-dev

I think maybe my reviews and yours maybe should be more mindful about
keeping these memory things consolidated and as much as possible not
RX/TX specific.

--=20
Thanks,
Mina
