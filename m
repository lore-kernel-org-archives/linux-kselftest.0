Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F36F3EF65B
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 14:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774621467; cv=pass; b=gmItvdE1iO2RU3U2OOeGzvrJBFW68h37tht/Cya7PDsU5x31Qhpic4Wb3cSLfyoo32wF6zMXR8RXhi8EMLPbnVMh7M8vqGgyHjgY10ja5vXl2fRUcmBeSu7S9g66U2/eB1oNkyhg3ethIVwdlOWCvSY87GSdvv0lm7s7Py3qgJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774621467; c=relaxed/simple;
	bh=LhxvMMDKZxiaQ7HwbmGKUwivm/cqrP/i2Fyl2TBtgS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QPECknysNag2HuqxHvC/U4LkmrPZ+86L1Hft+VnN/oCsgsy6nJIlBl9LOb+7K5oqqaPBCZUHqMJwI8so24sJDCD0/bVJq0N1PpPgLndGYjz8bPCOQ1QAegHySvxkWpfK70BXDCmz07tIe3vCnTLi5O5L6EJvyB0X+W2HrAR//+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IaBxidlW; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IaBxidlW"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-486fe655187so25090585e9.2
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 07:24:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774621465; cv=none;
        d=google.com; s=arc-20240605;
        b=E6WZBp1HHCInxTkm+Fd+YUuyRfxd3tM75/vpz8nPL7Y7+rbXxlc/M7kp256VfsgLZN
         o0DC0SPOyKa9j8h4jzax7NM+CpbEgdggJUqmFF5F8sNcpSjmfAHIb/b89y+vPUwMTcJX
         oAomJohy2V5uuILb/Ef6UREFaJtxm0iEwtmhC+WgtwQN9SY/yOF1M7NbcJ4qfq2I1JXY
         q7GN9+/ZgqkPeRiVpsoS/b938Z/H4hc2PGP/QLgNgjbaeHlqOcm/b5txPXNhH3MGPYCZ
         9e1U2xexlod/5R6euiwC/T11CsUHf0+UUq7r/7V4Xc1HXLNFcYsDhsWllpfJYc86rtmp
         mEsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LhxvMMDKZxiaQ7HwbmGKUwivm/cqrP/i2Fyl2TBtgS4=;
        fh=DnkWc1Vrw7gmHFXGH1jY/ovcB4/MMa20M6WWb5i2JVs=;
        b=Pdwp5cJefb+WTVbDpCwdcBD0WseHaxu5YnLAqaNJO9kune+N/3OGCX7dWOZ+s2tr+A
         buhg2FsLpN/NfJl21wot58uXvKMSuE6qCt2688LlMcnogIDyDyqytWDdgGiFu7BZkU8d
         KF+Fagb2jv6UcMG2f/c7MFHVdRGlO9GUg9443bYwuHR/z/+W52svfOa1b/vof93HNCGF
         4Vtjr+1yfRyaqfCCv2I1KZKkZP3SRKWPgX1uAXJ8zmRkyIzNL+uTThx+L9da4Fy3UrMI
         2oc+ajZ9RATAqwa756WJ6c6Z3sUuPzqgwF5dGbEU5xxUlqtTy8WlwWcn50iov9stL8Xs
         DI8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774621465; x=1775226265; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LhxvMMDKZxiaQ7HwbmGKUwivm/cqrP/i2Fyl2TBtgS4=;
        b=IaBxidlWx69kwv8iK3l9+Kjbr04o8EWJW9X8syxZ/noxLiIc44FBHPtIT0B8HzPMda
         fZnozobglMRDxV+7QvbCMjp8ongd/n/8WefJ38egTy3YR6dlK4ms4Sa36r3W5JhKpzII
         7muSRGPxOm5WoIW5oVu1UTjc2sEARnmeDMBytBBRLYuB44XPpTU4F/pcdO8eyIg/1s/K
         Fc8Fr5Mh6956aOppkxaZUzyw5JEe6SWmKJwKPWUPjLf+GuY3KbaxDssDUXlbC+t6KJnt
         sHoucnKyNUxx0fV3rBgZQJr/ZhfMqr6mf7h/mfCZExsSQw5G4iu6hJKAeC+hPzF2mOqi
         lkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774621465; x=1775226265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LhxvMMDKZxiaQ7HwbmGKUwivm/cqrP/i2Fyl2TBtgS4=;
        b=r3sQLhDmm9or6PurWkcdyYc5UZOsP4s2Vbuw6EcSAQu+dmJP4o1KM5pulBiDPLdb4i
         9zlPMyKuQWUG9xB7U5KtANjFyUsDQd6LEIRAyK2B5svyDZ3FKfk98n89cnnCD8HJngX2
         QHqPwPHRLw8PA6EzaC8KuidTncTcou7kgYRa9Ogwpk/gviyoNQIrdKrDLtjGSG3AeUNi
         6knbv4xp5rb3ilDeHH0dD8YPCft6zsjDB8GFXORhzxOLmFbRzpR+QEW6k98HOnBpVWPO
         FiuOBJGcCwSxa9/aPJ3+tZgLlxICangZ2qHxgai+NN2ET+gvUh0Tx0VvaVYp8Dv3HgO1
         BA4w==
