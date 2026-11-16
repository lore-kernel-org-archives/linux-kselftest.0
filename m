Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794862194;
	b=IrNLwC1X1F9eRXvp+UKuS08A90ulAf33UVnf9QsSQCrSqr/7eAKMJEWj35m2ML4XFZA7
	 0NNnJITHizf9t3FSeCRQ4r8K4FL80UBmsO+eySv4fxH2UYQAEBEleO9kSVp+tMpMo1m7d
	 T0gp+vtSISBEa+ZO7cRaae0u22gbql2GN6S+wLQpVDpSeLpRXclnd3yCnB8CQlFPB/FVX
	 nXAfenhAUqFhid4gSnb03ixZtCwtRgGvH5ZBXFw2it8i+97kx+70IIQGmE2u33dFwDJ9x
	 1tQRPlbubEJ4p7BSCZRpqZhQxhxMLiQNXkpSwyOCzhnaIWb/qjNmhiISb9IDlA2D4+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xbo2KladFLx7VgxkgYTRkAN9eonT9/CDW2PBbI8A2GY=;
	b=ifzZ4l7SEptTOErJ5xkEDAFdmpW8J3s+taWmj32XOCdaD6RWBjHpg9K1j+pfyAzMeIT3
	 qFpgsPrkFd+Xl/tsouwSvR+RUGKflBSg/m8fQkYiQTqgWP2vKec3HOqqkesKWshfWZC1j
	 1EgnQlu+wnsATdJRPUtEXHPWiv90c0sBnHUKFhMqBFhMjGHqK5vwJmuJ4NTTmJVksPPKn
	 +agn34/aHfJOb2suyk3X2K8czCKnImBOuvrIaMA5EwzqG/6cMCUDFLiQxP7MDZOkmTh18
	 6r2hLEaD2LtJvdoWvhqCrf0qqSCt90BuROY+dLUjoQMvUCA0ftJJiu2nc8G27b7P5LA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bEjcuIiK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB12F606A333
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 20:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB12F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bEjcuIiK
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1ae7fc5681dso117c88.1
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 12:49:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794862193; cv=none;
        d=google.com; s=arc-20260327;
        b=DJySinzSZTLSM0rX4UwWb6tgAIanirTSUfzeg4OyRwp6WNVxB4HcUbBiC5SQ1rkJ8m
         dqmnhyLeO3heWasIYi2X2PomuUX+KYnnzrZLGL4wgMhWeug5gB6oVqkhoXR7o7H6Xzic
         JB71zCfDOlmRI2cSY4Kyij2mz5nAkzK9IK/C8CJzyfnjaAs8oJA+1jAuAnrQUV5noF11
         OC3LZT6XcJa2C1sSa8GHkDg9y+0IvCw4BLI1FfKgDcWsM9JnUCwwNqTSTST/OmpktG/q
         W/f7VqnznLJlzpMxyxR1n4jdVEuylyzLWnzkRHC4T66J9Omdix1fE9HSwpYh7RECRNMQ
         CCzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xbo2KladFLx7VgxkgYTRkAN9eonT9/CDW2PBbI8A2GY=;
        fh=kxGAjSVJ+DxT94jdot/fkEsFEkkahiqXh9a9l8SMNB8=;
        b=A+z1tVmLbNnTUwSPlVd9ywO/QuU/g33hwZSfmhAKJU00AgEQZN+1wddOzr7MvTl+eL
         QelJBQXfBSG6nLIHMGF4sZ5WhlmV3WSm6C1+4adq8ycsZpEJXBZM3pHU16ij1A0cZVS1
         jnmi6ptvLWKdrKfW2/tAxUJe1mvFdFDKZvzCBgFVMr7uQ6VJs0ET1lYgMWRu/r0laiZx
         FWWYIvChoB21JB/WN9/KjNdiv/WD/UaEBOzd3SmcKdUUuRpTDHePxhYirjWQln4zameb
         4Qy97hdJd92JivgS/ql2hhBAMizfGsikZXn+TMZL4lBDmjOBng/KBYBMZ7vRr4L1UXHR
         9OUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794862193; x=1795466993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xbo2KladFLx7VgxkgYTRkAN9eonT9/CDW2PBbI8A2GY=;
        b=bEjcuIiK5ZzslMfTPogaDUFoWAzfW7XSIlgeWB+jQEocpZXi0A2/2ry9JGDzqWrV2C
         Otl+PiA4C4mRc5hokEx9Ps7c5fSKx2ScfDXDfJU1gjF0gzJU8OkE+ssimQcRSnQ0Sa7B
         rd1+f9yQyPhR38YklodVcnYCELRqxyttWQ9nWrVS8Dvdu4Q2MviS0naNBlb+7xI436I7
         xm1bwwLggvurvqBhTifKsHdDDU4yLf5vA1/oL8JC/MkxU/SfE4mkt1ycfr1BmU1aRz49
         mFSFZXKzWkq9N6y3IBU1i7veM3ukdlbhIzawVB38Qmm9r6Bkff1vIaeWBxXEXiYP56S5
         o/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862193; x=1795466993;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xbo2KladFLx7VgxkgYTRkAN9eonT9/CDW2PBbI8A2GY=;
        b=nGYITKi2WKaYawhRjMO9HMa2RUMis63OV5OOfObRT/SVwown7N27tq8I/LxNjslcec
         y8su86S0PhPcshFFBypCUaa0884ehqENOuGDEZUu1V3QiVzljhKg6nzjJkUlnBjHD/jj
         TeSVfnZ4P61SxYuxVrqNve/+2V9yUpPX67KMXina12RdOYskULA6EOwafcUrCLy9Oyho
         3xr6Ca4kiZ/1ypKgreo6dp3SPxpUTnSwaAc2dIHNqvlgDi5JdIXn1/ui5h1f2eke/b47
         ybxNbHj6SUrmLrBxyOjEgwBOP7E153+ZOkkkmUYwL0SqgdgzBUD2YOIgiuRHoF0CMGoV
         1J4w==
