Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1F0468C0A
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 12:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789389765; cv=none; b=aDhmWYw9RYRLWYvPyu79oVj5pJKKkPX7H5YVSiDZnm1CeVftiE9gzJbUogPrN3v9iZSD9QCx/PY3N6jDTrHxd313TWJcAOs5b1lVqXJPDZ8l/18P29vP291ng0/SrabUMMkwRuQyYCt89jrh1ZjxRbEvRNqjCIhXPeFSv2UAtiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789389765; c=relaxed/simple;
	bh=diVDcwyPgcEBBc+KdG1wDzNEKWqaSCAeLPsiKcrDYEM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Y7bQJosYNg5TDzd5NoQnjcuoIIYuLd9pryBx9b1BiKiMDSaZQGbdhIoXB5UoCoZCuGRWSlfFA6qFekzP0/kMjPEHkHAL/wrDrHa8Fnzyk/p85shrYaoXYvo2c4gh4/ZKzMxyg1I/1Hbqb0kncDyDBLAphKmIDL7+PLdtF2SMLcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/VSxPDK; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/VSxPDK"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b89a0e69dfso2044206e87.3
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 05:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789389761; x=1789994561; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=diVDcwyPgcEBBc+KdG1wDzNEKWqaSCAeLPsiKcrDYEM=;
        b=A/VSxPDKF4U0x4K8hy3hPUhCk5NhbZmHVYC8yJ8lrLrWJtWTaKojwtG8FjcZiiy2q3
         xm8Xs0fvSrZHMEeRF7+5ZHY+stbXL+i1yLoDok6xrEA8oeF4UCzfSxOyz4eWPVRU5luw
         +1PCsrBEvQnYxu6IwZg3dsvAvxkGhFLFI2wwCR+P1l+Q1IOuhkzCchWaeABo1dhfQrkb
         +m0+MwLWFDuf7+4+9uIhozYVXryioc87YA76hvKAxkGYKBrALx5VA9lM57hwdItZsO36
         Csbw5okZQoqKTGD37Swdt8UTghR2db22l4psN6IM8dd8v/Q4nB5ppuY+4oreud22ZgdD
         DKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789389761; x=1789994561;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=diVDcwyPgcEBBc+KdG1wDzNEKWqaSCAeLPsiKcrDYEM=;
        b=DhaOPw/KZLDtZ8KZdARRSe1qLsaT0aJXapiGKbwlk+4xNB1D/vKiU3SqI4Bi+o/RBI
         aRjTdAgX8cHmm81HcilmSRXFGnhVJi+9isnSvl/LiKKfbAMuiLhjMja4bGXv+keS3r6d
         zkSgfyvSa2nspDJv+nhHM4tDFlOBFA/8xdIAmytmmaRv/JRx8oXLGymMLEY5/xuvAhzR
         Ar1q4rrjoBxuOj8RH9O8y5LlSprXW/Z2tRz0uCTGq25oSmb6rCWvrpeEmJGfHg5ORfkk
         ebx5syDhjKzy1UqU6yBW5ATDfS8QvvvrC+UB2m09g56FSCK7gMjLybeyUGyqKLa3Nlx1
         LVWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgfIFWaxBHabkBf4ODEFF9Cvs+v7Ylfp6+GFkZJLNeVAvYtmWNS5uiJDH91JgRqzfyhyQKpUXsK9d3HlCOYJE=@vger.kernel.org
X-Gm-Message-State: AFuF++lz9h485kVBQDgLgvXaboYIfmYXDmQQxtUNeyjRoTAbmrL2yzrL
	ofrKsXuZHmHEe323jUpC/ClfsABjsBDe+LUjSYadByrkwycdIGtLgd7a
X-Gm-Gg: AYBFou156plZGU4ugROw9iQwJXVUM0/epoh0E6Hy/QpIhGYkKqPEXPAE+LuDyCtQRGD
	8wN9SRtka477gv8TPPBp03BZizBHdTk5ewSwFvEf8zAJ9Bl1RYTt+5aQNuyMcqX/8dSMXoYW/hH
	vi3kiuEcRGVLv+SNvC9lnvQANfKTRjG2BT0Md8WLHaIcWmID3ef5HEsQIaBVXsWO8WHpLoIJpQV
	2RPS9JJaKRDdVKNjs7+4DX0mSv8rNlhOAbijWMzS1fWt8Po6lHOmylEmF2+6z9MW/6pZ9OUJp/D
	4mZxxWidRZHTL6pbMeBbPTEy6kWmTMAFrFPj9jUD5kHFIy1DhTcjqAOLa4LZ99kJ8PEbJ8Mwecf
	1i9ApcmVjmz2XO+ekh9tAqo2U2mbtY0NmjUOiJw8p786Oar9A0mXXGACJDAJMnidTj0TZHSOk8O
	BE8Vfeph+m+slbEmmjoo6sxNYpuQxowbwQZalC0PvTchbshBE3Wrt/RhU0bBpa9EqLMWRD6ZWV9
	SPrd0LmqDtD+XY=
X-Received: by 2002:a05:6512:68f:b0:5b6:4b2:de81 with SMTP id 2adb3069b0e04-5b8ae69ca7dmr639501e87.31.1789389761097;
        Mon, 14 Sep 2026 05:42:41 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0457246sm2444301e87.23.2026.09.14.05.42.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:42:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Sep 2026 08:42:37 -0400
Message-Id: <DLF1QA7MC6T9.3ETM9IGKE51JA@gmail.com>
Cc: <netdev@vger.kernel.org>, <edumazet@google.com>, <pabeni@redhat.com>,
 <andrew+netdev@lunn.ch>, <horms@kernel.org>, <daniel.zahka@gmail.com>,
 <willemdebruijn.kernel@gmail.com>, <donald.hunter@gmail.com>,
 <shuah@kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net-next 4/6] psp: notify about a disassociation once it
 has happened
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Jakub Kicinski" <kuba@kernel.org>, <davem@davemloft.net>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20260912200426.121025-1-kuba@kernel.org>
 <20260912200426.121025-5-kuba@kernel.org>
In-Reply-To: <20260912200426.121025-5-kuba@kernel.org>

On Sat Sep 12, 2026 at 4:04 PM EDT, Jakub Kicinski wrote:
> The dev-change-ntf generated by dev-disassoc was built before the
> association was unlinked, so the assoc-list it carried still contained
> the device which was going away, and nothing corrected it afterwards.
> We don't really expect associations to change during a lifetime of
> a netns but this is still wrong. Netlink listeners need to be able
> to tell the current "state of the world" based on notifications.
>
> The notification had to be sent early because psp_nl_multicast_per_ns()
> derives the set of namespaces to notify from the association list, so
> a namespace losing its last associated device becomes unreachable once
> the entry is gone. In that case - get the netns from the netdev itself,
> and send that namespace a dev-del-ntf. If the netns had multiple
> associated netdevs and only one disassoc'd we'll still send a change
> notification, just with a correct list.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---

Reviewed-by: Daniel Zahka <daniel.zahka@gmail.com>
