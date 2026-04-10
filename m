Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D189387378
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Apr 2026 06:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775803253; cv=pass; b=INs32VcSVcnG6UFiKUv5prDz5HTLgtg18A9v0Ckh20BU080xP4ftB5qJq6eRi4wcEGy1fVADc+8AyQePptAdIsh+MqmWiUbgcGE8fZ4EnBV4SZ76xvaxkd3dt5murFvgDfhF7fV7jxtbVFrWRr6M7/QjjrFiwq4rW0SRiMifi/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775803253; c=relaxed/simple;
	bh=DMAKrl64OQ4qyDrv7kaUVNKQcJ/sC0akF0j723ydj8Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZqsHjl447xtN25BLiXkxxRIuchuRZArTZvtaElYfI6kKqjQ1TKMCwyqqLeVr6jzV0OczvUfjaZA4e8cxZ0MVjUlXJl4Ipxbj624/VyNL5xwlRj/he4Uspv4rHhnK7FB32q2JMou3b6hw5MScx7hvbHZxft/ZxxkxjYTz4ZEoWJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DEHE6PY5; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DEHE6PY5"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-128e4d0cc48so9011757c88.1
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Apr 2026 23:40:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775803250; cv=none;
        d=google.com; s=arc-20240605;
        b=DeLchy51mma+0DFtNN7d8iA5ryTLl6sSmw575rQnL9D8Nw5pOfapnKHRgBqf6Ovciu
         pawMMmgiIRET6K8DZuKdjWsAmaDJDxcF5lGeJcQkKOsvqRbhkT4m2WxW8OQfDogzrsBL
         TEIGmA6hO7tSq4l6+XYVXnPo18Y4DQXP1MV/B5lmVM7N+bNdayS9fsbA0nlxFJDkys3V
         Fc+ziD1W/g672tZgKK9dYkNzxi14Ww6wHNlv57Z1e72Pd53qXzeeV6xZbsqT6RNYycJg
         vvPxbw011eu2OpDbyubG7n/J1fTXEp64K20PAU2Uf69SLSNg3kIZ5VSIKiOAMSSglGtS
         uOew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DMAKrl64OQ4qyDrv7kaUVNKQcJ/sC0akF0j723ydj8Y=;
        fh=q98NsgQjvOhniMq0tUZ/pv+52A0BN+4LcQloPttrZqM=;
        b=gr24rT615HaiELfpJiIwMm/A+dlAPjDfMGq4zBZgbzsDtlNGpW7x3LySvMfp9/F63l
         LMchUZosB129EwHbCGoHykHngTHR0FXLfjIsj5rtclCeK5bOWi9sta9KmUz1YytUD0pY
         uRORtpxCLoQlxiVyTK+PNAZP9AXfBDsoGWchFO+Mv3lEdRylplkTsq8kimLXFGFKzraP
         ypI/xpJ0uGt+NEydNg+12sflqlR41PtU6g3gZ8OVK3gnOn3GnxxFEswLxl8OeecNwTF6
         tHIsv4IR73AwZrUFTypkDpemzwJ37hgH1sZaSUJctHnDpzNTBix37UrxEf8g0p+3xaQd
         Mj+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775803250; x=1776408050; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMAKrl64OQ4qyDrv7kaUVNKQcJ/sC0akF0j723ydj8Y=;
        b=DEHE6PY5gFx4xW/FbJ3Nba6QsKJFQEAYWvHsf7Gly8E8kVNrvMpfsSaO/UnsXgz3CA
         Syb65eAgZ+RRt3mogzJBDO4hPY1WcgNwfM0jKA1zvY39MZvq46mj6aM2nF3ZjOIR8hT1
         Ume1LxZRHLSpZOohqi3b7FKR0CdevWoTTePXCv5nPIlwlxGNrhrvkrrTiFs6SAOmsPea
         jziKTy7+Dy3qYMbV4pNW5zUvcvN2Powpn/1uZ9lFO44S+90C3vAW6c5+gthMwNtjUakW
         q9eA4B7U3aCcjh7+mwAziqIPDNvl/d8dB/B++vNYH6PkuaPs4e86nLqwzRg9gwbAl7WW
         fJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775803250; x=1776408050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DMAKrl64OQ4qyDrv7kaUVNKQcJ/sC0akF0j723ydj8Y=;
        b=KEjJ134bKWKN7TEGde/mN7H1MEyh6yMIVBdhZlvh+BjbVFAO5bLtIMkxvXpKbE1WNV
         ZYtyW8Q4spb8N5/H3Ld/7YlfRhoGdk4Mwv2GDFhsgQwdCqFq7SS6/QZZu8rkwIzlLgoY
         qJZGuLbpYbzXfLBRnydWOyXlDf1uEUPXN6Xu9k0aeNq7MwIwH5E+zlvdG6OhRHQU0l6s
         mGMESGY5B5Eu9i4385sPybw7ZBJ101Ngjv/uqRMWnjBS1GIRL7Y4Tefz5zz0Nh5qtWbP
         7hxtkBkbeKKb3iTEpOB870VI7IB4wwQpEYy/HWDZCod8AFA32Gk2l4fvbLkUIWWhrvSX
         PHQw==
