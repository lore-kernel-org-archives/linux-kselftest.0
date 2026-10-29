Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793277412;
	b=4gWs0JAAuJEY0Qw53irb5KCl/f9bMHfArR5fFE01NwlnzvymE5mbOfQZXo+lb+KaDJku
	 tgqvBF1cg6O7BOkQx5fTli1J6qlC23bXMURFPzMrg4frBAZEu6d9pk+AWutAtUSRJSb9l
	 5tyB3SLdIlxLZb9DuTAWcOkq7IP0KRGGvNcmj9RO9mLYwRnUiuzGm4kw3pEDw07/La3Rj
	 euJTb8t1HcH/EnW+aQloEwYFUPo0O8E3+QOKD6U1T/1Oi6y9bSABVJCOIOy/NUCKAliHb
	 zpfL61+NSPLHxRvDpD3loo+hmkk4Ub+R9qcSaXR1scQVGAim3aBwBu8jzIi9Wcw9Y5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793277412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=hmc/RolTYy7SeBRxKLMjWzilnvA83GevNb7ysMoswG4=;
	b=hRdXwymx0T72pQJee/G3Jd3PgwEh/G+aKDL0yAcZv7M7zr12LcNZ3sodgbQmjUccXJV4
	 mM4BbCTr0vQF0jMVTgMaJ2e/CK8fTQYD9WA8UvckKAE6zAGTEOVCAMqDhzVzaKs6BoSK4
	 S+zPem3veRYPb/OVzgugCw0mQWEcg3qCoXzVQBSAKOpjOE25WzDfLRCaxQTuBCrIPuJH9
	 iLTkN7zXOqKOHxyxI+g1U5eCJKzIEr1KR+iD+oIT8upr7MGXDDSwHdIA0c2TrW60Zax48
	 BXGLtFIjx94s4qGiRd7jPuD6NqUdo8Ksdu+NfqawYRarq+kmlvxQWT7Z2N5TRhHEPJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=py2QzJFY;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6653A60A260E
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 12:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6653A60A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=py2QzJFY
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso794802a12.3
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 05:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793277412; x=1793882212; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hmc/RolTYy7SeBRxKLMjWzilnvA83GevNb7ysMoswG4=;
        b=py2QzJFYgzOL03zGd3mHO2Bdili8XEZjmTBrfP3m4bXJAzbCdzUnE14wPgfXIR/hKe
         zAtdXpeTk/pgITkJricxOBeRqKkncsIhziwOUNdrF4Nqw//AZxy2uVu7JyYGMeJN48FI
         trZb0Im4c61Mqbor7x1XbyPT/JT2OH8M5BqYP2ShvyUEiWtu4h1h61NvSmb2oPk3XWUd
         KqfWHqesgeqXa/Qhksfi1BxV9idSCShFWKVwLAy8e2qHEm31JHs9zkkyVIImFi5Wd/Im
         UdHQmnMvZb/drJfythss4ld8cwQ/Q9/+VxqcJUUWbduiCALdGR9aa08Psyv3dV11sL4J
         uoOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793277412; x=1793882212;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hmc/RolTYy7SeBRxKLMjWzilnvA83GevNb7ysMoswG4=;
        b=RqblXYKXRHJ19c28nA1sceTTgKiLXhoNfz/FCrELcWUt+w3zb4m8z4f2Gg9KZaNdHz
         Tfux45bJfsB4aKd2d/UO52JVCjcLBrTXXvNMeoviNlbHTp+JGL8eO5Kk78oS7eDUFMl7
         HRCYUVmkVrBQ2ISyNplcptid4fJHFWmY13pQZvYVNcMjGK0ZnUSLnOf/Wi1qq8xsH0vA
         PgJIWN4nnxLxsVY4/hlGP48Vyq/Igs43D3/92gSEKseubc6UfZ03bOdx+RVwR0wC5Gt8
         gmUWckkzX6xv3UxvqnWXKxuWVC8LzOEYBtalPmg1opZNgnoHlEkDINOVUy445xP3qO80
         JE1w==
X-Forwarded-Encrypted: i=1; AKwUvBwZEo3hixtWKQtg+5qKbSeIq5zLBoZwpm62d0D8eBVxeb898aLmGAr+Nn6rqEu2ZzvZUgC8RjvchRAArUi7Ek0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaldcpKKOmkt01sJn8N9Z5NYEg6i78f6NreZabS3y3abnslcAW
	0QydmDIZEmWvSAR9dM674DwcscEMsgj6EhttUYJsHU5JaQNNQ3daJNGU
