Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1335B372B28
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 10:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771928612; cv=pass; b=bE5sv8TwVVVbhwTcMjzjqYc/WyGSfbPzPA4X5fD0nJggGqu3/ZjsMHDtNMStUknKf3Ud9TpAV8p5vybZR8YzXtRKBw2Eg2Nt4nNBqpl3cPi8rAPgEhH6Yz7ottfe1E8oU9Mh1uyLfa0lTgd7mXi10vdpw2ozEaW9SQWoeIxEgTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771928612; c=relaxed/simple;
	bh=ymDqEaqh+DYHAffBFXkae5tLcnYn/gYShXk2GNzvf2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WNSaca6k87NYULkaoP3cycS3sDZKtouYsqacZDjpUSpcsY2vr67n43om+Bp1XRXK6Fuv51WHKwG2vA3/PDUEr2jeij9/dCkFVE5NGuk+1DP1CC386uAO52uDD8h53KFuFyrAMs9JMp+8liqR89iw0MErt+dykomAI5nqUPWPT4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I4AepvS7; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I4AepvS7"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-50334dd44d2so64460391cf.1
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 02:23:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771928610; cv=none;
        d=google.com; s=arc-20240605;
        b=C+tb2wUvLt9NcphzXetxQmnI2NM0r3b4mG5Og+8/xCI+bxrZ1W9Ba2iRLLNGTJvV+y
         yUwzOa/ZDNaWdLhA7ONa7IKbqfD14ZTKnKxCxECshY8d+DlDZ8bS7KaNj+/ELQKeDLRt
         ZaAJN21jmBv6zyEANye/C+Zmq6tg+A9Fy0OjtwrMZXbXyTwMT1VQXQEQQsEpkK12KQKM
         LPrNw/D7bpFAvhAVgkIduOIekhAooyKCabzd2Yamj7h2DOUC/oulXSW5XaaXUS4h9E2z
         40wA67Ag9efZ1pAtTndsL2LDddmIFVDk7i+UzTqayz+KfJ2O9B5uHN3cvrlOKZD5grEe
         eCyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ymDqEaqh+DYHAffBFXkae5tLcnYn/gYShXk2GNzvf2Q=;
        fh=QwY+XLUCBV5bMXnAkCjaDORB0HLhA9+mrMMAAF4+57E=;
        b=Lc173RiIkm/WMgZF6Ou6cCyxDaDHhCiFUGrTOypao4fjbfE/6cqW9riheXe+DxwGdo
         MKCs670zf+IxQgkmcNENylGwMpb2o4H6llDVzUV6mLkn34UWyXxFo3utpgWxly1IWf3Y
         h+CAAygoXR/R7jbgU4zvZll7hZBWFZH7OhNEbGH3k5MK6Oy8nbw6uzplxI7t4/CdmlN0
         HbbQxckXfG/I26efp0r798cwnSnucNGEw5+5PjKheunVkFTRojpCVpyYdIzkRLEsZJQe
         +wrzJ+oz1m3eUCAwGvVGknxVTXuj/dqwSIE7NI/Tk9E7spi8zWDcjEhfUueubMzNIH3X
         mWrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771928610; x=1772533410; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymDqEaqh+DYHAffBFXkae5tLcnYn/gYShXk2GNzvf2Q=;
        b=I4AepvS7p4FEOxBSVC1bLUxVSkEuZxLhOsqUGfWApn46c8QE2c304CyjlBu1adzsdZ
         Xv239TauWrVJbTyG940QdPxsdr5k52pY8DDgcqo8NdZe59bKUNwBIRESU9iKSGfif7ei
         SuQ2TTw0GCUd8GNNDphvxm33Fo5ZGYBlocx4ODkPJmBG1fxVIssr0hkjG96EmNcJUeSi
         DA9MD4imouOehiflI9j/KcyoN+sOsf7Og6XL1YH89CO6/ggfgHRJRLX9SkTlgFNA0Azq
         0jcZz0TlvvhgcFBL5Vp/J+Qo4Z4vh6PLng6i950/ROc34Zdyi7ekBssmhFyRqT1lLnoX
         56Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771928610; x=1772533410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ymDqEaqh+DYHAffBFXkae5tLcnYn/gYShXk2GNzvf2Q=;
        b=wAaCKAdsUGCp7z9dtI1ZQ88mLJNIDa36pwUhybgvS4iBkRLpZIpTiFZ9u+ZOdUBhRT
         2UVbEXHJXZ5hpJMc3S7c8AlULz0O/8CXt5BoSO4+e9eiOvIn3iOdDYeI1S40fHJglCuc
         H3YOM2k5kZ1CC6Ee4FdrUgepNbdkpshjxaMVoAcyl3DKEbVIONp6SA6neSWVw2mDuLDS
         bB0RTxqw8+jzckmTFy6IsN6hPuEHiMBXsCU1uY0iQFDF9eDWHBGPZvQMqYlI9QI5oJBb
         50Tu7nUON+X2KDo14s0JqHYoUegKgTa4ReW6iSpct+bhbyBDNSLtqUH9E7UiGA+C0ILx
         Xwqw==
