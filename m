Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793785141;
	b=C33f7uyEHKM1eA2uVjnNnmbfVBQ1N4zgukFb55eiJPltx2vcFN2Nd4MDY0GzFGjtWl62
	 zuLR/xaEvh/Y2b4/jBj8/uTqr4PsNeHSdHox4KjVXzREgwG+iWJmucj/nCwYn5bloUBt4
	 gaQ/jSKczHPXblNSqKPXWDra/m5MPwKOjlCysTM3+RwjRtyI4d2dmgWu+jJ13mUwrQTkg
	 gPdnc7n5+DZazCYUxibvoi2McWCQ3CMlv6EMDhw1x3zg5R/c1UNqeszFzi0RhPuq3XLrn
	 BpDJQXfVLavyVKsFl8JTMJw0BRNLirvUDh6NTpY/E2V4aSJqD361htxdAo7Bqz9YYDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793785141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wyMFhiKAtvEArgIfEIeRhVp7bZV2wi7+c/PirP/xKIQ=;
	b=HreLvtef7PkoNWyKtMu2IsEQE22WjyQWk85Eglv5HtepRpe5UWPBMYS5APRuRV0XjHZs
	 yliODHIEbzvihilMmUDvkWcjXurCEqUvv+ASaugeYfSH6PJNOKfx+5oDfrTjShInf/ria
	 P0aVULsn5vzU/5oEyGlINWw7U/rgdU/CqMmxh7ttlGzRyF4yeTzvLxYu9NqTYJh0G6zOy
	 zFOQE9eZxEfyV2OrYt0+DBIKR1tIlbdaOqUJY3566Rns7OSSbabEC7l1v6YENAifCYcuz
	 EJiiAaidN5QVEIdNDDgjJ07peU5IMBttbd+spYsVybyw1QBYjFD1eBXbw5uMef5MeUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MWcuwFVU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CBC606A328
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 09:39:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10CBC606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MWcuwFVU
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-8479f46ecd8so187622a34.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 01:39:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793785140; cv=none;
        d=google.com; s=arc-20260327;
        b=GIpuitUudA2rHd+nghUBlt2ghQoU6yU+5f++1W559o8WEVOkPsvaNDHTkPhWteh6z1
         R3ZT+h5kxsk1ElEvcfNgPYW3bBb+/GboaUUDw+NR2PpdD9gXX9vBvv8DRqb/N3nj/rBG
         q2Bv55xlos4+Z9v7ddNgNv5AIV19tbPb2VO8S03HFUmn0NINox69sv5IgN6CJ5eCjaOB
         cp7mctCghLkGUaEbxkViXmX5vQo4nlLXCnjSOGZxY3soQPVa3g2Ca1VEo+KaNgYgmZSS
         uXaK04rtXoyaliXzfzGnMoblVqBe/47EIZuVnInpzswUxwnBQvR/1n8Czq1nb/Na1HwL
         qbxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wyMFhiKAtvEArgIfEIeRhVp7bZV2wi7+c/PirP/xKIQ=;
        fh=D6oXdLH/nUc7astsE3YkDbyHmUe2+V/AF73HQP6k/6Q=;
        b=DjXAcg8U0hiH5trjMd44zPmjmPLrd8YYvbJXJYw04uNNOW9lv/kQiXczdURjjSKf3X
         2yhZSC4JIv06y9ZpLOYF0aOpATYXsaKFwGIctSIwYsuqIFpNZctl+r1e6jKHQn6xizZ+
         NnXa89gR2pVeIm6TC028Z6VoOa/qBTzXLkeE64wDTQBdpzDfRkjYUiq9GQ8AvUi6ZCWv
         vm6CGhubHzqLzqmM18AKzwhIKCWfdlzbmppyuCoFoA8JhHSRo3XMHRljMMq7CSWpNTmg
         av/lowr66d/t/i0weezpXoryqBabIw7DlHuTk2bKbv0tcaN7yYDYbgv7ixuusvXhasuA
         XJsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793785140; x=1794389940; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wyMFhiKAtvEArgIfEIeRhVp7bZV2wi7+c/PirP/xKIQ=;
        b=MWcuwFVU34g06UlUcqUa5sYEJmikRLRjgphlE29xhKOD4TvHCz42xKRoY64u6NKHes
         xjt2Kmn/+YdToNLJkWPcGxIGbaaJ0wY1ZJbTTTZQD3IF/wRS+fSSROUlI3wyd+yxnKYc
         GQPSHj1gm3g/8wCHIXZ3oe5us6mBgP1dC2jQP5aBVk8OhZCVs1sZkIcMVJMecAjJXasI
         Og2OaHXi7Q0Zb2oFPTlydcj73h3lDupKulNOH88sy8HBskjJam3fsiYqJeYOxJqCxyVJ
         TnTTf5Y7SydEjaXW/BvIYuv/FteX8czVREzaVxsDiMkx0vrx0ASemIuFyUYLSKPjT3Bg
         Bkow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793785140; x=1794389940;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wyMFhiKAtvEArgIfEIeRhVp7bZV2wi7+c/PirP/xKIQ=;
        b=TKhJV5wMdyU3rwxoMO1ne6ARGLvYLUUak3CfzykLXOh2VZqV6L17E5i8PHyKwZOqgI
         cqjiIPnOzqCGgQ0CtTe/sy9IlAC2cqBSh8bg5rk/zgEzP3oRN4KPr1SSWZsULMs9gFec
         NR6uWWmu35Bjw23g6k+k9fcO8eONMrgtEPDmHx8pw4EtZLclcu1f0dDoSiha1k0H8b4h
         u2fNqSBwlU36kXP9tMcYy/2jhXQsxUgvgKCA6B6K1TPdhjveszFbjy/NfVF8uTqeHjI4
         L0O3qjpoxMS/d/rMADPIk+QRKorVpRetWeq5hwBP37DebpihU/m9R8RWzftAKsh2I4hN
         S8zA==
