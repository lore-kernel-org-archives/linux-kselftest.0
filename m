Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793674742;
	b=FeEMewHsqESNBUzgoQbGfPO6/kvUVMsUK+OgnxA3snCXIgWPGdxsk2pZScV3uya+J/Ut
	 gzBqhVd/pl64lvgk/qhd27A3vsif8v2MhlGP28yMYdSSpsgMAyNiH2X5a/jn7LrkzeHmM
	 /B6k/CupP48l7RhrDFHfsDDFl26mnI6WLB0Th8drQAb75OLiIF7/eVnt2D49RRlYY5RQb
	 PWUQz4aWqDeb7ctvh+BdXrI6Gfv9s93O2dyyLfksoKT7Hl/UkuVj5cQ5Yws7gRk9dHWQt
	 xBzRY9l3oLxHieNLwe6jyDYhl1K1lEdW6n7rGD2ynHUhdbpu+QiDvCCbphLejd/Y9nA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793674742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UeAgzZLdotti0IHP6YHs9fQ/pnjZZ1tIB55pQGz1Z2g=;
	b=u1FlvHhtMXkbgesVttQxdNIqZj2TkTh3fgSJsPlRAn76modyPMLUC+HRznOhoS97fxyp
	 u0yE9OWhLxNf6WzGQrSTX/KmHOxilKMLutusQA4VtLANWsz0AP8CM/r0aHO5Nqs6pt/vp
	 fZqCoHqGmibgeQYRhPPut6bbzfu/cs2XacutKnvikdHMV531/JNUjsxPbffxY8u3rXZ+n
	 /jZU/1IfcCKT0mgJ2zwRMbxRTHwkL3uPRbVuIK/VUwIfR1ICS+BeA6aqTUKQx1hefs0H5
	 sr6Yj/EEcTGoS2JMlTKD5KAFIo+abRBcV+DgbztKt5dVK7mn4eXmfi3P7a5200jEzzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SWftFRzf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D921606A32C
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 02:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D921606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SWftFRzf
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so5016a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 18:59:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793674740; cv=none;
        d=google.com; s=arc-20260327;
        b=SrSa3WTqS8KDJGw977uikR6g11b3bIALl/lzx41QWxNHmhEd7RczP/HOaLxau9m8Rv
         FdiXgqiQ/WxDvpmWjt4qU4PSm3gaSCSOV0r/YqcEl07WX7yWv5WHvOhz4AbVDUa/Pf8D
         HM99WlFHZHqWEzqPjdtnSLKqjhu+UL5HW3nVrmZFsRj3KnOTtdLnrHZjqa4yyWNQRTSy
         XAnfnpNHgikZ+aYOdlv+he/CiQCB+GgryovX0tG26jlNLw6FAoLeBtJdMgrTA/k6QoFQ
         V0vB/3eATz9V80urBXebKBY0xyU2FG/sP+9ypEMAuaX8/PPxNPjIjQJ0I6rfewCat0ry
         bkpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UeAgzZLdotti0IHP6YHs9fQ/pnjZZ1tIB55pQGz1Z2g=;
        fh=rDVXLnZWraEmEGRDOM9n+tQa4Cd3w1nWv72XVrEKqyY=;
        b=BbsDYN5OiFp1ShIvHrUl9Rex0LWJFhB/RR767k8wUZS3z9WFNppQXSUHgilpFKjVMM
         x07UlGrFhUyGmXD92AJEf9Y7N7By/WsRfU/uv9dgb4hBhyXHeNzgTI5fnKYvOWUHPlDK
         t1G4gUP8k0lF251NfHRESwEpS7Vk/eh1Jd8JcExr5W/mYhmsJhYR7XdTvV/RVTQ33Rtc
         IoOds5SApCXHJEaJSe/0N1PJRs3+I4tJKKRBxgpJh+H+nUQTt7ZimxHYRVrwYTg4viHs
         0M1vBWUQ7Oynpq66jmBXC045vaBRt04YUCc6m2++MCwBXK1dERmiaYap++H8WanluSkC
         IWdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793674740; x=1794279540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UeAgzZLdotti0IHP6YHs9fQ/pnjZZ1tIB55pQGz1Z2g=;
        b=SWftFRzfsr6HRx4mZ7jlKL9NBy880MECjOX0cGycb8yBgGDCdwhmaMudA5uCPfnCsr
         12rC+qqqvmSvKFG7NqLjNYRVUZE34khfj2SjffiiS8W5B5WZr/ZYboQR6rm2ybo5agl6
         KXtEvNcgHqwKMkLMR95tW4NLAlMHOmoqEX0mXlVeJqVOqHwpQ7u/x7oYcJcbK6Whw0Yv
         SxHXuClHnSuLcYRwTHj9cfFqZT5eWfkatAmjmPJy9ZR93RGnD24qRv3ORgNWVvy0TSYi
         DHvVQHYtwo4qQKosyCBDfYGYqALpH+v6Yh7R/cORV1TV7J7hYBYNhA+WlDn9ASn3KBGH
         lUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793674740; x=1794279540;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UeAgzZLdotti0IHP6YHs9fQ/pnjZZ1tIB55pQGz1Z2g=;
        b=2q0iudes2PhysD73nmW2QABslE/7DXK48paeyKLMQw0c6uOtnKF3RjMpGXyuJuQV8D
         2zgnzUwBXtlwM9OuufRvz5ez3orz1AdmHLp1qtbTV0YBADrRxANZm42r66Kplc3DmQjf
         ztQodTgEMPTgHA+PQpJlGq4KZkIoGMkPfPseqTIz9IsU03EFGOEbk5ySNTZQQJtthilx
         5XWmUbUwvgk/KIvMsyGBaIlIrs2HW1I30Q7mhq/2ybQLCQ10qxtNlsrKlpNhKuXprC7V
         E3zkkv1E/TgUfGMcqg2E3frUxUdnsj+HA/MpujsckBnDHLlVeGHqailcokhRIblOQyB2
         zxSg==
