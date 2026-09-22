Received: from mail-oo2-f37.google.com (mail-oo2-f37.google.com [74.125.231.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81FD442396
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 20:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.165
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790110790; cv=pass; b=LjGhksvp/8qFdRKlVPBDHby1WkdcZ97D9RX9KM4G2gAPCRXpzMVO0PGQZEEQGk5RB+PElKClL6Gd7yLAwLxxXMUddrdNkG/hlGr0tvfPC7O/stTUoVUFvUJKW3wTYfYW5f8GjmGzy9neHa2OFlYypqsDsC8Bg8FW9Mg8wXZbhYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790110790; c=relaxed/simple;
	bh=wIRXXuVsUSpgf3xCZFrSJzI8xByKVKMD+dC+JD/lknA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C87lueZ9HMros+BOfGnaKnYGt1zaYc6dRfzjj207T6s2j9nB53zd3tvN/eGREj1Ko/q+kCHJf2ohtT2cI2dVdjtEZz5dxJLQaACBkSCzKwuQspFWiRqYVuj9ZJWV/AiMVeGpZ5gixtq7apVzEYKKLAN0TXAM+QEULTdkRnJ4sxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XQ957hYx; arc=pass smtp.client-ip=74.125.231.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQ957hYx"
Received: by mail-oo2-f37.google.com with SMTP id 006d021491bc7-6b1ae721872so154138eaf.1
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 13:59:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790110774; cv=none;
        d=google.com; s=arc-20260327;
        b=UHtOnpbUCmmLbs9YmOxadMGv8i6MNqZrvALe7IYS1dabApToc6ZWU8B0EzTyaNAPF/
         Kz8ImThSxdzvLqIN46z7DUuj7k2V9UWSFGnMfV3hG7n/1YvP90Juf3MhAgLiXgTzDRd3
         t7CDwCwa6DSPx1CLEsauvUNYORyLrvROm+scC1S05hYtll0swHREYbwRn+svM/8fm6lR
         rhTq9HJSpEfLf1Piawj+hI9LW6VzDCrVTi8ict1N2qMh3+Gwe4DBa/Ws2okymU9pgsY1
         tUJTASJXvs9wfm+wOx2AmP59TyeJHui+jQtkDcxBiYF07x9YeHt6u/CAF9DK1F0xm/sI
         ZWuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=btBRPiBOdcnMWIsPdftA9/JWuQ65VWOKgdruB6cHU6E=;
        fh=ydatAUfTENckUb4HE20q4leHzwsX4qWJdw4TJTxmqcM=;
        b=hexRtoTj6mVD2BRv4yu28kVmgn35CcbufVREmhbAX3At7bWX11JwsCNipzJq8zmC8M
         LifG/7ZUiwocKwf8Q4w/6HBZ9ytXs/zo4copWoqLVDOnSODdhgKpgnTOW+zyOfyA40qy
         9XcBoJP4kQqR+jL6mXVQasQXBj1fNBo3JNexXbiXk5XhXA2gF3mKWw7Yfwx3qndfurvm
         r4mRVf25RZ7yczXJpWOB6+EVtLBXsC0/SLRUSZTNhgKPH3+xWBy5ULVlFw/m+/VqO1Z0
         6kzPTzVVYH1/0r3Dr0G1cdg/WO4xaW5K4TPxyEVMc8u25uHOlgqQvrFfe43XduWX2NcH
         p4YQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790110774; x=1790715574; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=btBRPiBOdcnMWIsPdftA9/JWuQ65VWOKgdruB6cHU6E=;
        b=XQ957hYxO0xTPlSDJ03IKx+MxcfN9kAIo219ZRQnIdxUHeHjn60pEZfNyWpmDD1Qoo
         2SOyxkkyc8URH3VVGoabUl79PMYw3AW2OgD7gGK2gD3Ov9T90wgi/0AgqSvQ+kFeOC65
         H9BaC0QWkuyu+iaCcafG39ntqttCf8NkDsXsvDHs55OM9MRz75ZjJpPJl2TFeDZMPZ1Z
         k3y4f7P+61kq6pn0Cy/RGnhx/PSkJHCaRBg/bR8T+xWUJb6N/Yy1oqoeoFnFdcONj2Fo
         NKnqtBfMJrTmWao4y45iz/7DPlaK2bIQJKrtXExH+N+9yElj39tE9nMNfCsgvWmBQ47W
         jfuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790110774; x=1790715574;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btBRPiBOdcnMWIsPdftA9/JWuQ65VWOKgdruB6cHU6E=;
        b=j2vQhzRowvG+Ltm+++3LTyRV691wQsQn1NRRCfgnzdN0AGYGM8hOE/lu1gKDr7sBQS
         HSrQD/ahSumRSDVHWlSOr9WUp3IRqKWyaIylFESTeam71LbxpznHPPpYQ1WoUxixJ+Z3
         F6LhvcZ+qEsRItbC9WR4TL5l+rwHVFkFNJeuIQW3Gtm6vRoUUmJ6SGlrQ1kFmVQMT2q3
         7Mz1tDsjPX+EjWjjzAB9HeMB+180ok28sRuRFc0+7LvwGQvRaRZtslMcHCHwhhAIlOPE
         93rsy1Y6n6i5yUNeWu3ChV67V6yXTge9R2sjmb2z+VN78pVXMoYQGHrARhSfoC8y1hFG
         8dpg==
X-Forwarded-Encrypted: i=1; AKwUvBzyTMR3nS1tUJJj5nxs6tWn9+bQh3wlaeyYWWyGTKju4AMCZM03eP8z5Xb9wJ36oQvFbq+VyYIw6QyBW6VDYu4=@vger.kernel.org
X-Gm-Message-State: AFuF++mXpqb5u9cIumb6e+LLpNKXw9sQ1vj4y88DZ0WzwEL/Fq7zXPc4
	9fs0LIh/hru48fjidMUXrY0JXcEUKmSsCZWJprFJoIfimUxZKnE1dd6dNJoLuxy2QZpl0SZG2g8
	HEi4er9r9ptH0ZaHi8fqWuqHQ7UU1eCQ=
X-Gm-Gg: AYBFou1OoTTAskLAAeFDUG6fzNClLo32OeHBsmPI6Ln+Ma5obkuWviMSUzCzCKZ+zN1
	/p4heBjjECWK9bbWPdjIu1n3KHcSsgCvPzdoeQoHNxifQJj2RBPYrgbo6/Jxf07fvrdHS7R+Mnh
	9H24ptVAdhWL7+0fHTxxVcxFsRnW+qBsVnLiU5WX/ROaV8RX1IGB9AHgQj8ivJe0Icn9BI/2tOJ
	51e/xIXOsBJ7Y7Z6MNPlymPL5Sv4XaXbTXAzSHa0oXIHYVPWllrvIjXEvBDsgrQeRXmov/zxJTv
	1OY2914NFYWZK+jlIIQs3SDvoDahq1/MgSLc7MoyiayU5SoCdUtGOxReYrlCm1gTgRIVK5OK0oS
	c8UkX/wIGeg==
X-Received: by 2002:a4a:e911:0:b0:6b4:5cfd:f381 with SMTP id
 006d021491bc7-6d2d0836a4cmr577159eaf.25.1790110774153; Tue, 22 Sep 2026
 13:59:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-net-next-mptcp-msg_errqueue-v1-1-dd77e1738248@kernel.org>
 <179001595171.2160803.3670624686905872378@kernel.org> <d6cdbc83-86a6-4c2a-ad99-29cdb83566dd@redhat.com>
In-Reply-To: <d6cdbc83-86a6-4c2a-ad99-29cdb83566dd@redhat.com>
From: David CARLIER <devnexen@gmail.com>
Date: Tue, 22 Sep 2026 21:59:22 +0100
X-Gm-Features: AcwNN1VUII6uOcsfxfr-62vUKq7jiIrNoNXoOzhNQ-DW9bOGJNbIJXNMHXPivns
Message-ID: <CA+XhMqyGNBrd=Kt71gk2M+PC3bZxfPt7ujswBGe3pRAFiuz0PA@mail.gmail.com>
Subject: Re: [PATCH net-next 1/4] mptcp: support MSG_ERRQUEUE on the parent socket
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev-bot+sashiko@kernel.org, matttbe@kernel.org, martineau@kernel.org, 
	geliang@kernel.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	horms@kernel.org, netdev@vger.kernel.org, mptcp@lists.linux.dev, 
	linux-kernel@vger.kernel.org, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 22 Sept 2026 at 14:30, Paolo Abeni <pabeni@redhat.com> wrote:
>
> On 9/21/26 20:39, netdev-bot+sashiko@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential
> > issue(s) to consider.
> >
> > Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 2 =C2=B7 Low: 0
> >
> > If you believe none of the issues are legitimate, please reply to each
> > issue of Medium severity or higher and explain why the AI is wrong.
> > If any of them are legitimate and you plan to respin, please let patchw=
ork
> > know by including "pw-bot: cr" as a separate line at the end of your re=
ply
> > (one such reply per series is enough).
> >
> > - [Medium] The new error-queue splice is dead code for MPTCP-native dat=
a:
> >    its only accepted input (SO_EE_ORIGIN_TIMESTAMPING skbs on a subflow=
=E2=80=A6
> > - [Medium] Forwarded TX timestamps expose per-subflow identifiers inste=
ad
> >    of parent-socket byte-stream identifiers, breaking the=E2=80=A6
> Sashiko comments look relevant to me. Basically this work makes sense
> if proper support for mptcp-level tx timestamping is enabled and the
> and sk_tskey is resolved at the msk level.
>
> I underlook at the above during reviews on the mptcp ML.
>
> IDK if someone is currently working on the missing work/bits.
>
> /P
>

Agreed, nothing arms tx timestamps on the msk today. Let's drop the
series for now.

I can look into it.

pw-bot: cr
