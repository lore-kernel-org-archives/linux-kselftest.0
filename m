Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793255322;
	b=AAsr4uCnDoYQaUBeTPOrMy/7dAqvbwE6i/qHTxwbc7Nuf98eG+5cyPnW+Og7JarMFrXc
	 UvC8KY9QkzYt/0hd7o+IeGN0Vsl6IOA7n1XQabmq91g0bq1AkF1x6A7+J6DLiAKha1Lnk
	 wSVP3ioWCYk9HR4wLTIqBri+UbMeW3QJrzi6cPQquFqH1zebe85wyhy6HiQSocxaGXuOt
	 90GcKcggnwP90SsvMj+jVnXbWibyNEihD8CVMYhy1YNllsbl6/ecjnfcPPqmswVmbo+AV
	 82+zefz8zxyJGYyAbnQeKI0Dm/K2VNvvFNqg2xyCbdjlDV9aczG8WLcslTGRl6Oe4VQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793255322;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=1iJxU2srr5LwVZydpcZZOyNys/GEnKfXjQqJD4/acz4=;
	b=k4CB2HUbutEE/hCydZY7NGPCrU2bnsxRk0GuITjlVOnd2n/wyGNEakzJrdmAKuTvnwAk
	 OXc81nD1ICUF3Z5/l60aynbctaS4QprsPH2dCklv38yf/lqXEx/CmEW3PFCyERwHzvuGH
	 0+rihbJus32Pqq4hV9ODFibnyxNfUr8ZRUtskBvNoZm6XAQhnZ3YoPtDwxQVJ7P8weIVh
	 luZtmJL7yzktaft5+yKnftQ+FUgfKX7b/ajdSFHBAwzo2xH5TaaerSRfm0bhXRX+LHWBV
	 zB3l2bj4oFiNztR6Sep+7hb5c4UWoP+sYenZaO3TwN/w3Kkzzk5rORNuKeUX3mHVXvQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L6jo+sjy;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XExwyMTA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F532606A31C
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 06:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F532606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L6jo+sjy;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XExwyMTA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793255321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1iJxU2srr5LwVZydpcZZOyNys/GEnKfXjQqJD4/acz4=;
	b=L6jo+sjyVm/Wj/xZlmojMjR+6Hc3ab+N6k8PE+MmvIIEEhzreiTXY+g/YQL6Gn2Y5RYa8M
	8jmMfHAKmIOuUm7eI2Vgur+wIBQsmKy556KPD2eydgkX8Xk8LPAVQWn7XKi5Jxr2QUvwSn
	sAzD2Osv/x7RaJA6gSCTJg7/XBQ11NE=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-uFVagOceOOWgvZo-NXd2ow-1; Thu, 29 Oct 2026 02:28:34 -0400
