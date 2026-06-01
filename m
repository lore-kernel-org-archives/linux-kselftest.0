Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4B014A8B
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 05:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780292687; cv=pass; b=J78kBBCS1LpS8Cym0LWdSBM97aSyAp4T+H+f62aWhsQgayx7Zzza+2YdyFpmRoB3zgd8TgRzyBVvX5qAgh21R9ZSm6XrPyZ2cWk5rQmOfXDB8fPskHLRYV9yRUerk6wb0EhMaeYHX0bNMRRju/vj4z9cPwTkGzmzLUwUYW1NqL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780292687; c=relaxed/simple;
	bh=3SEfUrGpOB+OrS2N/tF2ctbW+WT/uZ3USk5VMcVSXLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bx7K7sfJxrEDKmxOhWcynYkvDcJmCr6PdpquYxbQl8kAgq09L8wf118UMxN/kwsNbRCrJZhvXFCawr0MD4qXgU5tACrq4EkJp1+jii5Uq9xxpsaMQ67tB2EvlIymYP8jkwGTTEV9iyHzF2JQyzbvokZPVNCzOSu+eY5KAayiKNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eFcOPSmy; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eFcOPSmy"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-516df7b256bso47062841cf.1
        for <linux-kselftest@vger.kernel.org>; Sun, 31 May 2026 22:44:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780292685; cv=none;
        d=google.com; s=arc-20240605;
        b=e2mGtkbXVXUqww0M4a2UI+b+pNIvyg+qwmf4y+2zoXr7/U0NFmaaUufqjb5NGLD2p+
         JzKC0nUo8/x3FuX63TRadoTOM4WfH+GBDrla7uqAItLgQP/BKVTiC7RakhcutIZXsVAu
         WIpKQ5gLwwueM6SFR1h6aL7EmxyQ6OVbofM666NUpJML5WzxYmCfFMJsAU15PttXZyjH
         phpKN5fUgkZaeCC4dGY3IUoxNrrTY5TNrwdyU7bsHQbySUibHctHTOYkKyiTPW+uK5O9
         t+3UDcb0N/XrPTLa5qzAYUVLX9c/0Je2Ro+U0YT7TZo8eTYuRcZulsVSE7f8dhnOvUYA
         1CfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CYJ9us5FFWuw1Ubnqm5Mv6Rgk1trKuije/O9oTp1I54=;
        fh=H67AwAGm63Iv+IjM2PJY+9KyosYEMVeP1Ne4OvlzNNc=;
        b=Zby05e60L67TotuYhFnW4m0zEtOPvxNUp3gMBMsYAUKO7pkjO3uXwrdfu6UK/VdOwT
         vwQjr2q7hzYXTninHh/m2EHOZ7QRjporJQmiMpn8H7lxriGH0ajF8JOWeYwTfZDQ9JhI
         7NG0/bZmlp+PAXbT9F1qwCZu2/H+YyHEgpe0AugOfGkLwLuIV+2LE8qapPxrIf1VykYv
         r/p8krxx5AoGivMlT0bRvhbH6q5Fz9W8uc8wXGq/4M91ucUbjo+f9uHkt/8Vw6ZipETN
         fikgQA4ZB1KtkxmsFxj7zakMgPHZNRz8+WGrVYWJmtfK4K8dVKdzEhX8SpLzOGjHsVQf
         ln8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780292685; x=1780897485; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYJ9us5FFWuw1Ubnqm5Mv6Rgk1trKuije/O9oTp1I54=;
        b=eFcOPSmysNRzKMC/dOMYuTqrR/SkhfUf3KOewI+3rMotMkgegMaWjLmmj7N0Iab4Fo
         cdEoxnqvSeJupxVKd0Wp+ggTpbzz8lIyxUQhcnGTG7dzt8PP3OJGwWzM01wIpCtQt5ST
         e501O7hVBPRYiHXcLP2oQvVdXNfBD9WZ40IKM+c5s9CFiziKQnO+jzB78bOespbTdyEY
         ocsHHaigV7i6t7ihlqzMLoUopjgWfqQjAN1ObeV0pzrKAnl30ZqKwBMWHU06EzTl2Cct
         CBgeGgjAyCfOgLKWbqBhK1CGzunskMda2fgA8yKeRXZkjGz8I0rG7cGJtNIjJQm6xAqY
         qb9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780292685; x=1780897485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CYJ9us5FFWuw1Ubnqm5Mv6Rgk1trKuije/O9oTp1I54=;
        b=nUeE9MbBSH7ozBVYfALGyu8QlDQloW4cLGV3sJn1nYgc2FAYMPSmRfowT9yMo5BEic
         O/0X8FFRqcQZXaDu3RdVj3I4h1yV/ZZtgrBJhQjhlew0TxbBjlTxeQ0EA+jj4TQe1El1
         LCDHNHkK95vYZi6Ah9hXPd2gH76e2H4zhuMJAKxOer36mcx6ZlkKm/kohKXL73PmeMSp
         7Uca5J2IHrEpKdHXfSvEjEB+NIFsJ/1iRIGaw6elmx5buxmUtfIj58PB93j1f7DtA/Ph
         rvFPAVjgd0f/gyeOsIn/OvS7sxUfK0ayrflOEUaJPKA3DvDV4myfzuTSqyJcAk9aO5NJ
         w2Lw==
