Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDD03446CE
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 20:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783368060; cv=none; b=agpF5+Ts22PuTpdbyB1iaaubTKYfQcVcOELOW8BVERtACrBmlvdpCxzJDA4x5xpMdkcsCEZj2maTzCdnYPjQKvZ3DzpEpKrd19zHLhrQ4EbC0PrILHdAHALQz5hk9uDUqzj26DhrE14IAkb6sUGApoLqUjjnpHQ/TYwZE3D9uiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783368060; c=relaxed/simple;
	bh=Bn4Wn0GSYZIZgIEZ5ntKigY1VQrjvtTEoGxji+iVLx8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ofI0rKpgXdC/7ZNJkoLHqDOWgU8afTDv9SV3eT81nt+XHyaht9AzdoOQwH1axLX+bwxUJzv9gbm7nNJMKNeCIBHwjdfcSFMvFMeK/hnbSZseztsNnDsF7Q7ZJhCA1STt8XNsvmNOZ/AGGHfULMcf86lUYfAUIA52Pf5fOi/1BfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HiSwyHYX; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HiSwyHYX"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3811e59df58so2096446a91.1
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 13:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783368058; x=1783972858; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VIf+zohqeDaZywcmZWeYMtyc4MEDifAz/egCRkrh6AM=;
        b=HiSwyHYXuXpCTq21Ed9uLQF2gfbf80+jtXt78BOXXvwjEWDjx6ulzU1zCNWvT3Pkut
         Y2na8agDKhmivMiVJa8MdV2BDLdW1wfBHmwuGNh/K49HVPvBdiVX5xuFhbIJCON7jM/P
         PH5J+TN7sD2UJSGqjcVlB0/hLN6VyfFHZ5NeBu6J3IGW6D2o7us0DAnHTZn+qRqztdQh
         nAZKcwglPbcQZSO95lZW4zlFIj4eG4Z1RcYvNjcQNhfoyHhVlUkA4aln1omwu00MH3Cm
         iIs5H2YKZvt3T2fEe2mCywK1m/eD2aIGEPnKt3pw3KuPebIrX2A4jqlSl8ouzaK30nLR
         pCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783368058; x=1783972858;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VIf+zohqeDaZywcmZWeYMtyc4MEDifAz/egCRkrh6AM=;
        b=MrgK9Q6OIFtYrpRToAovllQcUdK0f0fWvvXRtYxoyecPNqMpiKV+zdrGowJD69+0Pd
         LrlpHZqugH9WJ4Cgq78DejsF/RPviZvv3LsBfMpFBkKzt/VJVPHJtCrSHy5ViIS4ZpI5
         Q0awUvQJ430m4lM/04w/6TVcORGqkaLwrZOT3gIlw9E5/wKJ7ccyV+hG78v2wOAPkWNF
         AfpwuRsWzzo2MkAOrHEEAc6gysLe6IBMZB5W27QPJFyEJuKh0mI/W4XgFBWKBiADSZHy
         jA3t+WJOofRCudfq+AuiXaMBYCXgDlL67zZpL5GLF6WLgJOO2GTwCFy2OcyOwEmkfBfb
         0H4g==
X-Forwarded-Encrypted: i=1; AHgh+RodDF9SQJ+O3zgrxFP8/aaspFxe7Vg99UKjbaxZh0ZO0GK/1wLDjgc5OfmBZWkEFDxNwsH7uHxbR95R42jm9Pk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyF6v6AUv5L3CwAdqPunFSQbvKEiFYDeIV1Gb7Vh2wLGIp1oJZ
	9hyHR0RK9u7YuvR7Fg0xHngdYGkRdtEsOEseY85ggodUQ4YKRhKEZo5s
X-Gm-Gg: AfdE7cmXjxiLzNAhm4aCJfEVMlI6oMm0yFMWvkzHVgGpqJGIrz5RQNwSJRzYsS3UDC6
	4bW0wqpLZhAjyWeC9RUp6OgM+rGmECQf8fNO0yWgLxAY4dkLm1gu2Txx/lIJIiIPH9seej3wwiG
	upSevamb1lkL5jGyNaz4EAMGd86vfW5ioMaiyrdreGtgyvZgLd+TOC4fuXnu1Q7Y0ofFmVMTv6V
	2Rh9yjHEXve8bFe5W/r4nXchVeHzLAIMBsY8B6fxKQdz7ePHd7y+Pa29nb8cYt4Ns8HR5S6MIJo
	LtMgDbDlDNJq5UY7gdGK9khkiD09ZBBZ7WiKmPToWRuYOCaoPa7c0nEY4Y/W2hnHEO9BTurnKIO
	Tf1J8LB/9zog0oIVYCP+AuBVaWJpmkbhHw8pkLasCR3AyUT4OWvpbGhupsTVaJKkuD+6niIaxwy
	3nAh5koYoXz/tZ0XNiumVtZNDnI07mIMunzmcNm0XdhY/Xd/tCQQVKI6aBoeXw2X9HzJpJIw==
X-Received: by 2002:a17:90b:1d43:b0:380:540:d499 with SMTP id 98e67ed59e1d1-38754ea7328mr2054607a91.6.1783368058145;
        Mon, 06 Jul 2026 13:00:58 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:612f:7084:be32:532a? ([2620:10d:c090:500::1:55b9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311561dd3a1sm19197214eec.22.2026.07.06.13.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 13:00:57 -0700 (PDT)
Message-ID: <559673fc207097ecd08f1d7e9f684fe1e9f2a581.camel@gmail.com>
Subject: Re: [PATCH bpf] bpf: Reject negative const offsets for buffer
 pointers
From: Eduard Zingerman <eddyz87@gmail.com>
To: Sun Jian <sun.jian.kdev@gmail.com>, bpf@vger.kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, john.fastabend@gmail.com, 
	andrii@kernel.org, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org,
 	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
 shuah@kernel.org, 	mmullins@fb.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Mon, 06 Jul 2026 13:00:54 -0700
In-Reply-To: <20260703035137.109608-1-sun.jian.kdev@gmail.com>
References: <20260703035137.109608-1-sun.jian.kdev@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-07-02 at 20:51 -0700, Sun Jian wrote:
> The verifier rejects variable offsets for PTR_TO_TP_BUFFER and PTR_TO_BUF
> accesses, but it currently accepts a constant negative offset produced by
> pointer arithmetic.
>
> For example, a raw tracepoint writable program can load ctx[0] as a
> PTR_TO_TP_BUFFER, move it by -8, and then read from the adjusted pointer.
> The register is still tracked as tp_buffer(imm=3D-8), but the access is
> before the tracepoint writable buffer base and should be rejected.
>
> Check the signed effective buffer offset before updating max_tp_access or
> other buffer max access accounting. Reject negative effective offsets and
> use the checked end offset for max access accounting.
>
> Add a verifier test that rejects a raw tracepoint writable program using =
a
> negative constant offset.
>
> Fixes: 9df1c28bb752 ("bpf: add writable context for raw tracepoints")
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> ---

The commit 9df1c28bb752 ("bpf: add writable context for raw tracepoints")
delays the tracepoint buffer access to the attach time:

    int bpf_probe_register(struct bpf_raw_event_map *btp, struct bpf_raw_tp=
_link *link)
    {
            ...
            if (prog->aux->max_tp_access > btp->writable_size)
                    return -EINVAL;   =20
            ...
    }

Called from syscall.c:bpf_raw_tp_link_attach().
Please modify the test case such that it exercises the attachment logic.

Also, please keep selftests in a separate patch and make use of the
full 100 characters line width limit.

pw-bot: cr.
