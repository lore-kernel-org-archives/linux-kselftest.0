Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF495304BB
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 08:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066665; cv=pass; b=HJ1kx6UdUje6IGcLKAsacXXmpUgL6ff+Q6ulbTj/H7QI47yhzFcsrLNUTild5aMO00MeKZtQz6tTdbXwwZVaRDdp8DvJj+tTEZLALTxaGNf9RPxkxlgl0Po6oN1MQnX1BAaqTB/FiL3E7l0XC1EM1gmaWrgm/j4TIKLPKv4p3Es=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066665; c=relaxed/simple;
	bh=u5qQmLy+pyZNGMwYq8Tx+105RlM9v+qgj/NhiJHu++8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BV8ckgnmTVaXsbOi49eWBAxz/ful4jtZxALZgCdhi2n7o4y5Cw85LCsdP/5y03Uo6phdIT39L/oqknJ/euVaxUHQhnHRyDHywmDtuD0et7IKEUTPePRLV5Ofb5ZUmc25ftKjCaKPSyyK4c4XEtqezQpjkGYOjGNAeJJKLD3glrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SVpOLVjS; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVpOLVjS"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b79784a6edso3643317e87.1
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 01:44:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790066661; cv=none;
        d=google.com; s=arc-20260327;
        b=RF4D7XSLUDuclppGoKTxDbRMMj1XfhlRqinaCMhNmcEv+zhHs1nrEt36twK/2HSi/7
         RRmloHrFWgq/QWvZnn1/Ps9mCjZ3Eh9rGuEPuA13wrkKIaLtEmTOJshOdAr/9sq4bj+g
         pG7r4ctBzJH2tvp+WPglz/bJM68bLLUhIyIUUeTtChCkmCLXdC3dYMwdGCk7p6+Tha3N
         ZiQjfNjmaK77wfWAJz9GhJekzkkvL3OlKdiUU0YzDfsD3izJDAARhv6bn04z65WEMwvn
         i5CbbaSNXO+KMjifONcOeawPoBbb+mkik37WFbZlLbvIHZeq4s0zKXxbg6rumCIcDWKT
         H2eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WsVALZGvNuNx3Pr3M5+XTqulMSxCzM1LXdhBKksMaY0=;
        fh=LLIi0vfaaiBpu9W0LkzdQaZ0IU5BIiy8xnLaB7722v0=;
        b=mN6DEPX2gxPGdXkfZWu3Wu0FTcwp7V6wwGNUncXkklzZQzpEdu6LfWx6cTryf6v7QG
         EqzCEcT0oL79rW30BvGTIyTNEA3QuZNRbcYD8+dtL8sYZe7LypkD1wmTyX8ngHxLHVri
         eOeEHhexl2RKwo2MIFjU4uy8hLsOvyNK3G4kb8LJxv3AGal2OfXwjIwHYjoWqQhleoGE
         h2+b6BipGQbCjE7ZOn1b9Iyq4OTULV9EriaG7sHPT4uEzpiKs+1OkDvydQUu0zR+HCqd
         y6ZlDVFUmPVQpCsC5j3jJHApDcPsyHBgJzKHZy1286oIZNvLGVv1p6M90dA6Q3i5xJDG
         +/fQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066661; x=1790671461; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WsVALZGvNuNx3Pr3M5+XTqulMSxCzM1LXdhBKksMaY0=;
        b=SVpOLVjSOXBsn3X5rkexY2ODuRiSuigeaafcuqg9cc0HEEB33C0aiJW+lazBFfuT4V
         CeT8vlWAhfevQG58IHZboFwmSizGlWIEpEbReSlUBkmLNC8PFqUP9gQ432RIvRPmKE/k
         ag0YN4WR88xDkzaMXHvCGCAjhrVP+DWfFz0F4PirVfThOy7ytCxggEjmnq5S9swoS3uY
         R++kyil7ZJUDyhyPsfDri1h42SlnYsN67fbdtXMkiCTZDzuQli5g3xkFijAQ+vMzJM1e
         nmPh9zpyKo7rUwH0AhPkrlA+qMRhKZVF14kWqH+OzH6UR2t2eO019tWDrAnMdZ5IGdS4
         f3ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066661; x=1790671461;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WsVALZGvNuNx3Pr3M5+XTqulMSxCzM1LXdhBKksMaY0=;
        b=sV3ZGmbDeOY3pty3yDVZXodKgkFQmOqOYCSh6zVLRhwaMic6wHB0yKMy+YRgH0EKBm
         9vU4g1/PaocFzazOD4/iuHiDJfXIbDUv1NaEYP+7Yfzu6HC6GkT2vP0VbVDMPgr6UB/X
         Ln5wwO6rGcsWbIZHv/wV2VjDjET6yoN9Xe/HhSxi0ABWfkTgyvyO+4M3O7s+RYUE68u4
         JyYTNgxz5FR+hnLcNzmqDD/UJUrhlnnKay6s7oOhfjwCumMB+cjKZgZ2MEIoPbtv6ND/
         WEWDJBZ4PKNuz3PqfjXgxw173z/VycqmI2mhenDzCwEJ5Z5DY04qKYG36Ck6TAIqE0bS
         UDnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgGp4d9xTrR5mIobCjq9hg4+rUrXShzIxWbKGkBytpsATEY7wXdEtOsujSJOHr4r54REqdp9q+H3Vvzs2zji0=@vger.kernel.org
