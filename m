Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6FD36074B
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 21:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775164628; cv=pass; b=X2e+y+05bjRSx3s4ob5r0FXYzPnQesutz46hyzSkw6zSCQKpIodDqq6LkFzZeFReCSWd3v2f3mBHYdgUxHV4yka+MfDucdoKbrhfxMGueou2Y4MHfA/WpX56eEI05D+lfcdSCv7elo2fWdKcdKuVIis1xoBiLN7Q2qJpHmxWCjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775164628; c=relaxed/simple;
	bh=JYemv0pFJukvLWAyAa8iu4BJ0hea3asYhAZuD5UD2pk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AsG0qoIUR5fQz48qRzM+ehk7bJs7XxKcHsyCaPHu1b+Qnas4r46jxmIC2rlhgmWTVkA7++eNbtU0DhCFhtEwaitHAr6omwDEoA1KF426peFArF8YZYILdm9YNj94OjXALijkneqtpJUZLWuR0xYRVBcO7xAMCFDJGinA7ztZuTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DVJ51DWI; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DVJ51DWI"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-66bb7118c96so3962a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Apr 2026 14:17:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775164625; cv=none;
        d=google.com; s=arc-20240605;
        b=XmBxKerfVW66Gz9InoqEb0i18j3cgfcUKlNwX30VW1NcZW1YZsFa9iwNlyz08PwQUK
         qct8Q1Tym1y4te5IEBIJe9CRW1eKejr6o9gP+eFyLlDGM/BojD6YOTA/uMWThKdMmGJK
         Ake9Naaz2XWcAmafuXnEtNLjw77tO2E+lIKU5cYeThFSzCsKOpKVMIiIW8lCvSlKyM8t
         GwjhR6CviCf+BF4ZPWTQwANdQGH6KxH1+KcjfnfWaeRS+v5FviUmFbrww0r2zInAcX8S
         9t8KZDKzMJ8ZsrAZDIah4mbxBKB+7K7jtTTYsF9HCguu+vdxeEcoPA8TKHwf8GzjGTs8
         rSpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JYemv0pFJukvLWAyAa8iu4BJ0hea3asYhAZuD5UD2pk=;
        fh=hgLW7nc5P+Xtc7XsVk8Sm0jAXDCnh7OCOe7dYa/lNvI=;
        b=SdK2sXzBAvqaII9jXhrHVK1ziNcJcux1kcnZEJtUu0gv5sPEiFktPAWi0kIcXtR2EM
         Fibbavup7J/GlCTlzS/GtwrR2gHoGYhAx+IDFBZxOwey3Mj7/im7kQvO+07aEqrGzErx
         GfrB/VT80pq+4e9NAspHWyJyvHVfmxie+aTXE1PbmkwLTKNFrdZ5SYJvbHqf+3KJsn+2
         V1WZTWlkle7LCyLxFWhjbZ+5j79/YJTafekNkSJTrwoKbNJFrjS4rhrF+iZEYVm6cV8G
         w23U6dc+EJ4a/NFfkjh7F71MLj18lfwf+Cg6w7p4Dghb0OZ6jXdMci2s6QxI645MgxV9
         xDog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775164625; x=1775769425; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JYemv0pFJukvLWAyAa8iu4BJ0hea3asYhAZuD5UD2pk=;
        b=DVJ51DWIGVmvUkMPVa8dvWQXoI8HwPjgGEwI/4aWN9F1LCOJ+EcnjNFfHozgXoYw9n
         QxFPskwAZWtzbhMV2452RLmMLijMADld6KZGlx18W7nJgAje+NG1Km1o2BtRU/9fHh0g
         82TWBcUrx8waqJ7+F2U0z6/cJP3YUItWl9RwRvVxDv979EAMTneoiKXVXf2P4mamyewp
         Q1vOSCeyeEbZNJ1az3hX233/uufXsrbeBBZylBBKOMvQJw0h9lPWNoi5QV+b+8el9slm
         g+1oPyUj434iB6kkrQ4dqQxtuLfXHS5ymkOMJ1c5mRkpNEozwUHLAh5Un4lnWLCF70u3
         g6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775164625; x=1775769425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JYemv0pFJukvLWAyAa8iu4BJ0hea3asYhAZuD5UD2pk=;
        b=PNSLQ5vZyNfdSwUUKoHaXFnJMS+4Z4VY9sBjadMzo5sCdnjQ1u998uy0DCeTJ/4ZWD
         kEWRA00dC0SgAihCAKNxr/JYV4WhJG4/ZLx+t3MSFfsTCI8GdGFuRUZdz6JWJtof9tOD
         pW6BGc+8jb5GN0KMwH15Gr98f9gv1JjcNYHJzB4G6eFnN80TLrYCtXiiefydKEpmmH1d
         aHjxi8XizmPmasI/TGUfJVdf98AYvRVYI/nS3BSQERQ58fRIhY+O5gb89PDeTiQ1W5Ov
         B0ouf3oWXmkmsrZ0Fm/yHR0Ba4i5szk9trWcTRLOkA8eQNt6E/3WGNR35eL86WKWUa0h
         2I1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWsSR0NMszFfHQYiRDesuHtd5wuBhZ6XGM4wGgMOfQ+MmmhuBeNpTCgpbJfnm76arHGNrR2qqjBRiC4jEKoGwg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu9OgSrmloH065Zhqv0NQNuoTSyDwSLzvpBWS355R8OTzPSPAu
	3ooggPdQv8UA652q1KOPXxYFZghxei2OteVohv+C5rfJQFGhYh+TsKesvQcZqCihkQmrutobHLZ
	ESd1EUi//49Mg9vEHHEBys+qInCZJk6oUpOyJOfRoq7L3U+QOVgK5j8Is