X-Forwarded-Encrypted: i=1; AKwUvBwvWnaxrdNpMzvDLvP706Xu454KLj0v5Dbfa+NbaPu9QweVcyLRri4e88LeltW79R+FI4Met0xYcIF1+HD2lQg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UL8ICjXfBekkXl7vTOKCBDobwzE3tcTsZhgAe94xM+mjeQpEe
	AWaVvqZ8QKwPuiJkV/j24J+ZFwXonxRhqwKVkkaQQJb67EwFEMzFD7onxWj4luq4Hok9v9Ddnje
	LhWiXkwWo0WcYBwSNm59dOLxHXYYRQZM=
X-Gm-Gg: AYBFou0dmW2VVhUro7Q/JPyUMzX9vWmL3kI0vtMyx4FsXw00Vviw7nBJEF+AAni3TVk
	aKi2H0JDxCL+2wQ0JK+2fJEN09TEgTNWdenWRpwpuoqkiJyRUPtEI03InTJHgbIod3ASvTlzzCi
	o4W/KFrzFUZj361qXVgR0t7Q0IJLo1sGxQcaB+v3kVAMflzHUX/QZYOhIPKE3Ve714zGzqixWZ0
	rZyTmpshXL6fl7BR7JBqzk6jICqKwpU1gWkxsn/SReY3nvB54QjR9plu0kqj9f9UatDnKA4DVeG
	ux66pQxT6mHqOk6LNgtHVDhVTqRFMRn/E535XJYaKXKf8waNFw/5EcQjQ64v3k+EiI7KH07ckw1
	0Jf8TND14ZNRvO1M3RK1vLk9kYt/y748FNa5a4AcleyVRvNov81BdzrH8VVBgSJjfNulGzZMmth
	bqAldHw87bZhMnIlkEYBMRLkyT0+2KQPoFew5S
X-Received: by 2002:a05:6808:16a7:b0:4d6:92b3:5c85 with SMTP id
 5614622812f47-5640de991f8mr9890887b6e.66.1793785139973; Wed, 04 Nov 2026
 01:38:59 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103163928.641519-1-sashal@kernel.org>
In-Reply-To: <20261103163928.641519-1-sashal@kernel.org>
From: Ming Lei <tom.leiming@gmail.com>
Date: Wed, 4 Nov 2026 03:38:47 -0600
X-Gm-Features: AclHuK-ajlXUEOlDoBUIXIcZPeq0dPA_3c3hkn84_pIOTF1sCe9cDuF4iuz_gxU
Message-ID: <CACVXFVNJp-aWqLDR+Vy=VyNzHzPjGiTppYBYYGb=bGs5CvNRZQ@mail.gmail.com>
Subject: Re: [PATCH] selftests: ublk: fix the build and file offsets on 32-bit
To: Sasha Levin <sashal@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-block@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 10:39=E2=80=AFAM Sasha Levin <sashal@kernel.org> wro=
te:
>
> kublk puts pointers into 64-bit UAPI and SQE fields with a plain (__u64)
> cast. ublk builds with -Werror, so it fails to build on 32-bit
> architectures:
>
>   batch.c:379:42: error: cast from pointer to integer of different size [=
-Werror=3Dpointer-to-int-cast]
>
> Cast through uintptr_t. kublk also passes 64-bit user copy offsets,
> which start at UBLKSRV_IO_BUF_OFFSET (2 GB), to pread() and pwrite(),
> and with glibc those are truncated to a 32-bit off_t there. Build with
> -D_FILE_OFFSET_BITS=3D64 as well.
>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> Found with 32-bit builds of the selftests (gcc 16 and clang 21 with
> -m32, with and without -D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64);
> KernelCI's 32-bit arm builds show the same warnings. The changed files
> build without them now, and the x86_64 builds don't change.
>

 Reviewed-by: Ming Lei <tom.leiming@gmail.com>

Thanks,
