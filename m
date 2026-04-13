Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FF51D6BB
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 00:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776039334; cv=pass; b=HPLH6CbtGAdoRIeCRabjVTnUZqnzL38wg3mbKDuP28i+GC0UBbAwQdMD8hSuXy6oBL1iou7amkJEvFqlUOlWGxHPK72TE9W24pdyd0nJQhjNETduiGz0CNTi22Gx8Cz0jZhsPA5IkTTAv3jUlcgcp7QGX0rzQDyIr3vQfuf5A5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776039334; c=relaxed/simple;
	bh=Bc7qQZzyiNRpV3OWkFvuiy4V8mNnpMrll52klrXJfPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cFeEGAYtfJYq5/lq8X19D5ubHWmAiDKCgN0ZBXLRzZVVnnRj+bsRiONRWcI1Du8v3qfGDMNZeN5uwGYNDxPA5ZpDOwFTu6ZyZzKL7TEIpvslI7niZP0jTI8dP+UHf5Q+77JztZYxR+TtS/3BhhHiaU0EzsiWIWQalPAhkOTQKv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SgGXo85Q; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SgGXo85Q"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d7badbd7dso12292f8f.2
        for <linux-kselftest@vger.kernel.org>; Sun, 12 Apr 2026 17:15:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776039331; cv=none;
        d=google.com; s=arc-20240605;
        b=lSQWJf5XrYwSTHGJ0RuVm08to6fgPNOl+82l39BLqKgFF2EpMSDwA8ygrqenlciXsx
         VndtmVlEOQvfo/SHYGXxPhPcl9+iOC6vix2hS84uBbVEUYBKL4pa2Ooy5vFhI/xFOFcn
         rn2cwU5Dck01h0syqHHjHdEjZQSYuqS7l57xfADu5NFaYdP58A+I+tdbmqCOoz4rlTvR
         eaHRAIVRgTQ6MVGCqH6buKRRtyeBPOPBGwNaa3nnnWR3As4IBz8dvxgC9PfUTJW3/J/p
         76idGorARstshaKsdon2idENeV4reaRUPeAzRLBD6O1sydNyWZJFmgM2FUHBb7Qop94e
         s2aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/ZjAoNv/0bH6d96ZJoX3aNNUEH/X9X2mePXXADQJKVw=;
        fh=Zm9pKu3DN+wlcIO853YKnWKeg6wC3GidaHW39/AYhDw=;
        b=UtCI3jCc4vayWF8aEG/I1CiNfnlxdBLpy2kgbGJ3hat50MQ23HZAmEUm+Oe3dphjx0
         i4sZE3uTre5e3PxbmlKlcmsOc44DneA7w/zMzgTDh0A2S8NoW9B94vQXNktH8m+/FI2p
         XUt2IrE5t+3AFGxtOtCNCWg7ZF6LdqLJUQwcNuMdD9t1Miw6lssSlT5HIHrn+KOWLZ78
         ASOXXS6VOAQeQazQegIOGjT0+4PRPddkP+0apOdb568QtcYoEEaQ/e7FWyC52G5+MERA
         GgEeNYjP5rzAU4+krr64HoE2nQzyxBcCftDjuPE3Yad15JNepYfJqjCUvfM4yUPAsZNd
         bXMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776039331; x=1776644131; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ZjAoNv/0bH6d96ZJoX3aNNUEH/X9X2mePXXADQJKVw=;
        b=SgGXo85QiWhnF0XUanoosZE7Cm07gc70RpX1epZgTIoQ95BEKTREhWcppNBEjFIgn8
         FsiDiXNM2JGeqm/jATfk1w3YR0TBU0X/XFuwiSaLW/UI/5pZhdM7g1WHS7DrvtoxuJCG
         M8JFOk6b5N46kkLvLla8ACQNtv/sfEmr4Yyj+pzF3i7Ki+OD6aEIHCV6/ywbXFk6BtOa
         G3urc2HlQ5aj82IuLLTV/TKJWDuXrl0Klt5pZNWtZ+z8cv0WyxY/4kID0obQ0bpsDefd
         bMS5Uv7Xqf8LoFoaKWTlPX9ylhb2zX9vnh4FBbgr0Z14ZI6D06sHgJw9y36w9QBBcc76
         X4ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776039331; x=1776644131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/ZjAoNv/0bH6d96ZJoX3aNNUEH/X9X2mePXXADQJKVw=;
        b=aa7n4jUINq8hCO4a1wFXlbPpDRcQLOviVYM0OG/qOiZiIokh+lzwxDoAfVMb9/DiAu
         RJPQAlbm+kbsHr/NtI3mv2yM06lnuH7vENVNnjcfUpz76wPcUfQrODGm/K3EGNhSjq4H
         SoY7Mc/J0RbBfhe/cTt2PpDJt0T3lCAix0fQ99hnliUXhp9wNJUztzRpR+9NnU08yUUh
         SERYh5aCU/bfTahjZxkUAimUmnljtThk2SxRClfvTMJknMuvwbsc0Xn23A2MRm+pKSXN
         6Wl7XbDr4NCeNOOoLmfyY3vSoyrIIVq/vTMngS0a9SAHwmlDVLE0nIAGpWTuR2Le0c0h
         JZtA==