X-Gm-Gg: AYBFou17cBTAxL9s8I+pb5KBTDwOhqStvdECoiA0IPCTAOtF2J4n+v7FaiH0SoAgFrS
	RMts1l2BGhdjeBJ5SJfGO0L61cDP2ueD6zooeJS+BJ/jFtNyBuFMyNkmvtfgbew6dtG32NZezLx
	XqAsQkQWrEIaRjd/JLO+2nEEvBunlfUelaEsd/H/F8RP1s/y3LjbbMxYjEvHM3W6fGbyL5eGdUY
	PeCgcXlurX9zo3mX5hWjABOpxddl+bE9hQDMAq9fMWUCjw6J4OTu/fHaNEGgaL9MQu7CSqkna7I
	VoaiCjKqYL7JzpCn3mlCc/y7cPYHtkg4/+fo3+wVfW4njsH+rz8e1TDh/qwPefdmlLrqTDCMIO7
	cuxYlkjkPOfBvuaVYqrcpwHsBZfY2kGhw4FaRdJW86lfDpn2w+nRh+1upWasX1eV0wnktYEsA2Z
	uKKAm10Ok7Yn63rnBVwlNyTmk28ACBRr4lXY8W6kc46Tj/Pe1V2gnZry8oYU64BPJ+aQAFOCQ23
	nf8bdtiullJvQkOb34CctL1M3aSJw7oYS7d2/2qJ0GXae1XDTbSvqwDlTNqNYMf6wHtMKlHGL1Q
	PwFPXZLn+fajbmMS/hbjsHNA5wM5+wu1qsEjLdiOSmzAUYBD1Ggk/xfGaNQMjy1oFJg=
X-Received: by 2002:a05:6a21:8804:b0:3e2:97ac:274e with SMTP id adf61e73a8af0-3e9023ed955mr3933798637.65.1793277411671;
        Thu, 29 Oct 2026 05:36:51 -0700 (PDT)
Received: from smtpclient.apple (v133-18-180-162.vir.kagoya.net. [133.18.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc46482sm5225375a12.11.2026.10.29.05.36.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 05:36:51 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH net 2/2] Revert "net: advertise TCP MSS from the
 configured MTU, not the learned PMTU"
From: Esko Mobius <echoowall@gmail.com>
In-Reply-To: <20261029112045.5e7d4317@pumpkin>
Date: Thu, 29 Oct 2026 20:36:33 +0800
Cc: netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 Simon Horman <horms@kernel.org>,
 David Ahern <dsahern@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>,
 Jiayuan Chen <jiayuan.chen@linux.dev>,
 Shuah Khan <shuah@kernel.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 regressions@lists.linux.dev,
 linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,
 Eric Dumazet <edumazet@kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <40993B2C-6390-4BC6-B4AD-967518B0CBE9@gmail.com>
References: <20261026-advmss-revert-v1-0-272fa4b7ecb6@gmail.com>
 <20261026-advmss-revert-v1-2-272fa4b7ecb6@gmail.com>
 <20261029101859.6893f1a0@pumpkin>
 <22077B76-12B0-4DD6-813E-A3968003575F@gmail.com>
 <20261029112045.5e7d4317@pumpkin>
To: David Laight <david.laight.linux@gmail.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)

On Thu, 29 Oct 2026, David Laight wrote:
> But that relies on something having gone the other way first.
> In general that won't be true.

Agreed, that is the same point Jiayuan made.

> It is almost worth implement something that retries with the shorter mtu
> to detect the PPPoE mtu blackhole at the sending end.

Linux already has this: net.ipv4.tcp_mtu_probing (RFC 4821). With it
set to 1, once the retransmission timeouts reach tcp_retries1 the
connection drops to tcp_base_mss and probes up from there. It is off
by default, and the same goes for Windows (EnablePMTUBHDetect); macOS
turns it on by default.

> Or even just use the shorter mtu for long RTT connections.

Both of these have to happen at the sending end, which in my case is
the client (it is an upload), so the server can't help. The only lever
the server has is the MSS it advertises in the SYN-ACK, and it has no
RTT sample at that point. For now the MSS is clamped on the path.

While reading this code I noticed there are no selftests for the black
hole detection or for MTU probing. I'd like to add packetdrill tests
for both once net-next reopens.

Thanks,
Yongjian