X-Forwarded-Encrypted: i=1; AJvYcCXSGOZkA0bTL00l0Gc9nJl5cdF36f4P6pz1ZeI7eqtq+pY3EjODT2uoaw5rfMuXe2nzo4Jor6fJtqTxt6sCG5U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yza9JsmG9SSDReN1HTKxWWYFZVa6T9lsrCIfSP5wS1Nk92xRDLz
	9bwbPLNQzxD8xrddJm7DH0UR9r1pW7Jk+jj6hY+vtdEH/eCCqp3xZkC2LTtS/AtROAHiY506v9W
	Hu+853+MVH4LaRHdiEnQPw3IZA2lvRDwb/vFgFmIX
X-Gm-Gg: AeBDietS4K97gGLCXqgGcAnwhLoiSzzkzmtk6yA+oYVOe3E5x3cD9zvXaVS+7dgFdsK
	OQjG2f39IJSyHIuN30AGzTuL3xRHqe24pw2b04SpPy+2esdVdA6SL1CpTXKpPG9SoxKXhIROI6l
	dgpWwJ3yZiFVyVxK9YrIfFpo+u/803n4jhJ29ZQQyuFL6kg7QmwbJ6G1y+pBjLiw6S3JOyG1Vkb
	4o/aed8jckxMyWjTJOVi0pgPugfwGAms9NMrSg1O66Yxjsbrn8l6oENfQLxMhJS/fUQwh5+29Ev
	MT9DDrfoYjDi55lJvixGv3E4TBqh36gxPTP9BgGe7ch+tp3tEuW1yRgtdiZXzw+b8dxD7qxcq9N
	gLteAaao=
X-Received: by 2002:a05:7022:250d:b0:11b:b3a1:714a with SMTP id
 a92af1059eb24-12c34e8f8a4mr1325949c88.12.1775803249428; Thu, 09 Apr 2026
 23:40:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260409-teaming-driver-internal-v7-0-f47e7589685d@google.com> <20260409-teaming-driver-internal-v7-10-f47e7589685d@google.com>
In-Reply-To: <20260409-teaming-driver-internal-v7-10-f47e7589685d@google.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Thu, 9 Apr 2026 23:40:38 -0700
X-Gm-Features: AQROBzBDhp0ZqyoDg0bhktmSV6Aa5figfs_vUCsyeJKog5pLduGHStx9cOmEJio
Message-ID: <CAAVpQUDdGUunCHGGWaAS=a5SzBu_A3JXhQp792Qk+JPA2B1amw@mail.gmail.com>
Subject: Re: [PATCH net-next v7 10/10] selftests: net: Add tests for team
 driver decoupled tx and rx control
To: Marc Harvey <marcharvey@google.com>
Cc: Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 8, 2026 at 7:59=E2=80=AFPM Marc Harvey <marcharvey@google.com> =
wrote:
>
> Use ping and tcpdump to verify that independent rx and tx enablement
> of team driver member interfaces works as intended.
>
> Signed-off-by: Marc Harvey <marcharvey@google.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
