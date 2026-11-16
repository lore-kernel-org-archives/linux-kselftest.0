Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855340;
	b=FH6L5/NaZ4PfM+qVmtBY4jJULG+7HrQTusOKOMn06fsPxskniitXgsmFUPa5vALpfdiw
	 Cxzk8C24iWNkQu14ofShkzTwJ2Fp99qT4yZbIzwpSpzIpjnPANF9Bsa7B5WdGqk1akfKZ
	 0PtVwoK8r4LjWHoHw50gOAr/xzJPbc5c6Lo0fVqJ8beOmXIItaXnpNF/AVYH40AYea5rc
	 8CfoRVvqVlBUNrHeKNSyxfB4N6e4XFOY5SltwLBVZi0FI028oPqTIHXBrHHBb4Oiwj3vE
	 MjttPiJ4KS0/6CCTxR4EnqmP6cC7F/hKN1l+ssV48bfxVa1GyJYvkr74MJXLn67/P2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855340;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 DKIM-Signature:Mime-Version:Content-Transfer-Encoding:Content-Type:
	 Date:Message-Id:Subject:Cc:To:From:X-Mailer:References:In-Reply-To:
	 X-Last-TLS-Session-Version;
	bh=iZtb3tH4xNYkL76uno5UGFzxRxz8bGX3F04QPuTuxWc=;
	b=HaSWXVkzWf9l/Ad6ddRox2qaxppQPiYLfrMtUnQJR8gMB68CUFDv1uHV2JlE85KOElMt
	 Hr+5MEftWt8P+fSEIfElfBu8LUFSO4u5akLMtE5aTMP8gb+FTapzeMd/wyKC7jk6+kIS8
	 fSK5dCitkUtQWtqd+cGA2X9rUqNfqXgB0hC49GAcZ40ApHH7jgvBX4OWjZ174dU/liOXG
	 IBlYy2k2j/jeCs3xPGdq1QAH2ps4bLL5M+TZTq6DhKWcEo0IAqRRKPZWOLP5Bn0gcydtZ
	 yOQYVwjhLWu5lZhLnKuMoy+N3vcAY2Y+XMiyZe2nA7Go6Vqy8Qjz2HYcKHFjxqE0A1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=marliere.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=dkim header.b=Hdv+rSQS;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3563A606A322
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 18:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3563A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=dkim header.b=Hdv+rSQS
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-7190d9bdb2cso3082824eaf.0
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 10:55:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794855339; x=1795460139;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iZtb3tH4xNYkL76uno5UGFzxRxz8bGX3F04QPuTuxWc=;
        b=frr+fZwGpY4qE4Odg+bz6gZWSswWyGmNT4AgRUAtOZ9AtOu1Infbevf3Ld8+D57wWp
         Ab3lL+iSUbqWag1gI92PmsT5MydLQkwczkzJao0u/o4v6kkbanvkoQfzra2HMfB/VtMR
         81pfsle9IDdjt9cJbVJ7JlefnH74yB0M8lZobqgCgBN9+WRpnvR8+/ogJxJFYpVeMIID
         rG2Fs9yZtyAJnSHTGGAhT7rXR5/mJfBwFPIdGvM1jAQnSks6iBmaWxUo8L3majlkYPH1
         AuSAxaPV+0BMUhmERl/M1IDhEkoB1RMz+brB9fId3ExefOSm61nMhs4nk4F3jOinE8Xl
         M0zA==
X-Forwarded-Encrypted: i=1; AL+hErHYdfkqJQ7bu+IVWjaVS05dtI3KukVM8b6bMQ8jWe5xRja1Ty3KomI8rE7+NeujU7ADn1SwsiUm658+OTFEREI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yExXwQrVS4ZSW23G9n+r/E2jLCHUmHZJ9UW3KFiYEx9z43yqp
	VUngOA+Y8b3wRPukZn7ID54m9uMShL3SB2jc+gkEkiubU6/YCvYSiIR+
X-Gm-Gg: AYBFou2MN69h/gHJUfeXR/3XJHjy73VHW1UN75xa+d14Wtn07a9Jt/wKmp6mGlMAkhm
	e0AU5npaJt7eVBM6JAFMWDa8rluUZNzW913UJbkURcOasAwjojpmPte/nm2XhLgF8lE0FlvpTPY
	uOunvyHbhphqQG4kGVDjsvx+4m8LhYRxzwZl5S+z8mCVYmT2wcoL1DG2CoDj5RMlozw61giVzsD
	NWFdlReDRAaH6Nn7FHepH4vClYaQ3fzeNMp9RB5tJbYh72pbA322xbG9fDfwbUFdymdE0H6m/mh
	D/VoKGCVTXL1b1I6fIefW4uHdhoWrqWOMLbv9WO1v8qZCqcKH4UY4TzNwN3O0lUjWkPs81+sJGl
	z/kguYyDT3mW3nLJ3Qgx+B24dmDR296MFQNqtBd7ANhNQ56HFFK3dLTzDWghUrUH3Q3/zC2ji1j
	TaI4rQpmD4R9x8CLw/0nrnp4ayNqGARSlMzZWQYPH6d76cKjnHEm6yEi4bmlilpwKN+AZCfAsTP
	eqiidGbqiUy89n+PcdZ9ST2ybXetxGVq+qqV5OXgX8YNdLLJMDBFIx4e5zTTcyVps9xb/YL6zE0
	NYZBaBndj5YbsynY6foRud98KMr7JC/zv/KWs30aLCzd1zuwFhTrI/6VOLFyIEdT0Foery93ppu
	bjwN5qOHvVDN588hbe/hx+SbSlZM/E3lZTjtk9DHk8uIpvC2XZ/FL