X-MC-Unique: uFVagOceOOWgvZo-NXd2ow-1
X-Mimecast-MFC-AGG-ID: uFVagOceOOWgvZo-NXd2ow_1793255313
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-5be4f207adbso876028e87.2
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 23:28:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793255313; cv=none;
        d=google.com; s=arc-20260327;
        b=ZahGZBf6Wn+XZEitYW29h5fE+UMeMb0GXEZhL4Uu2yMzyD8alE8+9Y9F4MDKesbP6t
         lfUuW9CO06iqGulrYiypResLB1WBx10x3tIPA+Q6O68mCX7OtFcZfQm7VqFUh/+JglmD
         ecTN8F8Af6ahULH6RZpM2nXoWlmgZNrDoMLIiHK3qQ5YF0FQM7hgDo8xNyFMdatOQ62y
         /dgQJ7JSq7YL7sWKExTPrmhzaYk6OHCfLf5KZlNHfHUPVl/V1INcTUx0LbyEzFFSKLVT
         /plkhQxw1FUh4G1cC58cYC7258KV6lQUfYqIdo8F2W8ZrDKA2+Jo5O6HdtJabVRjvh5/
         Zp/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1iJxU2srr5LwVZydpcZZOyNys/GEnKfXjQqJD4/acz4=;
        fh=28xMq5EcrrgJnC2lTG7j4NSOuoNEufdGeBjOSU2wIds=;
        b=Adm1MTViKGcHh4SS0/qhsIDe+iJu7ilIFiH7leAN4vHA8LWubRHHgMk4gZ2kuh32NO
         PxHAj34l49DqYnjzb19RLXvZ1u0PnbObQ5Cnm/cywJoNQjgvqkL+xTpDvrFUfwwvH2xD
         XdyglUHFMw7IGXeble/rdoDxM5JCn5GzTmZkgkWdR4VVZJpFBcblwo5dQyRQRi1Zj1sc
         UerKn9p9lsz/ywKd6RtaWZVKfgtVttG3wW0y6oC3m+ZDS9jCwoS8JCe8QA4rfiOVGbk+
         m5J/BxgFXb15R7WAT3o8GOmWbDlBBOxLSFVKQ7eboT4jULCbsBcPYBXD52KpQnXiJtk/
         k+MQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793255313; x=1793860113; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1iJxU2srr5LwVZydpcZZOyNys/GEnKfXjQqJD4/acz4=;
        b=XExwyMTA8DYbGGxcBAgigzAVW0ncFH8daEbWVof1HBicSweDQIU9RlX7anvY7lmysf
         m0XqJHSVZKGmAnYYXH4iR2dDd5VWahEwXyZr+VUM+Ou2Nogratli96r3ctrjc9z5FHZ0
         NHOXhaUs0n2MzhoySUyTY/s64ZpNAPg1v5rIIefRgTxgMk/efdoYlJGN7Qar9S4/fqaJ
         5wno6MaPs3c4ncrTtY/0er52+/EQsiseLH2ydHp+GzJ9Lt6OVSuLhaTjz7VntlrXXtdg
         +7YalFMtHTlECAURj7OwLv/Ht9+9YPk/rSEorxTWmpfO5OIF1ddX8PTUOpgq6I2ebCe7
         oznw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793255313; x=1793860113;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1iJxU2srr5LwVZydpcZZOyNys/GEnKfXjQqJD4/acz4=;
        b=nTMuKjynV23hjBfeWiP0QQZeh0XE4ZUm8gShVHZPxZWEBJ70FcpLdG8UoUmdY1ff4F
         PQ64m17rEsvCslMyq46FyhY+T9n0+F6wTek3MHbnLGfzbHqTFmNa3qKrX6/ulllZ9/Ie
         nSjlY0weT+/GOXjlSSJvlU/poFV8gPFeQEXYSrmJTjMMkOQwMTR80pwiNR3Kf62UAa1R
         CicTS+1WlPHPd/uMNU/+6iOC3CXQ3bDzY7Wv2s4DsXPyGcRxyF56LsAQZvn7/JiDMJZN
         HP71j5qC6OdWg4iW0wHxOm0+xvAHyIkX7s1o5cGk9e6HOlU6TqRXeFbqOzEbXMJh15Mb
         p+uQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmCqd71xL2KKRoot2S/5H7m5vl+LQXoL2MB38lTuaWA1cZUKs/yhqvlVewzkItQTf8D+S7i7XVon2xAsmMCuc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNg/hknpjl2JHYQP3my83YxZMEha3gjiyo5dz3pGiLu3Zy9FAl
	nqaKTh/HbLCiIFi2QjETlc6PpW4uSbusKmdntPtWRDsRmWJrDrLNGMIJBvDpAV1MufuPYXVSarf
	33ODEYTEuE7Xp/TcNdOzyOsw/Es4T984AYnPtF9XLoCMAoQwj/Os/xKnCD+VvsKazkxyfGrdAgl
	5o7M9butPm0KPw+bJrm9CNPhlKazeKStDi4b5e8R+gLtHn
