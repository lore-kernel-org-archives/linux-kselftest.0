Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1759336885
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Apr 2026 05:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775800575; cv=pass; b=CjwPo8uo8NjoCnVL6N9OI8bqiGwH5JQvpOPRBFNFPgu1lBgWh0eDtt1dVcaedHm8tPy4+bKF/19HOoN4Xbvs06Cp4wx1QVtzMYEQNoxRZbHeONvBEPenHHlUayATDMrRKbwkea9rwXk2xixO9+I7r+julcV772WrPoJPGSHEapw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775800575; c=relaxed/simple;
	bh=nhsMY2R6luhc7qcTB63grjO8Qh2xfLCpichqu/S4efk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PI5dOUQ7ScU88ui2vtD0nuvLy9EtuOCEBkuR4wSVbcogeqW1bTsEs94puUAEgKw9P7CGR7CQFQtJ4aGVoKMQ6y4sT6mdg36gk/mta5hdGE/o0AXl5IZ+2GDPprfuESAvu3lhjkiYDID/3bychm5rHeDDGYKX7+YdHqFZOkzsYUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fHCIffkF; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fHCIffkF"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1274204434bso965110c88.1
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Apr 2026 22:56:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775800574; cv=none;
        d=google.com; s=arc-20240605;
        b=Sx9SLv89S+tbQw0tgJOD9HqSIKao5PFEUiVJtDcf30rKxmBaup2UVSbmt06nLDC0u/
         aP/L8wawznhhq609a6+bWF3C1CdrizfC3iU0kqfDXNaC0HmJRGkfeUNHAjpHI5qx+oL/
         WvdwCLErUm2pF9pj04Nf//XT1kcrTFhRjqm3fUdU4JmVC2dJl3btBwcsMVJe/inlTXO5
         IkjEokfd5Yvyxxe6pyHl/XdhYGyW7l+8oihO2eEjbRKsHYNWurPfX+Bm83Cm67ptt7+h
         JouMCkDwErxbv2TAJ0DapMV5V5EXeSVuKnXSEXnz4G34kiwwBtcX5Fy/vaQUiUrQ3eF3
         kgvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nhsMY2R6luhc7qcTB63grjO8Qh2xfLCpichqu/S4efk=;
        fh=DUmeTXB9r38+wtkB2pE1EEM2kttiRQFFVuB/MLpjQDo=;
        b=SCEMJEbGKaOBJPPxu6cvVP4y7xZ99WqOCeaZWtqkl9f1FIIP2oyaTJr/+D03fMM8Kv
         CLbiLO+IW0/Jih56th5jBb8ew0wQrTFeokZfEj3JiyLN33ZZeCZlQp+SUonY7B2N0mqs
         DVUwA7ADh/wroKq6J130nzcoGFWWKF5tfzc/XzGvyxFbREAjS5QJ63oH3ESNSOxsLAPz
         iZVWEtvW1jyqdMHy8gsglzqC4IpYJz82Iq6yn07jloomEdQBoDLoP0s7fM2oGhk3iwch
         TK0+68zly7oPV2CwLRqvu4LWurvc+ZXky5IG+5Fe/Kc8d6LoUauW+4MEInXPKQNLuJBl
         tdBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775800574; x=1776405374; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhsMY2R6luhc7qcTB63grjO8Qh2xfLCpichqu/S4efk=;
        b=fHCIffkFEgSitoQZwYcPBoHSgIsmNdibBjtWD0dI8qfsBHcaUpDv1y5O7+dsntg4Mj
         guaUhxgyNfgeyIpI+jHeRpkWJEYNKR55bU7KuOdEoSH69L+C4j8HQoOJkal2SjelG4fn
         a9m+ST1FJd28fp5xNFncRSG4F8vDdbw/xaXCfwqC103lbN8smO2i18gpv/HaV+ZbOzpZ
         ksr+gPQf3t4Se/QUBL8y43F6Tpc++pu+C/JM/ee0shlWybqlNfplU5BG1IHl/jrd6BoL
         Gto3M5LsN9awznVXW4ylpS2UiR32M5wu9zqJJKvqfIueKpKzRwi7xzUSucbcM+WZbYm8
         XrDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775800574; x=1776405374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nhsMY2R6luhc7qcTB63grjO8Qh2xfLCpichqu/S4efk=;
        b=ogB+GaNj2lyAdTZ1siGdNco3TpaXl2RFFBMAfHBRA1CHpawT7I1ZyDttxxZHsWhj47
         e7Hd//J6E3B0XX77xMYKd/Sn8Ai78rzzK/uHc8IypsSeb9NcjbK6URXodxvBkCh0OkPQ
         rZzdArxdB/E8yyNMd8HSBqphd29xPsrez3wmWn4GIIs1JAElapg0yAXoj2SubHgbrc4s
         doOr5D7Z6Xb1voPvx3AqO5Fwf4PQADD/ZkL4eOOZOejangud88kGlu2NGE59xN0ue6ln
         6elLKpDQH3eQSfnZ5vvm3Y+ioyVQzTsQwRED2ABCr8Fk/qqT9Q6zqfP0T9ZYkniprhqg
         /8dQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtaDcTec63EAjaDPMuFIU3kIo9TUqRyJRxrCtUFBisS8Ots65+q1lwqUhWtlcw1ROr4WJ+76gwg/n3yytRkks=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7S0mjI9CfLIDScjB0+gZPwYw+tIoeWY7vnh6yCdn6riJduDll
	R+6xGNot5T/rWg2GNDA6RTTrg98QxMLP2QXlb1QVosfufVdxAxFCbzCiE2+Hn+Drvkkl9/yIHp6
	Oe2Vqjr9OItvetkl88U2S378gYX1BYeBbIQBzMz+k