X-Forwarded-Encrypted: i=1; AFNElJ96NrkZ3rctw97AS7jGxUvWc4L8lmMFV8FM4ph0szLFJm7JAaksH4wm50zuZ7M6e7jsY49UZBQrZDGh8kofHvI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzM/1kIFD8MOyoXMVfzHse8m+snYOYFy2seszc3/7BuKbDjUsiC
	OBeKXB3EJZF56hMI8QBvURu0XzNYJ70QSXE1ymQlg6RLXBwdYsx8TTCUd5gp6hp77qnzUj736rK
	PRgEytJ/Ka4ohaxl3Ya2WewH9MznHZ3aGye7viuTf
X-Gm-Gg: Acq92OGwopVqNPjkUH031X1a9eSYJhuIAIKonEkDMBfTXpEL6wgEVGyrgnVdnTIKNfD
	qfeSkCVRq7bJIqHbo7+xXY6izX6kk8sYSgyBBtmQ9lOmhjB3i6mHYrKcClFDENRLoTXIm04rmak
	za6boQwQu7PKso13+5uYoAIHF0Nljg7zbvEMaH+FvawjaJCLyJE7bK4aIBcBMFBJ+XFWv2j32K9
	pc0LeTf5W2vprC0bnxqiGmCIuXWz5GBjp8yk6lCTwyA20zVDw0kfz23gX/r3pivBDEGkyrHAEKL
	QlTlRRPuArN6XVOl9iP+4I5ZT+dk3VWr79UfSapl0GsyzKQIcml2GQYnPxB9InSjfjn7vz+7ECa
	zsT2+nUmwA+syloTmsW3FyIjCYG6o
X-Received: by 2002:a05:622a:1106:b0:517:5790:ff7b with SMTP id
 d75a77b69052e-51757910b7amr22711931cf.57.1780292684284; Sun, 31 May 2026
 22:44:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601-net-next-mptcp-add-addr6-port-ts-v1-0-4fc25dfef62e@kernel.org>
 <20260601-net-next-mptcp-add-addr6-port-ts-v1-4-4fc25dfef62e@kernel.org>
In-Reply-To: <20260601-net-next-mptcp-add-addr6-port-ts-v1-4-4fc25dfef62e@kernel.org>
From: Eric Dumazet <edumazet@google.com>
Date: Sun, 31 May 2026 22:44:32 -0700
X-Gm-Features: AVHnY4IayHyy6cMDi-nQDDjXrYJHGRD4C69UxZMSkBfLGuSFxlZymzrG3JPQpdU
Message-ID: <CANn89iL=os-60kDKqMDdyiXuPF5CG=eejS0vmthwpDGXz_Bp8A@mail.gmail.com>
Subject: Re: [PATCH net-next 04/11] mptcp: introduce add_addr_v6_port_drop_ts
 sysctl knob
To: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
Cc: Mat Martineau <martineau@kernel.org>, Geliang Tang <geliang@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, mptcp@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 31, 2026 at 10:24=E2=80=AFPM Matthieu Baerts (NGI0)
<matttbe@kernel.org> wrote:
>
> This sysctl is going to be used in the next commits to drop TCP
> timestamps option, to be able to send an ADD_ADDR with a v6 IP address
> and a port number. It is enabled by default.
>
> This knob is explicitly disabled in the MPTCP Join selftest, with the
> "signal addr list progresses after tx drop" subtest, to continue
> verifying the previous behaviour where the ADD_ADDR is not sent due to a
> lack of space.
>
> While at it, move syn_retrans_before_tcp_fallback down from struct
> mptcp_pernet, to avoid creating another 3 bytes hole.
>
> Reviewed-by: Mat Martineau <martineau@kernel.org>
> Signed-off-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>

...

>  };
> @@ -94,6 +95,11 @@ const char *mptcp_get_scheduler(const struct net *net)
>         return mptcp_get_pernet(net)->scheduler;
>  }
>
> +unsigned int mptcp_add_addr_v6_port_drop_ts(const struct net *net)
> +{
> +       return mptcp_get_pernet(net)->add_addr_v6_port_drop_ts;
> +}

Please use READ_ONCE() over sysctls.
This will avoid future patches from KCSAN bots.