X-Forwarded-Encrypted: i=1; AKwUvBzw6CMJwHta0tTg1i6Newihyqp9ZQLcCV2XE2Z3U2FTggcl+j6I7df+YIQ9Q+JBPeejNGmc6oycV4E+jcJgr3E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jwxN0xz71VvXZkMguV/LAmMg4R9ZZ4jH0oJkYaWwPJy5mGUfF
	fWTx7poqnEBR/mqpBT2LSRG9SDIjsq4vxv3XJ7oykXqu4Oqiueeo0p3zP2eL8+elu2uekLvlLAO
	Y6KlRB4I0837f0LMAkpjGmSsd1y75meUWGOfISTLx
X-Gm-Gg: AYBFou23FEDAXO1tBoJBm9w7RTFbIVLOoM7o9MrNBl7e0CE0dUHnnXuBpF2DqVtNSsy
	LtZnPtuJh6PdVelUcJ4pIMGgyCe1Er58Xm0S4pXuAcwFyrR20zNEwH5LZuvXZH9ey3V6e6grxXr
	6Pj9YsT7O5+CSpmw0SPeNIAHIeCNJ+D4Vl99jxGbKR1bc56a4OsBMb9bJKO/y3eWG/Jm2HiGzIV
	Ll3A2mZGfoFVVCM2Z1qyIs/vPxgC7/mkKiQchhc4BopIbbMVCCZs3ueExChpDsgnlv+cv4dOUGK
	Zav/Wb5enBbjrBfShKFJRj+78LQr3WU3Rjt+brM/DGBYPoIhk7dxcztxNBgQKdwv39fh+Vp3d6i
	EzyT0eSHBora5wn15E7ac1X6HedD4qlQG3lnHxqI=
X-Received: by 2002:a05:6402:438d:b0:6b3:f12d:7405 with SMTP id
 4fb4d7f45d1cf-6b53e778d41mr32077a12.14.1793674739712; Mon, 02 Nov 2026
 18:58:59 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102191438.1059771-1-sdf@fomichev.me> <20261102191438.1059771-8-sdf@fomichev.me>
In-Reply-To: <20261102191438.1059771-8-sdf@fomichev.me>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 2 Nov 2026 18:58:48 -0800
X-Gm-Features: AclHuK9Z5oWBbhWwMCS_z-DuUMSaT3p8QPAgg8n9KeMCHplfWy0Bv6rYsGa7af8
Message-ID: <CAHS8izMyGmLC0yg+WT7eAZ0tkSoJ5K80t-J8-WfYegvjDXonMA@mail.gmail.com>
Subject: Re: [PATCH net-next 7/7] selftests: drv-net: devmem: TX from a
 hugepage-backed dmabuf
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
> TX net_iovs are now sized from the dmabuf layout, but the TX tests
> use a regular memfd, which usually keeps them small. Add -H to ncdevmem
> to back the udmabuf with 2MB hugepages and a TX test which sends a 3MB
> buffer from it, so that frags end at and continue past the 2MB net_iov
> boundary. The payload has a 7 byte period to catch offset errors.
>
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>

Acked-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