X-Gm-Gg: AeBDiesi1z/gmUKkoCiJH11GEIvKVSuzOTLz9wk0xSoVlS1OaeImqXPSv0WWSkxv5R8
	4VGF6prLfO/hUrgQy4AyTBvzXRAD6dzHJEFQFLw0sjdMkmfdhQFuZZrWenpPxfS0YZfyJiR8Liq
	JpbU/MLPYGPcLZeHJNoMPnNfVF/UjbtjqrCCF2S2wJ5LxZj1+LI6eZ0irouc3ZaqJRVcxZWAp+W
	ugJKXkMhSV0YgR71/Ot+8uoBCYf8z8rcu1pHrDDPkpS/Ej+RI5XJuR+e8sviW5Y4jkTkL1UdKdO
	J30iXncQVIL2ns5pQpq8aJ7sj2tly+jf95ugbSGfFUfp+m5GAHJqMg3Wi2U3JRQtQGQutZ7cyGd
	l6U+jDUk=
X-Received: by 2002:a05:7022:439f:b0:12c:d3b:f0eb with SMTP id
 a92af1059eb24-12c28bff23bmr2940180c88.8.1775800573242; Thu, 09 Apr 2026
 22:56:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260409-teaming-driver-internal-v7-0-f47e7589685d@google.com> <20260409-teaming-driver-internal-v7-2-f47e7589685d@google.com>
In-Reply-To: <20260409-teaming-driver-internal-v7-2-f47e7589685d@google.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Thu, 9 Apr 2026 22:56:02 -0700
X-Gm-Features: AQROBzA9Gpi5wED-5edeFVS5f-uLhTqN6TRfWZrNTxnIiAQrrlALwhed4PBTrdQ
Message-ID: <CAAVpQUDxnbbO7FyAyFUL1qCT_30kknVDy=mreJd7M7SgyA_YBQ@mail.gmail.com>
Subject: Re: [PATCH net-next v7 02/10] net: team: Remove unused team_mode_op, port_enabled
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
> This team_mode_op wasn't used by any of the team modes, so remove it.
>
> Reviewed-by: Jiri Pirko <jiri@nvidia.com>
> Signed-off-by: Marc Harvey <marcharvey@google.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