X-Gm-Gg: AeBDievglSiyLDFULwaFbn9wIXVqR/b8KhdZcgewL1YXJZAZExtRHWrc176NkVfndIK
	MySqDun/0Dvf8PtSX1GflXtsoN/RZX+1ZL6/n7ndLKMG+Fo9B6s1V35NOsU9/wtDsFwhTSCFWNW
	w7FfI7NCXo+0gmWJniZ49elJ5lcQRP12n0qs9IxMbaXysbv+YpZpWlBft321NDFh056ZwCulQRx
	niSY+652sOiC4E4HUMKv+Pqy6fIthbNsawFKfIQFcN4ki1J6fjQcW3qdcOlB6LKk6FYsiGs4uzD
	5cpC/KiblG6vlBkaurCeLaostCLncaROEz/fgbY0eepyRSRcQ1LzmEJKtaskOjM+q052AbjIiQg
	ssnPq
X-Received: by 2002:aa7:cd13:0:b0:66b:ea0e:1782 with SMTP id
 4fb4d7f45d1cf-66e40f43978mr6990a12.2.1775164624812; Thu, 02 Apr 2026 14:17:04
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402-teaming-driver-internal-v3-0-e8cfdec3b5c2@google.com>
 <20260402-teaming-driver-internal-v3-6-e8cfdec3b5c2@google.com> <j4tjzpbsfu57r5bbqcpo4lfnzzonnmgye23kiyu4la5d7cxuq7@63nrgj4f3xto>
In-Reply-To: <j4tjzpbsfu57r5bbqcpo4lfnzzonnmgye23kiyu4la5d7cxuq7@63nrgj4f3xto>
From: Marc Harvey <marcharvey@google.com>
Date: Thu, 2 Apr 2026 14:16:51 -0700
X-Gm-Features: AQROBzAH5HMbiL0k4hiF5gpVjnYSC-HQWNnE9Kb7GP-2itiiWEQcG4Uq-kpwXM4
Message-ID: <CANkEMgmW693-_tiP8rC7ciKuvLOPwRJzFsP=c2bYdQyHREpKcQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 6/7] net: team: Decouple rx and tx enablement
 in the team driver
To: Jiri Pirko <jiri@resnulli.us>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 5:54=E2=80=AFAM Jiri Pirko <jiri@resnulli.us> wrote:
> I see multiple patches squashed here. Could you please split for
> easier review?
>
> Renames separate, preparations separate, adding rx_en separate, adding
> tx_en separata etc?
>
> Thanks!

Thanks, I will split this in v4.
