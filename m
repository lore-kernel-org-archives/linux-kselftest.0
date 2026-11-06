Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793924768;
	b=OHnmT0VLWaNwwBpcSrCvsibiyrfnf5Y6o5folPPB1y5JEx7mdswTmG9sGYoiWmztKQzQ
	 Xoh+Rl7wK5GKG8rUklB6pkK3PDYEuhwilLWDHYbxRcbP9J20fT+1//PimCwld4Vekweaw
	 QeEQ4NbIrbnhsS1QWwI4/LVDj+3DHk6HG29AopHFP9QVdkpZspOnL3WfPIKWKBfaX/Fje
	 W34BFu38xl7/joU0M9WUQUS903mh7pdOMNZTvBosvwVR9PJv5zg38GpEa4slUHFbLgqqL
	 Gzi6qp/NKlnnhqrlW3rAggk1082wiu3B9JWAlJMKDa/FiXXEXJ6Dm4heXOVMkr073FA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793924768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aRM0MqaYFgM8kL5oWje8tGsrwnDPxkPfJxLc62ETAs4=;
	b=eUGcQrV84/0W5C+UHydvTg73oO3IFNRzKOlsBqsz3gg/jxv3egMJd6XWnlT40Bstvh7Z
	 LG6GyeeLT5WgrRQMma4+wDu+9o29QfmKM3MzndXnt1ed05eDsKfRV/d2acImMtGLBeA2A
	 9+Zm8Qrqn2e3YcYb79gsGf/QDUMLGqgvizva/aE7b+303WSgDCphkhUz7RoQ2XKAJFS+a
	 FLEdza1CEfTDIRbDiuGs7LgGt60GVUJj94pzIgFMLWw4tQhRse2Ytgsl9FTvNPhswdJjx
	 rmVaC/5iVhTZ/jlPckoKEidGJ+gJxH67XNsf8Fqw5skfNjH//XW1PQkLNpR4TFvnqpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=d83F6fjU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F45606A31B
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 00:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7F45606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=d83F6fjU
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a07078200fso16174b3a.2
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 16:26:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793924767; cv=none;
        d=google.com; s=arc-20260327;
        b=ipJ377V92ThJjT/fkoneZ3PiS+Qw7nnnqtOH8H0k6GT3pRNlG69CLLYIceq9tIs2gw
         /g1kr7klxIDSTXPZFPD7YNzRteZT+OMou3xvzRk4IbNmZcBhrZOKsBJBFbSd49N0Y4ae
         JxD2Z4vPAHsfot8XEvamBPSnOyabzEzLEamgkpaqUa3XoCrjS8sNCddMpw1d1u2mY7IQ
         p5c92lp3bGA2eYiXN3xW1ja23CpTl+ljsS8f+n5xrutgQtZIutNsgzlKRdpntaujjp9I
         tWU7NxJOGrHl9yzPAw/v2KGJd7zKhRuMOjkZfME0SmZY2vp56Ao2xWtNOaD3+wj1vomU
         ku0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aRM0MqaYFgM8kL5oWje8tGsrwnDPxkPfJxLc62ETAs4=;
        fh=l8Q0bpxiouAXcfEctdat+YVdW4ZNWvDJ+mBEqOZBpzU=;
        b=NcCAdh5O1NpM1tbUJLTNcMd20twb4OvYrd/sWLjklomdNbffD47dmdGASvmh8SXp1W
         VlwWAGZTCK0xIuLeRUAGH8x1YTFEEAlK7ps8CMX+YsEWH4Gzmyr8QtaoXpyR6AOE6Yrc
         A3w+PegwEV2VpDahR554KpGqWqhjgBjO39/nXk+nEJhn+i+tq8dQyN3Oeol2/GPbrMpx
         Vm/U4Q3f+/U7qF2A1lJjYuElID5pPkXUjbTmuKmSxD71cmM7Sv9DojJLwADKPfr+31t/
         5e58UqLIRn2pSh19akte+AbZThaGC+154Dk3U4l3UNI9ObrCnDdMNHGi+87lsZXypgeo
         Brwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1793924767; x=1794529567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aRM0MqaYFgM8kL5oWje8tGsrwnDPxkPfJxLc62ETAs4=;
        b=d83F6fjUa1ZBrpdME9a3Bum/toMNbXvZWQohczhN8JN0lwKIZ3meGphEY30ky2t28S
         ivzluSzn1yi2zkkf1si+IKqZEPgZZCcMy7KBpXDTAWTHVwywFDMTLG+nOMJ7MRn3DWzm
         5wqy5UlwTWBrQvlKF4dxbN7koTImbbAUBjBCzavTCAtcuTZ51wrMPOa9XEOmvwrU0K+J
         95Il4LZkk5TLU6RD4SGClgPW4lQJrm+UgBHcn6n9zB6Y9lAIEpEPQ5jB/WgLLXEwlm79
         U+z+D5RdNGl18/LGAP03spv2iKDPGVhmSH8VX23yva/Ap8mXwM2h7BgH6Tk7jgMgXzv6
         bQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793924767; x=1794529567;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aRM0MqaYFgM8kL5oWje8tGsrwnDPxkPfJxLc62ETAs4=;
        b=nNaVyBQGhvssRVmsJZ8zbNgLFhMolSOVb8rDHO9fMP8WX3S4GqdX4k9nrE//S5IudT
         /EckdX5mbhDqFMSa9UfbpVML3G1A9KtKlHFTBOyqVWO5nE009+S90enw2MQUVxwqjW2r
         W5BZrK22FJJTDp3HB02bMbCVMZtynStRaRu3DWIZnKdlQtoA857qd1QuJiFTGzaIZhv5
         Tpw6qpmLoUaT7y2sTRmGvTgg9h+z8DmU3cBrqilTJHTDt+yxGhV+NPgLjpiEwDD+uvz6
         r9nFvVae/5MTB3eUxSJ/o/RvXT8bfYQdKu/1mmAk4KEVrrWOYMBZCSfB1FSe+byHI762
         tdiQ==