X-Forwarded-Encrypted: i=1; AJvYcCX3MvkV7M74jHr9t87HnFW1bYnKeST6ULJvLLMLBDY93/5m2KCsv1W9NyJqY9sxrc2+enFfVsLQyDeBhgdB4SY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzV3sqthC4jHO1UjCQe+9l8Zu3Xs/icSj16llZ0h6opjhmm0Kh4
	2tF8vV17aBcpIC1zRk/3KyuuS0H1Lvn0pxrihPFEODAH+o9lowBI7PVU3x9NqypYcEHPcOs7iAC
	jZKCvapQ04rWyx1TKky7+6SVqMKKdXzAmsEdLvjWG
X-Gm-Gg: AZuq6aL0Jp4wnHu7DFNBQ3QjnZnvUooF0GYZ4HQNcNNo8zl/wKKy0u3upa+t1+7PIHd
	F3xmSwtKNlu99IrglsXDElwlkX3N0un8uAXmmXiCGi2OW3G6jsuIjohOy00RqLTCIUPt6us01C7
	T6oTojQozU2q5BT1gyEDTEfL1VPr7ArYxyoHXWWtGia2Aa494tgy0LjmXQCJ8ROKYbKrDAX/lO0
	MJ5E5+pDKcN6UE6JFKY/3s9QCosIBbFrSyazLjUN7ppuoHYd5LWMEJlntSjaCt6gM8Ou/XJyTXy
	GrmYPJZWlJJDQYpgaClSPL1WgLdJzSbydNrGIh1Kkw==
X-Received: by 2002:a05:622a:1922:b0:4ed:1af6:230e with SMTP id
 d75a77b69052e-5070bca84eamr178606781cf.56.1771928609635; Tue, 24 Feb 2026
 02:23:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224-fix_zero_wnd_fin-v2-0-a16677ea7cea@gmail.com> <20260224-fix_zero_wnd_fin-v2-2-a16677ea7cea@gmail.com>
In-Reply-To: <20260224-fix_zero_wnd_fin-v2-2-a16677ea7cea@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 24 Feb 2026 11:23:18 +0100
X-Gm-Features: AaiRm51O2cYH41gYEaKTeYeCg89LxXcA37cvIPhJnxQvNGjzHQ_0BEV3gL6Q3vQ
Message-ID: <CANn89iKLHvYS0BqdVji+N_g4ee0h1x8w1H_XHmRRguH=M8LRyw@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] selftests/net: packetdrill: Verify acceptance
 of FIN packets when RWIN is 0
To: gmbnomis@gmail.com
Cc: Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 9:20=E2=80=AFAM Simon Baatz via B4 Relay
<devnull+gmbnomis.gmail.com@kernel.org> wrote:
>
> From: Simon Baatz <gmbnomis@gmail.com>
>
> Add a packetdrill test that verifies we accept bare FIN packets when
> the advertised receive window is zero.
>
> Signed-off-by: Simon Baatz <gmbnomis@gmail.com>

Reviewed-by: Eric Dumazet <edumazet@google.com>

Thanks !
