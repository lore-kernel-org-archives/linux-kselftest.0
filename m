Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F1023A564
	for <linux-kselftest@vger.kernel.org>; Sat, 19 Sep 2026 03:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789789912; cv=pass; b=UBkPsKaYwz8f23ijLHBK+gq4bVVpTw3lXxBIhXYZk5+K4iAw1TpEr+FVNwkvaqpsNm6bPP3FWAeeh9aUABoECxE57JAJoo0NXjE4oCkZQCYvbxWYhyWiXLYxi197YvAAsTr0/DpNirtpS8u45iIv2wlQZBaa+o08sExknA7HnMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789789912; c=relaxed/simple;
	bh=hTa0cJ+wIISdMRyCZeKr42I5DMGv9YFDWO/5UDkL5yk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DiDZHB6+luscVEVuZl0fAGjeCWJRLDg1fpa6DHiXBCJ2U9BHQ2Wv5ui8dhdLkuF9dd1QYfoaGC1QF+eQaW905XCxf08a0w/1ADBMCCMLjskMigPwrMt5aaqX5jy2q3lBtzD+VVQ/ssXXQL7Jk7iIxSG0392TJ5rRXDipwDXtLyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SE0sPFU+; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SE0sPFU+"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a354118856so10664351fa.1
        for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 20:51:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789789908; cv=none;
        d=google.com; s=arc-20260327;
        b=TJyv4WdvY0xLtlsBJTYsz4Z1Fol9lGvrJF1n4t3CgFTcBxekannWvdjKuI8MWDT+l7
         uiHHn+ktA/zndxP/05NuKVaze754mgWaYBE9gdt+7+MLuAg3goaZkRkRzoW9Fc3cp/P8
         QqsBy6od/JSiZC9bAWb6gTEIRI881JIZl/9FqVOKpEwxjDjtFfnDQ1B3Cu4MdI3eZg5X
         smgocN8URSbk2uIwdQESLXwGelleOl4E7xMFZaFRNhY0zpUx/mgdw5bfdeB5hqsaCzp0
         Z8TJvUMQ6cwZFi7L+dDBDe/NfqIYF3B2BF1AWyG/MyXwH5tBJ+WVmgPC+eASwOndC9f/
         e+Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U8IHx8ZPAeKtnfGboiRf2eSbCOa6mdkGIwjEr3hxwU0=;
        fh=brAvmNvyju6d+t/ZJ8hAQl/OZmj3qs0iTtFeuJZ7pY8=;
        b=FYVSjsiIanF+kvWPQX08Lu6ZZCD93dBPUQLp+XMO23GKW9YyNAi+Mo7SrTy7KzRjm1
         8/G5JC1/I7p381RrJ9b5RAEQhICRiqvfP3XFFRZyJejH0JlRp94+E4gYuhKsvpz77wED
         n1Ei80eU72Q/jJvriaPdfAzwBQv2E3CIacAJNQtpdmgPNvNHY+iGyPEOE1uiPAnHC9zM
         vkCb9nb9i790CJvt9cfafRkTZHdoGK0KywG3c4XV3BS9L3Wf1qvv/sK6QgyndO9vVX59
         tSfiWd2Vc3u93tqfEtuEBH3k2MBkm1huB6K3fOpLHmCRg71uthbVP7IpxeyR8ObulIlx
         YT3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789789908; x=1790394708; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U8IHx8ZPAeKtnfGboiRf2eSbCOa6mdkGIwjEr3hxwU0=;
        b=SE0sPFU+pO3mTQhHf9uiqW2UeedlYBwWgy8bF5AmtJ5ZRe+fcxsQ/taGTlByMsSgck
         0GPZBloD/ibEGEDFaDbh3haX29tvyWXB9PZShIOHVpuGdbIp6A8X9B9zJ/BKz/h/YEb5
         OYFzk5thtO266BJY3AfFKtR6TndIru0lS0E5pfD/f7sc97G4ifLlw/2Gbj26ugiQCB1U
         IS4X9IZlZsV5AhEi6iwLztiGZP3T8PW1IpJ6M2S5QYZigu8R1KP3+EITNK8oqhwfsAqO
         mgfeFyWROM4p1FPKBr9Vmsr/SX60Ab0KPJMr8dmwpwV5T6O/fTBIpyNa0pPBiLaZDHLt
         e4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789789908; x=1790394708;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U8IHx8ZPAeKtnfGboiRf2eSbCOa6mdkGIwjEr3hxwU0=;
        b=ABlWtC4dridCOeiIVBgsySGNiO6/io4pUOuLixQxZ+D1QC1loNqHio67ZE+1OXqf0s
         2fToplrE7WEsVfQozIZUxhFb7SEzlRVk16Rz4kZgA/bhwhqBjSyh5Mw7NZobadpuNN9u
         wdVnzAxBl3pgwH+pyqKNFxHu6fQWZ4ao4nMSv4gjNEOTq//VBLHJQvTfaayF0L/fLbxj
         DA5Dmylc34OjJnhxw51CKGLzYgatmDEI917IiOE6lAu56nf9lu7dUtvhGI02OW6/6GKs
         pp5ek+4uITYdzVaFG6kkOxNnIZH2q5OFtabh41Ir+rx8586EMxTfA2QxMiinCLLgFVxx
         hiGg==
