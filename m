Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7E73385A5
	for <linux-kselftest@vger.kernel.org>; Sat, 12 Sep 2026 01:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789176845; cv=pass; b=aY+JWzdVeE3Xn7jUPs+u3OFXM0m1y2xBxYhyIpmJx/cagLgWauFLjhSqekBQ07aZQ4MGIn3hbFSNiA3TdhGRbEOMmk2TuCZbGqxh6u6XkYMrFWFVJwgwPvyDvB3BVXMZQ4RIM6FeXAV+NWsMDUCvGIcR9EhomJbaSau8TuQMIJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789176845; c=relaxed/simple;
	bh=IGOSxZy52FtrcK0G/EPYqVmio1WKO2seotaY7iqwZao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sw71N+CM7ouTrKMR4LWWtGnsI6JyZz/NOwsZ42Ohp6a1kgxQSlgQVCUhaQbdw2C5G4dGW9VxPgwQeUewPfj5yyEJRbMsKHCAn/1tg61o+xoPN2iCJ+YPgJ2OjmH9MZUmYX1I94GhsbMJMmJV44CrhmdhHhH5xTI/6kY+5h1+Ii0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aHYyMx9Y; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHYyMx9Y"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a47f740839so1107641fa.2
        for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 18:34:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789176842; cv=none;
        d=google.com; s=arc-20260327;
        b=KB7yaUCnAS0F3tyxIJXBRN8ULkT7lis/8xkZUJUe1Od+6LjBgwLb4L3jcUcjao7q9E
         YqwY7Po6yyl46y46xBj9OfGwA+45gqA1nPaq8DrgpDLQfvj+2P3rOG8F2j7m8eQvbMUH
         Sv2IrkR25INlGKA/WSf3hUk6/SOhFQ3Sq9NvIQNvWLtnojy8+ZbeZtYBRlekD7ubrlvi
         D28nV/CbdaKKP7CytXbX7u40YFsWXUSMKKkozX7VgentnZPHFWGyAYuzdShzlhLXDgU3
         nDKf+Xzdj97A9urszkEXCbD+9sy3Ejjf6n48aImpVH5rbAltCxKwH5RUjJpnhKB3bTl2
         cvnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HoTJlBemOW4I0RfwGhPeZYrkBgu1h2TKr9000ZstYMI=;
        fh=vNziCsXr6sAbt8MME8gdfejJiZlL5kB7jyosWQ6nbpE=;
        b=b2GwfOBN6Cixwqh6D3oh70zd9l8kjPWyHa8p6vD9/3UuhciJ/QV0PFqn8SxGrNwyc9
         qAfGhcp2kHcqRzl0+qVLyHg6s8eNjPkVlqtlir68WDgp0tSDfNVfn7IAG1S0ZmlCVtXQ
         7jo0Pi0nrKmwq9WD7s4ZEK7zkG+fGWBAlyh/e4Nx0KrA9MvHWv7zXyNVrGDaiSuzGOAE
         80lV3wVC+UOZe882WIiWrvV/4+cuB81vv4cwimNdRGqujlD29ThvMmaCxhPOpCYdQ8UO
         uvlQZdEybRynrNgYia7FW6Zu2LcLZYdmQm60kzBrZbceAFqo4qC30MTcUH1oLpbmfn9Y
         qbFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789176842; x=1789781642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HoTJlBemOW4I0RfwGhPeZYrkBgu1h2TKr9000ZstYMI=;
        b=aHYyMx9Y7dTKBSp0hmBT5xBOGgyJF01I2r0YQ8K/fpKy2eI/AD96POYpnrOtr76OKu
         3orGvxbkFnlGJYmqs8h4OBInlh0mMbGotUh69pEQ1b/S69hq4qxUJInVCvNqhLGp6Lg3
         KuK9rQ8UXIq7StA4bjQ+yAUp4DvQYbmIcGBnIrl27q3DZI6TT4geN7IITOSZm5bd01eT
         ksALSO8LLMyXiu+wNSjp6kqgmH6JRA1kCvht5rcgaq30zh7RSY7rZOlSw5/nOHj6DeU+
         29k2Mw65/rVbLV+emEQpfBgMctSBXCBMfRnDFjZSbSVBax8hSi0XTlJiKwfsuNHEYLl4
         S6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789176842; x=1789781642;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HoTJlBemOW4I0RfwGhPeZYrkBgu1h2TKr9000ZstYMI=;
        b=QjV4OP+3UMb9izGiVRwhLZe6No8LQphCADw7G6BXkP9iKXr4qk2NjoiFHvy2I0XHP1
         hrzaZOxVpGFkOolkcgCNyuTZ11xIJNyKEnjMBiTibgs0QULyNEaMkyl6Kt72eZWYovKY
         nb52piyUwgFd3msxvgxJ6WjTbFMC5pAXrRRzyNnCTU1Hbjf/CrjECo0bvqIIdBmPTMFs
         ClXYDn38f1A5wRD0NvCMSykK3vl2g5nhGHOlMfOfYQXw3kEXvi7+SHwbiRs5guIZgFXn
         uMy44voZKiuHFYqtKu0Lxy95CgFAYFib8rMbKc+5W+dFYY8E3ZBQ4+N/lHrBCyjZyj8z
         VIRA==