X-Forwarded-Encrypted: i=1; AL+hErFKrZgI5NLNoOERn9drf9H/sobrEI8efdRlCbxUTRcR/QgoghKu9XSUcLdh4AVXUYhpYldVE0vF2RwCi+DEF3A=@vger.kernel.org
X-Gm-Message-State: APuU4Z99cjBPbSdkSxRJ8CL6kcT5TmFgFBF//2Qrx6GctBdbj9x+In1Q
	/wlHFx+BUU5xCfnp6ozaaxuYG6Igmu13Mn01s2NfeFP8tyQopc077RqdmsNBvnITR6HTuF/9ycl
	K/sHgFF3n+Tq6fiG0+oDhp1wJBYhj3axT2lJ74w8C
X-Gm-Gg: AYBFou3JX6viOb5fE90n7kBYggooPVbe3YnBLUpxVEHQjmOKstvx8aDC8SAmT4vKSOS
	hynmTBuDpW7YirtcNeo3caRwAbfGUNPTGCSqDQ9mYLJFAT5dWauEdBfn/Cz9fttaVH00TjAaeBa
	p9BoTKjIo27D6O6HtGqQWwMB5OMH5+Fj+m04dMjaS8tIbQb8Nu8+sadtC967JbPXQIMyfY4DP89
	C3vrWEGjWRmF3nZtFHtNClBgoPk/5ugDZRfv5j0ghwns247EyZc8KnSwk+nBdghLQttlxuoNiog
	fRun9kXEGnY6IzSHZdXlgaNDPzorHX0ywFkXDwwZXL93BYygQdNc7ausSqa1xufCiYfKINF6y5p
	5KS/zRJOo1O/5KpkyGDeysSMrc3cqYHhmEKbcvxgp4XIs+SyJIKFaCICA
X-Received: by 2002:a05:701b:4184:20b0:133:12e0:aab7 with SMTP id
 a92af1059eb24-1b53b1c311emr17544c88.11.1794862191699; Mon, 16 Nov 2026
 12:49:51 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115022607.348112-1-almasrymina@google.com> <179477333507.3291.8047663595939414550@kernel.org>
In-Reply-To: <179477333507.3291.8047663595939414550@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 16 Nov 2026 12:49:36 -0800
X-Gm-Features: AclHuK-aQ9C1I6-uUlKXpnPxjBY0WWDeyp9bVBRmMdCUZbStYerQX917Ww7ppsE
Message-ID: <CAHS8izPmV_Ap-L8rykyMpc2acTrhGuU0tT-8bCMUE4e3vQNiBw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 0/6] net: devmem: support leased RX and TX
 queues on netdev unregister
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Weiming Shi <bestswngs@gmail.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 12:08=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrot=
e:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

Ugh, I think I dropped this description somehow. These are follow up
fixes to my earlier series that fixed the device getting revoked for
non-leased devices, where criticality high issues were called out for
leased devices. Not hit in production. It's sashiko code review issues
that are correct from reviewing the code. Not reproduced on real
hardware.

--=20
Thanks,
Mina