X-Forwarded-Encrypted: i=1; AKwUvBywWqoPHHJQKdB0LQpaHcgMFAZDbUnjjGjqqM5j4HoIN7vwKY22weMtQwJ2yIqPEgo8AYrkUmLrpKss/7wc6Mw=@vger.kernel.org
X-Gm-Message-State: AFuF++kg6Z7K0w4Ic+n8YCrRG3WmlvH+jy74BOFzcC/uA2g7Qkbek9M3
	oRkciylY1tMzvJ+Atvm0kYYzxJD9RfRUWLEYy2zTvKrrtRYh86eQ+2gS4qdHNwHnhtRIREBNDOF
	yoNs9Wnpakgb2F2lvnqbv6f5aCOXF7zs=
X-Gm-Gg: AYBFou0s9UNk6aeIJLEM4wfPh7jQBonk9miXbmPsdh9FDd8ohZ/yyzF6pzxMUy7xtTF
	S8797dzSHr83fAEle9rJwpoPLLuPgkKMd5jQT4gbG510w2Ojg0pLmVwPmRG054Yc3dCS9qFiyuf
	odnEejCQIdWnxlv3y9HGUCLuVO7oO7gF1OKmmMPui3VvlhjczgdOw6tDdaHXFXiu8vXf6AcZoXD
	wipp/yDAClqDQ905x3Nl2rHLw0AZ0KA5MvUh55weC6+Bcj3YFP2vLOQkMtyNMFn92FgDee3QDGM
	wmJbWdnQQ5MIiphVVq37zM4/Vrj/5sH9uIvTgs2j4BY/Q1KdPPua5aMWXGpCOhAkM0BAyxjfQCW
	dp6v5a1R6tu3pFNBtQPqB++AzO7dBOUqWNV74u0pj1c9aWw==
X-Received: by 2002:a05:651c:a164:b0:3a3:74b7:fc09 with SMTP id
 38308e7fff4ca-3a5fbfd82ffmr9833281fa.21.1789789908286; Fri, 18 Sep 2026
 20:51:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914014539.5015-1-sigefriedhyy@gmail.com> <20260914014539.5015-3-sigefriedhyy@gmail.com>
 <20260916184909.279f5cac@kernel.org>
In-Reply-To: <20260916184909.279f5cac@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Sat, 19 Sep 2026 12:51:37 +0900
X-Gm-Features: AcwNN1UgzoXHsJ_bxhh-rzhr-yWoPfk627Dv6gK26WB-RKglakSDcOZfeNpQwmE
Message-ID: <CA+7S2vLLNCQ=+rcGUyd-jt8ErtaVWgSxt3Ctoq=pJz+KZE62QA@mail.gmail.com>
Subject: Re: [PATCH net-next v5 2/4] rtnetlink: add AF_PACKET multicast dumps
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Ido Schimmel <idosch@nvidia.com>, 
	Jacob Keller <jacob.e.keller@intel.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Nicolas Dichtel <nicolas.dichtel@6wind.com>, Nikolaos Gkarlis <nickgarlis@gmail.com>, 
	Paolo Abeni <pabeni@redhat.com>, Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 10:49=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> w=
rote:
>
> On Mon, 14 Sep 2026 10:45:37 +0900 Yuyang Huang wrote:
> >  net/core/rtnetlink.c         | 174 +++++++++++++++++++++++++++++++++++
> >  2 files changed, 175 insertions(+)
>
> I don't think we need another 200 LoC in rtnetlink.c ?
> Especially if we make a precedent for AF_PACKET and someone decides
> to even add more code later.

Agreed the logic doesn't belong to rtnetlink.c, I plan to move it to
net/core/dev_addr_lists.c in patchset v6. It seems the dump logic
should sit next to the dev->mc helpers it walks.

> The AI report about consistency check is probably good to act on as
> well?

Will fix it in patchset v6.