X-Gm-Gg: AYBFou09nPk/Q5eA0gKGasqnb75UG3D8To0odDG6OWt/dy4TbuPhk/trlMRTSsl4PuO
	lXpb920S5S5DN1DJvV6cA8aQ3TyZcrLeZue1C5lobD8QQh4eKgyA8cFXE0in8uwxFWOBlrphMMg
	5OwfUdmi+Lrd9isy3ao35snk9dVZfnpnOiHxgSjwEoTifQb9EF4LkNZbMB
X-Received: by 2002:a05:6512:1318:b0:5b8:f8f9:e080 with SMTP id 2adb3069b0e04-5bfcad432cdmr1771592e87.26.1793255312926;
        Wed, 28 Oct 2026 23:28:32 -0700 (PDT)
X-Received: by 2002:a05:6512:1318:b0:5b8:f8f9:e080 with SMTP id
 2adb3069b0e04-5bfcad432cdmr1771542e87.26.1793255312465; Wed, 28 Oct 2026
 23:28:32 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028191103.623156-1-ihuguet@riseup.net> <20261028191103.623156-3-ihuguet@riseup.net>
 <CAAVpQUC7hezdMEQkzAX4oqFdO_uzBmtRwn85_5_iWf4ExPqpTA@mail.gmail.com>
In-Reply-To: <CAAVpQUC7hezdMEQkzAX4oqFdO_uzBmtRwn85_5_iWf4ExPqpTA@mail.gmail.com>
From: =?UTF-8?B?w43DsWlnbyBIdWd1ZXQ=?= <ihuguet@redhat.com>
Date: Thu, 29 Oct 2026 07:28:21 +0100
X-Gm-Features: AclHuK-x6fsuiHpokXnJ3Qx6-V8BzmKKkHRK86q2oMBiEy9ie31bHyN-v0SCuv4
Message-ID: <CACT4oueJgvE=CKSY2T2jkpD0cjT4bwU+ME4bb=j-cno2q57Kxw@mail.gmail.com>
Subject: Re: [PATCH net v3 2/3] net/ipv6: don't route packets with unknown
 source address
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: =?UTF-8?B?w43DsWlnbyBIdWd1ZXQ=?= <ihuguet@riseup.net>, 
	Alexei Starovoitov <ast@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	David Ahern <dsahern@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eduard Zingerman <eddyz87@gmail.com>, Eric Dumazet <edumazet@kernel.org>, Florian Westphal <fw@strlen.de>, 
	Ido Schimmel <idosch@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Neal Cardwell <ncardwell@google.com>, 
	Pablo Neira Ayuso <pablo@netfilter.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, bpf@vger.kernel.org, 
	Breno Leitao <leitao@debian.org>, coreteam@netfilter.org, 
	Emil Tsalapatis <emil@etsalapatis.com>, Fernando Fernandez Mancera <fmancera@suse.de>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Jeff Layton <jlayton@kernel.org>, 
	Jiri Olsa <jolsa@kernel.org>, Joe Damato <joe@dama.to>, 
	John Fastabend <john.fastabend@gmail.com>, Junseo Lim <zirajs7@gmail.com>, 
	Kees Cook <kees@kernel.org>, Leon Hwang <leon.hwang@linux.dev>, 
	Li RongQing <lirongqing@baidu.com>, linux-kselftest@vger.kernel.org, 
	Martin KaFai Lau <martin.lau@linux.dev>, netdev@vger.kernel.org, 
	netfilter-devel@vger.kernel.org, Phil Sutter <phil@nwl.cc>, 
	Qi Tang <tpluszz77@gmail.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Simon Horman <horms@kernel.org>, Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, 
	Willem de Bruijn <willemb@google.com>, Xuanqiang Luo <luoxuanqiang@kylinos.cn>, 
	Yonghong Song <yonghong.song@linux.dev>, Davide Caratti <dcaratti@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 1:02=E2=80=AFAM Kuniyuki Iwashima <kuniyu@google.co=
m> wrote:
> This changes longstanding user-visible behaviour,
> so the series should target net-next.

You're absolutely right and I already agreed on sending it to
net-next, but sent to net by mistake.

Please review here and I'll send v4 to net-next.


--=20
=C3=8D=C3=B1igo Huguet