X-Forwarded-Encrypted: i=1; AKwUvBzdLD62MoSryQJowQFVKX115h7xcma+1eRskX04miHIsFojxPMJokk4zfPto+T/+rgS6T1/uVC0X11BFkMvCec=@vger.kernel.org
X-Gm-Message-State: AFuF++kbz9wjHVzU1pW9Q65g55ercBIJI+eRaoJ9hCIwj2klypzkyhFK
	dEEDFfOGh7xVRRz770BqsH2wg/2htxYq2tlR+VDpt3jDEpz3dscNwYyTn+KACie07f/XDok2wgP
	5PKtpme+qxS2f2teHgaHI2ULJJUkuwDg=
X-Gm-Gg: AYBFou2w5FszGU5ZoFIPgltQyCbwI/kxt1jJnq/4Z+re+fhbYV8x2ycFFUkUY/e0yyX
	vWPjC8lCCF6L9lHLNV75skHeVrGZo6tB0hW29MLHShpuZtqSofgZ5QQ3kQsLCKBC2qu/BwaAZpN
	MNG4dME7EXg6dgeToRArNgiTldhE9jKlJApahIyi9U1E1i3xTqZ3FcaGObUrz1B6LAzqk9y3ohb
	glzTBIUpUOkyaNtUtGpx+o/woQgJAtcLhDIPtczYvx2a0bDm78x16zybbdU3rB/zMCFP0O4+RDZ
	zg++10enSG+6r0VdWcCPdJKc4DetUkiobFTC7YHRa4JyMC7SSLw6kiwO132rvoOC1Zp1LZ53Mh+
	UJxb9a48A57nLwRjyI3fWvSk/T3swbXFJ2lr3m+ZrdXQf
X-Received: by 2002:a2e:b8c8:0:b0:3a3:749e:319b with SMTP id
 38308e7fff4ca-3a5b37efbc5mr1133491fa.15.1789176841298; Fri, 11 Sep 2026
 18:34:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911105103.7771-1-sigefriedhyy@gmail.com> <20260911085056.10dbc3e0@kernel.org>
In-Reply-To: <20260911085056.10dbc3e0@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Sat, 12 Sep 2026 10:33:49 +0900
X-Gm-Features: AcwNN1Xwmy2KElPk9P2Qv9ivD-eVQUT7KVSPXOdAv2xLdRuqCz4GQnL9yyMnlGw
Message-ID: <CA+7S2vLOR7aRY42-4j1v7C27pPSaUt3h00FjrGKVOUC_2oVFTw@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/4] rtnetlink: dump link-layer multicast addresses
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

On Sat, Sep 12, 2026 at 12:50=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> w=
rote:
>
> On Fri, 11 Sep 2026 19:50:59 +0900 Yuyang Huang wrote:
> > Subject: [PATCH net-next v4 0/4] rtnetlink: dump link-layer multicast a=
ddresses
>
> The new test seems to be failing:
>
> # 0.14 [+0.05] # Check| At /srv/vmksft/testing/wt-1/tools/testing/selftes=
ts/net/./rtnetlink.py, line 171, in dump_mcaddr_l2_check:
> # 0.15 [+0.01] # Check|     ksft_eq({(addr['ifa-index'], addr['target-net=
nsid'])
> # 0.15 [+0.00] # Check failed {(9, 5), (8, 5), (11, 5)} !=3D {(11, 5)} ta=
rget-netnsid did not dump the peer netns
> # 0.17 [+0.01] not ok 3 rtnetlink.dump_mcaddr_l2_check
>
> Please wait a couple of days with the repost.

It looks like the test is flaky, I think I got a fix working locally,
will wait a couple of days and then repost again.