X-Forwarded-Encrypted: i=1; AJvYcCVoveLcr6ropQnQ4bMtP/LQfVXrP/x1E00uo0pWnFKjLudvB334sbHtGNqzOeWC4pDNOALytuQrPPCIzUZL9hA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDGFzZS41PBE03bnQbVaV6kZNy99ahH5lD/0jHyz5nGSCSSv9T
	LVpsh5CFRoKT7ox5BTS9Yv7v4fEz3uIhkM+BHnyLgw+imo+aPqX7ACQALXQAlTJ0z03rPndhoIq
	6cqGio2NH6pGVz+/x0oXCjguYvAD/np4=
X-Gm-Gg: ATEYQzzy10Edocsv1lvRa1JzKEgXMffv5vM8eP80F/d6H0mjLM8gd+mlLH0tnnZbpsl
	mNJ2i2zu/l9UrRJRpxvbi9Z+WRDJbekzbw39B6I9o51unZsngSSS2gofwp5PVeB12ldunH9qNRZ
	ES+nG3IqPquTHbR1ol7kWNTkMs0r2g3VHI71vwqH6jzQ2hPBnGOrBCdVftiFY2o8ow/ooNGlCSC
	Q8LhWwqou4TF66Q9myWv2NOsy6p8dDQLRn7RikraMCX11jclQVu0frVrqOu/gJoRtB0Cvx5G0rq
	6Z+r6v/5/jIbAmUyIDC7wGGbiBAPN1yz8PGFVU5VI7FSS+TUvEiHeB+x4mpGCHO/CmWpFziwU2R
	3iAjB45c8xX1YCCrksNA7qhkFGw==
X-Received: by 2002:a05:600c:35c4:b0:485:353f:c651 with SMTP id
 5b1f17b1804b1-48727eb7fcdmr48200445e9.22.1774621464559; Fri, 27 Mar 2026
 07:24:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327141616.1961457-1-hayatake396@gmail.com> <20260327141616.1961457-2-hayatake396@gmail.com>
In-Reply-To: <20260327141616.1961457-2-hayatake396@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 27 Mar 2026 07:24:13 -0700
X-Gm-Features: AQROBzBuTGdhHCpO-FmZyTYgDVXird9EJq-ktWadVz5nIWMbtos_PX5dO5xKvwE
Message-ID: <CAADnVQLh76CWYJCJXgOst43FcJOrPP2Y0wcwGPX71QqmiD+7pA@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf, x86: patch tail-call fentry slot on
 non-IBT JITs
To: Takeru Hayasaka <hayatake396@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, bpf <bpf@vger.kernel.org>, X86 ML <x86@kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 7:16=E2=80=AFAM Takeru Hayasaka <hayatake396@gmail.=
com> wrote:
>
> x86 tail-call fentry patching mirrors CALL text pokes to the tail-call
> landing slot.
>
> The helper that locates that mirrored slot assumes an ENDBR-prefixed
> landing, which works on IBT JITs but fails on non-IBT JITs where the
> landing starts directly with the 5-byte patch slot.

tailcalls are deprecated. We should go the other way and
disable them ibt jit instead.
The less interaction between fentry and tailcall the better.

pw-bot: cr