X-Received: by 2002:a05:6808:3086:b0:574:82cd:a022 with SMTP id 5614622812f47-57482cda6f3mr3160064b6e.15.1794855338711;
        Mon, 16 Nov 2026 10:55:38 -0800 (PST)
Received: from mail.marliere.net (137.65.66.34.bc.googleusercontent.com. [34.66.65.137])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70650e91sm10359756b6e.10.2026.11.16.10.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:55:37 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5DE26605D4;
	Mon, 16 Nov 2026 18:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=dkim; t=1794855334;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iZtb3tH4xNYkL76uno5UGFzxRxz8bGX3F04QPuTuxWc=;
	b=Hdv+rSQSDPv5yuuTaPLYD3fJbxUOeZFBKK2OysFIBS3B6sULeKrSih7aTWt5amgr+BWKWN
	epcmd9uHu8BA0WpQ7zMVtXYUSUXP9dwjueimkB+fvbUaFikXjFwhYPCoYKvx97cSMEIDii
	B+ZS3Nc2ZRAdvcIw3M4DhETmrnxylBGDohG1/KBG+/bJTiljjJ0mPl5IziP36dRPqJb4OS
	eQopJXQiQacpZRoUAvofRfi8juhfQEN4+tcq2JgHJH/rr661nVZh4EwkkvHEfScVyYJMwy
	Ip3zObxcd2X7e7OlEuZsBOOmr9tV5Rmi9P7AiugdFKIOatj+6HYrkaG218Gqpg==
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Nov 2026 15:55:30 -0300
Message-Id: <DMWV43RJBJPY.3OZT23NFSC6YU@marliere.net>
Subject: Re: [PATCH] selftests: quote tr character classes in runner.sh
Cc: "Shuah Khan" <skhan@linuxfoundation.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Jori Koolstra (CIQ)" <jkoolstra@xs4all.nl>, "Shuah Khan"
 <shuah@kernel.org>, "Cristian Marussi" <cristian.marussi@arm.com>
From: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmUgKFNVU0Up?=
 <ricardo@marliere.net>
X-Mailer: aerc 0.22.0-17-g7220139118bb
References: <20261116-kselftest-runner-quote-tr-v1-1-e6270326db66@xs4all.nl>
In-Reply-To: <20261116-kselftest-runner-quote-tr-v1-1-e6270326db66@xs4all.nl>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Nov 16, 2026 at 11:27 AM -03, Jori Koolstra (CIQ) wrote:
> The unquoted [:lower:] and [:upper:] arguments are subject to
> pathname expansion, so a single-character file such as 'l' or 'r'
> in the current directory would replace them and break the
> KSELFTEST_<TEST>_ARGS name sanitization. Quote them like the other
> tr invocations.
>
> Fixes: e005ff01bfdb ("selftests/kselftest/runner.sh: Pass optional comman=
d parameters in environment")
>
> Signed-off-by: Jori Koolstra (CIQ) <jkoolstra@xs4all.nl>
> ---
>  tools/testing/selftests/kselftest/runner.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/=
selftests/kselftest/runner.sh
> index 311811dc55a0..e81a35e607da 100644
> --- a/tools/testing/selftests/kselftest/runner.sh
> +++ b/tools/testing/selftests/kselftest/runner.sh
> @@ -77,7 +77,7 @@ run_one()
>  		BASENAME_SANITIZED=3D$(echo "$BASENAME_TEST" | \
>  					$TR_CMD -d "[:blank:][:cntrl:]" | \
>  					$TR_CMD -c "[:alnum:]_" "_" | \
> -					$TR_CMD [:lower:] [:upper:])
> +					$TR_CMD "[:lower:]" "[:upper:]")

Reviewed-by: Ricardo B. Marli=C3=A8re (SUSE) <ricardo@marliere.net>

>  		kselftest_cmd_args_ref=3D"KSELFTEST_${BASENAME_SANITIZED}_ARGS"
>  	fi
> =20
>
> ---
> base-commit: 4d038dae9e5ba5b3fec87fad5b7bf3dc45523ca1
> change-id: 20261116-kselftest-runner-quote-tr-467bb5fe6dac
>
> Best regards,