X-Forwarded-Encrypted: i=1; AFNElJ+6J7vrpV6xEWonegDMQwp/2UUqcKe9VoOAI8VCsHBlTTbRWAL85vJiEmyyczC/nfv4Gxq6b5N9/LqXJPS7zDY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwasOpGA6CnLpIoYbkpeaHUJBc8T2e0ebTiWAtRU0gJSXumgMvW
	0EKWLVVWNlHegiJjJnLOLa/0r4/MNdTEFhwBbc4T0QhGJxi/PVDMPCOC0swi6MWChB8bUVe1J67
	aZKWPWn82GCqRN020xN6OCzUIli5Aep0=
X-Gm-Gg: AeBDieuXeoXHg73wWn6M2rDvmj36QvjJbr6QnfSsV9VRwun2cMhwHZbc0MG07hw34aU
	I+RxM6PPKqRVZWT+wymuwVWPy5vnYYkWM6pbDgNG8Y9tqXi8F/LnmttfJsDg6DIkNCYRGJcHd9z
	FQouiVWCdO7y3khlNFTQPxJ5JwSo27C1y9r/mG91wnAH+LaVUzTu+YfEIF9rkKTX27oARMQDRiz
	og6ceF6fyTh6YSXOA4Xq5NSQ46ap2Mw4iv0tzInHej3xewi+5Ts7LkQawnbgW9F8aHsTOwzRoh5
	1re8147rdUAdoOvc1TpLhbL8ebKMIywtVqdf5K9wssyHO8XW
X-Received: by 2002:a05:6000:4387:b0:43d:7508:c9c1 with SMTP id
 ffacd0b85a97d-43d7508cd32mr5342542f8f.50.1776039331323; Sun, 12 Apr 2026
 17:15:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402063714.55124-1-liwang@redhat.com> <20260402063714.55124-8-liwang@redhat.com>
In-Reply-To: <20260402063714.55124-8-liwang@redhat.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Sun, 12 Apr 2026 17:15:20 -0700
X-Gm-Features: AQROBzCifv09xX9_r3AlbMnr7448_s_gW4fyAOGpR6oYAtKp0TkiGlmLrGMOEK8
Message-ID: <CAKEwX=P5vet_tfsLtOcF5x4vMu3NFkq=2oP1npiY1uemR-GZvg@mail.gmail.com>
Subject: Re: [PATCH v6 7/8] selftest/cgroup: fix zswap attempt_writeback() on
 64K pagesize system
To: Li Wang <liwang@redhat.com>
Cc: akpm@linux-foundation.org, rppt@kernel.org, david@kernel.org, 
	hannes@cmpxchg.org, yosry@kernel.org, ljs@kernel.org, Liam.Howlett@oracle.com, 
	mhocko@suse.com, shuah@kernel.org, chengming.zhou@linux.dev, 
	longman@redhat.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	Michal Hocko <mhocko@kernel.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Muchun Song <muchun.song@linux.dev>, Tejun Heo <tj@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 11:38=E2=80=AFPM Li Wang <liwang@redhat.com> wrote:
>
> In attempt_writeback(), a memsize of 4M only covers 64 pages on 64K
> page size systems. When memory.reclaim is called, the kernel prefers
> reclaiming clean file pages (binary, libc, linker, etc.) over swapping
> anonymous pages. With only 64 pages of anonymous memory, the reclaim
> target can be largely or entirely satisfied by dropping file pages,
> resulting in very few or zero anonymous pages being pushed into zswap.
>
> This causes zswap_usage to be extremely small or zero, making
> zswap_usage/4 insufficient to create meaningful writeback pressure.
> The test then fails because no writeback is triggered.
>
> On 4K page size systems this is not an issue because 4M covers 1024
> pages, and file pages are a small fraction of the reclaim target.
>
> Fix this by:
> - Always allocating 1024 pages regardless of page size. This ensures
>   enough anonymous pages to reliably populate zswap and trigger
>   writeback, while keeping the original 4M allocation on 4K systems.
> - Setting zswap.max to zswap_usage/4 instead of zswap_usage/2 to
>   create stronger writeback pressure, ensuring reclaim reliably
>   triggers writeback even on large page size systems.

Makes sense to me. We should scale the test by PAGE_SIZE.

Acked-by: Nhat Pham <nphamcs@gmail.com>