X-Gm-Message-State: AFuF++mEwWpPGlRAuvxvi94wM/6KgOCK+Rc4VpBBcedGXCq/ovOxdVUZ
	J2hvO07LTIbu0PT0LLaoCx0/8Bf5vHcmNesU8hVwsotM0zxxo7zF+ZhRKrJFW3YouQPZMVLAT8G
	Y8uVJxKV/fqKMixBd2CsutCmZ3ipRPBg=
X-Gm-Gg: AYBFou2C7rlSXLehbPWpVRpc8ZLXIEEHRMyp7ojiRPVm6Q8lp4vQZurLO7WYQ9Aoemy
	brMBkn8/1Sm+bJAb5w09ei6Rqr2WRXbuMClq46cT7pfYIUWXO53VYnb5vA+0nWUENgUJLMC24ZU
	EXSOgYTzdSgfiTV50Ce/MU9b380CY9VHkVXEx3PGC9E5/5PK2n+r3uw38F09D4gg9R4f+KvP/ee
	Ns5OTBmqbzHDWDm00ZdcbRB8wTw9rNxcC19s7kpds4Y6m6+znFOuiBrnDcFPInSx/I5V0aj71Zm
	BRAl838dAFygjyHPewTHfzHKygrDaUqJKK7rfW0Gv6ttLHW0L/uMaSifOu9VOPLHjbbSUWB7ULu
	0qNZYW8U3nzvEau7AvA+zOeaN24WfgWo8LtU5JxKIVqxP
X-Received: by 2002:a05:6512:b9e:b0:5b6:1870:2689 with SMTP id
 2adb3069b0e04-5b8c1955f0emr3870626e87.58.1790066660778; Tue, 22 Sep 2026
 01:44:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921235951.3214-1-sigefriedhyy@gmail.com> <20260921235951.3214-3-sigefriedhyy@gmail.com>
 <adc2bc61-d832-4e9d-818b-e5d03fed0fca@6wind.com>
In-Reply-To: <adc2bc61-d832-4e9d-818b-e5d03fed0fca@6wind.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Tue, 22 Sep 2026 17:44:07 +0900
X-Gm-Features: AcwNN1VJxh1M-j0f2S_sS1Tn5lZAUShRZrC3tTvY2gbK724PVnkPgKNJHtZU710
Message-ID: <CA+7S2v+CCVeVVCeF8_hxL=mya2pjrT9By6ey+kAkjRWG8xQ1hw@mail.gmail.com>
Subject: Re: [PATCH net-next v6 2/4] net: add AF_PACKET multicast dumps
To: nicolas.dichtel@6wind.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Ido Schimmel <idosch@nvidia.com>, 
	Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Nikolaos Gkarlis <nickgarlis@gmail.com>, 
	Paolo Abeni <pabeni@redhat.com>, Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 4:20=E2=80=AFPM Nicolas Dichtel
<nicolas.dichtel@6wind.com> wrote:
> dev_base_seq only indicates whether the netdevice list has changed, not w=
hether
> the addr list has changed. It's only a partial consistency check.
> See inet_base_seq()/inet6_base_seq().
>
> I don't see an equivalent of dev_addr_genid for the L2 mcaddr list; it sh=
ould
> probably be added.

Thanks for the suggestion, I will fix this issue in v7: I think I need
to  add a per netns counter bumped on dev->mc changes and combine it
with dev_base_seq like inet_base_seq() does.

Thanks,

Yuyang