X-Forwarded-Encrypted: i=1; AKwUvBzehLciIiwfvADOIo0e5pYwoW9roXMH9ETVCFjlQgn87VEPHTzrCN9jm8cJUxfp75crKPE9pR8Ri10ozDREbgU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MeDBAhE3dJGCdwjQjvW+HyBTjCGljzXbvBwgccREXLfIVoJja
	+9MVpQh/mGaberjUWn3GCM3HhQ/2yU7AyHso06oZllHQ7x8a14QxnEqttzMUnWYXhabk2OwIWlb
	02SJoHkqYXSGYxUjeSvknq9iu0FX86UK6FY9CtatN
X-Gm-Gg: AYBFou1jKFhA/Osrl/62KE7OKtsk0fteyLFiJTSMNFib0qhzNT3QkSAf4kHWS7R0lqk
	We+CmZAGD/1hXv9Gvpq3ApXfWCHIlAZNvwhv3wORaeQUHT3NXMTxk34MQZHExIW8UvHGDDM4noY
	u1NrVwEwLf3HpfrIhKqu6xAXQOhtR5TYSGKoWsIU012wAfCoqlsPMkLAZjKYeO3mCiXP6ky3Zsi
	iztMxhKZT9Q1fkuwF5YiU0ivsF8GHEcQLU4GB2IlpiILGlnnYO4wU007CzY61G+n+NQE/qAsnFz
	gIhEUngzKMbv9XquqeKUrrcIc36ht3WCx5P9pm7NUbpZpGBEPTizt9XwPl5VzQDykJCxKjsKGDA
	6Dw+vSe4YwFHvc1KHrlvgRNbgwpDUG54RsOZbXqwF6D+HRrt92EaPVoXB0wVP7nMpmkBg
X-Received: by 2002:a05:6a20:938c:b0:3e2:78cf:8882 with SMTP id
 adf61e73a8af0-3ebb29700f1mr1259512637.25.1793924767156; Thu, 05 Nov 2026
 16:26:07 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1791023194.git.tjdqudcks0424@naver.com> <d7e10b50556ab3b79c7132018249f6f7c608411b.1791023194.git.tjdqudcks0424@naver.com>
 <asLNxHYQ/xQ6KaWy@hallyn.com>
In-Reply-To: <asLNxHYQ/xQ6KaWy@hallyn.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 5 Nov 2026 19:25:54 -0500
X-Gm-Features: AclHuK_pI_J9bw4ryN_WOBlGRzUjsAkahBqoHmTF4zFuyNsNV4GbMdflTnlEfv0
Message-ID: <CAHC9VhRMCfahvx89HjSoHfyKR27swLdt2HZuM1enmoi_gxRyRg@mail.gmail.com>
Subject: Re: [PATCH 1/2] security: safesetid: use real GID for GID policy lookup
To: Micah Morton <mortonm@chromium.org>
Cc: "Serge E. Hallyn" <serge@hallyn.com>, tjdqudcks0424@naver.com, 
	linux-security-module@vger.kernel.org, James Morris <jmorris@namei.org>, 
	Thomas Cedeno <thomascedeno@google.com>, Shuah Khan <shuah@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, security@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 4, 2026 at 6:05=E2=80=AFPM Serge E. Hallyn <serge@hallyn.com> w=
rote:
> On Sat, Oct 03, 2026 at 07:34:15PM +0900, tjdqudcks0424@naver.com wrote:
> > From: Sung Byeongchan <tjdqudcks0424@naver.com>
> >
> > SafeSetID policies constrain the ID transitions available to a task for
> > each source ID.  id_permitted_for_cred() always builds that source key
> > from the old real UID, even when it is checking a GID transition.  If t=
he
> > real UID and real GID differ, the policy attached to the real GID is
> > therefore missed and the lookup can return the unconstrained default.
> >
> > On current mainline, a test task with real UID 1000, real GID 2000 and
> > only CAP_SETGID obtained non-allowlisted GID 2002 despite a 2000:2001 G=
ID
> > policy.  The bypass reproduced for setgid(), setegid(), setregid(),
> > setresgid(), setfsgid() and setgroups() across three clean QEMU boots,
> > and enabled access to a synthetic group-protected resource.  This shows
> > a SafeSetID GID policy bypass and group privilege expansion; it does no=
t
> > show direct UID 0 elevation or a universal local privilege escalation.
> >
> > Build the source key from the old real UID for UID policy checks and th=
e
> > old real GID for GID policy checks.  In three fixed-kernel boots, all
> > tested non-allowlisted transitions were blocked while the allowed targe=
t,
> > existing-ID, no-policy and UID-policy controls, and the existing SafeSe=
tID
> > selftest continued to pass.
> >
> > Fixes: 5294bac97e12 ("LSM: SafeSetID: Add GID security policy handling"=
)
> > Cc: stable@vger.kernel.org
> > Assisted-by: OpenAI Codex
> > Signed-off-by: Sung Byeongchan <tjdqudcks0424@naver.com>
>
> Seems obviously correct.  Thanks for the find and the fix.
>
> Reviewed-by: Serge Hallyn <serge@hallyn.com>

Looks good to me too, thanks!

Reviewed-by: Paul Moore <paul@paul-moore.com>

Micah, assuming this looks good to you, are you planning to pick this
up?  If you would like me to take this via the LSM tree, please let me
know.

--=20
paul-moore.com
